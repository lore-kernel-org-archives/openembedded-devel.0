Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10218.1795752833041931574
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:13:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=YVAC4roc;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1ae58d17cd9so8646730c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752832; x=1796357632; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Un7v494iAQG35sva6mPpV/PLakeyfruyNXPEAnLDHmo=;
        b=YVAC4rocbsymPesk8qHBYVGPeo7C1TNtLEI6nIy3vmWc6VnRxdpoBYp8BY1sM09725
         Bw9l8O1T5Ca2g3dLPBiG7kOkqK3e+6zb/Yi3v1JjMfTKAEJe5KB92vc4C06ZrgNEDlnL
         WSjQZtZ3gMJOEk1gFBo+bzINENZP/uRlIRf/dJe00yYB2FP3rewSjogOaXSRE3CCjjPI
         /SgVYSZP2ED2uPV7qN9aaYgo3ipwOL10I2eAzIrNM8FoVlRTnTmEgr8hgKtMg1SaCYiH
         Yl6BBaKRdhUpOuTX/WzhffYa/jucTQzFBERwbNo370MGDDbHdIixKbWw+NIdpx2PoGVo
         WOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752832; x=1796357632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Un7v494iAQG35sva6mPpV/PLakeyfruyNXPEAnLDHmo=;
        b=nR1B3CYpZfwKd9apqpnH81gyBGZNhxIKLFjA+oic2Amcphl1AQuTlzlnLLncFACqHC
         R6BfqKGelK8fa9fvuj/wbF7mRMWhAYlgfQ9om1kO8/zsPjuZ/M7Av7dnjOfnZ/diG806
         NCsH4mGU/SgQA2cdcmQgUNquTWAh+mDjR+jaHeypP3z3hWQQgZS47iV9odctfVTmLvyj
         q2EHuiFTzfX2ZwDq0Ei/Kd7VuXyBpaXxR7O82j0wMH8cmrce3utcK/863vcG5mYiomXo
         AxfrwBtFfJ4uq46JdzGLEqzvxdmYJgemXq14rGSmgDCbxQMoZfYDQtFbD0D8cvz1G8SY
         Ynlw==
X-Gm-Message-State: APuU4Z8KOitHEvspmx/FU2hCViJVw40hg39uKNj18CuPCqWgKlohkdWb
	wjs808XZmVGGEpBP0DpurAVbiVAEh1+1w6cqmZewwXGtVX3o4B3HbHO6Pis9nWzX
X-Gm-Gg: AZFdTZdOPrdAHhttYf9zcBcrvp78s8IqCH/s4PwnM95TZQe6sm7qUHe74VkBgps7Fqs
	VqAt4VvVJs/Pt+IFilRBjL7gxLSDXmgbkTPHnKK77XzHK2HcU98n8JmqmJLqeZGWxuJHyHMdxzz
	zyDfI00LbI4c+IWcd1vUj7PPLO+SusRJ0u2nWHuJ5KhQUHdmSHpGVqxtJjqi+t9v8AtS70N2N87
	V+Oe0IOFY6bkXfX2wRgJ+qwsgrkTbFkGtHiYbXMnUqwCqPXrOXbQVjwsLZHzW8hQYe/eZU+r531
	jMLRWg3T2Jrt9wR1eF+kGCYyCpBbRkTNCiuCrucdLe5beBfLioy8KBjjOn1XSf0Db93VkV4S4VK
	d95Bi4xh+vovBjqvGNkcr/ZE6/seTpvFHPorvjUC/2IzwWugEq63jnrOu5JttnwSTXS9iF2EHv/
	gp2PmXh/9TSJAg5KBwP1a6FgF3PJf16NrW4r+IHHT8uZ5dQ7/TgfmwF1SIlXgHjnBHuw7PZ6V1H
	Plo9/sEAOODXdyOneuOBLfGs1eHrlp6xHlyz498r0SkZxZwpvEgUvCf8ea/oSYA0/h5JIeVUAIs
	lwV+FgYr/zPB0I6SWWWb+wGfi1ueZdFnADIf/vbF9O0wlL5T4Pk4Rd1R8AguGdPWG0PZ9WuXLWZ
	F3UdEAC/Y0LNVLEyu/hex4euD1hUjLMymYXrx2NV3i/+jpx9aOo57gfpyeFIsf6mO9ZnYV+77aF
	e3S8l4/go0ZdWJfFoow9F/rzrEZXzgYj6ed/HRGrXp2CQQsqrSkiOgDTNUISTpVwtuNkg6OfoGe
	i4/jU/iBe9V7hcGt5Fnfe3c+b7RFdACI3MDr4Rx5LeEpb9lbK23P3CIi2bcHw35N+1dhQIw2NhT
	vmTu
X-Received: by 2002:a05:7300:e60c:b0:386:636f:c25e with SMTP id 5a478bee46e88-386636fc6f9mr27877948eec.12.1795752832214;
        Thu, 26 Nov 2026 20:13:52 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm70674179eec.6.2026.11.26.20.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:13:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 30/39] libunibreak: Add recipe
Date: Thu, 26 Nov 2026 20:13:34 -0800
Message-ID: <20261127041343.1772294-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041343.1772294-1-khem.raj@oss.qualcomm.com>
References: <20261127041343.1772294-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133200
Content-Type: text/plain; charset="utf-8"

libunibreak implements the Unicode line breaking (UAX #14) and word
breaking (UAX #29) algorithms. It is needed by taisei 1.4.6, which
now requires it for text line wrapping.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libunibreak/libunibreak_8.0.1.bb              | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-support/libunibreak/libunibreak_8.0.1.bb

diff --git a/meta-oe/recipes-support/libunibreak/libunibreak_8.0.1.bb b/meta-oe/recipes-support/libunibreak/libunibreak_8.0.1.bb
new file mode 100644
index 0000000000..3df6cca380
--- /dev/null
+++ b/meta-oe/recipes-support/libunibreak/libunibreak_8.0.1.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Unicode line breaking and word breaking algorithms library"
+DESCRIPTION = "libunibreak is an implementation of the line breaking and word \
+breaking algorithms as described in Unicode Standard Annex 14 and 29."
+HOMEPAGE = "https://github.com/adah1972/libunibreak"
+SECTION = "libs"
+LICENSE = "Zlib"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=4ed81deb6876b71d8c62fdb3e09e4776"
+
+SRC_URI = "https://github.com/adah1972/libunibreak/releases/download/libunibreak_${@d.getVar('PV').replace('.', '_')}/libunibreak-${PV}.tar.gz"
+SRC_URI[sha256sum] = "ac0dcc96c395bc86ff7f86f6b91d8b45bc8c39db775f3f1e73f947a11520737b"
+
+UPSTREAM_CHECK_URI = "https://github.com/adah1972/libunibreak/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/libunibreak_(?P<pver>\d+(_\d+)+)$"
+
+inherit autotools pkgconfig
