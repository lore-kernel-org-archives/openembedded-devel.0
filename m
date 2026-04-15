Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AEEFF4210F
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 18:03:19 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.486.1776273608866918687
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 10:20:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wbinvd.org header.s=wbinvd header.b=buZcXXk0;
 spf=pass (domain: wbinvd.org, ip: 209.85.222.178, mailfrom: calvin@wbinvd.org)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8d933da14f0so745034085a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 10:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1776273608; x=1776878408; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tHs/awCAxZ1buMonH3q8JGVtV0oCNdbgLF706RacOYc=;
        b=buZcXXk0y3x9h2busaGcNJOuuWEBG1tM1+StQ742zHQG15DO/S51e8l5Wd9dcpP+5r
         vyKbcgqLFu1gh3wXZfriF0Rga8JXrs00SumAQ4joL5onpORqM8QSpCTiQIsydadiJI72
         IHqi8ymMJJywOgVHtw7NmylXUn1PBq4UyVD9nf0Wd4jvkkJitCQWXb17ogCKVjq4MI62
         jZ6dBM31orpU6ZmDvjAwtxzZ9469+Ksm8bD9qF4SxFtHrhiHSQbWZCJLyuN7FsznQ2JS
         qNRAFjoFRHxVXwpgAQFnBsbGKJXMRGJ+MIFe0jvstseVZyju56K+8WiiNkyBE2eyGy4y
         hWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776273608; x=1776878408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tHs/awCAxZ1buMonH3q8JGVtV0oCNdbgLF706RacOYc=;
        b=J1BrglVik74TtXxkowI1zlZgvlgJNU39T+ubenMGY7bYG/Jr3JBpCwU3TJV9rj01jy
         It9gOHo+LbdQNYFO22cmgHxNTkuDYATM6dmMv0ofBJpjujDS0ZGbA8GEN8woglKwb1lJ
         /5J8kIcrxwX3YwSPvBfHZb9xC2+IX1GaHRRpMjKt+ij2r+DCZhyJqn/XJL1ON6DwT5Wr
         nyZdI7sP4Xnz7PrQkr0+V8JHHg4QhAVUYIIpqHDOLYPZkQ6+4iTMR9jCYHbtEpq3PdOg
         jA0QyE32hpJHqPbszlnvORBuzNB8AxF1kOkQSLlWbZzE2/E6hWnLXH/1u+L3/OBroVTL
         GsHA==
X-Gm-Message-State: AOJu0YzlmXkATdRrAKToG116ff6qPrpSX5HBn5CtIkj3PugyV/RgUvk7
	QKzMdts66pRDKBG5CTL7T+6czUIn/SiTPmc8D/+L1UV+pdFIi97DaJJpy0gjcfK+k90CiRKHrjZ
	vxKCN
X-Gm-Gg: AeBDievtJARic28GKhebW2yRT2AyYHPdN600x7wb6Ok0KQ4Xj0Sbc65yYisl8PgOiVl
	kT4eUdbLVWy+KVlqZNhxAjuy+A/2uCIsV5JbZGyrYZiadOcwfoMps87P75TN/sRrMVKZj7wW9L1
	qhGhjaxwOoxXXR1lfas3JsPW8KSjYuBa/nQYxXJmqnFa6Mf1fjwNDz1Me4OTjCJvmGPAShvFzfX
	qjzfzOUFP139tkxZsTEATgB7E4UoGfz+wY8xynXZtH8uqoIb2VwLR8504zC2Gc585FzZqTqcQCo
	PSRmyLMNDgk8Tr/1AXCsT2nbbl+EcGcaTRHQ8eF1j/pARAH6QMV3LHaDxwkjozgeEH4e7BLZL8j
	+j3oca/aYCR2CqhRgLluyKXGzyGcCWr+h2HZofD3jp64P14s5I2y77nBPg+ZQL3iIHLbhyH63x7
	Oy1ebHZ7r0YmM/kHnr8c8hcdMoDXJgpZxBM2f8
X-Received: by 2002:a05:7022:798:b0:12a:b932:8221 with SMTP id a92af1059eb24-12c34e3eafcmr13852273c88.5.1776273298032;
        Wed, 15 Apr 2026 10:14:58 -0700 (PDT)
Received: from mozart.vkv.me ([2001:5a8:468b:d015:4408:1d89:c0da:7de7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e61db6bsm2702673c88.1.2026.04.15.10.14.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 10:14:57 -0700 (PDT)
From: Calvin Owens <calvin@wbinvd.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH] xfdesktop: Add missing DEPENDS on libyaml
Date: Wed, 15 Apr 2026 10:14:51 -0700
Message-ID: <738943f29220562812d094f17d12860aee0d78d1.1776273174.git.calvin@wbinvd.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 18:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126367

The build fails like this:

    Run-time dependency yaml-0.1 found: NO (tried pkgconfig)
    ../sources/xfdesktop-4.20.1/meson.build:63:10: ERROR: Dependency "yaml-0.1" not found, tried pkgconfig

Fix the failure by adding the missing dependency.

Signed-off-by: Calvin Owens <calvin@wbinvd.org>
---
 meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.1.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.1.bb
index d16a9e6446..5cd0213951 100644
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.1.bb
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.1.bb
@@ -13,6 +13,7 @@ DEPENDS = " \
     libxfce4ui \
     libxfce4util \
     libxfce4windowing \
+    libyaml \
     thunar \
     xfconf \
 "
-- 
2.47.3


