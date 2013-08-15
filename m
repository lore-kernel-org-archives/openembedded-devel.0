Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 71AE26B7F8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:47 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so180793eek.33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=d0uS6tSpdp7v52utbeh4Ud40a2NmQa27kz/VUCOdLk8=;
	b=ck9thVo9qyyeHWcPwwhTL1uxbc3Anpt0daJmCe2ECid8sVb+VxNWPqdKOlT0eA7jlb
	DloLgIXs8gi/i6TU2q76WSwar7A+m9YLmi22OIyOJ8Jw8g/YMgB6QDuG6VyrQxqdX1Y1
	c7Uchx1Q7J+VVO/INPfeJiX69C/8QZM7pPcILjpEpgie2vgvYwZlAG0FLsVzpVbzBU2b
	jhLuB7VrpRmhjSvKdF+TwcgRi3vgvMpyg1k6jhk6zdi8+LqLBt78AbzlByrNtcd9+846
	A/kr2LdTGvyUJme/rNZX37ef1XIq8+L0FMmM02lex/nlQBtSxc2v8zNfjuFEqTApS5jE
	7ePQ==
X-Received: by 10.14.5.78 with SMTP id 54mr2618959eek.55.1376551187768;
	Thu, 15 Aug 2013 00:19:47 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bq1sm81937011eeb.9.2013.08.15.00.19.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:21 +0200
Message-Id: <00271f7a574ef9f13134c935a0d7a66ad3983c5d.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 41/60] krb5: add PACKAGECONFIG for openssl and libedit
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:47 -0000

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


