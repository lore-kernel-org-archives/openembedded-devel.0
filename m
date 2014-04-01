Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 041236F90E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 03:40:29 +0000 (UTC)
Received: by mail-ie0-f169.google.com with SMTP id to1so8700383ieb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 20:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FdJwR2fnx+xwlOvuhbO339xR0sCwPk2Z/SGeURT0zGg=;
	b=UgSjmOzgiNRhWxafYL3BFtvV2B8Oll14o73fd/G7p52wjLAB56zZ/ZDQdBObDPu7Ll
	5dxBQTu+Il0kE+sgihv6MsS0vh0NwFVAVxb8EI2pstZpLdVmnmuT2IU2IsHdonz4CAEk
	iCi1ui27PJKRemG7V9GVAsQQr2X28s4SbUM8qHc4F6x6W2QCyUjzprGN/N9HzGXbJWmt
	qttg+IiBK5cVlr28w/zwcrhrNC6ysCGtkNWv0Q+m4e9nQQxRsWWnMFfqW+BimFtiG5Jc
	9vl5/rFvrrrwE9CJyEJFez31kG0n6jgsaVYgqwb3wkHZ2JGU1vhjCn9OpQ6c6QbGrd5G
	S2lw==
X-Gm-Message-State: ALoCoQm8ejvWa8uS4qIRd7Q1+5UlpMhttcAVcAcm9dLMAFZ5SQucBNexEshDvmTAVaw0oi7w2YVI
X-Received: by 10.43.51.65 with SMTP id vh1mr39636188icb.24.1396323630874;
	Mon, 31 Mar 2014 20:40:30 -0700 (PDT)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id gd5sm29556295igd.5.2014.03.31.20.40.29
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Mar 2014 20:40:30 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Mar 2014 23:39:28 -0400
Message-Id: <1396323568-18135-5-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1396323568-18135-1-git-send-email-trevor.woerner@linaro.org>
References: <1396323568-18135-1-git-send-email-trevor.woerner@linaro.org>
Cc: patches@linaro.org
Subject: [meta-oe][PATCH 4/4] gtkmathview: run through oe-stylize.py
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
X-List-Received-Date: Tue, 01 Apr 2014 03:40:31 -0000

Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
---
 meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
index bc4b4cb..e743f87 100644
--- a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
+++ b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
@@ -2,11 +2,9 @@ SUMMARY = "GtkMathView is a C++ rendering engine for MathML documents"
 DESCRIPTION = "GtkMathView reads MathML documents by means of a frontend and \
         renders MathML documents through a backend"
 HOMEPAGE = "http://helm.cs.unibo.it/mml-widget/"
-DEPENDS = "t1lib gtk+ popt libxslt libxml2"
-
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
-
+DEPENDS = "t1lib gtk+ popt libxslt libxml2"
 PR = "r3"
 
 SRC_URI = "http://helm.cs.unibo.it/mml-widget/sources/${P}.tar.gz \
-- 
1.9.0


