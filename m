Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D759C77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 18:57:31 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.52930.1681153046903409536
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 11:57:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=YAfAAAcQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-94a34d3812dso144108766b.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 11:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681153045; x=1683745045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TbG9qWauBw3ah20YlP08TOwf/nyBeds+ITuOxhJYndg=;
        b=YAfAAAcQtwbXH27BY4kVRc9WCPSe568B56OZTljg+WC62ceJRbMSatrwa1x8cqv05R
         qgMLI0puuxr2/H9ZLHaFEA9Kn8wwUOYkmySfB0xtXtH5GcgUhgewNrcCZ2THmqQvObei
         EgFHMVW2kTYjuPIp0PxsuXtJzi0rzlWR9KjwwvpEVrHrD8QOPvRKXA+iLUdmJQYNgobW
         qUvOyPL9WoDEJ+NrAuBMTUbermP7ZPNT5HCE0jzuHQxHmojtV8S8nkpaxdD5/r5+637M
         Dy2RLRUlUBKyO+Cgr626G0CrMfVeEv6SxeUdVgvN7cpt5XNzMLMQpovsUhiCOJlN9xLX
         UqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681153045; x=1683745045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TbG9qWauBw3ah20YlP08TOwf/nyBeds+ITuOxhJYndg=;
        b=H0g7L0lXvgujE0y0kGnX4t7bngO1A6CD9SAbWXgU0iSgJoyJSSc3YUq7XLv9JB2YtI
         n+Uh4BVDZW4FxB2/v5qLKR3nyMj2dnL4rhRQHNNqNmgM69PLQ1bY1XakHJgCtRopQ/6I
         sYRfRLb6LKZbr9DdAPnGEGeZj4Pok7Hj3As9dzChi1BstIEIg4vXlPjpqtwGFCnEa0Vh
         bXWFbWtX+fUpQvPNWmN3/FjNsZI67nnbLefPS2kjISIaQfP6RLKCFh3KNyYoN6jyULS7
         bQ7Uevy+mE1Fl5Lfd4asVTpMp1j1r6+MsculuDf3/8UP16KohNs40fZ8csZJicXC8lvr
         OAMw==
X-Gm-Message-State: AAQBX9dZkeEsdo3WOFY/F8wKzSr7jvorERJY3au+wZXdRBZPLK3gP6D7
	i19PpazQgEW1tT/TqDelg9WjARjdbuA=
X-Google-Smtp-Source: AKy350bB+F3zRY3OCYcUvVEAPHaQTnj6VDbcXd1JLG8kdfw5jUu/9+PwghhrX9mTkMCe3ejW8YIWtQ==
X-Received: by 2002:aa7:c642:0:b0:504:b313:5898 with SMTP id z2-20020aa7c642000000b00504b3135898mr2084885edr.27.1681153045332;
        Mon, 10 Apr 2023 11:57:25 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id d7-20020a50cd47000000b00504a263c08fsm1336427edj.66.2023.04.10.11.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 11:57:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] lirc: fix do_install with multilib
Date: Mon, 10 Apr 2023 20:57:08 +0200
Message-Id: <20230410185708.2416472-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410185708.2416472-1-Martin.Jansa@gmail.com>
References: <20230410185708.2416472-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 18:57:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102035

* use ${S} instead of ${WORKDIR}/${PN}-${PV}
  and ${BP} instead of ${PN}-${PV}
  to fix build with multilib, where PN is lib32-lirc, but S is correctly set
  as ${WORKDIR}/${BP} and do_install fails with:
  mkdir: cannot create directory ‘lib32-lirc/0.10.1-r0/lib32-lirc-0.10.1/python-pkg/dist/’: No such file or directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
index 88e3f0486b..fcb347a2e5 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
@@ -51,9 +51,9 @@ do_configure:append() {
 
 # Create PYTHON_TARBALL which LIRC needs for install-nodist_pkgdataDATA
 do_install:prepend() {
-    rm -rf ${WORKDIR}/${PN}-${PV}/python-pkg/dist/
-    mkdir ${WORKDIR}/${PN}-${PV}/python-pkg/dist/
-    tar --exclude='${WORKDIR}/${PN}-${PV}/python-pkg/*' -czf ${WORKDIR}/${PN}-${PV}/python-pkg/dist/${PN}-${PV}.tar.gz ${S}
+    rm -rf ${S}/python-pkg/dist/
+    mkdir ${S}/python-pkg/dist/
+    tar --exclude='${S}/python-pkg/*' -czf ${S}/python-pkg/dist/${BP}.tar.gz ${S}
 }
 
 # In code, path to python is a variable that is replaced with path to native version of it
-- 
2.40.0


