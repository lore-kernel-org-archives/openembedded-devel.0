Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33673.1794851725312007720
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=x4HmHblO;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36f6295304dso3149452eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851725; x=1795456525; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EKSji9XsqJ8PubZFa2HPn+z5iHfEtnfBxluYEdsiqf8=;
        b=x4HmHblOy+9+JedRk4eI9P9KqYBRHMsaZDZuQJ6Sevmb3395RH8Rwr4XW6+Cn4PpPv
         T4p4Xc1nUVgFt6+oORwUj1fVI+wvzvmsv9Koml4y9eo00WVLt/X+eOSImiJeoOJwN8qS
         H2b6E6+OaiapeDMC+0Ah1OSZwhk9LTByBRPs+1fjMPf3Sms1d0/qxCai1zseHOT0KY96
         9rDEJDFSma4Z9Srl5O+zeZ4eg26vmiiLcRlGAylrSvMNCERae4kG3QrZF2CW4kCgJ+48
         IHyISGe/3u22UpQ+oqFr6zD18ilMCGgy0q1fsgIDXO4xpNRHnPKVoytxbrqbSYuVuGNX
         FBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851725; x=1795456525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EKSji9XsqJ8PubZFa2HPn+z5iHfEtnfBxluYEdsiqf8=;
        b=JzkixJmUH4yAIJN9F+XSihLHgnyxo/a0L/yjclnMHDVD+ailytSPkgXWRbx2fQRcm8
         ZoRQ/NV6jPVod3c28YaF9OPiAtkjyIK6BVY2rysfYd7A4fMZKWpj75LTU6b13Pu3lwJL
         2LAyYmYFp6oGHlUhLE3Zn8HK2Nkqi0hvcYq+5yJ5pKkHs1HzapP+v71MgD9RvuYFoT3/
         fkQfVXnNImbTqs1/RjjdQjr6PNDK9EBTTCcccqmb8FWYHoAuMQF8/bva8n940Xc77Tv3
         BFN9C7wI6MJCEh6kv+BlpmUHMksF1IWGGMDdjPJHWLkYAqOl6vjMVENZgNFlf0zxJeXH
         U+tA==
X-Gm-Message-State: APuU4Z9vlYFOupJsAhXwaLUyx6t6qLmc5pBUycDJFh5rWnt5KRvwjKc8
	456XfC3FY5fglUl1qvZVzoSFSVGFvhYl5jVV4dZqsbyXW2Y1zP/8usBaVy3mUBdk
X-Gm-Gg: AZFdTZfX12XLW7Sed3s/mZDdt53DjHyTbQStBCDk1NNzKT7sEnL98YNuWsWDHjatTA8
	P1UcRxRteVU/vmOuPqHmVVk05IqrKxj+kbLNAVzNaimg0RjdTUKt6TR6JA+aG6JITZ1o1MCZ+1h
	4HGxozLVB1wS7ZNsXWZ/UcuQS/jHsPimaOoe8AYOl2ycQmOyKZyA/E+d/sli7sYXI9xSTFI6auv
	D65rzhD8BczGhxYCwesXadHn2iVO3ygtGAzWMh9vmbSQ6MK7QUuABi8OuGA0wjucfXzKPs0b+Hi
	vudSB3UmiQ7Z2hdmEsdetQz7/eRmpYlRD/ki7eGMirPyYSRAJyODQMWiZSmXl/H8ZBod9HSKc3k
	+gInYdREtFEUJlR35tkF8ep+mdKqIl4LOFldIoUzDl/lJYdW4DRtkJOgwfCpw2pGs+DzzM8Fcw5
	4ojgMu6dK3PUogwqzbIHT0BzpnAYcpryTQDhSVn/e8x/FqmN/6CzM+IbUORnxWos4XTVNoTYIll
	f9MMEwryGIjBRQdhwdDVe6B/Jk+Ibg6Uvh9kRWk2qlE4ely+AAgSmrFoGsgHzQ2FUSb3gVgCzR1
	gPR0a2BSQEY4mgljQiE2jvqfBvECZ2VvVEx3MgLfVW5VasulE1vAFu6TNmTN2IIJvK1sC4VdmvI
	OSXCyTv+64n+UWMUHxobcBTvKitCsJrpzGa8du17ylTFX46+iBC5hthte2udaoLu2YcSDeKluT/
	DLxnF/jmr2j6zWTzYGRZIuUzeK/ktJPJqbVT2O2DdxTgnFVrMPEmE8OP4s6pSNvL1drKWGjTblg
	mjzRhL8oiVEEiUA/aJfppYBw4A3x6IxQtf7wqN8KYpIwHhNBKAOLj61l18RmRsn4ibb+qj0sTAQ
	/ORWe9wPffJZaeCJ2I9uTeeysA==
X-Received: by 2002:a05:7300:d0a2:b0:36e:ff7e:e57f with SMTP id 5a478bee46e88-3796628f98fmr11026010eec.19.1794851724578;
        Mon, 16 Nov 2026 09:55:24 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 057/105] python3-pikepdf: upgrade 10.18.0 -> 10.18.2
Date: Mon, 16 Nov 2026 09:53:09 -0800
Message-ID: <20261116175359.342679-57-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132513
Content-Type: text/plain; charset="utf-8"

Changes:
- 10.18.1: assigning None into a page list now raises TypeError
  instead of being silently dropped with nanobind older than 2.13.
- Build now requires nanobind 2.5.0 or newer.
- 10.18.2: fix Windows crashes when locking several Pdf objects at
  once (duplicate internal C++ class names); extension module is now
  built with LTO (about 14% smaller, disable with
  -C cmake.define.PIKEPDF_LTO=OFF).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-pikepdf_10.18.0.bb => python3-pikepdf_10.18.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pikepdf_10.18.0.bb => python3-pikepdf_10.18.2.bb} (96%)

diff --git a/meta-python/recipes-devtools/python/python3-pikepdf_10.18.0.bb b/meta-python/recipes-devtools/python/python3-pikepdf_10.18.2.bb
similarity index 96%
rename from meta-python/recipes-devtools/python/python3-pikepdf_10.18.0.bb
rename to meta-python/recipes-devtools/python/python3-pikepdf_10.18.2.bb
index a915f51efa..b0b5fa8e5f 100644
--- a/meta-python/recipes-devtools/python/python3-pikepdf_10.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pikepdf_10.18.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/pikepdf/pikepdf"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9741c346eef56131163e13b9db1241b3"
 
-SRC_URI[sha256sum] = "cb555ebff93482e8a6eb55881488b469bbb2b5675161c1b93a0510a8642d98d0"
+SRC_URI[sha256sum] = "b32ee8b0ffe606059dbf3386ebe1dae6e2601098277e22e8c75c2ee982436b43"
 
 SRC_URI += "file://0001-pyproject.toml-Do-not-strip.patch"
 
