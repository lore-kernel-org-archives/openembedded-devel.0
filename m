Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROCM1-0008HM-79
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Nov 2011 18:54:29 +0100
Received: by mail-fx0-f47.google.com with SMTP id t2so2009238faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Nov 2011 09:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=yoHPNugcpddG6CAQGTDjFPbr782wfQFZJ1+huIZ8ZlM=;
	b=Z34/Y3JPDxnhoSKPvnsy57LdcgM0EW04ncUuxLyrXyqHH5T184kF+WyNg1kkpt5V0O
	kvkKc6ArTdfHuglcruJXNR4pdkiF9ZGlip1F45OaOAPTISc5qHerobTfIGGDWon5AwHZ
	r+83JuF1QKsXCftAAPkASL3JZ9ljbUTp5NsRM=
Received: by 10.223.14.3 with SMTP id e3mr6313684faa.25.1320860895737;
	Wed, 09 Nov 2011 09:48:15 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w11sm7453277fad.7.2011.11.09.09.48.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Nov 2011 09:48:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Nov 2011 18:47:54 +0100
Message-Id: <038a39212cac95d4c3431e2e6bbd02cf0bad0982.1320860740.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
In-Reply-To: <31a2761c1b9ca9e31445017b8180474813aecef4.1320860740.git.Martin.Jansa@gmail.com>
References: <31a2761c1b9ca9e31445017b8180474813aecef4.1320860740.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1320860740.git.Martin.Jansa@gmail.com>
References: <cover.1320860740.git.Martin.Jansa@gmail.com>
Subject: [meta-oe 2/4] openssl: bump PR to fix license
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
X-List-Received-Date: Wed, 09 Nov 2011 17:54:29 -0000

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



