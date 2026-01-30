Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA84D49C60
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 07:06:27 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5560.1769756785040467839
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jan 2026 23:06:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RTwOJMGZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso17441575e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 23:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769756783; x=1770361583; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JH1QP2kkwYwHna2dvRg5sO9PorcPAh7NavFwI4uuGQE=;
        b=RTwOJMGZ9Sl7Cn13nn2TQXcuDAHjkQ2Q1mL5RVnD6oQEnKj6fjXxEBFObt0sGdxsc1
         yTLRfO7oMaaV56SylLjB3jgCZxEW/s0PmbWYjxbTmj136KM8GmVIuWb04JG832CCYV07
         1kACiie7epVXvJfKGjJh8rjJTb95Ru+5JSgRX+WKNheVvvrW6odoL3Neli2kvEX/jHky
         BCyoaIvKMU1SycJUVdI9Fr9SOReD5Kw18UJ9j4cnD4mle6tO6d3A3r79YP27Tqy5z7jZ
         JVomldHAwfDxiEzUXmF3kjBdwEbfxBBqNsbMj7diutM/9W773pjMosYzN+mJ62v5giGb
         iphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769756783; x=1770361583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JH1QP2kkwYwHna2dvRg5sO9PorcPAh7NavFwI4uuGQE=;
        b=BVZV2smySJEp0QHyY+LTdx03U0WkrX8PYByt2S7zz65KOIZKXJh8wm8m9WiDDmJNks
         TPLS4q1IGpIWc5VDZDsJ4VgvlyvIoaIJE+r2FzQ58CELj/JTOVP3FKb+0Ew0/AtfIC6t
         9IsP6NCXAOEdLttY0olxo5SkC57IAkMxD/yRZR8CSERu6Rg8n0sdZzgrUxFw+SY8kNYT
         vFIryGxgwdNJ54hA/knzQHS1o5donrPicF41S5IPmX3kc7fruc+JNkdVUdmIwhAsJJfI
         XzvrX1qrSueZE84XcLTCXjyKl+4OvFLOn473NA9PgKbGTZrMxaqec7FfOhsnvymKWvh7
         FQ1Q==
X-Gm-Message-State: AOJu0Yx5DR9BzUnl0TomZx+slTulb/F2BdN9Q0FXuV/IVXJhOuLZypD/
	Fo/8FrPh1n5NqHoOclg/f4WW/zSWPnptYFE0DuJ2AzeVDkbDVBTlaJ7gKUnTNw==
X-Gm-Gg: AZuq6aI3dhrHamOjPNXrUwLnjRp2A0KYuMIlpceyoKxnK9iiDoYIsbu9WA5cDWGA5NU
	tOeBqyiO0E7d6TketE73bxfl0qlFgcAA4U+2PSweaTAF9BpZnN1inm12URuu3/n6OIkxaTZG3U+
	ZMTLfTQG3kx4YOsaYTQ3r8TC+A8IyXUVhJUk2bjHY7KOX+kSwxUU0/DIOpR7Brc2PXusk3NPqyD
	98YCMzH4FXHqVOf5KhrMGxnQYmLlxNGhlXALnjzY6GHy5npSs9Hm3BdUPA63QFr/0kyC0MkxcIc
	E0Jj67PqJpEHoZy0VGG3omPNWVES6E08+FDZMB5WDrs0Gf76Jk88yXIu1cAUKwLo3l46FpyKVIL
	9lrmGtjNfVezNBO4NWPrlCsmYH4BggF8zWbV2BfK3z0TuWgZ1qSTjJyAliQYGLZgYzahZzYf4y+
	B6gvtchhxc
X-Received: by 2002:a05:600c:64c6:b0:477:5ad9:6df1 with SMTP id 5b1f17b1804b1-482db4593a1mr19092295e9.3.1769756783100;
        Thu, 29 Jan 2026 23:06:23 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be7404sm280057445e9.1.2026.01.29.23.06.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 23:06:22 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 1/5] python3-pymongo: upgrade 4.1.0 -> 4.1.1
Date: Fri, 30 Jan 2026 08:06:17 +0100
Message-ID: <20260130070621.3171877-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 07:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123997

Changelog:
- Fixed a memory leak bug when calling decode_all() without a
  codec_options argument.
- Fixed a bug where decode_all() did not accept codec_options
  as a keyword argument.
- Fixed an oversight where type markers (py.typed files) were
  not included in our release distributions.
- Fixed a bug where pymongo would raise a “NameError: name sys
  is not defined” exception when attempting to parse a
  “mongodb+srv://” URI when the dnspython dependency was not
  installed.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-pymongo_4.1.0.bb => python3-pymongo_4.1.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.1.0.bb => python3-pymongo_4.1.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.1.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.1.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.1.1.bb
index d47dfec50f..7bde4ff681 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.1.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "dbba77bc0b706c7ee496fc75a6c6ed406d85f6091d5fec488a8944c3828e6462"
+SRC_URI[sha256sum] = "d7b8f25c9b0043cbaf77b8b895814e33e7a3c807a097377c07e1bd49946030d5"
 
 inherit pypi setuptools3
 

