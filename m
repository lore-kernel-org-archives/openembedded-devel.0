Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web09.2633.1624825343844973765
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Jun 2021 13:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QhU8kfMn;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id u19so1997759plc.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Jun 2021 13:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=8wFQv/5hgSLyIU5DezQjYw8Dxip611gBUFSe1hZsyQg=;
        b=QhU8kfMn4YZ7b4nFkT9EX2zQKBp0ayypmx7iDMxAt8K9uCArBdRqvPAY//tdGyY/s5
         1PJppqOA9ieS+AINCb+vnCaW2uKEHsUqE2hwKDm6MXx9YN1m6nf1q6PsaR8vXLAcyQrZ
         zgbfR53cX0iFe6waR+3gr+0cVoRDC4FW1penCDuKZEeDCGpd9lfDHJAg1H/DBJB5WE0x
         m+HW5smuzUy0u4iJhyHygB6KrrQRbXcZtk5ALsC43eh4kD1e8g7bt0tqWBvjDlik+EXm
         Sj4RQYN8pjlrUCSf2aWE/CE3Z//Z5juPggS3VH+uTAE+ju/BPpr/DqphfaVrfrQTbHK9
         WCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=8wFQv/5hgSLyIU5DezQjYw8Dxip611gBUFSe1hZsyQg=;
        b=YYnIU8nQqAXi1y22Kn+e7xYW56qiMbddsGvOUxmQR3hYotd5Mpceo2jaawwEHr5lBe
         K0WRY4FSwLdZwco8ZtOw5gEPJ4scdWf1Bme+GLs8VDAWH3AxOlpaRwjS4kLBtzzqGkzB
         rtvSaUe2bCL1ReQxYUqFOSQ3nK0W2AzKT/6t1LvbagYxrfz6vOKyzRXh8u5ni/subjC2
         WPAav55j8FkJJk7aCFNf/z3p3nsgl/khtrwUHgCKKbIaTNdMbXwpIqpqpiPN1pwUNBWl
         HCWugE0hAKaShAuS0l701MY2o4qt5Pn2JWuVrhtvL/gXARc7DaBxl/j0BkA1GwWJKwkv
         TUOg==
X-Gm-Message-State: AOAM531+INR0mOs2OGwE0boGuWidHKxCIHBVz7wIaEh5LIb9099FLSnI
	DDEBmBaafDuYNWfQmQIIanZK7y0fU/Q0dQ==
X-Google-Smtp-Source: ABdhPJzfBOmC5HVlRbn9/YFIaHkXBVmStHm4PGMHJvb8nOeO03J66Bs4gnDanGtA7uhrEu+gtx2fdg==
X-Received: by 2002:a17:90b:19c5:: with SMTP id nm5mr24211201pjb.141.1624825343281;
        Sun, 27 Jun 2021 13:22:23 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:90a0:cfd2:ffe1:efef])
        by smtp.gmail.com with ESMTPSA id ay3sm3501192pjb.38.2021.06.27.13.22.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 13:22:22 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 05/20] minifi-cpp: set correct python processor directory in configure file
Date: Sun, 27 Jun 2021 13:22:00 -0700
Message-Id: <6926d7b3f0d7479c06cf4104de9c6e043b0fcd45.1624825239.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1624825239.git.akuster808@gmail.com>
References: <cover.1624825239.git.akuster808@gmail.com>

From: Yi Zhao <yi.zhao@windriver.com>

Set an appropriate python processor directory in configure file to fix
the minifi startup warning:
[org::apache::nifi::minifi::python::PythonCreator] [error] Could not access /etc/minifi/minifi-python/

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a86b772e31079231a04762ed49ec83d32005ca15)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
index 322b58477d..5b27601c04 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
@@ -88,6 +88,7 @@ do_install() {
     install -d ${D}${MINIFI_BIN}
     install -d ${D}${MINIFI_HOME}/conf
     install -m 755 -d ${D}${localstatedir}/lib/minifi
+    install -m 755 -d ${D}${libexecdir}/minifi-python
     cp -a ${WORKDIR}/minifi-install/usr/bin/*   ${D}${MINIFI_BIN}/
     cp -a ${WORKDIR}/minifi-install/usr/conf/*  ${D}${MINIFI_HOME}/conf/
 
@@ -101,6 +102,8 @@ do_install() {
         ${D}${MINIFI_HOME}/conf/minifi.properties
     sed -i 's|nifi.flow.configuration.file=.*|nifi.flow.configuration.file='${MINIFI_HOME}'/conf/config.yml|g' \
         ${D}${MINIFI_HOME}/conf/minifi.properties
+    sed -i 's|nifi.python.processor.dir=.*|nifi.python.processor.dir=${libexecdir}/minifi-python|g' \
+        ${D}${MINIFI_HOME}/conf/minifi.properties
 
     sed -i 's|export MINIFI_HOME=.*|export MINIFI_HOME='${MINIFI_HOME}'|g' ${D}${MINIFI_BIN}/minifi.sh
     sed -i 's|bin_dir=${MINIFI_HOME}/bin|bin_dir='${MINIFI_BIN}'|g' ${D}${MINIFI_BIN}/minifi.sh
-- 
2.17.1

