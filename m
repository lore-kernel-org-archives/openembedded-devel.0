Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id D4B4C7FA41
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 00:35:31 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id q8so14914569pfh.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 16:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=HGM3hQJgmNdBsoHnUrCwVpV8lpPwl0B3S/QQii185rI=;
	b=qclTeaFZVQhphGMiURX+NS9stHljUSirhz4q1j8WeCLr3QlGkGfSomIPKhFBOwzyTp
	4eXC8J6BT3xka+8Nm+IG0xBf47pahzAdtFVCBTsHrSkcIstHzvcB4UE+35tHMOYGUvuP
	p03fvmz+raDjPrG9Gg34BerPL0IthwjhG++oN1whnEhrNa2LYlt2KasALeD8Wcph38O4
	UfvCKTAIjqEyczfc8l0cNuGMMTXYBgnF1U5p/T5a0c3isutjSfv8KWvka+HH2RcNOjMf
	8Kr2bUgG5gMbP0EXVN+4RSuSW9AoilBz1RtXrtLIWIsYecGwFVIezxbT+mH7xYBzQZFA
	gNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HGM3hQJgmNdBsoHnUrCwVpV8lpPwl0B3S/QQii185rI=;
	b=Dz5dQXy3s2ag75Z0E912pQQ7PxbL5L9GmMp6G+hOMGHqhecjOuZYjLP51nyRmmdaQp
	BD3m9HjA38uw2jOU72cWE7HwQhLhI89UbJ7+cprIOqy624RzBMZ7c9ch1nb5vqBb+ccF
	pPsfruUWh1dwfu7AMeiE9YDXvS8S7uQjAcE0pqknDp4XX0h5UGFL6kR8FtrMeOBB5680
	aOwADT1HQ422RL6RDwVuEF0Z8x4Y19rci9cFdb9NvdI9TC/B2naCv4/UI71PqyLFcSaC
	KeEO5qZjmhjljR6a5zBQz00Pd117nbOO9IV/69FBE7qTY+E6po2sXDxLW7FrrFUwpqlz
	K0GQ==
X-Gm-Message-State: APjAAAXv15eeZWmA8oT++a+Q6Divb6sJ7jzHpxqVhHApVRD0C5vXPu3/
	sgdCVJXrYk5NwoL0ax73U0djP4u9GOo=
X-Google-Smtp-Source: APXvYqyGr92CXEbayR1FggnkTfC8ThdMRtMZLByHHjOy2Fro5XuwGDDm4WyQ+T5kV3nLc4WHr+e1YQ==
X-Received: by 2002:a63:e4f:: with SMTP id 15mr54973571pgo.398.1579480532328; 
	Sun, 19 Jan 2020 16:35:32 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	z11sm37881115pfk.96.2020.01.19.16.35.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 16:35:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Jan 2020 16:35:25 -0800
Message-Id: <20200120003527.1518697-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200120003527.1518697-1-raj.khem@gmail.com>
References: <20200120003527.1518697-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] meta-networking: Remove using python2
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
X-List-Received-Date: Mon, 20 Jan 2020 00:35:31 -0000
Content-Transfer-Encoding: 8bit

This change makes the parsing go though, we still might have build
issues, which will be reported in world builds seprately

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/crda/crda_3.18.bb      | 2 +-
 .../recipes-connectivity/freeradius/freeradius_3.0.19.bb    | 4 ++--
 .../python-networkmanager/python-networkmanager_2.1.bb      | 4 ++--
 meta-networking/recipes-connectivity/ufw/ufw_0.33.bb        | 6 +++---
 .../recipes-devtools/python/python-ldap_3.2.0.bb            | 2 +-
 .../recipes-support/fetchmail/fetchmail_6.4.1.bb            | 2 +-
 .../recipes-support/lowpan-tools/lowpan-tools_git.bb        | 2 +-
 meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb   | 2 +-
 meta-networking/recipes-support/ntop/ntop_5.0.1.bb          | 2 +-
 meta-networking/recipes-support/openipmi/openipmi_2.0.27.bb | 2 +-
 meta-networking/recipes-support/spice/spice_git.bb          | 2 +-
 11 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta-networking/recipes-connectivity/crda/crda_3.18.bb b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
