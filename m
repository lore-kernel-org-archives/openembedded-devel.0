Return-Path: <mickey.happygolucky@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2ACD270018
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 00:59:35 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id j68so1818033pfc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Aug 2017 17:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UbNgy698EcQg3MWpM1r9T7UCzOs6hp9QaxHAdGtRl5g=;
	b=sW3o3t+Hc3NHTGNFWEa07MVpLoVHePEbTbuJmUBYQaUjwYKx7B+suCd6AByxGHre4+
	eN9DynYb36KGH/D8gMh6MSuTkA9RSHlf/hWceiGgfDTuHSkwhsVnGrVknLTC/GCuYBkU
	AazUnq/KJNVfvlxVUN/qNdw4ER3XH/qES0AGmqgZdQguCYXa8qzYUA4Tja7f8wAj63y9
	POezELYgs3NDyQ3NKGLReMkN1HhJ6gkDUiZfL+XEj/8yil3UOo3MKlUCeMQdhjYccDB2
	thFfZMUEt9IFuY6JUhkyPndUihchcHTlZYFR6NQ33fy5mOhZJSN96Cw0rtLBj2jyzvpl
	d18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UbNgy698EcQg3MWpM1r9T7UCzOs6hp9QaxHAdGtRl5g=;
	b=fj47pCIfc7rWtQlPltGnM6fR/Bynhrocqla3katzLVEhJ4fMpT3BS+b0GtxOs6wgIf
	dE7sdXkSkHcCSQS2YiYfEbeS+JIu5F2Yjsdq1pxbejWHw3HXB2n9Ao5xjkJdgrKStex9
	2890AZkoXWcxYKgfLy4LR0ZygxgV3Y92HzjKTnzHR7Gulf24gETD/TIc7SlPPG9gX61m
	zeepBV2YGpLnYnvI8zNoseIbrbnPAKE8CMDLw2+N7s120LN/V8TQI/p1vz17d+5vGeXJ
	nQAsRkMoyqgh61lzXd7fv+sJ7ikqz+W6wAajgRVITA1JGpzyyGpkj8Ji/ug1dnNqHe46
	a3Iw==
X-Gm-Message-State: AHYfb5hJgBe3p3WQBsvwX99jg1BOsuzMl96zOhLiGZsw1pH2wLIAz4Dz
	LqDkCHS4xVQN46jt29g=
X-Received: by 10.99.119.12 with SMTP id s12mr2256322pgc.370.1502153976575;
	Mon, 07 Aug 2017 17:59:36 -0700 (PDT)
Received: from localhost.localdomain
	([2400:2411:21c1:9d00:b8cb:4f3b:9c01:c505])
	by smtp.gmail.com with ESMTPSA id x25sm89484pfk.80.2017.08.07.17.59.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Aug 2017 17:59:36 -0700 (PDT)
From: Yusuke Mitsuki <mickey.happygolucky@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 09:59:12 +0900
Message-Id: <1502153954-2796-5-git-send-email-mickey.happygolucky@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502153954-2796-1-git-send-email-mickey.happygolucky@gmail.com>
References: <1502153954-2796-1-git-send-email-mickey.happygolucky@gmail.com>
Subject: [PATCH 4/6] uim: Removed pkg_postinst_uim-common/pkg_prerm_uim-common.
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
X-List-Received-Date: Tue, 08 Aug 2017 00:59:36 -0000

These functions are not worked correctly.
However default im is installed. thus we determined it not need.

Signed-off-by: Yusuke Mitsuki <mickey.happygolucky@gmail.com>
---
 meta-oe/recipes-support/uim/uim_1.8.6.bb | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/meta-oe/recipes-support/uim/uim_1.8.6.bb b/meta-oe/recipes-support/uim/uim_1.8.6.bb
index 0cfd351..e6bacce 100644
--- a/meta-oe/recipes-support/uim/uim_1.8.6.bb
+++ b/meta-oe/recipes-support/uim/uim_1.8.6.bb
@@ -137,19 +137,4 @@ pkg_postrm_uim-skk() {
     fi
 }
 
-pkg_postinst_uim-common() {
-    if [ -f /usr/bin/uim-module-manager ]; then
-        /usr/bin/uim-module-manager --path /etc/uim --register \
-            tutcode tcode hangul viqr \
-            ipa-x-sampa latin byeoru
-    fi
-}
-
-pkg_prerm_uim-common() {
-    if [ -f /usr/bin/uim-module-manager ]; then
-        /usr/bin/uim-module-manager --path /etc/uim --register \
-        tutcode tcode hangul viqr ipa-x-sampa latin byeoru
-    fi
-}
-
 BBCLASSEXTEND = "native"
-- 
2.7.4


