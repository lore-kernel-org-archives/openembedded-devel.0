Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5619374BE2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 18:45:40 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id p3-v6so3708677itc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 11:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wUD0frScwG5QPyUwzBJKhn+TOUqUyjzE3nc/ZsApYnA=;
	b=sYd9/ie94fvRqIU2YJ85HwWuQomF2omEwM/bbJTkfgn2VFd+fPd0kkLlvrf6APtjiI
	0vZfIn/7FAjdvrxVg/usrVXSZKtGtjG4wcwuIrfLbXDgzQdyqFCIb9X1klCW6OzYsGlt
	tRTpr5BeO/h+fgJ3y9fk3Afgm0csQVFMQo91pLoZDi3gaMRfR6PiW4iqgGXij21p0FYP
	QMxN4ebXLp/rbf0XZjCbCY29dyUZI0w8JNorPgto1QAagiR5z6oBCzIBOWD89+i/LdwN
	3U+IYAvE5E+4dhSBEGz7Prz5WbWuaEQR5BUKHludBlc1nhaaJlFc1FI7Va7prG05FJQJ
	PrlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wUD0frScwG5QPyUwzBJKhn+TOUqUyjzE3nc/ZsApYnA=;
	b=NZ+4MQLR0o/5UWfwOVWn+iqRVJxwUCwg3uvGJFO3CX5i+CdUstebAU/YrTbhbtqh0E
	BcBttQvoTS1gOaKp8IcrI53MYXeunq6wEss0gSXOUfx+cDAnDhNNJXXGmHlP8FB8U3BK
	tnnP/xOIwf62hvSZM4UdNFWbc43fnXYbsXiKcBry6sCSLQy6OI7nsOD6rz6W7gkJJPhW
	DPyxmc/a7VPoyY/Hfzu+yRUil3QsXWeqbKtIZNMpTk/zYNS5J4o/zM5R1Vyx0ZTdYuDB
	gZldIVPFU6ca0CHcV+zVKyenDs4vpu3aJ57z4CIcHTMiX50SeZOHD05Q5D3926yYsL3v
	hQNQ==
X-Gm-Message-State: ALKqPwdGbaxolO5g5UFqmgxBHusTW4VxR99SU/Jdsn/xXAns9UJJcZZy
	rjVcReGks73+HXFcNQ9iMd7KSRJE
X-Google-Smtp-Source: AB8JxZqh0aRMset02z+DRQikfMItjopE8xNqwRPsdGCsZ752n0hAgQ5Zf1VkMHatWzA3c24k17KrnA==
X-Received: by 2002:a24:97cf:: with SMTP id
	k198-v6mr6457687ite.105.1527187541746; 
	Thu, 24 May 2018 11:45:41 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	o184-v6sm2797190itb.24.2018.05.24.11.45.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 11:45:40 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 14:45:31 -0400
Message-Id: <20180524184531.12459-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
In-Reply-To: <20180524184531.12459-1-twoerner@gmail.com>
References: <20180524184531.12459-1-twoerner@gmail.com>
Subject: [meta-networking][master-next][PATCH 2/2] c-ares: variable cleanup
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
X-List-Received-Date: Thu, 24 May 2018 18:45:41 -0000

Reorder recipe variables according to:

	https://www.openembedded.org/wiki/Styleguide

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb b/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
index defbeaa623..934c8454d5 100644
--- a/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
+++ b/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
@@ -4,13 +4,14 @@ HOMEPAGE = "http://daniel.haxx.se/projects/c-ares/"
 SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=f4b026880834eb01c035c5e5cb47ccac"
-SRCREV = "3be1924221e1326df520f8498d704a5c4c8d0cce"
+
 PV = "1.13.0+gitr${SRCPV}"
 
 SRC_URI = "\
     git://github.com/c-ares/c-ares.git \
     file://cmake-install-libcares.pc.patch \
 "
+SRCREV = "3be1924221e1326df520f8498d704a5c4c8d0cce"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.0.582.gccdcbd54c


