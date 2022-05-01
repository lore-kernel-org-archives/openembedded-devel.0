Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF7BC433F5
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 16:26:59 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web09.142.1651422415467873323
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 May 2022 09:26:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R9ujDvbq;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id c23so10924092plo.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 May 2022 09:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wfTBXwuv9A737w0gpJuCFot2y1pxpcsv1r8KZ1lIqmo=;
        b=R9ujDvbqtvD9zYT5rJNSLm2EumMujRBKCm1OD2zL6IRX6scgbwOL+49XDo4bZs9oOl
         iTz/UTnYi0UKDzwWXuC9U9c7vP44Z+g+VVNjZAH1ldrsXWYJEfyXTbuzopiufo6W+fAH
         U7Pw+oM6IxOlbf5I5sU+TaJgmEngXEicCz8+9yFBurSjgEtwTCY5Hf0w9hUihQ5N+zxf
         QUGSQ6YEna10rdMG6WkUGeyPd2FSuFWsGqfyqHoojoHk8lo4B7AOkFZHsUlyBzhWtToZ
         vb0/qAevxc58dsQLRAUjCswPFmXCIldCQvdxxDEabmOZTU1PaOR+5MpVY7u86EeSs5hW
         gJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wfTBXwuv9A737w0gpJuCFot2y1pxpcsv1r8KZ1lIqmo=;
        b=LPqLwfORy7gOI2SMvAbpII0oIOT/ipMz8q8dZFmDNwS/w88RJeQ8rd60cTd3iJRji5
         Yn6KyndzbO5U1yRKQG7xbfjc61916YBiCd0Dxo7B8tT2c/zR0dNxr6CJGvULz7tvOwcd
         CNilE79KEsG4s69bovBJ0RGatbhbOI0D3ZoMTh8T3NT4IYrXk5uXjUjzfLElHHxhA/mm
         pALMqk54Ihs0xrAm0iX5U/5gulI8Ze81Qxwh5w5vPQdB6UjvdZzC3+6J2aol5NZ9gimz
         fGWk23SW+7PNBocxIzY6xNdTSVC0A2HRkiTg/FRnWzcx3SgvOD2yw9SKNRPqxKizgiSu
         h7lA==
X-Gm-Message-State: AOAM533T7vgeCSbf10UC6uBIpQwC6NFYdtcWjNtOhAts3DGy1Wn7d1Ty
	9qWvUJeabGX1n9fuIzQ/p8USkQRpPSW68g==
X-Google-Smtp-Source: 
 ABdhPJy4AT7kv1L8AeuvthmC+49hiMTmUKhG6MoHoFXNxxJ1z+TNuJ+blrUowdWoEkl8Aj4l91fl7w==
X-Received: by 2002:a17:903:124a:b0:154:c7a4:9374 with SMTP id
 u10-20020a170903124a00b00154c7a49374mr8048406plh.68.1651422414719;
        Sun, 01 May 2022 09:26:54 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:9a0c:5968:29f0:efcf])
        by smtp.gmail.com with ESMTPSA id
 h19-20020a170902f2d300b0015e8d4eb243sm3063569plc.141.2022.05.01.09.26.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 09:26:53 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 05/10] packagegroup-meta-oe: update pkg group
Date: Sun,  1 May 2022 09:26:38 -0700
Message-Id: <20220501162643.513646-6-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220501162643.513646-1-akuster808@gmail.com>
References: <20220501162643.513646-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 May 2022 16:26:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96917

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 765edc5c5f..d3f90bd83c 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -9,6 +9,7 @@ PACKAGES = "\
     packagegroup-meta-oe-benchmarks \
     packagegroup-meta-oe-connectivity \
     packagegroup-meta-oe-connectivity-python2 \
+    packagegroup-meta-oe-connectivity-python \
     packagegroup-meta-oe-core \
     packagegroup-meta-oe-crypto \
     packagegroup-meta-oe-bsp \
@@ -37,6 +38,7 @@ RDEPENDS:packagegroup-meta-oe = "\
     packagegroup-meta-oe-bsp \
     packagegroup-meta-oe-connectivity \
     ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "packagegroup-meta-oe-connectivity-python2", "", d)} \
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python", "packagegroup-meta-oe-connectivity-python", "", d)} \
     packagegroup-meta-oe-core \
     packagegroup-meta-oe-crypto \
     packagegroup-meta-oe-dbs \
@@ -122,6 +124,7 @@ RDEPENDS:packagegroup-meta-oe-bsp:remove:riscv64 = "efivar efibootmgr fwupd fwup
 RDEPENDS:packagegroup-meta-oe-bsp:remove:riscv32 = "efivar efibootmgr fwupd fwupd-efi"
 
 RDEPENDS:packagegroup-meta-oe-connectivity ="\
+    cyrus-sasl \
     gammu \
     gattlib \
     gensio \
@@ -170,6 +173,10 @@ RDEPENDS:packagegroup-meta-oe-connectivity-python2 = "\
     ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "telepathy-idle", "", d)} \
 "
 
+RDEPENDS:packagegroup-meta-oe-connectivity-python = "\
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python", "nvmetcli", "", d)} \
+"
+
 # dracut needs dracut
 RDEPENDS:packagegroup-meta-oe-core = "\
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "dbus-broker", "", d)} \
-- 
2.25.1


