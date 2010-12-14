Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PSOUY-0008RL-Ml
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Dec 2010 07:36:07 +0100
Received: by pvd12 with SMTP id 12so44984pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Dec 2010 22:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=dpaAaXEIVXi4Ewb3LiX65zfMUlwQXg9Z00foaXdJXFM=;
	b=kTSTWYzwZibrGKphnboUPslcPr7Nt//d9Ag6uqQNgTEVkY8VCIt6HSuu3vveX7ClqI
	uo4O0+f9RoqjJmIZB5zCfjt0KbEZnMpfuLBObgk9dzF+4wX27LR4tGMwau8YX7WdB7Uh
	HmSujAXcZJBawwta+2XcvqWKvqxsmCOlTERf0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=M1nSvwwNjuagA8ADO8QP4kmrFI6sWew9MOnqlcKeZcGZct3EpBEcnGK7yrmBSuD00Y
	5Jj2JnTlXdlIZTjrTABF8g5l8iYaWFFAb5sLQraKwexOPbL+OZPCSS7OiNPQQOf5x0/w
	PdcT3V0IEfpfKDC0lo2EqOQgE9AIBZy8niz7E=
Received: by 10.142.204.15 with SMTP id b15mr4051334wfg.424.1292308468582;
	Mon, 13 Dec 2010 22:34:28 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w14sm9938663wfd.6.2010.12.13.22.34.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 13 Dec 2010 22:34:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Dec 2010 22:34:18 -0800
Message-Id: <1292308458-11710-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] samba_3.2.15.bb: Fix build failure on ARM/thumb due to GCC ICE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Dec 2010 06:36:07 -0000

* As a hotfix we currently avoid compiling it in thumb mode.
  Due to gcc bug http://gcc.gnu.org/bugzilla/show_bug.cgi?id=46934

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/samba/samba_3.2.15.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/recipes/samba/samba_3.2.15.bb b/recipes/samba/samba_3.2.15.bb
index eda95d0..3f535b6 100644
--- a/recipes/samba/samba_3.2.15.bb
+++ b/recipes/samba/samba_3.2.15.bb
@@ -9,7 +9,7 @@ SRC_URI += "file://configure-3.2.8.patch \
 SRC_URI[md5sum] = "5a3bcc4927c9643b9f42970d0815b18f"
 SRC_URI[sha256sum] = "84281fd1faeffee8558e49dff865dd382abbf78bc1be00f8cb5aa70aeea67d46"
 
-PR = "r1"
+PR = "r2"
 
 EXTRA_OECONF += "\
 	SMB_BUILD_CC_NEGATIVE_ENUM_VALUES=yes \
@@ -22,6 +22,11 @@ EXTRA_OECONF += "\
 	samba_cv_HAVE_WRFILE_KEYTAB=yes \
 	"
 
+# for arm we always use ARM instruction set
+# gcc 4.5 ICE's in thumb mode
+# see http://gcc.gnu.org/bugzilla/show_bug.cgi?id=46934
+
+ARM_INSTRUCTION_SET = "arm"
 do_configure() {
 	oe_runconf
 }
-- 
1.7.1



