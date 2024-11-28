Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D44E1D690F7
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 10:39:06 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.91644.1732790342840161316
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Nov 2024 02:39:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=DHNDUrHX;
 spf=pass (domain: konsulko.com, ip: 209.85.218.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa55171d73cso327106966b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Nov 2024 02:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1732790341; x=1733395141; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MVDpzP/tVH/vZfES6l06llx0gTAcKy9/tjFtxDX60vs=;
        b=DHNDUrHXym/PbXd9h669iWOxvTXiWXWWLTzqvdi3XhHgSvt341AGGT6SwdCiYdTcjR
         5Bb5mlp1f/7igLMTKbfI9q4c4Wktx4eZZvF60VhKMbpbP7a9kEH9Aa8JeGqtkOY+H+b8
         2pXiGJYJkqLJhrUARkybEoZoF0v1qB88X4iP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790341; x=1733395141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MVDpzP/tVH/vZfES6l06llx0gTAcKy9/tjFtxDX60vs=;
        b=sFTdKfc0MBTb0ms32N68qj6KdYJRKoH10NoCk+QB4oagIAJ8I+Uifoe2Jy15/ii/tH
         +404AicPtAqSuK5PZd6FxlWNNsaQvMRJuVzE9G5URpiOpwYp7OgrNssFx3RSRtVzeBHD
         zEKdACtoV1RyPSCRyKGqK756ciJnphZXrNyWMwyuhUZC6RifeOD0P75dxl4rttgZNtOg
         QXBp+MMlFG+6Plv0E0yeSF/Wfq2rA9UUqs8vDTHSgPVIt6Oiuwnd7aNWapU8c//0WZSA
         moi762pu3ngz+cFrxY3BynetOiBV7XEekKIGQT8YDMWX4sw0Ja9RrCs+ve3TQQjo3X1o
         MkGQ==
X-Gm-Message-State: AOJu0YzVz56Pi9nyj9x716uwsnoTPAQmbphTUhgHQo49SZIMyAgbGz3D
	kdJyTflB2LvAM6zrA+38gdChI2qcVO3WGrNk1cZKwZPX2pk26/E5LmKo57+BOL9aamUvGYYLrQX
	E
X-Gm-Gg: ASbGncvoQh4iXXKQ31aWwm5hivvwg+nfLssRssJ7X73ZLIPJZ4jKABrLcpTgLzRrpJ5
	8QfQf/lC4ZZ96Ims0r2qH/2iFIpskHgFIDw78dkrqW7wFwXRiORal92dz3huLEv5Kb8fxDJVDra
	K6HpEGi7LA1vuV2soz2SyvK5+/Rjubd4QaWlDkU5QYw3VLF+MTs4zgNRRWPbYYuL0K0CZR83uPx
	d8tqTwRisX/qFsgf2UaIjLY5BSjPOXo68UEAgpkRUj505AxfljDEtNYD+ZBlgK1
X-Google-Smtp-Source: AGHT+IGvRCzBF/wC54L+xIf34w8ds0YfkIwNX2RWIsYxaRtauR5beglY8v0jb9vnAAnrbF/5yfNEbw==
X-Received: by 2002:a17:906:3d22:b0:aa5:44cf:3ea9 with SMTP id a640c23a62f3a-aa594670132mr273055866b.28.1732790340659;
        Thu, 28 Nov 2024 02:39:00 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c11fcsm52227666b.39.2024.11.28.02.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:39:00 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-portion: Upgrade 2.5.0 -> 2.6.0
Date: Thu, 28 Nov 2024 12:38:54 +0200
Message-Id: <20241128103858.4052195-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Nov 2024 10:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114104

Upgrade to version 2.6.0:

- The how function of combine can access the current interval if
  pass_interval

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-portion_2.5.0.bb => python3-portion_2.6.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-portion_2.5.0.bb => python3-portion_2.6.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-portion_2.5.0.bb b/meta-python/recipes-devtools/python/python3-portion_2.6.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-portion_2.5.0.bb
rename to meta-python/recipes-devtools/python/python3-portion_2.6.0.bb
index 269473e933..31c6f07316 100644
--- a/meta-python/recipes-devtools/python/python3-portion_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-portion_2.6.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000208d539ec061b899bce1d9ce9404"
 
 inherit pypi python_setuptools_build_meta ptest
 
-SRC_URI[sha256sum] = "80ae7bab71f4844e3eb33c57954d76a3bd4cb351039b6e260e779325aeb4a487"
+SRC_URI[sha256sum] = "6fb538b57a92058f0edd360667694448aa3fc028ab97e41e3091359d14ba4dd5"
 
 SRC_URI += " \
 	file://run-ptest \
-- 
2.39.5


