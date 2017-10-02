Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 01A5677B27
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Oct 2017 16:07:10 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id i23so6166696pfi.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Oct 2017 09:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=m1/5yCpCBoTn1WK1V/sgaUyFCpX1QdQQ/5tI0d0ewGM=;
	b=FGwtZWE2bEUlyO95rzzvJpJgikg+5+9LXXcceddRoomcDPEoL8TlsvqWd6dgzp0UAl
	2mS3tOhRWGGTVGubypRWd3lO6TjOTZooYhqDNFnFVVN4N0wy9/JzjDLf+P2fnocYT43N
	uHbhLcMFc0r7ptvZlRVTXai9TWpgUKae5Q9seVdKKHCqFskut65eiXP5Xg1lomi7OG/T
	Gf9FQ7g/NR42HzrWuVJ1BNy6HnhDTL8oVc1HH+v76QZVZSbBAnabAWN0qlPI2ChjZZaW
	6kL2cs9b33IjvzvvaajA8IQYbFlUACCf8l5BHyng0IzSladAZbLQy/4tCMuG8mq3jyU7
	oy7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=m1/5yCpCBoTn1WK1V/sgaUyFCpX1QdQQ/5tI0d0ewGM=;
	b=OY5v84sGDulL0tbqJ6loPYt11tfZDG4+VNSizdtAKdi0gS3COZgApJRHklKKgRFUOp
	IR8Wpgkf/f48mO87aH0X5D1uyfu6e1Ry+eYSelgt6Cxpm4GquL+dLpXT7LJX7wcySHH1
	6ItS/YGrKqlz1xlCzOlukmRHRpAWqbIUcQr0lsj6TGfl2DmIeeRVGKOZ5SJ/acisRA4T
	EpClmAMJ4u6je9jy+6vX8qtRMKUxW8ZnJDJiPett41XUo3cc9RseAC1I4038hhtlIJOW
	KtvvwcW5v/0h/88g4UOGWw7Ou9G4RiG4M6xoWoGwsfs/a1DUfyqt9OHqMTbBModUqpD8
	bMAw==
X-Gm-Message-State: AMCzsaV+m/wk0LDu5DbepFs1ijBzPvB4ObKiOjqpkQga8Wv1QzwYTuwD
	ApqXfg138gDe2f3f6AotOSGvuQ==
X-Google-Smtp-Source: AOwi7QDmZqTKSTtHCkuumJln66qfOuEwoERYMRuFMRjbYH8HQOQU7jUXRMOI2LaY8few6Tznqu6i9Q==
X-Received: by 10.98.156.23 with SMTP id f23mr2658379pfe.94.1506960431858;
	Mon, 02 Oct 2017 09:07:11 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f76])
	by smtp.gmail.com with ESMTPSA id
	f2sm17329405pfg.135.2017.10.02.09.07.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Oct 2017 09:07:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Oct 2017 09:06:57 -0700
Message-Id: <20171002160657.39576-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171002160657.39576-1-raj.khem@gmail.com>
References: <20171002160657.39576-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/5] gperftools: Enable on mips
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
X-List-Received-Date: Mon, 02 Oct 2017 16:07:11 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb b/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
index 23284670b..8ce376c91 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
@@ -18,10 +18,6 @@ inherit autotools
 
 S = "${WORKDIR}/git"
 
-# On mips, we have the following error.
-#   do_page_fault(): sending SIGSEGV to ls for invalid read access from 00000008
-#   Segmentation fault (core dumped)
-COMPATIBLE_HOST = "(i.86|x86_64|powerpc|powerpc64|arm|aarch64).*-linux*"
 # Disable thumb1
 # {standard input}: Assembler messages:
 # {standard input}:434: Error: lo register required -- `ldr pc,[sp]'
-- 
2.14.2


