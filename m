Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32583.1793879742001361907
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:55:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ph7YP0pp;
 spf=pass (domain: konsulko.com, ip: 209.85.128.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so19007035e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 03:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793879740; x=1794484540; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/BLtPJp9RiLjZT8pN6ck0/lGN2e2SgMwQJs6HlrCzCw=;
        b=ph7YP0ppQ9kzDSZckPgFmSB/z2phTyW+Y9lZLqhlZoKsEPlopxOZeal8Dl4yhMhdg1
         ZnL3Xw7dkG5WwRva/UXGawuEF5qMLUlCzwy1V7kFxgNrYc8nx4h8HrNlgiD0t8I2uODY
         jaLkQ6nlvikS2bujoOTgWj+GTYZuVpwZuE+zQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879740; x=1794484540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/BLtPJp9RiLjZT8pN6ck0/lGN2e2SgMwQJs6HlrCzCw=;
        b=s7rdoVi4cs/w5shJHavRQD0juTJ983EclfxxJ2uirWjkdN6Bd7f7nIV4atnwTRL8nV
         Y5nh6ggMhDfVu8DmpvfSetXDa0KbPehLrbv8yw8Eee6cKFSslfBfn3Pij40KvSxYD02H
         BHQsx8uQrAS1aFyJGGwulkd0PZnJytcSUo6Av3KpY4OZQrv3JtYhiDNNiH9WMNOtA+Eu
         saOdYrV/t08zb/wWoXwotYqWCa4z8tUAwKMJMtB5D9B64x9a+SZGNt/2aCaJUo6zWENW
         gskjzzU2ZR5uBtmx9Rh5D4+q5HzQgu1F0y89moony8hGTCOcJyVcsnap3Na2XIFCrn+L
         wwmQ==
X-Gm-Message-State: APuU4Z/1gym+Z5Gt3Iw2pKQYocLdNlTshQTEpZ4wos0E/0Z15vZ64HLQ
	OXo1k7KnliPNj5fcbc5ItR95BqH8v/KthbxZk7siIv1m/BpFzGsqn5iF8E6X/UtfnN1QQS2q1PD
	rXl06
X-Gm-Gg: AYBFou3igqNQEIseDoXXwDnEvUYGg0kQFVLx9qUCFpHHrg0kvSKW3UFoQXos18g+DsD
	pl4mkjacV/19Atl7LM4BGY+vvdJl2ETQvJ17w1tjz5Z81UnrtawPB1P6uIH9e3XbxhTC733xPvK
	ZmmxdNIBQ9ZQ5Z3j7ijE2wMlwsTC/f9XF3pyl1VziW36D4SypHv2moO8uMIK5PLnqZWmprnlpWW
	s3Buo0o1dw9Z5kXLTTs8YBJbTLxicqLSHVSQ/zNUYWnm2SirASc1SXn5FT9yK0pPewKlUVkbpM1
	OiXrN0od/UsxBGoIYt3hed7ZdAkd/aZ90QbAihpaZFVgOECo7AOjjxKMGCZ0XVhPujKLap9kAuz
	MebJKoypV9G5b3BMfdbYx50VS6jZHSJESF9h729DBNR0WI+5ClLhHXaMRGAek9yz/aDrE/FO6PQ
	VMTEYArLrtDiPc6NJAs/VKVRJ1ubKWMk8MrGij8YfoFg9Xcx8M+dY/bqhGddWURFgEITO1fTbWY
	HyLUj+qmz4FQAljETcYQfhs0A8JVzIGO4kcVJ+L57V49KO6H2X1orJKIJg07YXLzPKFim3c/HXo
	NXRvDyjwGWgktQfkcL48bxTia6O/QEE1AVYIsQKip1L3fm2KZ8QkGOUOPrAgQ/WLLN7wd1XPRTg
	jOBN3QCUra+2NEnEteNA44qK7g5D9CtaHWUlSNs0amgLXgoH/2TIfZXbl7IJbEl3jL9e8xXYkpo
	E=
X-Received: by 2002:a05:600c:3510:b0:4a1:dec1:4e1 with SMTP id 5b1f17b1804b1-4ac1765d674mr421674655e9.22.1793879740369;
        Thu, 05 Nov 2026 03:55:40 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm173720995e9.3.2026.11.05.03.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:55:39 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 13/19] python3-robotframework: Upgrade 7.5 -> 7.5.1
Date: Thu,  5 Nov 2026 13:55:20 +0200
Message-ID: <20261105115526.634289-13-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105115526.634289-1-leon.anavi@konsulko.com>
References: <20261105115526.634289-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 11:55:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131913
Content-Type: text/plain; charset="utf-8"

Upgrade to release 7.5.1:

- Type aliases with list of types in values crash execution
- Performance regression in Grep File
- Execution crashes if library import argument cannot be converted
- Tests in Markdown files get line numbers relative to the code
  blocks, not to the file
- Argument conversion failing unexpectedly causes bad error
  messages with keywords and crashes elsewhere (e.g. with listeners)
- --parseinclude with multiple data sources fails with "Suite '...'
  contains no tests or tasks"

For more details, see the full release notes.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-robotframework_7.5.bb => python3-robotframework_7.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_7.5.bb => python3-robotframework_7.5.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_7.5.bb b/meta-python/recipes-devtools/python/python3-robotframework_7.5.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-robotframework_7.5.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_7.5.1.bb
index 8dbf7ef936..72b3425fc5 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_7.5.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_7.5.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "ff6233ff752a200ece4d0a6c59f6f9f7d0e96dcff0a7a3458296b997b812482e"
+SRC_URI[sha256sum] = "00f63dc7b0477a137f8a9c1f2e14db8084a4d187a76f3fec6c2567875c32b932"
 
 RDEPENDS:${PN} += " \
     python3-shell \
-- 
2.47.3

