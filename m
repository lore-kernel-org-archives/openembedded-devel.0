Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33647.1794851685804491844
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ZZDMVOzO;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-37628596783so6270189eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851685; x=1795456485; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gMPmyZKq5cG2XYnJQJvdWDNaInLRFyrczE7sdTQTa0E=;
        b=ZZDMVOzOu/q6gv3wdvki2PgcUySOSXwLe7zd1tJVq/KIGDRqmMM7G/HOgFFoWCwurM
         pvjL/Jg+DOSqYOpthWpGHnzRsVxjvMPvFei9xaXw1jJ8XQOd8oYxyLY+sQHgSNAcuWN+
         ZpGBZqBPZ5K8mXh3MD22RAzYmWdMHA7Wbjy0SKq/9o2FbXmfWj24612+z+dSIAlO6zLU
         YskukOq+G4p1znp2li38NhbrgKNKM+KZIXuAjfMMeMSpGaYvUxaoS7UK2Zgm5lPETBjJ
         BCMYY8B1lTElzEvF35PVMTZHvw4nBRSF8zar0tTEmFwM3n+S3bfzC4ZCkJBzCW62Amry
         9Qqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851685; x=1795456485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gMPmyZKq5cG2XYnJQJvdWDNaInLRFyrczE7sdTQTa0E=;
        b=zeF432KGiAYHhH7okv45NLwQBTbhdabq/zoa802ulQZGcug2VHxmnxojq/8iLHp0mf
         2jqjKGcD6psvb0oP4YM50OGVvUcHYZ027qMXazF3Y1XNGqmQpglJlljbT6eMBWL8dCI6
         c3jSl8kM14lZ2J66QWiuq6jj9aq2Ii7g9GLH4qF2lBRWD3oDyo1IeTWXN1VHdVBf9TCu
         vr7xWGDxjl6ooQCiGZoIHq8XVySbwuqtqhGOqRTKPhNaWD6BdCG428WaZHB4Gh9G0xjg
         M5xEckOLegcOFWYp2u80LukjV/BjTs8mOqdUxqJ5REbb+CCVrjsn+6BbDtBmnq0D3CCr
         0yGQ==
X-Gm-Message-State: APuU4Z+YbRtef7KYMxWYtAXsbB0zXCu7jfgw6O7Nz5tfk7CGXmKVVQ7z
	qpYkw1SJSm+w1B5WTW1HtFl3elcnPhDOKSlzz2FXEpJkpmrSqOuXUXh20+0wlLNM
X-Gm-Gg: AYBFou2HQHMrm/ONjAwO3SyjS8C4RHVR+ANfUAhKFjSktNHrGb2MFEzlv1N1fbZHOAA
	uQGaHIetyEdp7ABwJN/R1Ptl0dAuEEz0+wUOrOu2XN3npuVyuuXEUzid3GwoAsPkxZYCa7p96dq
	Ct22Y1ZYkWwu3Z/+KrodI5bC3+KjiAUBbukvnmX/YotxQ5ir93NwzZ17CMt3gAmIdXKnEu3IDSb
	BQ/J1k05koYa6AZ4sDMxFCKMqhy6X145rLo2vTG+BjGdYvDRLcI8D2geujyJsSYxvDsrfg5ges2
	NlbbqCB6Ej8M3qgLaQSP/AJGF/rn2dxUv+DcuEgRR4kh8tLuXk8GiI9rWLMs8hatmy+A32C2z6t
	oLvzdJlRM0OwLVTgXiJglY6V64y00+4j7TRrDwSgcyvXOBGfBI7nt18IpjPBvneINQLopKBxR9V
	iVYgIcMcMgCqKdvQRtzL58saEJIYym2yX9jLvo2pTDO60CsVaG7mbf4FGpfDZ5oCuVi2upPM1mf
	iqXnwoVZIjwhyli0Y4iNr2jYAQ177pIVKH4My3oIXbmRsUg+aoT4uHczYxexHXS+e7FrvTBYdkB
	wZGYmCIfhk0BjqhpoGHfkosRWkP/mMzuGc7nD6+xEHJXhXamnNqVnm82AC5APYSUl+99F7MxAAo
	mS+ZBK/OCq2vDUSA7oUPWovfo9TKAhAuY8NDRxFsd3Xxusj7gohIRNKox4yNxkBIJ31U34jKHdp
	ZQJW8jPICicNLsqk/jOIxMXgjgNXaDrNOeXMkwVGEB0ZbW8hujf8r8cdY+tMZzVw7Kxyquw+twU
	0wLuqNe0SwaNOrjdlN119QHh4w02oO/uGEinCscq2fUhygR4uhcKhBu/KA+cMcxZ6omj2wotoBe
	XRcVRS91VjZF/tF7wuxdRguQf6s=
