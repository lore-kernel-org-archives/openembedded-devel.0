Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7C63A7564E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 21:14:43 +0000 (UTC)
Received: by wicmx19 with SMTP id mx19so57875854wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 14:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=ymYmwK0/u8cZ9TXCClJZDjEZEUqn+q3sXzaaRzwJMsc=;
	b=H7YuRMKmlZE2I1vA5o55hL28x6YdEbDTn4as/Ec8Qkasyqc3SyDnGA3jP98Mjx7CEj
	vr4Pb+yvx0wB4omYJPT1BltZRDX6t6UcV/wq80zt0HApf7R9sXT7g6hwHjqsxwuvxTu8
	oa23lsGkSK5TgH0ZugFtkVQyB5JUiDZIeBnbZV2Dv6IDyP7POz9z+pJPnzTnMU+Pe+Rj
	HDLb5U2+Y1JExIXDlFBoTR1Ml3wi37czj7CQ/e39Zx2iWLe88GbGtOBOIdrh2qgdS5EA
	PSHlmaxcRDTjnZ+8g7Qa7t6GxPdPEyi6AowSDg+Z117s0txiaPolU4VVHl8dZbNMWzVV
	0V0A==
X-Received: by 10.180.215.8 with SMTP id oe8mr14374785wic.0.1432588484495;
	Mon, 25 May 2015 14:14:44 -0700 (PDT)
Received: from localhost.localdomain (p5B0A35C6.dip0.t-ipconnect.de.
	[91.10.53.198])
	by mx.google.com with ESMTPSA id 16sm18515406wjs.41.2015.05.25.14.14.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 May 2015 14:14:43 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 May 2015 23:14:08 +0200
Message-Id: <1432588449-31413-12-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
References: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 11/12] exo: update to 0.10.6
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
X-List-Received-Date: Mon, 25 May 2015 21:14:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/exo/{exo_0.10.4.bb => exo_0.10.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/exo/{exo_0.10.4.bb => exo_0.10.6.bb} (87%)

diff --git a/meta-xfce/recipes-xfce/exo/exo_0.10.4.bb b/meta-xfce/recipes-xfce/exo/exo_0.10.6.bb
similarity index 87%
rename from meta-xfce/recipes-xfce/exo/exo_0.10.4.bb
rename to meta-xfce/recipes-xfce/exo/exo_0.10.6.bb
index eeb2e75..f1b5ae5 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.10.4.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.10.6.bb
@@ -17,8 +17,8 @@ SRC_URI_append_class-native = " \
     file://reduce-build-to-exo-csource-only.patch \
 "
 
-SRC_URI[md5sum] = "fe54dad8b897af36628da46b33844f95"
-SRC_URI[sha256sum] = "cced5fdbc0b61a5d976210ff71ecdd81b89fcd15e5860a44f50da7b83fb2deaa"
+SRC_URI[md5sum] = "895e4f38d2cfe58d69679e2902a335a5"
+SRC_URI[sha256sum] = "1cc0e5a432e050a5e5aa64d126b988f4440da4f27474aaf42a4d8e13651d0752"
 
 PACKAGES =+ "exo-csource"
 
-- 
1.9.3


