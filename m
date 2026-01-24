Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98992D715DC
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 06:30:23 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14208.1769236215454319085
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 22:30:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dmLlCDiJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4801eb2c0a5so28723415e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 22:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769236214; x=1769841014; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ou+N8oGGTQYF6EkO/AEKMGFyA75aH6UH6OzZcsxuT5A=;
        b=dmLlCDiJ00ujMOVDx1fBYXYkjHxyQsbkI2pBfEjpSWOb2vB5wTMvX+vyZ4exUn3GpU
         kZC7m3nMJJ8dFqst9cDwCJOZklPdTMR1OL4Lu8C7ANEpcPJBavcFk4hoZjLBJXPKFpCA
         nitWoLTvcJDG+6LK6FCTXwDK1J51vXddah5BaN4SazB5vxoJawXK8121lFgT+jCgMktT
         lSa5hM1daXoDQrtK2aJVaJZK19wj8997471ewv3Dsq8LsypdsZay+uUHCQ3Bee1m9ybv
         wv0s2NGP/jU6kmUCkdfl25uRrP80TMKK881LxxIp5HIBKx1LuRsDDM/2H+zSKKWIvp0K
         cZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769236214; x=1769841014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ou+N8oGGTQYF6EkO/AEKMGFyA75aH6UH6OzZcsxuT5A=;
        b=gDeA8+PS79+/wvIc58mymybpXXuZi63Q75DDTMKU3NDJxTj0eh3OMMzf7/KbO37dt+
         GFdvwnCcw7mkyjB5dOMEjhb/DaZwFHwS1q82F4dbEeqbrZiHEaePJCCdhDoWrATmpq6n
         ewBX0vFLB4EkQaSsAlbxslkU935xlkF8sZcDyvpRm4Rvb1h2vhy4GOrwqV4Ru2/+KaJN
         ou3j5JmrZ/AqL+S+fJdkVnikJO8jlpZTLBp/kfHqnHrvmM2Q6fIt2KjENH7fFEB0OUvF
         jd1oQTkhxuPtdQ3BOY0kHIzqYF20V+8hurLWNvMg5/5KzQVqoeHjI5bjLu2fuYg4q5Eb
         9XrQ==
X-Gm-Message-State: AOJu0YyC4CBxXrlPchepeDwK1TCCgukWB3Bf1gitpS8KzkTrtJdomeyf
	xJaoTI+Z+YmF8qDJFsfpsSeGUXUgfqMrkwuzfvK7ohgoAw0B5wN+sslj0xaFhw==
X-Gm-Gg: AZuq6aLk6AYvjgeL98cNEVKovyJa2VdlKDN+3c8tuCASCz8jJ6kdXFdjJiHqvaL2HY0
	0anlbNse73sz4N7GPwB9h67c0/gMuRP2mtsrMG/zz2OK1c6+Nk3xQVfL4bpK0S6hUBKOQBnyl18
	MxpSxhmcjEmhDHqAI3o7svTOAGiXrBNig1sMUwLfV2wqK1t8GIliodXMwPmwgwdjtdNg8Yvw+J2
	GI18AmNec8CKcbRU23nw0CtRLe79sWg9gNeKAK1svB01mA5hKpvVWhw3nQeG4q5sP8MmFytdn8M
	4WDhI8COTm2TY/V178gRngetYdR9+NMk9s+y9DxCZOLvuaXkCCU14svZx44BFRHBJj5jygYyPeT
	LteH0yoZegImjXB12CkrHpiywGc6x/2DsshmAzIhwX3cWcU/8nrTKP+Ny/sKpWWK1tZOMuACZ+7
	LThwtTN8rV
X-Received: by 2002:a05:600c:8b55:b0:471:1717:411 with SMTP id 5b1f17b1804b1-4804c9bcb67mr88005025e9.24.1769236213719;
        Fri, 23 Jan 2026 22:30:13 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48047028928sm265354385e9.2.2026.01.23.22.30.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 22:30:13 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 09/13] xrdp: patch CVE-2022-23483
Date: Sat, 24 Jan 2026 07:30:03 +0100
Message-ID: <20260124063007.28313-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124063007.28313-1-skandigraun@gmail.com>
References: <20260124063007.28313-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 06:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123815

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23483

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 8ffd8f29d5f055e390d4475c99f2d2c22f9797d9)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../xrdp/xrdp/CVE-2022-23483.patch            | 65 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23483.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23483.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23483.patch
new file mode 100644
index 0000000000..7172a8264c
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23483.patch
@@ -0,0 +1,65 @@
+From 35cca701c753db65d3c05b7ea4fff9bd09e76661 Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Wed, 7 Dec 2022 10:21:41 +0000
+Subject: [PATCH] CVE-2022-23483
+
+Sanitise channel data being passed from application
+
+Avoids OOB read if the size field is incorrect.
+
+CVE: CVE-2022-23483
+Upstream-Status: Backport [https://github.com/neutrinolabs/xrdp/commit/35cca701c753db65d3c05b7ea4fff9bd09e76661]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+
+---
+ xrdp/xrdp_mm.c | 33 +++++++++++++++++++++------------
+ 1 file changed, 21 insertions(+), 12 deletions(-)
+
+diff --git a/xrdp/xrdp_mm.c b/xrdp/xrdp_mm.c
+index 74b0516afa..64ae229e01 100644
+--- a/xrdp/xrdp_mm.c
++++ b/xrdp/xrdp_mm.c
+@@ -676,22 +676,31 @@ xrdp_mm_trans_send_channel_setup(struct xrdp_mm *self, struct trans *trans)
+ static int
+ xrdp_mm_trans_process_channel_data(struct xrdp_mm *self, struct stream *s)
+ {
+-    int size;
+-    int total_size;
++    unsigned int size;
++    unsigned int total_size;
+     int chan_id;
+     int chan_flags;
+-    int rv;
+-
+-    in_uint16_le(s, chan_id);
+-    in_uint16_le(s, chan_flags);
+-    in_uint16_le(s, size);
+-    in_uint32_le(s, total_size);
+-    rv = 0;
++    int rv = 0;
+ 
+-    if (rv == 0)
++    if (!s_check_rem_and_log(s, 10, "Reading channel data header"))
++    {
++        rv = 1;
++    }
++    else
+     {
+-        rv = libxrdp_send_to_channel(self->wm->session, chan_id, s->p, size, total_size,
+-                                     chan_flags);
++        in_uint16_le(s, chan_id);
++        in_uint16_le(s, chan_flags);
++        in_uint16_le(s, size);
++        in_uint32_le(s, total_size);
++        if (!s_check_rem_and_log(s, size, "Reading channel data data"))
++        {
++            rv = 1;
++        }
++        else
++        {
++            rv = libxrdp_send_to_channel(self->wm->session, chan_id,
++                                         s->p, size, total_size, chan_flags);
++        }
+     }
+ 
+     return rv;
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
index 0faf664f61..f8fd052e7f 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://CVE-2022-23480-2.patch \
            file://CVE-2022-23481.patch \
            file://CVE-2022-23482.patch \
+           file://CVE-2022-23483.patch \
            "
 
 SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"