X-Received: by 2002:a05:693c:80da:b0:37e:9a3b:76a3 with SMTP id 5a478bee46e88-37e9a3b7e51mr5472129eec.11.1794851684995;
        Mon, 16 Nov 2026 09:54:44 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 029/105] python3-fastapi: upgrade 0.162.0 -> 0.163.1
Date: Mon, 16 Nov 2026 09:52:41 -0800
Message-ID: <20261116175359.342679-29-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132485
Content-Type: text/plain; charset="utf-8"

FastAPI now depends on anyio directly. The settings examples were
renamed upstream; drop all docs_src/settings/app02* examples, they need
pydantic-settings which isn't packaged.

Changes:
- 0.163.0: add dependency concurrency limits with
  Depends(max_concurrency=...).
- 0.162.6: breaking, drops support for Python 3.10.
- 0.162.4: require AnyIO 4.1.0 or newer at runtime.
- Fixes: async and sync yield-dependency cleanup on cancellation
  (0.162.5/0.162.7), OpenAPI for response models with nested computed
  fields (0.163.1).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ython3-fastapi_0.162.0.bb => python3-fastapi_0.163.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-fastapi_0.162.0.bb => python3-fastapi_0.163.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-fastapi_0.162.0.bb b/meta-python/recipes-devtools/python/python3-fastapi_0.163.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-fastapi_0.162.0.bb
rename to meta-python/recipes-devtools/python/python3-fastapi_0.163.1.bb
index 4c5a5b5dc8..298bc815b9 100644
--- a/meta-python/recipes-devtools/python/python3-fastapi_0.162.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fastapi_0.163.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://fastapi.tiangolo.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=95792ff3fe8e11aa49ceb247e66e4810"
 
-SRC_URI[sha256sum] = "6a22c1e2e6e32e0633ee7e170f00009a29b8228b16feb219ee42f32fd8d88a8f"
+SRC_URI[sha256sum] = "3d364b02a68b67292e833ff2dfed3b8dc3aeadf73e271c15316c6c166668792f"
 
 SRC_URI += "file://run-ptest"
 
@@ -20,6 +20,7 @@ PACKAGECONFIG[swagger-ui] = ",,,swagger-ui"
 
 RDEPENDS:${PN} += "\
     python3-annotated-doc \
+    python3-anyio \
     python3-fastapi-cli \
     python3-json \
     python3-opentelemetry-api \
@@ -49,6 +50,5 @@ do_install_ptest:append() {
     echo "import sys; from pathlib import Path; sys.path.insert(0, str(Path(__file__).parent))" > ${D}${PTEST_PATH}/conftest.py
     # these docs examples need python3-pydantic-settings, which meta-python
     # doesn't package
-    rm -rf ${D}${PTEST_PATH}/docs_src/settings/app02_an_py310
-    rm -rf ${D}${PTEST_PATH}/docs_src/settings/app02_py310
+    rm -rf ${D}${PTEST_PATH}/docs_src/settings/app02*
 }
