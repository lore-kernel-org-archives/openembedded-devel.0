Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 20CA2719B5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2017 06:03:56 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id n124so50697702lfd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 22:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=HWFf5sJbFr0e1JGcR1QEAKFMOypgTJkB10x+knV96Kg=;
	b=hM/KfYc0Rw4K1/CztSAITAxHjPTHh0y3vXtruCsrwC5pStYhy38fPFmTla52JuCM7E
	aHIR9G+uvV08NbqW/zkXYX0J09xl94YJ6K+pE0inG0PtuB9U9QTd8bHAshLkKnERtiTQ
	29msuQNfdZ3KXY2nuPA3nzlH2Lu54+/nlGy4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HWFf5sJbFr0e1JGcR1QEAKFMOypgTJkB10x+knV96Kg=;
	b=tZ2mysHDcqIWF+tC9P63YOjteq+sgeo+jQzwRGb0b1eegqdalrHUkU8NQbov/bS9Z1
	VNGbZjSd8+UsrA6ldxgigCYZny/CpV2CDb3lel7tn/q17QJcUNj4JY0VFAgFXNzoJXkb
	pxgoZoQjmxgy3/w7p4mthKxCYNToDL8xs4OVoqyFB/YmwvCNuOAlwCFo5jK9g8Ojj1ys
	XPzonVu7aBXEYS7InBGKA7u6zjkYLiuVi8M5BjBmN4fL2Ng8oQp+0Kx+WoFSvGjSdzJA
	Ad15ADCq45i9Mg0k4ICob9gtHz1PbIQiJrm0b0JcO+kLKMASiKqi5J2yyF8MMp6DkV0m
	3/OA==
X-Gm-Message-State: AIkVDXL/gWMdCUwiBCyjfcJWHwrYXdkhIP8XYSHlOmRVu+TnkEocxgk1BnioQf3HbToNwXxj
X-Received: by 10.46.87.73 with SMTP id r9mr6021647ljd.22.1484892235891;
	Thu, 19 Jan 2017 22:03:55 -0800 (PST)
Received: from localhost.localdomain (a91-156-68-16.elisa-laajakaista.fi.
	[91.156.68.16])
	by smtp.gmail.com with ESMTPSA id k7sm2869161lfe.26.2017.01.19.22.03.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Jan 2017 22:03:54 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Jan 2017 08:03:49 +0200
Message-Id: <20170120060349.15051-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.11.0
Cc: koen@dominion.thruhere.net
Subject: [meta-oe][PATCH] fwts: upgrade to 17.01.00 release
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
X-List-Received-Date: Fri, 20 Jan 2017 06:03:57 -0000

Update PV and SRCREV to match 17.01.00 release

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta-oe/recipes-test/fwts/fwts_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-test/fwts/fwts_git.bb b/meta-oe/recipes-test/fwts/fwts_git.bb
index 82ed5ecf0..6c4cd483e 100644
--- a/meta-oe/recipes-test/fwts/fwts_git.bb
+++ b/meta-oe/recipes-test/fwts/fwts_git.bb
@@ -5,9 +5,9 @@ HOMEPAGE = "https://wiki.ubuntu.com/Kernel/Reference/fwts"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=16;md5=31da590f3e9f3bd34dcdb9e4db568519"
 
-PV = "16.12.00"
+PV = "17.01.00"
 
-SRCREV = "d38fced7db86e5483d5c2e634ee1eec98620d5b8"
+SRCREV = "0d44a57aab82c9861b6d36d73dc2c7c8a6696c21"
 SRC_URI = "git://kernel.ubuntu.com/hwe/fwts.git \
            file://0001-ignore-constant-logical-operand-warning-with-clang.patch \
            "
-- 
2.11.0


