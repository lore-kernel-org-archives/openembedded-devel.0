Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A09BC2A096
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 10:47:40 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61627.1767610050136186763
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 02:47:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kk6PK8l7;
 spf=pass (domain: konsulko.com, ip: 209.85.218.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b802d5e9f06so1772357166b.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 02:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1767610048; x=1768214848; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ntuIULsh3mI39Mi+oUE2OUk0T4q7isrV4ZoTd+mesEo=;
        b=kk6PK8l70U5fqqJMFArTA/UyoUXLAcBCsIJjVHcsiF5Q4iqbpJDtl3EHlxbt87BTjm
         e/VC9Xu0BkYxXIpiUe19TQHGvJ/SwK1ALa6yGAdoROlHfrpRCL7ov/Iv6u9v64JrDy/Y
         4uNREo5h9d0ezewNh0gla2cQ0tiCS6o2Hj4+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767610048; x=1768214848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntuIULsh3mI39Mi+oUE2OUk0T4q7isrV4ZoTd+mesEo=;
        b=CTM9hRw4eT+Qfz/DGSiT1c3MeS0hl7/cv2/8ZlYntuDZYqlVQ/rU9aTWX3juepKjbP
         CUHnXL249+pXKc+to78EnB02LX8hoq5aqrkNtrXXv+MQRwl5WcfVyrsZWU2tqszi6ae7
         /wmfHB7ALpko3OoWyw+0A1+Ok6J1cVmPss/kMAT6qKH0VsbluUHaePPuhqDm3iaDb3be
         NQvnHOfy3Z0oFDgJW6gH2UBqZUvBUpBiS1m/qkRxaJ7D4Rdh3Q23XSyXVnn6oMiDp+5Y
         zpQ/XNgTJm8c20Q2mS1ZMRkcybyZYHfdKjXba1q7l4zLCMrd+TEalpuk2+1aH9OUV7hk
         w4uQ==
X-Gm-Message-State: AOJu0YzL0BHMtVY/kjZIBybw6NZ+Kj5x0KgDeqpa9C3Eljj9wiHhcE46
	z7xoTQ8x4W0qu7wCFt+JQrNUPeFeZkmXOOmo4yh6NpAuayDdaMoFsDAf2Ams3wnUILKku6FD2L7
	W5bXx
X-Gm-Gg: AY/fxX6lN4SRqsrPHyoxzLVqZL3RzGJhYmhtQ5wZDpMgdqCmOd1o2074dqbtxdjJEnv
	7Cvtdk1jBWNZ+th6PjniNpd+oVuqG7qGYOm0FeUciIyzLeEY3oeMYJA8fh95vwxSeuUDSxwoPK9
	8WOAEP4b2Zya5HZH6QtejjXbLrriuj+EFVubdDtXa8/1jTgIo/cToCuw/1pnXAL+CnLsEhkDaRS
	aR1Ixtta10U1zsw+cLtCHUzh4xwjt+mFIybW/8QExAS/rNiRtmEJa1+k/AgrOkNkJ5toigPH/qv
	59nwQ2WZypJjU3rkULavl14maUxtxsaT3KU5WzS0Nmzg96j+Wbt8A6OgpxalcBAqBS2hOaFhyZh
	1IQUBMrQBR6mgk+CxqMxrk/8FRhigNjomMZt1TWQJYJvatdbcUTm08q+eSRST/f3O4xax+utT1J
	0qqsbB6NszdkSTOqhh9rYuI3MI
X-Google-Smtp-Source: AGHT+IEQXpnDcQrEDXpROc7WNSBmz4/41MVSJy0LPw6NwwUypuWxZ1mLHn00p6Ev3+tHS6Rho/aawQ==
X-Received: by 2002:a17:907:1b0f:b0:b73:42df:29a with SMTP id a640c23a62f3a-b8037253c2emr4618513566b.59.1767610048161;
        Mon, 05 Jan 2026 02:47:28 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037de1421sm5591905666b.41.2026.01.05.02.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:47:27 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-send2trash: Upgrade 1.8.3 -> 2.0.0
Date: Mon,  5 Jan 2026 12:47:23 +0200
Message-ID: <20260105104725.3914225-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 10:47:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123149

Upgrade to release 2.0.0:

- Drop suport for Python 2
- Fix test_trash_topdir failing on macOS
- Update source installation instructions
- Update gio implementation, don't use deprecated GObject.GError

License-Update: The license remains the same

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-send2trash_1.8.3.bb => python3-send2trash_2.0.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-extended/send2trash/{python3-send2trash_1.8.3.bb => python3-send2trash_2.0.0.bb} (57%)

diff --git a/meta-python/recipes-extended/send2trash/python3-send2trash_1.8.3.bb b/meta-python/recipes-extended/send2trash/python3-send2trash_2.0.0.bb
similarity index 57%
rename from meta-python/recipes-extended/send2trash/python3-send2trash_1.8.3.bb
rename to meta-python/recipes-extended/send2trash/python3-send2trash_2.0.0.bb
index 89943095de..0bd89f887a 100644
--- a/meta-python/recipes-extended/send2trash/python3-send2trash_1.8.3.bb
+++ b/meta-python/recipes-extended/send2trash/python3-send2trash_2.0.0.bb
@@ -1,12 +1,12 @@
 SUMMARY = "Send file to trash natively under Mac OS X, Windows and Linux"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=05faa35ba1ca10b723f19d286c9d5237"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a02659c2d5f4cc626e4dcf6504b865eb"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "b18e7a3966d99871aefeb00cfbcfdced55ce4871194810fc71f4aa484b953abf"
+SRC_URI[sha256sum] = "1761421da3f9930bfe51ed7c45343948573383ad4c27e3acebc91be324e7770d"
 
-PYPI_PACKAGE = "Send2Trash"
+PYPI_PACKAGE = "send2trash"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 RDEPENDS:${PN} += "\
-- 
2.47.3


