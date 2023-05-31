Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13BA4C7EE37
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:23 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.11444.1685531595251556044
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=DNWlbg0k;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-568af2f6454so23651367b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531599; x=1688123599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6f+PQngFUVzNtUm3gokY8YEpwZw4vlB6AdoHgESjbk=;
        b=DNWlbg0kRcFoZ5JOhWewX7997oUHJNVIfnbD5OG47+7nKiuu3fajSivJuOfMo8/oIb
         YyToFaGCktdRNSPSMUAo/+6a64JTEDys5fF/9qy5NDFlUSHI3JhlscEn7kd43IYtPZBn
         JmR4OsRdEolJRIQGa3zB0ffcCrE2C5DedkmwTX+NQTx4AmQtBcVsygNHW7RPz/W5Ug7m
         4MMpZqG7Ym4DKxChblMvMt9wO2dHMf/6htU5Ym1B9+Am17yjkF5iZK8GdmMx9W0MjVYq
         mY86PX7kCzrCP/+BsQ2nHpfpfGLH2ZQ+KzLnkp7SY+MxeXswZq45LV3U6Vs4sryVbtfQ
         F/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531599; x=1688123599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6f+PQngFUVzNtUm3gokY8YEpwZw4vlB6AdoHgESjbk=;
        b=cRRJdlufSU5GWjONNNyfukhEP6DBD+nJped7e/pDLJ3yuzikOhBiY+9K/2nhBGViRa
         93Ba2KpeiW2SAmEx5gpz4TgZdRFS6MebNd8Pgp2TVAlxI20sG/pu7Xrn4IzPGSqfjcau
         Ha8B63K9IilQ+xd8WIsJjKnXgkpnDrOfn0PUrKCQ80BSRyzx/HRSUb9zG2fAyXCfelU5
         2smeay7CCrjoRo03b+XxI/7zNdBOlvI+bvpVe2uhImBbBROfKIfb6/elf//N6IlIZlqN
         XEhXwOP3msaoRp45LIiXlzlT0AfMXuQ55wOANljXr+ZTMnwOQO5q6TDqE4P0fsA4Cd87
         rBaA==
X-Gm-Message-State: AC+VfDzLPN/VVzGIzUHUlg3zk4QeoqYAkavO/J7FHzQGGXriAzq4TtKO
	4NHfeQ/Jc4TWSGcQJ8F6hZqhosytALc=
X-Google-Smtp-Source: ACHHUZ6hMGmJCzUqOXrKxK23SQEaKQd8XgnNjYGjbzqpY+rLlrpVs89qHH9YglRUxAvESAsChA7MNA==
X-Received: by 2002:a81:75d4:0:b0:568:fe3a:46ad with SMTP id q203-20020a8175d4000000b00568fe3a46admr582126ywc.5.1685531599318;
        Wed, 31 May 2023 04:13:19 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:19 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 11/36] php: Remove buildpaths from scripts and generated headers
Date: Wed, 31 May 2023 07:12:44 -0400
Message-Id: <20230531111309.2454603-11-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103040

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 439239ca9c543b0913de054f01453796e373ac00)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/php/php_8.2.6.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.6.bb b/meta-oe/recipes-devtools/php/php_8.2.6.bb
index d302878999..54c40392db 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.6.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.6.bb
@@ -143,6 +143,13 @@ do_configure:append() {
     # No, libtool, we really don't want rpath set...
     sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' libtool
     sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' libtool
+    sed -i -e's@${RECIPE_SYSROOT}@@g' \
+        -e's@-ffile-prefix-map=[^ ]*[ ]*@@g' \
+        -e's@-fdebug-prefix-map=[^ ]*[ ]*@@g' \
+        -e's@-ffile-prefix-map=[^ ]*[ ]*@@g' \
+        -e's@-fmacro-prefix-map=[^ ]*[ ]*@@g' \
+        ${B}/main/build-defs.h \
+        ${B}/scripts/php-config
 }
 
 do_install:append:class-native() {
-- 
2.25.1


