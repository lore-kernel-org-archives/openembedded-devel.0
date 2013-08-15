Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id B36486009A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:01 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so178557eek.39
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=xhxjMONE0F0M/Cx56NTq75BcrFM/RVP8lTT7nib6aoQ=;
	b=TUY0Gl9Ja/q4s9b1KvaXXEzCDkKXq6V70afrSixN98huNYWZODiIIx/2CYP3//Gg87
	9BIcGnIReWMwcdfH8K/ISV8MKJbAUxHgdFKFJNfQWd4WE0ZL1R/pGnPQbX+uteUPOOMn
	O7NnucOHMOzT55EjJ3x1c+kxm/AxMLg5gvKNXmhoS+CF+Cp75rY/P1D+O5/q22C92sKg
	4bpQsvuQeTUSVlWrOjeW+ysMglFbF8YK1jYBL+jtee44s3ak6CK1feRiQjUEbSc00TBz
	sVHfCUBq1pigl9Bypko6pNDhjW1WpKvKd2RohDPI2dwakOI0N4dJw8QvK2UM6hiMXUXf
	GjRA==
X-Received: by 10.14.4.1 with SMTP id 1mr3277394eei.21.1376551142166;
	Thu, 15 Aug 2013 00:19:02 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	f49sm76264518eec.7.2013.08.15.00.19.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:18:47 +0200
Message-Id: <3b5d63cecded6fbd07a23dbbd6c765e002893927.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 07/60] gypsy: add dependency on libxslt-native
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:02 -0000

* it's incorrectly used in build (and just "o" is used instead of xslt
  command):
  | o gypsy-discovery.xml ../docs/tools/spec-strip-docs.xsl gypsy-discovery-full.xml
  | /bin/bash: o: command not found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/gypsy/gypsy.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gypsy/gypsy.inc b/meta-oe/recipes-navigation/gypsy/gypsy.inc
index 0c1735e..ba54356 100644
--- a/meta-oe/recipes-navigation/gypsy/gypsy.inc
+++ b/meta-oe/recipes-navigation/gypsy/gypsy.inc
@@ -6,7 +6,7 @@ client applications, passing the data as simple values for the clients \
 to use."
 LICENSE = "GPLv2.0 & LGPLv2.1"
 SECTION = "x11"
-DEPENDS = "glib-2.0 dbus bluez4 dbus-glib"
+DEPENDS = "glib-2.0 dbus bluez4 dbus-glib libxslt-native"
 
 inherit autotools pkgconfig gtk-doc
 
-- 
1.8.3.2


