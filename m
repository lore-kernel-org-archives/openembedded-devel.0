Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A3DC5B572
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 23:32:04 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19748.1786923114555861828
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Aug 2026 16:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eyqGH8Gq;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38511175ad3so2677670a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2026 16:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786923114; x=1787527914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GnqcEHmBKzXskZwduN2bnLcpIJrTueGdQ3o2JqQDb0E=;
        b=eyqGH8Gqh552bvCidm1XiuJU+REvkQEfv0oatt4vvOYQy73bnTRU/rOlp4Kkn+9qpf
         hZThQPvO/wT/QYkvYTtUQl0hgIzyI+J+ZC/z1EhRf56MOGm3sTuTEMoyTB0qrIOkmSy+
         2R2O5IyMgnskzYFfwhIjdP74EPy/mxiz1EqDymUfvMCPt99Slc6vnew2TA6zPB+HfPnv
         8xmNJ+v5hE+wLcAqejGqGhsrZavegVZ5mLtekzCBPyKfCb4j+YeD7CcxRS3THRDJbO18
         elzmUVPEUX15SfX4PQ5kjzYd0SnP5H1OsWPhm/Me1xkucxcPdoYt8ZBVkeyTK+1sa60M
         LEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786923114; x=1787527914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GnqcEHmBKzXskZwduN2bnLcpIJrTueGdQ3o2JqQDb0E=;
        b=UMimODN3FTGEyXVm8ZVmUMXmicZce2PvBQPN9jAYf3tsrybQpAePo08x9b0IUINwqP
         MS6fwarQ03jbi855SNGpcBnxd03PfoMI5DGMBEVco7+wWOWFo/c34nJo9/KV5WZqDNFH
         jMKNsB6642AHYi5o1ySt1aIEIGH0WAViK1f2kMLjVVV7nEJtVlqJPp8dnU/Cc3kMSNmK
         NqPgWWirXM/qxMwh79XDfCS/0GUafx/DdjxqQYM2f/ueq2DhAW5xW1cpUU7hptzhrrvh
         OvQtmHsc0mirGFvvV6+CbJ5hGj3dyAuzDcOb/MGztCM66Uhvvp1/IW1BHg3mR1M2PcdS
         suNQ==
X-Gm-Message-State: AOJu0Yz5ec2UvWLgZr+ytO2d08ZrNN3yhz6kcFg9gQRRUGc5Tb+X1XBp
	NGui3dKMvcSq6zRbVnrh2E54RM5Bydk+9DSz4Zs6V3YoaTSx8Js4JRTlXgugbNQj
X-Gm-Gg: AR+sD11vaWXM7NV84EzR3xngzR/yuFrIFNvre1O4fiU9tlejSDuu4rvyQpDU5oHPz8F
	RFVuaIIafW4Ne29wp9sx4cKHRcuOdN2uAcgJg4kKxzsr3iddt1kR4C/CzHkmgsXUw3pShKHYfMi
	s/sDwDj7iUvAu2kV3ay67mbc7IpM9bpevkT8CIYZwiYuWocDrBaQvtqoTXrQ1x4TIYfzjRDbviJ
	68aPkbdjPdLP+EuxkWVhXXH8fwAITeMpRNVtNMAcR7TigqEhSa0JXkKDzIi7ZlGIpyGEB/c0Nud
	EQwa7+ehzTq7ueStOrnKL3/pg1HrDpF9gTAEkiX9CW5HyD4EG6iQJF6pDrW6v61w9uGWQZ8Uucm
	TPdIDUJjr+he4gG4jA50pyNLrWCilaWy/vCK8pFejzXxU2uHdrGfZ0+ftUI/19avztU0cSkr9gB
	u01C5NovjN2lz5h/bkFzETlZg/zB6NaqMviLgx6JkuXYvceiObR1p7goJGDNsxuUQU7VJxC341+
	xKLJlPbzX+j4hKkJvjoO1+fUZfiVxpztYg8faOBTwOzGbg9N/17TUgCKIGaXdI8NRmxf7EBEYw8
	39nVF3DgrYEBf5plhRW4r3vICSTyE7RH/KUZyLdkC6GwYToyB4P69AuUu3m2Do20yflz279SH95
	Qdr0m59uipRK3Jq5siJ9F78bsGr5BoMgAUgQ7JvJdoVVU5g==
X-Received: by 2002:a17:90b:4fc1:b0:38e:2524:724f with SMTP id 98e67ed59e1d1-3933b8f143fmr23714742a91.12.1786923113721;
        Sun, 16 Aug 2026 16:31:53 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14153073befsm29599c88.7.2026.08.16.16.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 16:31:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH] python3-pillow-heif: add python3-wheel-native to DEPENDS
Date: Sun, 16 Aug 2026 16:31:50 -0700
Message-ID: <20260816233150.2078123-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2026 23:32:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129190

Fixes
ERROR Unmet dependencies (checked against ... recipe-sysroot-native/usr/bin/nativepython3):
	wheel
		wanted: any
		found: not installed

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/python/python3-pillow-heif_1.5.0.bb        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.5.0.bb b/meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.5.0.bb
index 4558715113..fe1ae909d5 100644
--- a/meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.5.0.bb
+++ b/meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.5.0.bb
@@ -13,6 +13,6 @@ inherit pypi python_setuptools_build_meta
 SRC_URI += "file://0001-setup.py-support-cross-compiling.patch"
 SRC_URI[sha256sum] = "16b11a37b762ff42da2d36527bb5cb14bd9194c24c389ee911155d6e23c53065"

-DEPENDS += "libheif"
+DEPENDS += "libheif python3-wheel-native"

 RDEPENDS:${PN} += "python3-pillow"

