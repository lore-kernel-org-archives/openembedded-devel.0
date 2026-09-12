Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62652C88E65
	for <webhook@archiver.kernel.org>; Sat, 12 Sep 2026 23:51:51 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16732.1789257110017717184
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Sep 2026 16:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Tc+vDI0Y;
 spf=pass (domain: gmail.com, ip: 74.125.227.140, mailfrom: raj.khem@gmail.com)
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fe517774so13166315ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2026 16:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789257109; x=1789861909; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=akOkxOQsaA02wR8AA0+UpkTaYGsFdcAN6U526c7YQIw=;
        b=Tc+vDI0YC/CyfKMz9cxguNbFd495eaWmDmwUWWoJjajHuSHBbNqErD2uOz3CdXvvUU
         Czs8MxqYXE8IPDQlVQksCXL3Mf4GBfdvPT2lcfNWz+RgYcjsmtOhQ5GHwVMfV+IL0x7c
         cpFi8obfn0tTvgvMTDpAGm5QAOXw1Sj1aX8PklaZRVPLeBpMsy0p6DsQrTL964xTR0OV
         8k39x35AYf8hUJFfQJCKASe68TbjKsyZSkBSHImkcVDeBptarjsjEClInWXmn+ArQYfs
         dZ1kOC34NJBQJA14KAg5vo/wHBHyUSTrutDTR1TM5pmxwklQC21bZHstui/hVHSCjDQM
         abJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789257109; x=1789861909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=akOkxOQsaA02wR8AA0+UpkTaYGsFdcAN6U526c7YQIw=;
        b=Ayr6jv/yGUPQ+fsfd3v644sE79oUdq13aZCTGi+gt93TWrvoE/3KIGJVsreA6S8k0j
         zHpSw5lQMZndkYaMNtwPDXcHIT5o7zH72m0j0187bViZMFvNR3gK3obqusVxKVQyb0ca
         XuoU+7f4uCPsdJyFlESg2HW3Ub0WWh2yZ3QbwiwD1jNakZkNUYPMS+wkuHSK5FQH+EIM
         SE2jSlIC3DI1skcnufCEtveyqwgwftRJU1aFALgTpvALPzRYR4nLJTolzDkLHm++5WZX
         FyMmJuMK7lKXS08gW6sOtDDwPVWMnfoTNGpmv4ExsHc48mBh7PZ9YSndLjmDITNV8eJo
         f7IA==
X-Gm-Message-State: AFuF++kzwK9gbT8VWrHFsPCul20h8o2WM5eeor1qJbSuKHzlVoLyNRQd
	ScSddIkyGpzwTp6eDvzYA9cYGNrsfBIxjV5VdtEqrywkl7PO3kD2grq8hL98yA==
X-Gm-Gg: AYBFou2weXhsaPui7YdSLqbkbS01bMYMPvrsWj7msCi4jXh4iDqDTOgIh2APShDTu6O
	qT8HESvABlvZ7X56cJbAdRSoOqMPOVzounSqkxI138XkUMzhuqbYaTFbzSI9x/IvO0MvFKSC+0M
	Ycfq6AWHktfCc+fWcHtQhnig2yKZ8wURJaUURT62S2dxfIw9PuWXiwPH9j2hircwjeU9HyxYaWi
	V/H6T+AYlyht4KoOlYJy8jkjdcVC8X38cjmHYI6Y7qndSItr4ksqNgFBrB2/ffcWW73D74Iyiwu
	Wie3zgFMQMrpp7wIgcadMgaiFui13bKowkS9AHcV5w4+lvYm2w6hrKBrxTZIh8nS0KOULlvOk8c
	ZsWKoG4tZYujOSHHtG8BIz+jfDuWq9GYVBuRVzTDJDQJIS3AD2kpBnP6niCltj/DDxkmLwvt3PG
	+vMnACEiXzISaQGpM8o3D/dTC9Z3K9M1aj6+gvnCTWqcZSgluBcgpNENDx2a8o/Xwyyr6a4FoG8
	Hf+3xJ5cztxYcUCzTMGHYxlh2S6JQ1stNapSlUyXRCziKi4wdgXMXd16xhDhhbWnpDEP0zeaLWZ
	InJ0E6rO3fFkqZXBLRTD0KCNe6cpl1IXIdkpgJAxG9nBqNR/45thyg/W4xysLDIuzWn29vrr0W6
	GbWqHuZdlIIn9tMY2Av9VAZq3pXGJ+ezgORYgtYf7woAvcLLhoGypiLw3
X-Received: by 2002:a17:902:f610:b0:2dd:64:12ac with SMTP id d9443c01a7336-2dd2a343053mr229043195ad.11.1789257109222;
        Sat, 12 Sep 2026 16:51:49 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e52a60sm16093307eec.6.2026.09.12.16.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 16:51:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 4/5] python3-dnspython: skip DDR tests when DDR is not available
