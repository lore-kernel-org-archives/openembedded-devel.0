Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 779016B333
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:41:07 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id q16so211764ead.21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=d0uS6tSpdp7v52utbeh4Ud40a2NmQa27kz/VUCOdLk8=;
	b=lG1MM3HUurVlxaIftwPhTPg65QaESIBRoQ3vPa+TtEM19PExXXNV0TvptJoM7gEgKD
	6PtbJjGSSwxmiqWtCdO2acxEkKr0E4IsQZ/hcZELfojB3LvvoBmjD2B4HtrwXlwDdV3r
	FFRcCkLH5RH2DFDnOOvNZFQptk4U5r6VrJKMex7yLtyJlUTfH66AdKyNI1WiBCD/SIRF
	K86WeGOIXmWN9wrejBL6oH4hyoNS/qdd/qXyK+D9AYa4xz/deQkZKrB/UO3t8l0HjSjK
	JE2cX32WicVWgnnyCjE/9XSzF0IaDsfrAQ2zk3VnOnxSQWlPJYNcO3Jyx4rRBu1498/Q
	uSRQ==
X-Received: by 10.14.1.70 with SMTP id 46mr37599778eec.82.1374669667826;
	Wed, 24 Jul 2013 05:41:07 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p49sm65916156eeu.2.2013.07.24.05.41.07 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:41:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:40:54 +0200
Message-Id: <57a774587f94f66d7c5dbb5fc5b25c9354166299.1374669516.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
References: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374669516.git.Martin.Jansa@gmail.com>
References: <cover.1374669516.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 10/29] krb5: add PACKAGECONFIG for openssl and libedit
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
X-List-Received-Date: Wed, 24 Jul 2013 12:41:07 -0000

* it's autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/krb5/krb5_1.11.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.11.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.11.bb
index 31fe463..a68e85d 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.11.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.11.bb
@@ -15,6 +15,10 @@ SRC_URI[sha256sum] = "fe37fb93b398db98a1b23f814673ea2ae4b90138f85e1a4027ef639456
 
 S = "${WORKDIR}/${P}/src/"
 
+PACKAGECONFIG ??= "openssl"
+PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
+PACKAGECONFIG[openssl] = "--with-pkinit-crypto-impl=openssl,,openssl"
+
 EXTRA_OECONF += " --without-tcl --with-system-et --disable-rpath"
 CACHED_CONFIGUREVARS += "krb5_cv_attr_constructor_destructor=yes ac_cv_func_regcomp=yes \
                   ac_cv_printf_positional=yes ac_cv_file__etc_environment=yes \
-- 
1.8.3.2


