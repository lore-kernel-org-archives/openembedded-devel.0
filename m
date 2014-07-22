Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id D64997064B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 15:26:36 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id u56so9246307wes.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 08:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=NYPXmeE8oeejcu7+/JQWvI4A75q7HQq689LjmrcboIU=;
	b=jFMQCDZ/xa1h5C3/kyn8cIC12osDaEDZoo9eO+15x2cMp/S9duGNrObEHRMx1hQrpx
	9OuXK8RnuQA3Nfjij+yfa9bKcDWHGTbCCFv2B3MTWfNL/niCDhue2uLlp3DOb5pQDEar
	CdLTZxe6LXeDr8aFFfH9hnU/3r6vxlgUirtza3f5UWMmGrNpYE44M/4hZXLFK9niDiBq
	YGf1m8L95gWjCRn/YdeGftYipTZ6XCiRw5mdLQ0a5CZYStzUwLxeuyJ0Mtutg2HqRyfd
	ShImkAvDcjZO91pqYLOSvB0yBNeLnmOY4g43PawR9cuvEnSyR+76qErQi0aMtYBzU4n+
	QHXA==
X-Received: by 10.180.221.108 with SMTP id qd12mr15618307wic.83.1406042797053; 
	Tue, 22 Jul 2014 08:26:37 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ch5sm1733132wjb.18.2014.07.22.08.26.36 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jul 2014 08:26:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Jul 2014 17:26:49 +0200
Message-Id: <1406042809-14261-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.2
Subject: [meta-oe][PATCHv2] snort: add openssl PACKAGECONFIG
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jul 2014 15:26:39 -0000

* otherwise the result isn't deterministic
  WARN: packages/armv5te-oe-linux-gnueabi/snort/snort/latest lost dependency on  libcrypto

* enable it by default, disabling currently doesn't work, because there are --with flags for
  openssl, but then configure.in still checks for sha.h header with
  AC_CHECK_HEADERS([openssl/sha.h],, SHA_H="no")
  and autodetects it, I'll leave patching configure to someone who
  is actually using snort (this issue was reported many times and
  nobody seems to care).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
index b7a5437..9b46380 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
@@ -32,6 +32,12 @@ EXTRA_OECONF = " \
 	--with-dnet-libraries=${STAGING_LIBDIR} \
 	"
 
+# if you want to disable it, you need to patch configure.in first
+# AC_CHECK_HEADERS([openssl/sha.h],, SHA_H="no")
+# is called even with --without-openssl-includes
+PACKAGECONFIG ?= "openssl"
+PACKAGECONFIG[openssl] = "--with-openssl-includes=${STAGING_INCDIR} --with-openssl-libraries=${STAGING_LIBDIR}, --without-openssl-includes --without-openssl-libraries, openssl,"
+
 do_install_append() {
     install -d ${D}/${sysconfdir}/snort/rules
     install -d ${D}/${sysconfdir}/snort/preproc_rules
-- 
2.0.2


