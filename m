Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33641.1794851674672529033
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=kzclMBcu;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36dbde64409so5472703eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851674; x=1795456474; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QoyyHr0wLgk/1dxH8hYly4Obg4Gp8qrzN7yeoLV1VuY=;
        b=kzclMBcuSZ5CZSOsPzp88byWVxoZu8PidjDFvd5Ubk6uaXqrIcBywEMuAtAri2D+PS
         VX+PsRyxAGQva65XijV0GJ6gqdhtYC+mjG//iYMVsM1ox2hWn3sMW5a7rP6QcT84AKip
         dSWRhGHfM7ICfMeQf8focfRPrV4Ptt9+wc/kHqpenPPUSdtRPEd8JhS0de3BLpoGLsSO
         40TtMceBSysB2a90FMytasPcvRLx/WvxhgIu36yjEU40pkjAnVBNBnwsMSof01yJPLIn
         MNud6Iudbribraop/6dX+hr7MX8EytvfFbhAKNxAAPPjunOp4rpmPBcoFUH07yPmP93d
         Cwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851674; x=1795456474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QoyyHr0wLgk/1dxH8hYly4Obg4Gp8qrzN7yeoLV1VuY=;
        b=1WfM4xAYgF22hr/JkFgEX48nYqL9FG/awrkjYv9qnVANoWG/gfyRXWwJVSwpsKLokh
         yhOcQ/Cjp1xtcrP3QgdtBTdHQ4xYV9/e3zWIO2NMNcTgX1qU13SxJlxsRjnuKpZpunGr
         M152f7vywRn5bXbYjUqdbQJl3qRO5H6iH5mJJkfTyFKUy9SQFO2DqhUxYVsfSOEwrtWm
         Rgm5BhFPhr8pXTZZ2i/hN299D5nxrrRgB6a7Kq6hVJLXwrHPVb2fAQ2Ztr06uDg+l2Kb
         0KGGlgZQ4BeXqfLhBbXhRYor0Zzcx5Su1w3rjY2EKEGZcyaeYdSPQNolqe9PIbPjFdGV
         oCdA==
X-Gm-Message-State: APuU4Z+tV7IFPSWvd6mbrKhsAt07sNQjz3EME4p1tx/n0WEKRyRk4LDI
	2uYKEyrBUZL5nNbkbeSNeDUD3ZgsixbYGdgnZy0Y0DRn7CbPN3nW0ZF865Gy1YAe
X-Gm-Gg: AZFdTZc7bbqovb3i3bKXPyR+q3+WhC4+Psn82XwGgaaC6zga1lnfK9by2eameG0t7ba
	vvGv0E9x9NbTKeaGNpxvm/lEpygNmEv2uoOC+yAzeLscioqkp/2KSHakw34tjc0aNKkYRKIzP5e
	p6lDMjkmxERpZyUcLXDEEE7Bv8fdcBDjXT1oTGXhKF+nzqhIXYX5V2j5I+q/6EJanhJuFFjRpes
	8Brx3hEfbZHHKCNboliiday7iLad83DRrHg/XhWmJu2nte0t0ruhoca2nymK+V26Edh8SFPJRQo
	xEhG/4b61Ljiwag1GPsVHlFGzszqOyk9Xtu5yXJ/sGd9Q0ZOZc+Q76RWa5bus3VhlN2Pvv6Uv+r
	E1HRwni5kEYDMiGXp44nM0nPaNoNep6xFpbZMtrwNa26joOZFlagyuQkTggitGNBWEN8uePvMIp
	BZo4ejpex6BNPEMCwOZekCKtBNL1P3TV0GOVwHdjWxF0C3XWefT3G4y8p22qnghcsw0icJerwCR
	0CZ8vYDcCfgT4vFkP4n5VakswpGX03LxDjHzZsxTkrDqJkSGXzWlxXKEDjZxBmBqZU3e1dlH0eV
	uezuuAErWHaDPDwHl/JtLf2vnTaiD0lRp8dpjU4z/y9SGZ/cpieXA/9iAh0gnZw1p8ZMlZ9gS69
	TYS17+Ln4I2GPKBO2KTqClQxW/pluOAop5I4vAuh7gxGFzBRj67OVCKuUX4ARPoAiAdhvLyBbu9
	nwL4aR1/zTNjXlf+kELa79CGvqi2Qx4Pz63/2bufyctC0Ig0cQAL93tMuK8rGgOzgBF1WfSbare
	h49Yb/RplcgJDT2VolJmsbaS6eKfJyVXw6nKItRX48Gth1RZpiQiwlNIWIenr1KeDTd/2t1xgFZ
	9fgR
X-Received: by 2002:a05:693c:4006:b0:369:2f25:33a7 with SMTP id 5a478bee46e88-3796676adaamr10145460eec.15.1794851674003;
        Mon, 16 Nov 2026 09:54:34 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 019/105] python3-cvxopt: upgrade 1.3.2 -> 1.3.3
Date: Mon, 16 Nov 2026 09:52:31 -0800
Message-ID: <20261116175359.342679-19-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132475
Content-Type: text/plain; charset="utf-8"

License-Update: Copyright year bump.

Changes:
- Fixed out-of-bounds access when a buffer view has ndim == 2.
- Fixed dsdp.sdp() reference counting; replaced the removed private
  _PyUnicode_AsString with PyUnicode_AsUTF8 (newer Python builds).
- Build: setup.py default library/include directory logic rewritten
  (platform based, Homebrew prefixes); pyproject.toml now requires
  setuptools>=64 and setuptools-scm>=8 (was setuptools>=45,
  setuptools_scm[toml]>=6.2); requires-python >=3.8.
- Documentation refreshed.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-cvxopt_1.3.2.bb => python3-cvxopt_1.3.3.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cvxopt_1.3.2.bb => python3-cvxopt_1.3.3.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb b/meta-python/recipes-devtools/python/python3-cvxopt_1.3.3.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb
rename to meta-python/recipes-devtools/python/python3-cvxopt_1.3.3.bb
index 3573d7719f..00f84724c4 100644
--- a/meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cvxopt_1.3.3.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Convex optimization package"
 HOMEPAGE = "https://cvxopt.org"
 LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=66ec4f8e53d3e733a8c26d5ca3830fba"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=878d3698da0459c16007d32b4b2915a4"
 
 SRC_URI = "git://github.com/cvxopt/cvxopt;protocol=https;branch=master"
 
-SRCREV = "3b718ee560b3b97d6255c55f0ed7f64cb4b72082"
+SRCREV = "add0181990cab7e018e82246028ded3d67778f2e"
 
 CVE_PRODUCT = "cvxopt"
 
