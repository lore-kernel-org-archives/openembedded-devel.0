Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 818A1D31A15
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 07:34:52 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5343.1768376084869099734
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 23:34:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cwKxnT15;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso70521965e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 23:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768376083; x=1768980883; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n1DlyL9Dz1KaMs3hdobXrA801EK6OwDvgNly8LXiQqs=;
        b=cwKxnT150c7hr4B2n/fKkCH6OQucRC1H+YG+A2oSrbOpcqXjA33B7Dsin03tzaJ1wf
         PBJPENheoGQYaU9BI0/HI3tAB7XPPBjUJxUmQ0DhKDdOKXqz4OcTVIe9ylkXoTeRxEdq
         VkUwuZc0qf6YfUq69Mfdko44PXzGvJXiSzu7VKJdEeq9A76KLdDJBMukByjPmtaK5Wba
         DcteNfwDWPD5q1aN+J+oxfKZYGl7lU754wR0YrYRHF8u5cPjo4EsPfVBGSe6AxpIGT+d
         kgzRxdMzw/TlfYtpcQJY7D9VZsBu7ZSbCoLE/u6jBngvKsx1W8vWS3wJiOAP0PGPNhO1
         0SEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768376083; x=1768980883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n1DlyL9Dz1KaMs3hdobXrA801EK6OwDvgNly8LXiQqs=;
        b=tdeja5RSzjzjWQBjSSbmfFRFw82+DP1/lkt45/rLyIsnCxGWB8aDB1Qu8siBO4VS5Y
         uI+QDVcevyqkaLH0YcsUvQ8Z9j95md1P5s4VSVcMgr1RTa+5DrLd9D7atUOgYf7iiI9h
         ROTWZ9oJEjU4yUYhFJCHA6slbKaUp+9+3ewqk7b9iSA0aO7QF9sR78aPrqBtqFLPC2Eb
         xbKZpCarQhoXWU2LrJpE9zHarmbg1mqpoI+/EN9OdMEuDJEMb/QFwtKE71ZHiDZpG8sZ
         4jCcPCsl6N8RGEOlpTUgZgtbRCvP4BeWwfhQ91KkiFcuAwhsjZBeBkaqiI7UfIra08pn
         QgBA==
X-Gm-Message-State: AOJu0Yzxs6lCEBikIzDRCXMln7+54lSNMV6mt8YZOGc6BPEcNsKgq2qv
	JimQJIgGy1eaupuuMdU/ocT/ipF6ZBi8JdvnunROyB7xj9uA2axtX/pt2a/zNA==
X-Gm-Gg: AY/fxX7yPLwPGHtqD7+2jFHcqJMbvsxjapq2dfYVEv+L+bdE3AQahzL09diIlS44ySw
	uBcBG2U1UJTrWg71Vi8JIRoBMus7JCaSRREEdDiR+zvR2xE92n1KdEO2eIj5insTaeqYWXrBdVJ
	CxDJGS95MUKEFhO0FOo7f5WItioo2qPCmig7XjrhW3CM2qe/W3O2X6vaDKCx75pLlysa4qyurXR
	xRpWffHCrNtSNIsmgGWlus5LaOc3Byc3ig55Vv9yGMqQRPs+h3ySpvmzs7hsSG+yWeqk4lqWhYX
	uVToDHTyaZIQLDSPGHFWyxp8DW3ctSja1bQFfWOAnJzRzeJmjDcKr0jaO7Kn/tBuZPT708VzJBF
	oIV6iqRkxA4+V3j1FBhDT5Gb5NqBZOo1NQXv8kBfTrgln+nQb8yqAw8T/PIJrvphAhYneF6PKHH
	AsT+i9d6d5
X-Received: by 2002:a5d:5f43:0:b0:431:1ae:a3ca with SMTP id ffacd0b85a97d-4342d389557mr1227688f8f.11.1768376082983;
        Tue, 13 Jan 2026 23:34:42 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df96asm47598289f8f.28.2026.01.13.23.34.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 23:34:42 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 2/5] python3-django: fix intendation error in CVE patch
Date: Wed, 14 Jan 2026 08:34:36 +0100
Message-ID: <20260114073440.210915-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114073440.210915-1-skandigraun@gmail.com>
References: <20260114073440.210915-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 07:34:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123447

This change is for python3-django_2.2.28.

This patch contains an incorrect intendation, making the tests fail.
This change fixes that.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python/python3-django/CVE-2024-41991.patch | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2024-41991.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2024-41991.patch
index c050a4ad38..057d89ec18 100644
--- a/meta-python/recipes-devtools/python/python3-django/CVE-2024-41991.patch
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2024-41991.patch
@@ -95,15 +95,15 @@ index 5abab8d..1956655 100644
              ),
              ('foo@example.com', '<a href="mailto:foo@example.com">foo@example.com</a>'),
          )
-+            (
-+                "test@" + "한.글." * 15 + "aaa",
-+                '<a href="mailto:test@'
-+                + "xn--6q8b.xn--bj0b." * 15
-+                + 'aaa">'
-+                + "test@"
-+                + "한.글." * 15
-+                + "aaa</a>",
-+            ),
++        (
++            "test@" + "한.글." * 15 + "aaa",
++            '<a href="mailto:test@'
++            + "xn--6q8b.xn--bj0b." * 15
++            + 'aaa">'
++            + "test@"
++            + "한.글." * 15
++            + "aaa</a>",
++        ),
          for value, output in tests:
              with self.subTest(value=value):
                  self.assertEqual(urlize(value), output)

