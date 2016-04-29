Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id D521D76312
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 18:45:38 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id q76so44123124qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 11:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2Q74tAqVablY+xajRzFTpxYk1Pi1Ptm1pjNRfOgCyQ4=;
	b=F6t+IiL2vnwXOA/R3G/Ykj31PKnqTR5Yd1nqHHgbnkJPCZhFisfUaNq6sUHiuuSR0z
	KP4JjGQ/ch5DtcK2zCs7LqCOqc9X6/OOaXndQEoO0WrHhIdu+lYlKwB1q8Vc0eEUQ40L
	X4nXM0H1u4hb05mogMsiJEbwxHRTUq0jDJElDxs7mhF2YbwpEu5LRAqm36ctqqY5JfJB
	jc4gECxzWqw/Czz6/PwZ0MOgnCpBZmG+IO0w78S+023/PTcacEs0GqKMQaPVGI9n6Une
	aRnFh2qATh0Ub9Me6Xp2rlE9aP3K8f28v2Y10M3yjk1O6Z2KQH5HgvhxpuArf21woRiv
	fq4g==
X-Gm-Message-State: AOPr4FU/IJEoY/yQpxyXsusfztrSSyem/5Vk2bVpnsCh8PmyhlR3sgA1kLJk/gEkofufEA==
X-Received: by 10.55.167.132 with SMTP id q126mr20959055qke.110.1461955539157; 
	Fri, 29 Apr 2016 11:45:39 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	g11sm4834880qhg.22.2016.04.29.11.45.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Apr 2016 11:45:38 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Apr 2016 14:45:29 -0400
Message-Id: <1461955529-4169-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH] iperf3: update to version 3.1.2 plus bug fixes
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
X-List-Received-Date: Fri, 29 Apr 2016 18:45:39 -0000

license md5 updated for copyright date modifications

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-benchmark/iperf3/iperf3_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
index 4a0f28e..bcf6537 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
@@ -9,15 +9,15 @@ SECTION = "console/network"
 BUGTRACKER = "https://github.com/esnet/iperf/issues"
 AUTHOR = "ESNET <info@es.net>, Lawrence Berkeley National Laboratory <websupport@lbl.gov>"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=062ab1bc33fae1926387ac1274cb0873"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3434c5a9a53c78c7739f0bc9e5adda"
 
 SRC_URI = "\
     git://github.com/esnet/iperf.git \
     file://automake-foreign.patch \
 "
 
-PV = "3.1+gitr${SRCPV}"
-SRCREV = "e396134952a01199326665d1df7c51ae9e62e945"
+PV = "3.1.2+gitr${SRCPV}"
+SRCREV = "4fbdab392caf6fcd77c538b6712b721a56ff31b8"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1


