Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web12.3629.1617934862400227647
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TFJbu6EM;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id w70so4350714oie.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ZuoVrGGBab9Xo7MNBjq2A+aRTZvWChPTBC/PsOaoWs8=;
        b=TFJbu6EMLvV3wZvLpFkP+SKuttFjf7ITPlDTYUs+xHI2XswiC5AqeG6JE5YsXzuu+X
         iU3z8brqUsJY5KGbW6OBD8VIH29KApQ5qjQ+wVZ0qn49tf55Bt3S4cgZtZlzg0cmlVo8
         gZtjxqMQelNsiEXS9dxJ4kLPMgu4c9NOYEMnCUkX3nAjQnjqQDcNEdxTcDmB6xo1uFWp
         frwJ25gwxFHXfhK340a7iz9UtCML+nliIg64ltp/IcMGjXSOL79w+hWbVHG9CYFeMZXa
         liRO4ykag1Fh8Ul5l3ZCkn2zaoNueCGe4v2+/W/dmgDsHxTp0AlD4cNj9QZI+ZJIRxB8
         f78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ZuoVrGGBab9Xo7MNBjq2A+aRTZvWChPTBC/PsOaoWs8=;
        b=BQf1UFDNDh3MYZwYXeLo2MMVGg2+mgg0sAtFsXma1OITK0Sil6LmUHUnkXyd22e3So
         rFhIpPeiJ6Qy6sXEMEhfps5dbFWVP5ds8BMr8tNLKRAKvW97VOztBTM6AwrgJPHA/yi7
         GoRFcUo7tAu8EBOrcLkoMNSi7L/FnIaZr8pFrc+zLtB21JyeaDziJX/wz2VFIbbGNP2D
         FAcJoMmBOyDLMQ0l+UqC+n4ETp1eH3XOfY3lCdkeF0sb8FVtCRsNkY2SHm3lpMCbZ14k
         oyP23aKrMks6FWaoliaFLb/25FRPBZsEy8nORfSRu5vfNIsUtMEiIdcx5D4MRzYOG6Oz
         yTLw==
X-Gm-Message-State: AOAM533Uyh2l8IZRD8k6oa/iH6WDxxk0NsRAvZPbaBrapdEcj/M/QQVF
	Psxmeo4rjl6CPdMQj1gVmZYTJJkFL/k=
X-Google-Smtp-Source: ABdhPJzHQBLJzQC9AoLoxLH7DJjfENa/QVrXGe1W7c7ZQ2iGetoAhYKF8MLEVj3siuiRX0kM1YR74g==
X-Received: by 2002:aca:f48f:: with SMTP id s137mr8334603oih.101.1617934861595;
        Thu, 08 Apr 2021 19:21:01 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.21.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:21:01 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 09/36] python3-pychromecast: Upgrade 9.1.1 -> 9.1.2
Date: Thu,  8 Apr 2021 19:20:22 -0700
Message-Id: <4b9aee882ec36291bbb905c12ce0ab88764e5d88.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 9.1.2:

- Handle bad UUIDs from third-party Chromecasts
- Reuse SSL context in host browser

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 75a9fe6cc0ec8d031540462fdbbbcf28bbf87ccf)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...hon3-pychromecast_9.1.1.bb => python3-pychromecast_9.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_9.1.1.bb => python3-pychromecast_9.1.2.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_9.1.1.bb b/meta-python/recipes-devtools/python/python3-pychromecast_9.1.2.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pychromecast_9.1.1.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_9.1.2.bb
index 3d0b84cf0bf..c392261ade2 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_9.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_9.1.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[sha256sum] = "ab9da1d2ef424b1fc755f6436f545a56056ec6de24075e93f369eac8eb821837"
+SRC_URI[sha256sum] = "907656cea46d39d0e93ec815979578ef4fb6f655fd8bf4e88e6421fcd7824e85"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.17.1

