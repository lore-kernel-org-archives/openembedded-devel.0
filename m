Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE293C001B0
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 17:58:38 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.1164.1690221509399973878
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jul 2023 10:58:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=q3a5PE/4;
 spf=pass (domain: baylibre.com, ip: 209.85.222.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-76731802203so429804385a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Jul 2023 10:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690221508; x=1690826308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lcr1fawocJaQd5tKkiDogbsFcywFwjJBp96UeCRNE2w=;
        b=q3a5PE/4NlODt+/z6iWvpkw+A9V9ySA3WzWlFq/htfl78O5NB6noV2l7q+qtW2jmdU
         d8JuARUsYIHbmCaJG12UlckoVlh9oqrP2iqytmZUC+F1nj6gg3+9Gt0iP8HjZDy81MIj
         LWvHGZCR6QayxA6r3sh9anXX+eiBemYyOo28cPcKbj2dMaErbOXLfxhqpkKRyFokU5FQ
         gdCYe2YqWRSsu5pEjHshIXIdNGc1sH8ajc6Mi/NslYcBmhDyW0BBSopBjvEd48udFG3P
         WO9N2jTgU089BBCQ0S2zv/QtwnU7DQX/SsuCmrnXPMG0gqHYUJl0+Gh+8SjGrs0e9OU5
         e8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690221508; x=1690826308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lcr1fawocJaQd5tKkiDogbsFcywFwjJBp96UeCRNE2w=;
        b=BoaPALeB3lR0lV07ASlnT2j/LFfD8NQUO00o6M2mdky2n+uPdo4psogkj48ZMiL+ZV
         VQVnWlhsj9EgXTh5GwaWSCy6+cGhdTDeuP1RCRyHKCALNApCqQm3etbVjkYp91y6b9Q3
         B9tdY+7uu7YpbNHnXvCqoFVSepNHmCPeaiOKIoSem07OS2cjAL5MVEoQvwQAZjGwWgX2
         MdK6JJIh2Dc+ZCORrYZ+vdNuAhJ4U6e33mmUtAPkveGEG1vcCzYeFziyArtrVLn9RDFt
         +BGgsg9qPF2GsSzHjkVl2JECNJGYyfF3Boca+QSlojz5iOBByRkbkfxsm7n59fCCc2uR
         pn3A==
X-Gm-Message-State: ABy/qLbHbNRqgjDQVaI54O/dx7rwA6Cxw+NW970M5u41K0tm4sfOYFx1
	e8FfS5QL7kgUVNY7TyHyLj9a2laSq5nFnrXOe2k=
X-Google-Smtp-Source: APBJJlF5HZ+D1mmEfCLnoFl21Y7VfwDsRlRpF4zaJNxEyqcAt8jXiweE/lz4tWpBTf65OJir52vzcQ==
X-Received: by 2002:a05:620a:2550:b0:766:77b7:4c73 with SMTP id s16-20020a05620a255000b0076677b74c73mr525485qko.35.1690221508337;
        Mon, 24 Jul 2023 10:58:28 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id j2-20020a05620a000200b0076aeeb69cb1sm1646065qki.4.2023.07.24.10.58.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 10:58:28 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/2] python3-versioneer: add recipe
Date: Mon, 24 Jul 2023 13:58:25 -0400
Message-ID: <20230724175826.80617-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jul 2023 17:58:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103997

This module is required by newer versions of pandas, so add it as a
recipe.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../packagegroups/packagegroup-meta-python.bb  |  1 +
 .../python/python3-versioneer_0.29.bb          | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-versioneer_0.29.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index b23d24c6d4..9500f80e03 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -446,6 +446,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-unidiff \
     python3-uritemplate \
     python3-vcversioner \
+    python3-versioneer \
     python3-versiontools \
     python3-visitor \
     python3-waitress \
diff --git a/meta-python/recipes-devtools/python/python3-versioneer_0.29.bb b/meta-python/recipes-devtools/python/python3-versioneer_0.29.bb
new file mode 100644
index 0000000000..bdfbfd1be1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-versioneer_0.29.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Easy VCS-based management of project version strings"
+HOMEPAGE = "https://github.com/python-versioneer/python-versioneer"
+SECTION = "devel/python"
+
+LICENSE = "Unlicense"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f4c62131f879a8445e16a7f265aea635"
+
+SRC_URI[sha256sum] = "5ab283b9857211d61b53318b7c792cf68e798e765ee17c27ade9f6c924235731"
+
+inherit pypi python_setuptools_build_meta
+
+RDEPENDS:${PN} += "\
+    python3-json \
+    python3-netclient \
+    python3-tomllib \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.41.0


