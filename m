Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC0E1D26D6E
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 15:59:40 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13175.1767974372599468939
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 07:59:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=aDwvrnRb;
 spf=pass (domain: konsulko.com, ip: 209.85.218.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b725ead5800so615480466b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 07:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1767974371; x=1768579171; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m1OmdvehnFm/14/DksnNfCEmLe6vzyFk3yvKOxcFF2Y=;
        b=aDwvrnRbcp6hTnGh18KGulkG0SvognlcIHEedC2Bj0YT4VdRaPa14rvI80fVTXmTCy
         4dtTJvT4Xe/bZl2rJf/++OTIfmY9VRgvwfrxW+62oIi5FnPL/s7/4UVGgYlXzVF++wpx
         Md8FpkYDtACEUD6wRQrsLJl9fykIMBiZcwaRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767974371; x=1768579171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m1OmdvehnFm/14/DksnNfCEmLe6vzyFk3yvKOxcFF2Y=;
        b=Itcx6ms+LMWj2IOa94t0LHEMwgLZt5Ks/QXbq7wNn7lFm7SYTp0gHdMXh4nXclP9Pk
         9buPgytHzoPOYNQUxhQfCZjcDQUej+RxymNKgEWMvaqaiBEwZkInRUSWXlacYrsgGtHP
         UwKBN84dSBuPKii9DQR5n7KXHbPuGn6taTjT+rZNTtWVqT0Sp1VPrm6bkhp+Ozz2mehy
         YFO7cP+cHBj/iDch7hS7GOP7FvJ4Z4l/ioQPCMSjG4SCKFRvcIdTp1yIeOOkf3eMANY3
         O2lxIRhJtVGk/gR73kccNhDzuL7wLRWfU1BbDxAaof4CWxkHogSfvFVBzqBZr5XPAnh/
         8SRg==
X-Gm-Message-State: AOJu0YxHDRzc0KGOey2vDivVftw10Dsxp3B29gKAM17e+JePOWouC28A
	+heyGXt6zFeq7uKJIKCaicgaihhydbc8lDembCuINxpQ2z2OpC1nW1p9o4jdrsCu8WKK+MPgt+h
	I9DTJ
X-Gm-Gg: AY/fxX7L8ngUAaGZ5P4E8cXvx17IE7kmcOacr16ZqTA1N6+Fx+qQB7CG5MWexofINlu
	fJotqiDSGrt+mZvvfxMWeoPMH9Rey/y3YQ7EV6/dz0ZRu/8hN7fTA2aJS41Z0/MNnxRFi7+L14h
	bRsVtV1WILUXZznHiEjhoK+UH+5rFvDUeOGyDvoziKEPx5bkOtWeRHLRwZ9DI+qrzjYriByLyha
	SW9yddcqY5+10VY4QviUai3U28wWs0sMX2O+SDF/BUB9AnFvBqhIYfJV4z3o7eJWkxrVXTniqtx
	4XQEoGZiFMjIyGbaUu9A3xEzD9EuOwsTbbGqo06glIH3it9LRUSAqqdmIzjHCoJ5IGH5Qh1ftP3
	iD94oO5gs5Z4AT5wwII/xaYJ+OHpSwpAyNgYRI5VQoAw0lmldUEVvb55TyP0xVIQs7+k5fHO8vx
	JNx3ofh/zKOINAMtJWvoEEAxXM
X-Google-Smtp-Source: AGHT+IGIBwRZVEQI8+1wLa8qwTem6NcbTySEHuE4vxWR0MD7mus9A6jLoYrthPDuctQTDoRe2Zcf8Q==
X-Received: by 2002:a17:907:2da2:b0:b79:cf10:a17c with SMTP id a640c23a62f3a-b84451ef423mr1016749666b.10.1767974370678;
        Fri, 09 Jan 2026 07:59:30 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d4acsm10781444a12.30.2026.01.09.07.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 07:59:30 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-fsspec: Upgrade 2025.5.1 -> 2025.12.0
Date: Fri,  9 Jan 2026 17:59:25 +0200
Message-ID: <20260109155927.3850975-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260109155927.3850975-1-leon.anavi@konsulko.com>
References: <20260109155927.3850975-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 15:59:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123307

Upgrade to release 2025.12.0:

- fsspec.parquet to support filters and multiple files
- passing withdirs in aync _glob()
- fix _rm_file/_rm redirection in async
- allow arrowFile to be seekable
- add size attribute to arrowFile
- support py3.14 and drop 3.9
- avoid ruff warning

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-fsspec_2025.5.1.bb => python3-fsspec_2025.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fsspec_2025.5.1.bb => python3-fsspec_2025.12.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-fsspec_2025.5.1.bb b/meta-python/recipes-devtools/python/python3-fsspec_2025.12.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-fsspec_2025.5.1.bb
rename to meta-python/recipes-devtools/python/python3-fsspec_2025.12.0.bb
index c65111e5cc..ea3e63968f 100644
--- a/meta-python/recipes-devtools/python/python3-fsspec_2025.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-fsspec_2025.12.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/fsspec/filesystem_spec"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b38a11bf4dcdfc66307f8515ce1fbaa6"
 
-SRC_URI[sha256sum] = "2e55e47a540b91843b755e83ded97c6e897fa0942b11490113f09e9c443c2475"
+SRC_URI[sha256sum] = "c505de011584597b1060ff778bb664c1bc022e87921b0e4f10cc9c44f9635973"
 
 inherit pypi python_hatchling ptest
 
-- 
2.47.3


