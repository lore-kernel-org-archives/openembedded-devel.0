Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B3ACD4F28
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:21:05 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17896.1763014858618366839
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:20:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g3EWIamG;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3437af844afso425632a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014858; x=1763619658; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dErGhxv1Y+NNt3mPbODrrOEY8YzTBKwEibNf6f1wTeU=;
        b=g3EWIamG1snY72RdEdqSTGN4eET/CSXcetiOv/rtHxeLRjcg95z5vhAJG9fdoTTsQs
         cbXIPDIS0nbzgXsefDcJ1OVjbhsTkVdz2AtgXEfGMdbsixvLRBIXr0WxlbsX2aBuLFui
         /Bcf5rRAkotMHDNjuGTLb3GS1jRC5AoUMwgEaAEy1yl1ztyNi/maC2Wig6r2dqI1MHew
         chLOyMBBDpCWXoR0sRjWFUeqrOLT0S8P4AQpWBu/t0WuXzbwGfEQdCQuDgbin/SFth6r
         FjWg5qbl71mf2hzBjalC+UzP2OtAwnkrGllH/Y+NQlzk0557GhHCw3NcP8F2AMXifYZ0
         nB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014858; x=1763619658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dErGhxv1Y+NNt3mPbODrrOEY8YzTBKwEibNf6f1wTeU=;
        b=CaE6t3B2lSwR9nOFPKOTN96a1Imqpaj8VsDd5CNUyeQzQ5LWYmO791z5yoaZ3z1LmO
         HGijxn7ihvk6BOfp9k/TG/RrUO7gykdpjeMGkPIHAPYO9N/pRiS0feCoOFBSyELrwgst
         ggDF2FMXZ+NzipX1agla71nYNgUBIo0rDZwk5vTtnp+Es+hWEXvzhufn9RHh6caJsG6p
         18ac6kD1rm2YHUSppjc6BPygZNU7IaTTOrBg+h/DBTKFZN83QZ8K+Bkvg4oyrgprEXeq
         oUVTMp9lMirxaw6HMih/JDSdFdioegr7avtS4zEN1J7cd6n7XV3UdHm5in2YXvDAMk5z
         zgJw==
X-Gm-Message-State: AOJu0YyF2LpRVr0TqkDEICePwmHVXkRx7LsYx2pMQKFUqZVt5U2uPYdg
	/PpkE3C1CuylbigMCZ/v4q6exV3bMw0taHVLfDz7QBanLd/gprxkXuhIf70xJw==
X-Gm-Gg: ASbGncv1ElnlRVI9v9Xrp9suJKcn89SG9sgCFhFx62oarSQR6bCWesJU88sSemOGdUX
	QGACkQ6QwLTlrRQR+x3Ex0BKxdnjpmtbzWiz4koFx01+HnWDMVU5WJ48W3pQhzWGgg+8OJ/U31e
	QkBbQ1ZYzgD1CAZhwhuXradmCsBp6LBVJm/0uSBVPDkrp7PvspLYcHxCXx3t1DCq8z2q6XkdbG2
	9TfC9LTujUiKBDytQ6aIoIgTMPyoI8tAoj7f+XsboBHoUsOJ7IqTi70cvs2PLtJzuo24AnvuzFg
	6Xby5hF4qu94Tbf7gF0UKygxMtkT/Lkh9PyIXRYDVonnaqNrkt5GZy7JUzRIpcyJ/WpFbi8RPQ4
	Q+MdA4rqL9253TEc2yGskQHCJP1pCSqXTQ2SxSk6oRlo9cFvNsAqj1bzaszlqiAq5co+s/MXVzI
	+Y2GqnDgv2bqCxtA==
X-Google-Smtp-Source: AGHT+IE05k5EYUS4elrWJuhCzJvwoT067hEL9bhk0iFeNqdEEBBsp2WRTwBc+lRH/zdgjj9vvqmzuQ==
X-Received: by 2002:a17:90b:388e:b0:341:124f:474f with SMTP id 98e67ed59e1d1-343ddee7a60mr6541768a91.32.1763014857808;
        Wed, 12 Nov 2025 22:20:57 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:20:57 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 30/38] libspiro: upgrade 20221101 -> 20230902
Date: Thu, 13 Nov 2025 19:19:05 +1300
Message-ID: <20251113061914.3756301-30-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:21:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121628

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/fontforge/libspiro/releases/tag/20240902

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../fontforge/{libspiro_20221101.bb => libspiro_20240902.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/fontforge/{libspiro_20221101.bb => libspiro_20240902.bb} (85%)

diff --git a/meta-oe/recipes-graphics/fontforge/libspiro_20221101.bb b/meta-oe/recipes-graphics/fontforge/libspiro_20240902.bb
similarity index 85%
rename from meta-oe/recipes-graphics/fontforge/libspiro_20221101.bb
rename to meta-oe/recipes-graphics/fontforge/libspiro_20240902.bb
index 0adac8464e..e4e3500693 100644
--- a/meta-oe/recipes-graphics/fontforge/libspiro_20221101.bb
+++ b/meta-oe/recipes-graphics/fontforge/libspiro_20240902.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "https://github.com/fontforge/libspiro/releases/download/${PV}/libspiro-dist-${PV}.tar.gz"
-SRC_URI[sha256sum] = "5984fb5af3e4e1f927f3a74850b705a711fb86284802a5e6170b09786440e8be"
+SRC_URI[sha256sum] = "c573228542b3bf78a51c5ce7b0a609e8a2763938a088376230c452c4f9714848"
 
 inherit autotools
 

