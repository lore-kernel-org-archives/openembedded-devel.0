Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36670C369A5
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 18:45:26 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.3757.1744137924446753759
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Apr 2025 11:45:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EMjVPg+J;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso5822847b3a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 11:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744137923; x=1744742723; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0D5R0n49mrT6rcO7Egf4k7zlVn5H+ucPn6+y96rrtno=;
        b=EMjVPg+JA/B7lDa9uONi+W8ZEh6tg1N8NuGq0RSKf5amF+oqBmc/maIuxTUF7zyXGk
         H5DnOtT8TQJmr8iuOeQ6eVN4dJP49tXB1En8EM3PpbyY1OgjibhcLye1LBgrbF0JnT1y
         Wj6ZgHPx6iTg6PJLrN9+h3zOqHMfBZoBtj/zaars+q7SwUSMb7ok1WMjMuJdm25B2ydg
         zs+K7edI3OUsPDTyK3dmt+SXjlzzacfbg/p1j7bt9v+/xhnpnRjs1GeiNVZV6viTaqTb
         2ILSVrgzAefL+wtVv6AKtFhxj7VX5kjGCboA+oGXyo9xsHNZht2KrhqivXbwei5DmTyY
         DfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744137923; x=1744742723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0D5R0n49mrT6rcO7Egf4k7zlVn5H+ucPn6+y96rrtno=;
        b=dpqq/JrQppgaWLlrxCILEbVppEDybB0wV1M458EqDGNtFgjH2oPYlt5lSvGF30coJu
         UX6ooTiIh8SZ+o68SVCKJxZlSypaH0LK5BZnsFT+CzwR9GyH5jyCFWA9p07XnYZCWOAx
         oLoYZEiLbYsUp8PwaHeI8o+jjCBsAWRE7p6hc9pl8jGIq7fPwEZqX9HCl5xJAIUZoomK
         v/poZG19CC1sWBC1cBKScfFQl8qoysNt06EV/YZHwdlPA0tc4BjIP3ufJjr7cVahUiT8
         8ZHgfnRyTAfIdBn0N7cD/z4KDYgAjYMu6ejF4XZTpP1Qmf0/TnoTvzR/MuIRnzG6QVBu
         R46w==
X-Gm-Message-State: AOJu0YzQ6E8hBhhkhfl/ltmYTDI0SiaRwaLjl1t99fFWuAbgjQNuVyct
	CXGWQJKIcRAEvTChCjxCUP5GL48tfUT3YEamDBdzgXQWc9Y8I1RrruoSqRMq
X-Gm-Gg: ASbGncttFTd6NtUMieaMAXtHQfgK33SAHDU9t2168xugePTW0XpcvA9A2BrQXaD9YQ9
	zDF8q1ZsWPqHT+RR5EV4eZGXtqGMFXB+vmtN3FM5xNjXBasRT9om0ECaHjrofKd+pmcY3R5XeId
	qdM6MkIMbLMef2q1DYJCPXag+K1tyUdUjj1y3WPXG8rtwlLOE3buvcy3sFqdm/qW/upuPcz8JnI
	j/7KP2tc2xSpLoJvB17qOhQ8jwuryHGIJw9c5SgBJXFiAQXLjT62ErXmdtx2Kq3jqrnYVp17+7e
	UbueDqul66679QZOmVyf9dvB1lMRk7Kx6k+S
X-Google-Smtp-Source: AGHT+IGfU0FnQJZRYRBq7aDJktuDtLGYCaHEu2zpx+I9T6aJkCDI+RhnV7jU7zoQnQioqtqpojrKsQ==
X-Received: by 2002:a05:6a00:2446:b0:736:65c9:9187 with SMTP id d2e1a72fcca58-73bae4bee3emr122197b3a.9.1744137923396;
        Tue, 08 Apr 2025 11:45:23 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f900])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97d1ad5sm11288264b3a.12.2025.04.08.11.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 11:45:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-objgraph: Add recipe
Date: Tue,  8 Apr 2025 11:45:19 -0700
Message-ID: <20250408184520.1291149-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 18:45:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116713

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-objgraph/run-ptest         |  2 ++
 .../python/python3-objgraph_3.6.2.bb          | 21 +++++++++++++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-objgraph/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-objgraph_3.6.2.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index fc6c164c3e..ca91065af0 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -43,6 +43,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-msgpack \
     python3-multidict \
     python3-netaddr \
+    python3-objgraph \
     python3-ordered-set \
     python3-outcome \
     python3-parse \
diff --git a/meta-python/recipes-devtools/python/python3-objgraph/run-ptest b/meta-python/recipes-devtools/python/python3-objgraph/run-ptest
new file mode 100644
index 0000000000..058a9ad9ee
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-objgraph/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+pytest --automake tests.py
diff --git a/meta-python/recipes-devtools/python/python3-objgraph_3.6.2.bb b/meta-python/recipes-devtools/python/python3-objgraph_3.6.2.bb
new file mode 100644
index 0000000000..a17b7aa5d6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-objgraph_3.6.2.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Draws Python object reference graphs with graphviz"
+HOMEPAGE = "https://mg.pov.lt/objgraph/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e48a556235f55ad7d4234475657f68a7"
+
+SRC_URI:append = " file://run-ptest"
+SRC_URI[sha256sum] = "00b9f2f40f7422e3c7f45a61c4dafdaf81f03ff0649d6eaec866f01030e51ad8"
+
+inherit pypi setuptools3 ptest-python-pytest
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[ipython] = ",,,python3-graphviz"
+
+do_install_ptest:append() {
+	install -Dm 0644 ${S}/tests.py ${D}${PTEST_PATH}/tests.py
+}
+
+RDEPENDS:${PN} += "python3-core python3-io"
+RDEPENDS:${PN}-ptest += "python3-tox"
+
+PYPI_PACKAGE = "objgraph"

