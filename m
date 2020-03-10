Return-Path: <jpewhacker@gmail.com>
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id A788960B1E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2020 19:50:36 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id a14so10039084ilk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2020 12:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=35AA0Rq5WL5Uvyq+hwnYnJnVltSOGwI9gR0Air+sXpE=;
	b=Qi+o4YsqWj5DhiMuwjRsUrHVWtlZxYYnRMAOGRFgZGQJ21yxdf5E3kupit3npx2+XK
	+GFlbRp72pY9FfMzcXCkfQGH0weDVswDRK4qH1s9W4U9XWCjB4YPNyDdY9A8zAkblj7C
	HKtce0ZlXR7Bs5ouXqKGawQl5U0HM5xUBlcHwflAFJ4n3UaF9fEIWTlCxfzrH5tdSYW8
	f6GLgaIWTjB21L9rOKcjYetn2MLJ4mRl/CvGPGBOjZF26B+dW4uK9YI/RSK76f7dRTYy
	MJ2/WlAIxQZuCZS7wETR3c2Xjs2uF4h6YdYFURKG/3AkRX+8DTXGl1cizLzA7ROGfCYG
	nfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=35AA0Rq5WL5Uvyq+hwnYnJnVltSOGwI9gR0Air+sXpE=;
	b=pyR2k2yqm/B6aGgwc/oxlKdYDydo8YL0bnrNeDBQeLXZh6FrNwWJvY3W2H4bHDCCw9
	jxgrqI37bctZFvDw41fhpcjwO/SqTh/0BBxTnYvHWU1bTK6/CStDeNQdDKbO4xBr/NhL
	5380GuZDgrPC/3Jz1LD+DohrJr3N6rum9pWy538W1aKIwpTjnjC+tQHVlKjFdDGNi0HL
	fHhOtzpnX1a8UFe0WTu28rRKZgfjuiIdt7ticGWTP2PogoN1ov2HX0O7QA8J9tyZgRxJ
	ix5URKOGDAZqi2fHq+eHfsgigfX0wLqnMXdT2oZrfcVsC2LDfuOresWtjvzYVd0FHM3S
	ABWw==
X-Gm-Message-State: ANhLgQ3qEg38qHXI/+G0CqKX5H/5Fk1LcdbVLcw/Milp7PLhIsVCSpwV
	lLeQ/0Fsq/LZtZuBaZLmypVAC18i+EM=
X-Google-Smtp-Source: ADFU+vsC3Rk+i7HjRe8qypcHAAlQXVO3uCd+IKKry6jPtEIdPxIIwnbi4U7bryFf2otUQ4LR8nMXag==
X-Received: by 2002:a92:9ad3:: with SMTP id c80mr22396416ill.141.1583869837190;
	Tue, 10 Mar 2020 12:50:37 -0700 (PDT)
Received: from OLA-8C37N23.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id q6sm2708141ild.70.2020.03.10.12.50.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Mar 2020 12:50:36 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Mar 2020 14:50:25 -0500
Message-Id: <20200310195025.4789-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] glmark2: Update to latest version
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
X-List-Received-Date: Tue, 10 Mar 2020 19:50:36 -0000

Updates to the most recent version of glmark2. In particular, this fixes
problems where the benchmark would fail to start due to improper
handling of EGL_NO_DISPLAY with EGL 1.5

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index 50b553c80..6d20bbdaf 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -10,13 +10,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 DEPENDS = "libpng jpeg udev"
 
-PV = "20190904+${SRCPV}"
+PV = "20191226+${SRCPV}"
 
 COMPATIBLE_HOST_rpi  = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '.*-linux*', 'null', d)}"
 
 SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https \
            file://python3.patch"
-SRCREV = "24a1139dcbfd86bd02065316eaa90559e39374e1"
+SRCREV = "72dabc5d72b49c6d45badeb8a941ba4d829b0bd6"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


