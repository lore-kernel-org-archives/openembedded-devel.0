Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD95C77B70
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 14:06:55 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.8804.1680876411789064545
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Apr 2023 07:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=WIflCoO5;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-4fa3ca4090fso2087156a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 07:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680876410; x=1683468410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITUp3TQAw7OBT9mRwJ3lRN6U8KXl78yJHyC7ptMu3Jo=;
        b=WIflCoO5eWDma3TW0XKRD81rpleXqINuPQd8PlrS59i5kG0kD/ROLtRPztVp90JeVn
         hJ9yEevcFfHAHoWnrxaTE8zTYFYVwWqPJs2ritx0GmIZkWicxuPLUpxBFUokmqiFc+pw
         rL6yIRBrUypFCQneaTw72Brifb2qk/3xJuMUcbbeQFCUHOuNw9EBU6oTZIonajLkgXSK
         EwnYdTLXpksdD4hZDR2uBPGPmQHTv1kGikWBtuS+y1oMFpmXJczn2bMimwfHOFKRpWNa
         s0IExnnBUpoR2+huDdkv7GNrKFtspaFP610g7VDpNJCnDXFkk0Oix590yoCzZ/wA37AN
         xj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680876410; x=1683468410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ITUp3TQAw7OBT9mRwJ3lRN6U8KXl78yJHyC7ptMu3Jo=;
        b=NFH2XqqE2BnlkfaU+ckUHPDe0eWYU+QWpfuKgcWQGE5F0lHFiI56C+65mroMvSCyrM
         4+fhQRkoUkIP9qtDKC/AjIrjlwCLxuUkubYBMzN4xxH4km/BOOvUhj42E7XgBkEne95j
         Byzcf5lZr2ZTgt7Ck+ogWLW86cKbF5NUDWsH1sL1CvhBcCQ3YubJd1bkcVm5Tmz+fmy2
         AV6FbL7T5ki0XrTTAUOhwkd3IYdXMUQp/1nFO1JNcjS8/m/jxjTB/knFcdPwMBgGflyA
         Xl/0TH389GRZiu+lg7kBvRlYItvd9/5aTanErIpWvpv1/eXafckJhn1csG2IvgrJNFRb
         GMQA==
X-Gm-Message-State: AAQBX9eWgdaZj8CEiFV7wiUWqpsoNtjkJBWugYOrlgHmJj1OOli42tqr
	PEaiRVGKPh65dfCKu87Yak49MWqZ5Yw=
X-Google-Smtp-Source: AKy350bpvYKJsfx4pp0IcIXR/x21v/SiNFMMprwcw4XichjM9auGKsokQsdj5Oh/ZpractKm2W9fkQ==
X-Received: by 2002:a05:6402:289:b0:504:7f60:9f6d with SMTP id l9-20020a056402028900b005047f609f6dmr1067865edv.9.1680876410075;
        Fri, 07 Apr 2023 07:06:50 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id x9-20020a50d609000000b004fce9ff4830sm1921641edi.88.2023.04.07.07.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 07:06:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] mongodb: fix chown user for multilib builds
Date: Fri,  7 Apr 2023 16:06:38 +0200
Message-Id: <20230407140638.2359718-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230407140638.2359718-1-Martin.Jansa@gmail.com>
References: <20230407140638.2359718-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 14:06:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101986

* the user is named mongodb (BPN) and in multilib builds this fails with:
  chown: invalid user: 'lib32-mongodb:lib32-mongodb'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 7b85bdddab..550fbc30d3 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -127,7 +127,7 @@ scons_do_install() {
 
     # install mongo data folder
     install -m 755 -d ${D}${localstatedir}/lib/${BPN}
-    chown ${PN}:${PN} ${D}${localstatedir}/lib/${BPN}
+    chown ${BPN}:${BPN} ${D}${localstatedir}/lib/${BPN}
 
     # Create /var/log/mongodb in runtime.
     if [ "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}" ]; then
-- 
2.40.0


