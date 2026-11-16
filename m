Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9.1794851761179125691
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:56:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ALdpWchU;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-37071c0f42aso5535186eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851760; x=1795456560; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YWTfjFuNZ4Ra+jRK77b1tMj5+j/Gh+FUN00vkteK53g=;
        b=ALdpWchUz1l6XHoSnXJAq4EOYTWwXQ6Df0Kw1wTlgWWU2HmPq5CD3p0SdJRnQ8bqS6
         9t9Az5Iv/ct/jjwCCto2ai1ycvL7CTyIhpUo5ePAi+lHZcNuP2CJzJLuBZYak6WW615n
         qAxzfjqzKk4FnSmoP7KiyfnrSoPxbqDAIYZd29lN8U+pbIkFxx5h9sEEGA0httF2Zg3I
         ptItr0qJwdCKpduJpi9XhFnkCg6z1aYPy/Q/o8WzhsHqoGlWtbP5oS0Pi8uwJl9oNO0u
         +doKMQQG7CuBMm6sWR5irjRCTtgJUpzYAvoDmqJ8DwQxHMPDddKoO1KrNp+VU1ZvqBgD
         01Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851760; x=1795456560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YWTfjFuNZ4Ra+jRK77b1tMj5+j/Gh+FUN00vkteK53g=;
        b=C5a7fmFgIBbkKxuA0R8gvXykxXaSbWQ1YMtD5iHsU2LThe9u59EncUTEwoDIj7hE7C
         VWxCLgZtJoGB0dqdONbRr0CeNTiBLc6zNlujpigy6Uk4mXbFjYFDJa1DH962Hn/HbBiF
         hIE9s7GzwLSfjmtia7Z8aGuTcnpXzPH3tnhuoO7Rr4zNcYu6xGKVTmIP2PCTs17iQqwV
         7NTRJxtyGk6Q9NkT/FbsXQRf3Tf9zaRoRSGU6W9zhx2wMiNlvgJQwE/LyPWMUNLZzzRu
         kFqS4fZZarUmBVPfYonqSnCPXtJSLcFlQVc9YvyIrJgA+qMV3zn3DIvNywCDQLvL5Y3b
         tNkA==
X-Gm-Message-State: APuU4Z+u6cFhxgPPodVzDJFEUEzW4qOjryBYmDCUEIT06NKFiaszHNlk
	tIZpP8GuefIAW3kL7K2ER/o0rifHzwybU2X4r4GOF3mv6RVyaHQVMaXmTQbH9s6w
X-Gm-Gg: AZFdTZd/54K4plqdx175goNrpRO7WJSR4iolSErfs74YMB++5BmS81M4AXyxXIAccTE
	2OxrEqbuFHoAVctGI/2SYv3x6yALcYGySUxfceyxEWJspnH9qLcFx2yX4/j2xkdEeiIuJIu1Yv/
	gQS4XtksBaG3POBPw3yBXyG8Cs5S2KUG/4PT4XCtd4KZnOYeaTporqMAt8pDsblQQmou4Mqretx
	VIRdtMf1Hx4/hahSvtj1UYcz4db4NZOS4wqR64QPltTByHUGd1NBQMRVb4HziiFLrvU/QqFLp0t
	HpRQt+jdgzNygofvPyt/8bLcFlxy9cplYVDj9G2KgVbZj9W58iIKErCsHjcFjZECLl3xFqvgkKI
	zYo9GaYM5MmUwd5yGqt7Vop+oq5zN/AbxP77KdgOnsw98tDsOWK3LHT2jDQjimYAnfBk4tR1AkU
	fmVht2swBdsvWvcNO4tTAbmjUHxsyQXynBcpoU7FCUguuKe7Y6g2LBa70Cs9obDBuu2WXbCqn++
	sQsN4dKXVJ7dEoHNsiAcHla8ATu+SpBEZa7rnLLe+cwzIcj9qaYp3Y4rNaMtpLn9w9/oA4TCACG
	zwxe1CdCtxUwccWkAkl/LoKQg3qweb5Ru36rT3gj0IwrHC/uc36iCNdkZec4wSsA2QYQJhSCpQd
	DMhIS+Ytj+JwFwiJxCn+DNJjtSVj4UhvPoSlEkNcnwTPaJLyOWDSNe+MjDFEQvAn94bPMM0JmTN
	onsKEoIxL6AKSdnKHEkHGOr47PpKH7gWUsVUOlpOyI1Ulz04UTiOczfDfgYvblBsqMdtb6stxrG
	fVWNGhl2kECCefp1dNR6hM0vXUTruPLLGqj+LmpTWm8YJ2MpKYhSXSqg5Y6o+wx9BVaSvtCgtbE
	tSvE
X-Received: by 2002:a05:7300:c8c8:b0:381:17f:2735 with SMTP id 5a478bee46e88-381017f37a2mr262479eec.27.1794851760393;
        Mon, 16 Nov 2026 09:56:00 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 088/105] python3-soupsieve: upgrade 4.1 -> 4.1.1
Date: Mon, 16 Nov 2026 09:53:40 -0800
Message-ID: <20261116175359.342679-88-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132543
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...{python3-soupsieve_4.1.bb => python3-soupsieve_4.1.1.bb} | 6 ++++++
 1 file changed, 6 insertions(+)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_4.1.bb => python3-soupsieve_4.1.1.bb} (53%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_4.1.bb b/meta-python/recipes-devtools/python/python3-soupsieve_4.1.1.bb
similarity index 53%
rename from meta-python/recipes-devtools/python/python3-soupsieve_4.1.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_4.1.1.bb
index bd35cf8e41..454beb5f15 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_4.1.1.bb
@@ -4,7 +4,13 @@ HOMEPAGE = "https://github.com/facelessuser/soupsieve"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=74851a2f1e5c07496dcb452af6a6bf54"
 
+<<<<<<<< HEAD:meta-python/recipes-devtools/python/python3-soupsieve_4.1.bb
 SRC_URI[sha256sum] = "ca9abf7126667010d8f6e9b39bfc1bc3b23c8aed9bcb0f54a754dde969bb8aab"
+|||||||| parent of 695f7967e7 (python3-soupsieve: upgrade 4.0.1 -> 4.1.1):meta-python/recipes-devtools/python/python3-soupsieve_4.0.1.bb
+SRC_URI[sha256sum] = "7621e3c5f6b371ed2c5eabaac5de300ac3d66d05e6d7f34783e31b63c4f90c75"
+========
+SRC_URI[sha256sum] = "b296bd2d2f65b1a78149f3d7bf6736a147d2c9e2dfbde0e4404639d748a02e03"
+>>>>>>>> 695f7967e7 (python3-soupsieve: upgrade 4.0.1 -> 4.1.1):meta-python/recipes-devtools/python/python3-soupsieve_4.1.1.bb
 
 inherit pypi python_hatchling ptest-python-pytest
 
