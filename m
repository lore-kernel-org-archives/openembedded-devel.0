Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE079C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 11:07:31 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web08.25890.1658142448555897503
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 04:07:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eLlXmEAe;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id mf4so20542087ejc.3
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 04:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ujbOrqpir3ExjJGel+vzNcxyk7hZXtWGrK/M7Ky+1rQ=;
        b=eLlXmEAetYppMlCJ3Jaipixx1s5gXGJmVPQcE/hWBmx41xSbGpkvDDPTJ6eBrMnjyn
         4TDV4QAXK/GQlFYRcWsIIXuN2JNQzV//PpO92ktyfQqKr7p6IuVrPQw0F4hrnGQk2Ac+
         AfMbsMTpfS8jE9ouDPTYTyAURJtKqc3iY0YBVQes9KwQYW93BKjsKJAp6zHC5YOrVa9m
         fhhgzIzsZwsSj513KQkpe0CtkGLG+W6+Z1phWEx6MzWC7MB6snUVOonm3bRmJ6SSiQRU
         oX5Bd+N5k4jkKxVrYcWK1RNwjsdfr+H8z9wGPAXLh2Fz2Jx2uSD9e9++1Gdjgm/J4Un4
         YBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ujbOrqpir3ExjJGel+vzNcxyk7hZXtWGrK/M7Ky+1rQ=;
        b=KgfptHYdhW92TajKPDM3zqx3oTbDwaqGGDeMiQjVgh8nd+mCgTh1WWAHpPFLXwAY17
         1YpISQiksPu01xSquBwSF3Mr1yYxyGAJgdxmT50xy01DLp1iL9g20Uwbi0xsSzYFtWUK
         xRLAUv16032vyIpXY5au7INKaHJ4sM7geB1wahaldk8NlA6+kKynTk+OccQR3EfwNaa2
         P0EVlVwHSbYSF8OGb805oQ1HyMcGwE6ygg0BQOWVCopYGdvFZHup5Gc6GUcx8j2OaaNY
         bGN7GsuPYp7qV9+45FLpe48uOSf06odh1KurUfOMc1iFOpLT+NjVtZirNuNs4a9wzY0U
         iLDw==
X-Gm-Message-State: AJIora8uh0BFqGVKK8VNhhrl1eif5dciocamz6va30vNIeA0Iz1M7iRF
	UFk4yINDSqZz6tZootcrApRLl3tjGr4=
X-Google-Smtp-Source: 
 AGRyM1sVxZFchwHQI04dQRyF1uBEMt7PuhpnXmYhbWoc0rgVkC1J7EK91q+cPiuuzxBEURdiO63cLA==
X-Received: by 2002:a17:906:6a1c:b0:72f:2174:13db with SMTP id
 qw28-20020a1709066a1c00b0072f217413dbmr6456789ejc.687.1658142446879;
        Mon, 18 Jul 2022 04:07:26 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-208.retail.telecomitalia.it. [87.5.19.208])
        by smtp.gmail.com with ESMTPSA id
 ne23-20020a1709077b9700b007263481a43fsm5284153ejc.81.2022.07.18.04.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 04:07:26 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-devel@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [meta-oe][master][kirkstone][PATCH] meta-oe: ignore patched CVEs
Date: Mon, 18 Jul 2022 13:07:06 +0200
Message-Id: <20220718110710.303475-2-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220718110710.303475-1-davide.gardenal@huawei.com>
References: <20220718110710.303475-1-davide.gardenal@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Jul 2022 11:07:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97870

Some old CVEs don't have a vulnerable version range in the NVD database,
this causes come mismatch with cve-check. Ignore many CVEs that are
picked up by the class but are patched in our products.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb | 4 ++++
 meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb         | 4 ++++
 meta-oe/recipes-extended/sanlock/sanlock_3.8.4.bb         | 4 ++++
 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb   | 4 ++++
 meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb      | 4 ++++
 meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb          | 4 ++++
 meta-oe/recipes-support/atop/atop_2.4.0.bb                | 4 ++++
 meta-oe/recipes-support/emacs/emacs_27.2.bb               | 4 ++++
 meta-oe/recipes-support/pidgin/pidgin_2.14.2.bb           | 5 +++++
 10 files changed, 37 insertions(+)

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
index 2fa24b29b..28a3e1e77 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
@@ -11,6 +11,10 @@ SRC_URI = "git://github.com/rakshasa/libtorrent;branch=master;protocol=https \
            "
 SRCREV = "756f70010779927dc0691e1e722ed433d5d295e1"
 
+CVE_CHECK_IGNORE += "\
+    CVE-2009-1760 \
+"
+
 PV = "0.13.8"
 
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
index e9cb7adb8..df90b629a 100644
--- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
@@ -18,6 +18,10 @@ SRC_URI[sha256sum] = "53e15a2b5c1bc80161d42e9f69792a3fa18332b7b771910131004eb520
 
 S = "${WORKDIR}/imap-${PV}"
 
