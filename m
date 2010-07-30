Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OekF4-00049L-Li
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 09:42:55 +0200
Received: by pzk2 with SMTP id 2so435081pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 00:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=9Vd7xQolFy9clr3/VPF9F02Z7gyBhYmgHyM3z1GyQro=;
	b=FRlhQfXm6/19y26lUpsmWS4G49Vu/J0+h9ZK8DyNj08U0Ujz6AkXNppwwBAImqbbzQ
	/En+6RTmvNdzY/PuiVAkv3+qdB27e0/cEFgm5ww8fj4hcXwKCt+MlRF7Kdtggk9CKspZ
	e8SQ8RTemu8+V6HqgolwuSu2NedFojEmTOqCY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=hr7U/7YUitWUGvGhOkOwyk3/jQJ0ltsGJDN8CFXbf6BrM8dk2FYF873Dkv1zTGgBsq
	mBPpVtv+Qs/iCHgY94eUPRG9M05X/6x2tXWC3BQwqww4GM1UMptMQEBtDDVdp67TlUw1
	RL5+3v1UrkODHTZYkbjHYYRGAOfcRIYTAgOqw=
Received: by 10.114.121.10 with SMTP id t10mr1693308wac.161.1280475752380;
	Fri, 30 Jul 2010 00:42:32 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id g4sm3180113wae.2.2010.07.30.00.42.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 30 Jul 2010 00:42:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jul 2010 00:42:26 -0700
Message-Id: <1280475746-15699-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] bitbake.conf, cross.bbclass: Make multi-machine toolchains to co-exist
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
X-List-Received-Date: Fri, 30 Jul 2010 07:42:56 -0000

From: Tom Rini <tom_rini@mentor.com>

the patch Tom sent has line breaks etc. this is same patch formatted for anybody to test

Signed-off-by: Tom Rini <tom_rini@mentor.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/cross.bbclass |    4 ++--
 conf/bitbake.conf     |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/classes/cross.bbclass b/classes/cross.bbclass
index db86192..b3f74a2 100644
--- a/classes/cross.bbclass
+++ b/classes/cross.bbclass
@@ -44,9 +44,9 @@ target_base_libdir := "${base_libdir}"
 target_prefix := "${prefix}"
 
 # Overrides for paths
-prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
+prefix = "${STAGING_DIR_NATIVE}${prefix_native}/${MULTIMACH_TARGET_SYS}"
 base_prefix = "${STAGING_DIR_NATIVE}"
-exec_prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
+exec_prefix = "${STAGING_DIR_NATIVE}${prefix_native}/${MULTIMACH_TARGET_SYS}"
 base_sbindir = "${base_prefix}/bin"
 sbindir = "${exec_prefix}/bin"
 
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index d523519..1b3dd6b 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -299,7 +299,7 @@ STAGING_DIR_JAVA = "${STAGING_DIR}/java"
 STAGING_DIR_NATIVE = "${STAGING_DIR}/${BUILD_SYS}"
 STAGING_BINDIR_NATIVE = "${STAGING_DIR_NATIVE}${bindir_native}"
 STAGING_SBINDIR_NATIVE = "${STAGING_DIR_NATIVE}${sbindir_native}"
-STAGING_BINDIR_CROSS  = "${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS}"
+STAGING_BINDIR_CROSS  = "${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_TARGET_SYS}${base_bindir_native}"
 STAGING_BINDIR_CROSS_BASEPKG = "${STAGING_DIR_NATIVE}${bindir_native}/${BASEPKG_TARGET_SYS}"
 STAGING_LIBDIR_NATIVE = "${STAGING_DIR_NATIVE}${libdir_native}"
 STAGING_INCDIR_NATIVE = "${STAGING_DIR_NATIVE}${includedir_native}"
-- 
1.7.1



