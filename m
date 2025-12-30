Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B1CEE4987
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 15:49:13 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66705.1767109748714288220
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 07:49:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UWTnVjFI;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47d493a9b96so15810365e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 07:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767109747; x=1767714547; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9luqlq1pXJAgqtQ0/A5f1r93gGVLlY4Os1/wX0Y1ljA=;
        b=UWTnVjFIRhSjcy9MSD57sQiYo9jcAZkAUBiosJc4ivE1JPYIJuzEsIusHQOnUlV4EZ
         /QP0diyF6rLFjGpBZwyYhNUlpuULs9xztyzuy88X91mgK7I6cwfLFLe6BI87pi3HBd8y
         MbGe38be3/r0nQ8gOKwJrNxn5f3o2uNEhc1hHKeaCXAGYe5cKLMtSwvNV6Zu1dULf0gt
         5++IjrYsqxUiL2gecGECS7h4tvcSXbA6LwcsuIJWHX1cfVkII7wI22VnitEhmaZudWRv
         6y3BVPS5ghPOuBajuAveFAer+IRq6l+g9vOGXXFE4jhl2eDF9Ergc81jzGFWBNGBCYtU
         goKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767109747; x=1767714547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9luqlq1pXJAgqtQ0/A5f1r93gGVLlY4Os1/wX0Y1ljA=;
        b=aJ2jucGnZ2CXQsAfq9NHHsl45/slxLVyGbyMWcD8y+RmCstzmR24t/OODwxcRk0aoi
         tBSgjNJBpEln7lSmzMbtDQOvdo6KwSTmTi3eb9F9jSrxlvTJR7d2atRj7ngwWDePF4zZ
         jJiYxdq9wrCYk0EnOaUNYyK8JPT0EZkyy3Q/id3+lbIkYwmsZGV0t99EDkQeW+0z/BFa
         K11crYUvJ44zPYDIS3yRg1MDKmchPxOQDn3q0zu87YKeJlOiQWOmDWCOQNyfA28Fdhcl
         FxW8STqU7CfQQDJwsfWJ19/xA2KZyQms8yLGcn5e8VuK+SIq+tDW3HIxmyRjuBta/Ed9
         OOqw==
X-Gm-Message-State: AOJu0YwIcn4IET9uI5C9VG7V2XEpAx1IdMT0CMhR7M4WTCM4LM8gTzcn
	s3kc+MTF/HKQ0EwnRQ9JpJk7G0R9ylnvYvrOod3iUKGR9zmfmS2nwllG0MVQOw==
X-Gm-Gg: AY/fxX5PkCNL8TZkEvkmp7BFmjchJaxLAnEFTucqDv3INqnmQcv3DNB02YKqU6UfdbC
	W288XOJmNYnLpW5xPVxw4hUhSpodDc55mX3JZbAvg6G0UXOHISXrcxumkwYV8F5k7knFHOtLX42
	ts23HQz/LRk3K5iEVXLAuiv0vavMhmHn6BALjTtac/KVBRtyD/JHVgF4H33KhXYXkHwbr9EOHsb
	xHc6J57eFznKk41kpmUxoJLYTfTPzsx7jHTQXsQ4nMbiv1E1lmlOJnASqh+YzXfRQD0/nnx5DaV
	uHnf6UfRM5Eq7cqiGaAJzCQ13L223vtCt652iZFEev1rYwjVANouFn5lH7ajGIHYUMxmreEFHLY
	nBzAizxfhJd+8tajhdrhv2LXz05M62RcpAAhRY1TKZJ9s70pXvuRVqMBPhfvmFEO4lZ51nx2bZh
	5sYjgl3Ky9VTVOakeavoM=
X-Google-Smtp-Source: AGHT+IGOzMU9pL5Oaoopxf+ZuHzGIY0ZgJNsBPp0/o73eb9iGL9ssYxob+Etvvrqoz8rV4Ixn7ld5Q==
X-Received: by 2002:a05:600c:4e8e:b0:477:b0b8:4dd0 with SMTP id 5b1f17b1804b1-47d1957b120mr415419115e9.17.1767109747020;
        Tue, 30 Dec 2025 07:49:07 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a210e7sm253051225e9.3.2025.12.30.07.49.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 07:49:06 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 05/10] python3-nltk: set CVE_PRODUCT
Date: Tue, 30 Dec 2025 16:48:58 +0100
Message-ID: <20251230154903.736590-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230154903.736590-1-skandigraun@gmail.com>
References: <20251230154903.736590-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 15:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123030

The CVEs for this project are tracked under nltk:nltk CPE, which doesn't
match the default python:nltk CPE.

See CVE db query:
sqlite> select * from products where PRODUCT like 'nltk';
CVE-2019-14751|nltk|nltk|||3.4.5|<
CVE-2021-3828|nltk|nltk|||3.6.3|<=
CVE-2021-3842|nltk|nltk|||3.6.6|<
CVE-2021-43854|nltk|nltk|||3.6.5|<

Set the CVE_PRODUCT so it can be used to match CVEs.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.2.bb b/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.2.bb
index 8a1e0cc047..43c23254d9 100644
--- a/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.2.bb
+++ b/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.2.bb
@@ -7,6 +7,8 @@ BUGTRACKER = "https://github.com/nltk/nltk/issues"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
+CVE_PRODUCT = "nltk"
+
 RDEPENDS:${PN} = "\
     python3-click \
     python3-joblib \

