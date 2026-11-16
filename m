Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33624.1794851654611077176
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=gUk4QDPO;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so7088209eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851654; x=1795456454; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RZ+CHYnqhOZeOMxNW1T625eXeQvmHMhSuOzEzFMT4UM=;
        b=gUk4QDPOKl68kv/NP4HfNh1iND7E6kXuAXODoxSk/IAQ8HNluU855az9e+GuKXnA4J
         +8jCOSI8f14BI0SZcCYDQNFzAGp95sS8RMOn8aw/pA/5sILh9Il6hcUwqG4eJJOXWjlh
         Z27qIA6L/CGpvPId0WbsGyDdjEo0hS95SsXgBcpiXJ1pBDBMWUoPuPvXhQViNkKEkW2x
         xquabgaj576GhrsgpOGJ+GK/+8fx7te2GC9AcT0IbD/LB9/2p8L3ZK7q4pl+vbmm8hkr
         qcR9YwOtCXc4SzDHw9QwY+6drCzF/xEi9rIrmFI2vzTwj3lo32ZZcpZVc2FbWEf6hKIf
         U7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851654; x=1795456454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RZ+CHYnqhOZeOMxNW1T625eXeQvmHMhSuOzEzFMT4UM=;
        b=CLVjielrO0Z5vkfzW+zDiPfo0sbhh0D9lEU/9Ib9z/rpkGa8e1PEz3nX/dWijlvEiJ
         s9NcPwDyeGxcMxEx1UcTRZ4XWu8iev9sRWmk/Ce4LwKt6NyLU/7J/HMqKtU+qp1tY30d
         +vgTwNDlm/2jRtukj0MYr4eB7t8PRFMQLh+/JSLLDvFhhULc4a4Sd3UdVErT/Y7PZm27
         KFGwao9nMq/CGiNx1jZQypeeqL/aStm0FDv02rNQwFiUiDbANAytObDMb3FReOjkpw1H
         081IdyqJS3mmVvNUrqV/yKOnrz0aatm1pGGpUddr8jOmFYqEvO91yiOmZycEZwOxE+Hi
         lbaA==
X-Gm-Message-State: APuU4Z9ItcOkDMVrMxyGj3e/np8VkRTokNVY5QDxo2T+WF4alGtISqja
	psYNlfrZEx/JY8N5UYLwykEX0kkrWYIVXREMUDtLKlQUUVzEuUz0Tq+GHESb7FqC
X-Gm-Gg: AYBFou21rGEBlKFSLk8pUypT+/d/9a2ujt9m7BiNH8GSzFoASeCa84pXBCorkR6ZAb3
	xJ+IVMJ14QHJnpyWrymJWtwBuZYSDTeGVfkQnBNMapZEdt4PE0DEmC3Ok3MAEdzIQ9BDyxN6B+H
	1cuu59YmDKAtHoxUUg5agc6lcudTEGZ6G1w98gKgjCpuWWR2jFPiw7GaDrWGoWIzZw5sLWK/N1W
	oP9glnqduMPM9dB5oCV6H3Q6ByNluAENoWBDwUkTKI8oAvqldJPYZEgNJNLlO8HuR/nOfMLBtmH
	k+Axvcz/OvW6GbCOKswh71caH+P7oBqk3dtfUeoMwcH+sd79Cvp3q/+Ce9FjeXJTwEQrszkGXpO
	rVGqKTSjyGQC5nzxWHf5uAxfsoPkN69w6mCiOXwaGYxCpmupBdRkj7Uubr6sQjXLsu3Rt65oAq+
	OP+mkZUQ64hlDKr8oCzMAB+RUVYCm7UTM3vuAXcZ+n6+6m+ZqSmen6INpEh1SzxEZAfxF80L4Og
	Ej+bLuL0j5VdxZXDPUv4/Lg6eJcy1XivQeoHXywfYH9pG+LXN0IzECGZBZJxjaOJy14uGtu26fP
	qKQk55H7PnTSaY3Pi6MXj6i9YyhQc46jJIqJ7Vaxn5yFImhHbsDybHRdOBZl+krhFNC8POOXWA/
	otezr2oEQks1tHyyKXRwPWYV99BQb2BLJgMHaCkRVOoUpjPliC0mf730hfHqTCbtPpLLxI0wv0u
	M9+xpe0Q2b5bSd4GJoKXYRRVBveaExGydDsf/RVO4DR8xsiXUNYinokluAm0raMrg2UhHCjzahT
	SALgnOOon4jS52R7ldWjAuOTKdPUDF7SLmPS8oZydvXE6b2HV+si7VFV29a/l8UHu7udYtOex9N
	wb9I
