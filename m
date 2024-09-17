Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B947CC35FF8
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 08:50:57 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.16585.1726563054669222134
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Sep 2024 01:50:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hl0Zk6Ue;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8d0d82e76aso894293866b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 01:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726563052; x=1727167852; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kCEXmJvJ9txqUUepWrArQ9CuC9Mxc4zKfem7WZicgWw=;
        b=hl0Zk6UeBCFtN7+37i8jbXT0kerL8zoTuaYRAoC/lwEYdPXZIu+HiHUXvXMYljjVVU
         ZXWsPSjryTjqoZ9kda/KKazFhHaUjpp8SDZ+KJ2II4Tqbi9SpSM+kLGF0CP1NEmaJlZ2
         C16EOcfxtxu5NP76zorAKyq1zMZ0E9LZ8wT+tXmi3HDaoXs+m1Oda4Z8hsBmqa3E0B02
         zfYCJktEKIgBZxyH92dkomkKybhPNa4pNtMZ6Di65A10n86wzmR+dtTbBdUyL7kwZdrE
         nh9qAXacs6ucljAfPTBxKM2kyK2VJRq4Wl7mCOfOdNDn/gczKQUyUUVgROSCzjFLiRH9
         qzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726563052; x=1727167852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kCEXmJvJ9txqUUepWrArQ9CuC9Mxc4zKfem7WZicgWw=;
        b=YqqP5alnBB5jd4BfYUXpsZ90H4/qsvLz2qf5N3DEcgydfSaIF+FOWMXg13cS2Rvyqd
         pe921z2TKrSmNuuR3qVI5cbfXbSb+Bc85JKVvra5DEIt3BrKYe8w8HOpOLeGeNfepzDJ
         KS2Nz2B5NnP984xL8shIfwoo/m1KLMTm8W0+FiegYdN15CAmTw1cDk7mtxNQdcStF+nI
         gSyscqvl3HQ09tCQ6zj6s4v8t8NJxSecS0dsgpXG6PH9h0WSdBIV/amPuhcFvoHczZ2k
         AVFOUycsXT9blEy+t9vyROTSCFc3ndoWM8Natv+hq5H4BRSp71VxwQOlNgxg/Vxl0qKK
         eoUw==
X-Gm-Message-State: AOJu0YxCBDrER3kmhG9GVZ9KdDvDnRPr1I4S0zwObJ/o9mMp6DRcLegw
	Lw8w/jzmCrjR1TrJKhwVJGnNkPhlKxOyT4sSFk9np0KReBXyzmlHKXbQUtU7
X-Google-Smtp-Source: AGHT+IGRa0rhXMurpXD7iUTORllFpAby1U0fQFl0TTDZ27YS7aPi+O9uGIDbejFtqjK8LFiA05XsEA==
X-Received: by 2002:a17:906:f5a7:b0:a86:a56a:3596 with SMTP id a640c23a62f3a-a9029678cbemr2047365166b.60.1726563052017;
        Tue, 17 Sep 2024 01:50:52 -0700 (PDT)
Received: from localhost.localdomain ([176.33.71.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610f451csm417842466b.58.2024.09.17.01.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 01:50:51 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-msgpack: upgrade 1.0.8 -> 1.1.0
Date: Tue, 17 Sep 2024 11:50:43 +0300
Message-Id: <20240917085043.405793-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 08:50:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112339

Full Changelog: https://github.com/msgpack/msgpack-python/compare/v1.0.8...v1.1.0

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../{python3-msgpack_1.0.8.bb => python3-msgpack_1.1.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-msgpack_1.0.8.bb => python3-msgpack_1.1.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-msgpack_1.0.8.bb b/meta-python/recipes-devtools/python/python3-msgpack_1.1.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-msgpack_1.0.8.bb
rename to meta-python/recipes-devtools/python/python3-msgpack_1.1.0.bb
index a000737f4..eb04dc2e0 100644
--- a/meta-python/recipes-devtools/python/python3-msgpack_1.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-msgpack_1.1.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "MessagePack (de)serializer"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
 
-inherit pypi setuptools3 ptest
+inherit pypi python_setuptools_build_meta ptest
 
-SRC_URI[sha256sum] = "95c02b0e27e706e48d0e5426d1710ca78e0f0628d6e89d5b5a5b91a5f12274f3"
+SRC_URI[sha256sum] = "dd432ccc2c72b914e4cb77afce64aab761c1137cc698be3984eee260bcb2896e"
 
 RDEPENDS:${PN}:class-target += "\
     python3-io \
-- 
2.25.1


