Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67676C982FA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:41:46 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4286.1790160097198239854
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:41:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SxA9PUSw;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b2e1d5so435051b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160096; x=1790764896; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h6enS8Gjl5jR2WaReTZRQu4+oEFV7IviOs11sy0WnPw=;
        b=SxA9PUSwG/bpTvI4JYPGS9K3XkQefMdTW65ABNvRaeY6P4+ei1kF1ZbWzbuA0FuukJ
         pYISD902a3LxWQNjjvtQIfhIr1nyI+ZgoFqX3iLLWv6eaCqhIKJVj7Zren6KyDgF5Mrx
         +imHaxGZYPGPJEXrKDiSO+YzfdyPOUWp8BYKyb/LYWAG2zRp/QG7kd+opDnMNDK62qux
         5wyvmna6GM3Fnrg6HZ7+YPaA3/7BDmpP6G+T8QHFGcXflTl/4livuaEHZwQYA7+B+EA2
         NxNqkSOQnaUwjrJpAkwPY5172kPHNmqWOkvmJ9RmQw8Cp5rCpqSJ37CVcv3DmmnGc80H
         pcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160096; x=1790764896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h6enS8Gjl5jR2WaReTZRQu4+oEFV7IviOs11sy0WnPw=;
        b=Lz4GkZIl28q2bW9n3gfTUuDXh9uxYEz4OGuKvPfBd8aBA6AKCA4PIWfJWXvXLsUWxq
         uw0pCOus0dklFgn+fg4S3irqwAYGzkDoj8p4GMWuJU2WbritmWKJTZs0aHrWWipvPW2M
         yd8ISdwrgeeScObEnLPDEkEN4gzFeTjqQ/RX33vmqcIMk4P39fS5l7QrCMJ61KkekgD/
         t+M397qsE848Kz04exDfTQmHTZ+XbfrRk80dD/923bpPcAgeMIofxoBb52zDoEqw+Nei
         2UT9aIINXS6HM8I6woDcRtQHA72+bOaSgEjkIksNZe113BfFhBgrO9KH+s7QEFmixuRk
         +nag==
X-Gm-Message-State: AFuF++nTm1Vmo6hbjggu2DcPxbkfA9Ucve+1Fjjn8/gWBqLpxWsRTRY/
	Dy2rqikIp7AXhkoZbp5fWY79xNVB3eN1+Ggqgg1TZbdMA4ye+ugpSCMOV2Gp4w==
X-Gm-Gg: AYBFou0E6UzaARLr+3O1srObnXFBvFfjarLEcOjeiQkDqkwvV3NoRzNwu5GeUVvuost
	Df+7s6EBXcVRenaZS5YO5gCgerVs/DfO3VFCHlOOLMcF4vt4lPFv8TR3mtNlS5ZhbztV4V7Us0h
	qE0XLPNIKKF4rkkLh9GxlH4hsNiKMUdBOPFk/xGKm4sX/LhIQDYXMJXii+Y8uKrntB180zyLV99
	jnnz2VWz8C4doG2AQeJoaQgHI7qK5ekLW7MLsrEdGQWjne0P8Px3Molb3hllT46Phc+MoKCGmmv
	n6HyJwNI/ae180UIrO4a8F+KelwjVUn8qN5XwdyEG2Bd3fdoym63btUP8AvsQLAq5DKajRymg29
	VOZv0AVAjOwgPsoK46I/goYyszTRsh11BTC32GNCqJJP6fnKMImllgYfMoRZUxOJ7TUO/LCQt9t
	k7n4/pCqEiBmr5N/4kAS8+vgcD6KsiY9Tt2CyFcVmJZTXt61tYz+u2swO/qdjPltWU6YpkaH41k
	XZfR996fIjt5c1Iv9uIvCU=
X-Received: by 2002:a05:6a00:7601:b0:87d:d1bc:334b with SMTP id d2e1a72fcca58-87dd1bc39efmr543207b3a.55.1790160096552;
        Wed, 23 Sep 2026 03:41:36 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:36 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 18/42] libmxml: upgrade 4.0.4 -> 4.0.5
Date: Wed, 23 Sep 2026 22:40:32 +1200
Message-ID: <20260923104056.457360-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130205

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 7e505c34533b265a6da539126f4b25b9c6843f40)

Changelog:
https://github.com/michaelrsweet/mxml/releases/tag/v4.0.5

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libmxml/{libmxml_4.0.4.bb => libmxml_4.0.5.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libmxml/{libmxml_4.0.4.bb => libmxml_4.0.5.bb} (92%)

diff --git a/meta-oe/recipes-support/libmxml/libmxml_4.0.4.bb b/meta-oe/recipes-support/libmxml/libmxml_4.0.5.bb
similarity index 92%
rename from meta-oe/recipes-support/libmxml/libmxml_4.0.4.bb
rename to meta-oe/recipes-support/libmxml/libmxml_4.0.5.bb
index d692774f08..01142f6f0d 100644
--- a/meta-oe/recipes-support/libmxml/libmxml_4.0.4.bb
+++ b/meta-oe/recipes-support/libmxml/libmxml_4.0.5.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 HOMEPAGE = "https://www.msweet.org/mxml/"
 BUGTRACKER = "https://github.com/michaelrsweet/mxml/issues"
 
-SRC_URI = "git://github.com/michaelrsweet/mxml.git;branch=master;protocol=https"
-SRCREV = "0d5afc4278d7a336d554602b951c2979c3f8f296"
+SRC_URI = "git://github.com/michaelrsweet/mxml.git;branch=master;protocol=https;tag=v${PV}"
+SRCREV = "18d5c7dd9c71ebc1d3f21fe1e0614300babdda84"
 
 # Package does not support out of tree builds.
 inherit autotools-brokensep

