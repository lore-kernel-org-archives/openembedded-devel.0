Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B8ABC54FB9
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 08:52:02 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.7699.1700211113195316320
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Nov 2023 00:51:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KEQregzq;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9d216597f64so234419266b.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 00:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700211111; x=1700815911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNXl9rxZ+Py6/AC07rBmGe6+J+Q4MdH07QQswS38cG4=;
        b=KEQregzqLf3eGwfUsQtC61RDd9qgbwyZUXmDfr9LSLGlJippM0Mhk9GVsmLO8PFH1l
         +3ImFhHq3582kjgG05v3va+lPmKFcEozj8moAzvJnMd+eN5MPwxIWPwYKoGDQyjCeKEg
         W+Mh2QKaIaZfSCKoeIb8qgNC9ETInIZ+6qKSK8EZ3KHBFRIALibK4P5SKLmPA+e9IIAE
         FHeu1gpMA3+PVauE3L2OKp8eK9kPen7SPWsJ+yJavqBw5jKEcc1hb8Ui/9QrA2jLYQGV
         hS4zA33cdlbxcVAQDe3bAO30Bfw7zQixd3aGdisXijp7RHPNi6OAHjNCh+rk9BRcqg/q
         5kbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700211111; x=1700815911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JNXl9rxZ+Py6/AC07rBmGe6+J+Q4MdH07QQswS38cG4=;
        b=b/Jqc/vnlvbmt05wQZp1/Icpe7lz2u3DvIVFz13x+iuT4kMPWTdCq+NwKkTNk7XCm+
         2sjUPAY/XM7JdRmyU4sbE7onVLw5Rc5p/0/0hoAnQIbeJN7vGNx1kiXU3QwO9hndoTp/
         SZ/8+avJbfZi7gFOcgK71la3ekAqTygGlM5zhSuuFnyLR5EzJV2b6KNu8KPSScxbT5I2
         Qi0CIXnJIVtVayKymLIbpBOp5en8sOjb4Q+v5vIego4FwnofNPfFUiH9vFdoHNwDupT+
         C5MdY+4w3XeiDUypYK4D4IlnK4//mdz539NB5aE4T5N2I9juAWXXgMnZLWf7C6aVflKA
         SYtw==
X-Gm-Message-State: AOJu0YwVWs9GcGgbf8er3Py6671uzczvGpNxppWQe4m92tkT+wtLgNK7
	qCdxJJJ10hojOdbGJuAR6MxWS5qJJv8=
X-Google-Smtp-Source: AGHT+IFDJTtLp820bmh4kmN1R43+WjxDjrfgkKD3HIlxJ95hVYiMJpwxzj9kQS6UDej5Op2C4MMk7g==
X-Received: by 2002:a17:906:3c9:b0:9e6:59d5:7a86 with SMTP id c9-20020a17090603c900b009e659d57a86mr12606267eja.57.1700211111325;
        Fri, 17 Nov 2023 00:51:51 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id p20-20020a17090628d400b009928b4e3b9fsm558604ejd.114.2023.11.17.00.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 00:51:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 2/8] minifi-cpp: drop ${PE}, ${PR} from /usr/src/debug paths
Date: Fri, 17 Nov 2023 09:51:37 +0100
Message-ID: <20231117085143.3813216-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231117085143.3813216-1-martin.jansa@gmail.com>
References: <20231117085143.3813216-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 08:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106851

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
index b75a336955..67a2d9fa5f 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
@@ -66,7 +66,7 @@ EXTRA_OECMAKE += " \
     -DGCC_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${RANLIB} \
     -DDISABLE_PYTHON_SCRIPTING=ON \
     -DFLEX_TARGET_ARG_COMPILE_FLAGS='--noline' \
-    -DBISON_TARGET_ARG_COMPILE_FLAGS='--no-lines --file-prefix-map=${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}' \
+    -DBISON_TARGET_ARG_COMPILE_FLAGS='--no-lines --file-prefix-map=${S}=${TARGET_DBGSRC_DIR}' \
     -DOPENSSLDIR=${sysconfdir}/libressl \
     "
 
-- 
2.42.1


