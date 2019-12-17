Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7B4B37FD72
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Dec 2019 06:56:58 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id b19so1722243wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2019 22:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6tQGjo879uxswS4z1Emrj5d3/mODETBhcUZmkxtqGNY=;
	b=safRWjyFhHUXi9C+Qx6ntb0rNnz3Mn0fcrEW2u6hUX078He4D05qSX4Mir6V6rHiuj
	+HnXyBsNKRcFVt6FUbcFxyVLRT7PiqtJ9PLz3F4VFikcsY0KCrKYxVCZuwFXfq4wFr/4
	j0HIeTaQ4m/D49yNQWlk4Wfg6KQPx71dNwFPdFXoU+SZTXJeIHJ1E72tL7et7bi0dVCq
	ioF1Kl+GBgia8F+xOEANR4Jkp5oLZiJ5+i5QUSdHszGBw6/EkhrE/lKAfN4C/pevEMMh
	09kh+OFKe0mW5HZI9qiG4lvu9u9tRMMcc9k+3jL+kvUDb0nD2GkFc22guTPjD/uxVBBH
	ROhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6tQGjo879uxswS4z1Emrj5d3/mODETBhcUZmkxtqGNY=;
	b=F3I8fNIL+38bqYC7dkTtnYcKBQGBvFCdmDSeJRG5Pnc4M6Q2f0bzU6S1E0eZ0L7efH
	pmNcpnGNpFI4AK6FUScOFAo5xNnSZ1eIpoNeNOV1zdMbkZtJOev7Sxwh6E4jmXihOgZe
	1cazt4gSHDqTgFNnFgn8t8HHfWm5nLnFdJwMd5ldFsxfC15zDyQNPRfkFsx77aHIj1sq
	X5z5g8nB+yrNsCfZMOznNrK5iFGo5VPPr8MDgK7qdwXhi0u2sfsusKw5DPcbuNNQ358+
	eSP2jZk7cwwDKYQ70ulQAPJfGGgk6jE+odib2pdutMXLyO5ER2JGx3K+5uvXKHKVVWd3
	Z+SA==
X-Gm-Message-State: APjAAAUDXbDj/xAAWOArz39sGqDpReDCUdTmXQ6WLZ3eYGilQ1K5Giqo
	9N+st53zgpuBONIrOquj9vRVg7fH
X-Google-Smtp-Source: APXvYqx+DK3rPHbonLAhLcFPxuYOH/UYyEyEX5YEojVVzMLh5Or/bsthMPhZtCcpvO2jVg5vBxgmfg==
X-Received: by 2002:a1c:cc06:: with SMTP id h6mr3334076wmb.118.1576565818812; 
	Mon, 16 Dec 2019 22:56:58 -0800 (PST)
Received: from localhost.localdomain ([213.205.242.13])
	by smtp.gmail.com with ESMTPSA id
	w13sm24547798wru.38.2019.12.16.22.56.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Dec 2019 22:56:58 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Dec 2019 06:56:36 +0000
Message-Id: <20191217065636.127826-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] nftables: Expand PACKAGECONFIG, cleanup build
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
X-List-Received-Date: Tue, 17 Dec 2019 06:56:58 -0000

Fill out PACKAGECONFIG options for json, mini-gmp, readline and xtables
whilst matching existing behaviour. Drop PACKAGECONFIG to weak default.

Fix upstream version matching so the very old 0.099 is rejected as the
newest version.

Drop seemingly redundant ASNEEDED which was added in 5477d5bcb727
("nftables: Upgrade to 0.7") without explanation.

Package python files from libdir not libdir_native; whilst they're the
same thing, building a target package with native variables is odd.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
Requires 906efee42764 ("nftables: upgrade 0.9.2 -> 0.9.3")

 .../recipes-filter/nftables/nftables_0.9.3.bb | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/meta-networking/recipes-filter/nftables/nftables_0.9.3.bb b/meta-networking/recipes-filter/nftables/nftables_0.9.3.bb
index 7302626165cd..dc04326bc926 100644
--- a/meta-networking/recipes-filter/nftables/nftables_0.9.3.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_0.9.3.bb
@@ -3,9 +3,11 @@ SECTION = "net"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d1a78fdd879a263a5e0b42d1fc565e79"
 
-DEPENDS = "libmnl libnftnl readline gmp bison-native"
+DEPENDS = "libmnl libnftnl bison-native \
+           ${@bb.utils.contains('PACKAGECONFIG', 'mini-gmp', '', 'gmp', d)}"
 
-UPSTREAM_CHECK_URI = "https://www.netfilter.org/projects/nftables/files/"
+# Ensure we reject the 0.099 version by matching at least two dots
+UPSTREAM_CHECK_REGEX = "nftables-(?P<pver>\d+(\.\d+){2,}).tar.bz2"
 
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2 \
            file://0001-update-python3-nftables-reference.patch"
@@ -14,16 +16,18 @@ SRC_URI[sha256sum] = "956b915ce2a7aeaff123e49006be7a0690a0964e96c062703181a36e2e
 
 inherit autotools manpages pkgconfig
 
-PACKAGECONFIG ?= "python"
-PACKAGECONFIG[manpages] = ", --disable-man-doc, asciidoc-native"
-PACKAGECONFIG[python] = "--with-python-bin=${PYTHON}, --with-python-bin="", python3"
+PACKAGECONFIG ??= "python readline"
+PACKAGECONFIG[json] = "--with-json, --without-json, jansson"
+PACKAGECONFIG[manpages] = "--enable-man-doc, --disable-man-doc, asciidoc-native"
+PACKAGECONFIG[mini-gmp] = "--with-mini-gmp, --without-mini-gmp"
+PACKAGECONFIG[python] = "--enable-python --with-python-bin=${PYTHON}, --with-python-bin="", python3"
+PACKAGECONFIG[readline] = "--with-cli=readline, --without-cli, readline"
+PACKAGECONFIG[xtables] = "--with-xtables, --without-xtables, iptables"
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '', d)}
 
-ASNEEDED = ""
-
 RRECOMMENDS_${PN} += "kernel-module-nf-tables"
 
 PACKAGES =+ "${PN}-python"
-FILES_${PN}-python = "${libdir_native}/${PYTHON_DIR}"
+FILES_${PN}-python = "${libdir}/${PYTHON_DIR}"
 RDEPENDS_${PN}-python = "python3-core python3-json"
-- 
2.17.1


