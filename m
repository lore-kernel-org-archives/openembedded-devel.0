Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7138CCD3448
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 16:06:01 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.27292.1725379559861028524
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Sep 2024 09:06:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SQFiBNZ/;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c245c62362so3112930a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Sep 2024 09:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725379558; x=1725984358; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TZYprxvAqvlsugJBbqzrdV4ZkWfqsU4FxbeXw/3OHjA=;
        b=SQFiBNZ/blM4dP1jibt5upaz5CPXHkPG7jN213bH6YojA4Qfu0DiJTKIxghUVACBNI
         l2rqNR63OsGCBY88SiVJK8eiRKcb8ww/pt052ZXKKY5YfwI6ujl1QG57xSHahqFNDamK
         d9y5jFfo8ZP4UGmbJc0WCZzgWqXNd6978SwP6qDoZws0U25XJzzwpJM4tEylpMpmigLL
         OuOUpYv70H1SW9aev51HF4WmXhDRcrRCX+0nTaFYBP5hR5VY3y+Eda2QaqH7DD+gCIuK
         eOUgMY9jXx95OZcetp2UtBzU2h+GJY0TRHfUAWaf2CRIzPnQRNkfiYOqKk8jp7jcbh2u
         Jp6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725379558; x=1725984358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZYprxvAqvlsugJBbqzrdV4ZkWfqsU4FxbeXw/3OHjA=;
        b=rGDCajQPqT1O4P9jF/wrgMqV1ISbBh3D3giUMlb73ev/VMD+5FaT8eZNV/TYa2P+UJ
         UHZ/vX1IpuBwFTZV3iRqL6UV21J1/KpZoZUUxfjf4E2uP75TNmw8+EzhcGqRNDGliNbc
         u+5Pb+MMbpTjeywcR06gkffVg7JSxgYD2Sw+FywJnl3hE4m/+4Ct9XY1tEgg6n7y4hWs
         saNcY0gU5ugy+3sh6KvekVKS90S5NnSuHqkSYG2d1mbaRtOiPs0x36YNYsWggxbSxyvz
         KL/eDFTXEBsI4WZ/L2X3tthWLPgWQ5dWglXReLBZG4BG7yIQfPRObn45yE8TEqza+gmf
         oKkg==
X-Gm-Message-State: AOJu0Yx3elknE2l/8TfzlB0ypCegd31Wu7lSsOEHMv/Rd2KQFLgEtJoF
	4sKFLP+qchVZK77mZyNWyGt8r8xJvHdbJm/8KADsMHue5KS99tlf3e2eSw==
X-Google-Smtp-Source: AGHT+IFmPiUyKGaYMmFypMDOpamTQh+AX0azOYvFmiHmssp17yLtpCtOZWeO+hnY51KR4Ho88ihHHw==
X-Received: by 2002:a05:6402:42c5:b0:5c2:112f:aa77 with SMTP id 4fb4d7f45d1cf-5c275849266mr841718a12.31.1725379557621;
        Tue, 03 Sep 2024 09:05:57 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c24514b273sm4426445a12.56.2024.09.03.09.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 09:05:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: mikko.rapeli@linaro.org,
	akuster808@gmail.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][meta-oe][PATCH] Revert "gcab: ignore buildpaths error from sources"
Date: Tue,  3 Sep 2024 18:05:51 +0200
Message-ID: <20240903160551.2204995-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Sep 2024 16:06:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112081

This reverts commit e11df061339051eda38750fa75429778d3d8dbb4.

This isn't needed in scarthgap where buildpaths aren't in
default ERROR_QA and it's not a correct fix anyway, see
https://lists.openembedded.org/g/openembedded-devel/message/112048

This doesn't work with multilib where the package is named ${PN}-src
(e.g. lib32-gcab-src) and it's better to just lower buildpaths from
ERROR_QA to WARN_QA instead of skipping it completely, because it's
still an issue which should be fixed (at least to improve hashserv
efficiency if you don't care about reproducibility itself)

and commits in master:
https://git.openembedded.org/meta-openembedded/commit/?id=154f5bb1342739d88185ac0cce9c15b7b2958187
https://git.openembedded.org/meta-openembedded/commit/?id=6644c4a420db82da1ce71697ff889e7b1b6e41ad

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-gnome/gcab/gcab_1.6.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-gnome/gcab/gcab_1.6.bb b/meta-oe/recipes-gnome/gcab/gcab_1.6.bb
index 49c64f0ba6..4278fc9453 100644
--- a/meta-oe/recipes-gnome/gcab/gcab_1.6.bb
+++ b/meta-oe/recipes-gnome/gcab/gcab_1.6.bb
@@ -22,6 +22,3 @@ PACKAGECONFIG[nls] = "-Dnls=true,-Dnls=false"
 PACKAGECONFIG[tests] = "-Dtests=true -Dinstalled_tests=true,-Dtests=false -Dinstalled_tests=false"
 
 BBCLASSEXTEND = "native"
-
-# meson embeds absolute paths to generated files on purpose
-INSANE_SKIP:gcab-src += "buildpaths"
-- 
2.46.0