+CVE_CHECK_IGNORE += "\
+    CVE-2005-0198 \
+"
+
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG[pam] = ",,libpam"
 
diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.8.4.bb b/meta-oe/recipes-extended/sanlock/sanlock_3.8.4.bb
index ecbfad394..a59a5c41d 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_3.8.4.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_3.8.4.bb
@@ -21,6 +21,10 @@ SRCREV = "a181e951376d49a82eef17920c8ebedec80b4823"
 
 S = "${WORKDIR}/git"
 
+CVE_CHECK_IGNORE += "\
+    CVE-2012-5638 \
+"
+
 DEPENDS = "libaio util-linux"
 
 inherit setuptools3 useradd
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
index 7e00f150d..4b9ae4758 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
@@ -32,6 +32,10 @@ SRC_URI = "http://downloads.sourceforge.net/sblim/${BP}.tar.bz2 \
 SRC_URI[md5sum] = "28021cdabc73690a94f4f9d57254ce30"
 SRC_URI[sha256sum] = "634a67b2f7ac3b386a79160eb44413d618e33e4e7fc74ae68b0240484af149dd"
 
+CVE_CHECK_IGNORE += "\
+    CVE-2012-3381 \
+"
+
 inherit autotools
 inherit systemd
 
diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb b/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
index aa597cd8e..5666a6229 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
@@ -31,6 +31,10 @@ SRC_URI:append:class-nativesdk = "\
 
 SRC_URI[sha256sum] = "6b16bf990df114195be669773a1dae975dbbffada45e1de2849ddeb5851bb9a8"
 
+CVE_CHECK_IGNORE += "\
+    CVE-2014-9157 \
+"
+
 PACKAGECONFIG ??= "librsvg"
 PACKAGECONFIG[librsvg] = "--with-librsvg,--without-librsvg,librsvg"
 
diff --git a/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb b/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb
index 4c17105a9..b6214d982 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb
@@ -6,6 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a80440d1d8f17d041c71c7271d6e06eb"
 SRC_URI = "git://github.com/jasper-software/jasper.git;protocol=https;branch=master"
 SRCREV = "fe00207dc10db1d7cc6f2757961c5c6bdfd10973"
 
+CVE_CHECK_IGNORE += "\
+    CVE-2015-8751 \
+"
+
 S = "${WORKDIR}/git"
 
 inherit cmake
diff --git a/meta-oe/recipes-support/atop/atop_2.4.0.bb b/meta-oe/recipes-support/atop/atop_2.4.0.bb
index 35540b3b8..b1d2abde7 100644
--- a/meta-oe/recipes-support/atop/atop_2.4.0.bb
+++ b/meta-oe/recipes-support/atop/atop_2.4.0.bb
@@ -24,6 +24,10 @@ SRC_URI = "http://www.atoptool.nl/download/${BP}.tar.gz \
 SRC_URI[md5sum] = "1077da884ed94f2bc3c81ac3ab970436"
 SRC_URI[sha256sum] = "be1c010a77086b7d98376fce96514afcd73c3f20a8d1fe01520899ff69a73d69"
 
+CVE_CHECK_IGNORE += "\
+    CVE-2011-3618 \
+"
+
 do_compile() {
     oe_runmake all
 }
diff --git a/meta-oe/recipes-support/emacs/emacs_27.2.bb b/meta-oe/recipes-support/emacs/emacs_27.2.bb
index b78dc5e45..4a7e7aba5 100644
--- a/meta-oe/recipes-support/emacs/emacs_27.2.bb
+++ b/meta-oe/recipes-support/emacs/emacs_27.2.bb
@@ -11,6 +11,10 @@ SRC_URI:append:class-target = " file://usemake-docfile-native.patch"
 
 SRC_URI[sha256sum] = "b4a7cc4e78e63f378624e0919215b910af5bb2a0afc819fad298272e9f40c1b9"
 
+CVE_CHECK_IGNORE = "\
+    CVE-2007-6109 \
+"
+
 PACKAGECONFIG[gnutls] = "--with-gnutls=yes,--with-gnutls=no,gnutls"
 PACKAGECONFIG[kerberos] = "--with-kerberos=yes,--with-kerberos=no,krb5"
 PACKAGECONFIG[libgmp] = "--with-libgmp=yes,--with-libgmp=no,gmp"
diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.14.2.bb b/meta-oe/recipes-support/pidgin/pidgin_2.14.2.bb
index 14b1aaf01..3d8a45786 100644
--- a/meta-oe/recipes-support/pidgin/pidgin_2.14.2.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin_2.14.2.bb
@@ -15,6 +15,11 @@ SRC_URI = "\
 
 SRC_URI[sha256sum] = "19654ad276b149646371fbdac21bc7620742f2975f7399fed0ffc1a18fbaf603"
 
+CVE_CHECK_IGNORE += "\
+    CVE-2010-1624 \
+    CVE-2011-3594 \
+"
+
 PACKAGECONFIG ??= "gnutls consoleui avahi dbus idn nss \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtk startup-notification', '', d)} \
 "
-- 
2.34.1


