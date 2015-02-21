Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7792D73693
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Feb 2015 09:52:50 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id h11so7580340wiw.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Feb 2015 01:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rJbKTiy6aKjJuYEsNKNanPY7zwLpadMP0QiBU3qp0GI=;
	b=FkvGaVk523lDU5/iVP0nAKvd8dD/SNyuyVnq56CQzgYEwe2KgQyfySkpMvMYba3LcB
	zEq+lWuW7SPvC3r8nfEeLyRtIHvupXJV/WIMvobbQesH3eeznshE1r+kcuzXVlxQc3hh
	O/qE3mIpCn9dTzBCrAa/lVKCRJbKbzVaOiwWhHFd12B0V/7GVJOesIKvZ2fGW/BMUQs3
	7XqLb3g6oQX99+8hj7ZCQpZJbq31vPXeCxWF87KhgrB8AhxQqdUUDe5ENvF1q7ElyPP+
	Zv0jrDU9fCT+jM5EP4pIMtO+LmenSkNehb7q15VF2UAonIgYXGb1VAlgv289lJR+M3sG
	oILQ==
X-Received: by 10.194.158.39 with SMTP id wr7mr3433188wjb.118.1424512371609;
	Sat, 21 Feb 2015 01:52:51 -0800 (PST)
Received: from localhost.localdomain (ip-84-119-96-251.unity-media.net.
	[84.119.96.251])
	by mx.google.com with ESMTPSA id dm6sm6232120wib.22.2015.02.21.01.52.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Feb 2015 01:52:50 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Feb 2015 10:52:10 +0100
Message-Id: <1424512336-47007-3-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1424512336-47007-1-git-send-email-sven.ebenfeld@gmail.com>
References: <1424512336-47007-1-git-send-email-sven.ebenfeld@gmail.com>
Subject: [meta-oe][PATCH 2/7] crda: Fix SRC_URI
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
X-List-Received-Date: Sat, 21 Feb 2015 09:52:53 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 meta-networking/recipes-connectivity/crda/crda_1.1.3.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb b/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
index 0bb8998..5b86058 100644
--- a/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
+++ b/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
@@ -7,13 +7,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 DEPENDS = "python-m2crypto-native python-native libgcrypt libnl"
 
-SRC_URI = "http://wireless.kernel.org/download/crda/${BP}.tar.bz2;name=crda \
-           http://wireless.kernel.org/download/wireless-regdb/regulatory.bins/2013.01.11-regulatory.bin;name=bin \
+SRC_URI = "https://www.kernel.org/pub/software/network/${PN}/${BP}.tar.bz2;name=crda \
+           https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2013.01.11.tar.bz2;name=bin \
 "
 SRC_URI[crda.md5sum] = "29579185e06a75675507527243d28e5c"
 SRC_URI[crda.sha256sum] = "aa8a7fe92f0765986c421a5b6768a185375ac210393df0605ee132f6754825f0"
-SRC_URI[bin.md5sum] = "e0c8a5ca63fb8bf803213f9a0c90b50b"
-SRC_URI[bin.sha256sum] = "b1ee0b20c123c612dfdb6851ab42c01666f66fb583e0e590942f19bb54cf84be"
+SRC_URI[bin.md5sum] = "f137585abd5e07454932ea555b826149"
+SRC_URI[bin.sha256sum] = "6eb469555eb547b22738ce7bf59ebba42138560f128085a5e238eb6c8075792e"
 
 inherit python-dir pythonnative
 # Recursive make problem
@@ -28,7 +28,7 @@ do_install() {
 
     install -d ${D}${libdir}/crda/
 
-    install -m 0644 ${WORKDIR}/2013.01.11-regulatory.bin ${D}${libdir}/crda/regulatory.bin
+    install -m 0644 ${WORKDIR}/wireless-regdb-2013.01.11/regulatory.bin ${D}${libdir}/crda/regulatory.bin
 }
 
 
-- 
1.9.3


