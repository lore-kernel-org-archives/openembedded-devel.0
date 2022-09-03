Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF6CFECAAD4
	for <webhook@archiver.kernel.org>; Sat,  3 Sep 2022 18:33:00 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.5892.1662229970488124529
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Sep 2022 11:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KhgysSHB;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id cu2so9771422ejb.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Sep 2022 11:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=gvzhh31OYHazJdHDEq8UvkUZ+IYRlxu1ypYcpOKjUrA=;
        b=KhgysSHB31X+299MF5rh5Duo20h7ig5UypuW9+BrBo7bPYYmKe8usUnw3iJPQiLCrZ
         Oxl40ai+6CBCOT6RSt/EEQbgeQl5klKZ3mZhsWskpIEZsNbj6P5CzGLZhwXghJKqXC8G
         7iu8A86gFXjvyzKufNmkt5K8MJDI5iVMC812VvDjBPwTM+xfUdwFTEgoKifk6Wx2fZXq
         JqNc2odIO1eVSxfmtIf0ny8/FkgnlEZNjR55xQd0qjW0HGYb0adylzgmc55zhlD+iRON
         hNHG/E2So23DYMxmSgLjEnkCCWRqZ5skp8+099O0j5rJTEnzxx17Yyy90Yk3SclTjmHc
         tDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=gvzhh31OYHazJdHDEq8UvkUZ+IYRlxu1ypYcpOKjUrA=;
        b=Uwa+1iyrShZv7vcA2OjES7uxSUIl9GutsOJYGObg124rEh82k+KxFkqC1MKTvcHJov
         EF2KJBGTk0n1/8k0o0RVEGuUg1WsY1nqX80l0AvW+kKzAMN4dJjMgGDgPKzUngJpoxTS
         DODZ68EAvsqP3a1YVpJMmuEuYXlI7z1H4iPAwUJm8cOsQKtjbWikzwJYSOSB2HoFYN0P
         unOhwzwEPbcM6y4rijP2pD2VwQSVbV9r4pSPhnwJziHxDV/JA030IepouThu2xocVShg
         OIz+mPhSXSGDHNrfMGWYOitFtFGqlUFmFyqrJe4TIj2OV7CkvSakEK5+yyTn4JRwrl4O
         uF1Q==
X-Gm-Message-State: ACgBeo3so/+vhF8sx93a5PZH92eet/I9bvfR3MPmZfrp1dSECZsyCFd9
	5xPgwL9ECwNr+Aw7kUL0Su+ixOyaNhM=
X-Google-Smtp-Source: 
 AA6agR42I0KPb7dbEvfIkohkE1zsE5zdrkHXCXdpyC6GdM9NGX+H9WG06FuJ7ZumlORl+RQYuTCvuQ==
X-Received: by 2002:a17:907:7fa7:b0:731:51b4:5020 with SMTP id
 qk39-20020a1709077fa700b0073151b45020mr30136179ejc.352.1662229968585;
        Sat, 03 Sep 2022 11:32:48 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-fij45qwle33wfxr3ph3.18120a2.ip6.access.telenet.be.
 [2a02:1812:512:2c00:fc8:3861:feee:b2b7])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a1709060f4a00b0072af4af2f46sm2780998ejj.74.2022.09.03.11.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Sep 2022 11:32:48 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-oe][PATCH] makeself: upate anonymous git access and dropped man
 page.
Date: Sat,  3 Sep 2022 20:32:35 +0200
Message-Id: <20220903183235.2152067-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Sep 2022 18:33:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98594

Review on the mailinglist requested to drop the 'git' user in the SRC_URI.

The man files seems to be outdated, so I've dropped it.
https://github.com/megastep/makeself/issues/260

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 meta-oe/recipes-devtools/makeself/makeself_2.4.5.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/makeself/makeself_2.4.5.bb b/meta-oe/recipes-devtools/makeself/makeself_2.4.5.bb
index e0dfc3dae..4cfe2ecca 100644
--- a/meta-oe/recipes-devtools/makeself/makeself_2.4.5.bb
+++ b/meta-oe/recipes-devtools/makeself/makeself_2.4.5.bb
@@ -9,7 +9,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "\
-    git://git@github.com/megastep/makeself.git;protocol=https;branch=master \
+    git://github.com/megastep/${BPN}.git;protocol=https;branch=master \
 "
 
 SRCREV = "5742be6410bfad2c619fb1e98bf795e8fa0913c7"
@@ -21,7 +21,6 @@ do_compile[noexec] = "1"
 
 do_install() {
     install -d ${D}${bindir}
-    install -m 0755 ${S}/makeself.1 ${D}${bindir}/
     install -m 0755 ${S}/makeself.sh ${D}${bindir}/
     install -m 0755 ${S}/makeself-header.sh ${D}${bindir}/
 }
-- 
2.25.1


