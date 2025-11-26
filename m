Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 915A4D111B7
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 23:12:32 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6814.1764198746201241921
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Nov 2025 15:12:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VjyGZcy/;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-bc17d39ccd2so159544a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 15:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764198745; x=1764803545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EgsFz65LBZw4jPu9zFKk+mkmmAjjAUauVTpWlybnNds=;
        b=VjyGZcy/jEdap84bTg6CgrkIQyDW5euaOdnGV6oWtxUgtZhjQGzoeZ6E0YKrBre26J
         sv6rrtbBpg/JTX5Kf0jlv/OB20PxxDczOgDyMgq/S+RdRwYS+IiHaR6vUfrDsF3Hquac
         7BsIpHlQKdg41w93h+/aCAvOi3fTXz2z2I8pQ0bRwvs/TyaP9aC/+e1drRmzt0iRIItB
         ZyojWmg7LtGyQv+YwzOD8JjaSJCFxIVtyA+BVRoEfrMPaAxdb1U8CpI0Gc9Ljuvibn/k
         b2zVsNIXAdE0oxCq2hA+cQiQqL/ksCzEpAFcMa8ZeENS1ExvJqODgZGaM1d4rS5ps6XQ
         fDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764198745; x=1764803545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EgsFz65LBZw4jPu9zFKk+mkmmAjjAUauVTpWlybnNds=;
        b=DdIE0GVpVCXtD7aTHfEJq4i8YIxOMHk9mMzPSe5z1Rn9Wy4CTtJsz0ddp/7ocmtj8v
         wpf54mYxj9fSEwAAoYI8sJGNcoRdXKuH40p9zEogm2NSs9c1psXeQWsm86KwG8w+vI11
         TJqLxtp1vc7nnXBUz5NMm4tICF6OnNWEtI2rK21lLbV1mGUfSaVytnw89P9rMeBCarjr
         +XTGlo5a83nk/C1HmCHKfeoZGPS5EPi97RHLo5Z+0jImHd+Z8sd+wPVa0muprETiVFpL
         KtpcXiPTBqgBtuCMqUULb1x892OhzHco4sIGQEub7yiA2Y920t5TTxtvTwpvUMNqGXnM
         IHWw==
X-Gm-Message-State: AOJu0YwieqODy4y5/vMDD83nVyA65RSPlrSMSvXyi/SDozWeeFRcYqNk
	pyju9gDuHrRWWUdfbEYgbKW8iLx7HicLtZ6H76EyHfG2Rtxzlkd2cjkT1lPNaOGL
X-Gm-Gg: ASbGncu1LeRpwZ7iHDdmm1g7aVTwphvIypfTvMdepmI0iC+pnV+KKLMknJEGXYHUXtq
	gwWyrnq83P2UUtbeUzZDCu989BqlKIeuq65b5Mcz2niZJqwDsWIdW7AJIIsdIi1GHcNv7sW3bTQ
	4y3UvYvqm5YGb6YqPBaS6HTix8tZ90A23cCVg9sraLeryQCO6SJWA50L3uAS5HabHFVFqf+bwpj
	j0HKQ1v/tlBgB0pJQLuCp9MDv4bO+mFC2OEhA9Dg21e6VHRP2gfdxWiylOy5QDk+zB4m8iiTVV0
	fzRS7tLWEWn+6r6JVP4o1HzqIksBcaC9JYrpyrwxtTCxK3UyXWFdoaJNKMt/aLVe0WMgTuYc3Hb
	mgFFpXyvCtRL3tokRUmRnjcYHLWTMmhaML1MwbwPJOzjy6mcaTM2IkX0Yt/7t/pJTTpe7yYbPMN
	06MpxSod9gIpiWtTwm8aerVJ5g/gh5epvC2JrFaCZnF5Ny5AvqyurPpR1O1p+l3vMY0WmCSoClO
	FD9wlo+YGxCkrkXxMOz+UMExgsSkXgS
X-Google-Smtp-Source: AGHT+IEP2U4QRpwQi45iNJiHaGD8d8fqp0VfuFHe8ilGPumlC8goetMyGpFLSs7cQBMFzViJ8qgJfg==
X-Received: by 2002:a05:7022:24a6:b0:11b:9386:a389 with SMTP id a92af1059eb24-11cbba8688bmr5810300c88.44.1764198745052;
        Wed, 26 Nov 2025 15:12:25 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::7c49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e6dbc8sm102686381c88.10.2025.11.26.15.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 15:12:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] wxwidgets: Upgrade to 3.2.8.1 bugfix release
Date: Wed, 26 Nov 2025 15:12:21 -0800
Message-ID: <20251126231222.3607808-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 23:12:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122095

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../wxwidgets/{wxwidgets_3.2.8.bb => wxwidgets_3.2.8.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/wxwidgets/{wxwidgets_3.2.8.bb => wxwidgets_3.2.8.1.bb} (99%)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.1.bb
similarity index 99%
rename from meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb
rename to meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.1.bb
index fcb30b41b0..e9929a0d71 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.1.bb
@@ -27,7 +27,7 @@ SRC_URI = "gitsm://github.com/wxWidgets/wxWidgets.git;branch=3.2;protocol=https;
            file://0006-Fix-locale-on-musl.patch \
            file://0007-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch \
            "
-SRCREV = "8aef5f40b93958719771331ca03866b7b6fff6bf"
+SRCREV = "896e4f587615b832ce27b8325357cb504997e1d3"

 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"


