Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 39B4171CCB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 12:54:03 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id u65so38969473wmu.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 05:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8HhC+uM1h/MuYLiecwwwcCkOJgvPH6lGNboSMwsb1sw=;
	b=l45pNV4Tx6r8lIzTCmYyv/JjO0jqrN756Czxros3u2t0IJuRoHcYg+Fm62faiHlqI+
	fxdksHHviClRr5whNayAJE50Qs4xVoDH2j18kaqObOH1NpuV2at4jvrWjvqRL6g0+xch
	qitU+6KSE/HDwWTDBVj8lFGyUjAlg5o62QpeQWhrwOO7R6VPIrKuAd9c/ssx7dq8F6f2
	D28AikehRDvgDpXK2k3LeFSe9RIGTsI2Uf/0+Zypk/nMaqTyv5A7h2URlY4lRn3OpfnP
	U9bRuD/XOYiiNNPE++ttAQf7VI2CQpYgnrokcY2xWU7Z8deLu8Bqi+wRlz/H1pqXJR7v
	ktNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8HhC+uM1h/MuYLiecwwwcCkOJgvPH6lGNboSMwsb1sw=;
	b=jDHa17S09G49yt4/lsRcxV1/zsdsy9X2Kut+B+xwmSWDCO89dFts0V7EYdMcclr4qj
	6JVWNcdq3jeymS7KGYP8hZerMnucCo6q5ltI3MLpB+7DjwC+I4hc2v4egOaGyv1/cgp/
	oPtUVpq45ujY3a+Hb5xn/9PmTkboaS511HwzWw/zImVxL1I7LXrfeDueoy70ll4wBG1z
	MViUqHzbcQl0m3riVROuc1H4AqEJwdl4ra5N2HoljvPFVKrROOm+V1c4S3xHWjoVDmR+
	nLj6MYOmY/6VEYLF8EQ1+Xcy8eEc5rLXPECU/y6XvAS1z3OO+pmyxs/n2iAHP2m3I3NU
	1X7w==
X-Gm-Message-State: AODbwcDSy5mNC3wZkIFlSRYFY2U1q3lPt0kNyUWZvxXXgVh/hFhUH1PT
	4nvyS5gwdfrKuw==
X-Received: by 10.28.145.203 with SMTP id t194mr833535wmd.16.1494507244616;
	Thu, 11 May 2017 05:54:04 -0700 (PDT)
Received: from localhost.localdomain ([151.68.54.167])
	by smtp.gmail.com with ESMTPSA id n99sm73028wrb.62.2017.05.11.05.54.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 May 2017 05:54:03 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 May 2017 14:53:58 +0200
Message-Id: <1494507239-32152-1-git-send-email-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.7.4
Cc: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
Subject: [PATCH 1/2] libndp: switch to github uri. libndp.org is unstable
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
X-List-Received-Date: Thu, 11 May 2017 12:54:04 -0000

From: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>

Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
---
 meta-oe/recipes-connectivity/libndp/libndp_1.6.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb b/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
index e06ff7f..7a8ba60 100644
--- a/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
+++ b/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
@@ -3,10 +3,10 @@ SUMMARY = "Library for IPv6 Neighbor Discovery Protocol"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "http://libndp.org/files/${BPN}-${PV}.tar.gz \
+SRC_URI = "git://github.com/jpirko/libndp;branch=master;tag=v${PV} \
            file://0001-include-sys-select.h-for-fd_-definitions.patch \
            "
-SRC_URI[md5sum] = "1e54d26bcb4a4110bc3f90c5dd04f1a7"
-SRC_URI[sha256sum] = "0c7dfa84e013bd5e569ef2c6292a6f72cfaf14f4ff77a77425e52edc33ffac0e"
+
+S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.7.4


