Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62381C41513
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 14:16:14 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web11.21444.1690294564875180430
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jul 2023 07:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=vJ44SJZk;
 spf=pass (domain: baylibre.com, ip: 209.85.210.44, mailfrom: tgamblin@baylibre.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6b9c9944da8so4588826a34.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 07:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690294564; x=1690899364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJFRi0ppw42H7scz93Kv+1JDWIE5RWUNmxHIhxG6QmY=;
        b=vJ44SJZkA1nNgWpTfc1vnzPSSmsymKyCWeBVbZ9slTK3GN57bofBOr0jja5a1ZNkpN
         PvoIepbGA1LSRMBSyCu/oQfVzWilH0m79ZLQf1VcfoiDRVysPrSkN/hDs/GrHRgCMz/x
         NyOPVTYGbTIVsMTS3H0CAQ4dTupRntOaUul/JGoDGuB0rl48ZbG52tAFcK0d/XaFDCbj
         fPqbkzLhNR+PFhwFGw02ueLwQ/unkBpw22OXN/g9RtvP02ClGizUJU7xI3Li0MGoxQLF
         yoKx/zfuZ77WzbnlsRPkKzWZ8QJ3R7vR97nW0HqfyWk9mT9jcsNNrj7erdNw93/1PlpD
         4KXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690294564; x=1690899364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJFRi0ppw42H7scz93Kv+1JDWIE5RWUNmxHIhxG6QmY=;
        b=Y6hxrFLibQNZtT0SPG4Wv5APxFcOSjee7sqqlrjuszqm++6MShJLhU+zZBw/58+inu
         OpMhCAUw4dDG88Q7RhTnS+0zVwK7OtgGyIAcWzHKA5vhaEpkroo+m55opijp/k1FI+CG
         0CmOQg4kyZGFQH3YVKnQIgYiAfnsyPMzhn0EgsEZOJuLOTzBrN1CjLxBfSMYoE+4hqoh
         jA6B2Gn42QL3qPYqilmyMprEcUy4gwjH6PsnjWtC1DGbTSUJT4OvAMJ96iC54ZY5BjI/
         DbnrQsEE3dI/ZJbyyrcjc/xEUw0SYNLRUAKVeVnL41zTDIgIXfmRtw2QS5XXahGZJH0F
         FMQA==
X-Gm-Message-State: ABy/qLZVa/Ex17wbFMj/PoXq2XeL5njzKJzui+SOtPgglfVT1tpG1xNx
	TXJuIndAvZDKwn36hnDQtogVGdiOkSdo8hHfirQ=
X-Google-Smtp-Source: APBJJlGesNWOxOXu1hPJK4aBmbuHJG2BPqK7TCegW7Y97RKVomo8oZWljeqMDeaQlwD7QG6kxqhykA==
X-Received: by 2002:a05:6870:b6a9:b0:177:ad57:cb36 with SMTP id cy41-20020a056870b6a900b00177ad57cb36mr14196163oab.27.1690294563245;
        Tue, 25 Jul 2023 07:16:03 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id z27-20020a05620a101b00b0075b168fcde9sm3707399qkj.77.2023.07.25.07.16.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 07:16:02 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 3/5] python3-sh: upgrade 1.14.3 -> 2.0.4
Date: Tue, 25 Jul 2023 10:15:57 -0400
Message-ID: <20230725141600.118138-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725141600.118138-1-tgamblin@baylibre.com>
References: <20230725141600.118138-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 14:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104014

- The project uses poetry now, so inherit python_poetry_core
- Add python3-asyncio and python3-compression to RDEPENDS

Changelog (https://github.com/amoffat/sh/blob/develop/CHANGELOG.md):

2.0.4 - 5/13/22

- Allow ok_code to be used with fg #665
- Make sure new_group never creates a new session #675

2.0.2 / 2.0.3 (misversioned) - 2/13/22

- Performance regression when using a generator with _in #650
- Adding test support for python 3.11

2.0.0 - 2/9/22

- Executed commands now return a unicode string by default
- Removed magical module-like execution contexts #636
- Added basic asyncio support via _async
- Dropped support for Python < 3.8
- Bumped default tty size to more standard (24, 80)
- First argument being a RunningCommand no longer automatically passes it as stdin
- RunningCommand.__eq__ no longer has the side effect of executing the command #518
- _tee now supports both "err" and "out" #215
- Removed the builtin override cd link
- Altered process launching model to behave more expectedly #495
- Bugfix where _no_out isn't allowed with _iter="err" #638
- Allow keyword arguments to have a list of values #529

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3-sh_1.14.3.bb => python3-sh_2.0.4.bb}    | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sh_1.14.3.bb => python3-sh_2.0.4.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-sh_1.14.3.bb b/meta-python/recipes-devtools/python/python3-sh_2.0.4.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-sh_1.14.3.bb
rename to meta-python/recipes-devtools/python/python3-sh_2.0.4.bb
index 317f648dcd..fa9f97a8f9 100644
--- a/meta-python/recipes-devtools/python/python3-sh_1.14.3.bb
+++ b/meta-python/recipes-devtools/python/python3-sh_2.0.4.bb
@@ -3,14 +3,16 @@ HOMEPAGE = "https://github.com/amoffat/sh"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5317094292296f03405f59ae5f6544b6"
 
-SRC_URI[sha256sum] = "e4045b6c732d9ce75d571c79f5ac2234edd9ae4f5fa9d59b09705082bdca18c7"
+SRC_URI[sha256sum] = "a18920f0839991bc9dfddb6dcc006c360b1064ba96257359f0ea356e9fa75a60"
 
 PYPI_PACKAGE = "sh"
 
-inherit pypi setuptools3
+inherit pypi python_poetry_core
 
 RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-asyncio \
     ${PYTHON_PN}-codecs \
+    ${PYTHON_PN}-compression \
     ${PYTHON_PN}-core \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-logging \
-- 
2.41.0


