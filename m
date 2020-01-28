Return-Path: <ticotimo@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 312D87F363
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 04:33:49 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id q8so5974154pfh.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 20:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7ApEdySf3NKV5ntxAupfPjK7Yyt6ho/ROuAiWwJEEQY=;
	b=FIY5g7fH2YIZ1U+GepOZF9BRpgWKWUpgW+kVUgRWD4yp1Ze8zWtE/PH0/H72R/enFL
	Gn0TtWrJLvqTdAkPujPkpkwv9zpATiYJJRAJGUfWeVQpsIRJyFiQXP/FUUHVoxmVZVqR
	l7hugk++pFHGPDm+DqA8NL+2CxJhbFBjjc2HiVL9NvQInfvep7GuvHmNlOgWg/AAb1VY
	Nzpl3RBT7DdzyEr1EK3wDsjc2OpzGQ2tbm0E8A/bI0vCuW9q/PI/fA4Yz6LPbhvATgzr
	LWmIBH9NfkbqeNTt0fbdNaHPT0F0rMmEhUeziaEg3V/ff5pXFeKYSgiidwOeyW2Ee0Fo
	YzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7ApEdySf3NKV5ntxAupfPjK7Yyt6ho/ROuAiWwJEEQY=;
	b=BVa4Sj+rID2W3oyfB7XuFZ+70Yak5znE/jFpspLyzrjCidkOpgNtcbLB/7MH3mvv0u
	rRkX+XI2+CtoI0qDGBA9ps3ewVEqXAqCZjH6j2SMPhK8QF2uWluE/TDbZ2NkGZp4bJJX
	qCkoG+2PcKNg24/iDnh/MBMWQ7Sb6ZcGyJmyOQBCXR3DiKGkxHhcPPl+4GlmArAwjzWZ
	M6zBK9mDmEqkaJxA3ALOnrVDMxmTtyQB460B08PaKVX5uEATi3Zbd4PrYg60/QHBmucO
	Y295qRJW9B+8LJFr0wn/BPiOAy30bkeDGjQamgtcKgJo/4qC58sWX94Lvr5h4a6Xx3yy
	cj9A==
X-Gm-Message-State: APjAAAW3wsG6IYGFRy6cNAYpwJsoXm+iLhdHCvO6PvZZssIy4+KzTMpS
	EDZJRJpigYZPMMBfAUBha2tW2V6SupE=
X-Google-Smtp-Source: APXvYqzVRsQodJvqGT/bAYYHXm6ehORP8UijXOFqNI7hAWPsJwxfvmgxFmJHuaV4h/LW3QHtIqTktQ==
X-Received: by 2002:a62:2a07:: with SMTP id q7mr2060817pfq.153.1580186030757; 
	Mon, 27 Jan 2020 20:33:50 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:cc9c:22c5:361e:999a])
	by smtp.gmail.com with ESMTPSA id
	d22sm17204873pfo.187.2020.01.27.20.33.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 20:33:50 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Jan 2020 20:32:58 -0800
Message-Id: <20200128043259.25240-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH 1/2] dnssec-conf: move recipe from meta-networking
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
X-List-Received-Date: Tue, 28 Jan 2020 04:33:50 -0000
Content-Transfer-Encoding: 8bit

From: Andrey Zhizhikin <andrey.z@gmail.com>

dnssec-conf did not receive any updates since 2010 and relies heavily on
python2 code base.

Move recipe to meta-python2 layer, since python2 support has been dropped in
oe-core.

Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../dnssec-conf/dnssec-conf_2.02.bb           | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 recipes-support/dnssec-conf/dnssec-conf_2.02.bb

diff --git a/recipes-support/dnssec-conf/dnssec-conf_2.02.bb b/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
new file mode 100644
index 00000000..ca59bd21
--- /dev/null
+++ b/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
@@ -0,0 +1,35 @@
+SUMMARY = "DNSSEC and DLV configuration and priming tool"
+DESCRIPTION = "\
+DNSSEC configuration and priming tool. Keys are required until the root \
+is signed, as well as for local unpublished DNSSEC keys to be preloaded \
+into the recursive nameserver. These DNSSEC configuration files can be \
+directly included in the bind or unbound nameserver configuration files. \
+dnssec-conf includes a commandline configuration client for Bind and \
+Unbound, known DNSSEC keys, URL's to official publication pages of keys, \
+and harvested keys, as well a script to harvest DNSKEY's from DNS. \
+See also: system-config-dnssec"
+HOMEPAGE = "https://github.com/xelerance/dnssec-conf"
+SECTION = "net"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0636e73ff0215e8d672dc4c32c317bb3"
+DEPENDS += "xmlto-native docbook-xml-dtd4-native \
+            docbook-xsl-stylesheets-native libxslt-native"
+
+SRC_URI = "git://github.com/xelerance/dnssec-conf.git"
+SRCREV = "8e799683736b4a7b5e5e78f98fba0a6f48393537"
+
+S = "${WORKDIR}/git"
+
+do_install () {
+    rm -rf ${D}
+    make PREFIX=${prefix} DESTDIR=${D} ETCDIR=${D}${sysconfdir} install
+    # We no longer ship trust anchors. Most of these are in the DLV Registry now.
+    # and it prevents the problem of shipping outdated trust anchors.
+    # For DLV, we ship the ISC DLV Registry key
+    rm -rf ${D}${sysconfdir}/pki/dnssec-keys/harvest/*
+    rm -rf ${D}${sysconfdir}/pki/dnssec-keys/production/reverse/*
+    install -d -m 0755 ${D}${sysconfdir}/sysconfig
+    install -m 0644 packaging/fedora/dnssec.sysconfig ${D}${sysconfdir}/sysconfig/dnssec
+}
+
+RDEPENDS_${PN} = "python"
-- 
2.25.0


