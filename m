Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8203.1795739701947501691
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=t0r9tjVh;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-38692f62b22so9876616eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739701; x=1796344501; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qev8ykusRzp1zYqKLqzvkENJWONNsGr7kU+a9jfGQHQ=;
        b=t0r9tjVh9zlf6Y0KOEBP5f4dijMwcxHCbnYkrTP9K0EL611x7SvdQCgTwFgx5Dje6s
         A2EiHy3FemMIfLfx2yYJfA4awaRubbYlLUP2Z6UqlpN5mb7pFFVpsSEsMQYsJNDqYeeQ
         B6775ogQpTDIhFfXQV4d8MSWJ/vq+iSQD5r7OiCrjJL33b3HdgRJykuicxs0yaz6R9We
         qEam7jG4mImmm1z/LYu/iizG4PXAo0g4xW6tSdhQwh1ElGqbdgcleZVL0Gb67NCQoNVc
         mKLpgDVA/h/U7SHVTODr1Cj1wTbxJcMr9o3nuIYtMLuwKjeaY6/9pk/azBkiE4/Dhek5
         +Hkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739701; x=1796344501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qev8ykusRzp1zYqKLqzvkENJWONNsGr7kU+a9jfGQHQ=;
        b=j0qPT8SXck3vAYhNd1ftflwfP+v/03KE3EtDbUEAkpfN507dWo7I49cU8uJuRQ9aGW
         KHycxcUIWp4kzKbd5R0eBN5NQRknweYcEx05/ZUQV/SKvWcZhoRcO0o6AWx/0aVwP/HE
         ixl2FAsjlPXvqmijSS/Q8K2rhFYziCNf4087lcCNXbeCUXgvU11K5hvY6UqamU6NjMxK
         FtqbxxGQ07hvnO4HCBIVJQKGKjl74Q4MZfxHLgvQvVsvkphaXsHZB8N/OClcG6vNWm7a
         LJwfC3nn3c90irrXnsxK7+VTApgrOPZEPJ5I55+/RBWRdCBDZEg0fsy+6wHG7Nxv7Rbq
         nxcA==
X-Gm-Message-State: APuU4Z+X+PmTsRTmh1LNYN5CClZhHmci3p0rjax7rO3qPajZBelpIVWJ
	UKpZ3h6gN98XyijwO8j98nGrFYWjDsbLpqfXCoenGbk/xjowkaefMWZppo+940V9
X-Gm-Gg: AZFdTZdIuMZgE8kczctheBjQVbBnfDh+KhA+gUp6gXl5s8deg1xTSFp+WaE6SJPgc1j
	F7eIb4zQwSmn9VG/bASW0u3BuQsBQhzQHiDR1Xzag0vSshNcBSGyQ9YvZbFmBqYU8AGpCkq4Tp0
	qtRmhotvE+EUKHY+BDcF8dMb8IfZDgwlD5ic1JBdF7TT0JlnXddNc3nHY30LleWRApErhL83rOE
	ohQxFtQ5AW5PDhdtyF3yqGwDcfLSi+HDZ5I3RnPql3LH5qVhJdXM/r1u6/v43UdffxQZ8S0ykTC
	8A/vTXQDg757zyhdpZ3FxuiB+SXN+HatNbS9RcYMY2tjHDE4IlQAQVO5q5dGIvzS6MDvHsYfTu5
	CBa1nvkH1qNboNGXz4vaAzAhZgymc57sYeWsD3n4VxSK/hs+v+vIQFnjnuvtlEmJc+jBns9yYxK
	2dWcY85soANzsaHha6QYV5kEW90axLfr23E5Gtd0RVCPtNv1OyIOc/Af55Y+19zIBweWF0SNujF
	NP6kFTlH2LWZBcih8zrEC6thtYlRBzDbIny1CC12LDTLAVQjIzATTa1X2B+Rlnin75otKG7T6l+
	GDXq51xgmIHwTv6jb0k+9Zx/oiSDUH19gB6HiTqrgTrFstcDhjSdvpFvufPeyZzRVGAsIfuu1Rf
	LU1wQYWqoGtmvZ/08TNmCJvJzVSmszgYTDGDNDRBix4RCYiSsCNTXpIOLrGPmKPF3HOi+qUn1pe
	m+9WXAsWS8Ukf6m17GLZuCKYfs68kytz4iJ1xWc6p3OwouO+mxzh0hS4gqEjaYivdOfQMEi4R1O
	IJHI2F+mUrKbclyjd62+4XCX+ebwMMFdmU86lZ65XIj8RxPyXR7wf2zB0xJ/BbT1hRLvNypWml7
	TPib
X-Received: by 2002:a05:7300:108:b0:375:50d9:474e with SMTP id 5a478bee46e88-3856c0d0bb4mr29047141eec.4.1795739701266;
        Thu, 26 Nov 2026 16:35:01 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 30/69] libdbi: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:46 -0800
Message-ID: <20261127003425.2166632-31-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133130
Content-Type: text/plain; charset="utf-8"

The recipe was marked unknown on the grounds that the SourceForge files
area tops out at 0.8.2, but 0.9.0 is listed there in a libdbi-0.9.0
directory. Check the release directory names.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-dbs/libdbi/libdbi.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-dbs/libdbi/libdbi.inc b/meta-oe/recipes-dbs/libdbi/libdbi.inc
index 4ffb2a46ae..aca93d08eb 100644
--- a/meta-oe/recipes-dbs/libdbi/libdbi.inc
+++ b/meta-oe/recipes-dbs/libdbi/libdbi.inc
@@ -9,9 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 SECTION = "libs"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libdbi/libdbi-${PV}.tar.gz"
-# SourceForge download area tops out at libdbi-0.8.2; PV 0.9.0 exists only
-# outside the browsable files area, so no checkable listing maps to PV.
-UPSTREAM_VERSION_UNKNOWN = "1"
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libdbi/files/libdbi/"
+UPSTREAM_CHECK_REGEX = "libdbi/(libdbi-)?(?P<pver>\d+(\.\d+)+)/$"
 
 inherit autotools
 
