Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E28C982C1
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 06:56:28 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33793.1789628179092204623
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2026 23:56:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KDqgyrAD;
 spf=pass (domain: gmail.com, ip: 74.125.225.76, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f88so285868f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Sep 2026 23:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789628177; x=1790232977; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LXHPtam0gT94FB3+w6lJ1qE5N9U0aY7ZChPCjhga70M=;
        b=KDqgyrADgvK9yUq7bIgrKxrdlgps4MeHnLSBhiR6nxzLWEZzP/azs5JgO/CgV8f9OJ
         Oc9PpeM5H//0zcC51PqwhOHIVHqNAOQXqlXXJL0FmSKSVS/TbqYchXTenqjiAR1s4OuE
         6zwRP//+HRtbEnjrYmmjIwvSJPZLwdtgy3/xB9F4eQ2LCIjjdrOD8cfuAuhcFXps9xKO
         ZUBExMInlZgTKuTSI+UVUMAO+qsS05TzoYCk7vqO8jfThjXNY8iMxDPfD2xbTknL7Q6D
         yMrOi42kx4wGUYQ9NY5xL4eNgy5wyUEdW2dI5rWh8ko5XSdyWr5T4uCaEudtb/PlULBm
         G2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789628177; x=1790232977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LXHPtam0gT94FB3+w6lJ1qE5N9U0aY7ZChPCjhga70M=;
        b=aPxe5zO/EqODg8GYtMjiRZ3M/8ki/mh8fkk+SobMFkxY0A0bi2q9ZWoI+M2ysdSC3z
         u5VtwWhl5EgJtcU8NyAQ9J6nElpXMhdVokNS9ZavxS0+7d1MRoj5ld4WNM3pxd4EwaPE
         TzLK8L6tdoDyLfOYgDILa5L8B+AXMGeR04bkzpec94KEnqgb08WAYD0EpkP+l9TYktoQ
         5zhd96k4c6g+6p+6fK3XgpvpJdf1kH5fgdbRVSGMpVs/tG4FjoaLb1SzbD7x3Z7X082H
         yJzzvBCPKd2aXENE+CPORhVQNI63yc+41yKMbbmwxIJOsUUfnDOfD1wj6u9JVz9QWg0R
         pM0Q==
X-Gm-Message-State: AFuF++npkXff/+K7+6Ikf9C/xvV9jnrubL9WKru1r57y64pI1eTkcFNF
	GZQsTt++7RVKkZW08bztvhBMbhLiiUW/0S5mRXha+Guirem6ORGJNdAIS7TpKg==
X-Gm-Gg: AYBFou2zESoqKxlK5UHt+PrhnXUdS8JarfgEe0yNwipfIzwZVgy/s2VQQnThCJ6g4kj
	Z+Uwjwg3HBAosQVQiok0wah3nmd0YjXPcXNFOIOKemybNL+Ur8lQTQ9h01KuHHTngkDKMlUecIy
	EL5vyP7O3h3tcvt8hNtUcynMlxb7IDSNX6POmQSCtZ2lRVdbid+T2/3MZNmh5lQeMLx0ALWKyfL
	SiX1S4dvccci4xDdGBtxtCPMH7croK+8CxDVqCbv985SiQWnpM7CYQaatZXeqrKfk+wtN/aog/4
	go5mAPhQq6p4rZMIkvVpfdz4bLc3dltp/w5+XkzdObiIsVZQmJIGLyut9v+97/4T/M3KRJhSBTT
	/3u5P/kalmnCTb/D1oSbtLM7cHMIdamKvpVBWgXQQ0vZ+G4DePEGvk477tbaJUJufO8RZ9aGIBx
	AU6uJSk3JGyumJfFweriRh+M/4ZALS0yR2iSodtiuFZ3liOAAgCgH8ALN7HbOKynUr26cO0QYYq
	oHB8vaXQb9Uzh4/6V9ep4zST5BeQObquuAvM4tM6O5Wsw4ZKg==
X-Received: by 2002:a5d:588e:0:b0:487:981:4df7 with SMTP id ffacd0b85a97d-4870cf35c5fmr6618669f8f.25.1789628177170;
        Wed, 16 Sep 2026 23:56:17 -0700 (PDT)
Received: from dld58y9k4-lin.dl.net ([2a02:b025:16:1ad9:9601:365e:f209:6455])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf43511sm12156433f8f.33.2026.09.16.23.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 23:56:16 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <locutusofborg@debian.org>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] vboxguestdrivers: Upgrade to 7.2.18
Date: Thu, 17 Sep 2026 08:56:13 +0200
Message-ID: <20260917065613.246828-1-locutusofborg@debian.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 06:56:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130092

Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
---
 .../{vboxguestdrivers_7.2.16.bb => vboxguestdrivers_7.2.18.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_7.2.16.bb => vboxguestdrivers_7.2.18.bb} (98%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.16.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.18.bb
similarity index 98%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.16.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.18.bb
index f12270680c..d9ec825c74 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.16.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.18.bb
@@ -24,7 +24,7 @@ SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
     file://Makefile.utils \
     file://0001-vboxvideo-let-the-build-decide-if-drm_fb_helper_alloc.patch \
 "
-SRC_URI[sha256sum] = "50356ccdaefe8f03537600ec31898b506e3a85ce79b94f26fb6cc1920c9e18eb"
+SRC_URI[sha256sum] = "06db4060caadc70346335c0a731ca6667cdabf206de289c64f3f96f2d341b9d0"
 
 S ?= "${UNPACKDIR}/vbox_module"
 S:task-unpack = "${UNPACKDIR}/${VBOX_NAME}"
-- 
2.43.0


