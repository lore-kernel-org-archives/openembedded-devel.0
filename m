Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A38C369A8
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 00:42:16 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.14145.1744332127859810151
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 17:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ip9S3Gou;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7369ce5d323so1274128b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 17:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744332127; x=1744936927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZK/7XHnvCLlPzn7hjwj2oY2vgSUHloL8qi1rkbEo0g=;
        b=Ip9S3GouWQUSd5k6w1Gq9cLiUqTejky0gCtEuM78Q/WPdYFNC+Vw3d4z5ccp/jNj75
         x1B7+FoUlHfp87Yqi0qVa236jLXjzCO01RWsF/N1nup9jH7aB7DzJMuJ4BTSa81AkoVv
         E9/p1H6Gu36F8g8Z3Yz7uReBC4YvoFtnTN4qsgoFMBULHiagsw/75H4N3VAdeQUVlyS4
         PiWnkiIrdJ6aNxZmQEWh5q9bbbMwlnhQwxMUbQey846b+sgjzk4E03nsOukSPw3xy8+r
         ATAALZyBkK17SE8jTYQXpBQgjB067iIYbh/4Ph5qLMvVz48+RG/yVBENaqNgsvQlhgHD
         iSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744332127; x=1744936927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ZK/7XHnvCLlPzn7hjwj2oY2vgSUHloL8qi1rkbEo0g=;
        b=S3qaYen6C3Cc3Kcs2PBX5guiz1gFx4gA9My/SGiVzi87COmsVogdXc0gvRIzQVX8ta
         LHOghfWxwjVLJ2VrpIbYHxqFL4kMhMtOnxCvJlVSVKKYKbhsiWun/pmiafLZOfS8l9gy
         ypn+7ZDp7f9yA4lcnl5cJD+HNgmR7k5Qn9822eC+SNed5K8umC/C7Zi8JPnkmpTfT09X
         pK6/ArXiJBQ1Ud40C6zyWrLR5SHmhy4WMFAZsgJupqVcCUIqk1l/eE+1r7fGp13PwJzo
         UiUeiak6VWqxe3C5iBGI6Vnr0PoLj+z/5Lhkl5QvlRKoy5NZ4XtPBnST7R3jO0v6f/69
         rnaQ==
X-Gm-Message-State: AOJu0YxWuwmqP4KtPPxhO/MvO7mW1wLXtK+D4yU9edCXHlr1XvMz3h5G
	LNDQRE8zAEpalmjmy5OiWPwWSMQ1QNHtDl7VTHB7AtyWxmyrWtzRV0Lg/K0m
X-Gm-Gg: ASbGncv03WHtLJSBHnXA8ipaCyJVLiYjMYwnUHmieb4kHqKkEMqTs6SsDSEN8Js/m/Q
	TzRcfZ7tE5wTQzpaX1FL7loDznqvSsK/RyosNcw6ol1EKtCQy2jLZtqlcNm1zpBMBlQz41yVijn
	0AsUyWy+qNZoDE8MwI6Qxrc/FwHKiBpvwrUWya7K6BQHqpE90l2NmjrPKwJWsLLgaBLwEIdYtdK
	emmlfbOxHPQBaaAhV6z8C+M+Gz/1YWy9w4bFYCK2YgZBKCdEiqrsCGr6/YO0bMvV2jIv0lndGxF
	yoLc0Y8sMCOxAxgmFJklvHe9gbsQrHfiVXNxfLl/78I=
X-Google-Smtp-Source: AGHT+IG/0+dnJXQ152pBFB1WEmAlvAZ8GI8qQ8ln6jOWL3lbYl6Xqs7ShYYSKIOHNKHBenbBPieRuQ==
X-Received: by 2002:a05:6a00:3a16:b0:736:450c:fa54 with SMTP id d2e1a72fcca58-73bd11dbfc7mr987273b3a.6.1744332126935;
        Thu, 10 Apr 2025 17:42:06 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c6464sm226987b3a.64.2025.04.10.17.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:42:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 03/12] python3-fastnumbers: Switch to PEP-517 build backend and enable ptest
Date: Thu, 10 Apr 2025 17:41:52 -0700
Message-ID: <20250411004201.3826913-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411004201.3826913-1-raj.khem@gmail.com>
References: <20250411004201.3826913-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 00:42:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116777

test run takes < 1min, added to PTESTS_FAST_META_PYTHON

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../conf/include/ptest-packagelists-meta-python.inc   |  1 +
 .../python/python3-fastnumbers_5.1.1.bb               | 11 ++++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index ca91065af0..58f53dedc7 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -22,6 +22,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-dasbus \
     python3-dominate \
     python3-execnet \
+    python3-fastnumbers \
     python3-flask \
     python3-flexcache \
     python3-flexparser \
diff --git a/meta-python/recipes-devtools/python/python3-fastnumbers_5.1.1.bb b/meta-python/recipes-devtools/python/python3-fastnumbers_5.1.1.bb
index 28ef40fa05..3a92fe0ab4 100644
--- a/meta-python/recipes-devtools/python/python3-fastnumbers_5.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-fastnumbers_5.1.1.bb
@@ -7,4 +7,13 @@ PYPI_PACKAGE = "fastnumbers"
 
 SRC_URI[sha256sum] = "183fa021cdc052edaeede5c23e3086461deb7562b567614edf71b29515f5fa4b"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta ptest-python-pytest
+
+DEPENDS += "python3-setuptools-scm-native"
+
+RDEPENDS:${PN}-ptest += "\
+						 python3-ctypes \
+						 python3-hypothesis \
+						 python3-numpy \
+						 python3-typing-extensions \
+						 "

