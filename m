Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C184C10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 19:04:59 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.4062.1715281495707492344
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 May 2024 12:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=OjpnDKgp;
 spf=pass (domain: baylibre.com, ip: 209.85.160.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-43cff222427so6256571cf.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 12:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715281494; x=1715886294; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=v6cKVbkw3fuI9kn1Gj9ldUx/98ypUxcVwsf4CMaA4Jk=;
        b=OjpnDKgpTyRAGn6vN5lRMYXvtDw+5Kke1J+evFnAuJeeiVkmRdUfHmTSOgUfuIhv12
         3c1UUXFENZSlFh5S9XSf4GtOkEK+QaXRykxVeGhXObokZuldOt9teXINc23I8GC5/9RR
         NSVa2XMaGrDET96zRHmCzHjUIjuKFDYiG2XVrkbW6qOtbMtTB571o4uI1ukGCmaAyyPG
         k7kdh8mRpi0YG6B/x5nUcImRJxY7AlljX091nd/LfEKwR9xx2HXd90hAJ/sDtRVfDa7S
         aeAvUZMDe7FuNQP8WC2YQM/1CLb7RkyqjGXmwpaglGvcVqAE9brWlK6FwJzr+eQgeedj
         uuBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715281494; x=1715886294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v6cKVbkw3fuI9kn1Gj9ldUx/98ypUxcVwsf4CMaA4Jk=;
        b=b+BqB4cqRrf+FevOViJc5rRH8bN0h2jbTKfe0qZzpxXMXFZLvzHfKNpcbagpbls8nD
         2nOJMz0Ktbkax9aCI6TPl3qcQltjbGu/0meAV430Ssl7+Z63phZlZph1xu59l0/lsyFS
         Lapxs78c0FL+oxWx3Q9dPPEf5HpMn9rsJZ2jDZwhmIUe9dBW6ZI8QR8y4nEFv8RpqyZk
         OKQxq6/+s+q0VfcCAXH8OJ+S6vT/Q2hNPtOhBqLrTfjUseD01bdwmGg6Z0SVb62gxGPe
         wjVheB8z5c3lC7PFH+N/6ABEaICFuRp5sq1v8qP15tswwp1bOA4r2yK1ZlrTo9VmsYi2
         pedg==
X-Gm-Message-State: AOJu0YzyCQzAjET6MgLC2GdWmjOlqbaSHDsGn9JaHlA9VnyKYkOggXra
	yGmYvLFWIjZVa0ZdPfUwhFJem3QqGzSNC69R82pzudlSyZPwShQ6tFHwseiuZSmn0HfzNmG99xg
	r
X-Google-Smtp-Source: AGHT+IE7PhSIZsFIHMREsg6qZyQwtypdg5tgdR9lJLTX4owsFYE/EVxxjj0dgwSRmUeapU5fRoJZ1Q==
X-Received: by 2002:a05:622a:5b06:b0:43a:9e4:1689 with SMTP id d75a77b69052e-43dfdb26f63mr2979271cf.19.1715281494474;
        Thu, 09 May 2024 12:04:54 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43df87da55bsm7786441cf.33.2024.05.09.12.04.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 12:04:54 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] xlsfonts: upgrade 1.0.7 -> 1.0.8
Date: Thu,  9 May 2024 15:04:51 -0400
Message-ID: <20240509190452.2365537-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 19:04:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110292

In particular, make it build with gcc 14.

Changelog:

d20bea4 xlsfonts 1.0.8
71d8e89 Use reallocarray() if available
2b9d8f5 Fix -Wincompatible-pointer-types warning from gcc (issue #1)
e53bf74 gitlab CI: stop requiring Signed-off-by in commits
314d802 man page: emphasize this program is for querying an X server

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../xorg-app/{xlsfonts_1.0.7.bb => xlsfonts_1.0.8.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xlsfonts_1.0.7.bb => xlsfonts_1.0.8.bb} (76%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xlsfonts_1.0.7.bb b/meta-oe/recipes-graphics/xorg-app/xlsfonts_1.0.8.bb
similarity index 76%
rename from meta-oe/recipes-graphics/xorg-app/xlsfonts_1.0.7.bb
rename to meta-oe/recipes-graphics/xorg-app/xlsfonts_1.0.8.bb
index e5cd0ce6f..4ddb1b988 100644
--- a/meta-oe/recipes-graphics/xorg-app/xlsfonts_1.0.7.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xlsfonts_1.0.8.bb
@@ -7,4 +7,4 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5ec74dd7ea4d10c4715a7c44f159a40b"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "7b726945a967b44c35cddee5edd74802907a239ce2e2e515730b8a32c8e50465"
+SRC_URI[sha256sum] = "807f909eace684b866fc63b3e962729c120822a6c96e051ff51cf350b3ffb6cd"
-- 
2.45.0


