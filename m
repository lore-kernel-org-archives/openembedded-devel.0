Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2308C25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 17:44:50 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.1733.1716572684601273185
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 May 2024 10:44:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fo87PG6j;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5785e443cf4so1028679a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 10:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716572682; x=1717177482; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XUfJQUZmPUD0rHL7kJqQCdKuM+xSO2eTyqonoMMVoo8=;
        b=Fo87PG6jPhz8jPxwdqQQWAvrMJy7PVV4IU4arAY1EKsvcy6Ib8um/lDLpgI/r1XcDN
         xIKyAiGV/LbGu+EfZHmWd+eqV/dJnqaruPHIeQOJxYzPHcxkHC6MV5o0WuPsuk3n4Fti
         KcCu02XGfiU8ZmQRbyruBOqxqxHUt88RTTYlnn+LocgvJNz+X2NKmpRacvHpx6+zsa8v
         HbU+BktBf3YE5ntvlEInuvAeZR8oWQ4A30XR5gi5I5slO/qCIp8PyBfmnOaP8ul6az/9
         /Kp6NzHJCiIOAhjZ70qTIVGuTKI9nBthetTSVNV+NwizCrPnJJtucFBdARlas/jeiCLm
         hk+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716572682; x=1717177482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XUfJQUZmPUD0rHL7kJqQCdKuM+xSO2eTyqonoMMVoo8=;
        b=PM6HhLY4AjjZU3FdcB7OtQItoT6OVfQY521UmVfw4qFZuYlWy8zup2CgZRVypE8Lc/
         R6fYm6TSSDo+Hh34yzBRwh3csJV7uyZ7ACmWSC9oIA4hs4lPiwXyW3lyjNpuelTiEb5Y
         UI3TyaKrFi+D3ppxNJ/h+niY2/YcwlQpW1JA9LinS8xiEqV2mLmzymMY5VXmO3XNxIdW
         Op7lotnLae0L7l9wMUvq7nbIq/XYwx4USp9VMWXikN7HMUFj+m3rThRbGe0bROJN+aC7
         CqZroqq28pRGkJpwBnWfFlV2kVdn+ttDc2QosgAxIhz5meB3Ynk5AYoX98A5IvKV77Pf
         K6WQ==
X-Gm-Message-State: AOJu0YxzHJmpmTmuWMYMJ8lwRzgIv4Yxv4cjb9xQ1HjpUEVuL7xKmFdj
	4bahIrbYBdw+Q4yaVGrHxI8gP+PaeE+S/oqAIgh1UzJKlTL43mSCwr7NDg==
X-Google-Smtp-Source: AGHT+IEHFWVkLLguSkMcIXrkJVV4Khxq+F2lbIl1Tae9zR+3itkl6LwRCnVYUUtJ+tcE9mkVzT+r9w==
X-Received: by 2002:a50:9e69:0:b0:578:64b9:d02e with SMTP id 4fb4d7f45d1cf-57864b9d078mr302754a12.40.1716572681543;
        Fri, 24 May 2024 10:44:41 -0700 (PDT)
Received: from control-center.home (232-13-20-31.ftth.glasoperator.nl. [31.20.13.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57852495e01sm1979737a12.63.2024.05.24.10.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 10:44:41 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 4/4] python3-requests-mock: new recipe
Date: Fri, 24 May 2024 17:43:48 +0000
Message-Id: <20240524174344.2105779-4-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524174344.2105779-1-t.f.g.geelen@gmail.com>
References: <20240524174344.2105779-1-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 17:44:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110522

Mocked responses for the requests library
---
 .../python/python3-requests-mock_1.12.1.bb               | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-requests-mock_1.12.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-requests-mock_1.12.1.bb b/meta-python/recipes-devtools/python/python3-requests-mock_1.12.1.bb
new file mode 100644
index 000000000..248526b00
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-requests-mock_1.12.1.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Mocked responses for the requests library"
+HOMEPAGE = "https://github.com/jamielennox/requests-mock"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b2eea41aec0f2973a45e1e45f28aa32"
+
+DEPENDS = "python3-setuptools-scm-native"
+SRC_URI[sha256sum] = "e9e12e333b525156e82a3c852f22016b9158220d2f47454de9cae8a77d371401"
+
+inherit pypi python_setuptools_build_meta
-- 
2.34.1


