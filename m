Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F25CAC74A5B
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 07:25:56 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.13881.1679037952881248766
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Mar 2023 00:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=paGF/41i;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id eg48so16710978edb.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Mar 2023 00:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679037951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oml+LuoxAlJzwaC9neawoGtLMY9gjb0znF5aFuRvIuc=;
        b=paGF/41iX49m/Non8A1dWMHO3eW7pkCLE36UqWTccsJg8Pyunxiy2jU313XOdza+TM
         O7FwVF2u3WygBXDTzYdX8R7dxDuRQ7r5q2yvs+sorgdkB6q7SypF31oI/pCmHxH5c/YW
         Y4GXkwz+zdkhH5wIAnUlzmBMVlHWdJH2kAWWfO3eI4or/ZCmbiNrTYeAcf02ccXmJjOG
         xNPSQrUHBPDqe7zEbwhGdTmz+49uR7ufFAKnH8QRvx1LhvoRoId735WLJNbKQmP36OYu
         U/C1Ncepg5DR5pzozcE1c4T6tuz8HjK7vIvIIJu8EPbVUW0uu+aVZVLkZPWpd0yJuQTl
         sNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679037951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oml+LuoxAlJzwaC9neawoGtLMY9gjb0znF5aFuRvIuc=;
        b=pFEYJVIlY4OCjGqbipRAIlwGOjvCM2ZvPas0UuEa2jEkq+2xvC6SGUcHxOpkpct/M0
         7907twFGfYSwnRND63Sl9ix0EbGoi9TGvRyaWzSCKg01rEoQKTSlbZvQvko0mR++m53y
         mRmyS1pank6QXnIN9zOc1dhHfRXz21BPz7T0KOeuMFXXq9xzcrhPTtsfZcf3ZKQLaevo
         nwp68Qf3Ix1gwYk9dE0C8zFHPighfwQE4Zlwq8QoB4uTnmn/VX02OraW1uYQWtrbHKcB
         x8g69Uq1VK4WWSncrAPdi6R3S5xo5BTsXnmEPYqak8p7RHiKzuF1F1Q6ENzdLYyZ+9ZB
         UcyA==
X-Gm-Message-State: AO0yUKUfq/Xo3FZLLYQ5SLsc1ntP1mmFq/o1j3Ge0ni9W3JpxYxy0PR5
	s1UDL1JCAIaKNo00kp+b+diOzZXkXQT+ng==
X-Google-Smtp-Source: AK7set/Xr4q6ar1fGieiZhpEpvfW9CrSMswEkx/GOm+K3ujRm7laLS1ueLKhprQNcJKcxVWGt8ieQg==
X-Received: by 2002:a17:906:46ce:b0:8e9:afb1:65c6 with SMTP id k14-20020a17090646ce00b008e9afb165c6mr2291409ejs.13.1679037950814;
        Fri, 17 Mar 2023 00:25:50 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id zc14-20020a170906988e00b00927f6c799e6sm621864ejb.132.2023.03.17.00.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 00:25:50 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH v2 1/4] python_mesonpy.bbclass: New class
Date: Fri, 17 Mar 2023 08:25:44 +0100
Message-Id: <20230317072547.1031123-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Mar 2023 07:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101586

Some python modules (e.g. SciPy, scikit-image) use meson-python
(a.k.a. mesonpy) in pyproject.toml:

    [build-system]
    build-backend = 'mesonpy'

This class, together with python3-meson-python and its dependencies
will allow building such modules.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-python/classes/python_mesonpy.bbclass | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-python/classes/python_mesonpy.bbclass

diff --git a/meta-python/classes/python_mesonpy.bbclass b/meta-python/classes/python_mesonpy.bbclass
new file mode 100644
index 000000000..f4c4a217a
--- /dev/null
+++ b/meta-python/classes/python_mesonpy.bbclass
@@ -0,0 +1,17 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+inherit setuptools3-base python3targetconfig python_pep517 meson-common
+
+DEPENDS += "python3-wheel-native python3-meson-python-native"
+
+PEP517_BUILD_OPTS = '--config-setting=setup-args="${MESONOPTS} ${MESON_SOURCEPATH} ${B} ${MESON_CROSS_FILE} ${EXTRA_OEMESON}"'
+
+export MESONPY_BUILD = "${B}"
+
+# Python pyx -> c -> so build leaves absolute build paths in the code
+INSANE_SKIP:${PN} += "buildpaths"
+INSANE_SKIP:${PN}-src += "buildpaths"
-- 
2.39.2


