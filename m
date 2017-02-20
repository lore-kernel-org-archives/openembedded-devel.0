Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 25B74772EA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:56 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id c85so15750565wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=M4dkxTdjri2W/83jrH1ZPljIT1lHBvJKjU9mRTZ6e0s=;
	b=mO+nB7zX/KjG3bOyUzPrAgPVdxaaX/IM4SvRTlKJb6m8eqkx+Lldi39x/Ua9U/zgWk
	EXX22fcD79QrAyKLwxy3W2keXWom78CeKEmhLOz+x7CcEz/XJjuTij5ys701eJ10MnFp
	MpqNOOnZQHMgRznnnO8oA+WZc13IOD3RyDQ6jikAzILBqZWDnqKpftuCXLz79TRVBZ0R
	Q6b86JVkRIXq8pPHunuZyD8kzKZS9avJbvkXhAbeqvcdCdmRZBd0ZF/hqlgydiZmP9eU
	XmrkCakhJTVSz1DuSk+99/dkgxvMtPCDtn25PrvtyepvXJ+dYPwh6i/GTtbabzxz6b/w
	ghFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=M4dkxTdjri2W/83jrH1ZPljIT1lHBvJKjU9mRTZ6e0s=;
	b=Qr4Zdx+L2O9C4DiNaYuQzNyxSyB23N39RrcTjUhukkc74x+BP5LfShPw/G7aI85XTz
	L/cFfFj2oq/WIokSvrmK3+7AA4359wjivRz+NC9MI1Z3GgxdBOKTs9ZCv64pfB0WN++1
	7z8p7ZqVrENi//SJOfZNRsoZ61jSwZRVJ/kAPpmWjY7VOq9gdEr6tf+7Rg24p6WlXRjL
	nLCnMtDd1PK8L3lZ1X+pVjcvxn8WXI2gLKKnWfrwO6yveNptSc3myy3cEdosfnN+hp9N
	gCe4/Lj9QSgHiwAAgQdPmNHID4eFxGUC2gBVxdURD9qVPD0KcPHvXvZTzaPMauyISSO5
	Nnfw==
X-Gm-Message-State: AMke39lcGXTpdyxCbEDl6AgsFRZtu5RAlkSeOIlBEuvyczKlVqJ+G3sZ/YXUzSykvV/ApA==
X-Received: by 10.28.103.3 with SMTP id b3mr18976778wmc.99.1487614076284;
	Mon, 20 Feb 2017 10:07:56 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:55 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:58 +0100
Message-Id: <20170220180700.29836-43-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 42/44] xfce4-mixer: unblacklist - gst-plugins-base is back
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb b/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
index 2c91fa9..bdbec45 100644
--- a/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
+++ b/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
@@ -12,5 +12,3 @@ SRC_URI[md5sum] = "1b3753b91224867a3a2dfddda239c28d"
 SRC_URI[sha256sum] = "fb0c1df201ed1130f54f15b914cbe5a59286e994a137acda5609570c57112de2"
 
 RDEPENDS_${PN} = "gst-meta-audio"
-
-PNBLACKLIST[xfce4-mixer] ?= "Depends on blacklisted gst-plugins-base"
-- 
2.9.3


