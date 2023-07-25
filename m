Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69883C001DF
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 14:16:14 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.21447.1690294565888422191
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jul 2023 07:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=rhV2/p0c;
 spf=pass (domain: baylibre.com, ip: 209.85.222.182, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7653bd3ff2fso584433885a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 07:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690294564; x=1690899364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2lizSwPbdMjHDk/QAX+06AwW5FpBJ2pMo6Ul8LhSrCg=;
        b=rhV2/p0ckWug6vbC3nH//TFmMnTRp8cknt3pszMJ0thwHjmmFoVFC9Bi5M8YfENHe4
         YppGGDzAcZH2M+2cn03qTvHbGkgDi3iCOfbLASPPybkeGEvayS7rBIKOyKEJIf/VF6T5
         eezZUPYDUr6Cwrxj9Z5vfXT2KS42KY9uYwAKBcnmIh+VehWhlpaK8UEAMTg23gNHK4hJ
         H8zfkqPRBNUprELVV7wSHNsxc6W8w7dZWVhZsRwoMqAE6VXaeGmF4wMrtywUShn1hKH7
         r7yQx7HfCe5rfsVJ3vYhw5PJfP3V/QkhTRY5KjWrqLg+UmHXADF73uaCJF92IGKeGCOd
         WWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690294564; x=1690899364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2lizSwPbdMjHDk/QAX+06AwW5FpBJ2pMo6Ul8LhSrCg=;
        b=RZgB9LsVDA40AiNdib0GDnDj1B2Z7pWobVf5sHX99GM0kshGDuxH6UNaB2xbipJZpc
         BPfzlAO2bhuW4j1Onwbsu3qZUJBpvHoBGuUklLUpk+/rhHUDc1+4pVRQ5BxcUb2LHOkW
         ZhI/vh4+8sw+uJ6h8I39HDS/2gwP6c7CJyux/HHasqWUaav6GMctH1MRTbEWHk9xXTIw
         Q9hNqy7QvOg+bCFLfZ7B6gOhgr7Idx76ye0rnoeRBIhJ0KBPTzIz0EhP8F6PfqbIih0K
         eYcHqgu6aHOkky+NdscHHDnJStNgpeqh7bhoSzTCrkWs2fkSY5d6apghK4Qeih+2fvYZ
         DW0w==
X-Gm-Message-State: ABy/qLYwNNBfTXfZrIsORz5n86pE0DY7PXh/o4Rkd3xvHCKQpBYtkQxy
	CZFU8Drm+4aeT2ADHBd/T6YStpgNKiRoKeWapXA=
X-Google-Smtp-Source: APBJJlEZ5bN1l0h+2hGlASTNPyQKrp458+pTbAWyR1h81csknF+5y7t6Iy6Bu4EpWFFThat75lQGXA==
X-Received: by 2002:ad4:57c6:0:b0:63d:218:c83f with SMTP id y6-20020ad457c6000000b0063d0218c83fmr2210609qvx.36.1690294564650;
        Tue, 25 Jul 2023 07:16:04 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id z27-20020a05620a101b00b0075b168fcde9sm3707399qkj.77.2023.07.25.07.16.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 07:16:04 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 5/5] python3-werkzeug: upgrade 2.2.3 -> 2.3.6
Date: Tue, 25 Jul 2023 10:15:59 -0400
Message-ID: <20230725141600.118138-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725141600.118138-1-tgamblin@baylibre.com>
References: <20230725141600.118138-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 14:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104016

Upstream states that the build backend is now flit, but inheriting
python_flit_core alone still causes the following error:

| ModuleNotFoundError: No module named 'setuptools'
|
| ERROR Backend 'setuptools.build_meta' is not available.

Instead, inherit python_setuptools_build_meta, which works OK.

Changelog: https://github.com/pallets/werkzeug/blob/main/CHANGES.rst

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../{python3-werkzeug_2.2.3.bb => python3-werkzeug_2.3.6.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_2.2.3.bb => python3-werkzeug_2.3.6.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_2.2.3.bb b/meta-python/recipes-devtools/python/python3-werkzeug_2.3.6.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-werkzeug_2.2.3.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_2.3.6.bb
index 5565fb4ead..11441fca2b 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_2.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_2.3.6.bb
@@ -12,9 +12,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
 PYPI_PACKAGE = "Werkzeug"
 
-SRC_URI[sha256sum] = "2e1ccc9417d4da358b9de6f174e3ac094391ea1d4fbef2d667865d819dfd0afe"
+SRC_URI[sha256sum] = "98c774df2f91b05550078891dee5f0eb0cb797a522c757a2452b9cee5b202330"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 CLEANBROKEN = "1"
 
-- 
2.41.0


