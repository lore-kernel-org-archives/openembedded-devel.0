Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9CBE56067D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:05:14 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id s5so6266409qkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=DusPNIybG2k2ZCtL/4mhBgnaHsZBcP20g4/Uapkm+oc=;
	b=SGW1rbuJM+Z0MQ8TzUAgvAIZSVxe3aOBE0aoSF0NhjXFePZJQNgul+UIdnSEV5AjPI
	OUHXaQDj6mfRCbK66jt6yCMNzvVLcR77aqNOmf7pcQoL2+8ZWBDE5ROqaSatdKcWo/TS
	pa2yrOx8y2bNyHj2veoJSYCDZlLPdRZfMKyXOOWVRyZapqKFlp9908MllWUqDwEE4Gjm
	OavRv0s4CzLLXwKGSsR2FJa6njDFSYUgJiyLI45BVOA7VQl4/KZjIQtjLSkJ94eJQFUT
	hu/wWbKi4vLZKug63mDT7AqlvxgAySf2DXTq3NBs5TacH5K0t2WpLsFvQAojGTekrLKr
	b8dg==
X-Gm-Message-State: AD7BkJKx/oomjBeJbrDq/Xl/XWmna0nI6XtbVHPjVaOCOfZOUzIuBYg1O8t4iUQqxy7D1Q==
X-Received: by 10.55.73.199 with SMTP id w190mr23256256qka.77.1458997514954;
	Sat, 26 Mar 2016 06:05:14 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x6sm7678649qka.16.2016.03.26.06.05.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:05:14 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:04:30 -0400
Message-Id: <e58672d1e026389eb5407ac75a7d88f84f7e7568.1458997082.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
Subject: [meta-python][PATCH 10/30] python-daemonize: update to 2.4.6
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
X-List-Received-Date: Sat, 26 Mar 2016 13:05:15 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-daemonize_2.4.2.bb => python-daemonize_2.4.6.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-daemonize_2.4.2.bb => python-daemonize_2.4.6.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python-daemonize_2.4.2.bb b/meta-python/recipes-devtools/python/python-daemonize_2.4.6.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python-daemonize_2.4.2.bb
rename to meta-python/recipes-devtools/python/python-daemonize_2.4.6.bb
index 1d3ba09..b17b366 100644
--- a/meta-python/recipes-devtools/python/python-daemonize_2.4.2.bb
+++ b/meta-python/recipes-devtools/python/python-daemonize_2.4.6.bb
@@ -12,5 +12,5 @@ RDEPENDS_${PN} = "\
                python-resource \
 "
 
-SRC_URI[md5sum] = "bb5b341b94abc15d6788002cafaa9da4"
-SRC_URI[sha256sum] = "c21a94cd676d3fbb718af62e6f22209afc7000a9588169b6fb779d62b04e2378"
+SRC_URI[md5sum] = "17bc788a8524b104d4639a68623461e3"
+SRC_URI[sha256sum] = "8aa66bad9aa10c682302a4ea9675874191304adeb3239e0776f1ca3041d30619"
-- 
1.9.1


