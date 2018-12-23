Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 22B7F6C50E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 21:36:17 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id z11so4878324pgu.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 13:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kp5bbIJlv929F6wqlj5k+DJ9plAmMmj2TPbXrjWTRmU=;
	b=Y2xMU8Ic89o+vDtFupp7Xzcve4Vhr82cnyBz7Mt6bX7vi1w7qe78osEaA51kFtxWwf
	VnBognThr33klWSJnwbBcUtD+OClIP+ZL38KWSgcR2pT2ojXqDNyxJgUYxTH6DHishf4
	6a1Fq2Zx+ql76QwyX8CUGDJlghVZHitkaMMeHfeG+i1gyBTU/4lXoXc5Kmk8DAumAllE
	ozNCTvQ6QTkYG74f/FcBreyBeDy7vBbF9wslff/rdKp3xN8plNK0VWFz8ethGCSCDmuz
	GfRrpRzBkBiq9zhmozNa15+q56WoSWNeQQW4PaGvOGOLssmvpKSb+FIEK+gAMXD7EWBm
	kAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kp5bbIJlv929F6wqlj5k+DJ9plAmMmj2TPbXrjWTRmU=;
	b=tQBtgPggkeWe84XhE1/lGTbDfdDjjNYqGsCn9yWVhhG8K/yQDzevDMqNopaHRYNTX5
	BV980G7R6W9iHXWAsj4O59zG5hk6HRgIj22i9g8zeEoxp1kr5qfOO9L0CyeK2GFkMDqZ
	WVvForjU5mHxbGvanaxpNrMcIUfgwM4DrEULxE2qQrEktsKhyNkfonaoeggMHuOoh6GS
	qC+ozcMFS4XabYVykXCWLFc0QL3iqxvtxZuYJSEKL846R/MgjGB2YSyWswtn+iBaKQJc
	RwMwbx5sqmkw5kPV8FVUxbPCGEi21/Zo7zI9w+MhY/9fFSVit2joXxw3MenpC+w80rF7
	x3qw==
X-Gm-Message-State: AJcUukcOGGfkXEghFKi5LjPQZYigGH3S41F8KCiZcSdXrJeRJK/oVkgO
	cigJI8mdOnpsZ2usqBXZ00K8wy4SevI=
X-Google-Smtp-Source: ALg8bN4KOWM0P329Gtol6NYVJsER/eCENqvX/SQksj5+t2qipphatR6keAWD/97apGUflNWv8D7IBA==
X-Received: by 2002:a63:6a05:: with SMTP id f5mr10148262pgc.72.1545600978781; 
	Sun, 23 Dec 2018 13:36:18 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	m9sm33340800pgd.32.2018.12.23.13.36.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Dec 2018 13:36:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2018 13:35:49 -0800
Message-Id: <20181223213557.7834-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181223213557.7834-1-raj.khem@gmail.com>
References: <20181223213557.7834-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 10/18] miniupnpd: Fix cross compile on OE
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
X-List-Received-Date: Sun, 23 Dec 2018 21:36:18 -0000
Content-Transfer-Encoding: 8bit

genconfig script can be specified OS specs
if its not then it pokes at the build system
via uname, we add code for OE support to ensure
we pass DISTRO_VERSION as OS_VERSION

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Add-OpenEmbedded-cross-compile-case.patch | 40 +++++++++++++++++++
 .../miniupnpd/miniupnpd_2.1.20180706.bb       |  8 +++-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-connectivity/miniupnpd/files/0001-Add-OpenEmbedded-cross-compile-case.patch

diff --git a/meta-networking/recipes-connectivity/miniupnpd/files/0001-Add-OpenEmbedded-cross-compile-case.patch b/meta-networking/recipes-connectivity/miniupnpd/files/0001-Add-OpenEmbedded-cross-compile-case.patch
new file mode 100644
index 0000000000..cd4291d91b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/miniupnpd/files/0001-Add-OpenEmbedded-cross-compile-case.patch
@@ -0,0 +1,40 @@
+From 54698856e5602bbd9d61e855814c854a013b4840 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 22 Dec 2018 18:47:45 -0800
+Subject: [PATCH] Add OpenEmbedded cross compile case
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ genconfig.sh | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/genconfig.sh b/genconfig.sh
+index dc42462..59922e9 100755
+--- a/genconfig.sh
++++ b/genconfig.sh
+@@ -98,6 +98,12 @@ if [ -f ../shared/tomato_version ]; then
+ 	OS_VERSION="Tomato $TOMATO_VER"
+ fi
+ 
++# OpenEmbedded special case
++if [ -f ./os.openembedded ]; then
++	OS_NAME=OpenEmbedded
++	OS_VERSION=$(cat ./os.openembedded)
++fi
++
+ ${RM} ${CONFIGFILE}
+ 
+ echo "/* MiniUPnP Project" >> ${CONFIGFILE}
+@@ -318,6 +324,11 @@ case $OS_NAME in
+ 		echo "#define USE_IFACEWATCHER 1" >> ${CONFIGFILE}
+ 		FW=netfilter
+ 		;;
++	OpenEmbedded)
++		OS_URL=http://www.openembedded.org/
++		echo "#define USE_IFACEWATCHER 1" >> ${CONFIGFILE}
++		FW=netfilter
++		;;
+ 	AstLinux)
+ 		OS_URL=http://www.astlinux.org/
+ 		echo "#define USE_IFACEWATCHER 1" >> ${CONFIGFILE}
diff --git a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20180706.bb b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20180706.bb
index d5d9bcf64a..ff40daaac9 100644
--- a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20180706.bb
+++ b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20180706.bb
@@ -12,12 +12,18 @@ inherit autotools gettext pkgconfig systemd
 DEPENDS += "iptables net-tools util-linux libmnl libnetfilter-conntrack"
 
 SRC_URI = "http://miniupnp.tuxfamily.org/files/download.php?file=${P}.tar.gz;downloadfilename=${P}.tar.gz \
-           file://miniupnpd.service"
+           file://miniupnpd.service \
+           file://0001-Add-OpenEmbedded-cross-compile-case.patch \
+           "
 SRC_URI[md5sum] = "a84b3647c871802abeccfc2771e8db21"
 SRC_URI[sha256sum] = "fc2d2fd044d8c3f8d02b63d70489bb35ece836a4fc1b6386865ac8fbe8d8b006"
 
 IPV6 = "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '--ipv6', '', d)}"
 
+do_configure_prepend() {
+   echo "${@d.getVar('DISTRO_VERSION')}" > ${S}/os.openembedded
+}
+
 do_compile() {
     cd ${S}
     CONFIG_OPTIONS="${IPV6} --leasefile --vendorcfg" oe_runmake -f Makefile.linux
-- 
2.20.1


