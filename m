Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10287.1795752837049789999
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:13:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=GC0txuA/;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3863db981d4so10744531eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752836; x=1796357636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pbmkU53iUsa38AjuTKEQ644AdmmqvjnUQHYYNb1cb/k=;
        b=GC0txuA/6wRzmKDpRUsEltbGFyMWnqG/C2p4T+GyxPFdDodUmCt+MsSYjZt+J2SSnZ
         eY+m5IFIn10wT53vPVCTGZ6fKBR7HOFEazzhOfG2pk/TiXDi0RnC3UbKoFDNQG8IqRcg
         PeQhlba3JVMGh5K/Bgjw+bHeC6Tflier7QbGLaW9lUaPUSOwXOoZaHvpjlAbI5bvCfI4
         1N6iD4jNfhvF3codXRkpcTM3P2lKFHqBkpBVXxoCa+aE01yPe78RbzQKaqbo1nNAfOnG
         200Ab01y4slPNe51ygqa4Z+JDG/wBinQhuwOCQ6ZS0UiC+yfCWqkLJXb6liLq61xUTMe
         rR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752836; x=1796357636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pbmkU53iUsa38AjuTKEQ644AdmmqvjnUQHYYNb1cb/k=;
        b=RsBu+17sDt4l3CDlrBMtQVNarYe3cX3TdRdihqFzD20LENMyijcnzakFG3fHJ4mbba
         vSUihmCOLPaubr326NNy005ORL6MrZNVjx7DCghiabggQXFuLPEw2qd1bXFL1uGw80nB
         IsHxp33BQn4JPLDjv1RChjvXZfKZCD4XNgpBw0+CFTr85SUkORfpM07YyawdJ3RK9j/u
         /duKpWA/teSmxdeQzK88GX+kfEMxCgKCH8261ako2+19PuFLzNO85AtjrC0ScSud8m5Y
         ww6ghGt/B+CO3LtF6fgIG+B16chN90B/2p5eUiZHpZqsHf/6clxm/3R11RwZNhq7sV6n
         FC7A==
X-Gm-Message-State: APuU4Z/6uaDfDpj3wT/opAIxpY9b6xTqaWIQkksncJd0BaRpKtVVwbsN
	kOVnx7/9zWT8L3V+IqhqiLLygBLfhbKaeU/65fIGxeuJbHb2+dQ6BMdLD+tJS8dr
X-Gm-Gg: AZFdTZfQ++Yu0fnE6/B63GKJAJs07xpx+ENMGnkXEOb/ydlli7bNnRYc+dMLrf4oz61
	vNPCX7cRf5IouIhb9yoyKoEBUdhw9uAs4tBLsXanR3/FWpjQwVsu9TwupFYpyBjN1KywEswXUIu
	HBfjdnOYA8+j1p8Acy7v40wBo57Gucz5xXBSF4bQwytYnzPMUB7dTcwR3G9bOBZS6AYdpTf7Q0y
	Bz1B6DpgrcUMbW6TSTLY5Kuw2jsbMY4+jSZPBSxcebnlDUpL+89fAnoxL+Ge5IboG+X9Ae7/FI7
	V6dA+XKrsa6obrQpDY8ncA9JkyIlUQ+LurUchSLGlYjizCoPI2xgyESEtgI7ln+CMpSbJXT6bIO
	OuRqhdBFu40SCfeH5QZy6lflmUy3Dms/eH18UeNrtKFaA7fgZ6Qt/9A4EnZO+h0aq+fNmfGtEe4
	hTQUgXaBxcHZLNOp6nodRgLyRtJHktho3zY50M1GbPyw3o6wv9urQHsgy+qaiPXNC+tFnLmvHm0
	3kRUfnmW4weKXLuhjGO4bfYeA86rfGUJzCZA8aPnMIB3joy226xN1UhepLjGpfc9qWdRMoNgt7m
	w6a28KA+JZamfdBXm5PKKdSw1GDLY5RBP4Qva6usb/iDN+C35DQDV+/Yx6YPKElUU4KbvkjzW/R
	pCBS8d5s9z7JBjDKPbeyARLCSudrjhlWsVMakkkvSCHP6z1gxKcFlpMlr+cz7v4vE1ezfKBcnBg
	o1PjvOrpZWcaT9J7gXIF/4iU61W8+GMZ8bDn9jWbLbxGqmrMkPydjfxcSEZC5+AHSGJcmNpHt+n
	+HlPLsgsLS2Y5K8ST6RhQcsmDw41DaqCHFlgQNC4Ob5HGA6d1+oeCTFSy51NMGFb/R5Yh0KkPD8
	8h2zGg==
X-Received: by 2002:a05:693c:638d:20b0:375:c862:31c with SMTP id 5a478bee46e88-38571816d35mr22542802eec.40.1795752836344;
        Thu, 26 Nov 2026 20:13:56 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm70674179eec.6.2026.11.26.20.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:13:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 34/39] ctre: upgrade 3.9.0 -> 3.11.0
Date: Thu, 26 Nov 2026 20:13:38 -0800
Message-ID: <20261127041343.1772294-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041343.1772294-1-khem.raj@oss.qualcomm.com>
References: <20261127041343.1772294-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:14:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133204
Content-Type: text/plain; charset="utf-8"

- Allow [^] as the empty set (any one character), fix `|` with empty
  alternatives, fix lookbehind inside select<>, and stop ignoring
  trailing null characters in the subject.
- Fix char comparisons on signed-char architectures and several
  compiler warnings and overload selection problems (GCC, Clang, MSVC).
- Header and C++ module installation is reworked: CMake package and
  pkg-config files are now installed under libdir instead of datadir.
- Support CMake 4.3 and Clang 21/22; import std handling is updated.

The recipe now fetches by tag instead of an untagged git revision.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-support/ctre/{ctre_3.9.0.bb => ctre_3.11.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/ctre/{ctre_3.9.0.bb => ctre_3.11.0.bb} (86%)

diff --git a/meta-oe/recipes-support/ctre/ctre_3.9.0.bb b/meta-oe/recipes-support/ctre/ctre_3.11.0.bb
similarity index 86%
rename from meta-oe/recipes-support/ctre/ctre_3.9.0.bb
rename to meta-oe/recipes-support/ctre/ctre_3.11.0.bb
index 9f64e5dfed..043572dc37 100644
--- a/meta-oe/recipes-support/ctre/ctre_3.9.0.bb
+++ b/meta-oe/recipes-support/ctre/ctre_3.11.0.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "https://github.com/hanickadot/compile-time-regular-expressions"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2e982d844baa4df1c80de75470e0c5cb"
 
-SRC_URI = "git://github.com/hanickadot/compile-time-regular-expressions.git;protocol=https;branch=main"
-SRCREV = "eb9577aae3515d14e6c5564f9aeb046d2e7c1124"
+SRC_URI = "git://github.com/hanickadot/compile-time-regular-expressions.git;protocol=https;branch=main;tag=v${PV}"
+SRCREV = "4ab18abfd88ccfc867734bf5d31b13285854577e"
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 
 
