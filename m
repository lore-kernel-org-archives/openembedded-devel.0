Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RNm88-0004Sv-3e
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Nov 2011 14:54:24 +0100
Received: by faat2 with SMTP id t2so522003faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Nov 2011 05:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=yoHPNugcpddG6CAQGTDjFPbr782wfQFZJ1+huIZ8ZlM=;
	b=OPd3dRNqZwLqTKyTrxr4W50T8NRBy5TvfQUQDkHsrbw3vQkILdHBS+ehgcZ/d+v6JG
	jciHcfleek0L8XIcyt7EQBgF1WrBKao1ALvo1+BB73aLe0LhTCOWxcAgQl6INZr/K6Fo
	5v1uiJUGXNU/38bJjwAN+x2mlnD1qm6uFyoVk=
Received: by 10.223.77.66 with SMTP id f2mr54597685fak.24.1320760086910;
	Tue, 08 Nov 2011 05:48:06 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o16sm2199145fag.21.2011.11.08.05.48.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Nov 2011 05:48:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Nov 2011 14:47:55 +0100
Message-Id: <1320760075-19217-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
Subject: [PATCH] openssl: bump PR to fix license
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
X-List-Received-Date: Tue, 08 Nov 2011 13:54:24 -0000

* see http://patchwork.openembedded.org/patch/14217/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-connectivity/openssl/openssl_0.9.8m.bb |    2 +-
 .../recipes-connectivity/openssl/openssl_1.0.0e.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/openssl/openssl_0.9.8m.bb b/meta-oe/recipes-connectivity/openssl/openssl_0.9.8m.bb
index 1091bf2..dde797b 100644
--- a/meta-oe/recipes-connectivity/openssl/openssl_0.9.8m.bb
+++ b/meta-oe/recipes-connectivity/openssl/openssl_0.9.8m.bb
@@ -4,7 +4,7 @@ require openssl.inc
 SRC_URI[src.md5sum] = "898bf125370926d5f692a2201124f8ec"
 SRC_URI[src.sha256sum] = "36037160281cf4977d964e403d2bc0680fbca0a7ff9f65e33136d75fae12cb5b"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 export OE_LDFLAGS="${LDFLAGS}"
 
diff --git a/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb b/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb
index 8fcf0ff..ea12974 100644
--- a/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb
+++ b/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb
@@ -6,7 +6,7 @@ DEPENDS += "ocf-linux"
 
 CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 
-- 
1.7.8.rc1



