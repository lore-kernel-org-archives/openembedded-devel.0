Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 668627C080
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jan 2019 18:36:25 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id r136so9282625pfc.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jan 2019 10:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=JDW48TcFDt2Tvek0N7DtYJIVjmXRWm9OssEbmPE67+o=;
	b=QarPZWNi7rlKEGF7SUETcqEmS3DOtEA9Bv2p83UQlaFXH7Lk2cIg3ox3+RybWVTsb0
	/7cQbtyBfRoMzLNqDR25dplNud0eh+t7jWwxpN8zpIAXXHtDxgFa/iNodFuLugA6OpwI
	ADXRcp4oq9q0WJlRWyzMr1Ls9zAg2KIcOJTJaBKfYnaqQ6ODvlSk4Voi3UWPrrL3VJdK
	LZ2JE+aoXonn0ORDq8gT9uvh4scotgBIQ6csT4Z00N7Ati78Xca1Of8gOsoge5spjgBc
	ecUMBMHn8wUSPJUp3BV37d6FwIgurWWIDfENWsNNZscIaVEuAn3KdPXLkwoLLX71dNEd
	Hh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JDW48TcFDt2Tvek0N7DtYJIVjmXRWm9OssEbmPE67+o=;
	b=E9Jioh9JpOQ/yfH7OEpHrGyhDjq2sS0ntCpqHfZf+CsshWOOksX/QpH1t3lK1nQWjf
	27b5OWBOQjgqEaqAyzIy/Nj0aHrN5Xp+3XeO126nmfCgNovIbvJaqXSb7H4P+80urPPL
	1E0Pa1VTMddf6gUR5PsjX4SgwYMs14uksgIs4PdudT42EIrqFqyxScunq3shEi8IJc+y
	2YmEzl2w2ohjr1bwQaw1a6jRJ28yKUqo6DBB2VIa5kwif3VEQRCGbYQWwmsZ73jwIe3z
	F/hkcpi20076YZJrcppw8/yeY1v/aK9wY43R8YlPCRB1lrhyL2n6cVVSlf4KRnRnqrIX
	XQdQ==
X-Gm-Message-State: AJcUukdnrwEQWaqpfaeYnJ+8AynvYT3qrOzkPtA8s+ZuQds43lFs6g2a
	f+KdSCw1LgXgdUb0yRl6Y8nGFh1EdAs=
X-Google-Smtp-Source: ALg8bN4toD4X/hHTdTMhlxDkqAXvTWwIFgPMl7m3nu14stIGia30PsczhRVpPcRppy5otUX0IhKhtQ==
X-Received: by 2002:a62:8dd9:: with SMTP id p86mr22229626pfk.143.1547404586230;
	Sun, 13 Jan 2019 10:36:26 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::4107])
	by smtp.gmail.com with ESMTPSA id
	b10sm125519877pfj.183.2019.01.13.10.36.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 13 Jan 2019 10:36:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Jan 2019 10:36:16 -0800
Message-Id: <20190113183616.16462-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190113183616.16462-1-raj.khem@gmail.com>
References: <20190113183616.16462-1-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: Stefano Cappa <stefano.cappa.ks89@gmail.com>
Subject: [meta-networking][PATCH 2/2] dhcpcd: upgrade to dhcpcd 7.0.8
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
X-List-Received-Date: Sun, 13 Jan 2019 18:36:26 -0000
Content-Transfer-Encoding: 8bit

From: Stefano Cappa <stefano.cappa.ks89@gmail.com>

Signed-off-by: Stefano Cappa <stefano.cappa.ks89@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{dhcpcd_6.11.5.bb => dhcpcd_7.0.8.bb}     |  8 ++--
 ...e-INCLUDEDIR-to-prevent-build-issues.patch | 45 +++++++++++++++++++
 2 files changed, 50 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/dhcpcd/{dhcpcd_6.11.5.bb => dhcpcd_7.0.8.bb} (70%)
 create mode 100644 meta-networking/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch

diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.11.5.bb b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.0.8.bb
similarity index 70%
rename from meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.11.5.bb
rename to meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.0.8.bb
index 885c6c0e2b..84c3db7a5c 100644
--- a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.11.5.bb
+++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.0.8.bb
@@ -5,12 +5,14 @@ DESCRIPTION = "dhcpcd runs on your machine and silently configures your computer
 HOMEPAGE = "http://roy.marples.name/projects/dhcpcd/"
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://dhcpcd.c;endline=26;md5=77c40d671aff804ca91ea99556da8e9b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1e8f17e4edcccc38152ccf60374e0f89"
 
 SRC_URI = "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "2465624b62c1154f0e89dc69c42c849b"
-SRC_URI[sha256sum] = "6f9674dc7e27e936cc787175404a6171618675ecfb6903ab9887b1b66a87d69e"
+SRC_URI[md5sum] = "77bbb1d73b6f30d6ddcc8b0fd3eae266"
+SRC_URI[sha256sum] = "96968e883369ab4afd11eba9dfd9bb109f5dfff65b2814ce6c432f36362dc9b5"
+
+SRC_URI += "file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch"
 
 inherit autotools-brokensep
 
diff --git a/meta-networking/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch b/meta-networking/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
new file mode 100644
index 0000000000..37d2344438
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
@@ -0,0 +1,45 @@
+From aa9e3982c1e75ad49945a62f5e262279c7a905a4 Mon Sep 17 00:00:00 2001
+From: Stefano Cappa <stefano.cappa.ks89@gmail.com>
+Date: Sun, 13 Jan 2019 01:50:52 +0100
+Subject: [PATCH] remove INCLUDEDIR to prevent build issues
+
+Upstream-Status: Pending
+
+Signed-off-by: Stefano Cappa <stefano.cappa.ks89@gmail.com>
+---
+ configure | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/configure b/configure
+index 6c81e0db..32dea2b4 100755
+--- a/configure
++++ b/configure
+@@ -20,7 +20,6 @@ BUILD=
+ HOST=
+ HOSTCC=
+ TARGET=
+-INCLUDEDIR=
+ DEBUG=
+ FORK=
+ STATIC=
+@@ -72,7 +71,6 @@ for x do
+ 	--mandir) MANDIR=$var;;
+ 	--datadir) DATADIR=$var;;
+ 	--with-ccopts|CFLAGS) CFLAGS=$var;;
+-	-I|--includedir) INCLUDEDIR="$INCLUDEDIR${INCLUDEDIR:+ }-I$var";;
+ 	CC) CC=$var;;
+ 	CPPFLAGS) CPPFLAGS=$var;;
+ 	PKG_CONFIG) PKG_CONFIG=$var;;
+@@ -309,9 +307,6 @@ if [ -n "$CPPFLAGS" ]; then
+ 	echo "CPPFLAGS=" >>$CONFIG_MK
+ 	echo "CPPFLAGS+=	$CPPFLAGS" >>$CONFIG_MK
+ fi
+-if [ -n "$INCLUDEDIR" ]; then
+-	echo "CPPFLAGS+=	$INCLUDEDIR" >>$CONFIG_MK
+-fi
+ if [ -n "$LDFLAGS" ]; then
+ 	echo "LDFLAGS=" >>$CONFIG_MK
+ 	echo "LDFLAGS+=	$LDFLAGS" >>$CONFIG_MK
+-- 
+2.17.2 (Apple Git-113)
+
-- 
2.20.1


