Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E4EC77B7C
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 09:03:26 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.3605.1750410196740431029
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Jun 2025 02:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=eyphQA5b;
 spf=pass (domain: konsulko.com, ip: 209.85.208.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-607ec30df2bso3116608a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 02:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1750410195; x=1751014995; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8D5VjJMPm9Uc/D+juImPFDTR309GfIfeHMV/tG7lFg=;
        b=eyphQA5bpG11kpPw40QApgwY6AzaRVsZzDNlc81p4icxlKynpYL+RhAmLXY7QMjbMM
         1BlyHwH93MUy1AUB4EdNjxLTkYebTNdX4znh1mVplysYo06Upt+dacre4lY8CFaqTw/H
         cCTo62ANb8l3n0vGs1SaQ1/EzGxgu+h2MzUj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750410195; x=1751014995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8D5VjJMPm9Uc/D+juImPFDTR309GfIfeHMV/tG7lFg=;
        b=od8TjIdq9eAgV363T0BArNfXH88xRAgZI5u/rymHdZ/JAqN70viDUUhOeRbV08Agc+
         bNRLR0pbjzUhvXA72gQZvB4TGBao2sVHIccooY6rTdHHSmmnlP5a6XT5l22uJlVcWkH4
         olK+qK+mSCz8t98pOm1X5pw/vY2AUoqDIJjelLLJ8Xx3JHfMakYoZqKg70HoVFrM6u6V
         UTDPvbFzmKRBbyQQG0tJjxCTOIq8E1TNcDWMt0s9n+2ZmYZvygpYkozHgqH8dSq8qSls
         prTaCJTJ2R8jVh5+ihTQPiKO/7OEooXDop9QESEYx00T2fu5OVFDQDs0wVND/qQdomXg
         zp/A==
X-Gm-Message-State: AOJu0YzmNVbAJqZFIau/KfIviFEu6HV3yLcaj0JerTi/yrhFJpxyLedg
	tf9TIWDNCBtaA9nHrG7yJPlvZqyhgCULQP97KuhIer5xFRQMAAoXqS//TL3/TUj5YurzeZAzKL+
	6Qbui
X-Gm-Gg: ASbGncs/9L7QnnepILJ3//84dS7RPdsvwUBfqwbGgVWdKM33Wa4Vk4HgH0oDhTx4Fom
	Yk2mD9i87ETSsdEkIN8lR30u1liKZyiCjShVbWLFHIDGndGXX8oe4EmEqpyKoRIyY7hOlVYYlI2
	GAA2jIb3JjuThBIqv4iVcf9uraGhbWnPi0Oh47MzMu6gAc3Qo6Qzic7kwg4vBK2n5WUmHd1MoZi
	1s7MzHHfaNADKX9wYGuWEWOOwIh2WZOookfLmy4f4I555ecJsKJ6O0inPAhuDYfALIAWn2xPYyn
	7P/mjfWV0EJ6vp9FzUXR+PjXFgQZY3hg7htH4fPU0BiCsrCWQCeuMJH1BNpfUhU9KnEYvgl3zpd
	q
X-Google-Smtp-Source: AGHT+IHYPmStNjB+wWnL1FjC/h6jYz1JjlvJNDkAR4rPi9plpkg7bCt5qi9W4P+p63MlXhUBcNvPjA==
X-Received: by 2002:a17:907:d2cf:b0:ad5:7bc4:84b5 with SMTP id a640c23a62f3a-ae057c3ecb4mr192340766b.57.1750410194891;
        Fri, 20 Jun 2025 02:03:14 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054080a54sm130551966b.102.2025.06.20.02.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 02:03:14 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-frozenlist: Upgrade 1.6.2 -> 1.7.0
Date: Fri, 20 Jun 2025 12:03:07 +0300
Message-Id: <20250620090309.1619406-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250620090309.1619406-1-leon.anavi@konsulko.com>
References: <20250620090309.1619406-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 09:03:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117964

Upgrade to release 1.7.0:

- Added deepcopy support to FrozenList
- Fixed an issue where frozenlist binary wheels would be built with
  debugging symbols and line tracing enabled, which significantly
  impacted performance. Line tracing is now disabled by default and
  can only be enabled explicitly
- Enabled PIP_CONSTRAINT environment variable in the build
  configuration to ensure the pinned Cython version from
  requirements/cython.txt is used during wheel builds.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-frozenlist_1.6.2.bb => python3-frozenlist_1.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-frozenlist_1.6.2.bb => python3-frozenlist_1.7.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-frozenlist_1.6.2.bb b/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-frozenlist_1.6.2.bb
rename to meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
index 0a8c58e1da..7d813a026c 100644
--- a/meta-python/recipes-devtools/python/python3-frozenlist_1.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/frozenlist"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cf056e8e7a0a5477451af18b7b5aa98c"
 
-SRC_URI[sha256sum] = "effc641518696471cf4962e8e32050133bc1f7b2851ae8fd0cb8797dd70dc202"
+SRC_URI[sha256sum] = "2e310d81923c2437ea8670467121cc3e9b0f76d3043cc1d2331d56c7fb7a3a8f"
 
 inherit pypi python_setuptools_build_meta cython
 
-- 
2.39.5


