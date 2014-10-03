Return-Path: <eduardo@monkey.io>
Received: from mail-yh0-f47.google.com (mail-yh0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id DAD98708B3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Oct 2014 13:52:18 +0000 (UTC)
Received: by mail-yh0-f47.google.com with SMTP id c41so354631yho.34
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Oct 2014 06:52:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zQP9Ujz2MESan+XsLVo7R/bHWICJXN+3zPa9WyPiqsc=;
	b=EseDJINiENOsSLOKvUdeeCk5d8Hs7P4lk1qLx8IMfl5P4DctHo1Kpi8qpnyvtvpkck
	PY8rCwqhcjMRHKofBqeu4xpZJACOuJIzB5Y2f33ImyZ+WHLyyJP0CN1slJTFXY9DBOGR
	XJwGvhxeGx0LlZRdpivldnv/JFQKu5x/j9EMiWEBd8hS/OD0No+aEw0TmOYQB4NegiH5
	Z1Mkvdn1ydG0pftSE46+U/Aw4Z8FslNAJ0G5k3m7KfGVd4nySaj5w1hslEzBdddUJZgn
	otoS3gLcMBfJ5WXKwbOcYRsnEawE7Aepj6ca5zGTvogmCRF45DX14p23GEkKrRhc7r6X
	KlXQ==
X-Gm-Message-State: ALoCoQm3wjgGqn40PL2d1qv3Syxb7Oll5orBUu/dqSGvvc8MhoNc49HpNJYuQ77GDHI4187/icMs
X-Received: by 10.236.228.100 with SMTP id e94mr8355669yhq.8.1412344339910;
	Fri, 03 Oct 2014 06:52:19 -0700 (PDT)
Received: from monotop.amnet.co.cr ([186.4.49.50])
	by mx.google.com with ESMTPSA id e18sm3102050yhb.43.2014.10.03.06.52.18
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Oct 2014 06:52:19 -0700 (PDT)
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Oct 2014 07:51:57 -0600
Message-Id: <1412344317-21571-1-git-send-email-eduardo@monkey.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] PolarSSL: new recipe for polarssl v1.3.8
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
X-List-Received-Date: Fri, 03 Oct 2014 13:52:24 -0000

PolarSSL is a lightweight crypto and SSL/TLS library with a strong
focus on embedded systems.

Signed-off-by: Eduardo Silva <eduardo@monkey.io>
---
 .../polarssl/polarssl_1.3.8.bb                     | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb

diff --git a/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb b/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb
new file mode 100644
index 0000000..d05f416
--- /dev/null
+++ b/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Lightweight crypto and SSL/TLS library"
+DESCRIPTION = "PolarSSL is a fork of the abandonned project XySSL. It \
+is a lean crypto library providing SSL and TLS support \
+in your programs."
+
+HOMEPAGE = "https://polarssl.org"
+BUGTRACKER = "https://github.com/polarssl/polarssl/issues"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
+
+SECTION = "net"
+
+SRC_URI = "https://polarssl.org/download/polarssl-${PV}-gpl.tgz"
+
+SRC_URI[md5sum] = "d1a2b4f21727e888f143414d2e3144e6"
+SRC_URI[sha256sum] = "318171db41335cacbb5b0047c94f1faf91442ab70a223b5223436703c9406ff1"
+
+RDEPENDS_${PN} += "libcrypto"
+EXTRA_OECMAKE = "-DUSE_SHARED_POLARSSL_LIBRARY=on"
+
+inherit cmake
-- 
1.9.1


