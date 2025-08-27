Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D991CA0FED
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 02:49:09 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.6116.1756262943546353436
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Aug 2025 19:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aaLdkVU0;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-771fa65b0e1so682310b3a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Aug 2025 19:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756262943; x=1756867743; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SFIe/bQeA8cuXdvHFhhgYJ297EFIlo4/Gv0EehNQQ6U=;
        b=aaLdkVU0T1yDN5CZINrfVo+tAEkDQgcTb8+ra8eJE70Pb2J9eeX963Xb1pS/w0Fsxg
         ZIC1CBR5hvHjgntRXaEN5XiL+cvxEcQGo7RvLckY44RHLivZsWPKOQpk76bXz0w6wcJA
         WM0dmx4JBn3cakYxZCMs910+5gbtsKYGAl+NPB7b8O2r9fy9+mGBQ4ryeRFevdCk4L+1
         IthT1uuVEXV7tgu/TUsRJTPsjl5I4KOGU5jBM5oSuEweotKL8E+51ia+TEId1GHzOVdy
         mLHT/eOYW+P6PBU46dfskl9rgK176AUiksVgHdeH3HjR2zn1TltmE7swnyUmC/ObRxiN
         wSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756262943; x=1756867743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SFIe/bQeA8cuXdvHFhhgYJ297EFIlo4/Gv0EehNQQ6U=;
        b=l3x8iqdEeO7Bts+r1extyYWJp0O0znWm+Se4BBh9DQvpY2X3Zb4+/i0msURlWHGHyn
         8eOWyMFEaRB1SL+fNDW0e4VLiDWvZ1yc4DLMJUsgB2jytPgC5znQHU4QQhAFhJL3H1r8
         wCmlyDtFmTcwHjVFZ8a/3zuI6Eg7AXPQkZbhxkMXYRBiYc+ptAq2i7/Xzmq8lYk9G5sl
         5NOb9NkWMedckVsPvolD23O+MImEyxZCM7ho31fWNKJyDlgguUGFfPY0jWUpfQrcMBB0
         McK+uiWGFnuQ5hjuEkPFU4N60s4+95u72SO73mnMw94vInZ5LKhsgKnzwEdhWpn4ArRx
         lRkA==
X-Gm-Message-State: AOJu0YzLcCwdVqGX9nKeA/rIjXRKMu4Gn6g+kNg3Vah2bSsKdI1o5+Gj
	IBZHom5UUu1fxuIC0bDHG4uoKiXt7Zefq7/mAsHAayOLO9xPxFaA3wcYntxao1w3
X-Gm-Gg: ASbGncsqSQYGZ25sHRcdHwAEpMJAUV5eGW7yq4EMe/vUGiCiJHAqShThkFgooE/qUAf
	xqhMR4SGdwhWQlbphugWqO8kh48BUitTxal5RqUeLrZ0/56l2ApV6A8br2AzetE2pwMM6A1qC9f
	Ky9FT5FhMEK0Xo0rpQIMmN+t1HQMYm9kkBp3tO0S8cjAx0xJwQ5y88eruaCvlbQyu883COcVSSF
	q7Ad15iMf4/gdBboHSkbdXIHEXWhtuMrx5WmhzHpS+5gQEqRS+MzmXT52o4cbmB0GVcOAsrES6z
	Vjq5Xzy3zDhIMAzACaQSvOoOpmbRFgyV82C6GUEQkChU/LKC2zOr6Msr7DvsVs7iWb2QlihQekh
	Nh/f8YnRxAHpWlmM8Fw0gaO4VO57tBvCHEJVvBYiOc2YfvDLlaq2tpj9zdxR28X8F/1QU7ueKjz
	XmYrZ+AmWGF9PIUhxh3P+nAxSSb/mClEkZFKtYQrOf41kEJw6fNKQ=
X-Google-Smtp-Source: AGHT+IEe8INlSDzSwuQ2TQejPSp+xqcJW4cF4ilApGJQGf2zR1CIxytjGoNz7UOrP5MRilWK8UP2+Q==
X-Received: by 2002:a05:6a20:72a5:b0:23f:fbb1:c21b with SMTP id adf61e73a8af0-24340b5b496mr25353993637.17.1756262942447;
        Tue, 26 Aug 2025 19:49:02 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::cfd6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cb8b4b98sm10357544a12.19.2025.08.26.19.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 19:49:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystem][PATCH 1/3] zfs: Upgrade to 2.2.8 release
Date: Tue, 26 Aug 2025 19:48:58 -0700
Message-ID: <20250827024900.1318469-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Aug 2025 02:49:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119120

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-filesystems/zfs/{zfs_2.2.5.bb => zfs_2.2.8.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-filesystems/zfs/{zfs_2.2.5.bb => zfs_2.2.8.bb} (98%)

diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb b/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.8.bb
similarity index 98%
rename from meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb
rename to meta-filesystems/recipes-filesystems/zfs/zfs_2.2.8.bb
index cf56cca84c..1fc1457b19 100644
--- a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.8.bb
@@ -4,7 +4,7 @@ LICENSE = "CDDL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7087caaf1dc8a2856585619f4a787faa"
 HOMEPAGE = "https://github.com/openzfs/zfs"
 
-SRCREV = "33174af15112ed5c53299da2d28e763b0163f428"
+SRCREV = "3e4a3e161c00273303cd9fa9e0dc09ead3499a8a"
 SRC_URI = "git://github.com/openzfs/zfs;protocol=https;branch=zfs-2.2-release \
            file://0001-Define-strndupa-if-it-does-not-exist.patch \
            file://aaf28a4630af60496c9d33db1d06a7d7d8983422.patch \

