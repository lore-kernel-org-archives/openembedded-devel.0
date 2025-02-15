Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A66BC021A0
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 18:39:28 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.14910.1739644759941823552
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Feb 2025 10:39:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=leVyXR0r;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so32812045e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Feb 2025 10:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739644758; x=1740249558; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TToX4tpoSBK36OvgqKwIwPyvI/8AvGK9QSSNYdW2XZY=;
        b=leVyXR0rkUM0sA70LRQi4RSvyvJcOCLteY1BnixgCkTMzsDmirno4+1yIBcYn2ekkU
         7JYZzrxj0BQlUsgFxJDdphrXaAzQNCJezLseKlsUNBxgG07SRB9lt/AEOPdSPbJGvgCG
         LQOt+mbh53elvWZ//URbt73g2ZgYVrMhr0rXQIPsTKXMf33RhNCATSw9W0bjJSpCFSEp
         7nAZTu65s6RBad05vPKDlStVszYh4c9lRRC8GB+QAGC3WYWn2kUfFS0aE31eUltSHqhq
         oT8sDW/QPUU+o0esmsIo03xklZBYesZJPHbyafCrCCmixce2r1d6OdF2m/L/4RQ/XqcN
         hVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739644758; x=1740249558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TToX4tpoSBK36OvgqKwIwPyvI/8AvGK9QSSNYdW2XZY=;
        b=kopzuUZhBJuUDx5zry+EZV5yRHMRQ/ZBnJmTLo8x2p/p0lSpTMGOd4dPwft6vnHii6
         AK+Zc9KtkpFLrge4iGLXRHuHS/cQE+TX4u3NHkOQ2QV/f/5CUC+epB4aYZwP+ya7EnoW
         J+vKGNj0SVnbYF5cOLiZnNItXW2WO06P2lP6bLyqk/etnEF3nFm9Kul9EbbNlrEOvWIy
         yqM9UFBJqLzjJsaYbRhti10tFisyLhsLv1BwklBJ2LmCcktqsHs4gI98xuJMOa7q30qy
         yzFPvhSNtblmTg9Wy8hU1jHonL77etODK/X0raPSMgy+jhaCFw4YHIqiTfnCCknS9EOh
         9OpQ==
X-Gm-Message-State: AOJu0Yw8QLjra8YbjQp2NNc/XgVNl4ev4TPf7lGEkHhWZXUxHQkTAtZS
	cTLVJwlMGVV5gBCfZ57pvuw26hGC6F4Pil6SlYRP0phRtMnMygafCe9CRQ==
X-Gm-Gg: ASbGncuZq72/3E8nw/HeFbzkDimpddZLCASV8fTs80SU1Qv8MgLR8Lp8+otvIPlSan0
	vmZkwRgxUkGMS/evTiz4jgnS10ngoG6cmSdxQsbVj3kekE043ffhO0m1tfN+QmEB7Z0O2tKi3uE
	m8P9IP/bsUsH1ZlhR8geE1P2b2624c1TZWBOPl/tNjaCu+sRR/pmg1Ca2XrzVlNu9h8SgM9Y/rM
	3+tn40JGeal3KuqKWjONOP+wvPEBshrza7DVsJL3vLowQGzf5h/idwtCo57HPevMprlDrjl1QAe
	i078e9OfFyWZUmJZhYAFHc1x1FaAx6I=
X-Google-Smtp-Source: AGHT+IHgfFh8c5xRre6WusXe69JwyyyxWIHayxKlt4Y44TtLI8T2VgqZkuO/qks/erbiitS/5QCSzQ==
X-Received: by 2002:a05:600c:46cc:b0:439:5b4d:2b2e with SMTP id 5b1f17b1804b1-4396e7458f8mr37272185e9.19.1739644757778;
        Sat, 15 Feb 2025 10:39:17 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4396b296afesm32898645e9.0.2025.02.15.10.39.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 10:39:17 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] nmap: add missing dependency
Date: Sat, 15 Feb 2025 19:39:16 +0100
Message-ID: <20250215183916.715718-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Feb 2025 18:39:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115497

Building with ndiff PACKAGECONFIG failed with the following error:

|   File "/yocto/sandbox/build/tmp/work/cortexa53-poky-linux/nmap/7.95/nmap-7.95/ndiff/setup.py", line 11, in <module>
|     import setuptools.command.install
| ModuleNotFoundError: No module named 'setuptools'

Fix it by adding the missing dependency.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-security/nmap/nmap_7.95.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/nmap/nmap_7.95.bb b/meta-oe/recipes-security/nmap/nmap_7.95.bb
index f165e47bf5..f3775f24b0 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.95.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.95.bb
@@ -27,7 +27,7 @@ PACKAGECONFIG[libz] = "--with-libz=${STAGING_LIBDIR}/.., --without-libz, zlib, z
 #disable/enable packages
 PACKAGECONFIG[nping] = ",--without-nping,"
 PACKAGECONFIG[ncat] = ",--without-ncat,"
-PACKAGECONFIG[ndiff] = "--with-ndiff=yes,--without-ndiff,python3"
+PACKAGECONFIG[ndiff] = "--with-ndiff=yes,--without-ndiff,python3 python3-setuptools-native"
 PACKAGECONFIG[update] = ",--without-nmap-update,"
 
 EXTRA_OECONF = "--with-libdnet=included --with-liblinear=included --without-subversion --with-liblua=included"

