Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11778.1795762886956463912
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:01:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=AwI7zSjJ;
 spf=pass (domain: gmail.com, ip: 74.125.82.46, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1ae58d17cd9so8786119c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762886; x=1796367686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6JQOgizbiDA7pZnv5YzGC3B4DyyyDp6fwK1kvp0idQw=;
        b=AwI7zSjJXXGsJCvc0EIT7vvPT03KqXRZbha/SMUIxta8I15zbnKahb/kpqWDrYNH+t
         SJMrM6h5dEfvGj+6t/8mNARZ2D4n65R+R08dkugRlIhJZWWGcTXneb3tJDw3IgvjHAtG
         mQZbyEdMu4fMRxIzlD0QmvwURyL3Hg/9T+rGJwQsicV5lXdWyYrpqagFShoETZn1ZIMk
         xVRh5J+kgG1e7rCXXFdEzdXqum/mQejtWi/C+NQuhR8sxvJotLOp/wyFBdvGJsp8VHp9
         +dHhWnpg7aJUmL1WY2KCeeSMHsp2bWM8VI66epkckm/xAaoCHwp2+yNkjNxVWR9XffEx
         byLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762886; x=1796367686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6JQOgizbiDA7pZnv5YzGC3B4DyyyDp6fwK1kvp0idQw=;
        b=nMgphBpTg0NHPdBJJIPuDd0WvGzAu0+pC07+ZkVxzAvh7Bu2LMl2usKQCsMBZtTz55
         /NYL4EgKOME9MXuM1XY/Lh1wIfWCC1353dtfnSLWCMlVHh5re27bC98mCdKQi6WZfeHe
         Kpk8esVT5gLlkiSgSgMaSoW8Vfj9AldQNZkzrPLHy4XsMmdwAg/hPpn8Hj1ZbFOu6NzX
         u8W5sw61GL2aEJ1K74R4+KwcRZwtfxtPla49GlAGHhdiBGSuW3MwwSb2em9Tg9m34fwA
         gPfCYSXTDkq+QFc2L9AIkiY5GUc62QofYegK42QtXFAoiKNEepsGf+9TNm2ipcFqz6FR
         sYRw==
X-Gm-Message-State: APuU4Z8CdKOyWOy41+7DCYAhohjW/pQFV7EM1kjaO9edLO5C6jWYeGq5
	eitBVVEVu/Ud8r0UN/vcmAOfz/4qHcymWHBgQwBV2Y3tpZj1knAwlSzyThJPF+Xi
X-Gm-Gg: AZFdTZdpOY2R41g0ywCk5wV0aLYfKrPELcRB+wzoTlzdwrs5fu/WecOewhBx8KHkN5Z
	EJUigY6RpFftuQSFsUX14Eg3E1/z9aUSI3JmlNpYpfWNnRsbKtzK21D4EwO+/im+BrrTYTbTlNL
	QBzHtXCbmJB3BAggWZBU0RD2YSbjDmsj59cV3+kW4QPxlcahEn2NZRTKyNCLnaATOVyUt+1JOUv
	+HQvGhb+hgYMOlCiG7mlpjBQdaP0pP7+37sda9zW/GKmVTQQGpx1QddjxeEL6HDCLqfjmhHUxUC
	N92DLl+VFcF+Frp4VBd2NSKQl+xygZHXI8XUmceCOZmiV+sppIlJuztAcBFNVID9HmvRY+bwsmt
	8G3Mnnu/3+KSJGdM+1q7uOJdzJvtU9ThnafY0a5FQ3VyrpQow+G2EhO5bp44qhTs0xLCYCP8FYo
	mflmKKTLWuGVtH67+QR4OoXXc0tnZnxbdc5NBWBvoKCzKQ6waei2dwpEKVZyyNxWaSNA7LjuYRE
	Q/uGeG/6p7LhkWbtCzt61TL4t9r5V/r2+NlNRERh2eHUWz3kyCJXY0m0i/b4PK8w4fOxvCNI0oL
	ZtdCTcKkwGsMDagssIcoNLp2dFOwMyBXfRD6M4zheUu2W/PHjqQgxASfC5X1WsIKOYv9kggx2Wt
	rurxzg6bRQqi8o0zd39GOrBjNSZQUi1J8/BKymi93Pdpg/TJB8WdbBBTilf7VMYOqGzVJIvH4eZ
	fYpqgjagdFZoHYjxObYZAzXrFDN5mEmD23azerZSp9vdqyAFnemyI4cqayWMoOnodKgmzT91ymy
	1MFYTuvabCwcPXIv5V3gkBUn85E/W1llW0Ap4H52NqhRr8InO0aYRPAZmv1+t8Y0tZ1Lw5arKPD
	dEb8
X-Received: by 2002:a05:7023:a8b:b0:144:e535:3ef6 with SMTP id a92af1059eb24-1b5568ef837mr24487235c88.41.1795762886230;
        Thu, 26 Nov 2026 23:01:26 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm61309643c88.13.2026.11.26.23.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:01:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 10/14] libyuv: Fix upstream version check
Date: Thu, 26 Nov 2026 23:01:08 -0800
Message-ID: <20261127070112.2273685-11-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070112.2273685-1-khem.raj@oss.qualcomm.com>
References: <20261127070112.2273685-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133315
Content-Type: text/plain; charset="utf-8"

libyuv has no release tags and the recipe tracks the main branch,
so the tag check found nothing. Check for new commits instead.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-multimedia/recipes-multimedia/libyuv/libyuv.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/libyuv/libyuv.bb b/meta-multimedia/recipes-multimedia/libyuv/libyuv.bb
index f255626310..c35fa6d3ba 100644
--- a/meta-multimedia/recipes-multimedia/libyuv/libyuv.bb
+++ b/meta-multimedia/recipes-multimedia/libyuv/libyuv.bb
@@ -10,6 +10,8 @@ SRC_URI = "git://chromium.googlesource.com/libyuv/libyuv;protocol=https;branch=m
 SRCREV = "5a17753597d77dee881d9d93097ca2c2079e9409"
 PV = "0.1+git"
 
+UPSTREAM_CHECK_COMMITS = "1"
+
 inherit cmake
 
 PACKAGECONFIG ??= "jpeg"
