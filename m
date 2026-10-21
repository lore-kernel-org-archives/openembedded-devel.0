Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8875.1792580509574441914
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=o1CEuJsQ;
 spf=pass (domain: konsulko.com, ip: 209.85.218.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c3fd91337baso72756766b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580508; x=1793185308; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7eoJm7IMFyJWu2O1tFH7XCF5njEtvDTv/gTvHBsBdfc=;
        b=o1CEuJsQlmKT1ifgka7pg39Z1fBVkdcI5iSwRM0dX3+5mokVLExDR/S7PL7Rp+lNRZ
         8z/2YTGtWpaw4VQzeIBo3Z/yNMLDHoR0NqbNHMCpUTaZlu19vUxvn1wcNRxiSHwoTJvE
         CnvODFR6FrHtDj4wc2Qo73hBE64PWC5N5QQTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580508; x=1793185308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7eoJm7IMFyJWu2O1tFH7XCF5njEtvDTv/gTvHBsBdfc=;
        b=J2JdFoRp15P7jAzheAqpBb0Dp2u0fq7m4g6u0SNJAwNSnzKkg1rEHOk3vKKgJpHVMs
         HKDKeRvPyLT0DIa/va+XOCP832WOHkG7QZgs01fhR9ZREHPA2811dDSpR5DEEgPPT1cC
         /wL31cn6+oiufx2DqUGG0WQckFgJdpIRTVdXzXBKsd0afp4RKkoDsso9E2/oIUUtENGd
         e1Cz2kdxWodcSQwOUSvHnYegrbr/oHwaXQvz/IKqvAr864v4R/IIPCQQn7qDboRhVAVJ
         +vda4/4sCBCWlvMmeVi7+RoA35kuZAfZLP6EeQJ3jNJO6uZwNwlUA36J/RKSebN7vdjz
         Bs/g==
X-Gm-Message-State: AFq9FYJPrBy5nIB+nsNuVl6Es5bMeXasgxD6OiR2/fA9UpCZdw38Hw5u
	ns/y6weMqwhXR3TEDIKThi5xJrq9PXXz+0D4N/+1Ku3gxRTkmSeCPNRvNMLo5U+bKB9MyT1YDu6
	aXddC
X-Gm-Gg: AYBFou2SvqFunNJNLXjAhQp+nl+cAIUORJAy4x86WrZ35x4jCvuz5ao32dYHvty31ps
	jrBnOytCqywBs1sUGKHIB+S22LXwWqHK9Ce/gld/zuDCZGdmcQIR5N4dtb1T6lQb1vwy7/LMfoo
	PuSqmOh+WrD3QB3VYr3by4oq9vowlT/pg/wfqmzHdVDvdakJl6qDgpZ8DSjX+kPfkQd8neMn4Wd
	1XKGUz187Cb1hxHxOl+H5QPKY4x0J+Tdv78N3JwMAsLvvqcAHx81lBLKRGF42qBj4WuFqnthrea
	Yqb/qLZ6h/vK9nbSo9TW7bwYGKJQwbTp86c6cLEQxWZ3/QVRblWF8oT8G91o+C13y1bQSW8c0X7
	og1wGXkh0GedWrWIdJVw+fqUxFKgnqdz7g3mgyVn6nL10eqvCWAEo2Uzg46Q63gFXZXtfAo15lc
	n0Z548263wElN315dxpDI2tkKgA621ShvSE3ltbW5wnp7lvMa5Nvxpk5UqRXY4z4wdX2foT7IJh
	/ZsuLAHbT+xFvKBZ06Adr4gxM5Y2JliZ3C/GBwCqWM0XUA/zQ9Trba0XmypUZrzOg907cltQ89o
	+gLhsdHLs6Iws6xrm0czOMzZ/TpRIPmOuU4ja2CKDyDrk9I5gC4R9MaHnNhtSN/KM81sfeuutOw
	v/60pKg==
X-Received: by 2002:a17:906:dc8e:b0:c29:22cf:b0f5 with SMTP id a640c23a62f3a-c46797932eemr133114066b.33.1792580507411;
        Wed, 21 Oct 2026 04:01:47 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:01:46 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 22/36] python3-jedi: Upgrade 0.20.0 -> 0.20.1
Date: Wed, 21 Oct 2026 14:00:46 +0300
Message-ID: <20261021110103.1943456-22-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:01:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131280
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.20.1:

- Avoid loading an executable path from project.json
- Avoid changing the global recursion limit
- Support for async pytest fixtures
- Work better with PEP 695 type parameter syntax

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-jedi_0.20.0.bb => python3-jedi_0.20.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jedi_0.20.0.bb => python3-jedi_0.20.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-jedi_0.20.0.bb b/meta-python/recipes-devtools/python/python3-jedi_0.20.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-jedi_0.20.0.bb
rename to meta-python/recipes-devtools/python/python3-jedi_0.20.1.bb
index 5d49bc6cec..ecf2b6aafd 100644
--- a/meta-python/recipes-devtools/python/python3-jedi_0.20.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jedi_0.20.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5ed06eebfcb244cd66ebf6cef9c23ab4"
 
 
-SRC_URI[sha256sum] = "c3f4ccbd276696f4b19c54618d4fb18f9fc24b0aef02acf704b23f487daa1011"
+SRC_URI[sha256sum] = "2f71208c3f9c1bca057c0e90d3f272aba44ace88fc4067d7587e9e069331b7e5"
 
 RDEPENDS:${PN} = " \
 	python3-parso \
-- 
2.47.3

