Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web12.1218.1591987003340842495
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 11:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id j32so7853318qte.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 11:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=g0fbUwEuGN17wqoyZlHvbxyzjvbjc9XMVanSx2sLnI4=;
        b=fK8MUluUDwzf+6lHrQ5dJ8jFUm+Br+oopBes6qmAEqpqqqSATDtumq0ba9oHadq31G
         if/6ArYwckmZdQjM56y9BXtAJ7TdN382XtG5FhcJR34dC7OV5yAgNKdj9GNMnE5GUVAj
         zrv+q3IbXS2u1R5o5sG/zipbksR1NMsNhRksiL1qqjHVVJMM34CSJs5k6E9TNN7WNuCZ
         zVqGyoD9xQxJF2v40t4A5ome6hcTq90y0rmS/rUUKIYwuXbMRJ54Z9s4Slwh0PWi58s2
         7LuKL6FmXZaf+/OYn/mQj5JiIWGtzmIDTG0LyVfL6AbwQ5XLtt0WDwWhHcMRvoAWjgwj
         vWHQ==
X-Gm-Message-State: AOAM5310FS2ymAzPhKPkGE1Cv4ECJ0sy7MdPaxYT/ORVlMeDL4Zxqluz
	gjGN8euZ8VVc1mSaJ+s6IN5ShHLvGsQ=
X-Google-Smtp-Source: ABdhPJz5TdztehmSBfPfgJrWzEWB9rrwhoLOYjItt8rgQv/70hYQRSaJzekG9DVd1YCkfydISct9RQ==
X-Received: by 2002:aed:3f6d:: with SMTP id q42mr4613293qtf.41.1591987001947;
        Fri, 12 Jun 2020 11:36:41 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id p4sm5120589qkf.53.2020.06.12.11.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 11:36:41 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: Meta-OpenEmbedded Mailing listing <openembedded-devel@lists.openembedded.org>
Cc: Domarys Correa <domarys.correa@ossystems.com.br>,
	Khem Raj <raj.khem@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [dunfell-backport meta-python PATCH 07/22] python3-txaio: Add recipe version 20.4.1
Date: Fri, 12 Jun 2020 15:35:52 -0300
Message-Id: <20200612183607.108989-7-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612183607.108989-1-otavio@ossystems.com.br>
References: <20200612183607.108989-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Domarys Correa <domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 97b34ad1f1a8a07216d99c1838ba20299eaa5232)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../python/python3-txaio_20.4.1.bb                 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-txaio_20.4.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-txaio_20.4.1.bb b/meta-python/recipes-devtools/python/python3-txaio_20.4.1.bb
new file mode 100644
index 000000000..75a9395a2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-txaio_20.4.1.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Compatibility API between asyncio/Twisted/Trollius"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
+
+SRC_URI[sha256sum] = "17938f2bca4a9cabce61346758e482ca4e600160cbc28e861493eac74a19539d"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-twisted \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.27.0

