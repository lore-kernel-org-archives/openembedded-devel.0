Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f46.google.com (mail-pg0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 49D3C60938
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2016 03:59:55 +0000 (UTC)
Received: by mail-pg0-f46.google.com with SMTP id p66so27325521pga.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 19:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=c7f0TLVUt4b6iFxVJ4B5gIv9Bk5+nG+IbUJKN55oV0c=;
	b=KoFQCOQ15+BjLGk2x8AVTCwtyqOO4/NslqHpa8KBgS/kS2ByGn1eKeiwBRqduuhtvk
	axZsvSCXFUaBXF1VNxlw3aFsZbvvWSVaDJnfuR84vCnXh2sY7WffHd7kuVllCGMqHObG
	9szWrQY2TRqCEUIDenxUtmjmnWQkB0/CCrWHqRdXhP1TWJ4x1Dn6LTb/P/M5WXBnj1Gx
	kwLXAeT22zeFeO0G2sZrSevioVJzs6IwFrlIdvBC5hdFPYaDmdDz/Zft34V3HQwuTV9O
	uxPv8nlYLtUDwlr86Q0dd4ULChSg0ZY9MEgEYaWhks18Axpbfvdiz0JA9b0ke+96La+4
	wROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=c7f0TLVUt4b6iFxVJ4B5gIv9Bk5+nG+IbUJKN55oV0c=;
	b=k4YDwKnVl+ErOrlokWqMgckb0nOunIqP12bGPX45vK0RM5y4nlG2m6u+HRvgYR2nAW
	x/QoCZXUluFVpd6dZIUgZd8DxZBy8jTcCEmi0cN5RGpYY1BmbymaYVz6DyymxktycU8t
	T6BxNHOEZx5Cih1SuLVoRBminRhQj0XbCl54Vp51NXol8gxgU9GPCCAI36ZFdeUfxJ07
	hFMg9Z76oJayRDRS8mzcBmqDBR1c3PeBf5aBiURk6la8E5FQbSqbn54dsGNYhfrbqgAA
	bYajtIz46jZhvezMlM5dRqiuxEKZKJhf+bBSlFHLcBavBCzMTNfjWBgJ4DWyDC3Ud3S4
	HqTA==
X-Gm-Message-State: AKaTC00Dn/SlqsAYmaH4AYOgMa1czoaMZ3etPdUKdeB5o/at3f/A/0m3mQOIk1v/qgvzJQ==
X-Received: by 10.99.174.75 with SMTP id e11mr1844881pgp.89.1481860797327;
	Thu, 15 Dec 2016 19:59:57 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id z9sm7629146pfd.29.2016.12.15.19.59.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Dec 2016 19:59:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Dec 2016 19:59:45 -0800
Message-Id: <20161216035947.18909-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-oe][PATCH 1/3] zlog: Add recipe
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
X-List-Received-Date: Fri, 16 Dec 2016 03:59:56 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/zlog/zlog_git.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-extended/zlog/zlog_git.bb

diff --git a/meta-oe/recipes-extended/zlog/zlog_git.bb b/meta-oe/recipes-extended/zlog/zlog_git.bb
new file mode 100644
index 0000000..51c746f
--- /dev/null
+++ b/meta-oe/recipes-extended/zlog/zlog_git.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Zlog is a pure C logging library"
+HOMEPAGE = "https://github.com/HardySimpson/zlog"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+PV = "1.2.12+git${SRCPV}"
+
+SRCREV = "13904dab2878aa2654d0c20fb8600a3dc5f2dd68"
+SRC_URI = "git://github.com/HardySimpson/zlog"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig
+
+EXTRA_OEMAKE = "CC='${CC}' LD='${LD}'"
+
+do_install() {
+    oe_runmake install PREFIX=${D}${exec_prefix} INSTALL=install
+}
-- 
2.10.2


