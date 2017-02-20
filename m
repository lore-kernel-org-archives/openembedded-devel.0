Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 66DEB7723D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:47 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id s27so3690409wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=2I6JBGL/i64Dh0uOWnWgi5aZMS2M1pYwmEg8T4eOcxU=;
	b=gjRRsFlfl5sMDP5FGBmOaQ6PkJZ2nxcCDSZ9F4+t069GRV7jD99W5nH5OG9jPydnVd
	7q0OOvAFTLlewNtlz3ujKSAe62UaLfZTlb7yXTnGXmxYwMWK1RE8yYvukPnAfWe5kQjb
	sqwLY5RnI+ZOGQMdmd2MDacS3aESu+qpmhf3dPnAIxPjOvpq1mrqR6K0B6Q3DCPzUsgR
	CCN/8eyUpsaraMoxzJYC3Pkg4/psNJBoRd7l7hBfRTT6FuFJhYKJxmi0NN/JyATD+kkg
	joVGpl66QTxbKwRS3CU2B/A2j6yrnhdBDdqZyK5AxKxgcgf0jC1eRMZFlLGK2Lf+Se1N
	Vmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2I6JBGL/i64Dh0uOWnWgi5aZMS2M1pYwmEg8T4eOcxU=;
	b=GuxbwzqACEJxApMQTzqcQbyJg7bcqQ0KudpLtxRHV+uSgHszZHJR+VjGPtXr9UAoyk
	24I+X45uYGuJv4F2pQ4VeAnhQOcjfdftLnYImFavTu8B3zRq8GVAOH87KfRaeou6q9+0
	bB70W2BF7LqmDI4Og5G0J3RfbvpFPkXMdZMxEwAYi6tlhEtdFRFn1pf4kPLZsGHd5Zv5
	dGLG4ngBKxaswF9q7GpuS/UvCaf6eRGeNFaENfJnjB/PtxTGj7V6Huw9fN319EgXfkLY
	msk/WVp2Lb9f1VY74l6ewkRvN3B0qlxY8PYJ49vVo5rbNnBUN7wFTFQ4Le/vbAlPAFof
	2/XQ==
X-Gm-Message-State: AMke39kKLn/qL2RoTbFP/OXa53ULB22O50Q7VJSFwjXVheUwI2jgxfnjfgR/snqY1Y1HVg==
X-Received: by 10.223.165.17 with SMTP id i17mr19045730wrb.62.1487614067289;
	Mon, 20 Feb 2017 10:07:47 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:46 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:48 +0100
Message-Id: <20170220180700.29836-33-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 32/44] gst-fluendo-mp3: unblacklist - gstreamer is back
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-multimedia/gstreamer-0.10/gst-fluendo-mp3_0.10.31.bb        | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo-mp3_0.10.31.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo-mp3_0.10.31.bb
index e7c7c21..1e2cd2a 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo-mp3_0.10.31.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo-mp3_0.10.31.bb
@@ -12,5 +12,3 @@ acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
 SRC_URI[md5sum] = "adf0390f3416bb72f91c358528be0c38"
 SRC_URI[sha256sum] = "dae0d0559a4e159c0dd92b7e18de059a5783f8d038904c7de4ca6393f7d55c7d"
-
-PNBLACKLIST[gst-fluendo-mp3] ?= "Depends on blacklisted gstreamer"
-- 
2.9.3


