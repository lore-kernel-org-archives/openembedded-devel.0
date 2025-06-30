Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A324DC8302F
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:27 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.35165.1751274796239666538
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=pH+gPnaU;
 spf=pass (domain: konsulko.com, ip: 209.85.208.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60c60f7eeaaso7056667a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Jun 2025 02:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1751274794; x=1751879594; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1meCUh7O5Tf5z4+IOlCVOKfgOdSLv25ViBs0oz8w5Og=;
        b=pH+gPnaU0hGsjpAVaeQzhlxp1zyWgE/T27t2XoZ9et7mcaRWkbfdqVFkptGMwQO+M5
         VvQI7CwxVJYCXArCZ586HJzCZayh2KxT+kMK/uSJdr4002BqedJLjS2GsVpESNd5oAe0
         Y4YpKZ6X+EDpnlgpUzz6ARC654PSKX/d66/Cs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751274794; x=1751879594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1meCUh7O5Tf5z4+IOlCVOKfgOdSLv25ViBs0oz8w5Og=;
        b=EpVWYyiuYRsWiM8ud6y999Sy1R8MuXN/q6uShv8yqOg0yuZTw1KT+HzZbTzC9k9Dmq
         0/ruxASDUBLP1zsER41WVzkf+cZWdjcw7AZRBo8AO9odHo4A+vKgXPFPioqmAgwBmIg/
         DgM+uJmleJVWdWUdn4VhZsbjVR+98w0F/ces3q7w3B7WkPwtf7do/uR+M9Ut6xI4dvnV
         4PSiWODN4kXoo7Or3wyV3c97WpX9CUlpEVoq42RhOdtylRMN64+Ao76+mK13adp3a7cD
         FgK16nAZght1F/SD9G3j9FpqBu0URCXLZ7e+gE1lFu2/HjOZ9GOCpqhQHzsYEhbZroT0
         NeNA==
X-Gm-Message-State: AOJu0YwI4RIPVE96lqCDSXR0jS6xkrLbrxlRztKANCt1UdIBThUEv4lY
	4WvW7GWVGk8q7g/Voxjq7mfR0CJuMPh8rfjI7p5D0IXSU8dKNHq0PkP8iMKKZZuG+vvjboE7JN3
	djExe
X-Gm-Gg: ASbGncv11XuCfozdQLrVgqALIDutZYcswKkj4e/vYqcuNC9k43lyweII+U11j9kjf9W
	STXQtOLjtk5Zzu9hAYyXFrI1c7Zzdz38fv7ttjj6Vw+ID0y/+XUC5eL6/NHcvK+XhW6Ws2mSYbW
	uikbcmLr8mMhh0uxpfXrc7BYAUqZbnUvt+tinWP5U6LM71TutUiOStzQ4tw36Zc5lfkpP05iO8l
	94/+dB5VTnDKRbj9amNY1TMfQmBLj/V+D0NBsRvORoTiV8HrImi8DCGlzDWeyi70xgftMRQYBpO
	gI+Ta8d542o7/huBu/Om4o1wNH364amZYKrrqQebaHu1UKEHna4sJdXW4ocSfV9tJ+0VUoaBogE
	g
X-Google-Smtp-Source: AGHT+IEcUc6c+DNR6H7w3pENqlF/tXyNI1/kFpDM+RnjkcDld3b5l4XqIjmVWwwP9RKvYWGy3YiwHQ==
X-Received: by 2002:a05:6402:27cf:b0:607:ec18:9410 with SMTP id 4fb4d7f45d1cf-60c88b389bamr11178262a12.3.1751274793848;
        Mon, 30 Jun 2025 02:13:13 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8290eaefsm5478268a12.34.2025.06.30.02.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 02:13:13 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-bitarray: Upgrade 3.4.2 -> 3.4.3
Date: Mon, 30 Jun 2025 12:13:09 +0300
Message-Id: <20250630091310.3785059-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250630091310.3785059-1-leon.anavi@konsulko.com>
References: <20250630091310.3785059-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118169

Upgrade to release 3.4.3:

- minor updates to documentation

C-level:

- simplify and speedup `extend_unicode01()`
- customize `resize_lite()` - avoid unused code
- use `PyTypeObject` for bitarray type object in `_util.c` to be
  consistent with `_bitarray.c`
- add and improve comments to implementation of sparse bitarray
  compression
- simplify `sc_count()`

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bitarray_3.4.2.bb => python3-bitarray_3.4.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_3.4.2.bb => python3-bitarray_3.4.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_3.4.2.bb b/meta-python/recipes-devtools/python/python3-bitarray_3.4.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-bitarray_3.4.2.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_3.4.3.bb
index f78901f140..b7da117451 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_3.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_3.4.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=6abe80c028e4ee53045a33ae807c64fd"
 
-SRC_URI[sha256sum] = "78ed2b911aabede3a31e3329b1de8abdc8104bd5e0545184ddbd9c7f668f4059"
+SRC_URI[sha256sum] = "dddfb2bf086b66aec1c0110dc46642b7161f587a6441cfe74da9e323975f62f0"
 
 inherit python_setuptools_build_meta pypi
 
-- 
2.39.5


