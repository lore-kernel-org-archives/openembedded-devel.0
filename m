Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57BA2D3B9A0
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 15:12:33 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.48330.1732633946367772973
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Nov 2024 07:12:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=paIFyytk;
 spf=pass (domain: konsulko.com, ip: 209.85.167.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53dd9e853ccso3722194e87.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 07:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1732633944; x=1733238744; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mo+otxvsW1W++zp2kGVBKRSLVrHQbms8+9JgTnAlOQU=;
        b=paIFyytkwofGdHTi6vVY/Ffnmph/JMv+r6Yf+rEfYJXO362yIYJDENyGeWreHnJCXa
         K977TLH+vaOFaw0eE4CZ913EUl8vnEtgCDEovhTEL/al8PM5fxX9SvT7lyaF9sovTXNc
         UxqYTk9ijC458LaC4NncCvPbsu0pzHi15AMjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732633944; x=1733238744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mo+otxvsW1W++zp2kGVBKRSLVrHQbms8+9JgTnAlOQU=;
        b=sGSn5bBArI0ydQ8oD40OkUrf4YW9Qj+3o9gPhbHcBw+duSGl3V9AlWOiqmhlTVGKXC
         l0/ZJT4pMSXyGBToH9bLaNWkgJ/RMT5V81KUvidBK39v9zfDomm7lIfKW4YNJjIB2axN
         HLtoHtcCP5ZlkRRyZhomQvAooJekUPDy7pQFAg0MKrntqqpB18SlO6vQWY7pCEMM5HhG
         SxuRSM/Hnyhd8iMHEKl4Dsbs3ZndrE6h+il8ttCqLWdxnrMlYqMQiQIdE7lpmFUK0bRZ
         aJmYHCC6468zULzW+5dhBL704ucBhExUl/Sl0djf0ThBIy4PTlumSc0/wfiawa6e+bot
         7eWw==
X-Gm-Message-State: AOJu0Yyj9V9RWelSfdvSpAY6NwdUYnelQ+R8OCkFieqFjlSIuoUm7RS0
	fdAmA7NHI1IOFln3BsHwOBxyAtJp8C86dYQJh/uZrdMCPeMsMKyxOXygq/Yb7wuxnWwVDyPpS9s
	b
X-Gm-Gg: ASbGnctf2VYLrwuISSxZsUwmjXENqd08oTs0ecWgUvTjgEtLsOOlO5sse9jdKmlP9I/
	BIXWjUdulowgmj92DbpkoVv0stMB9gxbTBhUlI4HsPREnjNC9Dgg22zbSAlvZTAeie6zZGrB71s
	F7l8Ph/jsvWjiWFszx6UWK76ndubBgtwEdKZOorfbERX83co3TfiPW3A2utbzGxT6QVG0mZPs4W
	AJfjVYE+dzf6aK0qZsrPF0MQAtlt8O12QptLA26GeX+6NvKv1czGpnX4RGm5MCL
X-Google-Smtp-Source: AGHT+IG6kqiI5/joEGvewuPyUzUNdRdzk4Fdd6Fvv9eL2Evhb+jmw/JI1glYk7BG77B9s/j6+HKVVg==
X-Received: by 2002:a19:e042:0:b0:53d:d605:f91c with SMTP id 2adb3069b0e04-53dd605fcf1mr5976188e87.2.1732633914312;
        Tue, 26 Nov 2024 07:11:54 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbedad6sm13499791f8f.91.2024.11.26.07.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 07:11:53 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-bitarray: Upgrade 2.9.3 -> 3.0.0
Date: Tue, 26 Nov 2024 17:11:49 +0200
Message-Id: <20241126151150.95784-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241126151150.95784-1-leon.anavi@konsulko.com>
References: <20241126151150.95784-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 15:12:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114074

Upgrade to version 3.0.0:

- Remove Python 2.7 support
- .decode() now returns iterator (equivalent to past .iterdecode())
- .search() now returns iterator (equivalent to past .itersearch())
- Remove .iterdecode() and .itersearch()
- Remove util.rindex(), use .index(..., right=1) instead,
  deprecated since 2.9
- Remove util.make_endian(), use bitarray(..., endian=...) instead,
  deprecated since 2.9
- Remove hackish support for bitarray() handling unpickling

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bitarray_2.9.3.bb => python3-bitarray_3.0.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.9.3.bb => python3-bitarray_3.0.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.9.3.bb b/meta-python/recipes-devtools/python/python3-bitarray_3.0.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.9.3.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_3.0.0.bb
index c19307cc93..c2a7e770d6 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.9.3.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_3.0.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "9eff55cf189b0c37ba97156a00d640eb7392db58a8049be6f26ff2712b93fa89"
+SRC_URI[sha256sum] = "a2083dc20f0d828a7cdf7a16b20dae56aab0f43dc4f347a3b3039f6577992b03"
 
 inherit setuptools3 pypi
 
-- 
2.39.5


