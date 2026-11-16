Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33677.1794851734238450706
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=jvqL499n;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36dbde64409so5474372eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851734; x=1795456534; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ql137PfPinmKJ3z5AlJPyit/El1bRIPwRbAgzGrNDkg=;
        b=jvqL499naezn8uyXGHOHG9rrYva3gAWQy76BH4RWK4X5lL8yHURVDRapiiPW2uiHpJ
         5xC21z+Iyee19eIiGJmGRWOhBUYf90rvwffoEa7uCGPUC8HJr1naLHesPHz4uFnXhwQI
         HaCb6qgMN3UMdyanJqznOToHyZJ2lV+qg0lStdjAtNtJWMbOQSVNpsfBRn7j03Q9o1of
         NXpRnpM+b9LHL/6u4tM/hWe+eBOnd9zeY8zBStumH6ucE0ggOkHmW6pme0OdBnF9xd7W
         SyoxhmQPR+1CzKuACTd4OV8+mfubuyn0cLhZSu18MaUpUPXLDCKf0wAR8ca7PTXoQ9mF
         1CoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851734; x=1795456534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ql137PfPinmKJ3z5AlJPyit/El1bRIPwRbAgzGrNDkg=;
        b=Dg3o/+4iOKqqD2dzLTm0scm51JqhCchVtr1rB+kx1XhA+lmBFSuu2fSPXlUrhB17I9
         aMUqCLBiGTc2IhhHF/D7w1MZml4Ebny/IgYvs4MQXYvPAS+4n33NfhFPmTfv0JPByoAr
         2+JBUbl4j6cbQKQTMnGbfJJvcDD0w/LrrEIyF27bSVtzhWCHc2aN5PKegDjuVwCideyc
         TXqBFPH4Q7bSzDOu2oQbQrYgK5iYO0WurXnmNPGHEemwsx1uI+OG68syVgQQIk3udFba
         HCQIlKTH4D6PyxwyuFF7dNMDu/JNqa77NWhI//E65YnYqqXNeNcfUPirZ1c2fGDwf8qC
         3EYQ==
X-Gm-Message-State: APuU4Z+h5afpHOYfOBHBiI54gYzOafQkygIuqwR0/kHT/MeivqWkANpG
	pWnKgfleeAlmDB8cMqeZ+uW/hPZ1S+PAB2kmbDJ2z88pWxjv5aQBenk71Tj98yGs
X-Gm-Gg: AYBFou38DPz6RNtUOoPn9lTNvP6RWEtjqBqppIYD9LczQKpFBXTviDFYUITqHTXBI/t
	Giw1/BH7vI92BIi7L9Gum/6IIfOnp3eGQueGytz39zinEtU3naxtzseGncevO7IoohSCXQBH6N3
	+y2HLR0ohwRT4b7OL2d2vUkKWaH4EGOdmS10PRYCgCd4whFDGVrkaXDtJ6GQTlqJxu8rY+VzWKX
	DHsJZFfHWrrvyFN2hR0vKSJhHgbwbZQ2t+gcCkETYf7RhTs7OtAfSBj8iryWwlY3jg60Vozbg3k
	OvamoXiaOFbSMALOkgz3qk36GeufIaoEwt1tBGtVsf0zWsQrbhzVc6oykzZYwiqPNkS44k+tXvT
	F6jNoqGVNPSDX0nRDQlA3UifMjZPWDpXpU0x3HuKI5+YBqY7/z9zsklZzjkLlx4i/71dY/0SZJJ
	jp555uLdl/uvEUDSlPJTBHqrSk3TlNLE0rjmcc0fZ9v1HXKCOiLf1VRu0CRSWNDzru5+St5kdCH
	PpiXhXUwlpi5TB5O20qO/jQCw6848cG8ERb1BSnft+0LXbeIKmJ6WA2wIHBJ+SWCa3PuL+b5W12
	UQ7IekHPOjFeMiQB/LOTJ+l0TyrKboGIJP0UkHeAbUeBYVq7+Qp8L7Om+QfjJm9doclO1rJOTp8
	FmwoR0sekxCrDUub56kAqyE8ZrnQW4+h7dbAoTWFg+QdUPmBrWN3pMrCy7NWkJdnUiROx1et4mW
	rlZ5PhXnPqR1fI/GLgDrA3zo7zTcJGrJX145dUnF9AsozhXdDEOyGzN7P7oZQ4PeHNpqeLwyHoF
	MqtxaGxif+IrgpUxwtRieUV9LJLrkRH1IStwbKE2KBOvAz0Wni3a4Lgtmah+ES9gejghxgn8KU1
	YMgO
X-Received: by 2002:a05:7300:e9cd:10b0:351:7e5d:2de9 with SMTP id 5a478bee46e88-379636603f6mr13272175eec.1.1794851733414;
        Mon, 16 Nov 2026 09:55:33 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 065/105] python3-pycurl: upgrade 7.48.0 -> 7.49.0
Date: Mon, 16 Nov 2026 09:53:17 -0800
Message-ID: <20261116175359.342679-65-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132521
Content-Type: text/plain; charset="utf-8"

License-Update: FSF address replaced by a URL in COPYING-LGPL.

Changes:
- Fix use-after-free when a mime part's content is replaced; object
  teardown made exception-safe (cleanup moved to tp_finalize for
  Curl, CurlMulti, CurlMime, CurlShare).
- Add SSH_HOSTKEYFUNCTION and other missing libcurl SSH constants;
  setopt accepts CurlShare subclasses.
- Build change: custom setup.py command line options removed in
  favor of their environment variable equivalents; wheels no longer
  install docs/examples; dev dependencies moved to PEP 735 groups.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-pycurl_7.48.0.bb => python3-pycurl_7.49.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pycurl_7.48.0.bb => python3-pycurl_7.49.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pycurl_7.48.0.bb b/meta-python/recipes-devtools/python/python3-pycurl_7.49.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pycurl_7.48.0.bb
rename to meta-python/recipes-devtools/python/python3-pycurl_7.49.0.bb
index 1a941d86d5..ddb688db7e 100644
--- a/meta-python/recipes-devtools/python/python3-pycurl_7.48.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycurl_7.49.0.bb
@@ -8,11 +8,11 @@ SECTION = "devel/python"
 HOMEPAGE = "http://pycurl.io/"
 
 LICENSE = "LGPL-2.1-only OR MIT"
-LIC_FILES_CHKSUM = "file://COPYING-LGPL;md5=4fbd65380cdd255951079008b364516c \
+LIC_FILES_CHKSUM = "file://COPYING-LGPL;md5=4bf661c1e3793e55c8d1051bc5e0ae21 \
                     file://COPYING-MIT;md5=be42e1b1e58c8d59c2901fd747bfc55d \
                     "
 
-SRC_URI[sha256sum] = "b70961a76c412cd34f9cc2c9558e63f89fb37045c59eee396c585b52973be280"
+SRC_URI[sha256sum] = "d4327da9dea72768f942f831bbaa5a64adca4d7c89f3141da7a833d3c600ab90"
 
 SRC_URI += " file://run-ptest"
 
