Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 53A7D786B2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Feb 2018 14:23:43 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id 36so19189953wrh.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Feb 2018 06:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4j3fvcQ0qFO1dwgium8MxtyfY/41MC7ekm/BdocAQiE=;
	b=IRFJKR5vrXi9desACEY3+yHWPul4m+SNDCcqhI/yUJAOuuv/P6PMMA1zoaLCR4OxiQ
	QJ8hwIDPCVedXy+C8uIoeRLUqw0vLzlYwvQn8yTzIdNGzUX6oXveOuDvCsvcBH0rzjo2
	gJpQpXtrDtjAH4KWRgbaCJSmwn9IZw9KS7YcbW7eBFdY4EutRwd3qIaRBOJ3v/WIUbHI
	YOvUy4Ge8lt+W+TnBrQG9kwBshBhYxZzscoCfhBqEY8sE7RnZHSdVkqeio31vLY9xtOV
	03Fxz0TcRTWJHovXmRd9vZr/eKJBuVYYCRqzaR0P4O3cgJGimQFe1JsVV9cvInBcERCg
	YYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4j3fvcQ0qFO1dwgium8MxtyfY/41MC7ekm/BdocAQiE=;
	b=b0G8SSw5Faqyn5AVHU/Qr/JGguiBu3XUSO/OlU4RAZNPqf6GJN9e94WwH/zGFNxWp+
	sZAT6Cf2YwATuyQ/LIAZA/3u1wtFVKOUqeiM9gZtzFEhoM/n0D8WVql9i6bgc4MDpKh4
	2blVH/+ilKc2hc8LOQ0GvzyGDOQt21zKCqjysiDz0jJR2u4s1VHMB0hV/FJaisNwYItb
	BO9eJb0IoYHYd5qQqq4TvZ5Yx1+dnwrpBxQAxyWCDA5wdI96ePvHWYuMo8wrUtUL73Fo
	twKbwVmlYLbzv55t8ebH+exjt2q17JSZGIPmnjCSMYbNSYyazval4HMyqErBu1hOXc4A
	qAsw==
X-Gm-Message-State: AKwxyte7YLogI7tH73TdFCp7QKtMBMryD6pYzoxsgv6p+uXEpJveJJdW
	QwP9FqeGeTTaffJYbN0IvZ0kKw==
X-Google-Smtp-Source: AH8x225H6zTZodbvCMTakoprVK+6qkHQf2ROM989CI9lx6b1Hddh7xgOfwt4+7C5/TjAYxsuRIrzeQ==
X-Received: by 10.223.164.23 with SMTP id d23mr14657649wra.72.1517495024892;
	Thu, 01 Feb 2018 06:23:44 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id t141sm60667wmd.34.2018.02.01.06.23.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Feb 2018 06:23:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Feb 2018 14:23:40 +0000
Message-Id: <20180201142340.11083-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180201142340.11083-1-Martin.Jansa@gmail.com>
References: <20180201142340.11083-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] samba, openwsman, pam-ssh-agent-auth, sblim-sfcb, passwdqc, python-pam, smbnetfs: require pam in DISTRO_FEATURES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Feb 2018 14:23:44 -0000

* there is explicit dependency on libpam without respecting pam in DISTRO_FEATURES
  so add the check to prevent people building it against broken libpam

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb | 4 ++++
 meta-networking/recipes-connectivity/samba/samba_4.7.0.bb     | 7 ++++---
 meta-oe/recipes-extended/openwsman/openwsman_2.6.3.bb         | 3 +++
 meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb     | 3 +++
 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb       | 3 +++
 meta-oe/recipes-support/passwdqc/passwdqc_1.3.1.bb            | 3 +++
 meta-python/recipes-devtools/python/python-pam_1.8.2.bb       | 3 +++
 7 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
index 0fcfd6ae75..a0adfec454 100644
--- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
+++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
@@ -11,6 +11,10 @@ HOMEPAGE ="http://sourceforge.net/projects/smbnetfs"
 DEPENDS = "fuse samba"
 DEPENDS_append_libc-musl = " libexecinfo"
 
