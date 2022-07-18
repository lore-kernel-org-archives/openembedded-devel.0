Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D22C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 11:07:21 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web08.25889.1658142439960810653
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 04:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gLbkni/1;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id m16so14705696edb.11
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 04:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pqYJSg9fVnk9WPiunhCEt7InGoEDcKTPRZBVRih6n9o=;
        b=gLbkni/1m3aVi8TKNMEYkfj1qgr+UlQeVKA103zHEb5GZJDu800PuIxr2Fhzy4k87n
         EkUq+mB2gr4GDsdDbfQMqXKFLgj1FvyutBJL22Wh5WlaeUYVi4VJqSD4SLkGTwDP0Nm3
         jjMWlg/Hv80U3jC/PAWiekoncOgC6JBX+pCYHTOYZ9Fu5Upc2LsMc652MVAKRImilc/U
         zu1rv7PFgRNebX3SMeVJZMBjVqKMDXdZmVlX2CdJx8vrQut8IzqQIeS+VkvWxOjG7Byq
         COZIEbsi0HJRY2GblBOScPQZ+GHIeYv0aLl/PlE1rf03BIIUhhria/uDfLrpzw/1A3FY
         dJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pqYJSg9fVnk9WPiunhCEt7InGoEDcKTPRZBVRih6n9o=;
        b=h73FCH/FJTcHsHWAfwwVjMAC6agYx0iBkLxbih3T6oXgVsbD1fnC4tm2k63jPNMAhB
         7Nat/bfV9Am/3wisZVMZrKYydNHL1JPNrQgcdUyzdRW0PoAES00ex2U+4ufte39LQo5j
         9Ba5a0z1sy5fMJ8hlZVgYAND3mp/FPyo8CxofvJBUWoLl8yeT51FZeqsvVPLD3fz2bKM
         iaPiy6Pbqm2FKjdUoJcfNRCCsN+EmaLKCiFdgfAa+pheGPrZRdY1JIRxRsNrdHMaWcdL
         4+Mr4CR+y2fOkeeZ5vmy7WqOnVmibVSkIB9xYS3wxuiFU4ewwjOu5JQ82tiTClslWAi5
         wXLQ==
X-Gm-Message-State: AJIora+2z8bspyVlCj5/Nm28pXJdeWYN4OHx7GgnheFEcSBKenCs+N6G
	ttn27YX9KeEMtKguf3z2yBFAJjzARt0=
X-Google-Smtp-Source: 
 AGRyM1vVo5LuDan7X9LZMsZGsDGgYFkbgG9UjkLJjQ6ta6E0/cm6uTmNO7S2Nw1XoQrLsAxsci4GYQ==
X-Received: by 2002:aa7:d759:0:b0:43a:6fe3:acb4 with SMTP id
 a25-20020aa7d759000000b0043a6fe3acb4mr36683063eds.27.1658142437987;
        Mon, 18 Jul 2022 04:07:17 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-208.retail.telecomitalia.it. [87.5.19.208])
        by smtp.gmail.com with ESMTPSA id
 ne23-20020a1709077b9700b007263481a43fsm5284153ejc.81.2022.07.18.04.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 04:07:17 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-devel@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [meta-oe][master][kirkstone][PATCH] libplist: ignore patched CVEs
Date: Mon, 18 Jul 2022 13:07:05 +0200
Message-Id: <20220718110710.303475-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Jul 2022 11:07:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97869

CVE-2017-5834, CVE-2017-5835 and CVE-2017-5836 are patched in our
version of libplist but they don't have a vulnerable version range in
the NVD database, that's why they need to be ignored.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta-oe/recipes-extended/libimobiledevice/libplist_2.2.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.2.0.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_2.2.0.bb
index db4f507b7..daaff0039 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.2.0.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.2.0.bb
@@ -13,6 +13,12 @@ SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https;branch=mast
 
 S = "${WORKDIR}/git"
 
+CVE_CHECK_IGNORE += "\
+    CVE-2017-5834 \
+    CVE-2017-5835 \
+    CVE-2017-5836 \
+"
+
 do_install:append () {
     if [ -e ${D}${libdir}/python*/site-packages/plist/_plist.so ]; then
         chrpath -d ${D}${libdir}/python*/site-packages/plist/_plist.so
-- 
2.34.1


