Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE7CCEF16B
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 12:48:51 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.8266.1728391723559312515
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Oct 2024 05:48:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=CyRfzlyC;
 spf=pass (domain: konsulko.com, ip: 209.85.208.180, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fac3f20f1dso59672221fa.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Oct 2024 05:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1728391721; x=1728996521; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/xceOkjzhUN5SSMpguQz4VNVUdcleTmWabBqhtaWlV0=;
        b=CyRfzlyCiH3hlFifyc2xZk+GF4JNcOVhAc4Zjib2987i95s2zKibicz1y6bRa3zjoz
         I/Wo8PPzh8L4TGk8JxZC0WzNPeWbwPhiJJqsPkVWUvzcyR8RPJQhqVq+4iL/KnTSLnoG
         nrRTBqTCnJfGc4NNj6VSezCqiFxNWNWoT8FJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728391721; x=1728996521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/xceOkjzhUN5SSMpguQz4VNVUdcleTmWabBqhtaWlV0=;
        b=Cf/UePXp8aA3c56lk4fW13r9uDowqismOd1tgsZumPRoIEYm97RoD/BUvJYmQPPc4y
         RmWG38X3085UxIXwAuzhweF02bdbsyMdAl4nkvOeH6V5i8g63sf3TD9I+6TB0kqQg6Tm
         OmnJXOUpeS2GsP1IBXxdzaXn85B8MsJWd+1sXi2LLtAHlXKv0O1bAh68qj/t7tTKH6bD
         iwcbQWUBA9ZHEot3N+x3+UU6I0JQMsn0sICwFtroAeGr8aegq/NDkVBNH+77/H5PAAbl
         b5hGPTnCg/Xywgw1lMDhCiJ2k149J7INsXdKGZGMVtyoTjZY9MtXgB4Nqgpfoorcb4Uu
         xn7Q==
X-Gm-Message-State: AOJu0Yzqn11K5EMNhODgwpxPDYJEV4qaaFF38M3D6V4Uuoegdf08zftk
	8NCl1uaNSymN5qq2zjKPWDUJ3C9kFqZ6rrD4+eyb5/Q/6hJjk/QhShf+do6vaN1Ld8L/kxF7Cq2
	X
X-Google-Smtp-Source: AGHT+IGZoq/877kABhffQwGJjhEVnOV4Tkz1F0y6LK+zlB6cN5uT7nTrHvjtj8f0+mbSVcwAo71gBQ==
X-Received: by 2002:a2e:9d9a:0:b0:2fa:c0df:3d7b with SMTP id 38308e7fff4ca-2faf3c1c624mr60833151fa.22.1728391720993;
        Tue, 08 Oct 2024 05:48:40 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8e05940a6sm4313704a12.1.2024.10.08.05.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 05:48:40 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-multidict: Upgrade 6.0.5 -> 6.1.0
Date: Tue,  8 Oct 2024 15:48:35 +0300
Message-Id: <20241008124837.675442-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Oct 2024 12:48:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112711

Upgrade to version 6.1.0:

- Covered the unreachable code path in
  multidict._multidict_base._abc_itemsview_register() with typing
- Added support for Python 3.13
- Removed Python 3.7 support

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-multidict_6.0.5.bb => python3-multidict_6.1.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-multidict_6.0.5.bb => python3-multidict_6.1.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.0.5.bb b/meta-python/recipes-devtools/python/python3-multidict_6.1.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-multidict_6.0.5.bb
rename to meta-python/recipes-devtools/python/python3-multidict_6.1.0.bb
index 6346152ae..1132e9ba5 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_6.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_6.1.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta ptest
 
 PV .= "+git"
 
-SRCREV = "a9b281b2ef4ab25d95d6b268aa88c428e75c3696"
+SRCREV = "4140e63780dc6dd600a1837cb9b4c5198c3dcd68"
 PYPI_SRC_URI = "git://github.com/aio-libs/multidict;branch=master;protocol=https"
 S = "${WORKDIR}/git"
 
-- 
2.39.5


