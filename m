Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48522.1795411847082500293
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=sIln9IOT;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-38692f62b22so1250526eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411846; x=1796016646; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVa84vNRCi5mZBPDKDmVMbNztJWZP1yvzJMNYCssQRg=;
        b=sIln9IOTpCwziOtB/f52WOE1JYhwfNlPUTaOlD9BpWWiGYIN+OzggJmJ2biVQEZgxv
         5R69liAhmvPiCiP8iBGdDG6Y/p4BqKjIPJr21ZH1Hamw2GqGlU3SQb1tro4C6eqIeQhw
         wHvA0cdCjVBMyuDy4ybwzFF87mnTGs7V+rkR+0Sb6k5eNGpKG7emYv3H9OQL2zUp/1Wn
         xaMPuSthpp2CBEWvrRVCE9L2cLABaDtFrdoIgBltRfrAlrBrkjnfnXchdC3rsUy3KR6y
         x3YdJZY8yABTAQEcM72qXkjjzJ3arKr1+tnoOxLwosGCifOfe7PToXjHqlmNJhEVFeey
         zcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411846; x=1796016646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cVa84vNRCi5mZBPDKDmVMbNztJWZP1yvzJMNYCssQRg=;
        b=g93VcsBEADavscBT1D/yDhSHvCeIxxlp6vc+ailyCi7jXjw3SN5WEp0a2b0yk4Pyt4
         Ziofi+1nqpcF8FhNdor9pZQtUn76FdU7ld+lK7iQOV/ZqvGSRuY5puPxzTD+3QOVnO9I
         OZwe04JoX2ZBkdtpoNZbcwenGwGswQs71eqQ7zxWO+ma5DiDFMpam0wDthIyps8iFa3T
         XrexetWkPSks2fkzwExwdBDq3AUBgTMn4vY3MrcbHYsJelNbWNYE09e7oplIwfG8ci8I
         osXNZG51M1ZdKqx7N+Dh+GMucAXNPi4VKuBh8hDukWwpu68dHi4ii8kTDXS2Yi3Po/si
         WF/Q==
X-Gm-Message-State: APuU4Z9atk4bfnnZg8QGTuXP6ww6spLzxQZybHRicQ4n9oNPfmkbVwvj
	r656QtFACM2g+NZDHjJASZ+N2ikfG3nuIVisV/TyY1SnDCCnnejCdivn15ooIXMvfXo=
X-Gm-Gg: AZFdTZeR/n8S3/0qYPf8R0gJgluZGLqP2zFRvrcVm7TraZxsiTxEKbhe1c49gu7fyWW
	pNhNwv4GEOmh/LkVHq6mWo2lDbxnRpGkiFIxBmy+iDMmIPb3XFGSkASrJsYBDsq0gkKOhFsfK8X
	9kV0vfadoK4SOKboPZrHGD1NTA+tjkAKbJC3EDJk7ZsNwAVEM4EkkywkLlxlCBEQ5uxJmjwPytG
	+yiptxiHMHk5+xtDdmLSePJdc49oxGMC2+0HHSsUMTwpTIiojVUMpHzAI03eI2S8ckdlU//5hsH
	Db7gLFaLK2jbmpPYHEuG2d/moMJYSIdhPSqdUzdn7SNKwbDPMxw4Qo/CcZlMZ25lAg3CXHwovr0
	hF7fLyteH07NHfSHA7i0eS1krGbCLSb1ztDEhJ1r64pbaHhWn7Mv5sbTBwEdB/JH1GcQgeK/5A4
	lo5QK1gaG8NH1O5D4gu5z/rufvfKA8Sw8+/tiQBu9XvA5pj9ntptUx0O8MPnf5b1q3+HsYgVEdS
	qawx2wzkX5cbiYMl6k61tK/kBlR28OzELmSDj8Fufpa51z/k+onja2pO/SJe6mAYzu6JgRqnrco
	fG3i6VusKuZib/p1R0fKhdbY3AX/i3CiqQmlpzctIWMnnFx41rcwBKAO2BfDGMFNTztw0daSnAg
	JiVMwBBjQRD78o5SX/0oBBN6uUraiu01JhFuq3Cp+7YD/trqIFk3kh3vNKaBPBQzvauTyd7oqDi
	BC4sbnn8eIsLm/+DYH2zmtcWEgzDmGpO3h60DfJNbu+kjSVseJHQVQCQZl40DtXR+dE3b5aye/O
	dOcN9z0WuAL/suyOWEgxwyCoF3hWOIXsI8ycJDu3hCZ/a2+B6vrkeDl7v554OEvl1dMHrMNbtOt
	U95S
X-Received: by 2002:a05:7301:dd86:b0:351:2958:1740 with SMTP id 5a478bee46e88-3856fb641famr10890673eec.37.1795411846431;
        Sun, 22 Nov 2026 21:30:46 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 13/42] hidapi: upgrade 0.15.0 -> 0.16.0
Date: Sun, 22 Nov 2026 21:28:57 -0800
Message-ID: <20261123052953.3658549-41-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132828
Content-Type: text/plain; charset="utf-8"

- New hid_read_interrupt() family for thread-safe read cancellation
  and new hid_set_num_input_buffers() API
- New native hidraw backend for FreeBSD
- libusb: hid_error() support (hid_libusb_error()), configurable write
  timeouts, input reports larger than a USB packet
- hidraw: BUS_VIRTUAL support; release_number filled from the kernel's
  HID_FIRMWARE_VERSION
- Option to build backends as C++ and more general pkg-config files
- Custom HIDAPI_THREAD_MODEL_INCLUDE implementations must now return
  0 from hidapi_thread_create() on success

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../hidapi/{hidapi_0.15.0.bb => hidapi_0.16.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hidapi/{hidapi_0.15.0.bb => hidapi_0.16.0.bb} (89%)

diff --git a/meta-oe/recipes-support/hidapi/hidapi_0.15.0.bb b/meta-oe/recipes-support/hidapi/hidapi_0.16.0.bb
similarity index 89%
rename from meta-oe/recipes-support/hidapi/hidapi_0.15.0.bb
rename to meta-oe/recipes-support/hidapi/hidapi_0.16.0.bb
index cfbe51840e..aed739b293 100644
--- a/meta-oe/recipes-support/hidapi/hidapi_0.15.0.bb
+++ b/meta-oe/recipes-support/hidapi/hidapi_0.16.0.bb
@@ -11,4 +11,4 @@ RDEPENDS:${PN}:append:libc-glibc = " glibc-gconv-utf-16"
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/libusb/hidapi.git;protocol=https;branch=master"
-SRCREV = "d6b2a974608dec3b76fb1e36c189f22b9cf3650c"
+SRCREV = "750c87abb03282a237297052b84522e6bb3c0616"
