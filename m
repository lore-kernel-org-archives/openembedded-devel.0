Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD569C54E41
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 19:14:37 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.5790.1709147669721141441
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Feb 2024 11:14:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HuoZkxRE;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-563cb3ba9daso178914a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Feb 2024 11:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709147668; x=1709752468; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fKPLKmu0vcoRaicHvZtixNIou3ChWturt3XwCGnBqeg=;
        b=HuoZkxRE0a1rVPVhZemrvAbAn6NGdsIEqRqbuVk8xp8jE0jLvC/L/qoA2bGUcLOqtY
         hUYubWj99y6skFiWlKrQb0y0iABQZYTwlgsXiVGs0PO5wOGLJUtyaytANn4uGK3lKrat
         kZyvjeKxjdkzgjIYQjNA8NscItnxZEvxjIWNqIJ6usWicRK53O/8Jfu2OOpe9Q95aMjU
         nyRdGlpEIr72oKxTo06WcD2P2jBkmDvg+X/qspi38kv4Dz1VjY2DVFIbKjB9tMHFsbHR
         90Sr8aIDLs6EBR+8kZzy/8CsKabq1IcVXsOKuF2EFci0yxR//UvQhTtWsB7vGbeNyE6N
         s3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709147668; x=1709752468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKPLKmu0vcoRaicHvZtixNIou3ChWturt3XwCGnBqeg=;
        b=vvUxtdLtytkQlsGM3WvN8whzSmv4LH8RrdBaAoWUHmsp22CKVz1Z4n9811TYbOdvFB
         I2FW/HPkNIJpv9vnWqvdDnLWzwkD607YFir1BWOGbrYeCKAFGEWQP8PCHtepWTS1VhJ4
         B0dIH0WcqB3pcSB7D+w8+fE715eqY3+Zf1+Dv1j/Txq91czqGmB3TtU4xO+c0WHp/hb4
         uMC9IdvcSxVb9Xcq3rjbQvRvIRmDGlpAPjnUBpOeMHAV6C3Bm2kwOkGCb/NQBoYsJTUl
         qY0DTz2iHGXEQIuE4fJTIF7ZJbc/LtABlZj4F8GT0JPyO7ULlQcS17M68164acUah/LB
         P95g==
X-Gm-Message-State: AOJu0YwcUG1phl7/HhTezlCNrga2PgH075MA0uG6PQ1rj/6jUyi0JyO9
	Fnd5u9Iq3UDJtAYXTlVMVl3nt7iK+CbiRX4drDOWliq0WPa9x8WxCGlInZb+
X-Google-Smtp-Source: AGHT+IFzlseLtkiS7LOefOsu7tTz6y6XfwFTwBmVNLZeNg/YzX/qGVlKwSiHY1PrZ/+eDl19BhcIkg==
X-Received: by 2002:a05:6402:519:b0:566:2be1:5276 with SMTP id m25-20020a056402051900b005662be15276mr256763edv.23.1709147667749;
        Wed, 28 Feb 2024 11:14:27 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id s21-20020aa7cb15000000b005645961ad39sm2057300edt.47.2024.02.28.11.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 11:14:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-xfce][PATCH 1/2] ristretto: use python3native and depend on glib-2.0-native, python3-packaging-native
Date: Wed, 28 Feb 2024 20:14:18 +0100
Message-ID: <20240228191419.87199-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Feb 2024 19:14:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109056

* it uses gdbus-codegen from glib-2.0-native which depended
  on python3-distutils-native until
  https://lists.openembedded.org/g/openembedded-core/message/196136
  but distutils on host was enforced by sanity check only until mickledore with:
  https://git.openembedded.org/openembedded-core/commit/?id=8e3a5b0709384f2b455a82ac1e8e212686fe4456

  so on hosts without distutils this was already failing
  and the glib-2.0-native change only changes the dependency from
  distutils to packaging which results in:
  https://errors.yoctoproject.org/Errors/Details/754996/

gdbus-codegen \
	--c-namespace=Tumbler \
	--interface-prefix=org.freedesktop.thumbnails. \
	--generate-c-code=tumbler \
	tumbler-service-dbus.xml
Traceback (most recent call last):
  File "TOPDIR/build/tmp/work/riscv64-yoe-linux/ristretto/0.13.1/recipe-sysroot-native/usr/bin/gdbus-codegen", line 53, in <module>
    from codegen import codegen_main
  File "TOPDIR/build/tmp/work/riscv64-yoe-linux/ristretto/0.13.1/recipe-sysroot-native/usr/share/glib-2.0/codegen/codegen_main.py", line 29, in <module>
    from . import dbustypes
  File "TOPDIR/build/tmp/work/riscv64-yoe-linux/ristretto/0.13.1/recipe-sysroot-native/usr/share/glib-2.0/codegen/dbustypes.py", line 22, in <module>
    from . import utils
  File "TOPDIR/build/tmp/work/riscv64-yoe-linux/ristretto/0.13.1/recipe-sysroot-native/usr/share/glib-2.0/codegen/utils.py", line 22, in <module>
    import packaging.version
ModuleNotFoundError: No module named 'packaging'

* packaging probably isn't as wide spread on host distros as old
  distutils was, so make sure it's available by using
  python3-native with python3-packaging-native from OE build

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-xfce/recipes-apps/ristretto/ristretto_0.13.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-apps/ristretto/ristretto_0.13.1.bb b/meta-xfce/recipes-apps/ristretto/ristretto_0.13.1.bb
index 4aac89fe79..dcae982cee 100644
--- a/meta-xfce/recipes-apps/ristretto/ristretto_0.13.1.bb
+++ b/meta-xfce/recipes-apps/ristretto/ristretto_0.13.1.bb
@@ -4,9 +4,9 @@ SECTION = "x11/application"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=35d145429ad3cbf5308d1dc93f66376b"
 
-DEPENDS = "exo libexif libxfce4ui libxfce4util xfconf cairo file"
+DEPENDS = "exo libexif libxfce4ui libxfce4util xfconf cairo file glib-2.0-native python3-packaging-native"
 
-inherit xfce-app mime-xdg
+inherit xfce-app mime-xdg python3native
 
 RRECOMMENDS:${PN} += "tumbler"
 
-- 
2.44.0


