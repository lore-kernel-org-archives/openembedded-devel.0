Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5F94F713B9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 17:22:43 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id w10so14560346pde.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 09:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=66LWc4BlYCDsCBmDjkUpMw7NmsGgXA5WGjXa1Ya5+QQ=;
	b=kusT2eztW54/aq3WE/jmAbhI8QvhRMyh48rFo/31MxvzxiGBZEEHjOsVJvgCKI0Uyo
	qHOh7qvBKVh3OF4BtN+tsNbeQEU3TNxODthZ38pK0kR/+ee4XPfnKbH9+XnHCRZfp9Sh
	5ZSw84K/b6z1Q52Y7gIq637ibtSLM9VNdlVVXfKNwU2DWNOf2stztSz26COHvK2wsOiU
	xuwo+5zxWgTvqyfZgHiCoyKoYnn2bGf/6E0N5TgcEMFN3zB/wGo42i93tF/rmKenWrUB
	vZsoMJlCXggpL3FuNeJuhwIp6pmU4CDbYayN3mUkxcryFb3jdhzA+vRK7RTjAbD8GPz6
	BU2g==
X-Received: by 10.67.3.100 with SMTP id bv4mr58508171pad.15.1419700963977;
	Sat, 27 Dec 2014 09:22:43 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id
	fu1sm31202444pbb.91.2014.12.27.09.22.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Dec 2014 09:22:42 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 27 Dec 2014 09:22:03 -0800
Message-Id: <3cac29682c1b0a7aa51ebb26fd87d4747292d2d4.1419700394.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
Subject: [PATCH 16/27] libnet-ssleay-perl: avoid host contamination
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
X-List-Received-Date: Sat, 27 Dec 2014 17:22:43 -0000

From: Kang Kai <kai.kang@windriver.com>

Check the configure log, libnet-ssleay-perl uses host's openssl:

*** Found OpenSSL-1.0.1 installed in /usr

Export OPENSSL_PREFIX to find the native openssl to use.

Replace library pathes '/lib', '/usr/lib' and header path with correct
staging pathes at same time.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb
index 63594b9..f6c4b8b 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb
@@ -28,12 +28,16 @@ S = "${WORKDIR}/Net-SSLeay-${PV}"
 
 inherit cpan ptest
 
-EXTRA_CPANFLAGS = "LIBS='-L=${libdir} -L=${base_libdir}' \
-                   INC=-I=${includedir} \
+EXTRA_CPANFLAGS = "LIBS='-L=${STAGING_LIBDIR} -L=${STAGING_BASELIBDIR}' \
+                   INC=-I=${STAGING_INCDIR} \
                    'EXTRALIBS=-lssl -lcrypto -lz' \
                    'LDLOADLIBS=-lssl -lcrypto -lz' \
                   "
 
+do_configure_prepend() {
+    export OPENSSL_PREFIX=${STAGING_DIR_NATIVE}${prefix_native}
+}
+
 do_install_ptest() {
     cp -r ${B}/t ${D}${PTEST_PATH}
 }
-- 
1.9.1


