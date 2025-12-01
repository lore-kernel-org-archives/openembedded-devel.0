Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA3CD111A8
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 11:20:59 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19324.1764588051227931291
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 03:20:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=GmkBGfxk;
 spf=pass (domain: konsulko.com, ip: 209.85.221.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42e2d02a3c9so979928f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 03:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1764588049; x=1765192849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+cGrwY15DeDZpwIdJRH0tH5DaNr8SxLMBQupqtoLIo=;
        b=GmkBGfxkWDW4Kcv1nMfRpARDUxs3IQNLM8S7GgeTqnMTqiKTfsFFBSNzvAJaBBJS/U
         wgAUonxYteVu92oSJCR7WaR4u9D8R3g5X9eBz5p3lDyK8OQQQxFs/Tfl8iXuSottQoPT
         VhpjEt1xpSMaZjJKAGT38yJKwrU2Q/NxU8Yl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764588049; x=1765192849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D+cGrwY15DeDZpwIdJRH0tH5DaNr8SxLMBQupqtoLIo=;
        b=ixwKM+PNfNaqcmWs9w3bg8bRuuSrtpYBqpxZUXBrD2cz2cxxahcIGIvgqU+fxHnyXN
         r6b+pXY4W8UJXWsqsXiSqVjiE1qs7E2rH8UdpVH+sDJ3McE+wl36jntzjP96J7QsW8Xw
         rGVMofq+80ZaUBIJATOYSttnS75KwVT+4fw/NW/4pAZM44WoGU1WQAmreNqyEfMj2ntV
         TxK4Nrz+Ao/RngXk4/IpWS1JJV8cEREJzo4pyy3oC3BY7E2jXSvIQ4m+KGQ0LJ5NDwI3
         5cVaI+nVNFYzAVwryOFR/Pb9p7hXoPp+EjLg1B5/fEvQkWCKg9mEIO8VyU+IiAyI5+64
         3F2g==
X-Gm-Message-State: AOJu0YwqV6E6bd/aGTCahD9X4o5/fsmukPSJkCs9Gl2r9tZvBaLm7JEQ
	hYZb51mn1bfjuu1TEnydUFiOdIC0zwX9lhjlHnbibDgjKonkIrcQvmao9VFGmGwUsb0kPP14ieq
	2bTcU
X-Gm-Gg: ASbGncsoo9gtQ5MZYBbW4qWaqxtOWWH+DUe+eEXyHpZfjczKz8UvQNP2Iq9uGrSldQ0
	ZRoRFFD/iyWog/cPCNIvQ/RfQZccwXm182FDB1ziR9/oVrJv9HwrgPHHzNMFmXxjGQXdV7f2fsG
	O4VG5ZI2m+Rjcvr8UhPpaPxjf7la4cc2cJxO+C2VgtN4hGFcCvtny2moByqeWtWeHf84j1wjscF
	Y2pIqa36UxnxBjZzRaGgTdIUgZvyrOfu9ejQJBLDG9UxLQOvn0hB41Ez2A1s1kMnEYw7n1njR1R
	CwEHwqyL3TmF/sH9Q3thbX0Bw51lDd581vsaOR+bqYo1QBfAdF7QrfvQLM1Hrr6umfOwL9+Ed0a
	OemC1nD8DRqK7Tr+qft3NLPkeVjABc4FPMxavBIBl+EqYF3TJ3EHM8SIVthuu+hlykkr6PULquM
	W3MWc38B7dbDSWqcANdU1pVOyi
X-Google-Smtp-Source: AGHT+IGg7qIHUxNv/ft5QIdmGn7ziXxZza0QkyvN8+P8ivxiX+77D3E7kzLSF6F7L9oWekTy9HS9Gw==
X-Received: by 2002:a5d:6642:0:b0:42e:28a4:1fc4 with SMTP id ffacd0b85a97d-42e28a42426mr7319301f8f.55.1764588048786;
        Mon, 01 Dec 2025 03:20:48 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c3041sm24524527f8f.6.2025.12.01.03.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 03:20:48 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-toolz: Upgrade 1.0.0 -> 1.1.0
Date: Mon,  1 Dec 2025 13:20:43 +0200
Message-ID: <20251201112044.369630-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251201112044.369630-1-leon.anavi@konsulko.com>
References: <20251201112044.369630-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 11:20:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122203

Upgrade to release 1.1.0:

- Add support for Python 3.14, PyPy 3.11
- Drop support for Python 3.8, PyPy 3.8
- Add note about project status (alive and maintained, but inactive)
- Use yield from in merge_sorted to improve performance
- Fix bug in partition_all when __len__ is incorrect; now raise
  IndexError
- Modernization

Fixes:

WARNING: python3-toolz-1.1.0-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml with
setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-toolz_1.0.0.bb => python3-toolz_1.1.0.bb}      | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-toolz_1.0.0.bb => python3-toolz_1.1.0.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-toolz_1.0.0.bb b/meta-python/recipes-devtools/python/python3-toolz_1.1.0.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-toolz_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-toolz_1.1.0.bb
index ec67a4b161..ec0e02cde7 100644
--- a/meta-python/recipes-devtools/python/python3-toolz_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-toolz_1.1.0.bb
@@ -4,9 +4,11 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ca09cab178326d18433aae982d1edf5d"
 
-SRC_URI[sha256sum] = "2c86e3d9a04798ac556793bced838816296a2f085017664e4995cb40a1047a02"
+SRC_URI[sha256sum] = "27a5c770d068c110d9ed9323f24f1543e83b2f300a687b7891c1a6d56b697b5b"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += "python3-setuptools-git-versioning-native"
 
 RDEPENDS:${PN} += " \
     python3-json \
-- 
2.47.3