X-Received: by 2002:a05:693c:8817:20b0:373:5561:8d06 with SMTP id 5a478bee46e88-379679df137mr10045977eec.37.1794851653879;
        Mon, 16 Nov 2026 09:54:13 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 008/105] python3-bleak: upgrade 3.0.2 -> 3.1.0
Date: Mon, 16 Nov 2026 09:52:20 -0800
Message-ID: <20261116175359.342679-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132464
Content-Type: text/plain; charset="utf-8"

Refresh the uv_build bound patch for the new <0.12.0 cap.

Changes:
- New: BleakAdapter.get_connected_devices() to list already-connected
  devices without scanning; new Android backend for BeeWare/Briefcase
  apps (needs Python 3.13+).
- Minimum dbus-fast raised to 4.0.0 on Linux.
- BlueZ: detects D-Bus connection loss, recovers from InProgress on
  StopDiscovery, fixes disconnect() leaks, device-removed matching
  on adapters like hci10, and empty AcquireNotify payloads.
- CoreBluetooth: fixed memory leaks, address data leak with
  use_bdaddr, start_notify() ValueError after reconnect.
- WinRT: GATT I/O raises BleakError on disconnect; fixed crash after
  event loop closed.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...0001-bleak-Support-newer-uv_build-versions.patch | 13 ++++---------
 ...ython3-bleak_3.0.2.bb => python3-bleak_3.1.0.bb} |  2 +-
 2 files changed, 5 insertions(+), 10 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bleak_3.0.2.bb => python3-bleak_3.1.0.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-bleak/0001-bleak-Support-newer-uv_build-versions.patch b/meta-python/recipes-devtools/python/python3-bleak/0001-bleak-Support-newer-uv_build-versions.patch
index 043d7887c0..c131b5e236 100644
--- a/meta-python/recipes-devtools/python/python3-bleak/0001-bleak-Support-newer-uv_build-versions.patch
+++ b/meta-python/recipes-devtools/python/python3-bleak/0001-bleak-Support-newer-uv_build-versions.patch
@@ -3,7 +3,7 @@ From: Leon Anavi <leon.anavi@konsulko.com>
 Date: Mon, 15 Jun 2026 17:53:47 +0300
 Subject: [PATCH] bleak: Drop the uv_build upper version bound
 
-bleak 3.0.2 requires uv_build<0.11.0. OE builds wheels with
+bleak 3.1.0 requires uv_build<0.12.0. OE builds wheels with
 "pyproject-build --no-isolation" against whatever python3-uv-build is in
 the sysroot, and that check is enforced:
 
@@ -27,19 +27,14 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  pyproject.toml | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/pyproject.toml b/pyproject.toml
-index 3224afc..4be6da7 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
-@@ -66,7 +66,7 @@ dev = [
+@@ -78,7 +78,7 @@
  ]
  
  [build-system]
--requires = ["uv_build>=0.10.9,<0.11.0"]
+-requires = ["uv_build>=0.10.9,<0.12.0"]
 +requires = ["uv_build>=0.10.9"]
  build-backend = "uv_build"
  
- [tool.uv.build-backend]
--- 
-2.47.3
-
+ [tool.uv]
diff --git a/meta-python/recipes-devtools/python/python3-bleak_3.0.2.bb b/meta-python/recipes-devtools/python/python3-bleak_3.1.0.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-bleak_3.0.2.bb
rename to meta-python/recipes-devtools/python/python3-bleak_3.1.0.bb
index 4d1e0b1666..4f5e6f9881 100644
--- a/meta-python/recipes-devtools/python/python3-bleak_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bleak_3.1.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bcbc2069a86cba1b5e47253679f66ed7"
 # The PyPI sdist ships no tests/ directory at all, so ptest has nothing to
 # run from it (pytest exits 5, "no tests collected"). Fetch the matching
 # git tag instead, which does include tests/, mirroring python3-pydantic.
-SRCREV = "bb49377d38afb3a9fac9022aaf2c8f59d4ef7cfe"
+SRCREV = "3075468a7c511b2b771a6aa50a896120f2a3a3de"
 PV .= "+git"
 SRC_URI = "git://github.com/hbldh/bleak;protocol=https;branch=develop \
 	file://run-ptest \
