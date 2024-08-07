Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C83C52D6F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 11:01:08 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.30636.1723028461123317652
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 04:01:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EspkP7SB;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ef27bfd15bso16921031fa.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 04:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723028459; x=1723633259; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hmqASQT8Bb6CzCeAgpMwGSJM4tHMiiCxA5Inn7WTnNk=;
        b=EspkP7SBMG7kDmf4P3sNsbYhbEI3/bxMYzMMjvKV0nQw1NB0lhCPQMbACTyBnaiFdk
         yLuvYKi4jJEdelIg9EJNDQAsNiazbHFlO5HOSKQuTEWAoAOWlTxRWOKJ2P6XBN9Q4mZY
         9anphtu9mkO0q3qVvhGwWOlLMhqG5qrRqgV26Vw/3QLpiyVNjPGRLcLcaFaOI1eXVdLb
         /EV+Q9So76y4bIh5xNNZF9EkXMpwFzsvkQ4LhOBzxJm3csRHdI8eerTty2A2d/iwkR1p
         dzCKcghrSNzyLQTQDoflZOW3QsUW/WMR3W1Na0428KPirFvXjgD2HTaAf/vnoRZ77Tr4
         yoAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723028459; x=1723633259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmqASQT8Bb6CzCeAgpMwGSJM4tHMiiCxA5Inn7WTnNk=;
        b=UWjb+2ZsIfmRhDS+wEPrOOVmLjh6awKyBxrT7BfZ5NPa6JNJbZR+WlOhYxfeqG5ydw
         Dcuv598XQhM36BvheuqT70umVSY9/gSUU8rFdrp/0bR9ggaMBU9MWk6g94DUaDH/1aNa
         svwS0jb2bbmZhzta2PujVKOTLDn0ASdnYjfmHxLeTwRbK9qgJAhPSNUQrluhqlr9xV/m
         6z5w6/3pD2HhUrgLd81ebuwnjdFkpTdBSiMww0s5BoFwgP7Sh8Sxbfjp5p4Rmold45Mp
         3A5HNc60DWfuyzjvYMS8FfY6DXVk5Ffu/876yiZEK39I3P5Kds/bXvdJcgOHnu0mFcoA
         pY8Q==
X-Gm-Message-State: AOJu0YwZdzJwOwTw1OMeIQ+0fPHtOUtOZPTR/7w3Ju7TI8DtZUq9z4WL
	+YiUuxgJyMPjW/Kp+jau2t2vPKkjqDvGAlMSGa8qP8lXNm8XsTvepRVnN2OE
X-Google-Smtp-Source: AGHT+IHHawx7tbckTHYU+A8xKT0c0BLMvB7eugGp4bgLDvCGOlc3xRqgldTn0CuZhm4ksEpRx2heig==
X-Received: by 2002:a2e:8046:0:b0:2ee:7c12:7b36 with SMTP id 38308e7fff4ca-2f15aaacc1dmr125721311fa.19.1723028458508;
        Wed, 07 Aug 2024 04:00:58 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42905991434sm23955255e9.30.2024.08.07.04.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 04:00:57 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-eventlet: switch to PEP-517 build backend
Date: Wed,  7 Aug 2024 14:00:53 +0300
Message-Id: <20240807110053.48550-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 11:01:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111609

The project has a proper pyproject.toml which declares the hatchling.build PEP-517 backend.

Fix:

WARNING: python3-eventlet-0.36.1-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with hatchling.build, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-devtools/python/python3-eventlet_0.36.1.bb        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.36.1.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.36.1.bb
index f70099ab9..b521162d2 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.36.1.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.36.1.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
 SRC_URI[sha256sum] = "d227fe76a63d9e6a6cef53beb8ad0b2dc40a5e7737c801f4b474cfae1db07bc5"
 
-inherit pypi setuptools3
+inherit pypi python_hatchling
+
+DEPENDS += "python3-hatch-vcs-native"
 
 RDEPENDS:${PN} += " \
 	python3-dnspython \
-- 
2.25.1


