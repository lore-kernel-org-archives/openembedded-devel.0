Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7572EC76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 18:58:51 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.52988.1681153122607584755
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 11:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=P1q2DJ/d;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-94a34a14a54so143862566b.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 11:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681153121; x=1683745121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r10PaH+mABbNHFJjo5h/YTMoNhGvAmpd9lCWbi4gfVA=;
        b=P1q2DJ/dqBqpqmt0emTVntDz9FKveknsEJRPnmjYRdlacAxjVmtv/NoSYRA5cNHnvX
         Ox/UhGok645uTdjjtlA8JA1oBVg3rB/Wwn1YNe+Q65gE5+1Fhxvd2aSlxjO4FVsWppXT
         N6ymvtUDQAHrsHuCOaSp31Okpmg2JPkkA6q/fRXhv5CiNDhUhE2eLSgEjFDnV6A23Rmp
         /jG/Ct8dFhhxsOqnxBJ7YcLcaglqBBcJvQlY4NiWMn9v/UiWo60uhqMZk0Jcg8lC7IRW
         MKB8UDhQESVvjDCVvihYFgZm/dT/0yUwZoJwMK2+hUbS3PODha1yKmwqHxNgwFdTExc7
         MyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681153121; x=1683745121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r10PaH+mABbNHFJjo5h/YTMoNhGvAmpd9lCWbi4gfVA=;
        b=47XEBhQRGTshz+71Lquws9rYjpt4rXPJcc9crFkcxNuwi+hnWb859E/Z8rB2tlMHg+
         4ypXSQgSFjPTTA5uChhLIZiL9MVQ2K96QZ+5pHZRRG4owV/exyXvwbRSswbjxj/JX+6w
         57ysuEvqaVox++Fwp+KQn6K3LNttKooBbAwWuaJU7QNwwCe/03D0EDqBvWTyDSv/ZMFq
         J0QWhCfrjtv7vcD+4cD1ue+s1lYM0XPC5Nk8C72AeFoXFACqk+AaJAvizT9kinqg5gCI
         14UDZdYfT9VhNp4/jjLd95uc4adAWWOqksZF9tn1jfE0wOLlt8BSGXgZvTIMNZV6qW5Q
         iCog==
X-Gm-Message-State: AAQBX9ekBSU1uPW/Fj4d+cWJc0hbc4nEc933MxpYjwKsV6Qt2VOaLQh/
	3hDozBuMX2586td8u1fV2rsyjqap/wA=
X-Google-Smtp-Source: AKy350a1Al3XkT0yEuOpU+fW5bo6p4RAerflisaWQP8WhA7cZfZmBjdj1hP2Dqz+wF17gX/0U5J0Xg==
X-Received: by 2002:a50:ee06:0:b0:502:2a76:5781 with SMTP id g6-20020a50ee06000000b005022a765781mr10353053eds.5.1681153121051;
        Mon, 10 Apr 2023 11:58:41 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id co2-20020a0564020c0200b005049297c5d4sm2345131edb.56.2023.04.10.11.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 11:58:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 8/9] lirc: fix do_install with multilib
Date: Mon, 10 Apr 2023 20:58:18 +0200
Message-Id: <20230410185819.2416704-8-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410185819.2416704-1-Martin.Jansa@gmail.com>
References: <20230410185819.2416704-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 18:58:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102050

* use ${S} instead of ${WORKDIR}/${PN}-${PV}
  and ${BP} instead of ${PN}-${PV}
  to fix build with multilib, where PN is lib32-lirc, but S is correctly set
  as ${WORKDIR}/${BP} and do_install fails with:
  mkdir: cannot create directory ‘lib32-lirc/0.10.1-r0/lib32-lirc-0.10.1/python-pkg/dist/’: No such file or directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
index fe9685924b..226543bbd8 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
@@ -49,9 +49,9 @@ do_configure:append() {
 
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


