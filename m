Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE13C5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 11:26:17 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4906.1787138776236219707
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 04:26:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=I3/X+o9X;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1220922a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 04:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787138775; x=1787743575; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=drl8LEbFRB0p7bgnk2gTYL78LA4fWISoDWkEgkPyh8I=;
        b=I3/X+o9XvnnsNqhuD77OzGb4wzrKEoeu9dtI8jtCbkGMGt9fxdpZQTVJjHPFVg+n/G
         wjv+HL0XwiIQm1bvYz+8tH11pknL12C9HTVFf6ZFc2KdUejwK2aqGGNtwZyxLWOMx4TD
         Iubq6FdahQ4ePuA29WvwyDO7C+N6YAHgeXSMFfGdm+C5YOjGEM5iCB91t4JsXfJr+xzs
         vgm5evItfxhwqGukHzqyd7xkXKITAptJMgbgUFZx7WX8PbosKZNh33ZA8aSKvXChha/t
         bzNgxJbf+L+FsEYEk96OcOOcdjJ/A37fPYmVrmR9HCAae6YG/nKiORXda41NJcf0nLmF
         wChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787138775; x=1787743575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=drl8LEbFRB0p7bgnk2gTYL78LA4fWISoDWkEgkPyh8I=;
        b=CV+IpZgnOEELMXqzCg4xBsYe8/U0PX10zymTq3cxurnYhidfQDG+hwkz7MfxrIAOTw
         aS8g4HTE+yE1+cz8x0Rt2VyF/nvZ8yFhmpnCkUvASMrlt0HiJOQMpHNEMvG9vz+JZO5z
         puRvUT/NMu/eUngTnFYXwMCoVJgcTswoTsJZjvvFzfv98bLhVYRDP8cGfCCWSlC4JWJz
         r4KEAAr2JcPm2KDhqC3816tfEKjhg/hsKY6k/mp9/ll9qr8EZkkkSAZm9rtgsdI690AF
         z0P7OAmd/C7PV6LC6CkiAiVpPRPp7eA4DnTat5MiQVx6+Tx77bdlZpmZFDiBR/9H7p4G
         KsNg==
X-Gm-Message-State: AFuF++m5aMPNyuc0qYNbYt8lDZuyB1JgfvQ+xHzRWOf1OCGqjVj28Faw
	A769lrc7JBjmd9aP5YQJz8HfGmhInSAU9ZfbZ47SUIaxQ9Vpxgp+32Mv60gEzExf
X-Gm-Gg: AR+sD11kQhJuE3QrzUkzLHcgAj/myma2lkBs6YolqRvh3SRH9evZqOaHOo+H1eUySmR
	d/DeYo4csjF1Pl8E/m3EoNhg4SYoXbaILluqKFLzozISNuu4AJFgcekGu69P7bA5a3P/reinNNq
	7g2+GVRmXfvpVUvJ6RSweKAjsoKOCPC+TQHCyxUyKcVNSMEdnNEzgP1G7FVsL8ONlcc5Hz1/7qD
	RQ9vWszIPwnrHcx313SmEw39dQgGsygK0naiQiTjNDleEOIRc3Eq9JIebBTOirHs5C+VEBKeS8z
	hDImwsk3NrRzbgjpiWnGFU8w3JGyslfx7d10ZfMMHFYD/DfGDmv7XLahq5E2casXEZRYUeFkxvG
	KARZDkDuUriqd2L6dqkat/H+sf4bzVNVwBZOsPQTghLrUZNSUGU26tQzWkGym5YtqD//XGvVkju
	uLm6ey8002cqhO2YuCprPVVZ31NktXqjG668zLGc1PFGeeE+u3ZvpexXBX3vHBd9k2R3+rlxhah
	w==
X-Received: by 2002:a17:90b:584b:b0:38d:eaec:4396 with SMTP id 98e67ed59e1d1-3958110c322mr7451775a91.11.1787138775584;
        Wed, 19 Aug 2026 04:26:15 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327c2a92406sm5073764eec.11.2026.08.19.04.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 04:26:15 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 7/7] libcdio: upgrade 2.3.0 -> 2.4.0
Date: Wed, 19 Aug 2026 23:25:53 +1200
Message-ID: <20260819112553.971109-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819112553.971109-1-ankur.tyagi85@gmail.com>
References: <20260819112553.971109-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 11:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129360

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/libcdio/libcdio/releases/tag/2.4.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libcdio/{libcdio_2.3.0.bb => libcdio_2.4.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/libcdio/{libcdio_2.3.0.bb => libcdio_2.4.0.bb} (93%)

diff --git a/meta-oe/recipes-multimedia/libcdio/libcdio_2.3.0.bb b/meta-oe/recipes-multimedia/libcdio/libcdio_2.4.0.bb
similarity index 93%
rename from meta-oe/recipes-multimedia/libcdio/libcdio_2.3.0.bb
rename to meta-oe/recipes-multimedia/libcdio/libcdio_2.4.0.bb
index 20ffbffd98..7d345e2455 100644
--- a/meta-oe/recipes-multimedia/libcdio/libcdio_2.3.0.bb
+++ b/meta-oe/recipes-multimedia/libcdio/libcdio_2.4.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.bz2"
 
-SRC_URI[sha256sum] = "53e83d284667535a767fd2d31edad1a6701591960459df373a10f1f21e80a7ed"
+SRC_URI[sha256sum] = "8e6a305f81e45a78b41ce696d34497cc208d97075469d7304c11a6d44bf006ac"
 
 inherit autotools pkgconfig github-releases
 

