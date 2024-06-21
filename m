Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD22C2BD09
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 11:35:10 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.70849.1718969707116414375
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jun 2024 04:35:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=DGG34Gjo;
 spf=pass (domain: konsulko.com, ip: 209.85.221.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3620ee2cdf7so1211968f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Jun 2024 04:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1718969705; x=1719574505; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Sry1M7bd7yIhZoqPtSIZMeIUVMlHXo8BnXB9e6h5fI=;
        b=DGG34GjocfZiAZDKmez0jhJHhKlW6sNrItk+IErk3CKg60oimgXposYf5NBQSOmUGh
         mTCBfPW3FKwT2RdSOqZvqYVy8WVBvjlwSCNC1LOgJYH36OjjwGEefn422g3sXJmqLChf
         Asg+LsOGqHzPOKUDA1hLGsbLIK78cX+V0VWms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718969705; x=1719574505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Sry1M7bd7yIhZoqPtSIZMeIUVMlHXo8BnXB9e6h5fI=;
        b=ErptfLxKq8YiaIr6Yf00B1PgHf60h6kSOEXgFAIGSZD//zG2LfnUpUMsa8dwFYXE4v
         WZabyYoIC3Gutqb/NJl1IQPJw0VBJlOF0TXCMIoI2n4PBqYuze38H8OEgTph5yPz1mxG
         9vXir2EAp/IwM2n1nyx16CjiJBk6bApSXAE6VddIVHUbnu5vZtQPTwO5dp0xsMEBsQ3C
         xrVRKGK/45MrjLUIhUp66kI2yKG2/Al1fdSTqQSBsti/xbW8+tkvN39ryNDkhZhnEnlM
         SmRa7BWlABkrHCImD0qpWS3aR7X1fp8/xx8fxqxhLu8g5gLUrEcYI7pN7SI5HJHCq3Nz
         Kghw==
X-Gm-Message-State: AOJu0YzXzy+aPLVR+31nKTkBtbG9v8yt/aFHODZ61hvv1Z+/PPlUbmTR
	YgD3m/0qDWCTxubSSGa/8sXH0Y2nGEO/FRQkmDdxvr1ahhu7rQqNqDgt6sXyhjs3R8J1c29cWMY
	r
X-Google-Smtp-Source: AGHT+IExGjZKGz7Rq+YaukMl9ygNf4+QofJzVzQHfP5IN5orJm4Z13Ihs4k9fSsq7rEMDvoAbMiUhg==
X-Received: by 2002:adf:e501:0:b0:360:709c:505a with SMTP id ffacd0b85a97d-363192ce42amr5748184f8f.51.1718969705428;
        Fri, 21 Jun 2024 04:35:05 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a2f6d02sm1470662f8f.85.2024.06.21.04.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 04:35:05 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-gunicorn: Upgrade 21.2.0 -> 22.0.0
Date: Fri, 21 Jun 2024 14:34:59 +0300
Message-Id: <20240621113459.2188274-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621113459.2188274-1-leon.anavi@konsulko.com>
References: <20240621113459.2188274-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jun 2024 11:35:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110992

- use utime to notify workers liveness
- migrate setup to pyproject.toml
- fix numerous security vulnerabilities in HTTP parser (closing
  some request smuggling vectors)
- parsing additional requests is no longer attempted past
  unsupported request framing
- on HTTP versions < 1.1 support for chunked transfer is refused
  (only used in exploits)
- requests conflicting configured or passed SCRIPT_NAME now
  produce a verbose error
- Trailer fields are no longer inspected for headers indicating
  secure scheme
- support Python 3.12

License-Update: Update license year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-gunicorn_21.2.0.bb => python3-gunicorn_22.0.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gunicorn_21.2.0.bb => python3-gunicorn_22.0.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-gunicorn_21.2.0.bb b/meta-python/recipes-devtools/python/python3-gunicorn_22.0.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-gunicorn_21.2.0.bb
rename to meta-python/recipes-devtools/python/python3-gunicorn_22.0.0.bb
index 9fd601c99..e9ad084d4 100644
--- a/meta-python/recipes-devtools/python/python3-gunicorn_21.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gunicorn_22.0.0.bb
@@ -1,11 +1,11 @@
 SUMMARY = "WSGI HTTP Server for UNIX"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=302423eeae97079c633da81b6a5fe35e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5b70a8b30792a916f50dc96123e61ddf"
 
-SRC_URI[sha256sum] = "88ec8bff1d634f98e61b9f65bc4bf3cd918a90806c6f5c48bc5603849ec81033"
+SRC_URI[sha256sum] = "4a0b436239ff76fb33f11c07a16482c521a7e09c1ce3cc293c2330afe01bec63"
 
-inherit pypi setuptools3 ptest
+inherit pypi python_setuptools_build_meta ptest
 
 SRC_URI += " \
 	file://run-ptest \
-- 
2.39.2


