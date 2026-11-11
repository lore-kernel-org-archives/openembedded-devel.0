Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3640.1794429601506107041
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 12:40:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=pNW9S6Dp;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso1540550a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 12:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794429601; x=1795034401; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kwwvbVpbBKpTwniQr0F26nnvIbZB981KNeSIwtQvbmg=;
        b=pNW9S6DpyZUA22i7RuRhS4qTPbTlKBaHET6dAuKrek10tMlCvF1NVNTpXb+IO3GzzH
         VFOCkVVb1JAZZPWwsd34AXVGiDr9WoVT59id1q+Nknq5IysaP37PQuhkr/Xo/zZs6a9f
         l2OJU3CnSZ6S02zHBGjvKNJmDFZiD7AwlYzhLmUiucLxZK7lD4sJwtJiF3UcnxKbVLlG
         BboZey3UFtEl9qVkYP+GmqyfzX3QrPHnwHmFon6Bji90Ep99C8L76fCBtX6GgPqAUuPo
         QgKM7Dv+ACJPZCkSfk9PmHn0mDgvPEwKqHZ+FZtJ9ZCgxrpksCWsAOKKqLsj1fygdX9a
         DGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794429601; x=1795034401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kwwvbVpbBKpTwniQr0F26nnvIbZB981KNeSIwtQvbmg=;
        b=NAgNKqYFW8vK9LYLUrS2+cQ8VuTKWFwVmiDCOKFeVIjBRDOXj2Mqsdy+rLDESfI2jE
         vFwkkCf1vlNHS7BDkSYMj33sXpth8C8CjRs7wa2MKWHU3muPSmSYnhkBzdtaE731UzQV
         XG6VAHJz9wKk2rHpFu06Zz4tTj8wHnk4Fl5fMzSdJIG2DGnBc26pNmo8P73NUdkOGdrc
         yaKt+gxYw6DlBbNLE0ly4ZPMbbiozV4E9OuB/G+YHWJ5fkEq1liM9HUmu1jsbZRVIi+5
         kSvv8KTqAkD8ZcIF3Zw2riEB8NKt4um9rRUvx4Eggf/vQ/mFDsiqldlyoymycyI6Whe8
         K6KQ==
X-Gm-Message-State: APuU4Z+Vls0kJHpowAeBoBSwm84zyt9RfkM9/9efGyUhpfSO45Sp6Hpx
	wYnZn7FuxMCRPeN0JU/4YqVoLx7fdzge1C84lE8q1KjdcLCFOlDtZY8K+sNkJXam
X-Gm-Gg: AYBFou152rcZ499tYMRdvGSdhLoac4mSMGTG1Ki923GrdxAvNhyimsVKx2dKND7eMSv
	ve19K3XlNwBcjveOfjWqIEHC2ozF4QO/li9ePrc64gXHBtEPHbH39UdjjxVjvY1Ss79F9I7CiU/
	YbgJofbbTQsdqw3sHBIylOY+Ttz3KSxb6A35EEXRCDkSfyO8kFWQRm5Nkajqc8175vgXw/EFCvr
	2i/bFjE1263CPSWueF7Opy9Q/2g8u0bXb6oa0SfceBsiQ7KQhWu+fQqmc6xwR2xpwF4LKgbXMbR
	VS19Gk9HIin0TuXs8c4juvro1WjWOXuMn/5gf06hmZuL+AiGCoXiQavGWvbZgcaWxBlkJoD+3MG
	Wb/rVG2hFX8F0KvaU9XJkULC6AehVNTMeTY3DCG9WubTcyjnY+E+O7wmIecTmpLCFN0LUUG+QlN
	EvbDyue0ASDS93pkBdTV5hYgLP1yYgp1yZBd0f/zTXAS9n6jtZVzQrQMfFDtK1v+5A6YDVJtsoU
	0r54Nq67RzclUpCmnTeP1Js6zthxlwzRvILGs2dF+uWiW8kSVaofiVIfZhefWL/4AjYuMuGQ01s
	qyGQQ3N9Z1iLn0RcZFrgJcR8lVFHhKzBTMEJBdpbfkXIVUBcpnLjAz4Hry6LQiE=
X-Received: by 2002:a17:90b:4a12:b0:3b0:9fbf:8951 with SMTP id 98e67ed59e1d1-3b182e0346bmr3570997a91.5.1794429600833;
        Wed, 11 Nov 2026 12:40:00 -0800 (PST)
Return-Path: <bbnpreetsingh@gmail.com>
Received: from localhost.localdomain ([108.180.159.198])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d699b93sm1841011a12.14.2026.11.11.12.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:40:00 -0800 (PST)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [meta-oe][PATCH 2/3] pgxs.bbclass: add class for PostgreSQL extensions
Date: Wed, 11 Nov 2026 20:39:56 +0000
Message-ID: <20261111203957.7-3-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111203957.7-1-bbnpreetsingh@gmail.com>
References: <20261111203957.7-1-bbnpreetsingh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 20:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132139
Content-Type: text/plain; charset="utf-8"

Extensions that build with PGXS need the same dependency, make
arguments and FILES. Put them in a class so a recipe only has to
inherit pgxs.

Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
 meta-oe/classes/pgxs.bbclass | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/classes/pgxs.bbclass

diff --git a/meta-oe/classes/pgxs.bbclass b/meta-oe/classes/pgxs.bbclass
new file mode 100644
index 0000000000..b1c7aca264
--- /dev/null
+++ b/meta-oe/classes/pgxs.bbclass
@@ -0,0 +1,22 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+# Class for PostgreSQL extensions that are built with PGXS
+
+DEPENDS += "postgresql"
+
+# USE_PGXS is for makefiles that can also build inside the PostgreSQL tree
+EXTRA_OEMAKE:append = " USE_PGXS=1 PG_CONFIG=pg_config"
+
+pgxs_do_install() {
+    oe_runmake install DESTDIR=${D}
+}
+
+EXPORT_FUNCTIONS do_install
+
+FILES:${PN} += "${libdir}/postgresql ${datadir}/postgresql"
+
+RDEPENDS:${PN} += "postgresql"
-- 
2.43.0

