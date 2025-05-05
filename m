Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 096C9C3ABB9
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 12:21:27 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.46024.1746436449339991739
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 02:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R3lmsB5f;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-879d2e419b9so3952327a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 02:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746436448; x=1747041248; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/EkaZoqweWApJSgy4y1hE4cEDUiDlLwmBU9HWXKOUE=;
        b=R3lmsB5fesS6XPMrYUSA4+4CuPl+H/yO38KDAEM9XlMRqWuEgv7M89PzaKa3/37Oam
         y0677NDrEOPHeLhZfQios44ZxClk3ST4QhEP9A8BRlgbwJYE+l1xXVlPwJs16KoYtjRy
         OsOqTwICMNLIqJgW8mSBWDSCOEbSd/X95KwwIt6Td5kEBr7wLo8yYbgYGESdV+iSE/Dx
         mJ4F8pUlYJE4CX+Ev9xJS6jeGDtqHuubQ8J2ynmmb6Hs5Uxhpakl+vFfaHwC3v9Q+SIG
         SuBYaMZDoMzDVqetOvNnP3LEKEPnG/sS9bla3UGSs+S0RjsPBbJ3Z6uf7CXYzkyVeLzx
         bMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746436448; x=1747041248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3/EkaZoqweWApJSgy4y1hE4cEDUiDlLwmBU9HWXKOUE=;
        b=gEth4pOBkeXyOzPNhO9cDarW4PI2LW33sMMAS1vVixTcazeUlceOPzD3/ZoGQdxl2D
         nn5YX9Cb7MG3v/IvdjdMyXDO6JWNnX2dJ/YqdjMllcCSWo1UiUoDiqKmw7CzbL9CSw17
         zvPID17hXg81xnGKQtgvPt8hGQd+/5Fx4GqHJ6x7m7Jo+UxZlohumhnTY9Xcpg9cxbT7
         ZDgiyZcbxqIBziLxYEnKxiR38651yJ7HYAZYsw0/Nqgm0RxmHeytnsvd2B5BRJsplBE3
         Oj0H/Jwf70eMhBX+lDLb2mqmOOAuWsEBm6nAyZR53PGVjJLYfEzYuNMn9yEjAf31Z0qQ
         nCzA==
X-Gm-Message-State: AOJu0YxuXd7VxrIY6bn8BrbGK6CO4gCie9YLySPqr8hoQWiVqtuOMMu+
	wFnycMP7CTfpfXUMWXbby4XLYKDO9Rm3emYH8Qiq0sDRNUVfmRgLI/v6wQ==
X-Gm-Gg: ASbGnctz3SwijpDU/Csn637UHQSf6pl2eMw0Fefsv7A8txwDRX3Q8AcrBHlr803Ij+I
	KEcOPuyBWnLUVjE+yllSK2Niqmve1UzXcKpmaQ88cngzjyihuMM0M+biVrR/ZJ1TsZVqh15swqR
	XAvQR5NjfZe86wGD/RC199HoSW1NcuEQ32rPChMiliysoeVV3BK0pm+fa5ANQvopcjKMfS9Ql+e
	GoIULUgPGUz3g9Gmgwiei9kavFi4RQmfNfgvrlgnWzvjE0/hztk9l6bjyZI8MTOKLq34njSDDEy
	vMrfvzO5K2LBF2qQ8i2Avn50NUpZfBRVYneMjPLiBecuTOKwb9Vd
X-Google-Smtp-Source: AGHT+IHQpCEBBzsHNfq+Mdof7b0oMdAe3faakW1a8Xaj0l9V/FEIL1Qz6J9eCntivtXU1dzjFj301Q==
X-Received: by 2002:a17:90b:51c2:b0:2fe:994d:613b with SMTP id 98e67ed59e1d1-30a5aedd058mr12590672a91.35.1746436448562;
        Mon, 05 May 2025 02:14:08 -0700 (PDT)
Received: from MVIN00210.. ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e9eb3sm49863955ad.91.2025.05.05.02.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 02:14:08 -0700 (PDT)
From: "Ashish Mishra" <emailaddress.ashish@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ashish Mishra <emailaddress.ashish@gmail.com>
Subject: [meta-java][PATCH 4/4] Updates the SRC_URI for fastjar recipe
Date: Mon,  5 May 2025 14:43:04 +0530
Message-ID: <20250505091304.819905-5-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250505091304.819905-1-emailaddress.ashish@gmail.com>
References: <20250505091304.819905-1-emailaddress.ashish@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 12:21:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117313

Signed-off-by: Ashish Mishra <emailaddress.ashish@gmail.com>
---
 recipes-core/fastjar/fastjar.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/fastjar/fastjar.inc b/recipes-core/fastjar/fastjar.inc
index 8412236..97e79bb 100644
--- a/recipes-core/fastjar/fastjar.inc
+++ b/recipes-core/fastjar/fastjar.inc
@@ -7,7 +7,7 @@ PR = "r1"
 
 DEPENDS = "zlib"
 
-SRC_URI = "http://download.savannah.nongnu.org/releases/fastjar/fastjar-${PV}.tar.gz"
+SRC_URI = "http://download-mirror.savannah.nongnu.org/releases/fastjar/fastjar-${PV}.tar.gz"
 
 inherit autotools update-alternatives
 

