Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58944C0218D
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 08:13:59 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.6453.1737620033518443512
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jan 2025 00:13:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=nTB6odU1;
 spf=pass (domain: konsulko.com, ip: 209.85.218.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa6a92f863cso130433766b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jan 2025 00:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1737620032; x=1738224832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WZDIqUn5+eUhpniYlqdYU8S0HtQRrzZVh5e4e7WyWyA=;
        b=nTB6odU12XmnakP7z7Way5UvXzW4CudAYIlePGT7E3ETx7G7DqTjtbHSek9Ly5TEjn
         sUC5HihJ0WLFwxfMONCWjOoXGRzaQL8d09xTZe1TTmSZcsLK35XdNNs8QYe1eS/Y2yUF
         yEV3Q2E3FkVjFNTdNG+1BXTm2Oo5sY6VgPI8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737620032; x=1738224832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WZDIqUn5+eUhpniYlqdYU8S0HtQRrzZVh5e4e7WyWyA=;
        b=Zp3X1OKX+WaAo+oy37xGYQn45uTbe8LHieLEiNke2H/7MZmqg/WQf4yug6Ok60iYWM
         TgtaWHpCPsXxO/t0ouWmOSwU0mLMmulbb6iRpEiyjKCaa7htGfbFkvD48YhiH2cRO0m+
         s9msbbkHpOHBwNhjif1lwnH9BMVuiONEcPG4zVw3tjUupjkC4BxSKnLDSj1w3feZ0vuy
         zgj3zRQtynWSrRS7WljgzRNhrjXU/6ohBrUPSh1bXlLY0LikJu1lsGFMfyaTK4NNclTb
         oQYKCAPlX8xIaVTvFcg4dGP4UwkTcLm6mlF4O+inRANPTGxFSp7EecgtHt2Ln8DnwnvN
         sXcQ==
X-Gm-Message-State: AOJu0Yw5Dd9uVg4J4VQf81Wu9l5M1HtjuFJHP7RsH9DRgHlpGog+ot5v
	X0jq1L3kNzno8MGWrqd4aJr1TBcX1iRubwzaOIjN93NSoaOEVHpbfCRXkFR/32rWLGnQGwGWPxE
	9
X-Gm-Gg: ASbGncsJgn8uGzubiPTHgqbHADxpTb9tOK6oPL0iAnp9gyzbbmszLwd9sESr3x39iqk
	0rQNRCurjuSw6H15QBOmThGp+dTzutZjRnUVF72wUR3QEnXrtYw3TEQNMvGnS3i2o6aCwJUYfyV
	EYaaCSInYXuoMhDPtDJRvoEnXfnQ6TTNyfVk1fuDihIMAFMS23Md5aZV8NnEiWXaKp8aMIXydkg
	qi+A8S857NLftXc486RTDmlUWFHopjwb87Ro6gc/AICYJ4hyZg4HsbXHHzoJUJbWgA6GMbst2YW
	zXBwuXVYagB6o4MKN7E=
X-Google-Smtp-Source: AGHT+IEnwszF3DZ1lCE6ibCb2YWkX+T6Q37Vh+YP0zAvAzjH4ra7wIEk0zRaxr6kakLHYvjb96Pxgw==
X-Received: by 2002:a17:907:9617:b0:ab2:b72e:cf44 with SMTP id a640c23a62f3a-ab38b1b1b94mr2512218066b.2.1737620031469;
        Thu, 23 Jan 2025 00:13:51 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f290fasm1040414966b.103.2025.01.23.00.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 00:13:51 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-imageio: Upgrade 2.36.1 -> 2.37.0
Date: Thu, 23 Jan 2025 10:13:45 +0200
Message-Id: <20250123081349.3440231-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jan 2025 08:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115028

Upgrade to release 2.37.0:

- Arr.newbyteorder deprecation in numpy>2.0
- Upgrade pyav plugin to support av v14
- Expose bacterial colony standard image

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-imageio_2.36.1.bb => python3-imageio_2.37.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.36.1.bb => python3-imageio_2.37.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.36.1.bb b/meta-python/recipes-devtools/python/python3-imageio_2.37.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.36.1.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.37.0.bb
index 2fff0cdff3..5de9ee466c 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.36.1.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.37.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "e4e1d231f47f9a9e16100b0f7ce1a86e8856fb4d1c0fa2c4365a316f1746be62"
+SRC_URI[sha256sum] = "71b57b3669666272c818497aebba2b4c5f20d5b37c81720e5e1a56d59c492996"
 
 inherit pypi setuptools3
 
-- 
2.39.5


