Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 70B266F90E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 03:40:28 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id uy17so4357087igb.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 20:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ztN789aismSvkTzR7y6BN4Szkskp1ysXioSlmrQM94E=;
	b=XMAZJccPT9mQOXMCfau8AjVWThrm0zMZnIT1tKiHpsb5T5fEFlfLmh1K9ORbdaFP7d
	8bC9V0k4FgTdtdtaLGexoE7HADsg7dvY+g9xf2lC0S0vCR97eutHjxGTz5EYJk214RRJ
	wqrLtBRVhY7eGCgc1yZfTDgkXMWwDoiurn7DEwKblrUPOiatUqVb3gXnfMwnHXTxXBK4
	mJ+oY0l1vrMxbWipTago01gTLcmxEMQ72DFqzebU0MNd1ChXZzpLWv+bXgLJ2PEXH8m0
	BqNQv+LRkSvyse6XSNGeEWikr/QZlIB5e0nIOKaA2XdH2rEyumiOzvXS4TA0C0qMFnJd
	P5tA==
X-Gm-Message-State: ALoCoQnIDUEknhP1QOf7psuLh76vzYWfiOtSOE0X0SAWJUmwi7dY21XYmBdfI/FF8+gXmXnCAWj7
X-Received: by 10.43.170.4 with SMTP id no4mr38228728icc.15.1396323628979;
	Mon, 31 Mar 2014 20:40:28 -0700 (PDT)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id gd5sm29556295igd.5.2014.03.31.20.40.28
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Mar 2014 20:40:28 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Mar 2014 23:39:26 -0400
Message-Id: <1396323568-18135-3-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1396323568-18135-1-git-send-email-trevor.woerner@linaro.org>
References: <1396323568-18135-1-git-send-email-trevor.woerner@linaro.org>
Cc: patches@linaro.org
Subject: [meta-oe][PATCH 2/4] gtkmathview: fix qa issue
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
X-List-Received-Date: Tue, 01 Apr 2014 03:40:30 -0000

"configure was passed unrecognised options: --disable-binreloc"

Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
---
 meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
index 954dc9a..61f4b9d 100644
--- a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
+++ b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
@@ -18,8 +18,6 @@ SRC_URI[sha256sum] = "1dc30175da6a3c560a7d62d1abe1c2f9829d988e6f1a7c5e766544575c
 
 inherit autotools-brokensep
 
-EXTRA_OECONF = "--disable-binreloc"
-
 do_configure_prepend() {
     sed -i -e s:AM_BINRELOC::g ${S}/configure.ac
 }
-- 
1.9.0


