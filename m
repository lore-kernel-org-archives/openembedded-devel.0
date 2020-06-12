Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.1347.1591986993531015412
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 11:36:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id i16so7875707qtr.7
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 11:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=fXZ9mGgxiKt5omuiDg5bFP2gHpsTgA1IIzk0iokBOp8=;
        b=KrBYfAUamk+qgg6/ryt7so9KHMu8pEkJrqFlowjBOAyRQZWqdiotTW6dG477ufLG55
         MK4N3bISr0hhyDpX5w3iRrR6mMLHG2JlNHh0J1nKkGwv9svQKscbuFMBr6bI1L0MzuWK
         s4UoXaERyhqGYwqh0qcip93T2S0vs/12g9q6rBuv6vQcjwUepOTdJzwXBcxPwAHPTlbZ
         bZ2yFRXd8xeM7BK4iOFuFLRYsyICdQRlCHtoCqYRwA+YeDbvUwsInRHnlugBxF7jwC8r
         NAp0WftntF6YkNOAxln1TutXcJTEJ0orVl49JBKjo+hEqsd7F/OMp3J0QKNgXqnhZNDY
         HLaA==
X-Gm-Message-State: AOAM532BnC2lYmDlP6n7TyMKP4AEL8dwV0H+RxnSKRzPexvouJqAmgnG
	+oGpgL6RcKdv2r3KZY8oJBuYqohzp08=
X-Google-Smtp-Source: ABdhPJyoV6GC0DggrvefMpEd05maAn62u7Q2mqWmYtqUfjK1wp1lGyjz+f1GpzYJJZrFZyd85lHtFA==
X-Received: by 2002:aed:3344:: with SMTP id u62mr4448498qtd.174.1591986992461;
        Fri, 12 Jun 2020 11:36:32 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id j5sm5605694qtc.72.2020.06.12.11.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 11:36:31 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: Meta-OpenEmbedded Mailing listing <openembedded-devel@lists.openembedded.org>
Cc: Domarys Correa <domarys.correa@ossystems.com.br>,
	Khem Raj <raj.khem@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [dunfell-backport meta-python PATCH 04/22] python3-py-ubjson: Add recipe version 0.16.1
Date: Fri, 12 Jun 2020 15:35:49 -0300
Message-Id: <20200612183607.108989-4-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612183607.108989-1-otavio@ossystems.com.br>
References: <20200612183607.108989-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Domarys Correa <domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 11858121c397d085bc5a7d568a81cc2138e65254)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../python/python3-py-ubjson_0.16.1.bb             | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-py-ubjson_0.16.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-py-ubjson_0.16.1.bb b/meta-python/recipes-devtools/python/python3-py-ubjson_0.16.1.bb
new file mode 100644
index 000000000..31f07a518
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-py-ubjson_0.16.1.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Universal Binary JSON encoder/decoder"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=383b9e6c3f9d1386a4eea17792291d91"
+
+SRC_URI[sha256sum] = "b9bfb8695a1c7e3632e800fb83c943bf67ed45ddd87cd0344851610c69a5a482"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-numbers \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.27.0

