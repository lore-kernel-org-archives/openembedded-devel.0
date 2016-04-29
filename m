Return-Path: <sujith.h@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8CF8B700FD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 12:39:08 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id y69so47507829pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 05:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6KybHuxoZAEhsMaB1pZZGuf9bXtI7ZVCFlVdU7ot7+c=;
	b=S1DfmF1SuCqUGsmEZLqSun+4/nAsMmFu0pJZqlq2GEzUxJXElHT5dU8KKtIdSmBCuT
	KEXcjTZBJt1dfkf1YdIM9FQ5PAiyc1tFOG8hBao4MeSIawmjr/ZN7iw2xKplIJ0Zl9WX
	+plqLu8KEEujuHbr/cQxwW7qiu9ZA6t0QKJLkh23iFwX/ac3yR67tdvknr1+KDcf6LCs
	BL2wI78iAryAPH4lpPKQbp3y3pSclPMQ+DJ/2AAGsib4DXWf7y/B4w1vdlxQeonUuYsE
	AqlH53QdkWXnNgCHFVWWVtSbRrEtHnQa8VNWxF/FDtL4tLHN4PkaAoELC8GTFY8wvORi
	J9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6KybHuxoZAEhsMaB1pZZGuf9bXtI7ZVCFlVdU7ot7+c=;
	b=Mib/HCGAozD0JtX1Lt6oGD8hJiA5YoMy6rehldcDLud9cmqfa0NTH/3QC7spTr5QBF
	EGmvYebe8cImCfXAgnbCSmbGxoU2jldV2wgz5qoBMMfYJCBRP1txuo8FJXhBGwJ/jv3h
	8N4Ix8pja8iboMw1PFIgV5quCEHXRRp5ffL9xN+OU0f/9/6yQn1aOAr8mKdCM1vufBYL
	vvyQUd5xnPCFBcoXTOFbIWXDtncyDtLPBVIZOKVNOuPD3/chgCp2n97s9mRcdycL93ml
	InGDolEDr+MHjQylEmqXaLz9AckVwr4eO+3VOOOoCH7HpK0TMzqpx4uDJcrop0ifpZBB
	2c8w==
X-Gm-Message-State: AOPr4FU3YMU2YgdD8eZlqg81pEeJyg/BsVkUkQJVIDn3V1w0sn1q7fU0dcxj8IQYBerhKg==
X-Received: by 10.98.93.5 with SMTP id r5mr28326149pfb.15.1461933547707;
	Fri, 29 Apr 2016 05:39:07 -0700 (PDT)
Received: from kdekidd0.inp-wifi.mentorg.com ([139.181.35.34])
	by smtp.gmail.com with ESMTPSA id
	127sm23176454pfe.72.2016.04.29.05.39.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Apr 2016 05:39:06 -0700 (PDT)
From: Sujith Haridasan <sujith.h@gmail.com>
X-Google-Original-From: Sujith Haridasan <Sujith_Haridasan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Apr 2016 18:08:55 +0530
Message-Id: <1461933535-5152-1-git-send-email-Sujith_Haridasan@mentor.com>
X-Mailer: git-send-email 1.9.1
Cc: Sujith Haridasan <Sujith_Haridasan@mentor.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: [meta-multimedia][PATCH] sox: dep on ffmpeg, not libav
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
X-List-Received-Date: Fri, 29 Apr 2016 12:39:09 -0000

From: Christopher Larson <chris_larson@mentor.com>

The libav recipe no longer exists, in favor of ffmpeg.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Sujith Haridasan <Sujith_Haridasan@mentor.com>
---
 meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
index 3c688bd..4b73aa3 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
@@ -4,7 +4,7 @@ and can apply different effects and filters to the audio data."
 HOMEPAGE = "http://sox.sourceforge.net"
 SECTION = "audio"
 
-DEPENDS = "libpng libav libsndfile1 libvorbis"
+DEPENDS = "libpng ffmpeg libsndfile1 libvorbis"
 
 PR = "r2"
 
-- 
1.9.1


