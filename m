Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web10.14233.1589552210698546096
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2020 07:16:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=l7PQJaoU;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.66, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qv1-f66.google.com with SMTP id d1so1128772qvl.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2020 07:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=x3B6P2kmooYCcm8bQN69vqFsXnBGRnN7aEdfyeQNI+E=;
        b=l7PQJaoUr/QwWciz8/SusYg1n4oS7luwSeyXXllFwIlFmc+moeh/iNfNWXz/mBllnN
         8TrrzRPeN3cN+Gfwjp0tQ4GSU3ZPtSRIPwFwIxwUbsE5Uqy5MPTMrwpsuxnqU7F+YvHv
         PpExi/NDxGfV+Hj4Dy54ile6q/x4O+ZAleWxDq5AcGvee1jOfwPQsX5VTdHwn/k4gaB7
         8ZItqj3Ot8MlqLUly84pk0lmHKPbukH3LOOOiyOQ0OoGx69hdFwjkVV703wIh8L6OWnD
         tLWzZ3gjKLy4d6J1ZB2UNhwiBoHvVff8DBtVUjGFuIKt4CiqiyJsMCPX4quFZiFxxlle
         MI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=x3B6P2kmooYCcm8bQN69vqFsXnBGRnN7aEdfyeQNI+E=;
        b=cXup8znm1f/ZGIGQkLvWZAzsrWKtbe2FevACol6pXU2otvZ7YtiofrQnf/j/JsDsMe
         UD7VeVwg2Q5iO5HTZ0to9EN9MIBcjyYyye+gzlKelzucWnjxgF8z2VNeBORGdcDG1ewb
         VNRll07shq/Tm6MpOEsApqtovNwMbBWINYxoM2MItmyB7Jp6q4FuqjS8+F1IioRHn29b
         ybO1MLC8nhCGMgVV6DB9xx5Nw9daaewUNUhLepmKTqLZ0aW+8UmWPQ2kmwQBkeQJ24BP
         m9oJnDmZpcYAQrDH/i3kV56+FPpysbCbe6tgZ5MFC/HtYoISvHf/eM3Zx17Is/Cny2ra
         i1tw==
X-Gm-Message-State: AOAM5339KWXgyX+BBDMH57f55NbmSNGJqju7M+/FlSbVISsLoiSBW3C/
	05VO5qulji4kcFeBuVl+s9uwEhEpnr8=
X-Google-Smtp-Source: ABdhPJxcAMnAVKX90dPqeBn8uXunjKHxhhG6kGQMOJoR1lCeK0+f+tc3PuR+3yN8uObu0Cdc5owKCw==
X-Received: by 2002:a0c:eac4:: with SMTP id y4mr3623601qvp.39.1589552209692;
        Fri, 15 May 2020 07:16:49 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from Monster.domain.name ([2804:7f4:c195:1db7:5434:711e:b23:e7fd])
        by smtp.gmail.com with ESMTPSA id m33sm2170749qtb.88.2020.05.15.07.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 07:16:49 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [PATCH 03/11] python3-aiohttp-jinja2: Add recipe version 1.2.0
Date: Fri, 15 May 2020 11:16:22 -0300
Message-Id: <20200515141630.27789-3-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515141630.27789-1-domarys.correa@ossystems.com.br>
References: <20200515141630.27789-1-domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 .../python/python3-aiohttp-jinja2_1.2.0.bb        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.2.0.bb b/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.2.0.bb
new file mode 100644
index 000000000..de336af22
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.2.0.bb
@@ -0,0 +1,15 @@
+SUMMARY = "jinja2 template renderer for aiohttp.web (http server for asyncio)"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c82758543767c96574b6e29fc478fb73"
+
+SRC_URI[sha256sum] = "2dfe29cfd278d07cd0a851afb98471bc8ce2a830968443e40d67636f3c035d79"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-jinja2 \
+    ${PYTHON_PN}-aiohttp \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

