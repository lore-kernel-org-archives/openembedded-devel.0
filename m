Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B9BFC5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 11:37:30 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.10306.1709033843794555349
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Feb 2024 03:37:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aAZeikbO;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5643ae47cd3so5387184a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Feb 2024 03:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709033842; x=1709638642; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8QnoWX7A5RFt6qc7c3tqASsy1+TTA+gufYIRZaTJhe0=;
        b=aAZeikbOCY90NisbWVgEXhxXtjutmdcuYfYYTeLHD+hapqeBqfxJ5eXeFknx/Urj4X
         Gef5bl/1HmgecKruI24u3WeA6sJ76jqNlGRbyZzUtnaZT1E4r9zSiS5b83exZt+1C0xT
         ontifQ+tb2AYYZOXcNnsUPGxYyRaUCBomplwGwPokIRTZ1cRi0w1AdZGjmesAtmWNk8r
         pFds788MBGkvzJLgljOu8cWwrl/2hwobHeh/2tOrqT7qSsK37A9imQ2NtO0EpuL892b1
         2vMb026eM9xfsejKUBIhSjNBxWYJL7oqyZKcfbpvGOPHZIWPUYTySm/i+InzzvMekR47
         UGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709033842; x=1709638642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8QnoWX7A5RFt6qc7c3tqASsy1+TTA+gufYIRZaTJhe0=;
        b=RgBaTgjDpyLh3AujJJGD2HQY65ZG3fYqFtCvxtUmVWNVh2FYoZgup8RUI4hz15NK3J
         +Lg9oVOQVncD24eOTqmA71fkXg3BmW3vfclf0ycpnMlg/sEgwKFwPIPYf0l0A8HlwUWR
         70dpX8v8rH3SbyLUnH23hQcxbInLu9NcKdyfwmIPtpRiyl5CL6MVYv2FePbOBoLwjgr2
         K8BewYd6LwLDH8CwT9LFXKom5h08JK+US9sj332yjesEBNRndPzDRufQO7z4bpOMlkzi
         nV5khQIXHQt/WwXbxm5kmYBcVo4eq1zGRT2OFcJNGrjS5kW46Pkya9maWkGuHUFe54d2
         u0JQ==
X-Gm-Message-State: AOJu0Ywh37ee0CwM4lcXoI0bFCBgDk4sfhYB/pJn0vwqEwsq7Cy5YDgw
	1uhiVlcileQXrf/hbKOWy8xem3Hbo0D7mS6VuBuv++bypTI1c8mJYFw3UKoA
X-Google-Smtp-Source: AGHT+IEJ8A7DZr75eIQ73XiWq410EZgC1Vi2Nfctzm+bQ3N1/nM7jOJOlkJrUhNtfKXcqpLfMVMD5g==
X-Received: by 2002:a17:906:ecaf:b0:a43:a1b6:67a7 with SMTP id qh15-20020a170906ecaf00b00a43a1b667a7mr1263559ejb.73.1709033841898;
        Tue, 27 Feb 2024 03:37:21 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a5-20020a170906468500b00a3fb4d11809sm673875ejr.204.2024.02.27.03.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 03:37:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] networkmanager-fortisslvpn: use python3native and depend on python3-packaging-native
Date: Tue, 27 Feb 2024 12:37:11 +0100
Message-ID: <20240227113711.834767-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240227113711.834767-1-martin.jansa@gmail.com>
References: <20240227113711.834767-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Feb 2024 11:37:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109041

* it uses gdbus-codegen from glib-2.0-native which depended
  on python3-distutils-native until
  https://lists.openembedded.org/g/openembedded-core/message/196136
  but distutils on host was enforced by sanity check only until mickledore with:
  https://git.openembedded.org/openembedded-core/commit/?id=8e3a5b0709384f2b455a82ac1e8e212686fe4456

  so on hosts without distutils this was already failing with:
  http://errors.yoctoproject.org/Errors/Details/754697/

gdbus-codegen \
	--generate-c-code src/nm-fortisslvpn-pppd-service-dbus \
	--c-namespace NMDBus \
	--interface-prefix org.freedesktop.NetworkManager \
	../NetworkManager-fortisslvpn-1.4.0/src/nm-fortisslvpn-pppd-service.xml
Traceback (most recent call last):
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/networkmanager-fortisslvpn/1.4.0/recipe-sysroot-native/usr/bin/gdbus-codegen", line 53, in <module>
    from codegen import codegen_main
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/networkmanager-fortisslvpn/1.4.0/recipe-sysroot-native/usr/share/glib-2.0/codegen/codegen_main.py", line 29, in <module>
    from . import dbustypes
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/networkmanager-fortisslvpn/1.4.0/recipe-sysroot-native/usr/share/glib-2.0/codegen/dbustypes.py", line 22, in <module>
    from . import utils
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/networkmanager-fortisslvpn/1.4.0/recipe-sysroot-native/usr/share/glib-2.0/codegen/utils.py", line 22, in <module>
    import distutils.version
ModuleNotFoundError: No module named 'distutils'
make: *** [Makefile:2081: src/nm-fortisslvpn-pppd-service-dbus.h] Error 1

  and the glib-2.0-native change only changes the dependency from
  distutils to packaging which results in:
  http://errors.yoctoproject.org/Errors/Details/754693/

gdbus-codegen \
	--generate-c-code src/nm-fortisslvpn-pppd-service-dbus \
	--c-namespace NMDBus \
	--interface-prefix org.freedesktop.NetworkManager \
	../NetworkManager-fortisslvpn-1.4.0/src/nm-fortisslvpn-pppd-service.xml
Traceback (most recent call last):
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/networkmanager-fortisslvpn/1.4.0/recipe-sysroot-native/usr/bin/gdbus-codegen", line 53, in <module>
    from codegen import codegen_main
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/networkmanager-fortisslvpn/1.4.0/recipe-sysroot-native/usr/share/glib-2.0/codegen/codegen_main.py", line 29, in <module>
    from . import dbustypes
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/networkmanager-fortisslvpn/1.4.0/recipe-sysroot-native/usr/share/glib-2.0/codegen/dbustypes.py", line 22, in <module>
    from . import utils
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/networkmanager-fortisslvpn/1.4.0/recipe-sysroot-native/usr/share/glib-2.0/codegen/utils.py", line 22, in <module>
    import packaging.version
ModuleNotFoundError: No module named 'packaging'
make: *** [Makefile:2081: src/nm-fortisslvpn-pppd-service-dbus.h] Error 1

* packaging probably isn't as wide spread on host distros as old
  distutils was, so make sure it's available by using
  python3-native with python3-packaging-native from OE build

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../networkmanager/networkmanager-fortisslvpn_1.4.0.bb        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-fortisslvpn_1.4.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-fortisslvpn_1.4.0.bb
index a15c69b601..48f50abaf1 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-fortisslvpn_1.4.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-fortisslvpn_1.4.0.bb
@@ -4,10 +4,10 @@ SECTION = "net/misc"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-DEPENDS = "glib-2.0-native libxml2-native networkmanager ppp"
+DEPENDS = "glib-2.0-native libxml2-native networkmanager ppp python3-packaging-native"
 
 GNOMEBASEBUILDCLASS = "autotools"
-inherit gnomebase gettext useradd
+inherit gnomebase gettext useradd python3native
 
 SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager-fortisslvpn/${@gnome_verdir("${PV}")}/NetworkManager-fortisslvpn-${PV}.tar.xz \
-- 
2.44.0


