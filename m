Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD88C48BF6
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 05:40:07 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.92067.1709530806213263109
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Mar 2024 21:40:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mXRyv+QN;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-564fd9eea75so5835063a12.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Mar 2024 21:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709530804; x=1710135604; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p17jplMLZ3udslrM2lTFXJSaRfGVUISCORC424iloDI=;
        b=mXRyv+QNtcFvUEhh2kVsHI/sNAXUFOEy2USjHJsrhZg/WSUifwx7r++JiBehY9m6SM
         VMHYj9V/yy3Cs+EDcVStL9/b1ROHuqNhlxMyCdVh3BD8PJ6AiTs/0GLxZIEX35+pkgWe
         sWQw2dpQVaKnR7r85ufu2GCNrPwmWV6S+iyb+tMvIMBMUOijUzuHAyU9+lGUkCBqJCfm
         R74zzZXpu92LABB19htUkNpDfGH61VMsglbeqUx5T/4ohFiMk1zhkuNV+Lh/QodGE+QB
         brzXncI1jkVv6OQcCLUzafO7/vRWeXY5dIju6WuaSR1Bgjr+05gxgqMQlNXCGn5zSz/X
         TaFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709530804; x=1710135604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p17jplMLZ3udslrM2lTFXJSaRfGVUISCORC424iloDI=;
        b=gDLLjMg2BXs71N29ZcZJJg+7BgDmEg+5K3SzZKCahzAWYl4/B9wk3WIt2KjZRRqBv3
         4djFcsknf/2gTo7ooi1sdPYnTHKYfG4t8st6o0DQc+1M+WDTJljEdThHiiuiCeddh9/O
         lVZkxURMpDXZYm/oVMKXCdAwb6QCjOrWmKPkjmGdIzxFdSAwPcUTdAWSimf2FaHwuowD
         tUh636s4fRuhKHpBMpANFfgv5DvXWxo6cad6bPcxsLJFYeDfYStkOiUBsrXixNysl7CJ
         9sBX+ePLUmPPX/I9jrMDaCYPWdFILXLMOLehFV6FVEhfOiWUWKDxZwhmyl9CgCoVFvsT
         kgkQ==
X-Gm-Message-State: AOJu0Yzx+sz+5tUxyOrXJPbS0bLLG1BthC+v40S4N4469j1BAfZxgguw
	PhZYEpC4JyLeuvw/9juJCzQlQUoGjqVpmqcKTp6pn+Rw0zH9kq7YMKz6QFj1RAM=
X-Google-Smtp-Source: AGHT+IF1Ku2n02RvvQnIBshkexBF11Md6l1B1TAZnJKSm2DcE5+mrckq6eCmwa/8xIYAxc/g+Dsj9A==
X-Received: by 2002:a05:6402:510d:b0:567:1b50:559c with SMTP id m13-20020a056402510d00b005671b50559cmr3239803edd.39.1709530803781;
        Sun, 03 Mar 2024 21:40:03 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id n22-20020a05640205d600b00566d6950d14sm3077890edx.92.2024.03.03.21.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 21:40:03 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-netaddr: upgrade 0.10.1 -> 1.2.1 and add ptest
Date: Mon,  4 Mar 2024 08:39:39 +0300
Message-Id: <20240304053939.1021959-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Mar 2024 05:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109094

Ptest result:

Testsuite summary
TOTAL: 340
PASS: 339
SKIP: 1
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 28

* Tested on qemux86_64 and qemuarm64
* Add ptest into PTESTS_FAST_META_PYTHON items
==============

Switch to the python_setuptools_build_meta backend

License-Update: License check file changed from LICENSE to LICENSE.rst

Changelog:

Release: 1.2.1
===============
Fixed:

    Fix bad version 1.2.0 upload to PyPI – now yanked. No changes to the package.

Release: 1.2.0
===============
Added:

    Add CLI tool subcommand to display Network information.

Changed:

    Support running Interactive shell without IPython installed.

Fixed:

    Explicitly raise TypeError is a non-string value is passed to valid_ipv4() or valid_ipv6().

