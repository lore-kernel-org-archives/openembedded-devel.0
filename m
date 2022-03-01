Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD10C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 20:34:00 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web08.2364.1646166839580825526
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 12:33:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VwPVJ9SG;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 v5-20020a17090ac90500b001bc40b548f9so2923707pjt.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 12:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZfybFdjwq/SiXPrZ7AT6TW3J9EefKaCvdVdl9rDfLwo=;
        b=VwPVJ9SGAw3EQ0F+0k2/XmA45aFqfRWw+jF8cD76y1sR9RJZADoo0JcE2oJTjWzv8L
         zcd2Zo1rZbyJnyWRDBCU17ABv/zbmqI/BmR/eKamWUBYE57kDUVVah7exakBfaGedlSm
         Vk/SYUzGaKQtKjmtMiJDEFcY5un5ADI/IsZ1FSSou+UzXerKdrmt/gMkf7aDAup23Ym9
         mluLp11Rx+3rPLbz5j+KCzOK9jriQQufgL8IHH6ExGzxuQonVNRYIp3A7zNxLcEs5meg
         AzK6bXmk6hel+V55hJA2kyRdzI/18/i0qg+SbiilNVZI7Honm3uc/vxRzWJnl36KixkW
         hlpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZfybFdjwq/SiXPrZ7AT6TW3J9EefKaCvdVdl9rDfLwo=;
        b=Xw3RIw3zbUKfndAL22dkbazW+gyleto5FstPCLBOBPk7XD/4ijrEQG5qAtl7xl+a48
         Xi7HdhZvdWMt9zyUtIm2u+6AKN3ASJWlxzlX576CFJkSagMhG7+yu6IZUENCKYEeidjO
         Q7YnAJPHqorQBxWeRy8HYOlH81U0J+MA3996gfvq1KxreXQT5QsGFP5CAaQFSUWs1+qa
         fmR7QKTrVjNcuEvbqyCFVpPpIimBAA7C4XYD8dJerZiiPVlyCIVYg6Xu/nWbn5ajOLeR
         9FP1sf1iM25isrbl8DrDXmOvzrSmkze6diLOVRRG+8hKodut3MenVgw62SglAs75IFt6
         kiHQ==
X-Gm-Message-State: AOAM530pCv/YRYqcGY1UaQagvmnZmp8Su8YWCJZB/IXvZs7ah99fpuf8
	rOoyI2iVhjs9iwx4jZwK7In8SfWrD2c=
X-Google-Smtp-Source: 
 ABdhPJzLqsDqHZmcXHhpMRYi0yUKrrjsnU6KGqQeXQ7uk/CaCXecWHMvHv8bJGyl9ncpF7/RkrCi+Q==
X-Received: by 2002:a17:90a:8911:b0:1bd:395e:40e5 with SMTP id
 u17-20020a17090a891100b001bd395e40e5mr13963257pjn.121.1646166838596;
        Tue, 01 Mar 2022 12:33:58 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:b4e2:b3d2:f012:52ea])
        by smtp.gmail.com with ESMTPSA id
 o6-20020a17090ad20600b001b8d01566ccsm2896968pju.8.2022.03.01.12.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 12:33:57 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH 1/9] python3-poetry-core: add v1.0.8
Date: Tue,  1 Mar 2022 12:33:46 -0800
Message-Id: <20220301203354.3839755-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 20:34:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95648

A PEP 517 build backend implementation developed for Poetry. This project
is intended to be a light weight, fully compliant, self-contained package
allowing PEP 517 compatible build frontends to build Poetry managed projects.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-poetry-core_1.0.8.bb       | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb

diff --git a/meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb b/meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb
new file mode 100644
index 0000000000..0941af9ff9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb
@@ -0,0 +1,56 @@
+SUMMARY = "Poetry PEP 517 Build Backend"
+DESCRIPTION = "Poetry PEP 517 Build Backend"
+HOMEPAGE = "https://github.com/python-poetry/poetry-core"
+BUGTRACKER = "https://github.com/python-poetry/poetry-core"
+CHANGELOG = "https://github.com/python-poetry/poetry-core/blob/master/CHANGELOG.md"
+
+LICENSE = "Apache-2.0 & BSD-2-Clause & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=104d5c3c653aeededf4076773aa4c236 \
+                    file://poetry/core/_vendor/attrs.LICENSE;md5=75bb9823a2778b5a2bd9b793fac93ea2 \
+                    file://poetry/core/_vendor/jsonschema/COPYING;md5=6554d3a51d7cb0b611891317f3c69057 \
+                    file://poetry/core/_vendor/jsonschema/LICENSE;md5=2ecb81765361195731a6f72a89e449fd \
+                    file://poetry/core/_vendor/lark-parser.LICENSE;md5=b37b83a9cf129d92ee65aaa71c01ce72 \
+                    file://poetry/core/_vendor/packaging/LICENSE;md5=7a6e56c9d54ecd731ab31c52de7942f0 \
+                    file://poetry/core/_vendor/packaging/LICENSE.APACHE;md5=29256199be2a609aac596980ffc11996 \
+                    file://poetry/core/_vendor/packaging/LICENSE.BSD;md5=f405810d173a1618433827928768bcd2 \
+                    file://poetry/core/_vendor/pyparsing.LICENSE;md5=fb46329938e6bc829b256e37d5c1e31a \
+                    file://poetry/core/_vendor/pyrsistent/LICENSE.mit;md5=1211a1ac6eac40020d0f99c39b4e4270 \
+                    file://poetry/core/_vendor/six.LICENSE;md5=6a574656da93d9ef05431b45907e35b6 \
+                    file://poetry/core/_vendor/tomlkit/LICENSE;md5=be329e5ef9c9fe86738c9afe6ef3c11c \
+                    "
+
+SRC_URI[sha256sum] = "951fc7c1f8d710a94cb49019ee3742125039fc659675912ea614ac2aa405b118"
+
+inherit pip_install_wheel python3native python3-dir pypi setuptools3-base
+
+RDEPENDS:${PN}:append:class-target = "\
+    python3-compression \
+    python3-core \
+    python3-crypt \
+    python3-io \
+    python3-json \
+    python3-logging \
+    python3-netclient \
+    python3-pathlib2 \
+    python3-pprint \
+    python3-shell \
+"
+
+RDEPENDS:${PN} += "\
+    python3-pip \
+    python3-six \
+"
+
+do_configure () {
+    mkdir -p ${B}/dist
+    cat > ${B}/build-it.py << EOF
+from poetry.core.masonry import api
+api.build_wheel('${B}/dist')
+EOF 
+}
+
+do_compile () {
+    ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} ${B}/build-it.py
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


