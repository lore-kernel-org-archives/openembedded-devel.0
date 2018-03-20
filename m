Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 04AAD78878
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 04:00:08 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id f23-v6so227760plr.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 21:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=OETSpVp5nuCamf+1C2rSyhiWnR0nl0NysIilc6ymsQc=;
	b=Y3EHbzeFQ+Hf3s5EYufU9n78yi0zwICBGr395eiQV5X7vxG73qRrSXeBUq+jKOQrS5
	eRtIhe9fKsE/Iw6newTUfRwf6RFmX8CV/NrYhINfmBDVz5V7JLpeP96Ue7Dh+xbkSzpV
	v22QDzpBn3+BWR25cQ0GJjFTaPQdtoZ6cT8IXDWTO8CKRZbbIQcLvJv2Lr0EYc13CExZ
	wHpjfmPHGWzhFjzneT0Quf2bFjjCKIlOwiV48KAIAmQeBAul4QXD6x+iy7f+vifgqFu8
	xPZE0LH/BWpAQJVI+SsOosqB0lLe8yysWoTyWk0Npeiz0/ijmNl3++uk/9sFZmmwqjEz
	W2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OETSpVp5nuCamf+1C2rSyhiWnR0nl0NysIilc6ymsQc=;
	b=lEpYHx1eJjZskdslB0P18CptG6rGsiuYwfPoUBm966SD/k0iX5zGfN9sV+V1tYrhk8
	wfhxLIbjFvfCObFcCClxiMj7lJJ+hbBiGU5GdLAussUhMDofeXAtfMAu1Oh6zj8++FOv
	yrygQMjuyIcYifcriCWklvw46zJHkVstvVwDQMevIZsNfItgQedPz5GU0aoeb8oGa+5y
	Hk6A7PBNIqW0JwLokqnWeFHDQcJzm/fLakpYUQg4aZxTXYhJ/w/tHhImflYYZKAMpGVF
	DHvY4mte/p3DW8W8yEiWP2jo/6R0R15RT13EGYSB1FPkD42TXAtMyJ3j2yi5IEEaxceV
	x/WA==
X-Gm-Message-State: AElRT7HaadICEaVdxY3OVxOHa4ZV/3abGqcdGYX7IyAljyS3YOcC4+dv
	MyP8I0RgPuwoI7Ez87rWhEQ1QA==
X-Google-Smtp-Source: AG47ELsQF87WLB/TDCsinFa7f8Hy7Zj2bTAgFCwj7tLKpRr0PWDlxpEstjA7oaG90w0CtUlORTAoZw==
X-Received: by 2002:a17:902:8490:: with SMTP id
	c16-v6mr4511762plo.132.1521518409970; 
	Mon, 19 Mar 2018 21:00:09 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	m9sm927862pff.143.2018.03.19.21.00.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Mar 2018 21:00:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2018 20:59:55 -0700
Message-Id: <20180320040000.29408-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [meta-networking][PATCH 1/6] ndisc6: gold does not work for risc-v here
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
X-List-Received-Date: Tue, 20 Mar 2018 04:00:09 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/ndisc6/ndisc6_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_git.bb b/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
index 58f12309b..cebc1d9cd 100644
--- a/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
+++ b/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
@@ -20,6 +20,8 @@ inherit autotools gettext
 EXTRA_OECONF += "PERL=${USRBINPATH}/perl"
 
 LDFLAGS += "-fuse-ld=gold"
+LDFLAGS_remove_riscv64 = "-fuse-ld=gold"
+
 TOOLCHAIN = "gcc"
 
 USE_NLS = "yes"
-- 
2.16.2


