Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCABC36017
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 16:27:42 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.13504.1743611254884210082
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Apr 2025 09:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jA8+hvRO;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-224191d92e4so404095ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 09:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743611254; x=1744216054; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b9klOQ3L/fVvFXHD/aYYklKHelxjR57wyfybDDSu/Ls=;
        b=jA8+hvROE4CGQwtnGdd89FEa5VcqzIRUXm4Rs0ihw/lD/fq0hLBXe/IrlfEdGBdndp
         jbQr59kRSTqePLSyY13q8T7+7UUlQAaM2KEaXuEQ1CujLZaIW3ixvVoa2OmltB/H2bPq
         NmId0hK7ppeiZdGynthFIHgt3KqfEuKhQzXG8JbgwEnBdzdBnTU2+46YgzhgygCdq6ZL
         nVdUV0GS+wwNTYP7hV3Yif6AyhtutaAREj4Hb3jrFfHMbic8gxhoN7cd7v/s707BrLcO
         pPc7PLeipv8wsY5A1IajPcBiptmdICCkkQ+EYL1Ywqw5xz9SEp0pS+IYqDOWN60aykzG
         1LNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743611254; x=1744216054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9klOQ3L/fVvFXHD/aYYklKHelxjR57wyfybDDSu/Ls=;
        b=e7l72Ns9I+xBwlCplIrn3gdTOMHkzbOfFSHXdB3hcgs0v4M6z7uwdmXLwwTu5ocdHf
         wlg03s3EW7cjEPLolkKQVysSL3glHKnGjNwylGIq4x01hWIzyfXg47CeiK3OS7wrQyFl
         TsWSug+mOw96wFfWlppejNznyxf8xCoowJUQAiYlrRjI5CMH30SRnIPbg3bZ6YP7nO4q
         ONQpzJHxrLVJLxzn/ZaEVjAsIQMv7RbldVtN40Lt8UZKtpwcgyADw1KaFcZnnZF0XFiC
         XgTMutylZE7HcNAbxhRAww5IEcKA70EmbuHgiLfQjIQ0jgGbq5yrSYBLSG5ToQSrF3pI
         n6uQ==
X-Gm-Message-State: AOJu0Yx5pnW1ZW4dFF7UhjhgZ92GZmzfF7nvXwUGLqspEN2JBe6Hck6P
	r9jhy1wyNJ083QOP8YkT5MEZGgCp/3iZcMzrJ7S6EkeBvYBReTiXUs4gu0Q/
X-Gm-Gg: ASbGnculYlO8lriHp8HmkAfAClg8+RzTYAKbHE5Xy9wKboPHiUu5eqiUSOcv8KMyb5p
	GnijtS0a6prr+HX+8Tdeq+SGVahQvy2btJHLIY6jTFNWmmLXHW7ru1VBrtmBNPUM6hX4MYdibrd
	Dh9omeIX0wmWx0mBU/Ag3BoMLo7gx0aRa6Wv+9nvhpUDzKlqUywHxcEzBDm094p58wUWkiWvNqZ
	CYb8rZUDUv5ZxUwVztNd07pOvygbWoLKXx+7GPd9ObutZEFs2jIRMReq7DR4xO/hF/Fq4Pi9lwS
	jJeaHeLPf/oox3s2JADnME9dVikXY9mUsoDZ5QiYJOlHTJQ=
X-Google-Smtp-Source: AGHT+IFzry7uk2aVNz0c2jP6IyUj6IwRDIf47OAb9kzOl84P5M3T4S/ZrJceBI6aFdM1NFhW1talFA==
X-Received: by 2002:a17:902:ebc3:b0:21f:45d:21fb with SMTP id d9443c01a7336-2292f946db4mr277040355ad.3.1743611253828;
        Wed, 02 Apr 2025 09:27:33 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c3db])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970def558sm11548902b3a.15.2025.04.02.09.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 09:27:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-breathe: Inherit ptest-python-pytest instead of ptest
Date: Wed,  2 Apr 2025 09:27:31 -0700
Message-ID: <20250402162731.2675440-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 16:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116528

This eliminates more boiler plate code and add needed depednecies for
ptest package

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes/devtool/python3-breathe/run-ptest | 3 ---
 meta-python/recipes/devtool/python3-breathe_4.36.0.bb | 9 +--------
 2 files changed, 1 insertion(+), 11 deletions(-)
 delete mode 100644 meta-python/recipes/devtool/python3-breathe/run-ptest

diff --git a/meta-python/recipes/devtool/python3-breathe/run-ptest b/meta-python/recipes/devtool/python3-breathe/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta-python/recipes/devtool/python3-breathe/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes/devtool/python3-breathe_4.36.0.bb b/meta-python/recipes/devtool/python3-breathe_4.36.0.bb
index dc14f1ce1c..fe3d1eeb91 100644
--- a/meta-python/recipes/devtool/python3-breathe_4.36.0.bb
+++ b/meta-python/recipes/devtool/python3-breathe_4.36.0.bb
@@ -6,17 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9e49eecf36fc015de7c61a0247df75d6"
 
 SRC_URI[sha256sum] = "14860b73118ac140b7a3f55446890c777d1b67149cb024279fe3710dad7f535c"
 
-inherit pypi python_flit_core ptest
-
-SRC_URI:append = " file://run-ptest"
+inherit pypi python_flit_core ptest ptest-python-pytest
 
 RDEPENDS:${PN} = "python3-sphinx"
 
 PYPI_PACKAGE = "breathe"
 
-do_install_ptest() {
-        install -d ${D}${PTEST_PATH}/tests
-        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
 BBCLASSEXTEND =+ "native"

