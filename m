Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id E40CD6B81C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:57 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so180835eek.19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=84F3JwysR006RWu5v2EUOU8z8ZwpCfnx8MyxEZPIowI=;
	b=U011dc4zK020G/FQKbtXjiBekDqg3WHzBMovk1McOcV8RWjl52WNWvC7yT5wyLPOev
	nwkiRqFGB3qCJHhK0nngfcA9SImjFCTderxPwa0K/mc5De17CXao9EYL8PyvXouYdvcc
	kevShGK9bgwNJJj14oj9++6g9vfEhSW66Onzt5qQpT+NrwhM0VOc4/9FLyCvSa6soT3p
	6yn6IWMnf7IZ1BzKu8aI+b2psrLZsdHp+GBTr84SWaM2HxDWgnkUDoMwMSwZIe22e7R8
	dW0X2gRFW3JATqrQGtNEN3JiCsdXfLynSSP/YEKSKK+kd8/FppQ1EtV6wSC49/DWC89K
	fAmg==
X-Received: by 10.15.67.131 with SMTP id u3mr20545258eex.34.1376551198359;
	Thu, 15 Aug 2013 00:19:58 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a4sm81931259eez.0.2013.08.15.00.19.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:29 +0200
Message-Id: <9f1042ea3d19a784d7d5dfc3e1fe2b0acd3e746c.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 49/60] libnice: add PACKAGECONFIG for gupnp
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:58 -0000

* it's autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/farsight/libnice_0.0.13.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
index 94ec9a2..3205aaf 100644
--- a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
+++ b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
@@ -13,6 +13,9 @@ PR = "r4"
 
 DEPENDS = "glib-2.0 gstreamer"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[gupnp] = "--enable-gupnp,--disable-gupnp,gupnp-igd"
+
 inherit autotools
 
 FILES_${PN} += "${libdir}/gstreamer-0.10/*.so"
-- 
1.8.3.2


