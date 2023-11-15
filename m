Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A734BC07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 06:33:57 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.7654.1700030035512936256
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 22:33:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bA+0rBTR;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-54394328f65so9835940a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 22:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700030033; x=1700634833; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QW7s4nSuN2c22uUk4UK6P+0P2rjuDs2aRP+JM1s4XVE=;
        b=bA+0rBTRGp4I3FYBiM5gUVqozDR6x0ZpDfY91Fur998k1la6DLZvISrYHSfLXURGjB
         w0LVhmiHbRjg5j7F15vgSrH3COMueiOoEMSovxOO8zH/xkhCGxJV9rVMLwiEubix01ei
         L9PSHHTu2HMoA0iECkq+J+d9vM7FsOI6ob3Ag1atCf1LbYc9ROggcwfinB48Jd6TiCsW
         lUtv4OFC6UdtcalAgiV4hIMEq8BsYWfymITq1l9ZTCtgM4HC35NQKcld10FyYtJVvR8n
         QjpM/3I59La55fogpwErs+1nF+XVn2rQYjxxGXbgMUFBpEoegLYU7KGWzG4rIeRaq6Ei
         AHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700030033; x=1700634833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QW7s4nSuN2c22uUk4UK6P+0P2rjuDs2aRP+JM1s4XVE=;
        b=srPz6R9TbZi6z4nwJvZ7Gp4BrsxeLejLMakKciK8dRygOtF60mznUBKUcOVRgp82t1
         DEEpbY80GorblZC5SsbgOHYWLSKwOlSzDlNVQD0ggrkNDHnBuXeKO9PVDqhNzzv7xFAu
         JG6eZoh8BOQUwK3wpVhruTbw91E8D2lFN/HWin96JVq03F8wxtQxAwPqrdsjnFCBNZrH
         8OVl2F0bCUS7yqW0ilXHhvZB4nZA/2zgVnu+t6BFGBOjsaWKWDGmYWl0K7TF9UjZ9g4S
         MyWfKD0IyHyWJhyBAFt06R3HONgoZa3wmzHuFuevliJ4db3uQ6PlehyramPhzD7kVlRL
         YirQ==
X-Gm-Message-State: AOJu0YwFAC/9JizzaUoKkjfLIq0TFn5i0oDgnuSYIr/TDgNqVx7AXllQ
	rU7SfEpDbwM19vDn6UGw9mJ3Ox2db7+XvQ==
X-Google-Smtp-Source: AGHT+IHlEVJ9e/JJdKiAAC4Mzv5Z4Zd0eawcNoyZt4ASGPZH+hZxz9ZyUtPFOlZpin8sXkP9H8Obyw==
X-Received: by 2002:a17:907:36c5:b0:9e7:c1cd:a4dc with SMTP id bj5-20020a17090736c500b009e7c1cda4dcmr7924750ejc.6.1700030032976;
        Tue, 14 Nov 2023 22:33:52 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id y10-20020a170906070a00b009a168ab6ee2sm6544988ejb.164.2023.11.14.22.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 22:33:52 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-multimedia][master][PATCHv3] libopenmpt: Added license change reason and dropped md5sum
Date: Wed, 15 Nov 2023 09:32:43 +0300
Message-Id: <20231115063243.181768-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 06:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106733

License-Update: Copyright years changed

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-multimedia/libopenmpt/libopenmpt_0.7.3.bb           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.3.bb b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.3.bb
index 58fc8278e..92f33da89 100644
--- a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.3.bb
+++ b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.3.bb
@@ -14,7 +14,7 @@ DEPENDS = "virtual/libiconv"
 SRC_URI = "https://lib.openmpt.org/files/libopenmpt/src/libopenmpt-${PV}+release.autotools.tar.gz \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "ffd572d817a090554f55adf97c1997c2"
+
 SRC_URI[sha256sum] = "2cf8369b7916b09264f3f14b9fb6cef35a6e9bee0328dec4f49d98211ccfd722"
 
 S = "${WORKDIR}/libopenmpt-${PV}+release.autotools"
-- 
2.25.1


