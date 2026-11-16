Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15.1794851766903407784
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:56:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=UMxjyCJV;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36dbde64409so5475338eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851766; x=1795456566; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mPCBt75YsLwmpxczdgIFuYhvne+n+5RVQfYf9umqC84=;
        b=UMxjyCJV3O9Psy0H+0z/kfGx2P2q0/PtWjNfdbI6BPxaXK6iZttV3ZFvSUTyk3ZKyQ
         qV/YipJcBU8f6/FFt0RRZWHjWVB+GMdjHQZcjzHOtDtbWKYjwzShHtLLf8h4K3pkRYrU
         jw3n/p2AOmQ5RoyAxRnsLj27DraXtg+z2sL5wpAi4zhLE47hs9Wn+H2Us39/vO6MsJeF
         RziV6mpCGQT5tFb9zqgj77Mny+gMmO6ioAT/nOrcPqpQB6HtkrHobE0Wa5HoVtg2nMFK
         6cSWt8uIAAvfiCiF/SaTtZjAoCrkS0t3MH695nRF0RN8gFwx2Retq+nAnPVYAPCr4OSZ
         mITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851766; x=1795456566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mPCBt75YsLwmpxczdgIFuYhvne+n+5RVQfYf9umqC84=;
        b=rBrIpjQ4pIieiFIlm5JySmQddOqUzS0dZnLrO/KOQOgdAQfhzkvmkAPnp9tFucPzhS
         X+AmqZauDb+FcjxeHDT86zIBxjMi/rOgPRVrvzuQxiDxPwpCBOYIQ5VzRE3ZRvfA+pn/
         NcrfHvgGz6rsFYoEiwlk6noLA6GiXeu0wJUQok1Tde3cgUtXQSqpoaiyqHORehx6/GGC
         Ei9O7lGHcxn78mm0MbNFGLJtvhGMASxS5j+QiN45sh1oPFvuPSMAMR+hVrC7i7zc4sLG
         F5MiPSZGzxU2k06ES9P0nHg7fTvvdBMYweWk1DzBSJcAOPvW/QnovjFpZKf8igy9G+sT
         PCyw==
X-Gm-Message-State: APuU4Z/dT8SR/491Eq0ExFQhPYaaRcJ8Zkrn1RGZ5si7BUBatUq96kWh
	s73eQ0IaRXmLAb6WM+bI0uZhcIs/vBV7Zz/U2s5ebBRCtzsfkVYjn1FCRqhbwXJj
X-Gm-Gg: AYBFou04d2kcsDQ/ncs4ouRWk2vB4OyTiHVn2/njDxIJtVzDJBmxYP/6cQLFkgZUoic
	tX0ECd3JsB9wGd1+4EzDYtBCy14mz1vfl3+VCePOM3THiFMrJz0l18HEsHwAafoxX3DFVYPQdoI
	dxnvy6A6IoiQ9fyI97dZTLSUinsTs681l5/eUfluaRHMf0vtTAA6tmUMx5PVZnAVREfdcq5oZI9
	19lB5HqZuNiwwYTS/ZH9oJcu2WQQajpXLO/nXASF1WqezaGA4p2THeWuqiHUo7gIC79OqJR/mOJ
	u7UhGTm0W4XQNpxsuomIx/cnTELdDe+aBq6kU3HnuuK8Pqi5ffBLzhJfKBuFIHLieOxxhgCC2AP
	Bx5fyAxqlVp06hWHmPbe25gxXbbPCJGY2fAFG1GRB3B7z7BpbujjfwUkcXyOwf7Wr/xdTSYi8Ok
	rfwka35w/v20l3byVsKNgGWyoMB75yNzZojNgoenzrwuvidSLAnW7GpcEBtXEVbGjUQtceKiBcH
	8U3xJdK9ZTZsC0kwJuB+xeWxbiBjcVkuLxyZn2n/B2db+A7TZfIy80nKIUCM49ur7s7WcpgNgd/
	mhDV/ZWXEmtN5FyQJWjIasD+j9ocOe3l/ALohOVrg4ujL02HshFUojAVO10WGDqv5ReHa2+tiQ1
	EqlMfEvYhDJHwY9nMOcdHSlduqVE0CxG2jnaq6gzEZFa/HY1Cskr1XqRVEQoleFoN9TvLQUv0Kc
	+nxhFRfGfRvsuCveDrgtvjlV3q+hrbinVNOHTYAGJznsgtdKkK7Z9y08w4QvrJJzaKUM+30s3l7
	jGOI+08cZscAupnOukhUPUe6SKTsdrO9Rr1Zb968D7CCRQDnjHBqpD87Rp+4gEYE+NVMzc5HWuG
	4zfx
X-Received: by 2002:a05:7300:de09:b0:36a:18d2:8c79 with SMTP id 5a478bee46e88-3796676b135mr10511161eec.19.1794851766093;
        Mon, 16 Nov 2026 09:56:06 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:56:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 092/105] python3-time-machine: upgrade 3.2.0 -> 3.6.0
Date: Mon, 16 Nov 2026 09:53:44 -0800
Message-ID: <20261116175359.342679-92-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132547
Content-Type: text/plain; charset="utf-8"

The fuzz tests need hypothesis; add it to the ptest RDEPENDS.

Changes:
- Dropped Python 3.10 support (3.6.0); added Python 3.15 support and
  wheels, including isolated subinterpreters (3.3.0, 3.4.0).
- Mock datetime.date.today() directly; new escape_hatch functions
  for date.today()/datetime.today() (3.3.0).
- Destinations are computed in integer nanoseconds, fixing small
  rounding errors; today() is exact for far-future dates.
- travel() accepts None as destination, meaning the current time.
- Fixed a reference leak in utcnow() under -W error, traveller state
  leaks on setUpClass/tearDownClass errors, and -mno-omit-leaf-frame-
  pointer breaking source builds on non-x86/ARM64 (e.g. PowerPC).
- Migration CLI for freezegun/pytest-freezer users greatly extended.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...on3-time-machine_3.2.0.bb => python3-time-machine_3.6.0.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-time-machine_3.2.0.bb => python3-time-machine_3.6.0.bb} (96%)

diff --git a/meta-python/recipes-devtools/python/python3-time-machine_3.2.0.bb b/meta-python/recipes-devtools/python/python3-time-machine_3.6.0.bb
similarity index 96%
rename from meta-python/recipes-devtools/python/python3-time-machine_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-time-machine_3.6.0.bb
index 9b2dd8617d..d77f31a0d8 100644
--- a/meta-python/recipes-devtools/python/python3-time-machine_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-time-machine_3.6.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/adamchainz/time-machine"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fb9b93a440d3ef2fb6eeebfa59384c53"
 
-SRCREV = "1b7ac45defb26c72076dc202aba46967c8c28fa9"
+SRCREV = "7434cabf2b539f5cb0ecfcb1e05864424acb3ee1"
 PYPI_SRC_URI = "git://github.com/adamchainz/time-machine;protocol=https;branch=main;tag=${PV};destsuffix=time_machine-${PV}"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
@@ -37,6 +37,7 @@ RDEPENDS:${PN}-ptest += "\
     python3-dateutil \
     python3-dateutil-zoneinfo \
     python3-freezegun \
+    python3-hypothesis \
     python3-tokenize-rt \
     tzdata \
 "
