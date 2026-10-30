Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8945.1793358220759436146
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 04:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=LdpxU408;
 spf=pass (domain: konsulko.com, ip: 209.85.221.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so1003538f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 04:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793358219; x=1793963019; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E/m1QhR2FMzHtnlEX34OIzXcQIcgj70+fQ01lCPIiNo=;
        b=LdpxU408KYYTVWeQZYim1fS91gDaSAAbTnOpSRE0yPyCF+su/DjFFdrzg7VK/WCKLC
         Ia6sSRTLNPzAGn10qiinZfz/b5YWJnx44sivu7ViACVZhwkHNOyyRS/TcuZRwt7nT/XK
         zXyfH9YG4HMcAcMj19kUWt1FNdhsLpY40XLEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358219; x=1793963019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E/m1QhR2FMzHtnlEX34OIzXcQIcgj70+fQ01lCPIiNo=;
        b=QladS1INWBVejqPp0TwPzB/UzrXOkiRtLaoAOrzGS4Od49KrfQFmlDcfx/V2qNnZma
         tJTG7760eBOB+Z1q3ncCdcaIzgcIZwW1bCAFDKXxixMudM/1uANQ+hm9txUPx6NzXtR5
         NIJARycNERUHgWgwzCwUK2MZkHr7gEocZVdnPhl3shYQAP7NGhXa8KNl9bwrTgV7u6Gg
         kiq5FjNhAJHiiKRyJG3XjJNKSViO+YTr6c6WGb4xRkloTJWfRYI3XkT09bZciWdpHtq9
         O044eI/k8WNLgsRu0WsHf+zGjM3WUKqcMd7BLm2dlQwQOPxOxvQTaBQcedfzudhaihTq
         SXhw==
X-Gm-Message-State: AFq9FYKZuZ3R2a+3ADI5zv+qMxrUtoQiZePbiVcxT39xXm1FCvvFNuNQ
	jj2zDVM2ylJge2zmWN4Sp/fhXWnYZYeNBIKZ7sPqKXJa768Y4XkCydZ/emNOND9arpGNmT5AJMi
	ujCZM
X-Gm-Gg: AYBFou1UALbHSmgVUxP+OheMG97xtepcD5iDwRnAVQeFKPSnrIR+Hq8SkqfSGSTSQ9d
	KFJg0cfALguBCFu1MAvptqKz7chTUsjWukjcJZbSdDzmU3KtajI7uQhK/5Fwu1n06ghgZZa1lC3
	q8NrFtazMmRjtr+bqRyhc+adj9EvICMye0+j2/arpvOiUdzFCKGHm5DhwuIXJC7bMrxZqkw17Bk
	V7sHvNQZ4mjZlKxwVYuH9ZMdlzTVRp0fscbu3J/Zcl3yhbRWYpV7uSpggP+NBqzqV7tjnA9OctR
	ZAj9yIO3hurD9VQV6HonwAZYC+SwhcwbiuSypqQBCOV4G1pKFoJObF0NDJekhxoE3iVIXJXvDGX
	VyL63exck7SFMZCD0GX5KGWorC0vB4BdhDX/gyruRxZbHvsc8EQcCGIrP3ya7kFBMzT2/3KtEj+
	7Xyai0Fd1Nwq06Qd4rWlcT6d9GIVIiiLBPUD517j/bX0xfdYC34pIZMN3fmnAhTYI2mIIdMV5Tm
	/NrFLKGJw3/Y7DVjiWyS4pb2BhW+DAdANkbgcJIoU4nLcEADvT/kdfYfHw81xVMCl24ljcNqee8
	gI/2/xC6sfXtrlaC7PbXgmviFC63I8mZOyuBRTLAD3atAYf+Xgz2G1z7LmMNr6dPyzuSeSUb+6J
	6KHTgn5DAUnet/oa768r36nzm/YgaK8gR9hzXjHqsGHSYt6uk+e1ILw==
X-Received: by 2002:a05:600c:2541:b0:4a5:9224:fa10 with SMTP id 5b1f17b1804b1-4aa8b060adcmr106017135e9.18.1793358218996;
        Fri, 30 Oct 2026 04:03:38 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm2642151f8f.23.2026.10.30.04.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:03:37 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 19/25] python3-canmatrix: Upgrade 1.2 -> 1.3.3
Date: Fri, 30 Oct 2026 13:03:03 +0200
Message-ID: <20261030110309.1124614-19-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030110309.1124614-1-leon.anavi@konsulko.com>
References: <20261030110309.1124614-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 11:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131701
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.3.3:

- restore toplevel re-exports for full 1.2 API compatibility
- docs: quote pip extras url in installation instructions
- ci: test python 3.9 in the matrix
- dbc: import BA_ BU_ attribute for unknown ecu
- j1939: fill unset bits with 1 on encode
- fix: fix canmatrix.utils import in xlsx

Fixes:

WARNING: python3-canmatrix-1.3.3-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml specifying backend
setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-canmatrix_1.2.bb => python3-canmatrix_1.3.3.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-canmatrix_1.2.bb => python3-canmatrix_1.3.3.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-canmatrix_1.2.bb b/meta-python/recipes-devtools/python/python3-canmatrix_1.3.3.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-canmatrix_1.2.bb
rename to meta-python/recipes-devtools/python/python3-canmatrix_1.3.3.bb
index a02674dd21..6e1bc7a5e0 100644
--- a/meta-python/recipes-devtools/python/python3-canmatrix_1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-canmatrix_1.3.3.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://github.com/ebroecker/canmatrix"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bb3bdbe015537f08812c87d93670ea1b"
 
-SRC_URI[sha256sum] = "19d5ba3fd69974bd41985b90198503bfde6ae3639dfc8ce6a2f7a0338787dbf7"
+SRC_URI[sha256sum] = "9af8f0a655277402c1fe2a5e2a8e8d5021e5c19e86f647f47b0c2aa209597ebb"
 
-inherit setuptools3 pypi
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += "\
   python3-attrs \
-- 
2.47.3

