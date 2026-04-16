Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0CF2F433F2
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 05:51:29 +0000 (UTC)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6947.1776318683441642056
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 22:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=C6dPWO7g;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12c45281a06so6915768c88.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 22:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776318682; x=1776923482; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yq5oRdGXWzd/5zz6U6sHpPo/j1dVHbWi2327cs6U1Z4=;
        b=C6dPWO7gBqkybuedjRhRpGXqr0SJ7HsPEQPdFuJ1BLDVlB7v9dKBEK8Piqvg36mSxU
         PEoKULBcGiBkx1m3/0JYgPdoqbVyiKQFE7maxSA+jNHjfTAxddEhOXxE3kxAwWduGbBq
         uje97apc1qbFJkuhDJwgg7wUbxWR6Fngtvkx1ZR4qaX326b7DAli/ezuPCV/SDszYuY6
         6DGzOpIXqk+u1AhaC4bDrnArlOTKqBbS9bEKt2jdQkEYGjza+z7AqMarB/MEPYxbzSCu
         A2dDkqdNONJgHdaZVBHjQXkUQPTXQokLHmb7r7DLWrkMrG4TiqsvD6A+YWDFbvnlL9FW
         sg7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776318682; x=1776923482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yq5oRdGXWzd/5zz6U6sHpPo/j1dVHbWi2327cs6U1Z4=;
        b=lTqK6fTLvCfDB7XhGvmw1AF4yk84DvdvWB+4wt+/H9T7pqHObSvnyvbWuT/cWGUCim
         vsXb95Nc6sZwOBsom3FoWhr6UuPwUZ52xDJesn7on5JCj71OxHsdC17ArbZ/51DugGfr
         cLSwwXGfJBXssK/nyh9ITxzEnb96hgPA+35DUhw0AzKibbg5iUr3ZqZlvWASzaiI+NHD
         QrFcxmVMYfpitkdqCkQsAMd7wLLDHC1gO7G63cI1m2PIMryElvrDpvBcb8MX/JzWZxts
         AZh0YQfVGy6j2LoOLDxDX7RAxfrvTjZdUF1HD/cYAUBo1kFgjmhs0w2ISpQMXuQ+YDI2
         xxYQ==
X-Gm-Message-State: AOJu0YyALu/TqmWwfcXngDAJp403hS5SQmk5/NG09p2j1HvzRRd6U+l1
	egaHIed0oK0Cu9AO7CCqqEQdvndK8irQTtGFw32OXbGVy91nq8wrFZ3iEMYstMD6
X-Gm-Gg: AeBDietSrg+E/xZDoPP77rXZCjJifLiuGfBR7kGHnGLXxsL9fI5olcnTE3zJVX+puhb
	6H5ZhAuzSPTilUVj6392urjsSPiMnHPOa7sj502cqUMqIL8NMHZvrTPgW0xwsHTPlNZyEK/0VvY
	VuzwT3Ft2P5mwdbeerG9b0FsVBnAIn3neEpGJjnmXQj6qO/WVj+3dm7yH/ebrBst2QQaNDzZwr8
	nyk+vceAUi5lwa1IrAa3KjmLe1/ySB3sNA7SjzBKVi52D1Amt9xfTWOaP4+Vy6pFo6RlD32U2jm
	tlf/vScgBJO73nA8/q0nj2Qol76lHEcCusGR7kZMuEBGspVDX4Vetdtd1uabmOmDbYOvjfc8x1/
	hSDZWv7lPve/mE4TO1h6dv+raIhlleBE//P2r+lcLcmsDzcNFd59+ZrB1KjHR/6Y/bgQCqhvbVu
	4yCZFAnk84DZGpoy5h8yzpP8XecwLm9VE1OpsEUC1SMKrdVaWUDO3FXDBqq7tH6RgTgrZHBUdl1
	WhLjI+GjZIMH+lAQ43Ab9t8HHMoTfkx/qrXW8zZuJd61txRjcg6wl2KSsV99XP5hDmfqChUhgio
	GoNKrFQn0TVP4+644F2puk/lwx98Db0MwhqB4KsXo66GSInNNlg=
X-Received: by 2002:a05:7022:fb04:b0:128:cf70:9042 with SMTP id a92af1059eb24-12c34edf629mr13619080c88.18.1776318682479;
        Wed, 15 Apr 2026 22:51:22 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e61db6bsm4810182c88.1.2026.04.15.22.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 22:51:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 18/18] packagegroup-meta-python: Enable python3-pyatspi conditional upon GI data
Date: Wed, 15 Apr 2026 22:50:58 -0700
Message-ID: <20260416055058.792189-18-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
References: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 05:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126396

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 2ff88e6264..65f23cfe9e 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -300,7 +300,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-py-ubjson \
     python3-pyalsaaudio \
     python3-pyasn1-modules \
-    python3-pyatspi \
+    ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data ${GTK2DISTROFEATURES}", "python3-pyatspi", "", d)} \
     python3-pyaudio \
     python3-pybind11 \
     python3-pybind11-json \

