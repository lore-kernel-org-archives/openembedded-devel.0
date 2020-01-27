Return-Path: <andrey.z@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9BD8B7F98F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 23:12:07 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z7so13753182wrl.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 15:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9NzLtqHVpZKyzHbdfUekM6xuNaT3S8KqvmtljYwd/TY=;
	b=PxrLOJeEYuiigN6UfxNi0HWEgO3RazMkxwlNufKS4wEAE9UbIa2z0YI5KQj8g4ATlj
	plQUHl/ZT1Z8AtyVt9mY9gORVXH3AsrORUDoRTWEZMd1stxpje7cBE5jxKt9nWhCqiaf
	YDKnXw8AN2QZiwNQPE3zdDyNkOiSDo9n3YwE01hcVmTLEP9dRlip31BNTpe2s8b9p4A1
	k0mm5iFcgqLyHEUG3iLns1GKEtKiYDPL24Z745UPjFt9xMOLC9cOM5F0AB97jP8Oi5v7
	oOEcC5UFgaPovsaXENZt+doNk9cjCRXSylP6D1vev6CBZyv/bFWvVzP6qg8mcFeQpwqy
	i25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9NzLtqHVpZKyzHbdfUekM6xuNaT3S8KqvmtljYwd/TY=;
	b=cprVAaK3LYR0G/bayQqAmnp6+AaOjPgU8rCb2E5o6BjY9DiOxJDCHEdqJt6FTK2kkw
	AndPCkEsHyMuSugkn1DGnyJMuXE97Zi/Wpp8VxdR7jlb/8hJvQ9SB18iI/tKZexEwwN2
	mO/rM9e2TukzXXER56aCpJget48kMm6dUZRFw+gt+n/KE4X7iscgOMrdJMiCui5YwlWn
	OzbeuXFDE8Uu74THaXJWYefp9OfMQ6eUUzsroQe2uZUd8vqJvRxE581W1fkCTwXQptEH
	hdk3GghVU92jgoZmDeiimigYmSCjVuSnIdWXOYEBqHy9bEcSuk8XWd8YJ4u07ZW4xi2r
	Pq5g==
X-Gm-Message-State: APjAAAUC093v9cbr8LIXWrHid3p4DldrxYZpbVo7tR30vWT3Gfjb5ZS7
	5PreDqRs3eRhZlL3KbTAY+GoNxXuy6I=
X-Google-Smtp-Source: APXvYqx+dW3EjJpf+yhSFkUpQdOwe2oBGPJRp8MeLnJwu/OHs5IMKbz0QruKE4EYrycMZPlTz4qZcw==
X-Received: by 2002:adf:ef0b:: with SMTP id e11mr25752534wro.128.1580166727846;
	Mon, 27 Jan 2020 15:12:07 -0800 (PST)
Received: from lab-linux-pc.tendawifi.com (cable-static2-2-7.rsnweb.ch.
	[146.185.2.7])
	by smtp.gmail.com with ESMTPSA id i16sm429932wmb.36.2020.01.27.15.12.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 15:12:07 -0800 (PST)
From: Andrey Zhizhikin <andrey.z@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Jan 2020 23:11:31 +0000
Message-Id: <20200127231131.26033-1-andrey.z@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] dnssec-conf: delete, moved to meta-python2
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
X-List-Received-Date: Mon, 27 Jan 2020 23:12:07 -0000

dnssec-conf relies heavily on python2 code and was not updated since
2010.

Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
---
 .../packagegroup-meta-networking.bb           |  2 +-
 .../dnssec-conf/dnssec-conf_2.02.bb           | 35 -------------------
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta-networking/recipes-support/dnssec-conf/dnssec-conf_2.02.bb

diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index da2d5a2af..fa9bf2db5 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -112,7 +112,7 @@ RDEPENDS_packagegroup-meta-networking-support = "\
     iftop aoetools tcpslice tcpdump libtalloc memcached nuttcp netcat \
     netcat-openbsd fetchmail yp-tools ypbind-mt yp-tools \
     arptables macchanger nghttp2 strongswan fping \
-    dnssec-conf libesmtp cifs-utils open-isns \
+    libesmtp cifs-utils open-isns \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "libldb", "", d)} \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "non-commercial", "netperf", "", d)} \
     ${@bb.utils.contains_any("TRANSLATED_TARGET_ARCH", "i586 x86-64", "spice", "", d)} \
diff --git a/meta-networking/recipes-support/dnssec-conf/dnssec-conf_2.02.bb b/meta-networking/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
deleted file mode 100644
index ca59bd217..000000000
--- a/meta-networking/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY = "DNSSEC and DLV configuration and priming tool"
-DESCRIPTION = "\
-DNSSEC configuration and priming tool. Keys are required until the root \
-is signed, as well as for local unpublished DNSSEC keys to be preloaded \
-into the recursive nameserver. These DNSSEC configuration files can be \
-directly included in the bind or unbound nameserver configuration files. \
-dnssec-conf includes a commandline configuration client for Bind and \
-Unbound, known DNSSEC keys, URL's to official publication pages of keys, \
-and harvested keys, as well a script to harvest DNSKEY's from DNS. \
-See also: system-config-dnssec"
-HOMEPAGE = "https://github.com/xelerance/dnssec-conf"
-SECTION = "net"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0636e73ff0215e8d672dc4c32c317bb3"
-DEPENDS += "xmlto-native docbook-xml-dtd4-native \
-            docbook-xsl-stylesheets-native libxslt-native"
-
-SRC_URI = "git://github.com/xelerance/dnssec-conf.git"
-SRCREV = "8e799683736b4a7b5e5e78f98fba0a6f48393537"
-
-S = "${WORKDIR}/git"
-
-do_install () {
-    rm -rf ${D}
-    make PREFIX=${prefix} DESTDIR=${D} ETCDIR=${D}${sysconfdir} install
-    # We no longer ship trust anchors. Most of these are in the DLV Registry now.
-    # and it prevents the problem of shipping outdated trust anchors.
-    # For DLV, we ship the ISC DLV Registry key
-    rm -rf ${D}${sysconfdir}/pki/dnssec-keys/harvest/*
-    rm -rf ${D}${sysconfdir}/pki/dnssec-keys/production/reverse/*
-    install -d -m 0755 ${D}${sysconfdir}/sysconfig
-    install -m 0644 packaging/fedora/dnssec.sysconfig ${D}${sysconfdir}/sysconfig/dnssec
-}
-
-RDEPENDS_${PN} = "python"
-- 
2.17.1


