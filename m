Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 817BBEB64DC
	for <webhook@archiver.kernel.org>; Sat,  1 Jul 2023 14:33:35 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web10.8622.1688222009990194393
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Jul 2023 07:33:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=lAoQ3Czw;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6b75637076eso2637931a34.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Jul 2023 07:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688222009; x=1690814009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4YskmNVTmKl/544aCim7pZ2H+v/4B5Eau/hAHXD88mk=;
        b=lAoQ3CzwI8E5ACkVHCfFf5YBRG0c3DB5erAtva5LTlBnJSwNQ0CJ3ef14v2iZ38JJ9
         NMG3EDIMT40XBsZSUJvNVvkLc9JyIqwH+behswz+8h2n8MQZdfmZBixEUbDUs0LHNvrj
         Xscy/U/COoWRqotJJbXAvM1pJ84ewbM0F4EsWkc8o7YwpdNrwJD++qtOrPW2xuEyMXmO
         OMBNuIrbavCrj1vFSEm2p+pObtuceAKNxcurxW+bpH9szeybBan3Kvx378bppZrTyiRL
         f3Xzl7LqE1AkHsB1TOPkpTCj03yRgXo66P1Y48nFeuu9O+SNPguR3aUhj6ThBpEE6pC7
         6feg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688222009; x=1690814009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4YskmNVTmKl/544aCim7pZ2H+v/4B5Eau/hAHXD88mk=;
        b=TezCjUYURpDQQmW8nh1ufC0vD8TkvrTpxc0OBWtK2QswSIjz7n2ZIqgYkA2rhNlOD6
         vJiaru0o1BoCY4yVnr5Wz9TJ2PbLse2D3AxzNdhRxCi+yijQKeL9oCStBMTlhgtV7STK
         a2IWYz2CSGuwd7+qveitTryGknNtbB0Is5tfIM7NSHx1DR0VQ45RL8nNj6ZuFUJ9jSmX
         TOkjZUcpSl023/BobJYcyrv7CR0ixmD1F3Q7+BtRbOqzvC0V4wjtYVIr6262UCYh11s2
         a+ZYyFH45m/DbHFnph7BOY33oJMu5C6pkYoiOa267Jl4aZdt2ckoeCXNP3aRPmKaNO+0
         ukzQ==
X-Gm-Message-State: AC+VfDwDs+Jv1+C902LKeer7RhjE+Esz5ubNUvezabRAq+Y8LbeoD1Wf
	/V/eNRXNDJIbJ0QBgmexjmGoe8rxbl0=
X-Google-Smtp-Source: ACHHUZ7sQv+JsOai4L7uH/2kLjkB+bc5fgBG5a0pQWJr3WhpnvXOKh6qn3/qdIcZBgzbf/hqZnzAtA==
X-Received: by 2002:a9d:741a:0:b0:6b5:ed7a:1769 with SMTP id n26-20020a9d741a000000b006b5ed7a1769mr6343435otk.16.1688222009000;
        Sat, 01 Jul 2023 07:33:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::1944])
        by smtp.gmail.com with ESMTPSA id x12-20020a63cc0c000000b0055b553157a5sm1183179pgf.71.2023.07.01.07.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jul 2023 07:33:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] pidgin-sipe: Add packageconfig to turn Werror on/off
Date: Sat,  1 Jul 2023 07:33:26 -0700
Message-ID: <20230701143326.3460082-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Jul 2023 14:33:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103648

This component has many warnings and is using deprecated libxml2 interfaces
as distros its better to disable Werror, if devs want to enable it then
add the needed packageconfig explicitly.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
index 90e1701488..6ce42ec187 100644
--- a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
@@ -25,6 +25,8 @@ PACKAGECONFIG[krb5] = "--with-krb5=yes,--with-krb5=no,krb5"
 PACKAGECONFIG[telepathy] = "--enable-telepathy=yes,--enable-telepathy=no,telepathy-glib"
 #PACKAGECONFIG[gssapi_only] = "--enable-gssapi-only=yes,--enable-gssapi-only=no,krb5"
 PACKAGECONFIG[debug] = "--enable-debug=yes,--enable-debug=no,valgrind"
+# disable Werror by default, useful for dev mode
+PACKAGECONFIG[quality] = "--enable-quality-check=yes,--enable-quality-check=no,"
 
 FILES:${PN}-dev += " \
     ${libdir}/purple-2/*.la \
@@ -35,5 +37,3 @@ FILES:${PN} += " \
     ${datadir}/appdata \
     ${datadir}/metainfo \
 "
-
-CFLAGS = "-Wno-error=deprecated-declarations"
-- 
2.41.0


