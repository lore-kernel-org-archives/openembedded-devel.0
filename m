Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.638.1795195666557534134
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Nov 2026 09:27:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ZmJAAvd7;
 spf=pass (domain: konsulko.com, ip: 209.85.128.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso10703755e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 09:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795195665; x=1795800465; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o2l+ztwIlR+iP57UEQrt3Z7BGypUKzS4HN7T8zTjLDc=;
        b=ZmJAAvd7L/TOXwEQnRSKSvPa+hFcTmuNv1gH8qHnWhX3lC9iL1vRP3zI+Uypk0MPZR
         pEyktXQfK4U4gHRnzZf71vQ8EyVsQgW6HV3zVJ63wJluWDCtmCpf8+iLRyX6U/L8YrU/
         O05abI5JRJ6MTIKfI905J04JcBEiwxqzuLZvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195665; x=1795800465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o2l+ztwIlR+iP57UEQrt3Z7BGypUKzS4HN7T8zTjLDc=;
        b=YDRK087c4UPJtfZTtxlduSEzvJtg6iudVh6ldfJWa0ujSIaA/bdNX9ScJkqQV5OAeV
         OHKue0AlhCzuovE2tpOXPehjZeHgyHLNkIf1LlyV9Oz+0gtH0F/yO4pSQ0NfDzxLljXv
         N86NyRotidjygOVuo2yPELqLdF93yu7VtD7Aszm/9UKgpWo0rVELP/MBaYZHmuNTz05A
         pWogipvwWy7Z+9x2i8ylX7HDJI5y6AbW/6/qgkgcjKD3W1Tn+HCn3lYjnZhSqVnydwpM
         K5aPrEEjv3eKu8UEo+Zh7iUbWtzBpeWtSwLRT6mDFBR5kGcFHpiQtUpNOkar+MRDhCv2
         yDEg==
X-Gm-Message-State: APuU4Z9k/b25eyM2+BzzhGCssJjQ3wMMUbao3ptNmavvI27iWMRxwafM
	uido3yRVdlofwh7kkdoRsCjZHNgro8Eq1F/UWhdQD1MXAsUhHUeov1AGw9kM0O07roBWVXscmLb
	8A7mR
X-Gm-Gg: AYBFou0sK2MowdSZQdFcp6GBEsvmRQch6as9MUw3CzZ4+d0tsJAeXN3YPRyJMxVe6OY
	inkhNAhAdr39wDldAMT49sAxlM1y9pKks4/LMNRyEotWxC2biyYNRyjqFAkVBcbIWpcZU/FXMpn
	J+FavBMJcWWmjMEL+zGr2IGsFIv+IbNlurOOQFHJfFICUcGsmk/AOsDdEaBv0dRIBYGP8vtCsBW
	CgWf4pakNJ/jmsQ/5TFLd4Gp4sKfm8/YJQGULFvZKHgv43bUgAjyDPOpwEdQPzKS2468io82yQ9
	6RRQ+QaTV2Ed43vkAU3Nj6EMD1pekT+Q5fLrqHOILXZ1M1enCfLB7bhJ23UCFnrmP5HnLrxXhFh
	3MrR7aO7qF21cup0tYSbhiIcdQCfH996JABBIQPF867fNMHUuxAb0vUQZJ8xdzR3tfimbs8U/4X
	pYEa1AaE4QW7/x4fX4A/0CDvG6Wcz9wNDXKz7NMygXvqv0EgfarLgjyvQmDMgWyM/oFYB6GIPWC
	CFtMl9unvF6w3B9EQNhqTmZ6HtZFDayiihS7cfLRCSPY7pCofzJev95UEj/6n+k/lfdJhsx02dc
	e2dqIfjRY9RRKGhQeq1N3sWygN4DVi4bP6hyEHKz3M6gFwK+a3kS2blZqS5BsY+uU2N95wxu3a/
	FHbElL/6xHnllJlLDQutGqOipGpyJ2zKRm2ghJmkXRYCKqfE4rF7ZBw==
X-Received: by 2002:a05:600c:1389:b0:4bb:6519:477e with SMTP id 5b1f17b1804b1-4bb88813b35mr88909975e9.17.1795195664827;
        Fri, 20 Nov 2026 09:27:44 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm1946485e9.1.2026.11.20.09.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:27:44 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-importlib-metadata: Upgrade 10.1.0 -> 10.2.0
Date: Fri, 20 Nov 2026 19:27:39 +0200
Message-ID: <20261120172740.3283871-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120172740.3283871-1-leon.anavi@konsulko.com>
References: <20261120172740.3283871-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 17:27:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132779
Content-Type: text/plain; charset="utf-8"

Upgrade to release 10.2.0:

Features:

- Restored csv, inspect, json, zipfile, _adapters, and
  importlib.metadata to module scope, where a reader can see what
  the module depends on, instead of hiding them in the functions
  that use them for performance. They are declared in
  __lazy_modules__ and so stay deferred, and deferred alike on
  every supported Python: 3.15 honors the declaration natively
  (PEP 810) and earlier Pythons reach the same behavior through
  the lazy-importer backport, which is now a dependency there.

Bugfixes:

- MetadataPathFinder is now installed on sys.meta_path only after
  the module is fully initialized. Previously it was installed
  partway through, so anything walking sys.meta_path during that
  window, such as another thread calling entry_points(), would raise
  NameError: name 'PathDistribution'
- is not defined. An import interrupted in that window left the
  half-built finder installed for the life of the process, failing
  every subsequent lookup.
- Return License-File, Import-Name, and Import-Namespace as lists
  in JSON-compatible metadata, including when only one value is
  present, and retain all repeated values as required by PEP 566.

Improved Documentation:

- Added a caveats page describing how this package and
  importlib.metadata interoperate: the two class hierarchies, the
  protocols both satisfy, and what that asks of consumers and of
  custom providers.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-metadata_10.1.0.bb => python3-importlib-metadata_10.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-importlib-metadata_10.1.0.bb => python3-importlib-metadata_10.2.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_10.1.0.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_10.2.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-importlib-metadata_10.1.0.bb
rename to meta-python/recipes-devtools/python/python3-importlib-metadata_10.2.0.bb
index 10ceed1515..cfa517128e 100644
--- a/meta-python/recipes-devtools/python/python3-importlib-metadata_10.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_10.2.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=affe5a7d8b988c3db245c01075b29e17"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "82b04047fa09792c1a8cfeddfe08bec79e4b13c29c8469b0d3949860f61017e8"
+SRC_URI[sha256sum] = "9413a2029fd9ca5669d27f1386071bbfe3c7ebca0545692ec975088241fe1d79"
 
 DEPENDS += "python3-setuptools-scm-native python3-coherent-licensed-native"
 RDEPENDS:${PN} += "python3-misc python3-zipp"
-- 
2.47.3

