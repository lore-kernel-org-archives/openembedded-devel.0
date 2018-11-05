Return-Path: <ricardo@foundries.io>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id C065979B30
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Nov 2018 21:48:31 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id d19so17254452qkg.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Nov 2018 13:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=foundries-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=n8grHXA//GU2U9nlu6sC6Vb9jbYEYrlNxikMU2dLDHg=;
	b=NSKzm4KukftLZ//1duyfoNuq1cSuN9ZM58WrRrWFu2yQ4Kenywbs5ooWpLazA5YbUm
	mSFCv7BN2AAtxa8kdnPfFkzU50ksZ2uqYuJ5YN8WqkcCHcG/rHFnl0auGTOTu5vnZEpM
	1BmZ3mPkcSt9vnXzbDMwSoUTgDTJmUq5HS+TOzjG+4fHBUgp5j/ZHmnIoFzi0TUXK3f9
	skiN2jamZvGhnoRLY757P6R0BR1wObShvFaD2CKAZSUpduTul3BKPMFk+kztEI4NV9gF
	kn+quDconIJ/k0oRRwtibYfL62iSQpPdHZB/OC6dJ52iOLpZO/EgsmuVl+nRHp3RQlJh
	ricQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=n8grHXA//GU2U9nlu6sC6Vb9jbYEYrlNxikMU2dLDHg=;
	b=Vc7JtrLney2JfD7BdDMoZMOk/CgwbXV11cpdY1hykZVzAkJWN+2Gu2K+Kwc1meb6Tr
	7MQXTPzhoYv0uRiYv/PGyozOy+k0HgYIlk4vCKvYJPsSm5pp3TozL5uhi4ec7po2LKRn
	TiyDrfQu/RWZ4HU3ESdsvQ+cO5yCIlQ94lm0S1b43DTtfPOpn5k7PVQ2/ELB6Jv5F/tt
	/A9Fxi96306dZYBknvJa/105XtzxdEN5MiJ6YqmE81mROWAQNV2n1tyqXI4co7l6RZkx
	BgTNM5yvfvlT+UuhTvSbnilHjHOkc4pDnXxO46Gy0HsFMnO6MoxViUhFyaUsMesprKPl
	m9zw==
X-Gm-Message-State: AGRZ1gIRTdcxqjeEa/UZzE6hR7TFasBLgT3ZeoejLSnLE3ej0N+oJpf8
	Ppd4Nzr1YfqzhpbViMX1U0DxiMBX2w==
X-Google-Smtp-Source: AJdET5fVHKe/ociGuAxxvMUS3CJNviJrvf0/DeZQa2Ky0Wuydj5PqQ/VFGjVdf0t3YM9BQREC2aVwA==
X-Received: by 2002:a37:3987:: with SMTP id
	g129mr22151681qka.236.1541454512179; 
	Mon, 05 Nov 2018 13:48:32 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:bade:8237:a8d3:c29:6abd:4548])
	by smtp.gmail.com with ESMTPSA id
	b134sm8145866qkg.78.2018.11.05.13.48.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Nov 2018 13:48:31 -0800 (PST)
From: Ricardo Salveti <ricardo@foundries.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Nov 2018 19:48:28 -0200
Message-Id: <20181105214828.9492-1-ricardo@foundries.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe] [PATCH] vim-tiny: remove alternative for xxd
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
X-List-Received-Date: Mon, 05 Nov 2018 21:48:32 -0000

xxd is not available in vim-tiny, so remove from the default ALTERNATIVE
list to fix the following warning:

vim-tiny: alternative target (/usr/bin/xxd or /usr/bin/xxd.vim-tiny)
does not exist, skipping

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 meta-oe/recipes-support/vim/vim-tiny_8.1.0347.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/vim/vim-tiny_8.1.0347.bb b/meta-oe/recipes-support/vim/vim-tiny_8.1.0347.bb
index 23f6aec49..8b1fb7b11 100644
--- a/meta-oe/recipes-support/vim/vim-tiny_8.1.0347.bb
+++ b/meta-oe/recipes-support/vim/vim-tiny_8.1.0347.bb
@@ -3,6 +3,7 @@ require vim_${PV}.bb
 SUMMARY += " (with tiny features)"
 
 PROVIDES_remove = "xxd"
+ALTERNATIVE_${PN}_remove = "xxd"
 
 PACKAGECONFIG += "tiny"
 
-- 
2.17.1


