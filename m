Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 555C2CCFA10
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 23:32:42 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.30765.1727307160942983730
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Sep 2024 16:32:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N1hXz3id;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7d666fb3fb9so231730a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 16:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727307160; x=1727911960; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JL4++0add67cNMoqf91Jea0WHVTwVbogkpr5ka+HB6A=;
        b=N1hXz3id0xoKB/wfEVzg+07ghaTIAveE8wbrN3apLqzbh6KEzerkZKZitIqPdNkD13
         n9MX62H3+eaB6nLK3shFfJ9y3E/erFvKXXqoyb0fKi679R4laerKPTcfBYAuPOfS+BaD
         1Ra2NtDe5s2SdHPqw8URv9bmhftobmIvMFTPYjTUyE2VNUJM4xUlAbgO+1LaXnH5FVrv
         nD7Kw5JmJJVMYOD5WYmgMrkqEMMigiGedG7WKtM9vdwM8cxsbtqttJEraLXhnScWSqLa
         kUs6X2D3BoP4sHoTvyHdwXEG5/LmNuCEwyKe9TnHhiZqvQto/9gh0wEzHwgYI9eGa3cw
         ugMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727307160; x=1727911960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JL4++0add67cNMoqf91Jea0WHVTwVbogkpr5ka+HB6A=;
        b=Pdcuul8RyO/KlHWeFY0at3OQyC+29dCZQWrBNSxGsPeCsWuoHZyvqfUllxAMtvnvoC
         kt3eRwBWKpVh6tM56VqiVkEV1vG3FeSDZ4MOhqIHvB53EnouYd5parPSXD5YFkeIILvU
         xPVJsGI8nXHLLA7RIftAEFWHtYEJsssOm8vdU5f1r4M6NpLkgJ7Byl90D/ARyv2IMHEs
         giUbDWHhNcQtju8202bKpWj0c8cjw+vV7IN9qjKGtqmP7ac+mU993/OE0G2DoQ5L6ooD
         QKYKKIyl2K6wXqWzlceTJFDqNzfgTjlj1qE7+Dk5Oa2u2Z0mXFcokBucDeVpbdyw2WB0
         /xsA==
X-Gm-Message-State: AOJu0YxKOXdziqNRclO8sBolqAg4xqGafQEmSlObXgIdM4AAjBc9SnsF
	/z7fJm625WaCWGdhoAPqQWwfNsUTZL5E8Ufvv3KD0dmKbdundJwaJgolrhOS
X-Google-Smtp-Source: AGHT+IFSGDaXdCDX98++Zs5P8tttXZH6604ttvnE0FenQNm/lIwdXYcGI0ozATBmvJ/cDF5rO8JWYw==
X-Received: by 2002:a05:6a20:cd8f:b0:1d4:e40b:8990 with SMTP id adf61e73a8af0-1d4ebe09086mr1748723637.1.1727307160063;
        Wed, 25 Sep 2024 16:32:40 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::eea4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71afc939046sm3243550b3a.107.2024.09.25.16.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 16:32:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 5/5] python3-validators: Add missing rdeps for ptests
Date: Wed, 25 Sep 2024 16:32:34 -0700
Message-ID: <20240925233234.1685606-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240925233234.1685606-1-raj.khem@gmail.com>
References: <20240925233234.1685606-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 23:32:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112506

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-validators_0.34.0.bb      | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-validators_0.34.0.bb b/meta-python/recipes-devtools/python/python3-validators_0.34.0.bb
index ebba683884..41ead5c051 100644
--- a/meta-python/recipes-devtools/python/python3-validators_0.34.0.bb
+++ b/meta-python/recipes-devtools/python/python3-validators_0.34.0.bb
@@ -12,6 +12,10 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
+	python3-decorator \
+	python3-eth-hash \
+	python3-isort \
+	python3-pycryptodome \
 	python3-pytest \
 	python3-unittest-automake-output \
 "

