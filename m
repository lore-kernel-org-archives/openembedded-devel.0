Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB77E7BDB0
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 12:30:02 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18396.1771244999988992116
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Feb 2026 04:30:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=CsC8ziBJ;
 spf=pass (domain: konsulko.com, ip: 209.85.221.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4362507f0feso2041490f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 04:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771244998; x=1771849798; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t4ndL5IygUN85ZC3lZJuKGvUCgKqfMaS8/Byyi7qrTU=;
        b=CsC8ziBJAIC5XKf4vokLu1L2t/X6ngJNVtVOyGUCD1CtZ9Rf4HRLeAOY464xwFYfoU
         7wyJ8KLMz6XrBvjHtZo17sOqHHtM7DU/JKGJc4Ji+2zwZpuv1srEKj10Bmy66+8fSFim
         xKRtmpNZ8atX2MJfrWL7y/Lu1/+BKI3kDIO6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771244998; x=1771849798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4ndL5IygUN85ZC3lZJuKGvUCgKqfMaS8/Byyi7qrTU=;
        b=CDP+8Nh+tZ6TPTUSlKv/2ahVxuuKeP1V3/sT8hCxBv4PywifGEHhGHM4LsZlCuRjTu
         hDw30hdA3YsgE9VlclgUY8q/uILSb7RhksI8mKbiilsetOsoMjriRxTWmq0h3GsoO0Ai
         axEfqLVHB2nfolIU5+ggJkWWUn1gWFjGonfobxttlVRS2qD+rHQmx53wpZAoQLVAcmUx
         GhEgLNfo0zTLe9/F+lkSQiW7d38fJPJeTmkmuZ5nDXYYM5YTV0y4d+WZKhgScE/xyuvU
         mu/INBSEorNQ//kzbYh6GMj/bJ2ZN8sJh9SknvqqlRTaiSEUCWIMdOMtwrsnZm/DW08B
         QMuw==
X-Gm-Message-State: AOJu0YzcTZ7yqqbauynBPQYXJRDFuHv4gwm9738sdlnsWYTe9a+INOvQ
	coVEw14EzHc28Z2Tqs/93xvwwAb+fCXQYKlT3IA5KTCwQny3WeM/cFP+nZrSmj+t8Z4onRCHefj
	OdDC0
X-Gm-Gg: AZuq6aJ+UF3DcDLVuqmvRjNp+AIfDiaGq/m/fg1VRw0xU84FTQBCelvwtaotmqe23D/
	Lw7epI/lt2Lyc/wPAqF502QlMzvJa76zvEPb/aRJWIyThaAYganpKmk1pqgz7vwU610sQfM/nnA
	9Nmxv/3sU0i9ZhkEwK+6Z7WpAaRbGROw5v+r7JkU3ohrPz7KpLWPOgfnwjeMjjhZrHJVGUd9BeG
	BWdp6/bn1EjszcduBGadzFQLVBZYyaGRDr3Ol2Q4Dz0nKlfEXT/4pBjXwDWkmaiw3zLaG/V23/0
	9iMRS/N9Xa03AUWlf0G6rNTAJTF8Zntl0j1h6Z5W0wIzZGL4ExgXLUJbjkIWxA3/V+5xnY7CCHW
	voQeXP/KF/JWabhLzaCogICgo9n/mXgdK/PKej7m55l2Pr5oxLkIbIW8XmILryLGbbDeK73eFyu
	49vxzTpn163eqdjt949qv7000J2onez8EU0KS9
X-Received: by 2002:a05:600c:37c6:b0:475:de12:d3b5 with SMTP id 5b1f17b1804b1-483710960dcmr179545405e9.34.1771244997547;
        Mon, 16 Feb 2026 04:29:57 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dcfafcdsm664423415e9.9.2026.02.16.04.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 04:29:57 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-typeguard: Upgrade 4.4.4 -> 4.5.0
Date: Mon, 16 Feb 2026 14:29:51 +0200
Message-ID: <20260216122955.2642743-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 12:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124418

Upgrade to release 4.5.0:

- Restored the check_argument_types() and check_return_type()
  functions that were dropped in v3.0.0, for users who want more
  fine-grained control over run-time type checking
- Added support for extra_items in TypedDict, allowing users to
  specify the types for the values of "leftover" keys in a typed
  dict (keys that weren't explicitly defined in the TypedDict subclass)
- Fixed NameError when evaluating forward references on Python 3.14
- Fixed protocol check incorrectly rejecting inherited classmethods
  and staticmethods
- Fixed missing TypeCheckError when checking TypedDict with
  Required[...] annotations
- Fixed type aliases (e.g. type Foo = list[int]) not being resolved
  during type checking
- Fixed type-checked assignments to a single tuple target
  (e.g. x, = ("foo",)) falsely raising TypeCheckedError

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-typeguard_4.4.4.bb => python3-typeguard_4.5.0.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_4.4.4.bb => python3-typeguard_4.5.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_4.4.4.bb b/meta-python/recipes-devtools/python/python3-typeguard_4.5.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-typeguard_4.4.4.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_4.5.0.bb
index 812288881d..e294e3e701 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_4.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_4.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
 
-SRC_URI[sha256sum] = "3a7fd2dffb705d4d0efaed4306a704c89b9dee850b688f060a8b1615a79e5f74"
+SRC_URI[sha256sum] = "749bea21cdb2553e12831bc29f1eae980b22c7de8331ab67ae7db9e85470b5a7"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
@@ -12,6 +12,7 @@ RDEPENDS:${PN} += " \
     python3-compression \
     python3-unittest \
     python3-typing-extensions \
+    python3-json \
 "
 
 RDEPENDS:${PN}-ptest += " \
-- 
2.47.3


