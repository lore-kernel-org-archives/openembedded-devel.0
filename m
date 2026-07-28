Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF5AC53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 11:45:49 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9506.1785239148396268024
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 04:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=e/4ySD88;
 spf=pass (domain: konsulko.com, ip: 209.85.221.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4720f3bf164so555335f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 04:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785239147; x=1785843947; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7QHqPGAum1oi4157MZZU5xAe4Sib9bZo6vmms31JqZE=;
        b=e/4ySD88BN5/6byxopp0JPrQ3wxwlsh3Lk37C5dgFCaECM1m39dRblOiTcYuF9n98F
         xeJyeZyvcJI5EHF8Gx7TZ7MgSzW9HcKkIfaLmeHfvweo2QDXrraRw7mYVx91a8atdTh+
         a1RZuqtuj4a9n+oxsxKDWYETHch5oWK+Ajafo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785239147; x=1785843947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7QHqPGAum1oi4157MZZU5xAe4Sib9bZo6vmms31JqZE=;
        b=Rb9OwwsYN8LpnVgcsX9NT5UFysFR3Z36eoOJT2QmrDUKObbfvB8mlq+A5uAWzgUd45
         4o9cgwJfVB9E606TMlI1CzEOSMWKbW8kOZ5U4/1Kl99N82KufgRO8NDotSAbwbiOxHLA
         HclmblbyGUZ7/5Y/u9bUtYpnI1RfHsahm4nk83QkrEgJTJJdx/7bW/vz2qhx/wV7jIQW
         LpneW7vxgmApnIrzvCCQm8vzkb3Gj9y9rBFFiXJHEGBlNC5RssWxF2VQZO/fdgTyyFW/
         v6GD+qJX1T9Kla1HVYVM6xvroSpbpEao1zN4L41R6Juw7yAB5HHMJKT3793XFSWQ1jle
         VkCg==
X-Gm-Message-State: AOJu0YyiETK5gSvmUp/wxkGNIymEFGXSr2EK4qR4VigAoaJOYY/vG1ZG
	r+SIfDSbpJyzPyW2q7snWzhsTXDKiIV8nUkxUzp/RnHY7ZXZ7F9xg832gUqUGQb6iBjSRvSYHx4
	uXDg5
X-Gm-Gg: AR+sD13VzWgvWDU0ZCSIpXmgor+L4xPFPkSeelMCnywarxkbxrnm6ttjRKwAqjr7RnP
	je0El1YgFBvc3vFGFiXlJTIu4v8h43vpbhJDGmNOv44hG1KlAMXG3SRGNpsAfIxMscpTURn9pgH
	aQ0Ya+oJyXn4Cuq6/X9/u7RIPkxcOd7LYU2ABTegCiLwb4z8OjvdrSdcot4Li82U8HddIvQWNLh
	CvgsnwftrllyDHMv5xTjW8DDIX1Ubvy5V+GFKghPOoa33g5D5iVbNu2Rh5ynaqPg75QhbJprTOI
	po6EbLeqLCasLBZYG9hmdbTVJLyJqv101KlKRTxrFB0DyzwT5GsbNizYpIAni5+RI2md3I5IYJJ
	2bEIlzc8kH7HuTzRZckeB0gAhnFcFWiV0UkicvCroygFnmHNLOgZ6twCNWPPKrA8UPDGjm763zf
	Y+Y6fdjbQ2opnCY7GVOnOSWmO7XcL8LL59eu6mRYnxU45hru3a4ev4a0Na9H06y2Yq18LFr34WW
	rzyeKdO9lKfv9A75V8/P65+kQyxikg=
X-Received: by 2002:a05:6000:25c6:b0:47f:6fd4:5fb4 with SMTP id ffacd0b85a97d-47fb1ecac34mr2400999f8f.17.1785239146679;
        Tue, 28 Jul 2026 04:45:46 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f96b9abc0sm37021654f8f.32.2026.07.28.04.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 04:45:46 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-pydantic: Enable test_docs.py
Date: Tue, 28 Jul 2026 14:45:32 +0300
Message-ID: <20260728114533.1775490-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260728114533.1775490-1-leon.anavi@konsulko.com>
References: <20260728114533.1775490-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 11:45:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128511

We now have Rust 1.71+ version in oe-core so we can build ruff,
add it to the ptest runtime dependencies, install docs and fix
paths in test_docs.py.

There is a known jemallocator issue on aarch64 that affects ruff
and some of the pydantic tests from test_docs.py:

E           <jemalloc>: Unsupported system page size                                                                                                       E           memory allocation of 4 bytes failed

More details about JEMALLOC_SYS_WITH_LG_PAGE:
https://github.com/gnzlbg/jemallocator/issues/170#issuecomment-1503228963

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-pydantic_2.13.4.bb         | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.13.4.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.13.4.bb
index fb80c066f9..52d2c855ec 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.13.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.13.4.bb
@@ -58,13 +58,24 @@ RDEPENDS:${PN}-ptest += "\
     python3-rich \
     python3-sqlalchemy \
     python3-unixadmin \
+    python3-ruff \
+    python3-pytest-examples \
+    python3-devtools \
+    ${PN}-doc \
 "
 
+do_install:append() {
+   install -d ${D}${docdir}/${PN}/
+   cp -rf ${S}/docs/* ${D}${docdir}/${PN}/
+}
+
 do_install_ptest:append() {
     cp -rf ${S}/tests/ ${D}${PTEST_PATH}/
-    # Requires 'ruff' (python3-ruff) which we cannot build
-    # until we have Rust 1.71+ in oe-core
-    rm -f ${D}${PTEST_PATH}/tests/test_docs.py
+    # Fix paths in test_docs.py
+    sed -i \
+        -e "s|^DOCS_ROOT = Path(__file__).parent.parent / 'docs'|DOCS_ROOT = Path('${docdir}/${PN}')|" \
+        -e "s|^SOURCES_ROOT = Path(__file__).parent.parent / 'pydantic'|SOURCES_ROOT = Path('${PYTHON_SITEPACKAGES_DIR}/pydantic')|" \
+        ${D}${PTEST_PATH}/tests/test_docs.py
     # We are not trying to support mypy
     rm -f ${D}${PTEST_PATH}/tests/test_mypy.py
     # We are not trying to run benchmarks
@@ -72,4 +83,6 @@ do_install_ptest:append() {
     sed -i -e "/--automake/ s/$/ -k 'not test_config_validation_error_cause and not test_dataclass_config_validate_default and not test_annotated_validator_nested and not test_use_bare and not test_use_no_fields and not test_validator_bad_fields_throws_configerror and not test_assert_raises_validation_error and not test_model_config_validate_default and not test_readonly_qualifier_warning'/" ${D}${PTEST_PATH}/run-ptest
 }
 
+FILES:${PN}-doc += "${docdir}/${PN}"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


