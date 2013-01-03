Received: from mail-la0-f50.google.com ([209.85.215.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TqqAQ-0006Wc-8F
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jan 2013 20:09:49 +0100
Received: by mail-la0-f50.google.com with SMTP id fs13so8494952lab.37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jan 2013 10:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=HdSuPQvSdydxYyQP2SP15xa6YFI18TQEb85JUAVdtbs=;
	b=YaOvHP6iOxDMQxsqBfrgmFl9rqgZzUHrfp8gajoRtzhG7ckhZPgoJisw+cknt0HABY
	hSWOVqbqa2HSeiGmgCsGc/PHeoSzYe80PmInnoI9BJce/xcrWVIUDQH4bpThEHNbbRRi
	Ua05s68XPTqSA8FKb+hVB6LsILxICXTkzTQnLEUM087Mp1o5sAzxH68p6rTSQR7bclw4
	3/AqBXJjrkiCrlcje/KWLjGD71SqaLJHkBZMSeTmbLmDIkR5V3eRPh6DWtihBVfY0ncI
	GYcM4JypvMov+RnKzff85aTazQaoPKXdsOcSzc5YYFYMPKkOSGDdURDoaYC1L3zh2anx
	HkKw==
X-Received: by 10.152.145.8 with SMTP id sq8mr47127876lab.21.1357239262178;
	Thu, 03 Jan 2013 10:54:22 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id bf3sm17259964lbb.16.2013.01.03.10.54.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 10:54:21 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1Tqpvm-0005Ln-62; Thu, 03 Jan 2013 20:54:18 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jan 2013 20:54:13 +0200
Message-Id: <1357239255-20959-2-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357239255-20959-1-git-send-email-cazfi74@gmail.com>
References: <1357239255-20959-1-git-send-email-cazfi74@gmail.com>
Subject: [meta-oe][PATCH 1/3] tslib: replace obsolete automake macros with working ones
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
X-List-Received-Date: Thu, 03 Jan 2013 19:09:51 -0000
X-List-Received-Date: Thu, 03 Jan 2013 19:09:51 -0000

Add obsolete-automake-macros.patch that replaces automake macros
no longer supported by automake-1.13 with modern constructs.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../tslib/tslib/obsolete_automake_macros.patch         |   16 ++++++++++++++++
 meta-oe/recipes-graphics/tslib/tslib_git.bb            |    3 ++-
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/tslib/tslib/obsolete_automake_macros.patch

diff --git a/meta-oe/recipes-graphics/tslib/tslib/obsolete_automake_macros.patch b/meta-oe/recipes-graphics/tslib/tslib/obsolete_automake_macros.patch
new file mode 100644
index 0000000..752077d
--- /dev/null
+++ b/meta-oe/recipes-graphics/tslib/tslib/obsolete_automake_macros.patch
@@ -0,0 +1,16 @@
+Upstream-Status: Submitted [https://github.com/kergoth/tslib/pull/14]
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff --git a/configure.ac b/configure.ac
+index c42be91..6d71be0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -6,7 +6,7 @@ AC_INIT(tslib, 1.0.0, kergoth@handhelds.org)
+ # AC_CONFIG_AUX_DIR(config)
+ AM_INIT_AUTOMAKE(dist-bzip2)
+ AC_CONFIG_SRCDIR([src/ts_close.c])
+-AM_CONFIG_HEADER(config.h)
++AC_CONFIG_HEADERS(config.h)
+
+ PACKAGE_DESCRIPTION="Touchscreen Access Library"
+ AC_SUBST(PACKAGE_DESCRIPTION)
diff --git a/meta-oe/recipes-graphics/tslib/tslib_git.bb b/meta-oe/recipes-graphics/tslib/tslib_git.bb
index 07f8a97..71a63ee 100644
--- a/meta-oe/recipes-graphics/tslib/tslib_git.bb
+++ b/meta-oe/recipes-graphics/tslib/tslib_git.bb
@@ -10,11 +10,12 @@ SECTION = "base"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f30a9716ef3762e3467a2f62bf790f0a"
 
-PR = "r0"
+PR = "r1"
 
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "git://github.com/kergoth/tslib.git;protocol=git \
+           file://obsolete_automake_macros.patch \
            file://ts.conf \
            file://tslib.sh"
 SRCREV = "e17263ef401ee885a27d649b90b577cfb44500e0"
-- 
1.7.10.4



