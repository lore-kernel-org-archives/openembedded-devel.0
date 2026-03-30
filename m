Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24562FB3D12
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:39:50 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48216.1774867187075466774
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 03:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AncM5nED;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35691a231a7so2556918a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 03:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774867186; x=1775471986; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4N1eaOR+RdRuKzJSJI5/1eVLWLget+riGwvmeV2lPo=;
        b=AncM5nEDkysbGSQJtBtcgWFd4LAAv4ZJyeK48JLvfpnFcVcX6iUgZBErngQtyxIl8n
         EnAJbxM6NXLXVABQS6yPWKVar6q13VlIQb+JtChG1CyhekX/O7BJ4an4g7Fcyxz/dxCY
         mf5fJcwyJ50PyPaTTnSUCz7xX5Q8ALzDq7Zyns0cmUWox5jNxjWMtdliN18LDcnWe/ex
         3nSV3C5CYUKE63wVrNYxo8eBtUBU7ODJDOby3wUVj7pPG4hSECG4jNs+RMT8kMWHSiJ9
         id5KudUogd0bkYKsWuyx3k6MQo7Zsh/fntzuWqUFoaH6fNT/bYUXTLcoOHfSHGdf4XxG
         YJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867186; x=1775471986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N4N1eaOR+RdRuKzJSJI5/1eVLWLget+riGwvmeV2lPo=;
        b=YCf/e2QV5ecBF5I9EJ2OyZaKaYPdg0Pr/wlwGfHePrsFjAWVJot6r6KPDP52SXUEvd
         jeooOj5FzHpoAm+BF7Mv1etCmZNxInzP5H/YEKls/8KO+5ebCaIet/56nnwDXmLvQ3ks
         tbfBvC4gtqR4boW9BQL8Le5gM3q0CR1JHCHmhy0ext4H19e1Ac6BhBdvHnbVkZLXvxR6
         x+7Ca8MPffgdf1ZeVkiG9tVw0iciwcvXjBO1m0B10RQthJWHfm6KGcrM8PWchbDd1Hz7
         +0eQmLDDM2X0ILBeUFY/RQ8fkdlOJZWyGBsk2KWmBVgxy8COoee3PONp9g7OwWIINswj
         O4bA==
X-Gm-Message-State: AOJu0Yw+ljOEnm3tgG3ZJakZQPdmsUhRL0ginhZFMdV3KtrQpEmUM5J/
	DMMYlm5mDORaKiaDIqn5Mpv/9QB624ZoU7sxtF/sNXylxet/M5kM4P8VT1nLhw==
X-Gm-Gg: ATEYQzyXtpuqzm9QHTxGlaJv1CHHNwnfJhoWHJV24dMX1vj+dM2Bqrdg009xlRMkyZk
	uR0W8qehV4tWvn1wRg3Ie2VcscI7t7DqIkPWBJFsV7HLAr1ox3EoONJCQgqar2dqsKCN9JdMTSl
	ZovpKvwamtflDUwWCrOuhKjlj5BiERRDZS5H8vTJqTapKDOKNTt78b7mgxsCHOPJQ70ryhLyI1U
	KjwBgCy//GXFoJ9QybYnkjmYlNh7fos0/y06ok83KIgvshf5kWUuBaluyEgiKz68pEgu7n5F8K/
	2LKPLc6WY2s7RHHAJk4eHE75haQsU2cu7e3FonD3zFuwf0dSaBUNeafFDdN9t4uQ7OuDeMsghv1
	K7YBEf5GR42M5e+KUxbPdg2TH38Ruzlh288nxmX7xNShKvtYwGqX2jtDPGBaUDJ995DCOI/CdvP
	cc0OzT1i8WJoazsybNq4SWo4vIjIA//TxvCJI=
X-Received: by 2002:a17:90b:4e85:b0:35b:e566:15a6 with SMTP id 98e67ed59e1d1-35c300949c4mr12717490a91.28.1774867186271;
        Mon, 30 Mar 2026 03:39:46 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9507dc3bsm6831652a91.9.2026.03.30.03.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:39:46 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][whinlatter][PATCH 16/19] gvfs: upgrade 1.58.0 -> 1.58.1
Date: Mon, 30 Mar 2026 23:38:43 +1300
Message-ID: <20260330103846.3381644-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
References: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 10:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125859

From: Wang Mingyu <wangmy@fujitsu.com>

Major changes in 1.58.1
=======================
* cdda: Fix duration of last track for some media
* build: Fix build when google option is disabled
* Fix various memory leaks
* Some other fixes
* Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a216ab3f7689c4d064644d9a07787833bd29c1b5)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-gnome/gvfs/{gvfs_1.58.0.bb => gvfs_1.58.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.58.0.bb => gvfs_1.58.1.bb} (97%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.58.0.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.58.1.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.58.0.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.58.1.bb
index d0dbd55f1b..6dfed59d86 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.58.0.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.58.1.bb
@@ -18,7 +18,7 @@ DEPENDS += "\
 RDEPENDS:${PN} += "gsettings-desktop-schemas"
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
-SRC_URI[archive.sha256sum] = "dd9be36873d0fcb309eb89a8d274770ce576287628a2cf111bd387e1c34f182f"
+SRC_URI[archive.sha256sum] = "fc537d6bbab1ffa76972df7d4a1819b0c0fe19ebd1dfe82421d1f32e14b5dc3b"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 

