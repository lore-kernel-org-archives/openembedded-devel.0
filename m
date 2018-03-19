Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5032978930
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 06:03:31 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id m15so6537027pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 23:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wHeJva7nuRk2yPsf4A4/8yPLYqdnXFEADrcqJv8nOyE=;
	b=ay67j4G4tuiDyLuv0FGRNoDoUyvjQNObGcAUyQ7WrXVFAQ8rRIEe+d7J/lHxb5LBPY
	qJII+aSkcqBcW6K1eZHztF8InjZvzaOlX95l5zPfFaKRskvIbNNdJ6v6gQskWeGOFxb2
	1MhBDOGXCTPaZXzJefkTi10HHrI4Lqm8pz/yAxt3t/QeyYDtVluXVdLxsyVY5CsXa3AP
	lFvOLvQZLQ6qR07HKLR5vAZy4gGVlKCzH4QGXwVV6sOitbk/GRoWL6UjkTtwFgf2wlU5
	aSGoeR8D/XmFXBkFF+Z/wNWqbSbTDKYGhYFqS5xK1dvMjfE740n/1KjwqhWC3PXLPcnG
	kPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wHeJva7nuRk2yPsf4A4/8yPLYqdnXFEADrcqJv8nOyE=;
	b=Xnxn/i70Cm3u+Xk/yVDTPulB+9r2i5C63jHYQzGt6HxdkkVsigBdYjLbhidXgKZ7wf
	gHhxORRhPz/87U41BKIQxU0fu6wGSmsumQ/Qy0q/Lffqm24KVwy5+QiVrXjYhYE7S1T7
	hBoKd3x7In28uYxdVLAK6vF5OxQGJx24tGL2AefbJ7mkzTc/L7BRiZwtu5IvEbfGXt2Y
	tQnfAM4iTSHHuNawR0NcAgSo+ru3hbU/T53E+80Dp2BMsnFiHyoBY49QyezpWXkNqMGp
	Mc2DUq1NRptRN8NwWH/sJF8aeFbr670bFAP/RfHfcRSCeYBvw6TM/fYaJ1dLe06sbvXU
	YTfA==
X-Gm-Message-State: AElRT7FmrLTNtFf2MN3wmGC8eRrJHY3YhGeb04v5fuq9lVP1CG1i2Vmq
	c+8GLLy9lvA5ZQqR7dsjiQD62Q==
X-Google-Smtp-Source: AG47ELuGjeVq56saFJl9mHjjlQt6/nrjutxNARYdBojfuMxrbePR/A2f7rSEQn07leU3CTc11fLPyA==
X-Received: by 10.98.65.198 with SMTP id g67mr9245138pfd.127.1521439412626;
	Sun, 18 Mar 2018 23:03:32 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	a22sm5047426pgw.10.2018.03.18.23.03.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Mar 2018 23:03:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2018 23:02:58 -0700
Message-Id: <20180319060300.5366-16-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180319060300.5366-1-raj.khem@gmail.com>
References: <20180319060300.5366-1-raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 16/18] xfsdump: Use new config.guess and config.sub
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Mar 2018 06:03:31 -0000

This brings in new architecture support for risc-v

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.7.bb b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.7.bb
index 0ac991b23..39f11890e 100644
--- a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.7.bb
+++ b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.7.bb
@@ -34,6 +34,8 @@ EXTRA_OEMAKE += "'LIBTOOL=${HOST_SYS}-libtool' V=1"
 
 do_configure () {
     export DEBUG="-DNDEBUG"
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
     oe_runconf
 }
 
-- 
2.16.2


