Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id CDC53734B8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 23:46:21 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id p100so216383lfg.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 15:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XasETbWg/Wj+PiWx/pmuQSK4IrwsPZJMeO1zi7GniwA=;
	b=Skm9XXzpk2Cj7PrXd0//xUe0p+OEpousGH5CXcdpG2TBLfPk/S4Evr+ingFGlFqgHY
	wZE3ROGq0E5C1KMiE8x/1hmuEXXsgg9WbK98LOHMhFXJJ4N8+s49mulEiNjQ3JbePclm
	+NvEcEzvXmitK1DNNU4C2f5gNvLGT3oywQG1ZKV30g+VqzSXffR5Y8ewfo4qR9ja3963
	IwToXJukWtl/2cyGYOq8+m3ohllU6SwKZjsAPc9ZAvpMbGM2LYjJthkaN4JyyWMwxfaB
	XGPLoAd5pRVEKmuEqAbGFouL0iFDj0DNzs6UWQhbi97WT4iP2f+nBYR+Os23HhRRk/pI
	uiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XasETbWg/Wj+PiWx/pmuQSK4IrwsPZJMeO1zi7GniwA=;
	b=SWHutk1OCO04NMSGlxmRuauSxNes2XRUvCEOAzlauQKitVyhRkupsU2K3b5baIDVxS
	ka/XQT9M3kL2MkfQY/1/r+CdB2TzxM1fzBzm4nPAfyQJ/o3q5o06Zgl9XZfaEocTGm6W
	wxVTZwfzKDh7hd7nj4+x9HYGDLHm9Znuyolxa0+4oRd0T0BwuZjTJFbhNc30JL/VDqj4
	JSWJ0cwbH3Qyh7jFCqYyUuZ6sJy8QHP+p5hk9+UFjTwSnqp7TMBKVmdLfRG+U7UZeUiT
	Rk5s61LarulQPMqMBpsHalPFgLjPICm5rwf85ofo7HoahqDRrEpVDxwPXgd9H6mgBqWQ
	16Qg==
X-Gm-Message-State: AKaTC00G4BgMDWFrybkHatEwq55Sk7CyRwL0k5jyNm3IiYIaiZJ1utI/NmklFp3XFoCa9g==
X-Received: by 10.25.125.132 with SMTP id y126mr33317056lfc.86.1481672782528; 
	Tue, 13 Dec 2016 15:46:22 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	z26sm10269595lja.49.2016.12.13.15.46.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Dec 2016 15:46:21 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org, Martin.Jansa@gmail.com,
	ross.burton@intel.com, raj.khem@gmail.com
Date: Wed, 14 Dec 2016 00:46:12 +0100
Message-Id: <20161213234618.31312-2-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161213234618.31312-1-ricardo.ribalda@gmail.com>
References: <20161213234618.31312-1-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH v2 2/8] opencv: Metapkg should not rdepend on -staticdev
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
X-List-Received-Date: Tue, 13 Dec 2016 23:46:22 -0000

Otherwise the running dependencies will grow considerably.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index fa2fdb6e6c31..cf41d894cf7f 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -104,7 +104,7 @@ python populate_packages_prepend () {
     blacklist = [ metapkg ]
     metapkg_rdepends = [ ]
     for pkg in packages[1:]:
-        if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') and not pkg.endswith('-locale'):
+        if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') and not pkg.endswith('-locale') and not pkg.endswith('-staticdev'):
             metapkg_rdepends.append(pkg)
     d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
 
-- 
2.10.2


