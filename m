Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0F60E72F05
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 23:07:28 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r18so16889130wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 15:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LwVN7yMHagOlQBkEoyVFBYqVbfxjsdkivlWX0bmvDco=;
	b=qMuE5pMU7cL6Wr0RaMcpnT2n7NwjHbFh6h5nrZGqH5M2VIUcxwtVCrX9BevC3t92nB
	M+KLcHhRwdeUzqUaP9WqZOxj9QQsCCqKRoak6yM8otP4OM5kwrlIwkx8FgmvRskEkU6k
	nlFzH8rlldznKoQNkRxzg9u0XA11zErF9ebMokmFrDHygShJ3Hcd9aqTdfTp2ZoVdezF
	PDTZ8tOPIwyvD3I/+4Pr8/0/CFNnQ3CZScL0sshGxgI+mNnIdE62tRHKf00VGn70MztH
	f5mCxYo3qBfawYK388AtQZKWobwa6HfAffeSXXtwrtlCeTa9cGnPjUhn9HWZ6vIfd+FK
	yRVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LwVN7yMHagOlQBkEoyVFBYqVbfxjsdkivlWX0bmvDco=;
	b=hGS0UmOChjPHDk4dk1k3dS0Bj/G6re9QDscE5Rni6Az2+NrdYZ6TK0tp67XpkkVitB
	eVBbpLuAvLnDAPo8x587Du6zd0i+c9xRqKF5vWWaU3MDTFW1mxVFKHvw0bV9rW6Y3sQo
	9JHYRS6x4xb8CBk1DD9rgD5l+O/y9B8KcvFMOQRRqiNX2SBLFrkDtJOL0RVZa5nLgKgG
	9TxIvQBhX7aj8ehyQGaM1fuFjHZXEAkbrASXsbGwi21PL5d/lOZsXKVLq34jyW2lY27e
	AZO/F7d+UhExCpyPvNEWfmNoPeWOLauxo1D/HS1jn8YdG5c1ZpktQjdtSJuhKInj9vLS
	MyZA==
X-Gm-Message-State: AMke39lRJ8848Bc4PtssTChtfHAVkzhHWuPlBtljfNIeTLQfaHnapPmgjGvZQ3OcHU6HZg==
X-Received: by 10.28.224.67 with SMTP id x64mr23440712wmg.20.1487632049365;
	Mon, 20 Feb 2017 15:07:29 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	i73sm15294743wmd.11.2017.02.20.15.07.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 15:07:28 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Feb 2017 00:07:14 +0100
Message-Id: <20170220230719.10066-1-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH 1/6] geany: add intltool-native to DEPENDS and unblacklist
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
X-List-Received-Date: Mon, 20 Feb 2017 23:07:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-devtools/geany/geany_1.29.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/geany/geany_1.29.bb b/meta-oe/recipes-devtools/geany/geany_1.29.bb
index a2c6787..745c3ac 100644
--- a/meta-oe/recipes-devtools/geany/geany_1.29.bb
+++ b/meta-oe/recipes-devtools/geany/geany_1.29.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.geany.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bd7b2c994af21d318bd2cd3b3f80c2d5"
 
-DEPENDS = "gtk+ libxml-parser-perl-native python3-docutils-native"
+DEPENDS = "gtk+ libxml-parser-perl-native python3-docutils-native intltool-native"
 
 inherit autotools pkgconfig perlnative pythonnative
 
@@ -14,5 +14,3 @@ SRC_URI[sha256sum] = "394307596bc908419617e4c33e93eae8b5b733dfc8d01161677b8cbd3a
 FILES_${PN} += "${datadir}/icons"
 
 EXTRA_OECONF = "--disable-html-docs"
-
-PNBLACKLIST[geany] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/132822/"
-- 
2.9.3


