Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 867D1C35FFF
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 12:32:38 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.6242.1742473952035819351
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 05:32:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=KjjZjWz1;
 spf=pass (domain: konsulko.com, ip: 209.85.208.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so1322440a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 05:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1742473950; x=1743078750; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7fbM2GgaZsVSg6QRWsNSaobzr3x01pWnUkM4AK0Qoqg=;
        b=KjjZjWz1xeWb3nhzRiy9Mz9Xam8F4hiEu39haqHYQ3zePc55QXpfhCJapVLWMzNFpF
         aP8iToZ4PfrpN0nEetQ/xnSBuESI4oDnnBdWB8iF8gIrgOvviSoZYvY2r8Fu7jAwQaRS
         PN/h0OuKdhuXZuyz/Sz7aRE1zeY+3b4GcXaMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742473950; x=1743078750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7fbM2GgaZsVSg6QRWsNSaobzr3x01pWnUkM4AK0Qoqg=;
        b=Y/PDYB7zhvWI+9K9qFvPEUc2JAlq4FBkRRF3Q4SvLhxwszWxJscLrhEtt3TMW9slUn
         508H6lXxQAplfZIyYOnef/uImQFd+goLKEBza3SSR35d//MPe3t6iE0LAgikWkz3PEMr
         3voLoqcaaN6wdPHrRgbbsZJJYlI1XfPh86RDz0zMhCtQ+g/qFT6fvfjUz/x/g3/jsIrc
         1JShaE3NRbgSDB0F/blw0GsZBxjdp5OMMXgx9xNlh2UxUnsdXcEpcjhPtDw/zcPzerfC
         rgvtjbcscSY+6gzsT+4WFHXx6Lq2BWtJOFxUoFsox5Gdad5U9D3Cm/bCh/1xqBlGwNFm
         KN+g==
X-Gm-Message-State: AOJu0Yw+aj8T/giPceaXlCDC72xaNs8Kvo+Wb78MM9F2FS56UlSB0ha7
	QD2XRGpM0mJZKBVhhVYORfI0WoqX1IdajVst0z2ZjhgQMQsIVyeZ2ziOgh882zviAvy8V+zENIJ
	k
X-Gm-Gg: ASbGnctxo5ZrHB4XoCtJIFJ20wRUGyPmyLVP2hkMZszdgm4Q8SIbhVB0CE6x0EWSYPN
	/88Ah2S2ppAEpftX3ClwN91ydL+m4PsbBU8US/32rj+c8zDKAhi1AtmJhWizok+0JHxvNqAClJW
	vIXlI3FPwA/SUu/pPzz0YUADkPXZRX4lUFk1Po3NX0JxgTOObPMQEynQBdWj79qMAy1UuUH+P/d
	wWJBxGWQwJk9oizGwP9JazNH7B4KmNMHVBq7kNfpY8yZBJBuzazW+JxCnjqdp4VcCQqHflaV7Qi
	WVZst1s/lVprUE/h/MxBpp8JQ4Fb3Rl6Qpsj3g3ykVqgaER8oWRbrCWmgh3pRdLKVF3piQ==
X-Google-Smtp-Source: AGHT+IEI4DBtlnKyDyTW6L2AxtR9iSnVL+tTSkY7RAXzbM6w9SUeSFdZg6mWI6OWGeF8UmLzw3wfww==
X-Received: by 2002:a05:6402:2743:b0:5e4:9348:72d4 with SMTP id 4fb4d7f45d1cf-5eb80f73261mr6354467a12.24.1742473949932;
        Thu, 20 Mar 2025 05:32:29 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816afdfe6sm10714372a12.76.2025.03.20.05.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 05:32:29 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-pybind11: Upgrade 2.12.0 -> 2.13.6
Date: Thu, 20 Mar 2025 14:32:26 +0200
Message-Id: <20250320123227.2198743-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 12:32:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116135

Upgrade to release 2.13.6:

- A new self._pybind11_conduit_v1_() method is automatically added
  to all py::class_-wrapped types, to enable type-safe
  interoperability between different independent Python/C++
  bindings systems, including pybind11 versions with different
  PYBIND11_INTERNALS_VERSION's. Supported on pybind11 2.11.2,
  2.12.1, and 2.13.6+.
- Using __cpp_nontype_template_args instead of
  __cpp_nontype_template_parameter_class.
- Properly translate C++ exception to Python exception when
  creating Python buffer from wrapped object.
- Adds an answer (FAQ) for "What is a highly conclusive and simple
  way to find memory leaks?".

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pybind11_2.12.0.bb => python3-pybind11_2.13.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pybind11_2.12.0.bb => python3-pybind11_2.13.6.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.12.0.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.13.6.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pybind11_2.12.0.bb
rename to meta-python/recipes-devtools/python/python3-pybind11_2.13.6.bb
index 0403e406a4..ee5722fbcb 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.13.6.bb
@@ -7,7 +7,7 @@ DEPENDS = "\
     python3-ninja-native \
 "
 
-SRCREV = "3e9dfa2866941655c56877882565e7577de6fc7b"
+SRCREV = "a2e59f0e7065404b44dfe92a28aca47ba1378dc4"
 SRC_URI = "\
     git://github.com/pybind/pybind11.git;branch=stable;protocol=https \
 "
-- 
2.39.5