Date: Sat, 12 Sep 2026 16:51:39 -0700
Message-ID: <20260912235141.2355852-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912235141.2355852-1-khem.raj@oss.qualcomm.com>
References: <20260912235141.2355852-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2026 23:51:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129984

test_basic_ddr_sync and test_basic_ddr_async only check that the
Internet is reachable. On networks that intercept port 53, 1.1.1.1 and
8.8.8.8 still answer ordinary queries but return NXDOMAIN for
_dns.resolver.arpa SVCB, so try_ddr() cannot upgrade the nameservers
and the tests fail:

  FAIL: tests/test_ddr.py:test_basic_ddr_sync
  FAIL: tests/test_ddr.py:test_basic_ddr_async
  assert isinstance('1.1.1.1', dns.nameserver.Nameserver)

Add a patch to skip them unless both resolvers return DDR SVCB records.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ests-when-the-resolvers-do-not-answe.patch | 70 +++++++++++++++++++
 .../python/python3-dnspython_2.8.0.bb         |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-dnspython/0001-tests-skip-DDR-tests-when-the-resolvers-do-not-answe.patch

diff --git a/meta-python/recipes-devtools/python/python3-dnspython/0001-tests-skip-DDR-tests-when-the-resolvers-do-not-answe.patch b/meta-python/recipes-devtools/python/python3-dnspython/0001-tests-skip-DDR-tests-when-the-resolvers-do-not-answe.patch
new file mode 100644
index 0000000000..991604682e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dnspython/0001-tests-skip-DDR-tests-when-the-resolvers-do-not-answe.patch
@@ -0,0 +1,70 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sat, 12 Sep 2026 00:00:00 -0700
+Subject: [PATCH] tests: skip DDR tests when the resolvers do not answer DDR
+
+test_basic_ddr_sync and test_basic_ddr_async only check that the
+Internet is reachable. On networks that intercept port 53 with a
+transparent DNS proxy, 1.1.1.1 and 8.8.8.8 still answer ordinary
+queries but return NXDOMAIN for _dns.resolver.arpa SVCB, so try_ddr()
+cannot upgrade the nameservers and the tests fail:
+
+  assert isinstance('1.1.1.1', dns.nameserver.Nameserver)
+
+Skip the tests unless both resolvers return DDR SVCB records.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tests/test_ddr.py | 27 +++++++++++++++++++++++++--
+ 1 file changed, 25 insertions(+), 2 deletions(-)
+
+--- a/tests/test_ddr.py
++++ b/tests/test_ddr.py
+@@ -6,13 +6,36 @@
+ 
+ import dns.asyncbackend
+ import dns.asyncresolver
++import dns.message
+ import dns.nameserver
++import dns.query
++import dns.rdatatype
+ import dns.resolver
+ import tests.util
+ 
+ 
++def _ddr_available():
++    """Check that the public resolvers answer the DDR SVCB query.
++
++    Networks that intercept port 53 (e.g. a transparent DNS proxy) answer
++    _dns.resolver.arpa with NXDOMAIN, so DDR cannot work there even though
++    the Internet is reachable.
++    """
++    if not tests.util.is_internet_reachable():
++        return False
++    for nameserver in ["1.1.1.1", "8.8.8.8"]:
++        q = dns.message.make_query("_dns.resolver.arpa", dns.rdatatype.SVCB)
++        try:
++            r = dns.query.udp(q, nameserver, timeout=5)
++        except Exception:
++            return False
++        if not r.answer:
++            return False
++    return True
++
++
+ @pytest.mark.skipif(
+-    not tests.util.is_internet_reachable(), reason="Internet not reachable"
++    not _ddr_available(), reason="Internet not reachable or DDR not available"
+ )
+ @tests.util.retry_on_timeout
+ def test_basic_ddr_sync():
+@@ -26,7 +49,7 @@
+ 
+ 
+ @pytest.mark.skipif(
+-    not tests.util.is_internet_reachable(), reason="Internet not reachable"
++    not _ddr_available(), reason="Internet not reachable or DDR not available"
+ )
+ @tests.util.retry_on_timeout
+ def test_basic_ddr_async():
diff --git a/meta-python/recipes-devtools/python/python3-dnspython_2.8.0.bb b/meta-python/recipes-devtools/python/python3-dnspython_2.8.0.bb
index aa14caed15..859b71bcda 100644
--- a/meta-python/recipes-devtools/python/python3-dnspython_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dnspython_2.8.0.bb
@@ -11,6 +11,7 @@ inherit pypi python_hatchling ptest
 
 SRC_URI += " \
 	file://run-ptest \
+	file://0001-tests-skip-DDR-tests-when-the-resolvers-do-not-answe.patch \
 "
 
 RDEPENDS:${PN}-ptest += " \

