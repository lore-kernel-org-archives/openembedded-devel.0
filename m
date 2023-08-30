Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8556AC83F15
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 16:34:33 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.1891.1693413263123171167
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Aug 2023 09:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=jogOjlpJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-52a069edca6so7919936a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 09:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693413261; x=1694018061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yy/J4U2Xr/zIQHhmlOUChSZ4ZXU8ujrRdkb0X9wpt6E=;
        b=jogOjlpJXdnSJNPyjYll9Pp6AIC1A1t3Fv0MEoMQ6md0SDvwJ3PO8+ORwRW3m+p506
         boaAfR9Ev4vCXPpf5lXJaLKDA42Du3YupQHZ5/5eioLyWYYelcKyO1iVIjHFGd/4AupS
         ojzUXrU3+ivXnRwds/PWnQhKiMxoQMgo59Q0GZ+sTfCZ2W1z8MzoXd/rsjg0JLdTCzx2
         zFV8Da6smBC5NOOpzMTxNnvCdnviymMEM3rE9Rs0OzbeUdvpdb/08iRqQMjVD+GuoQEJ
         Qu2LLD8O6eDmchfwoVA7SG4WuYbz5fUQtEpf87NY0ScSyM/kmW4qMCe1Dq8+ucpYQAvR
         y0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693413261; x=1694018061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yy/J4U2Xr/zIQHhmlOUChSZ4ZXU8ujrRdkb0X9wpt6E=;
        b=W4vA02Up2JNbeq25sIeZOX5lhtv3ZSu8eTdCmcFwZj+I7R93/737ZU59fWhsEm4qch
         QBnEql1Rz/osOIEqwAgb3I9xL39IkPMpwe2HQ6waKW9Yqbrnf87YbHbYzHGhSRYA4c9L
         sMAbt2RawkyxP0sRgdaMjCvdRyRpGrGv5dy8Fc1QQ3KKJcptLIu6qjbDiFPe96ciP/Zd
         H+0KMVSGtgSfvWCDGPxoc1YMh6pNiNqOkgcKAPBS+mnthpsvbfeWIJae3eacqv/Sk653
         l9LBAFzEMxkk2du49CWeUi8Bxk3LXLPZ+hjeLhfz6Fbp2nSrYo237wMi636XfestVl0b
         Mb5Q==
X-Gm-Message-State: AOJu0YzyixBj5Xp+PfjhEQXk4nQimQ6H3GsGyIszYurit0HfmnQg8Oft
	yqs2lfeDJ4145EzgKoIv9RijqXKrdak=
X-Google-Smtp-Source: AGHT+IFYdIih0f9Z1e0IUGat4UUri/uEdgpTMX8KUH+EodMoGQfXXV1wIDiMF99ktCbPuOkPlkZbIw==
X-Received: by 2002:a17:906:846b:b0:9a1:f521:c3ff with SMTP id hx11-20020a170906846b00b009a1f521c3ffmr2328804ejc.40.1693413261336;
        Wed, 30 Aug 2023 09:34:21 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id u4-20020a170906108400b0099d798a6bb5sm7371394eju.67.2023.08.30.09.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 09:34:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] phodav: make sure systemd files are packaged correctly
Date: Wed, 30 Aug 2023 18:34:04 +0200
Message-ID: <20230830163404.3466695-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230830163404.3466695-1-Martin.Jansa@gmail.com>
References: <20230830163404.3466695-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 16:34:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104674

* fixes installed-vs-shipped QA issue with multilib:

ERROR: lib32-phodav-3.0-r0 do_package: QA Issue: lib32-phodav: Files/directories were installed but not shipped in any package:
  /usr/lib/systemd
  /usr/lib/systemd/system
  /usr/lib/systemd/system/spice-webdavd.service
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
lib32-phodav: 3 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/spice/phodav_3.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/spice/phodav_3.0.bb b/meta-networking/recipes-support/spice/phodav_3.0.bb
index 03e3caee27..990e017022 100644
--- a/meta-networking/recipes-support/spice/phodav_3.0.bb
+++ b/meta-networking/recipes-support/spice/phodav_3.0.bb
@@ -17,7 +17,9 @@ PACKAGECONFIG[avahi] = "-Davahi=enabled,-Davahi=disabled,avahi"
 
 inherit pkgconfig gnomebase gettext gtk-doc
 
+EXTRA_OEMESON += "-Dsystemdsystemunitdir=${systemd_system_unitdir}"
+
 SRC_URI = "https://download.gnome.org/sources/phodav/3.0/phodav-${PV}.tar.xz;name=archive"
 SRC_URI[archive.sha256sum] = "392ec2d06d50300dcff1ef269a2a985304e29bce3520002fca29f2edc1d138d1"
 
-FILES:${PN} += "${libdir}"
+FILES:${PN} += "${libdir} ${systemd_system_unitdir}"
-- 
2.42.0


