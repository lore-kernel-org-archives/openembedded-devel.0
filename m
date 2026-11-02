Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3493.1793582129562222299
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Nov 2026 17:15:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=iyLe/Cn9;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36a1947498bso1952985eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Nov 2026 17:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793582129; x=1794186929; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EVUyn3eki/5KhZ8IIh2Rdu2c52mXhiU5Ia4gyuiiof8=;
        b=iyLe/Cn9WA5ZKayT7syZ6yyxglFLz8Y+OF3H094itdqM4pvGDMEJ8kTuKt/oT9jhhm
         Nr5By8ha5PPUjxbQuZqgndVn92dpKm0UqsIJHd3igfmDP+//QAry1GBGvlbxToJVOn75
         8EjDL67UQ+Qw1tK+VLeDHSKFuZi6YZPuaPDgDCJPaPITfP6ZSgZd4aECKZOP/GVh8MMU
         mxuUBafAgKy9kMLJReLgYnl4yNjEvMZ2bRNaQlDxae/+FSsTTIsWHs+wZJmyyVO6TlBa
         DSw2OG9BBOYO8CmgvD/LebVv6w+B0BjtWFaVVi5BmnTaA4KTyKVgS2muySMu22rSDZOC
         alQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793582129; x=1794186929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EVUyn3eki/5KhZ8IIh2Rdu2c52mXhiU5Ia4gyuiiof8=;
        b=XeL+gwY4B8Th388B4iEw4lAXIEp18rwwQ4CiaXODLeFEWL7yBsTNlhdrgnKQchIDlt
         7cyzb7VXlJR9kpDEU/VbuNMpaNisWgBoq+wu567uvYuCKtZYy3x3Sta/kxkfcCzM5zk3
         8URPqmohy+iGLQYABqWfkFh8J+jcHiiR4afqxBwNztkNhI0ZlQKhntU9bUSqXJP2lVIE
         5B7qwQxaH1ZywOQ9YJ0v0tojI/sCfm3P9KmrveMbjZiPUYK/V8oVuEiAyBUsJq8yZPQ/
         lDHhJWkiVOr5XAFaorx/y+bNKdlGdvw2BeqcOAReUECAdk15hEgIBr9itceYnolf+cIS
         /eFw==
X-Gm-Message-State: APuU4Z+BxTefFcXLiVsifTUXXqTcjifC9s8YWv7s4V/RCX7Y/MjjTHGH
	PkG8JHsE5ED1S6a2rpYhOol0a4jQwmCaYVToADMEBLiRzY/TtZ+XpYO1F1vAO6xGqvY=
X-Gm-Gg: AYBFou17MuQmQFq5R7iSvezAIx9vW/OgdV5doayqpQW1Dq/9S5Ah9gIdtFtoolejvTA
	gRTEZ9g1PLxVlQ9rXEv4REJe24CrvB7mUyDFX+L9o+uuP+d3hthY2kUGherAImIsfzzYLMqQbMu
	4BLisoqiaTQ/KhxlDc7qSErM01n/qsM5LF+OLydDXiFRzwPkPLcDxrqHIAF2AETfTX7XMlJHi+p
	O/2IOiJTKmGabTwf+EuDDnTa1dXDyo5Rg/ojr6PHLzqly8z72/kNGOiH5KVKiG1p/6gp9uiaVL2
	vvFfgAqwixUrrK0z26u0iWBrgutDOYRsIfN5c4AC5ZuyRQWZWvc9QJuxobtyUi2QpKYs2FVrVGH
	Nn8kzgEldqWXAS8T7dhuwQwjhINI9uHe9PU5fEnCoRGJTgtBB0TKHP7/wcPl7olGsRhhoQinzhK
	bTzQI5F/3ktMDIfoD0Lf1sDJ1A2sKNeOsa+z7hUBjvyiC+xJZZu4OWXL4DMwMxarW1kaoTjI2vH
	pfnE8qcYbXZH867Eh5WCnCUGxvrV5TIhljowl7XORgyTgZElVUxT8HlKQvZ5s09fM62ZU/mJTdW
	KM1LeSFoEqw30rRUvhDHU+EGPrKNNxCTwspQDwl/rWwKlwXr1m6kbM+nSKvfpD0LRn6Sqz6VYrI
	UGPOGFK8ySQsE6ef6baRg2+QTsk85udLEsRIJJbR9oH4tfNdxvkcGGh5aOPaVHfH04PVPeE4x6R
	pyH5dOn8PcScWK7OxwkmjpC2suaSdzsVL/yWegmXEwvPjs0ZVRs/0m3OwHau7/2stCHg6SO/jcm
	isSQO615USenQdHv422G6tMI6IPWDM5sSPcuZ9LB5tuJc/uAMRjauKSEnK8PwvAhYav7lEkge+a
	Ul4C
X-Received: by 2002:a05:693c:6092:b0:369:f3b8:2c54 with SMTP id 5a478bee46e88-36a423f0f70mr14505470eec.30.1793582128678;
        Sun, 01 Nov 2026 17:15:28 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4239ca82sm30542772eec.0.2026.11.01.17.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 17:15:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] lcov: Upgrade to 2.6
Date: Sun,  1 Nov 2026 17:15:25 -0800
Message-ID: <20261102011525.2806547-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2026 01:15:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131736
Content-Type: text/plain; charset="utf-8"

Changes from v2.5 release:

- new html2lcov tool
  * Capture source diff and 'baseline' coverage from lcov HTML report - suitable
    as input to generate differential coverage report versus 'now'. See the html2lcov documentation for details.

- new jacoco2lcov tool
  * Translate JaCoCo java coverage data to lcov format - e.g., for multi-language
    coverage reporting or to take advantage of lcov features. See the jacoco2lcov documentation for details.

- new XS back end (on plaforms which support it).
  * C++ implementation of some key types and operations - to improve execution
    time and memory footprint compared to pure Perl.

- various bug fixes and test coverage improvements.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/lcov/{lcov_2.5.bb => lcov_2.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/lcov/{lcov_2.5.bb => lcov_2.6.bb} (97%)

diff --git a/meta-oe/recipes-support/lcov/lcov_2.5.bb b/meta-oe/recipes-support/lcov/lcov_2.6.bb
similarity index 97%
rename from meta-oe/recipes-support/lcov/lcov_2.5.bb
rename to meta-oe/recipes-support/lcov/lcov_2.6.bb
index 67fd0249d5..e23b48328e 100755
--- a/meta-oe/recipes-support/lcov/lcov_2.5.bb
+++ b/meta-oe/recipes-support/lcov/lcov_2.6.bb
@@ -58,7 +58,7 @@ RDEPENDS:${PN}:append:class-target = " \
     gcov-symlinks \
 "
 SRC_URI = "https://github.com/linux-test-project/lcov/releases/download/v${PV}/lcov-${PV}.tar.gz"
-SRC_URI[sha256sum] = "7e5e5a154bd5f3557659c328cab376764e7abd238bb403c424472c296b175126"
+SRC_URI[sha256sum] = "67a45db99b8ef0260c3fac9a2e3749fd8fa350a15e235dd3c29b356d97755c75"

 UPSTREAM_CHECK_URI = "https://github.com/linux-test-project/lcov/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
