Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7302360D71
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 08:18:56 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id x13so1352421wgg.32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 01:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0+NFsgVgT3xQ4IBHj+5FONHkHR4WIKfW0oWWrKk5Tlg=;
	b=gomPRL0mtv4oBGoVnEmYKXNYhxdBBpZi+w3VDYNYra2+dgTU7GXTHJDl/Ws3AdXATe
	3e5FZqlRrQH/ZGet4/usEAlB2l6BjuJX7uTfmwceaUMSJkaG2QnzgGXFasTeZDNRaQiA
	IThtr4uDBpnx3s0WvqXPs59dsxZOie0h7wrvrXNDkiHNz7/6QnCkhYRn+t4B3KlFIFMc
	oUfX2a0TeXuYJ/+qUhkEl+Ph0v+Lsrgp3oWonVemkJozPoFgumuK6qgMFgKW2xWi5I7U
	/TwxQ5i8IxW/VhfCotVQGB+pkDZPsFp2ZKD2aYKri1yehF9vGBD3ja3xj6xycS1ALF7N
	nNZw==
X-Gm-Message-State: ALoCoQnulGseZH+HJkQS/Xo/pU06e20qZd8Ob1cCnP3U1uQgKGGum3YdyHnGFlnycFB8ZUowTMhb
X-Received: by 10.194.191.133 with SMTP id gy5mr2692396wjc.34.1398845937316;
	Wed, 30 Apr 2014 01:18:57 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id
	fo10sm2051018wib.12.2014.04.30.01.18.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Apr 2014 01:18:56 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Apr 2014 10:18:47 +0200
Message-Id: <1398845927-20570-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH] lmbench: inherit autotools-brokensep
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
X-List-Received-Date: Wed, 30 Apr 2014 08:18:59 -0000

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index 267f75e..41db150 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://COPYING-2;md5=8e9aee2ccc75d61d107e43794a25cdf9"
 
-inherit autotools
+inherit autotools-brokensep
 
 PR = "r2"
 
-- 
1.9.0


