Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D43D6C77B7D
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 17:40:20 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.6.1684172411339847201
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 May 2023 10:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ad2UPjFc;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3063891d61aso12504857f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 May 2023 10:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684172410; x=1686764410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/vyPiZzQYOq5WxMOHgSM5h8oseC0LVWE7DFrl+fiTOI=;
        b=ad2UPjFclHeCp4LfBZ0OhWab7g/ndYCUwIlQXx4pwmifNSeVN/8aDP7w9xYfkK3CXo
         5wHkmGU7r4QnqtC0Ynwlv+30mmpml/7jZKAlFSyLC2wgqP5Ygm4AAWiYbNqonq+3n9Cg
         RD4Snmzyw77Uu4gcVDpThN4qQGNYu5CJuhbgFB8a+W2qK8Eaa5zhBio0Qk8OvM7Vb11Q
         ZiDDA3j0YYXqvcWVjGmgZispqYytoFYR4Vqrq4Mwve3IKuSUCiNjiG6JvStKBlDTw+i9
         O1b0xe1o5fbk5erbCUJacKvWR5ljkoc7DNKHJxwXThG+zGSxYDeNlsS4zkl3yEh1/0Fr
         Rmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684172410; x=1686764410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/vyPiZzQYOq5WxMOHgSM5h8oseC0LVWE7DFrl+fiTOI=;
        b=GLFEbM0Egx23+RXz6YMh8aCwFUY4hXQRMCa51qQ4qQt+3LJzTG3duCI0FeXbaeC64o
         TrTzkObz0czE3cAyLKOm08V9KEfaqnssyg064AVW9yiCoTO0jj36fCOa2a/BK/+e6ipt
         TQwsUZYEdsyfmo35ymYBRQGSCI4h/5TFbxNyLAUViRxs26OZ2cXcv0wTmw+9F/EsPS6t
         tuOG9olIIvlo/76EedoA4iGov6oDMommb6reIJQE4gUE3YCALHO8vD1jAoX5K1EQgYw1
         Q5vHqZl+4DUVgcHci1IS9o2DdMRW5eJkgn9AEJ0rqn2Wwq2naX1P/c5Jb+WibkO1c2dE
         p8Cg==
X-Gm-Message-State: AC+VfDyFlLT/j16qBKHExrzL87wwDOM91kUFUqNT+N2/AHH2NlVnSl68
	K9795r9x+sc/Yl4yU/V6bXQoerp8wME=
X-Google-Smtp-Source: ACHHUZ4Jf1HN5ozELyrIVVlecfovRzTdk6v0q4I9GWh7YqGZMODiBzna/+MFIVIs/cy7luY7nhl7vA==
X-Received: by 2002:a5d:4f8c:0:b0:2f8:f3da:72cf with SMTP id d12-20020a5d4f8c000000b002f8f3da72cfmr25541584wru.18.1684172409483;
        Mon, 15 May 2023 10:40:09 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a13-20020adff7cd000000b0030632833e74sm458377wrq.11.2023.05.15.10.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 10:40:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] etcd: don't hardcode /usr/lib in do_install
Date: Mon, 15 May 2023 19:40:03 +0200
Message-Id: <20230515174003.2096033-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 May 2023 17:40:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102607

* I don't know anything about etcd including why we need these binaries duplicated
  in libdir and bindir, but use ${libdir} instead of hardcoded /usr/lib to fix
  do_install with multilib enabled when libdir is /usr/lib64 and it was failing
  with:
  DEBUG: Executing shell function do_install
  ls: cannot access 'etcd/3.5.7-r0/build/bin/linux_arm64/': No such file or directory
  install: cannot stat 'etcd/3.5.7-r0/image/usr/lib/go/src/go.etcd.io/etcd/v3/bin/etcd': No such file or directory
  WARNING: exit code 1 from a shell command.

* the error from ls is unrelated, fixed in:
  https://lists.openembedded.org/g/openembedded-core/message/181269

* also reported on github:
  https://github.com/openembedded/meta-openembedded/pull/616

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/etcd/etcd_3.5.7.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb b/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb
index 9a8b9861f2..0794158a52 100644
--- a/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb
+++ b/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb
@@ -59,9 +59,9 @@ SYSTEMD_SERVICE:${PN}:append = " etcd.service etcd-new.service etcd-new.path"
 
 do_install:append() {
     install -d ${D}${bindir}/
-    install -m 0755 ${D}/usr/lib/go/src/go.etcd.io/etcd/v3/bin/etcd ${D}${bindir}
-    install -m 0755 ${D}/usr/lib/go/src/go.etcd.io/etcd/v3/bin/etcdctl ${D}${bindir}
-    install -m 0755 ${D}/usr/lib/go/src/go.etcd.io/etcd/v3/bin/etcdutl ${D}${bindir}
+    install -m 0755 ${D}${libdir}/go/src/go.etcd.io/etcd/v3/bin/etcd ${D}${bindir}
+    install -m 0755 ${D}${libdir}/go/src/go.etcd.io/etcd/v3/bin/etcdctl ${D}${bindir}
+    install -m 0755 ${D}${libdir}/go/src/go.etcd.io/etcd/v3/bin/etcdutl ${D}${bindir}
     install -m 0644 ${WORKDIR}/etcd-existing.conf -D -t ${D}${sysconfdir}/etcd.d
     install -d ${D}${systemd_system_unitdir}
     install -m 0644 ${WORKDIR}/etcd.service ${D}${systemd_system_unitdir}/
-- 
2.40.1


