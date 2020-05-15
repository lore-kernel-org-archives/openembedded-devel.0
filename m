Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web12.14066.1589552209277932785
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2020 07:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=v+qxAG92;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.195, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qt1-f195.google.com with SMTP id p12so2007506qtn.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2020 07:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/xcIujxFZdYuNIbRx1yuwINmWPJyU+5G9p4ONqAjnkk=;
        b=v+qxAG92evXpBgL9wW8eIa0ZBvEaLE3letbM9XejLRrwGrYCZtJKoA0dlPKmcaxo5d
         LbNgtNevgd3PKT5cxNan7b6KePZf5kZn0fORRhOaYZ8P7zMgExMArJfP7LdfoS6kLTlv
         rkkER6UjFc5PIJ7lelCe+0COsZbYtq5suSY1AxNjSNlU0HIpwelNYJqzng0JuvxD8uZY
         QXwJ3ZgJxiUVAnXJMRtpo/bPJmaVw199v83iZHLLl7cX73us7cbi+g36G3BNsl41gek0
         7FqNo7e4s6/aZZSlC40dq8DzeyBw0KNzfIsu5ES347LTW564OmIhOAZOwTsrvYunqbkO
         i9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/xcIujxFZdYuNIbRx1yuwINmWPJyU+5G9p4ONqAjnkk=;
        b=Y1iaLVMvAOiJokk2FmAhcC0WkpktgueWMogKt5OVNoAgXcASqwE+hwjK4tJBPWcV1w
         xS4CqSUpkb1BrsSbr9HEX8HJ3CkRnVCt3LbbK1BeGFbjhEeilNiSiof/kPzi+a37IUgq
         W5qw7rHpNKUPmdqq/kUFYYeGPcCYtOal8RuwVao90Y0n1rsfel6ZZPt1qoVOwPh1enrz
         c5nGFt3anNAt6VjZE5MG/liaCMltChPf7RzH1ikdorsmLJsBQqqHqDik+Wvr7d2dzhvM
         ipei/uS+m/3vC4QeFAsWWelarbN7Qu6pIMJmfaCOEmhBtyV9p14vUnNNb8s4LAf5rq+u
         b63w==
X-Gm-Message-State: AOAM533yPQPDiXuf1hDWl0cHJXg8xg56l4zkB3Q5ALDM6FNW8orLPiEn
	N9pQFlvSu1eCKtdIcKX7sQFw4ruMQxM=
X-Google-Smtp-Source: ABdhPJwfM7ukzLnu9TKMIoRrIhVevWxwuK9Z1rDovSplogqCuoduZqcM9EeXTLm2TWxFx/Z4xQc1Ww==
X-Received: by 2002:ac8:7941:: with SMTP id r1mr3820257qtt.120.1589552208049;
        Fri, 15 May 2020 07:16:48 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from Monster.domain.name ([2804:7f4:c195:1db7:5434:711e:b23:e7fd])
        by smtp.gmail.com with ESMTPSA id m33sm2170749qtb.88.2020.05.15.07.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 07:16:47 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [PATCH 02/11] python3-graphviz: Add recipe version 0.14
Date: Fri, 15 May 2020 11:16:21 -0300
Message-Id: <20200515141630.27789-2-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515141630.27789-1-domarys.correa@ossystems.com.br>
References: <20200515141630.27789-1-domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 .../python/python3-graphviz_0.14.bb              | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-graphviz_0.14.bb

diff --git a/meta-python/recipes-devtools/python/python3-graphviz_0.14.bb b/meta-python/recipes-devtools/python/python3-graphviz_0.14.bb
new file mode 100644
index 000000000..98bbddd21
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-graphviz_0.14.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Graphviz protocol implementation"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+SRC_URI[sha256sum] = "e104ba036c8aef84320ec80560e544cd3cad68c9f90394b4e2b87bc44ab09791"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE_EXT = "zip"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-logging \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

