Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39297C9832F
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:50:43 +0000 (UTC)
Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34498.1790506233760849273
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ChDJe2v+;
 spf=pass (domain: gmail.com, ip: 74.125.228.38, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-88272e1d069so317627b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506233; x=1791111033; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bm7eOq/y7UsuckeVmDy9R32DngVUR4M32RI58ITpIDY=;
        b=ChDJe2v+1bWFKRDscd1fvfYBw/+9qsyGjucMnu/jylkO9SX4jJeqt1XwQ4i8IDBK1G
         UVZtr7PSHobA+5i5jbsQQJV8zosW7SwI9KCuLlFvFFA5d4zUHoxDC6kc9I08pUY+roVk
         3VEW5AlmbyGoz8co/AorRMhs77H5s2O8bp2I6gE14CXTh0kUTCWBsBdAD9519oY8C/7U
         5AxhIO7G0B7gjiAWHupnV+yfw480Uerd3ktPTQN1hjsJPXyJbElRCWxyjF5N9zh8b9CO
         2jK/E9SdpEpv/1fkygWmPDCSreI1+vxcN6+1s1T3IqQrAJavhIUS7G8d3yPnvjXq2h0q
         GbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506233; x=1791111033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bm7eOq/y7UsuckeVmDy9R32DngVUR4M32RI58ITpIDY=;
        b=eQi0Qg5kJakyaT41MdvdbBOVcPJ51VOVhKUGlwgDj4XHVo118n0/irY2ylj0QY2MbH
         MnwlbXLRQ5Wd8y9G5FfUpxBUOzlHbmB7Pw+Ug3YF5Eh/gSXEkSGNmHVIb4AmEXftWPXm
         mrpHrMTEzmHlPUm3cydaZbs9ZpAJyjClRG6BWW2xnT/3majCqGrVNZCxvKF2yNo3Ic5t
         od2kN+gdgUYNSqMLuRkY6wdc+fURK5g2m9jE4PxX14j51OZa43A9SD06TJfA4795hCX5
         B/eCT1enYtli4NCMwUX6MJIHeMV5wK84OCIMm2qWQcljFgSHVaNXnW8Qe7t5Y96k5PCA
         LXlg==
X-Gm-Message-State: AFuF++nKUADMbBEVS141GWbOhkgmCD1a6GzZbe8uU6e5ZXviH98n1iAh
	S1SegRZSMX3VztSv1xBAjnTumvcf0VjPbm0zsT32U/nMy+m5iGHJvhKYBbkJxw==
X-Gm-Gg: AYBFou14EPtHsNCJN7TuEHbMZH8T8gve+sYWO+7wESUE/cCwli8ejk/2PBxjB7dNJ3e
	JHacHZLJlnKaUecwGacUmFgLZldIGvmzCqSsm1wdrmjxUpRLsnqdh8mgASs6N18jQVHD2o78gur
	8GucDmAaH7p3dmjsjeseDy8tw0NDbdRrMYXwd2HtcFLHPGjPeItWvfsFrcUD1R4kwVPGmIFtWDB
	nmIiXT3fA4gDdU+Bhaknmt1aQQY0GA9rC6gZUNxo36q+3hhxCqR6GqBjQV3xJeK0s2jqmvh8jnZ
	MzXDlIFVt7AtESHa8TjBOPirXuENgLLLGiEuk/z+SUmBw0Eit96yXKxhgAZWgEO/P3j2N/Q0sDA
	Tb4VXCT6Oo0ZfldLUHzbICyTGcxRaTJp78ubz8/vjghIzYs+5+7+LB55IFNUDzj3TUCoKYpjuUt
	/eiTQYQp6rfdoVPR1i086hOe1y0jsLGivlqlzgNOV1cow3LE6AGEeA8nJeqTkdubxfxd5T9Tpo0
	Ei4cU6QUOiaj0gbyDdodD8=
X-Received: by 2002:a05:6a00:8d5:b0:881:f152:3861 with SMTP id d2e1a72fcca58-881f1523d53mr2114437b3a.25.1790506233011;
        Sun, 27 Sep 2026 03:50:33 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:50:32 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 9/35] postfix: upgrade 3.11.6 -> 3.11.7
Date: Sun, 27 Sep 2026 23:49:36 +1300
Message-ID: <20260927105002.1832451-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:50:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130343

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
http://www.postfix.org/announcements/postfix-3.11.7.html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../postfix/{postfix_3.11.6.bb => postfix_3.11.7.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.11.6.bb => postfix_3.11.7.bb} (99%)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.11.6.bb b/meta-networking/recipes-daemons/postfix/postfix_3.11.7.bb
similarity index 99%
rename from meta-networking/recipes-daemons/postfix/postfix_3.11.6.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.11.7.bb
index 14854ca11d..99a77dd6c3 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.11.6.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.11.7.bb
@@ -29,7 +29,7 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0001-Fix-build-with-musl.patch \
            "
 
-SRC_URI[sha256sum] = "b9a748705b1cab0a4afcbe42f934c82a33b342ba3229017fb508c71700078d07"
+SRC_URI[sha256sum] = "a2f3242345753448072177fae83c322a403c9263696996406201145dab8e8625"
 
 UPSTREAM_CHECK_URI = "https://www.postfix.org/announcements.html"
 UPSTREAM_CHECK_REGEX = "postfix-(?P<pver>\d+(\.\d+)+)"

