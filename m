Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id E0D937F37D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2019 18:44:06 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id d26so6276035pgl.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2019 11:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=y/dDR7/07b/OiNjnzx6OS722M/b3TQIJe6vtx+PauUI=;
	b=Or/qKFTC2hxugeY/O67G/Qnxt9tis2l5q4yOVnBBxd3GN+GN1Ree9BSKjKS0qR0KhX
	hoXTMuPS0bg2/4vELFjJ6cpi+SEk0l6BkkpGX1WjidrCHSxvMGzlItLpMLeXOTvamOSN
	rVNKeQp1mUe5ewHTIBy3OHahGTtNp8N/cHowPQylu84D1BE7gnjcJC8UuzNGYrXo7GMJ
	lz3+/hLoPU9oakN9063txbi8fPnT7sRjui0hEQPOKPjHTmLQegT9d8oaC6bWtg+cPx8C
	bEiCzF7f+1uADN5rz2jmCT098BNlembdwRMp+O0V8P+0II96aiAmj/l99vBhJlALuoXr
	ZBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=y/dDR7/07b/OiNjnzx6OS722M/b3TQIJe6vtx+PauUI=;
	b=Wh/gil/qfZLfkxcdjchH5CHOVdusFIQBPbDwEAKCbJIndYer1NSVXV930mZw1fHkxl
	bFJAapTaylTn1aonUi6Nc3uSSi+JoPbluumq55Wund04dAzOHb9uYjKd7/dmWlRtUCNJ
	cYkRpVLdWXSnt2RFD30QT0c9YWbnN0l/O3Q0JSLBierFybZ0k7qTpjywH7OxiA7swihZ
	wWDS2/MDISBPD2Skxa/gUXyT4f0Ey7pPcdjtTU4XM7rjhu/P6WDRT10o/ar5UuG0nqRt
	ml++bhC321Zn/BgKVYcw9SwZdbt1eIlzuijZICnsOjxVl3sCFACA9o/SL3mdV3bl0+6n
	nBdg==
X-Gm-Message-State: APjAAAXQubrH05DFRp9Z09biwIe4WLraX80sCyPxqjj5F211l6/ZuuTb
	oMmLnprybfBXHVWMq5YFsP9W6P86YhE=
X-Google-Smtp-Source: APXvYqxtP+XUUbzn1OWKc+OewnpN8owp0L5Qx+ONJ7dLuJBO/apwgYBBPYo89GM5f79jRnBXSNQPzA==
X-Received: by 2002:aa7:8d95:: with SMTP id i21mr3678537pfr.161.1570819447021; 
	Fri, 11 Oct 2019 11:44:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::7275])
	by smtp.gmail.com with ESMTPSA id
	a13sm15395535pfg.10.2019.10.11.11.44.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 11:44:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Oct 2019 11:43:56 -0700
Message-Id: <20191011184357.760697-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 1/2] tinyalsa: Update to latest
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
X-List-Received-Date: Fri, 11 Oct 2019 18:44:07 -0000
Content-Transfer-Encoding: 8bit

package tools binaries into PN

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb
index 157e4c91f1..8b86f82430 100644
--- a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb
+++ b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb
@@ -6,7 +6,7 @@ SECTION = "libs/multimedia"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://NOTICE;md5=dbdefe400d894b510a9de14813181d0b"
 
-SRCREV = "67b9210d344c34e8d1aa0cfe638abce71c5221ca"
+SRCREV = "8449529c7e50f432091539ba7b438e79b04059b5"
 SRC_URI = "git://github.com/tinyalsa/tinyalsa"
 PV = "1.1.1+git${SRCPV}"
 
@@ -19,6 +19,3 @@ inherit cmake
 #
 #    unresolvable R_AARCH64_ADR_PREL_PG_HI21 relocation against symbol `stderr@@GLIBC_2.17'
 CFLAGS += " -fPIC -DPIC "
-
-PACKAGES =+ "${PN}-tools"
-FILES_${PN}-tools = "${bindir}/*"
-- 
2.23.0


