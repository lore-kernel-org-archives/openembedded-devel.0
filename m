Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8117.1795739792432781913
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:36:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=nOD+2YWd;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f04b676219so41512315ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739792; x=1796344592; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=agn8bh9eSjf7lE9V6rRSgSWATNHRpp3nIZ1md6V3eUY=;
        b=nOD+2YWd2q8lZUCIs1mbbX+zWWrPnPcufXFZt1nr/5XZz+rmAMvVqQzXT5Qf013cik
         mtq/rl5xkUunoy3Th7h4v6icYwDXV9++m7onfrgHXRaFvN0ifz/d/Tq5v/rUKUDVQbQc
         JO7r76ZkNDfGXOUbMWyEGhUqw1+fbLExlMJz6feJLtwTee4AQC/cIdl5teVZZBQMi4WK
         8GnksHO4lf0jN3Nh8uuXOMNeuwhzNWHtr8Sd2tEUG6mPmx4VTrRGNYp6U9yJ8jOabHRC
         QmL0YfmdOgui0WDmZLSAuOSq0KZ+t+8EYYKe1c2HU1vk6N+d9euv7ZVksluDLguSEEiO
         JWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739792; x=1796344592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=agn8bh9eSjf7lE9V6rRSgSWATNHRpp3nIZ1md6V3eUY=;
        b=P8INMlrxFeuH2tKBXgN77KUCVze0zewx3femG/erz1op2C6v92TUGxYOgeiuiOY+WM
         7eQoozf4m/LKLev9l/ZNPj3U9byLs2W9px4PnGQha9VXo5bsPO0p09mHwjcViI0tutco
         mdC1MG9FMpcDhODOI9m7ABHYK5Jl5XtYQQJly9Fy1S9mNqiIwbvzSi6MLo/DLDKI+DNw
         0GoYSDMLZa7lwl91FVwszSFhaRyNBjfYo4XHC8ARx9ug9UIdxWBpLFX95/dvZQUoykMV
         idxzkK6HLMYoSO7WIjvR2PEe7bUYFgeqBmm5/izSe+vum7uYa1GDqVrs0ciuQq9vG1EK
         I9Hg==
X-Gm-Message-State: APuU4Z/BSZ91Rtw03Qbn6u+uxz06ZuH/n1W9uM3+nMHSE/vNWPjnTs3u
	lUHkwjxfbjiERGZz0sSOmERQ/t4J7+CkJ/eMR5LhfZ/4naJXpkOvhnvzi/1nOg7D
X-Gm-Gg: AZFdTZdiySzfosJ5o4xdONrrGh4sG0pUXfEloKUSRNWAthjCFIeDposJGS6Co936fQi
	TjHnSw+m+JtlOHqiH9b+avuuAtmiJKrCrsvYjeieyK7tKLujYLByJji7b6USkHsellR1OKHGfG/
	dFJa5Z2OSlx1FYYzr+S/hJ6ZGgtkYOdKvecUKEn6z1gjzLR0czUl6UOcqaNsUZjwCQHbWAABI3T
	S0GD2jf1GebzjB/k7pQAbrBEXzyFrTgWXJT6BxKuc52gUvUAo/sonANgscH0dEF6v7nmXeh16e2
	qymL9FAlDH8CRBcCIRf3940D3+D1McHpkzRR+Dkqnzxbp0HtJDYZqlOdven9aHjMegW3VhwJvK8
	AVQ1o+X/KV/abMZmcSzb3rmIMS4tAgi3l5vDIYkbrVv3791ujodFnhpWcpBMpb5qq18DpsA1WFt
	xCIWjun8SD6BBPlqDYN5+oEkqQ0byuJ2kAQSN9rHg8oc52RFco9t+ymJCfoyFK62zJr2uOJ5iLh
	vzH+r3LcgnqVIq++QqCr4O+VEpAftlSgMJ1zF747DqdMx1uuXyEieLMJ281SbuBAgC049m2LqkO
	+rhGE7LVIIoC4UQYxnptLxZ/C6f+HwDfvn3FQ2TafiJKOuFkdlg5At0cP89an1UWta80V1A8pra
	UDhyQ7c/iQQ6tlP8HupAzW8FIFk2+EYWaBg7fBfW1ulnI3Ocw3IYB+Qtjyyyn3W8VJul0jGvMwG
	mxql/K+3ZlDdjq53vnf2l6QqqVtyATTZMOdBwne85+Tdy3534iNz7sMDerp9GkzyRWpZP6sV4hZ
	yFUoQWWo606YCOnYcvdzdXa7mWw7s5VkuZ6uG3SkPLsA3jao2QyEgu9hazbfm8AiWeY9eAA7rG7
	xI9Wc/i1V5/hVjuGVL45RnRZwg==
