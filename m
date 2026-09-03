Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFADDC624A4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 09:21:23 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3444.1788427274111231572
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 02:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=s+b9HFfF;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso22322355e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 02:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1788427272; x=1789032072; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pc/tP4gFM0twPUwPWCPbgQjKDz2S3oIxoi7WaHG66ZA=;
        b=s+b9HFfFAURLwq8mbHRJydmbLQ7QwGo2uWfUY+700QUgOwoiqeoi1MinbLqk0oljCA
         Lt00NhWcehwBAeNLuGveREwLv0HtBUAxIG1+igI90lcu0SnyKL9HjVz82KVIUAKS9Qbw
         c6mF6Rn+Vp0ynj6kHYBFD4tzWbnNcxXcMBujk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427272; x=1789032072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pc/tP4gFM0twPUwPWCPbgQjKDz2S3oIxoi7WaHG66ZA=;
        b=kz2qQ19ee6NooD3+YeAuv3pYX0jkyP5Ttb2p2wYnzibT0QQjPntTzB/eiQ/TX5XmD8
         PzmCF1HPviNgWdDqrVaMB+lZTCPRO+f2QI0A7NLsSgu5SoS2lbt6dhhya/E3faZPmGAc
         ko+LuV+60naa7E13wc2VVWHaGlbdZ7KVSdtcqkoZm1MELUVXm173mlwzitGM+A9fdzmd
         hLHvaBtcqFCyc/sI16BtfQ06r0HeY2ydhycKV1aQ4mcUp4RPoOYaIsDWc6EYOvEVKhha
         RTzuURHg8VJkq64Fk2CwOGANiWg4n766ZKS399ogkm7QhoFl8NB4QGTTRukPqWZr72Sd
         ng2g==
X-Gm-Message-State: AFuF++luYZ5u7gF+yPPPHyOuh+RRu7PAUuUSiBj+WV6mTYAGhP7B+gvJ
	IdrAXqO/w5kD35B48vtHdF1XPPIpie2j8f5TkKsOwGW37e69YFegVBQQ+tIOFb5h1Uinm3OUR2d
	70J/b
X-Gm-Gg: AYBFou0aCGoEhDUQhtzytP2ROJCHG0SLuel7pJrf+m7gFN+vKRMFcCaAC8xHU1PkDcC
	9lde1Q+rX+bR2ngg3XHNZtf4DV2IwOboacCfCfrxmieq3S6Kmpt49ixEkFualQwkyBdYNDTI0eE
	+PK2RDFkI7MhEDx6u/FN6BaV+MIObkcFq25DqKKzE1lzUcmjpy+e3IWTK1qFyOtr7QJIyhmfi3f
	iMF6KBT9MnRRZYJIYMvf9StZSAVawnzexqSaDS4n5oE3Gh/0xqL5ZeayEbnFRNr2MhuYv8CuEUk
	tpkRQ5GOsHzBBYtUxIkPgnnz+d5cgwdKgnwS8QWEJByGT2svsivkW6LV9epbuzM0GodJt8emXIz
	DEQiG1vGTSR2f3sEkGKusfOgzyVHfC+rwa1HWu2Uj/HO968HvAHWK1WDseU2wi2MwdGzrAFTMto
	V7HK+i98eFoxQDRuv7//W3LWT12RBSP6hWjNYzxNJoIrHGI6FNoxKTVikZsKgDm3QUsOGncADtM
	caXzSukfxU17BFRq6q9JF/t//hfILqgfpLeSU9eyXEj02ebpVDwey+1vGqprv5A8LPj7daflIpS
	BSg1dPgkItiuxQ==
X-Received: by 2002:a05:600c:699b:b0:49b:9205:45b3 with SMTP id 5b1f17b1804b1-49ce584c6femr195275775e9.15.1788427272137;
        Thu, 03 Sep 2026 02:21:12 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d2019sm55305085e9.2.2026.09.03.02.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:21:11 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-virtualenv: Upgrade 21.7.7 -> 21.7.8
Date: Thu,  3 Sep 2026 12:21:07 +0300
Message-ID: <20260903092109.1641069-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 09:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129714

Upgrade to release 21.7.8:

- A missing source needed by both install modes now disables the
  builtin creator through meta.error. The check compared RefWhen
  values against RefMust members, so creation went on to fail with
  a FileNotFoundError or a dangling symlink

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-virtualenv_21.7.7.bb => python3-virtualenv_21.7.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_21.7.7.bb => python3-virtualenv_21.7.8.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.7.7.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.7.8.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-virtualenv_21.7.7.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_21.7.8.bb
index 036ad8bde8..820db11d71 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.7.7.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.7.8.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "6874376f99ba6b8d4e3ee8bde67f9285412400c7d5b29ba41ee6daa5e0221bdc"
+SRC_URI[sha256sum] = "1dc49c790072a9072cb1803f9bd62aa69cd583077cada32390f75505cdc64c9b"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.47.3