index 7c925b2529..d3c00424db 100644
--- a/meta-networking/recipes-connectivity/crda/crda_3.18.bb
+++ b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
@@ -18,7 +18,7 @@ SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz \
 SRC_URI[md5sum] = "0431fef3067bf503dfb464069f06163a"
 SRC_URI[sha256sum] = "43fcb9679f8b75ed87ad10944a506292def13e4afb194afa7aa921b01e8ecdbf"
 
-inherit python-dir pythonnative siteinfo
+inherit python3-dir python3native siteinfo
 
 # Recursive make problem
 EXTRA_OEMAKE = "MAKEFLAGS= DESTDIR=${D} LIBDIR=${libdir}/crda LDLIBREG='-Wl,-rpath,${libdir}/crda -lreg' \
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.19.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.19.bb
index 31e6978d6f..8887433062 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.19.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.19.bb
@@ -96,9 +96,9 @@ PACKAGECONFIG[rlm-eap-pwd] = "--with-rlm_eap_pwd, --without-rlm_eap_pwd"
 inherit useradd autotools-brokensep update-rc.d systemd
 
 # This is not a cpan or python based package, but it needs some definitions
-# from cpan-base and python-dir bbclasses for building rlm_perl and rlm_python
+# from cpan-base and python3-dir bbclasses for building rlm_perl and rlm_python
 # correctly.
-inherit cpan-base python-dir
+inherit cpan-base python3-dir
 
 # The modules subdirs also need to be processed by autoreconf. Use autogen.sh
 # in order to handle the subdirs correctly.
diff --git a/meta-networking/recipes-connectivity/python-networkmanager/python-networkmanager_2.1.bb b/meta-networking/recipes-connectivity/python-networkmanager/python-networkmanager_2.1.bb
index 3aa41f1add..91a6edd241 100644
--- a/meta-networking/recipes-connectivity/python-networkmanager/python-networkmanager_2.1.bb
+++ b/meta-networking/recipes-connectivity/python-networkmanager/python-networkmanager_2.1.bb
@@ -8,6 +8,6 @@ SRC_URI[md5sum] = "f638d854a3639fb37c0e06d1092a771e"
 SRC_URI[sha256sum] = "aef1e34d98d7bec7cc368e0ca0f2e97493f9b5ebe6d7103f8f6460cfca3dc6fc"
 
 PYPI_PACKAGE = "python-networkmanager"
-inherit pypi setuptools
+inherit pypi setuptools3
 
-RDEPENDS_${PN} = "networkmanager python-dbus python-six"
+RDEPENDS_${PN} = "networkmanager python3-dbus python3-six"
diff --git a/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb b/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
index 6ff103c770..d620e88eb4 100644
--- a/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
+++ b/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
@@ -20,12 +20,12 @@ SRC_URI = " \
 SRC_URI[md5sum] = "3747b453d76709e5a99da209fc0bb5f5"
 SRC_URI[sha256sum] = "5f85a8084ad3539b547bec097286948233188c971f498890316dec170bdd1da8"
 
-inherit setuptools features_check
+inherit setuptools3 features_check
 
 RDEPENDS_${PN} = " \
                   iptables \
-                  python \
-                  python-modules \
+                  python3 \
+                  python3-modules \
                  "
 
 RRECOMMENDS_${PN} = " \
diff --git a/meta-networking/recipes-devtools/python/python-ldap_3.2.0.bb b/meta-networking/recipes-devtools/python/python-ldap_3.2.0.bb
index af8961e322..2ad70ace4a 100644
--- a/meta-networking/recipes-devtools/python/python-ldap_3.2.0.bb
+++ b/meta-networking/recipes-devtools/python/python-ldap_3.2.0.bb
@@ -12,7 +12,7 @@ HOMEPAGE = "http://www.python-ldap.org/"
 DEPENDS = "python openldap cyrus-sasl"
 
 PYPI_PACKAGE = "python-ldap"