Release: 1.1.0
===============
Added:

    Add the required Python version to the package metadata (GH #365).
    Add expand_partial_ipv4_address() to the public API.

Fixed:

    Fix IPNetwork(...) in IPRange(...) false negatives (GH #157).
    Fix a few IPNetwork slicing edge cases (GH #214).
    Fix support for partial IP addresses accidentally left in IPNetwork in 1.0.0.
    When I removed the implicit_prefix switch I missed the fact that there was some partial IPv4 address expansion triggered unconditionally.
    If you need the old behavior use expand_partial_ipv4_address().
    Related GH issue: #110.
    Fixed an incorrect license classifier in the package metadata.

Release: 1.0.0
===============
Removed:

    Drop support for Python versions lower than 3.7.
    Remove the flag shorthands: N, P and Z. Use NOHOST, INET_PTON and ZEROFILL instead.
    Remove abbreviated CIDR format support in IPNetwork (implicit_prefix=True), use cidr_abbrev_to_verbose() if you need this behavior.
    Remove the IPAddress.is_private method.
    There are more precise replacements for subset of the addresses that used to handled by is_private:
        IPAddress.is_link_local()
        IPAddress.is_ipv4_private_use()
        IPAddress.is_ipv6_unique_local()
        IPAddress.is_global()
    The following address blocks used to be handled by is_private have no dedicated convenience methods and you’ll have to handle them manually or request a method addition:
        100.64.0.0/10 – Shared Address Space
        192.0.0.0/24 – IETF Protocol Assignments (watch out – there are exceptions in there)
        198.18.0.0/15 – Benchmarking
        239.0.0.0-239.255.255.255 – 240.0.0.0/4 is Reserved, 239.0.0.0/8 – unclear

Changed:

    Stop accepting leading zeros when parsing IPv4 addresses in INET_PTON mode (it’s been allowed on some platforms).
    If you need to allow and discard leading zeros use the ZEROFILL flag.
    This change will affect implicit conversions from str in all relevant contexts. If you need to control the IPv4 parsing mode construct IPAddress objects explicitly.
    Stop parsing IPv4 addresses permissively (inet_aton()-like) by default.
    INET_PTON is the default mode.
    If you need to be permissive and parse using inet_aton() semantics use the INET_ATON flag.
    This change will affect implicit conversions from str in all relevant contexts. If you need to control the IPv4 parsing mode construct IPAddress objects explicitly.
    Apply the two changes above to valid_ipv4() as well.
    Update the address databases to the 2024-02-10 versions.

Fixed:

    Return False instead of raising AddrFormatError when an empty string is passed to valid_ipv4() or valid_ipv6().
    Fix handling of dialect provided to EUI during copy-construction.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-netaddr/run-ptest          |  3 +++
 ...ddr_0.10.1.bb => python3-netaddr_1.2.1.bb} | 23 +++++++++++++------
 3 files changed, 20 insertions(+), 7 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-netaddr/run-ptest
 rename meta-python/recipes-devtools/python/{python3-netaddr_0.10.1.bb => python3-netaddr_1.2.1.bb} (16%)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index b6e8d865a..53934e656 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -30,6 +30,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-jsmin \
     python3-msgpack \
     python3-multidict \
+    python3-netaddr \
     python3-ordered-set \
     python3-parse \
     python3-parse-type \
diff --git a/meta-python/recipes-devtools/python/python3-netaddr/run-ptest b/meta-python/recipes-devtools/python/python3-netaddr/run-ptest
new file mode 100644
index 000000000..8d2017d39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-netaddr/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-netaddr_0.10.1.bb b/meta-python/recipes-devtools/python/python3-netaddr_1.2.1.bb
similarity index 16%
rename from meta-python/recipes-devtools/python/python3-netaddr_0.10.1.bb
rename to meta-python/recipes-devtools/python/python3-netaddr_1.2.1.bb
index ce16cc178..082e7c502 100644
--- a/meta-python/recipes-devtools/python/python3-netaddr_0.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-netaddr_1.2.1.bb
@@ -1,13 +1,22 @@
 SUMMARY = "A network address manipulation library for Python."
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e6345d695ffe3776f68a56fe7962db44"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=8afa43eca873b71d5d85dd0be1f707fa"
 
-SRC_URI[sha256sum] = "f4da4222ca8c3f43c8e18a8263e5426c750a3a837fdfeccf74c68d0408eaa3bf"
+SRC_URI[sha256sum] = "6eb8fedf0412c6d294d06885c110de945cf4d22d2b510d0404f4e06950857987"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta ptest
 
-RDEPENDS:${PN} += " \
-    python3-io \
-    python3-pprint \
-    python3-xml \
+SRC_URI += " \
+        file://run-ptest \
 "
+
+RDEPENDS:${PN}-ptest += " \
+    python3-pytest \
+    python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/netaddr/tests/* ${D}${PTEST_PATH}/tests/
+}
+
-- 
2.25.1


