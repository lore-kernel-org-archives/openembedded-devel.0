Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8888BC4321E
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:27 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.23277.1668873500241349036
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qXYTsIXD;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id c8so5325044qvn.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yAryUioNbyMnwh7gVsA+4ObQ9c9gU6gd9Z1NRu/El3M=;
        b=qXYTsIXD8gB/iIX4dyxqavtZIvp4q/T1aKI/KT23Y4U7GbicpecdGhV5GqER1oD3Rd
         Uh2E2wsXaT+edihm/KE4gzVKrqs00DSotSj5ZEU8/EOSNK0h/gVyvyHvAtwxIlIYEAky
         FzzzDRUfjWjKyAhBHJ7quzxHhP2oUiZkTIw7P/hEu4GvOVsWuiI4W2nnkn8QkiwRp3hf
         GhQRHsLBJXnBaU4IVdFZMIjVYkF12gtM89wcnqk/y9N6Xa4EFEh8VO0OJrCPNCpucn8N
         aNQAL/Gci6NPdVEBmkZ8aX4fKg2wbrrPfkz7xs4uzxivgbRZI5x6C4xRAf5gCzeH4CyM
         9P8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yAryUioNbyMnwh7gVsA+4ObQ9c9gU6gd9Z1NRu/El3M=;
        b=ylZo1oyB17PVd9GpMvlYixv8q9infkNJ1u77qTDfa4BZSdrIrJ9We8yDUmlQLiblox
         OjFBeHtE6GEl/TwAsymM3pnT8IpAX/ptXYyB95OBsdhYR3LOegIVtzE0YXY/ZMH1kxBd
         wy0z1c3OY3AYfHAQwFiquZY0KQXpj3K5V0UJCN+DWWAPjYrKmJ1+zC2g39hkSmuk+Izp
         ShsWH2p94tsLh+TslYVOSy3tz1MicxcKkFRo5xYqh096Z9B4G4FouvGARAvBFWb/zQOy
         qQrIriiFeccmUcSnqZ6EcaubAa8Du+6R5Zzs2kze1qloj/0wen9w92lbOaCcB/ziV6lH
         0nPQ==
X-Gm-Message-State: ANoB5pl0P1zlVte4ykW97pFanhIOwBFd0WPagaobv2f6D8pSQYt4gubx
	sghOdDePLx2VNeyud5HzXRF/2mupb3KCOg==
X-Google-Smtp-Source: AA0mqf53UlxE40PINYtWEH3aTE0UBnp5FeVPo9L2+tMKt0pV8BeLfn5PevB0b1s56ywCi+57MBxZkw==
X-Received: by 2002:a05:6214:209:b0:4bb:6bbd:8c1b with SMTP id i9-20020a056214020900b004bb6bbd8c1bmr11319862qvt.111.1668873498758;
        Sat, 19 Nov 2022 07:58:18 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:17 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 12/35] python3-charset-normalizer: upgrade 2.1.1 -> 3.0.0
Date: Sat, 19 Nov 2022 10:57:36 -0500
Message-Id: <d0b790a91a52909ff98d4906c8f346438f0f9c6f.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99651

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Added

    Extend the capability of explain=True when cp_isolation contains at most two entries (min one), will log in details of the Mess-detector results
    Support for alternative language frequency set in charset_normalizer.assets.FREQUENCIES
    Add parameter language_threshold in from_bytes, from_path and from_fp to adjust the minimum expected coherence ratio
    normalizer --version now specify if current version provide extra speedup (meaning mypyc compilation whl)

Changed

    Build with static metadata using 'build' frontend
    Make the language detection stricter
    Optional: Module md.py can be compiled using Mypyc to provide an extra speedup up to 4x faster than v2.1

Fixed

    CLI with opt --normalize fail when using full path for files
    TooManyAccentuatedPlugin induce false positive on the mess detection when too few alpha character have been fed to it
    Sphinx warnings when generating the documentation

Removed

    Coherence detector no longer return 'Simple English' instead return 'English'
    Coherence detector no longer return 'Classical Chinese' instead return 'Chinese'
    Breaking: Method first() and best() from CharsetMatch
    UTF-7 will no longer appear as "detected" without a recognized SIG/mark (is unreliable/conflict with ASCII)
    Breaking: Class aliases CharsetDetector, CharsetDoctor, CharsetNormalizerMatch and CharsetNormalizerMatches
    Breaking: Top-level function normalize
    Breaking: Properties chaos_secondary_pass, coherence_non_latin and w_counter from CharsetMatch
    Support for the backport unicodedata2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 577bc31a0a425a47396fa5344affb4c8411200c0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...-normalizer_2.1.1.bb => python3-charset-normalizer_3.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-charset-normalizer_2.1.1.bb => python3-charset-normalizer_3.0.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer_2.1.1.bb b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.0.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-charset-normalizer_2.1.1.bb
rename to meta-python/recipes-devtools/python/python3-charset-normalizer_3.0.0.bb
index 1ab72e53d1..895f88a62e 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ousret/charset_normalizer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0974a390827087287db39928f7c524b5"
 
-SRC_URI[sha256sum] = "5a3d016c7c547f69d6f81fb0db9449ce888b418b5b9952cc5e6e66843e9dd845"
+SRC_URI[sha256sum] = "b27d10ad15740b45fd55f76e6901a4391e6dca3917ef48ecdcf17edf6e00d770"
 
 inherit pypi setuptools3
 
-- 
2.25.1


