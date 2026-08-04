Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F29BC561E6
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:41:12 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24819.1785872467856034070
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:41:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PV7d9IUk;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso81301a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872467; x=1786477267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qq+0nHF81i6lglIcbZltwdBnbbG+tkMyj7g2Tc1JxGE=;
        b=PV7d9IUk/vXzEO7siN+hpRl4JPQLC6I6Sm311onALmiqnPGKo+b36s7lpTnw5QfoXA
         hKteqgFKrhzBUxZrukrIp2gz0Y98FhfGrxgXDDLLhCwa2uTahrZNstUffRhR6J2VbBJl
         eyXMx2mZeZbULzAAKSpBH1Zz88uAheVQLlqptOsLxmLyVcideFtlT/rZwDjkOARbA4SN
         3hmdLceC0HqsH19R4G3GD9jhkPf6oIP28WghSXQs1su20p1K8kViWgZyRD9O+un/syBO
         EXIfdwarwXj47/+zNMMNBgLcLbBL7hU0Om0jWjCF0RGcbqb1Yk4y5/DeC+2LgzH12jnS
         uY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872467; x=1786477267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qq+0nHF81i6lglIcbZltwdBnbbG+tkMyj7g2Tc1JxGE=;
        b=mD2YZVbsHJceFjHJDg6uD3KanHVimkmJDVrPe/la+YJDf9I2M8sMku2s2udRTw2C1L
         2wu9kXq0RrxEfYqZHJwwOiDvCYzyVrETDug0BDMT6iPilRZQp41xR4k/EdVV8MvrxW02
         4E9CqomGp7n8IKU+5LoXuEo9ddHp4CLE59d4Zdr1XqAb5wS87vAs32+UgXBqvz0mfXdK
         xFXE85BGBfyJ/VkEi5rhNZvnBpZdFbgcrMDU9XhNpxupkNlOwKjimC+4ZRkJL66Ie4vh
         Kl7OXIGzWTA7z+A7NYKTtJT2m7U4FOpY2aZ/k8N/neR90eUxp/3wxQy5Vz8J+MjlTfaA
         EoUA==
X-Gm-Message-State: AOJu0YxW5CZRK3YNALL2+PfONkTb5yLzgKVo4mh92MDP4RhXdMnOaYBq
	//4vL2rEkbwM4qsBHpVK2sjfJZKBJJCKG3tNRoyRCr1LxiTioacGRo9qkhbVB+KI
X-Gm-Gg: AR+sD104jkSt3mntcpUymv5As4v4SkNneZ3LCcyhSTL1KBRik1C6rlUUH9FOBMCxTgK
	F2YzVTpx13Dhzpcvl5CReYxk7TCtKPelx3CYZpjyk0nmClwuwzFLwOVEEyJ4l9fcUpVU8SSVTiz
	8LvjXSx+AwvBL8dSBHWcG6011HfMqoyZvHcO28bTQRgmbYntCBYyCkmDHU+toMYV1Nrvt6Hzz28
	dE0bfp/S0qqCJOMg1lgS3eB4rCPqDGPHNlD8i364f8e2sUNhlGMxY6nJSeNg7vs3KRCgvfTe316
	8Er5kyyvKyfzfZJLTBt/1nZrp6Je3/ZeWC9fsDh5EA8pEVSQ85J8imkLYedpWCSX6JR6eJbxMSe
	wrEJHsbu1uF+6i/baH0KFkNlQl3gjnq412TWCMoEU0fj56tv+bU/SGb04lKriUT5Q7UjsNxfmBF
	FlrDmxy7rHTTe2EDPhF5DoP5gUG59OnUdTQSuP4PjxDpfk6by485nTvv222Zvt1lbfMPPd5P40F
	ghqBP1tutAxpACNX9jK7OZ8
X-Received: by 2002:a05:6a20:72a4:b0:3bf:7ab7:98a4 with SMTP id adf61e73a8af0-3cb85efc5a2mr1063633637.27.1785872467181;
        Tue, 04 Aug 2026 12:41:07 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:41:06 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-networking][wrynose][PATCH 23/36] tcpreplay: upgrade 4.5.2 -> 4.5.5
Date: Wed,  5 Aug 2026 07:39:50 +1200
Message-ID: <20260804194003.3158916-23-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:41:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128770

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://github.com/appneta/tcpreplay/releases/tag/v4.5.3
https://github.com/appneta/tcpreplay/releases/tag/v4.5.4
https://github.com/appneta/tcpreplay/releases/tag/v4.5.5

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 7462895d71129013eb027853ba8e45fae148d3fe)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tcpreplay/{tcpreplay_4.5.2.bb => tcpreplay_4.5.5.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.5.2.bb => tcpreplay_4.5.5.bb} (89%)

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.2.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.5.bb
similarity index 89%
rename from meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.2.bb
rename to meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.5.bb
index efcbb13439..55bc8e198f 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.2.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.5.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://github.com/appneta/${BPN}/releases/download/v${PV}/${BP}.tar.
     file://0001-libopts.m4-set-POSIX_SHELL-to-bin-sh.patch \
 "
 
-SRC_URI[sha256sum] = "ccff3bb29469a04ccc20ed0b518e3e43c4a7b5a876339d9435bfd9db7fe5d0f1"
+SRC_URI[sha256sum] = "ba37b6c9270fcebe86b83f68c4ec3d5ac8981f8c6087b582af0205a35ec4b11d"
 
 UPSTREAM_CHECK_URI = "https://github.com/appneta/tcpreplay/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"

