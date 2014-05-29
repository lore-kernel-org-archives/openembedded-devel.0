Return-Path: <ticotimo@gmail.com>
Received: from mail-pb0-f52.google.com (unknown [209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0E6A66FC31
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 May 2014 03:44:25 +0000 (UTC)
Received: by mail-pb0-f52.google.com with SMTP id rr13so12347421pbb.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 May 2014 20:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wrpldHLwzGJMAcgVTtZ/DdCR4xCU/cYQSZdK7okO+v8=;
	b=TFk7AlDRlAfj2U51UnKrUFfv9rcRPwNw64+Yi3DKPfiVzkB3WaW901WyEQTmaws1zm
	2vOXQUX+vj4313prQyl3MSTfFFY9oEzb7T3DCVeLNz3xuvgBwKqzlnMZDB0GlBO2BToW
	6F6C2ImYFrI4krdGZymcioyW1K7DhTbTrbUbwQePBLTnnJ4NV1EKnxnrteAdv6n2OqIz
	851IfZg6yrzT7oci8HR6KSwsGTNgJKG/lr7z+AnwsmvkFBr5x56Zi6sP42klT34qK36K
	MHVdnXm5gLEiEy2iwabce5x3MzgTugAJBohYkU/evs6POeP2VOPyJfpo7LBetZoGeouG
	0bAA==
X-Received: by 10.67.4.138 with SMTP id ce10mr5284251pad.12.1401335066875;
	Wed, 28 May 2014 20:44:26 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id y2sm97472685pas.45.2014.05.28.20.44.25
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Wed, 28 May 2014 20:44:26 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 May 2014 20:47:17 -0700
Message-Id: <1401335237-19402-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <CAMKF1sp_ii_wm6sjCd=ENxPKSkQoOqNhLnnA0bU6PfOyp=gz4g@mail.gmail.com>
References: <CAMKF1sp_ii_wm6sjCd=ENxPKSkQoOqNhLnnA0bU6PfOyp=gz4g@mail.gmail.com>
Subject: [meta-oe][PATCH v2] enca: fix S!=B failure
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
X-List-Received-Date: Thu, 29 May 2014 03:44:26 -0000

From: Tim Orling <TicoTimo@gmail.com>

Point tools to the right paths:
* ${S}/configure.ac in do_configure_prepare()
* ${B}/Makefile in do_configure_append()
* cd ${B} in do_compile()

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-oe/recipes-support/enca/enca_1.9.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/enca/enca_1.9.bb b/meta-oe/recipes-support/enca/enca_1.9.bb
index e65a143..ea38946 100644
--- a/meta-oe/recipes-support/enca/enca_1.9.bb
+++ b/meta-oe/recipes-support/enca/enca_1.9.bb
@@ -20,17 +20,17 @@ EXTRA_OECONF = "--with-libiconv-prefix=${STAGING_DIR_HOST}${layout_exec_prefix}"
 
 do_configure_prepend() {
     # remove failing test which checks for something that isn't even used
-    sed -i -e '/ye_FUNC_SCANF_MODIF_SIZE_T/d' configure.ac
+    sed -i -e '/ye_FUNC_SCANF_MODIF_SIZE_T/d' ${S}/configure.ac
 }
 
 do_configure_append() {
-    sed -i s:-I/usr/include::g Makefile
-    sed -i s:-I/usr/include::g */Makefile
+    sed -i s:-I/usr/include::g ${B}/Makefile
+    sed -i s:-I/usr/include::g ${B}/*/Makefile
 }
 
 do_compile() {
     cd ${S}/tools && ${BUILD_CC} -o make_hash make_hash.c
-    cd ..
+    cd ${B}
     oe_runmake
 }
 
-- 
1.8.3.2


