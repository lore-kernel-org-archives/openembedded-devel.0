Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web12.1224.1591987006234919170
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 11:36:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id i16so7876215qtr.7
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 11:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=5VGS/DuLuV0FXCaSTknVZVak4MlsZnVExX0/WsfrJ5E=;
        b=X1jGCWi7K+baZr5eZl03USMSK04fCRYMbinZIhAjNgJT7u/TUtuQ3wz7Caqs+iG6yK
         8hAXLqIO2kUfAGa1X19ClV2lcHOhT3d9nG8dJ0e4ynvvlKcmmD2CXoexhB01eDrAv03L
         et/FYeuGrA7S0GRtu48hisHAQfKMZrxPkZXccXXK8DesUH6jXku2OWCq6I1qoZ3A6lSI
         x5U2ZqFrvYoIRcWQQBuGb5TfD99JvH6gRs91QcqUm/0jmyMfVV/5Ktm9nEmZzIc5DQVM
         e5FVW7y1A+jIOHj57GygkfgkByJrw0/jYHEROMZdqceeIdNQ0/PFCMzxXTTr1QR2FOb5
         soHw==
X-Gm-Message-State: AOAM531DJyA5BkfiTIBQ+Di78+cbx5ay4kZTA8sxAeB2hHSLGrijvHG5
	T3duWQPCb2L50DF1K0Ntn6VT/A+TBes=
X-Google-Smtp-Source: ABdhPJzmz9VLP/Cgw1yTIRQmBwYQsmVaw4aTBESYEd2EHceh9itDmEHFwmxaspWuTFquWc/xom15TQ==
X-Received: by 2002:ac8:6f79:: with SMTP id u25mr4504317qtv.183.1591987005197;
        Fri, 12 Jun 2020 11:36:45 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id v14sm5561764qtj.31.2020.06.12.11.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 11:36:44 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: Meta-OpenEmbedded Mailing listing <openembedded-devel@lists.openembedded.org>
Cc: Domarys Correa <domarys.correa@ossystems.com.br>,
	Khem Raj <raj.khem@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [dunfell-backport meta-python PATCH 08/22] python3-u-msgpack-python: Add recipe version 2.6.0
Date: Fri, 12 Jun 2020 15:35:53 -0300
Message-Id: <20200612183607.108989-8-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612183607.108989-1-otavio@ossystems.com.br>
References: <20200612183607.108989-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Domarys Correa <domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9f16073b4b1db5dbcff15344a9021bdf731561ae)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../python/python3-u-msgpack-python_2.6.0.bb       | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-u-msgpack-python_2.6.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.6.0.bb b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.6.0.bb
new file mode 100644
index 000000000..6d2e0e0c3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.6.0.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "A portable, lightweight MessagePack serializer and deserializer written in pure Python."
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9eb4691bcb66360acee473a8cf75f594"
+
+SRC_URI[sha256sum] = "754edb07eaee39a9686a99823892e3a1be4e0948d9cc5c717946750c27643c9c"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-datetime \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.27.0

