Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F112EC433F5
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 08:32:38 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web09.10109.1642494758054656530
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 00:32:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cRMgIAh6;
 spf=pass (domain: gmail.com, ip: 209.85.208.53,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id u21so76080600edd.5
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 00:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BELyZ/kBohj6sosVDCkbb/UvAX2xj683Tde0m+Z8Vvs=;
        b=cRMgIAh6YtfRNk5oT4zSUGg3TOK/VFeWVw5MEY8cxAjsGAmGIHp0auzDitl3iX/EN1
         Evak7Srhc+NOotrKpgw0EtnHV0eA7Ws4jzddDf9FG59WJfCrc+bG6NmF7KZGKfjsNXSD
         SBhyiz/3WYd5hsJo02F+FXZFOuJDEnl7aqkbRR7vZr46ZQIKrmrRp3e21C996RrM32gt
         pl93Mhab0gNIFAWiqw87V2cT/uYGM5LX/EqM3QvSy+EdTJKmxT/v08EWs4r14R9iN+Z9
         hCXMTJo8Mwkdv0O0eJKqlh70akI2OvUEJJcMIAC/nCpcR8X8auNsk8gnTzsXtWltqK59
         qKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BELyZ/kBohj6sosVDCkbb/UvAX2xj683Tde0m+Z8Vvs=;
        b=1nOycJpdcnOtzf8QwLOjb5E0lUjYCmyiESA7zyxyqnqRUkkcboESqIJNTmGnW0JQpz
         rHdpJa5IBre3EsOl7h80Q0Taqr08crwue6rcGZCNQTSyFPBgPS0ZKMdh5YHfnefHgMcp
         4/VCwhHyvaCrEcR0iNlz3gdimZVDBqX4yY8vlaWQcDNAOC58A/kjtcG21wS7pUeMLWHo
         2cxYex36tAvkD3CV15c9cbO1RDIiz4TRGmW+wnmfEyZtL+Oq7ZuSvaf44sKqiTjqhIE8
         u68K0kUPwsiEA5SFL2JgfHSeWWJLEQEdnCRWNyw8yBq6J89XIat9Ju31p/z2t5STjTGM
         qZkQ==
X-Gm-Message-State: AOAM533jtAprrDOYnG3wu5pVOp48iN59TydbLUyHJblZILsDIPiuMnPP
	GsnLasD64bPR9qBP0TINv712YnExe0g=
X-Google-Smtp-Source: 
 ABdhPJwegB5c5UQOLWCq+jHEA6Az9/5JJaycm7uPbnRQRyTd+YIEEFnpD1yjZ1jkRvLd4Kykcgnu3w==
X-Received: by 2002:a17:907:6d9b:: with SMTP id
 sb27mr10060789ejc.139.1642494756219;
        Tue, 18 Jan 2022 00:32:36 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 ku14sm105979ejc.197.2022.01.18.00.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 00:32:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-python2][PATCH] distutils-base: stop using
 distutils-common-base which now triggers warning about distutils removal in
 Python 3.12
Date: Tue, 18 Jan 2022 09:32:34 +0100
Message-Id: <20220118083234.2427848-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jan 2022 08:32:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94910

* distutils removal in Python 3.12 doesn't affect already EOL Python2 recipes

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 classes/distutils-base.bbclass | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/classes/distutils-base.bbclass b/classes/distutils-base.bbclass
index 803dc8b..26aadad 100644
--- a/classes/distutils-base.bbclass
+++ b/classes/distutils-base.bbclass
@@ -1,4 +1,34 @@
 DEPENDS  += "${@["${PYTHON_PN}-native ${PYTHON_PN}", ""][(d.getVar('PACKAGES') == '')]}"
 RDEPENDS:${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' == 'class-target']}"
 
-inherit distutils-common-base pythonnative
+inherit pythonnative
+
+# the rest is meta/classes/distutils-common-base.bbclass before the bb.warn was added in:
+# https://git.openembedded.org/openembedded-core/commit/?id=54b455049ee94c01c78b31b6c744c8e32b5b7737
+# as the distutils removal in Python 3.12 doesn't affect already EOL Python2 recipes
+
+export STAGING_INCDIR
+export STAGING_LIBDIR
+
+# LDSHARED is the ld *command* used to create shared library
+export LDSHARED  = "${CCLD} -shared"
+# LDXXSHARED is the ld *command* used to create shared library of C++
+# objects
+export LDCXXSHARED  = "${CXX} -shared"
+# CCSHARED are the C *flags* used to create objects to go into a shared
+# library (module)
+export CCSHARED  = "-fPIC -DPIC"
+# LINKFORSHARED are the flags passed to the $(CC) command that links
+# the python executable
+export LINKFORSHARED = "${SECURITY_CFLAGS} -Xlinker -export-dynamic"
+
+FILES:${PN} += "${libdir}/* ${libdir}/${PYTHON_DIR}/*"
+
+FILES:${PN}-staticdev += "\
+  ${PYTHON_SITEPACKAGES_DIR}/*.a \
+"
+FILES:${PN}-dev += "\
+  ${datadir}/pkgconfig \
+  ${libdir}/pkgconfig \
+  ${PYTHON_SITEPACKAGES_DIR}/*.la \
+"
-- 
2.32.0