+# samba depends on libpam
+inherit distro_features_check
+REQUIRED_DISTRO_FEATURES = "pam"
+
 inherit autotools gitpkgv pkgconfig
 
 PKGV = "${GITPKGVTAG}"
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb b/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb
index 686998e5ef..854cb8af5c 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb
@@ -40,9 +40,10 @@ inherit systemd waf-samba cpan-base perlnative update-rc.d
 # remove default added RDEPENDS on perl
 RDEPENDS_${PN}_remove = "perl"
 
-#DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libldb libbsd libaio libpam"
-DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libbsd libaio libpam"
-DEPENDS += "libldb"
+DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libldb libbsd libaio libpam"
+
+inherit distro_features_check
+REQUIRED_DISTRO_FEATURES = "pam"
 
 DEPENDS_append_libc-musl = " libtirpc"
 CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.6.3.bb b/meta-oe/recipes-extended/openwsman/openwsman_2.6.3.bb
index c4778ca38a..f618f02b5d 100644
--- a/meta-oe/recipes-extended/openwsman/openwsman_2.6.3.bb
+++ b/meta-oe/recipes-extended/openwsman/openwsman_2.6.3.bb
@@ -12,6 +12,9 @@ SECTION = "Applications/System"
 
 DEPENDS = "curl libxml2 openssl libpam"
 
+inherit distro_features_check
+REQUIRED_DISTRO_FEATURES = "pam"
+
 SRCREV = "feb7ec9b004fcaea0dbe65ce8a1a79cc29dd994c"
 PV = "2.6.3"
 
diff --git a/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb b/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
index ff88533ff0..1638c41c88 100644
--- a/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
+++ b/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
@@ -13,6 +13,9 @@ SRC_URI[sha256sum] = "3c53d358d6eaed1b211239df017c27c6f9970995d14102ae67bae16d4f
 
 DEPENDS += "libpam openssl"
 
+inherit distro_features_check
+REQUIRED_DISTRO_FEATURES = "pam"
+
 # This gets us ssh-agent, which we are almost certain to want.
 #
 RDEPENDS_${PN} += "openssh-misc"
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
index c6b9f1019b..152ae22902 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
@@ -11,6 +11,9 @@ LICENSE = "EPL-1.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f300afd598546add034364cd0a533261"
 DEPENDS = "curl libpam openssl sblim-sfc-common unzip-native"
 
+inherit distro_features_check
+REQUIRED_DISTRO_FEATURES = "pam"
+
 SRC_URI = "http://downloads.sourceforge.net/sblim/${BP}.tar.bz2 \
            file://sfcb.service \
            file://sblim-sfcb-1.3.9-sfcbrepos-schema-location.patch \
diff --git a/meta-oe/recipes-support/passwdqc/passwdqc_1.3.1.bb b/meta-oe/recipes-support/passwdqc/passwdqc_1.3.1.bb
index 198db3ce72..8fc0b35912 100644
--- a/meta-oe/recipes-support/passwdqc/passwdqc_1.3.1.bb
+++ b/meta-oe/recipes-support/passwdqc/passwdqc_1.3.1.bb
@@ -21,6 +21,9 @@ SECTION = "System Environment/Base"
 
 DEPENDS += "libpam"
 
+inherit distro_features_check
+REQUIRED_DISTRO_FEATURES = "pam"
+
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1b4af6f3d4ee079a38107366e93b334d"
 
diff --git a/meta-python/recipes-devtools/python/python-pam_1.8.2.bb b/meta-python/recipes-devtools/python/python-pam_1.8.2.bb
index 05bddd527b..60a3b43de5 100644
--- a/meta-python/recipes-devtools/python/python-pam_1.8.2.bb
+++ b/meta-python/recipes-devtools/python/python-pam_1.8.2.bb
@@ -10,3 +10,6 @@ PYPI_PACKAGE = "python-pam"
 inherit pypi setuptools
 
 RDEPENDS_${PN} = "libpam"
+
+inherit distro_features_check
+REQUIRED_DISTRO_FEATURES = "pam"
-- 
2.15.1


