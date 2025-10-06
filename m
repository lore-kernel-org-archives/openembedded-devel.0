Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F81CCA472
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 09:54:07 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.30323.1759744444069486794
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 02:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=gMzA/1jI;
 spf=pass (domain: konsulko.com, ip: 209.85.218.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afcb7a16441so767204166b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 02:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1759744442; x=1760349242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BRspUGruBHuN52eKWrqMnZEqkZYIKJeh6Q11ZBl3jmc=;
        b=gMzA/1jIBf8qHacKyOz1evCehzsm+P3nVGoUUZOk8ju7PCNX4qVXQ5yADCUp5ZXorr
         TUJBnUPQAWGcLor6LbZhR3vkfuBEPTr77ktszpl7amUWiUY1GNqot1JAfBOYMU4Q6qHZ
         T/X9hXQEY9yA/loAV+i7XZrSXqGRjeTz5VkK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759744442; x=1760349242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BRspUGruBHuN52eKWrqMnZEqkZYIKJeh6Q11ZBl3jmc=;
        b=CCxadlz9LWzZ605FHCLeU8fXUgA+FCyZnS9G/RxvxrHRyZd6cCWC0SVhVWolnSTd9B
         XdrfXS3VIeg9IxRwzv9X9ezm66vfC3P2j7IYFhtB7gkhRRVIQKGsZ89C1zkoQRWNX/Yi
         UhKyIv7BYb+iCu5tmlprH/qkZUfgc9+XYFu5Nh6uCI3nEHqsu3WsybAfLS1FBJrVdpH7
         wwrXCc9h7Q/ZfrD52K93/WJr75GcnQR7XM9JCNd2ypvR+Su6CHofI0erb5ARjb/7Ul3a
         qQP7Jgf/b2hRSrZ3UM/cj71tgSqrpsqXHXDEfWtLRF0umnzKkJgyloRmdU/xhsGO0Adi
         twVQ==
X-Gm-Message-State: AOJu0YwvmlslnN079VMsvCzX5rCA2oL2eUEkOiX8XlnjexH4Hh45BSSm
	C44FY46ZtD8oH/5F+3nycn+q0rOBm2oIhrr5bx+S2q2E6GD+l6KKMwtLIHymlEafOMB+RXSKI6A
	pvod2
X-Gm-Gg: ASbGncuQvTbnhGpSVuQjKMMpNnM54VSiOXuH05yPxEUE5gU9TiCSVoBUiQJbh2M0Fpw
	N55Mq8+48ruqworCtJx3FLHkk6N1g6+bN/BU7iEbmvzhzWD05cXLYi0V3yE6kNnUhD3UJ5cqtae
	GotcrLirs/5LGyQqWa6VINZ6rOI6nOn0dx/OzeBPd2K82W0ddRn3MHVdq3c6DwDgC8dorzMLzid
	Ml2hFcF6e2fpx3hAWnE8Pd+Xv61D7wbbxw5Xwxodak7SR6iu7T7ts/g14MxEpby+XVxTXJUQcqs
	7mO4hfsY5NqIGhicwWg7CJv0v579Vkf2HK5DCEYj9c3MISopaYCmkeTNDfWBmBLwdiLd/WHxoqn
	9hr05MvYQfC6T7Sj2mU6V5CYFLg9tq0Pygri0CqZrOQgDoKTyFfHVYPnjW0yv
X-Google-Smtp-Source: AGHT+IHDRcTQAQ0k2+/XYqYsVaeLjruozCSgj/igxxlk6mvcQH3kQoAWLi3oqudPY3pBAmP4IMbDcw==
X-Received: by 2002:a17:906:7952:b0:b3d:c47c:7cd4 with SMTP id a640c23a62f3a-b49c3b25f0cmr1396615866b.42.1759744442116;
        Mon, 06 Oct 2025 02:54:02 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486606dc84sm1094493466b.45.2025.10.06.02.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 02:54:01 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-yarl: Upgrade 1.20.1 -> 1.21.0
Date: Mon,  6 Oct 2025 12:53:55 +0300
Message-ID: <20251006095358.532479-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 09:54:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120273

Upgrade to release 1.21.0:

- The reusable-cibuildwheel.yml workflow has been refactored to be
  more generic and ci-cd.yml now holds all the configuration toggles
- When building wheels, the source distribution is now passed
  directly to the cibuildwheel invocation
- Added CI for Python 3.14

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-yarl_1.20.1.bb => python3-yarl_1.21.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-yarl_1.20.1.bb => python3-yarl_1.21.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.20.1.bb b/meta-python/recipes-devtools/python/python3-yarl_1.21.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-yarl_1.20.1.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.21.0.bb
index 6eedcf0f82..595717b8ab 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.20.1.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.21.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/yarl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "d017a4997ee50c91fd5466cef416231bb82177b93b029906cefc542ce14c35ac"
+SRC_URI[sha256sum] = "866c17223f7d734377a260a2800e14791cb5e55ec252de624e053a0b36b8568a"
 
 PYPI_PACKAGE = "yarl"
 
-- 
2.47.3


