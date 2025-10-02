Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C223CCD184
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 12:59:47 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.7556.1759409985485937856
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 05:59:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ep9NETPI;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b403bb7843eso223038466b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 05:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759409984; x=1760014784; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/DbA2Yg6W5BgQCeGglHmm1vUAL7j4OlbmLraET34eRo=;
        b=ep9NETPIs7KY4izS9PzNDYozd88XdnmDKGG51NbNqO164sPk3hKNRNQ+fPb/TbEeKe
         Zr0ZVoXPuOxMM6hYlg2xbwhBoDHlY3RPdiE5cePv1yuSGTntd8kROvZueNKAp/MS+Z79
         UXEn5XvAV1i46uxw9T55XfzADt8R6QVLsFrkIxllYdTJOPQVedmqss1wPQ2yAcWIAzRE
         EqPbkfaHJwK/mU9iyorAthIi515rKFZRRKcKy2INVpUb0Mfns8ZNQZSA4XcvEbJoGSg9
         2zScY4HL79ov/tLIxLCCc6/JmSSolJM+vt7eQTo9Gv+RWf4VoiYLIQjb3J5C+0SJs9sH
         ThFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409984; x=1760014784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/DbA2Yg6W5BgQCeGglHmm1vUAL7j4OlbmLraET34eRo=;
        b=lCYurmoShxcR4K9RHcs9uJtJ8KwKR1jBPcCSmhD6u1b9VMsI6yjPrX3v9sKn4tfs6W
         jvwetvrKdhxDNh8ZsSYo6YZQj6cAFNLvE9nVjZZIIoMGgkxpN9QuFL1szpOAQPewczMU
         czw6YlqeKId1GhdgGPFqvW9+chO1EFOc0u5lHeoM0Q8jY3XTGjptLyuPH5i2j6rf402e
         DDDV21u04trP/+r+FzcVv3+T0LW1C9je3lYyr+FYWUaunOLnak6XfaerCUiHiN8TBb9q
         jQMUVHebzZcBM8Yuw+JyG/rQdctxUrIl5UkdvoFTPvdTL1oS+4/HuyExi+gj4ChkStgG
         LvLw==
X-Gm-Message-State: AOJu0YwaDlmI3UXuCXck6wQ7XC1VAVCKZm4u/sPZ0/XudoP6ZkHsgUj4
	Ky7sX1srb2jWSyE4VrVYTz/wz3wwl0PtXjhu574zYFNXEF3hnsgARSGpbnEYhg==
X-Gm-Gg: ASbGncv3jPXaXr5WG+/CgTxTBws6xrGPadiWcUrBVYXGa/NbJDxCe6gHYuhxcB1NM0g
	he/t8qhce9YDV6F13h+aNMnrl21mx0+EREttiWoaMVyYGEahbl6vUQWkSx/KxZBGSzOTYTahZSi
	U4QFZUqQGW0zlJx9mvrtTrP0kleN29+ThilThqijR7WCEUl9eLjCApw1I1sll3Rn7tnNJk3otZg
	pmF+hPeX52iLXFthoMQR7oqUMxiL5mhgqmWhs6uEVEEhv/qhEYo+jPnCTqNtqiD+LvRYkHLRjoA
	TLykEwryMLsUyQ32taBttcgbcPNvl5y8jyerABBgEau2Sxkjwsnz4eooY3d8v4fbDXC7vSdAqJd
	Lmf0VZByr3WEAplQPEPihq2yvtqNKtuZVsxeIA3LHA6Pn7Qond053Kq0=
X-Google-Smtp-Source: AGHT+IGW8VV+P8mhX1zEFcDtox565tDI6EpYfGQpI8Qr1QjTqNuKKTZEQv4+SZpPnxj0nwASO7Ooag==
X-Received: by 2002:a17:907:7e9a:b0:b3d:30d8:b8a0 with SMTP id a640c23a62f3a-b46e9571897mr849720566b.52.1759409983736;
        Thu, 02 Oct 2025 05:59:43 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b03sm194127166b.84.2025.10.02.05.59.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 05:59:43 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 22/26] python3-hpack: add missing run-time dependencies
Date: Thu,  2 Oct 2025 14:59:22 +0200
Message-ID: <20251002125926.2624522-23-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002125926.2624522-1-skandigraun@gmail.com>
References: <20251002125926.2624522-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 12:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120191

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1659a00086a360f64129fb28eaaf3066ae7589d6)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-connectivity/python-hpack/python3-hpack_4.0.0.bb    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.0.0.bb b/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.0.0.bb
index afba98e4b3..0297cb8c27 100644
--- a/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.0.0.bb
+++ b/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.0.0.bb
@@ -8,3 +8,5 @@ SRC_URI[md5sum] = "27e01514ef06dc9fa0798d3dcb7de47c"
 SRC_URI[sha256sum] = "fc41de0c63e687ebffde81187a948221294896f6bdc0ae2312708df339430095"
 
 inherit pypi setuptools3
+
+RDEPENDS:${PN} += "${PYTHON_PN}-logging"

