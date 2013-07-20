Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id D6FBF6B1D8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jul 2013 15:08:28 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id h15so2995401eak.28
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jul 2013 08:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=13abyDH68Uhj9s78ISqLFs6L+SKGitx/gvUePWtL6CU=;
	b=EzKOOa8xco85BSddLxaUs5FwTtgJPAvsAYREE6eHDThay+nRe+bnCBbHY+Vpjmc0fw
	zJ9JnV+pxRwCUxprDuw8sXIJN4LifIHRDOcKXbtmCiLZRyW+UDZl9E1bXVHvziAtjSjt
	BY9NOfJGS4AzZfran48guf0EFuEl1Jsdc5L+xxkzYlat4KAGNbZ3UMAVZA8x7xiaWYEX
	u/beBSS1udJlEt8aVeH+ij/lMmmR0KduSeNLZNIA/ZpowGTP/IaKWj+5Es9TPqkr1yWM
	tDLXO4OTdsdkXXFNa4YYKBzqaya8Ne5LeHyOalunLlwk49++dPFU0lze/wbiDKaZEQj6
	pRqA==
X-Received: by 10.14.209.197 with SMTP id s45mr20626570eeo.108.1374332909347; 
	Sat, 20 Jul 2013 08:08:29 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m1sm35846965eex.17.2013.07.20.08.08.28 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 20 Jul 2013 08:08:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Jul 2013 17:08:33 +0200
Message-Id: <930eace5d75649c552f40b8ff29e2fc52c3139bd.1374332866.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <e15f15a2dcc1291e2cfb749c92f1a5918ae0920a.1374332866.git.Martin.Jansa@gmail.com>
References: <e15f15a2dcc1291e2cfb749c92f1a5918ae0920a.1374332866.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374332866.git.Martin.Jansa@gmail.com>
References: <cover.1374332866.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 10/11] ntp: add PACKAGECONFIG for libcap and readline
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
X-List-Received-Date: Sat, 20 Jul 2013 15:08:29 -0000

* it's autodetected from sysroot

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/ntp/ntp.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
index 79e7401..9367d41 100644
--- a/meta-networking/recipes-support/ntp/ntp.inc
+++ b/meta-networking/recipes-support/ntp/ntp.inc
@@ -37,6 +37,8 @@ PACKAGECONFIG[openssl] = "--with-openssl-libdir=${STAGING_LIBDIR} \
                           --with-crypto, \
                           --without-openssl --without-crypto, \
                           openssl"
+PACKAGECONFIG[cap] = "--enable-linuxcaps,--disable-linuxcaps,libcap"
+PACKAGECONFIG[readline] = "--with-lineeditlibs,--without-lineeditlibs,readline"
 
 do_install_append() {
     install -d ${D}${sysconfdir}/init.d
-- 
1.8.3.2


