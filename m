Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6334.1792499555864814169
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2026 05:32:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=AAkHnDwY;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1f68a9855so3297615e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 05:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792499554; x=1793104354; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b+J8Fn2bDcD19/mSS0CrlfkFbEsk4QbQJKvpvVo0ibo=;
        b=AAkHnDwY1fSrLd2kEWdQdJ7dchiZX0P+tkipS1cr5yOy4yScxrXP8t8EMqiEzG8z3K
         VD8r8EXCdPQl/Zer6rqRFfm2oKk1ywJ3gMswo/j9qkgEYqFl21Jlaa2QwPORhV5F9GCP
         KwIyrPZhFo0SQGDBev6F49jskNVKTi0P4Fxqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499554; x=1793104354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b+J8Fn2bDcD19/mSS0CrlfkFbEsk4QbQJKvpvVo0ibo=;
        b=xZ5vABrrUMA0q/aRwSIcqNDQzyCnlnmddbjt3Tdoe2rgJ2RUFnKGDuOidLDcYsCqN5
         Xf3PG2eUgAq5LdMcG1GE5p8IVTs+JpWat+nl6pvlgVcam8jbMVQroYCec5Uoq05kNNe3
         yrHvq1Rgo0TgdDOC2qDBpuyQ8ilybm5lE9783GcGhz4EJUDqTm7GCkP06/sS9k0CdNlQ
         sB3WDLtgX7tajghHJPK6Lfp1+EJf45IR6g12sf0rdbl4QSMBsqtPHz9yrvZBAdIRw8mO
         PzZ+1mvHiW11Z2JqxPHuovigYHo+TONApoe6bAEyv5vnZad3PRtgKrlNHdzNEo1SWwXr
         oixg==
X-Gm-Message-State: AFq9FYL73HSUDub77Yk2cCeCvyCo9KdF+AFjVyKBo6cKl19ouEbTCkc3
	Fkh9CIrM4o3vmkEBUf7NZ+ek2PYt9VhvGN+b3XNoqtMqY2IllpwTQkYK2dYfOO0yGGx/nJloPmS
	Nt8u4
X-Gm-Gg: AYBFou1TNZvX4avQ3t7NTY3GFNPKwid9zdKY/KnwGUxQlFH/73y+mbz3jHF7/W39wVC
	+oap2o1+4Qs7/aED7WaQetKsBPS0Ubi36UJibvdA6CfThcKCLEiXbymbj6jTBrujOOieSTDwwNh
	6Zjmo13RBtXh+V7ZPevv39yRT05tNnQAbTPNlMHSQIYnCiAaThw+2jgFyqtCGDqgV3HQ+TaQR35
	49tMntYw+eSXnvdDdxjCsTWWb4zv2dWZDc21bhx5fRchBFWPvqQW8Nccsn02y17D7CsY4VxU4Nk
	MEWAqaaiZm3GWByG4siCBdmp3wcakB155sDTqpBZzuY4RYZaMbgwNkpwgRGdquD0wJbD8rIMLMc
	4+1wVm6+vcRuLAobr9u7A3wcH2V2bEDFFHawQGZQTaKAZ0NJfZgG+F5rEF6ymXgu10MOWYAxHmR
	TvkmVmSp4BJaCW87iZFrK8ShLnBtMTnPf7h0SOBABgwk8WHJ6iuxLaCS8qBKwKjiKEYwWnJzEbb
	WpkGFcorgnsgLRNeG9QJSp3OvXTs9vsBGtED7k/gxRFrUaS6BDAGn/XshAWEkgwmC2CisC2K/RO
	T598BX6J3utIdJV+dCzGV3k=
X-Received: by 2002:a05:600c:3b1c:b0:4a1:9a97:c88 with SMTP id 5b1f17b1804b1-4a1d7600183mr225350975e9.5.1792499554037;
        Tue, 20 Oct 2026 05:32:34 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cdc342sm75422675e9.13.2026.10.20.05.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:32:33 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/14] python3-isodate: Add recipe
Date: Tue, 20 Oct 2026 15:32:18 +0300
Message-ID: <20261020123226.4033600-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020123226.4033600-1-leon.anavi@konsulko.com>
References: <20261020123226.4033600-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 12:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131164
Content-Type: text/plain; charset="utf-8"

Add recipe for isodate, an ISO 8601 date/time/duration parser and
formatter. The changelog for release 0.7.2:

- Drop end of life python versions
- Don't match garbage characters at the end of parsed strings

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-isodate_0.7.2.bb  | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-isodate_0.7.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-isodate_0.7.2.bb b/meta-python/recipes-devtools/python/python3-isodate_0.7.2.bb
new file mode 100644
index 0000000000..a87373ddd4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-isodate_0.7.2.bb
@@ -0,0 +1,11 @@
+SUMMARY = "ISO 8601 date/time parser"
+DESCRIPTION = "An ISO 8601 date/time/duration parser and formatter"
+HOMEPAGE = "https://github.com/gweis/isodate/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0f15bda312de78bcdcac1df0dc536f48"
+
+SRC_URI[sha256sum] = "4cd1aa0f43ca76f4a6c6c0292a85f40b35ec2e43e315b59f06e6d32171a953e6"
+
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += "python3-setuptools-scm-native"
-- 
2.47.3

