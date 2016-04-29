Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id E65EF7391A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 17:43:37 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id f92so45785562qgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 10:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DZVtYKtppiXW1UC51Uins1CPh/Hy7lEY5SkEW0DtwOc=;
	b=NL0NfoazDFh+yA1z6QsvpCncrhV+UavAf8K0UyIfNB0zWl1FXdCti72ERVjXYxFEUU
	Ev3CTg5H3Sez1IDeQO1H5b0KKYBeqsqgbqLJox7o9R3uN71E6JIJ14OKziBVawYBJmRg
	Si+n7dQbJOXm/XChTietQO7gGHPCNH8Kevd3LPFnuRAWC6fwOJr23apjX8jRdLiy8yGI
	vJAK3myYHQ5hiXyZfBzsxjL+oTt1TorKELeYhySx0hyJfsrCe9gGwXnVK75UozLwdBH0
	3P/I6c+1mQRJjwe+1OVHdJ1pesQ/OVwCmobAy4m1o5zrrmEUSy1F/wcPFgdCZFsutil4
	IQcw==
X-Gm-Message-State: AOPr4FUBr1aaVprpA+bEzWsz11v8xZ4fbVJuvSL92DzEsypQW2+EZOgoMuT/gqAKXjkRTg==
X-Received: by 10.140.97.202 with SMTP id m68mr20044104qge.102.1461951818548; 
	Fri, 29 Apr 2016 10:43:38 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	o78sm4745799qge.23.2016.04.29.10.43.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Apr 2016 10:43:37 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Apr 2016 13:43:22 -0400
Message-Id: <1461951802-27487-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH] fio: update to version 2.9
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
X-List-Received-Date: Fri, 29 Apr 2016 17:43:39 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-benchmark/fio/{fio_2.2.6.bb => fio_2.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-benchmark/fio/{fio_2.2.6.bb => fio_2.9.bb} (95%)

diff --git a/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb b/meta-oe/recipes-benchmark/fio/fio_2.9.bb
similarity index 95%
rename from meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
rename to meta-oe/recipes-benchmark/fio/fio_2.9.bb
index db67173..67b513f 100644
--- a/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_2.9.bb
@@ -19,8 +19,8 @@ PACKAGECONFIG_NUMA_arm = ""
 PACKAGECONFIG ??= "${PACKAGECONFIG_NUMA}"
 PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 
-# rev for v2.2.6
-SRCREV = "f52c9691bc8c285f3445235c69acdfd6de7f9b82"
+# rev for v2.9
+SRCREV = "fe8d0f4c54f0c308c9a02a4e3c2f5084e8bf5461"
 SRC_URI = "git://git.kernel.dk/fio.git"
 
 S = "${WORKDIR}/git"
-- 
1.9.1


