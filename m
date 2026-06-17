Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BFD8CD98E2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 09:28:33 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11590.1781688503267800393
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2026 02:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=bfEx5wAu;
 spf=pass (domain: konsulko.com, ip: 209.85.128.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso41516815e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 02:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1781688501; x=1782293301; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cUz2q48lhTYCpluz8bHRPx5U898cqO5ELdkov8aDrbg=;
        b=bfEx5wAuRrPlvAcos0aJVYxPqWy8GF0U4slVyQTpN6dTRIal6Ky2kqrbvBl0DW1zM5
         yhAAZ9RHybTI+ekUf600bhOcWB7+g3DYuuyxJbHUrLfjzUPKHMo/0W6FIrtEHdHsyBmr
         D4cW/BcQHx9HaTdmw2ELxFuACopmv4zIUB5iY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781688501; x=1782293301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUz2q48lhTYCpluz8bHRPx5U898cqO5ELdkov8aDrbg=;
        b=E2oprfPGwgi9+LG3PVsCWR6jQJvWaEb2RZ2J6pSwe4mtDbkEktVR061bFZAwAEV1UL
         uROJYx8OxJwlx+drENtu93kOKwcCU+NmPlCl8CqT1YS+alvkqjzUnYeuwkBoI/97hH0C
         VTszFwI9TkmqlJOP5VxWG6KelGd33Z/DkZXtgcMDHqjuUjxeSW8AB6iCPgkj/Nh3OZMf
         8ozTVrvtjyjJjj1lraO5B2igJSB1c4o2MBtg8dSo5ZFuNBMc1wUMHOJZiu6o6zqvIUEW
         Q+VIJQYHRuqco2ihA+TAgGiJY6p9KfStqu17DF/YNAkGdGKvn+134LQiq4bC6bUuYgCG
         SHnQ==
X-Gm-Message-State: AOJu0YzurX3rlm81b9nFGxO7TQtHi1pof0sCrVXyzNKLxBmJH82X3Q+z
	86wwkBEWUklyuAmXlYheLHol2QKeDedZc+M89tRN451JXuc72RkQcy3PZS5tDh+se6b0bCajYe6
	XMyeE
X-Gm-Gg: Acq92OH8rg8wQDXHAZvnLlNhjpB9TDmDQ8DQi9Em2iqol8MhDNNhpqh7LcWn/i3NNyG
	uaW1AXC4woEj6qi5WlCk2mnkSNaq2iXuYoduTaAo8+r1C03IzPRm4svu9FGYc18brZEkPGxjTFB
	OTtvMEIvoKg8pS5lpoo4kVV8SB8r99zXxw//fTrUS35kzXhGDftaEWcDqbPcneW9+MXdk/3B0ci
	YSkfzCBPD8blW5vN54dczFukY7ifiUR6kJifsResLR9acrRzPgVWB+TgtgR36g5li+JpojuxB/H
	PHGWT7lC9rL8Cazpb+jARXOx88ZPTlLHIaywwpcx4yPxAGv8/dqUzNu4w1deqt1f9r+lOp739yj
	Moc84dkWlh3wd+pNibhhaSbH/eladtKtMlsZP+NmZ23SP8YCB69F1vFu3tDWcjnDVcxA+STVCaO
	CZKu5ZpIo0592QopdG2zX7E/qXkg==
X-Received: by 2002:a05:600c:840f:b0:491:8043:5c4a with SMTP id 5b1f17b1804b1-49233428690mr51024735e9.31.1781688501175;
        Wed, 17 Jun 2026 02:28:21 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4601esm154647225e9.1.2026.06.17.02.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 02:28:20 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-bumble: Upgrade 0.0.228 -> 0.0.230
Date: Wed, 17 Jun 2026 12:28:15 +0300
Message-ID: <20260617092817.4090239-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 09:28:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127655

Upgrade to release 0.0.230:

- add basic support for SCO packets over USB
- fix(usb): support LE ISO data over Bulk endpoints
- usb transport packet splitter

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bumble_0.0.228.bb => python3-bumble_0.0.230.bb}   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bumble_0.0.228.bb => python3-bumble_0.0.230.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-bumble_0.0.228.bb b/meta-python/recipes-devtools/python/python3-bumble_0.0.230.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-bumble_0.0.228.bb
rename to meta-python/recipes-devtools/python/python3-bumble_0.0.230.bb
index aa011258f8..a42478f9a0 100644
--- a/meta-python/recipes-devtools/python/python3-bumble_0.0.228.bb
+++ b/meta-python/recipes-devtools/python/python3-bumble_0.0.230.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/google/bumble"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a775f1b11285b6abedd76748d176125"
 
-SRC_URI[sha256sum] = "78fb156548dd738a28ecba539e7aaa138117516a8811482e9801bcd35a4fbbbd"
+SRC_URI[sha256sum] = "1064d45e8370fc2b1bb684c0efd59534407ea16c3a2811985ed50a886fa3b674"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
@@ -25,6 +25,7 @@ RDEPENDS:${PN} += "\
 	python3-pyserial-asyncio \
 	python3-pyusb \
 	python3-websockets \
+        python3-libusb1 \
 "
 RDEPENDS:${PN}-ptest += "\
 	python3-pytest-asyncio \
-- 
2.47.3


