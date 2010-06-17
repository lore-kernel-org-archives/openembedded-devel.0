Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OPNon-0006dZ-Fj
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Jun 2010 00:44:19 +0200
Received: by pxi3 with SMTP id 3so199321pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jun 2010 15:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=qOjGtASjr7umwX3SPPUOsj7/WnUUIAJMU6qdj4a6C34=;
	b=Dd8/i+9zVyfhEhW1LrPulQWdnER/lqpzZaghXbF/8yf0MsATwMTHfzZeWiKuikNXMa
	xGiUzj49yVdoQiLb1gw/FexjytAtCYEoz1hVPXcbRZO1BZtREjAqm6n4AF8yqLd796fe
	5sGWJ+f2Oyn2yqRGFyZ78/bQTdJcq5dhD/lDw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=btDSejrel8S+0lAFB7jLQk1CIXzGAu+/jImjdPCL8ofeB5KXNYJBFuskAz0ITBzYdt
	KyNNCxLT4A5r0THGh8yDVfSrDaGEULyWDIBGXZvyw/sN9ZSjITlnUvv7g0iejr/ovVkV
	aULlYIe93qX6qHh4HUMeTjU8mjp7AKpt5DjgA=
Received: by 10.143.25.30 with SMTP id c30mr117742wfj.240.1276814385929;
	Thu, 17 Jun 2010 15:39:45 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id c22sm100490110wam.6.2010.06.17.15.39.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 17 Jun 2010 15:39:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Jun 2010 15:39:38 -0700
Message-Id: <1276814379-13161-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1276814379-13161-1-git-send-email-raj.khem@gmail.com>
References: <1276814379-13161-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/3] busybox_1.15.3.bb: Work around the gcc 4.5 ICE on thumb
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
X-List-Received-Date: Thu, 17 Jun 2010 22:44:19 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/busybox/busybox_1.15.3.bb |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/recipes/busybox/busybox_1.15.3.bb b/recipes/busybox/busybox_1.15.3.bb
index 07103e8..6f2e4ec 100644
--- a/recipes/busybox/busybox_1.15.3.bb
+++ b/recipes/busybox/busybox_1.15.3.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 SRC_URI = "\
   http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
@@ -29,6 +29,14 @@ SRC_URI = "\
 SRC_URI[tarball.md5sum] = "6059ac9456de6fb18dc8ee4cd0ec9240"
 SRC_URI[tarball.sha256sum] = "d74020ad2cc5a4dcc5109c44dbd0e22582d6ce42954b0f1ff29763c8c0ff03cb"
 
+# gcc 4.5 has this bug on thumb
+# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=44557
+# so add -fomit-frame-pointer
+# this will be removed once the above bug is fixed.
+
+
+CFLAGS_append = " -fomit-frame-pointer"
+
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX}"
 
 do_configure_prepend () {
-- 
1.7.1