X-Received: by 2002:a17:903:19d0:b0:2eb:3522:99f9 with SMTP id d9443c01a7336-2f03f15664cmr313115715ad.17.1795739791766;
        Thu, 26 Nov 2026 16:36:31 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm10410875ad.55.2026.11.26.16.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:36:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 22/39] p8platform: upgrade 2.1.0.1 -> 2.2.0
Date: Thu, 26 Nov 2026 16:35:26 -0800
Message-ID: <20261127003543.2167775-23-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
References: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:36:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133192
Content-Type: text/plain; charset="utf-8"

Final release of the 2.x series:
- PreventCopy blocks copies with "= delete" and allows moves.
- Fix linking the static library from a C project, and a
  -Wunused-value warning for every consumer including mutex.h.
- The installed CMake config is relocatable and reports the patch
  level in p8-platform_VERSION.
- Use GNUInstallDirs instead of the hand-rolled UseMultiArch.cmake.
- Windows ARM64 detection fixes.

Build the tagged release instead of a git snapshot: rename
p8platform_git.bb to p8platform_2.2.0.bb, fetch tag p8-platform-${PV}
and drop the PV override. Drop the CMAKE_INSTALL_LIBDIR overrides which
only served UseMultiArch.cmake; GNUInstallDirs works with the value
cmake.bbclass already passes.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../p8platform/{p8platform_git.bb => p8platform_2.2.0.bb} | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-extended/p8platform/{p8platform_git.bb => p8platform_2.2.0.bb} (71%)

diff --git a/meta-oe/recipes-extended/p8platform/p8platform_git.bb b/meta-oe/recipes-extended/p8platform/p8platform_2.2.0.bb
similarity index 71%
rename from meta-oe/recipes-extended/p8platform/p8platform_git.bb
rename to meta-oe/recipes-extended/p8platform/p8platform_2.2.0.bb
index ab98e89592..5429708757 100644
--- a/meta-oe/recipes-extended/p8platform/p8platform_git.bb
+++ b/meta-oe/recipes-extended/p8platform/p8platform_2.2.0.bb
@@ -4,17 +4,13 @@ HOMEPAGE = "http://libcec.pulse-eight.com/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=b3a719e97f49e4841e90573f9b1a98ac"
 
-PV = "2.1.0.1+git"
-
-SRC_URI = "git://github.com/Pulse-Eight/platform.git;branch=master;protocol=https"
-SRCREV = "2748be52ae27e6007ef548b697d4a03ff7de4291"
+SRC_URI = "git://github.com/Pulse-Eight/platform.git;branch=master;protocol=https;tag=p8-platform-${PV}"
+SRCREV = "939f0dddb02319b967caac4d3baac6b1b6f13fc1"
 UPSTREAM_CHECK_GITTAGREGEX = "^p8-platform-(?P<pver>\d+(\.\d+)+)$"
 
 
 inherit cmake pkgconfig
 
-EXTRA_OECMAKE += "-DCMAKE_INSTALL_LIBDIR=${libdir} -DCMAKE_INSTALL_LIBDIR_NOARCH=${libdir}"
-
 FILES:${PN}-dev += "${libdir}/p8-platform"
 
 RDEPENDS:${PN}-dev = ""
