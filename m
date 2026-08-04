Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E37C7C56201
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:40:51 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24807.1785872442203301363
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KO6J2VKE;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cc891373e0so2865535ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872441; x=1786477241; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L1Ps7iti6wmMyGbLgI2cdJslaRru+04pDKOWcXGW/ZA=;
        b=KO6J2VKElaQLKsxHE/h/sCo8GKxuoJBb04Yfcvzuzy7/gBJs6KWMiUcOtBHBvH6i1Z
         EpSHDrYqVlY6FGKUIAGuRu1n2+wpzdVKB3TsPQc3AnChkSSqpVAyONMrjo0brvrKxLtH
         nZNMelGf5p59hKT0+KKD8Bb+txgs9iCa5o6/1AsBEpzI5YtlLeWnL6O2ehgHhcWSq2+x
         LuW0J97anDR1CXcs0SuBR2osrqjJ9sNy3z/wHL1vEY8mZwSK2lzw3Nw4L+l+JlxiwMFj
         5BQCrbzrmWlXKGMpCY13BUZcX/V1g35q1Go13IUB2UcMK5lc14UXtoepg6HnP58aA6id
         pCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872441; x=1786477241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L1Ps7iti6wmMyGbLgI2cdJslaRru+04pDKOWcXGW/ZA=;
        b=YkH3HR2VRsxzHKgUpVkfcLwge/GePOYJ4WhF2w3dHwcCVCp2QZV++pV3XgabJaEWRh
         Y2PyIukktK9Dvqfgn/W70tZjFiQOusYh9Qie3Pjbr9DPMBOgYHjnyk+L/lxc0Yuhpq9f
         4BsFLFKue8J3Gh6F3t3nxFCjEuJoCUMEIsv41Ri89tVG4mou7cF+klynfjSPESBDvV5i
         9dR0ZzQWpNYq0izgQ1OwYs3qWUcuVY7QWFuKe3TsL40QsLs/xM5yBLUobLXO/bLHbDtA
         vZIFmICyF3IVKRSSVVX4dCBUe8CoIGWvprzy/wRON6+t56zvAK8Nl7kxaF7Lj5NgQLeV
         I/8A==
X-Gm-Message-State: AOJu0YxhfmW+k4VTn6UhWrIXw5nGWO3TaxE6ysI+Do8DT2DkIRE6ISUG
	CkrhTG+5hFCuU3iZX3JjKq3gg0QaE2rq1N4e5IluMMo46gZFWOUA7jw8hboWcfmc
X-Gm-Gg: AR+sD10QiSJx6srxw9YLa1goUtlM6vwDaHBAW7fQ2Vav7XhNeqSkiZyNK5NGTHi0ZA7
	1SMjKPr1gLP6vNb+xfbPxEuica8WGWpeS19eZb/cMpHBPDIXlqw74FlXSaUklBVqMOz+SdhzfGB
	iz+5BV/v+nGBVBStLptCBxlCgV62PYcHTM9qr5EUB/RN4+/2qxMUwh2H6MIiLlFWv42TcKKCtx6
	SD+ekxNEYZc4qwYLDq3pNh9KQ15JlYS6kzg9jggEncCuoHNE91TWH+RaHu8DCMokKZ21xwDR+3A
	04NOmIful1c0UI/w97zzvy4pWyZ20aIN+ID701sQXkMYKymq00L0g8b7KluDDl/Fhp2ODrzRZ6f
	Se9s9qtUY4IV1p1ln7GA0HPfEAHHPQ1INJy4309KeaO0KQmBSHpwR8Mdx62TRjPkCWgVzerJCJy
	eb8xUJsVLJCNikuPyvjCgDbgaYsQcxvXOAbVnW5dqYPJts8Nho1K4+YAdAM55lQC45QJLpnPRTh
	g==
X-Received: by 2002:a17:902:c40d:b0:2cc:ae2b:b6d2 with SMTP id d9443c01a7336-2d0ca776196mr11322735ad.15.1785872441556;
        Tue, 04 Aug 2026 12:40:41 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:40:41 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 13/36] smarty: upgrade 5.8.0 -> 5.8.3
Date: Wed,  5 Aug 2026 07:39:40 +1200
Message-ID: <20260804194003.3158916-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:40:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128760

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit e6fd95cd3984a759c4107d6e63f4447f998035ae)

v5.8.1
https://github.com/smarty-php/smarty/blob/v5.8.4/CHANGELOG.md#581---2026-06-23

v5.8.2
https://github.com/smarty-php/smarty/blob/v5.8.4/CHANGELOG.md#582---2026-06-24

v5.8.3
https://github.com/smarty-php/smarty/blob/v5.8.4/CHANGELOG.md#583---2026-06-28

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-support/smarty/{smarty_5.8.0.bb => smarty_5.8.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/smarty/{smarty_5.8.0.bb => smarty_5.8.3.bb} (95%)

diff --git a/meta-oe/recipes-support/smarty/smarty_5.8.0.bb b/meta-oe/recipes-support/smarty/smarty_5.8.3.bb
similarity index 95%
rename from meta-oe/recipes-support/smarty/smarty_5.8.0.bb
rename to meta-oe/recipes-support/smarty/smarty_5.8.3.bb
index 89fe828ab5..f0779efb7e 100644
--- a/meta-oe/recipes-support/smarty/smarty_5.8.0.bb
+++ b/meta-oe/recipes-support/smarty/smarty_5.8.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c0f216b2120ffc367e20f2b56df51b3"
 
 SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "78d259d3b971c59a0cd719c270cc5cbb740c36a7"
+SRCREV = "042dff64a912c272e7692a442590880a3388c4b9"
 
 
 INHIBIT_DEFAULT_DEPS = "1"