-inherit pypi setuptools
+inherit pypi setuptools3
 
 LIC_FILES_CHKSUM = "file://LICENCE;md5=36ce9d726d0321b73c1521704d07db1b"
 SRC_URI[md5sum] = "fe22522208dc9b06d16eb70f8553eaab"
diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.1.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.1.bb
index 21caa918a6..0faf196482 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.1.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.1.bb
@@ -12,7 +12,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz \
 SRC_URI[md5sum] = "c2b836a919cdd4ec53b06b70e0aa3e63"
 SRC_URI[sha256sum] = "3f33f11dd08c3e8cc3e9d18eec686b1626d4818f4d5a72791507bbc4dce6a9a0"
 
-inherit autotools gettext python-dir pythonnative
+inherit autotools gettext python3-dir python3native
 
 EXTRA_OECONF = "--with-ssl=${STAGING_DIR_HOST}${prefix}"
 
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
index 585968f836..5917cfb3e1 100644
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
@@ -21,7 +21,7 @@ SRCREV = "1c2d8674cc6f4b1166a066e8822e295c105ae7a2"
 
 S = "${WORKDIR}/git"
 
-inherit autotools python-dir pkgconfig
+inherit autotools python3-dir pkgconfig
 
 CACHED_CONFIGUREVARS += "am_cv_python_pythondir=${PYTHON_SITEPACKAGES_DIR}/lowpan-tools"
 
diff --git a/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb b/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb
index f37e9b7463..9ed8c56420 100644
--- a/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb
+++ b/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb
@@ -14,7 +14,7 @@ SRC_URI = "\
 SRC_URI[md5sum] = "8d1a6b96760254e4dd142d7176e8fb7c"
 SRC_URI[sha256sum] = "09fc43d428ff237138733c737b29fb1a7e49d49de06d2edbed3bc4cdcee69073"
 
-inherit cmake manpages pythonnative
+inherit cmake manpages python3native
 PACKAGECONFIG[manpages] = ""
 
 # examples are never installed, and don't need to be built in the
diff --git a/meta-networking/recipes-support/ntop/ntop_5.0.1.bb b/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
index 80f009b7c3..6f09937ed0 100644
--- a/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
+++ b/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
@@ -25,7 +25,7 @@ SRC_URI[sha256sum] = "7e8e84cb14d2173beaca4d4cb991a14d84a4bef84ec37b2276bc363f45
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/ntop/files/ntop/Stable"
 
-inherit autotools-brokensep useradd pythonnative pkgconfig systemd
+inherit autotools-brokensep useradd python3native pkgconfig systemd
 
 DEPENDS = "geoip rrdtool python zlib libpcap gdbm"
 
diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.27.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.27.bb
index f092780399..3f3cc20734 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.27.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.27.bb
@@ -39,7 +39,7 @@ S = "${WORKDIR}/OpenIPMI-${PV}"
 SRC_URI[md5sum] = "d525ceaa07df5440674e7e68a6772fe7"
 SRC_URI[sha256sum] = "f3b1fafaaec2e2bac32fec5a86941ad8b8cb64543470bd6d819d7b166713d20b"
 
-inherit autotools-brokensep pkgconfig pythonnative perlnative update-rc.d systemd cpan-base
+inherit autotools-brokensep pkgconfig python3native perlnative update-rc.d systemd cpan-base
 
 EXTRA_OECONF = "--disable-static \
                 --with-perl='${STAGING_BINDIR_NATIVE}/perl-native/perl' \
diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index 06a79c5001..ebf4d576e5 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -29,7 +29,7 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-inherit autotools gettext pythonnative python-dir pkgconfig
+inherit autotools gettext python3native python3-dir pkgconfig
 
 DEPENDS += "spice-protocol jpeg pixman alsa-lib glib-2.0 python-pyparsing-native python-six-native glib-2.0-native"
 DEPENDS_append_class-nativesdk = "nativesdk-openssl"
-- 
2.25.0


