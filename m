Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D72C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 16:38:59 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.64652.1723135134981357763
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 09:38:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=pZQJx9mb;
 spf=pass (domain: konsulko.com, ip: 209.85.214.182, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fc5549788eso11369975ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 09:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723135134; x=1723739934; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zxo/RmaGkjBPjFXyZAXfXFNSOFnvulbWaBHztOztLp8=;
        b=pZQJx9mbB0zU/DccVSlWBVXjjd3qqqZ1oqA/9eZt2fw6SLSZKPLzdmGxztVLNtTm+M
         NXUFNfifubUhDLa+dTVhQYj4afRuKDNsCpWr/TZ++NhQjA6M9OF4iZMIu1NxwwSm85es
         N9C1fFzCha3LB5+09Z8wXmqLljVsRgZzqFvBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723135134; x=1723739934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zxo/RmaGkjBPjFXyZAXfXFNSOFnvulbWaBHztOztLp8=;
        b=uC3KExJGKXFgzwnwZFjvB+66Y+uvcDOUtym1wEErpOKLXvIuIgV/ra5l9za3Kya3f3
         uYOb5TOI9nYcrU8jIujejj9tmTI+QY178KNfldhvMIoCoVPHuV0I5bB9yzo6RPc/wIOC
         RPPtRfTqnhpITnHHEG3GNs5UogeKGrV0t0glJ4wpZuWVhsiNit57IZOzFaXsdV4K3VFi
         Vo85SAAWueMfBpnWeD7ffaNjmQkKgtMqNgeOcRc9Owolezsosb6mdS/Zah/VwPOBoLoW
         /gRNmS3e1vQ/tuikLZeMGKQxpmsBY+B+cMFwwegn7NZcGyFH80jx7sxUaTj16AUNeN/k
         rkPA==
X-Gm-Message-State: AOJu0YxJK/Z+PM/etEtjtXNzZUCHAq7/k9vr42I1d+BZcF8PyChlsu44
	SDmVvBxpHy9/QShit130ePw/rQvCvuficOYDVjQ7vOX3r7tioPV8srK/FmS+PxR3hXsygwktiS8
	+O0A=
X-Google-Smtp-Source: AGHT+IGpSXYyj5BcA/jjwb8lPkq03/Oudhegjo7DtDGcTPL0RgH/0jYCc+mprBkXtrdJ9y/c10is4g==
X-Received: by 2002:a17:902:e5c3:b0:1fc:287f:628 with SMTP id d9443c01a7336-2009531cb1fmr37639205ad.53.1723135133958;
        Thu, 08 Aug 2024 09:38:53 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff5928ff1esm126563625ad.237.2024.08.08.09.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 09:38:53 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-pydantic: upgrade 2.7.3 -> 2.8.2
Date: Thu,  8 Aug 2024 09:38:41 -0700
Message-ID: <b7551f79ae4b124b136b485502c963c62edbafe4.1723134758.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1723134758.git.tim.orling@konsulko.com>
References: <cover.1723134758.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 16:38:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111673

From: Tim Orling <tim.orling@konsulko.com>

* Set RECIPE_NO_UPDATE_REASON because of issues we have been having with
  getting out of sync with required python3-pydantic-core version
* Add RDEPENDS for ptest:
  - python3-pydoc (for test_help cases)
  - python3-email-validator
  - The standard library provides the getpass module, we provide it
    in the python3-unixadmin sub-package of python3 recipe.
  - python3-rich

Full change log:
https://github.com/pydantic/pydantic/compare/v2.8.2...v2.7.3

Highlights of changes:

v2.8.2 (2024-07-03)
  * Fix issue with assertion caused by pluggable schema validator by
    @dmontagu in #9838
  * See https://docs.pydantic.dev/latest/changelog/#v282-2024-07-03

v2.8.1 (2024-07-03)¶
  * Bump pydantic-core to v2.20.1, pydantic-extra-types to v2.9.0 by
    @sydney-runkle in #9832
  * See https://docs.pydantic.dev/latest/changelog/#v281-2024-07-03

v2.8.0 (2024-07-01)
  * Bump pydantic-core to v2.20.0 by @sydney-runkle in #9745
  * Add support for Python 3.13 by @sydney-runkle in #9743
  * See https://docs.pydantic.dev/latest/changelog/#v280-2024-07-01

v2.7.4 (2024-06-12)
  * Bump pydantic.v1 to v1.10.16 reference by @sydney-runkle in #9639
  * See https://docs.pydantic.dev/latest/changelog/#v274-2024-06-12

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...ython3-pydantic_2.7.3.bb => python3-pydantic_2.8.2.bb} | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.7.3.bb => python3-pydantic_2.8.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.7.3.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.8.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.7.3.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.8.2.bb
index 423fe76733..de610d7815 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.7.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.8.2.bb
@@ -11,10 +11,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "c46c76a40bb1296728d7a8b99aa73dd70a48c3510111ff290034f860c99c419e"
+SRC_URI[sha256sum] = "6f62c13d067b0755ad1c21a34bdd06c0c12625a22b0fc09c6b149816604f7c2a"
 
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
+RECIPE_NO_UPDATE_REASON = "Must be updated in sync with python3-pydantic-core."
+
 RDEPENDS:${PN} += "\
     python3-annotated-types \
     python3-core \
@@ -35,9 +37,13 @@ SRC_URI += "file://run-ptest"
 RDEPENDS:${PN}-ptest += "\
     python3-cloudpickle \
     python3-dirty-equals \
+    python3-email-validator \
+    python3-pydoc \
     python3-pytest \
     python3-pytest-mock \
+    python3-rich \
     python3-unittest-automake-output \
+    python3-unixadmin \
 "
 
 do_install_ptest() {
-- 
2.46.0


