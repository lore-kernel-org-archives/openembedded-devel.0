Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7037.1794520743418360176
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2026 13:59:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Oqi2+nlr;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso3997675e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 13:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794520742; x=1795125542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0HaSLu9/gVNCCUeM6YuLV7QYiy9+bBq8E0rNVCrAil8=;
        b=Oqi2+nlr/r3s3oiiMLO38aBPsM9gopwN8aLlrBwz8NuFW00eltTL3hdV2eYvNibsfn
         PimJE4OsBIwnIM02/wl6kGd6hmzU8ool3zeiTsIea2p+KW7dKUhzssBe28eGjMqo5YYj
         s9qRG4SVT9o0gSDfJw8uFWW51O0lEvmcVvFmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794520742; x=1795125542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0HaSLu9/gVNCCUeM6YuLV7QYiy9+bBq8E0rNVCrAil8=;
        b=Jb0CchBVKUqPadYHUhFH4UPORQCKR43JeRGnOmFS48jLbPP58ApV2JGMx5rt9OolYo
         6guMQzbg+UkNZSG6nCFUMCvEPcZaOtFkJOaaU5Bp8hbmubUQ8U0dkHIAHw8DZNKjqlR+
         JeNL46fpxpVgOYYJ054oEKZynQo6c8O0lsMAzKyWlGIkZb9TD6pgmxYT9lC49nK3WVia
         1SxEDZ6lof6SRsDoaHJg/hUDAkJzlvyE1mYtqvktEvadx0DgjrBbve2naDC8v89kTBPA
         MhkTigHqhk82JyxzfblfMq1bZxK7FgPiKhXy0tOtZV0W8NOYuweZEw5n9+riYCo/laLI
         L3pQ==
X-Gm-Message-State: APuU4Z/a5ZGv1aM/bSNrXrrdEBcXe+Y+/imMl9rbzuKV6e7/mp+nLzPC
	LijT7ddPXPIUD8fBzQfToTTDaSoiBbUVqDGDOI74yL5NzNmqfKlMAmduI2G6CeaQBaSAW4RhRVt
	Qp59e
X-Gm-Gg: AYBFou2ON+Y565k8yjj77nTqHJgQoLyce4KX0sU3fCARiTmp8lzRJJOz532uByinR0j
	ek1Wu+I1zBWXCEXWWdSMQz/258kCAmVUMUA/HhlHaIKK8Dws7Wd3tndhtnxbDThNK73uJvvqd0X
	ydaPN+VWFj5qwqTsirCiNYKwzCivfV/Smd63dkZtfMLOd+Gy1ZskeqMguRze+der36eVmF0c18B
	66p06WpeKeZg1+YwbPcwRDmQV0wY7cO9oxavB5bBVlnRqeuA5RXQeCc2ba1J9VKC66MSN3OznbD
	h78pZB0coUkzksETvoyDaa4JuShgMJ6MXStu/zbFwR5I0VVqJSz9syFImDx7C8k0E7CclVFoDEu
	DWfwM6yGpDdSuPhq8w7R712QKwGZtcpU//SoQxsIKi8NSBg1DjcAAzXPoutlorAp70CDJLZRrIH
	nNd+p6Z3PpUBtlKMPJsBuwZdbVt1kn0BNtf9/Tarf0oywot+HuISIw48e5UMkZDinDKgo7Jprt1
	rZTtrQOS4wJIyzXsGKvRZKHDrQdzCyTvdB3xR5FuDVJPQpkiH5b/GX85TF4vErUcihcnPeoOz24
	vK29DupspclprPyVNlI3OFCFEVPMlKRVgVkdAZOvJv7Ssiz87v4WEfEmsJirbkeMHyYe9yXJo3u
	zevZbzN5Ptp1v7s+FCNY1b+ASgNk+xQc2+xs+FTQE73uvgmywUGYYLg==
X-Received: by 2002:a05:6000:2411:b0:48d:df08:307c with SMTP id ffacd0b85a97d-49c726da6a6mr1419607f8f.44.1794520741741;
        Thu, 12 Nov 2026 13:59:01 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c77393700sm1043896f8f.18.2026.11.12.13.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 13:59:01 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-faker: Upgrade 40.44.0 -> 40.54.0
Date: Thu, 12 Nov 2026 23:58:52 +0200
Message-ID: <20261112215852.3336380-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112215852.3336380-1-leon.anavi@konsulko.com>
References: <20261112215852.3336380-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 21:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132221
Content-Type: text/plain; charset="utf-8"

Upgrade to release 40.54.0:

- Fix: bn_BD swift_bank_codes and swift11 length.

For previous releases:

- Fix: allow the digit 9 in the first eight positions of an en_CA
  SIN
- Fix: generate valid it_IT VAT IDs in vat_id()
- Fix: reject non-positive precision in time_series
- Fix: avoid random offsets for equal parsed date_time_between
  bounds
- Docs: add faker-cti to community providers
- Fix: respect zero fractional digits for positive pyfloat fallback
- Fix: generate valid bg_BG VAT check digits
- Fix: pass tzinfo through when resolving relative
  date_time_between_dates bounds
- Fix: allow repeated digits in numeric pt_BR CNPJ roots
- Update the base currency list to current ISO 4217

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-faker_40.44.0.bb => python3-faker_40.54.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-faker_40.44.0.bb => python3-faker_40.54.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-faker_40.44.0.bb b/meta-python/recipes-devtools/python/python3-faker_40.54.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-faker_40.44.0.bb
rename to meta-python/recipes-devtools/python/python3-faker_40.54.0.bb
index bb4ab9c64f..99631f46a1 100644
--- a/meta-python/recipes-devtools/python/python3-faker_40.44.0.bb
+++ b/meta-python/recipes-devtools/python/python3-faker_40.54.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/joke2k/faker"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=53360c4126f7d03b63cb79b0dab9e9e1"
 
-SRC_URI[sha256sum] = "97245a3756dcaf35418b89bea9f03ae6881557db0032bf048744c2aaee2a9108"
+SRC_URI[sha256sum] = "38fba73e32699a9f1071724d67e5a66a84bf057987cffb27c9d0c979fda3f135"
 
 inherit pypi setuptools3 ptest-python-pytest
 
-- 
2.47.3

