Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web09.266.1617899807070758070
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ODlTtZa4;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id h6-20020a0568300346b02901b71a850ab4so2890946ote.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=sIkluJmTinDa29qEhomT4KQKagMtvcW4ttCInw5k2k8=;
        b=ODlTtZa4D3/6ki+74OTP3X8nlDFBZtgXO0figsDLN3U3KsAGs+/coRt2aviGjnPYsT
         PwsFjDqXvgfJ2ZzzvEyiRSLunJe+Vh3tGpitIs/I/IFcTS8N6/vYByMSYYqTz8Q+JLMH
         kk0hNgXiz40W/LFkj1Iqe6nXS9qZv+NQM00BleutgbpBvb8kbygh64K+hdJnd5X4x0TK
         hMUWI6k4uCHJ8p8Rrak6QvFJqUQPMesJLDe9EyCFflqitzkXIOi9D0dpyAyDGZFDceiA
         KQEdQVK1UzkbBIRnSc9Vn5H4oV6oGliSEbI9I3UKflp8Cxek5RwmGvkloyA1zNaPUCMu
         4fhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=sIkluJmTinDa29qEhomT4KQKagMtvcW4ttCInw5k2k8=;
        b=ftkllxAYe+qenY6iq4WDOOMw0k+6O09USkMj2QjXOfY3fb0I1Pn6BoPSfX6bxOaGN/
         xfqUHgHRCT/WL3w4/brCROTXTxYsImL4kf6cvOtrd3iPaFG0lr6kBxA4udGrlD/YHMoY
         RhsXeFywx2arF0hClxZ26IkTqTvWteWLP0pmvEEtSrAzaHO3yCOtZowDcBiqB3qWES1J
         uwK33YlqNWKYbI+jZxeupQzGcHqg9gvD0fozDQqX2RT5WlH+CKkaTB3cpXv9HYZINA2f
         N0pUemjOvJaU1DZi360cOKbCr/Ahi3HaIKeI22jkXvVKagTw/vMpdx2jzjjIAz/AekoV
         brww==
X-Gm-Message-State: AOAM531XIfrpfmU1FOgb5/mBhD3ygPKXA04g33cStbigLLZAKWMv9cxF
	p47tkw3zIpMoBTXCiLxU8NuLXadL5ZY=
X-Google-Smtp-Source: ABdhPJwl3m4DyX3E2512Tp7EgUBqsq83Ob+NA7myX4NQhek8yxPELHe8J+YNP1WGkGzar74m1ItAzA==
X-Received: by 2002:a05:6830:1c2b:: with SMTP id f11mr8616477ote.125.1617899805898;
        Thu, 08 Apr 2021 09:36:45 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:45 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 36/64] python3-google-api-python-client: Upgrade 2.0.2 -> 2.1.0
Date: Thu,  8 Apr 2021 09:35:43 -0700
Message-Id: <6e4d464c883c17bca3f8bc0b4c469c64c290db70.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 2.1.0:

- Add status_code property on http error handling
- Change default of static_discovery when discoveryServiceUrl set
- Correct api version in oauth-installed.md
- fix .close()
- Resolve issue where num_retries would have no effect
- Distinguish between public/private docs in 2.0 guide
- Update README to promote cloud client libraries

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 212c6a5f1447f92d70c68c06855735927866cfdb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...lient_2.0.2.bb => python3-google-api-python-client_2.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.0.2.bb => python3-google-api-python-client_2.1.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.0.2.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.1.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.0.2.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.1.0.bb
index 38aa349a6f2..11b94b3fcda 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.1.0.bb
@@ -4,6 +4,6 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
 
-SRC_URI[sha256sum] = "48686cceb0dc8cb8b9ee1920ad7c0d9b499ef4fca0ca51c1c69f1e462a628011"
+SRC_URI[sha256sum] = "f9ac377efe69571aea1acc9e15760d4204aca23c4464eb63f963ae4defc95d97"
 
 inherit pypi setuptools3
-- 
2.17.1

