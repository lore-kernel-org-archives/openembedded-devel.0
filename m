Return-Path: <eduardo@monkey.io>
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id CD1C7716A3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Oct 2014 02:58:24 +0000 (UTC)
Received: by mail-yk0-f178.google.com with SMTP id q9so1706597ykb.23
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Oct 2014 19:58:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wlh+C3lTUmTg7c6d902JEgGqjbufwqJRRP/++n1fZdM=;
	b=CNQg80TnDCm+ABxgKbqjJegHFUpgmJqn4vwdqGkFw+6T/0WmkWgXOZtHDnPjcc19Gb
	SGHNTZV730m0jBmetw+jS0ffIBU4QQ9l8+USRoFWpvB4yU2bKnekA8d80cTMiLZtQi/c
	YLz6jfth8UjO8lo66TCrndctnmSYnMZCeTnwp5tdThtnhkrzX868o/3BT/f4R525MTHG
	+SvV7p7GULmCltOQTUTSqM7cvUbOive3DCr84CkAOvDdT+D9o+Yn/LydD9UTNEG+5En+
	XWcQL3ZEck0Wstyf1+xzof/pWPlQtZKFF3aEmNkP90J+WcPQ5LKt8iV8fuU13PYyyEuh
	I4IA==
X-Gm-Message-State: ALoCoQnN4ixuevW7CsKCk66v9uGpFIrM2rJnKf38YmIcqVSA5rQW/C7OVrn2csJccvNhQU1ul/X+
X-Received: by 10.236.19.69 with SMTP id m45mr7079350yhm.111.1413514705323;
	Thu, 16 Oct 2014 19:58:25 -0700 (PDT)
Received: from monotop.amnet.co.cr ([186.4.56.221])
	by mx.google.com with ESMTPSA id v31sm151665yha.16.2014.10.16.19.58.23
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Oct 2014 19:58:24 -0700 (PDT)
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Oct 2014 20:58:01 -0600
Message-Id: <1413514681-22187-1-git-send-email-eduardo@monkey.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] PolarSSL: update package description
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
X-List-Received-Date: Fri, 17 Oct 2014 02:58:27 -0000

Signed-off-by: Eduardo Silva <eduardo@monkey.io>
---
 .../recipes-connectivity/polarssl/polarssl_1.3.8.bb    | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb b/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb
index d05f416..8ca1b1c 100644
--- a/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb
+++ b/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb
@@ -1,7 +1,19 @@
 SUMMARY = "Lightweight crypto and SSL/TLS library"
-DESCRIPTION = "PolarSSL is a fork of the abandonned project XySSL. It \
-is a lean crypto library providing SSL and TLS support \
-in your programs."
+DESCRIPTION = "PolarSSL is a lean open source crypto library         \
+for providing SSL and TLS support in your programs. It offers        \
+an intuitive API and documented header files, so you can actually    \
+understand what the code does. It features:                          \
+                                                                     \
+ - Symmetric algorithms, like AES, Blowfish, Triple-DES, DES, ARC4,  \
+   Camellia and XTEA                                                 \
+ - Hash algorithms, like SHA-1, SHA-2, RIPEMD-160 and MD5            \
+ - Entropy pool and random generators, like CTR-DRBG and HMAC-DRBG   \
+ - Public key algorithms, like RSA, Elliptic Curves, Diffie-Hellman, \
+   ECDSA and ECDH                                                    \
+ - SSL v3 and TLS 1.0, 1.1 and 1.2                                   \
+ - Abstraction layers for ciphers, hashes, public key operations,    \
+   platform abstraction and threading                                \
+"
 
 HOMEPAGE = "https://polarssl.org"
 BUGTRACKER = "https://github.com/polarssl/polarssl/issues"
-- 
1.9.1


