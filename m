Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3F5C55171
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 08:15:12 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19958.1785658506968936430
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Aug 2026 01:15:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HcO1Gc1e;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso24724115ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 01:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785658506; x=1786263306; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EqNRmbIrWpHSzR8QUYmrCXEbZ/SCqAttlyDABuX3zZ4=;
        b=HcO1Gc1e2HlpkwuXf9DnYqYHSZbR8MDtNLJd6JNiCYdo1zxsms7GJF5Y7WhA6iOI+t
         DmdoLI/WUILIEI9DGpVzteWZ33RnsL0FTmlAbBXNQWIPG5/DRv8+YzLNPmqDGv47GRI2
         uqWAUwoRL2QfOZBMD5hVMXKW2t7fMDbs348Q/wDDij4d0xkvfmvujQkHBlIHzs1mIokC
         vjjpMfirRt6b8mwhTEsUviH3WpJwfCtuf695lZ2ZFa7J8eMDqvuqVVEhkF7ymqz85+vW
         wqoP0Zx9Q7dsfuIJHbZFsiXqRop1y/4iJkcRmHVBEnOpJySbzbDsP3PLF7CZrpevhFQd
         zqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785658506; x=1786263306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EqNRmbIrWpHSzR8QUYmrCXEbZ/SCqAttlyDABuX3zZ4=;
        b=KOZR2W+mJegiZKlK+9yq0px7x96gxMYRowsqq2/r+cynBKBp0y1gS42Wkn8D+aUF+O
         9pkljPnDFg0leU0jRRjzQ5fjp+Z3duL560gQ0ZE6MV5p3+xFTBo4C6ulI4M37io9gx+6
         MC1KVXi8Ycla39MsC2g8LBYBMP7qG9cCby4hShHD3iyyWhnadB+EfH74hlbPjcx68uTi
         qLg2mbQzXZCYamqNctnOf167Ucp3KdHqm62RIsoWeLl10OMzsaxIfWgqTw03iT4nBqyG
         UnNYK3vFXDmRWdO9NXn++o4nzcenaAFto5LeNLi2cKIYsKKTisU/aIRIwK7B339RT+Vz
         JF4w==
X-Gm-Message-State: AOJu0YzMBbwoYOB8xXgX8a6CoeCmYK1I+wk8do8zdXBe2fYvlcA1hZhA
	xbbr77Mw3JY4HeAKLMMcUXTPHk861YZfLHNR1PdFKsmYDoZ8829EiMJ/RICN0A==
X-Gm-Gg: AR+sD13WOmathW1n7DKSUGVjRdSP56PVvApH3nh8L+lvGpmufzs0Lshz/3ts4NEbwA7
	kXLNhSEdTTj8pF2LGtllKj4LFBDPrUWCHU6daPKtiOUd9g02Fiygd/bQjfsr0MBSunIL9/EL7qg
	phvtH+eKWyfLv+s4LIA0K/56ZU26VnkJwuwB2GEuIj3psDtVcim5tnITbHI80zg402gFSM6H35B
	FrSjHDqZqoez4akJUQ/oOux71j0edzPpCPg7/SF7WECQTfGcvQsXCWyTpeXZ/Lc6oh+WH1eZNSQ
	eh09B2i2RBvQSLae3Aj0FBYtLJgb0KA26dpqNiMWssH3bPSVivkEdTNd4O2WzjuO1tJrlfjw0lf
	KdRlB0WjKi0ufJQCPlbjft97xT1djjP2LZDLSAo4ujDQcbpgIRsMq1waEGkorSCYiQz6us/Bj5+
	QnTRL86eP4zLTwWPgm2rb8vQYmPXenQhDQCsmEAc2Y24AR+ELTKIprAWRjhik2e72uetz2p4r9l
	Q==
X-Received: by 2002:a17:903:46cb:b0:2ca:b1f6:b0c5 with SMTP id d9443c01a7336-2d052451c6cmr62811155ad.38.1785658506293;
        Sun, 02 Aug 2026 01:15:06 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae19fb5sm24371085ad.9.2026.08.02.01.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 01:15:05 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][master-next][PATCH 1/4] libmatroska: include tag in the SRC_URI
Date: Sun,  2 Aug 2026 20:14:55 +1200
Message-ID: <20260802081458.525763-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 08:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128652

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.2.bb b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.2.bb
index a368c90d19..ed7a7af97d 100644
--- a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.2.bb
+++ b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.7.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "libebml"
 
-SRC_URI = "git://github.com/Matroska-Org/libmatroska.git;branch=v1.x;protocol=https"
+SRC_URI = "git://github.com/Matroska-Org/libmatroska.git;branch=v1.x;protocol=https;tag=release-${PV}"
 
 SRCREV = "280281a8aeb69881f70ee3d6ff26aa6d964365a3"
 

