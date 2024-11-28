Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C5FD690F9
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 10:39:06 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.91645.1732790343416119868
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Nov 2024 02:39:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=gGaOilb0;
 spf=pass (domain: konsulko.com, ip: 209.85.218.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa560a65fd6so125280166b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Nov 2024 02:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1732790341; x=1733395141; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVeBsQOl3cSJ4McVSa6WXfyCw/KtoWj1e0qeTGItOuU=;
        b=gGaOilb0OPAkcKp0WeTxJACHrsLsItj9dcrl8v3SKqy8MJFJEPmicUwPIk98qoA0o2
         /dlavcVwGUhCRUcvJ9rQoEL759lqpYdJRF9l0I1kuYwP6GuZyJhEV7MV7T4J7hNq58DC
         ahL2pBX8gqrP7j54OZTmbbZu3TAOliIw/c9jY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790341; x=1733395141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eVeBsQOl3cSJ4McVSa6WXfyCw/KtoWj1e0qeTGItOuU=;
        b=HtYvk5+d7nTKytn387LUIv+plJIPy9qi8xMqHaSDx4QsxUfBoNoXm3RgG4lDe+tzjp
         vNWcbKOJU6odsya08c9ricFGB2zo8rkIaT/Q11B3HsWNXI/+HfHHNQE3c3diTb6Hn97o
         xD/jPZYqZc/sITwRxAPAhwAJZjBL/m7dDK5uECekEznvwY+/tcwD76ucdccyL0Sdc5MU
         +iJuTr/I2ZBjnx49ygn3FpO4RfnaBdeETW+wBENCGsaH6rzEZaUtzae0dvBUTdr3c3aV
         3CnwqAMH8qM0WDN36yFAZmkvVk/qoRDSAeE/j4+K9ooSNH3OkEh3HYsrcTknVN3MKoVG
         Zeug==
X-Gm-Message-State: AOJu0YxfX6zddYBPB9E/7xfBKFJvYTVZAgp0Shnq4YsB/ZlM9KJ0Wu6C
	dDKNenD3JsSzWAxOq2q1PMhsvqd6JUoa0+oB6uGGVDOg1HsXAyvFa2TWNy/TQNi789B1RkviljI
	B
X-Gm-Gg: ASbGncsv0i7svFvjyQ2TqBecqAw+RI31ew6y/49oc8j58Tx5n0p9+uucv6YIxWDECoG
	sRbPNJh3LnzmmR64e2R3Gdl7Ey0NLFFSTPGxYSLszAsYzxnNaYHn6r2+3swTqc2maVnkvBulFBT
	8EO/9ZvLM50UccKHAaATBBK055jC3xuXvYfAVWaWomQ0vcvnQI01rP2QhH+FLFgrL1q8/OPMLUK
	FUkmRHxRaPyws/5dOrYIABdbjGfEYBITGkZPGsjqVAZaeyrx9DmzmdAAhDE8urJ
X-Google-Smtp-Source: AGHT+IHdePg8l8MJ9f2S3Vp9wp45AXuQcX4dG3PZaZ+Rf9luFxfxU0qBth2PkyCdMOIeO45VTQtrVg==
X-Received: by 2002:a17:906:9ca:b0:a9a:170d:67b2 with SMTP id a640c23a62f3a-aa5946dcdebmr267436566b.29.1732790341546;
        Thu, 28 Nov 2024 02:39:01 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c11fcsm52227666b.39.2024.11.28.02.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:39:01 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-wrapt: Upgrade 1.17.0rc1 -> 1.17.0
Date: Thu, 28 Nov 2024 12:38:55 +0200
Message-Id: <20241128103858.4052195-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241128103858.4052195-1-leon.anavi@konsulko.com>
References: <20241128103858.4052195-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Nov 2024 10:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114105

Upgrade to stable version 1.17.0:

- Add __format__() method to ObjectProxy class to allow formatting
  of wrapped object.
- Added C extension internal flag to indicate that wrapt should be
  safe for Python 3.13 free threading mode. Releases will include
  free threading variants of Python wheels. Note that as free
  threading is new, one should be cautious about using it in
  production until it has been more widely tested.
- When a normal function or builtin function which had
  wrapt.decorator or a function wrapper applied, was assigned as a
  class attribute, and the function attribute called via the class
  or an instance of the class, an additional argument was being
  passed, inserted as the first argument, which was the class or
  instance. This was not the correct behaviour and the class or
  instance should not have been passed as the first argument.
- When an instance of a callable class object was wrapped which
  didn't have a __get__() method for binding, and it was
  called in context whhere binding would be attempted, it would
  fail with error that __get__() did not exist when instead it
  should have been called directly, ignoring that binding was not
  possible.
- The __round__ hook for the object proxy didn't accept ndigits
  argument.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-wrapt_1.17.0rc1.bb => python3-wrapt_1.17.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-wrapt_1.17.0rc1.bb => python3-wrapt_1.17.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-wrapt_1.17.0rc1.bb b/meta-python/recipes-devtools/python/python3-wrapt_1.17.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-wrapt_1.17.0rc1.bb
rename to meta-python/recipes-devtools/python/python3-wrapt_1.17.0.bb
index 636d677555..b72bafb6de 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_1.17.0rc1.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_1.17.0.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "5f370f952971e7d17c7d1ead40e49f32345a7f7a5373571ef44d800d06
 
 inherit setuptools3 ptest
 
-SRCREV = "75f291f8bf1fe6535b13b0b3dfedca012ca6c8a5"
+SRCREV = "e663d4910a81d666786ac773ad7c16199b01d31b"
 SRC_URI += "git://github.com/GrahamDumpleton/wrapt;protocol=https;branch=develop \
 	file://run-ptest \
 "
-- 
2.39.5


