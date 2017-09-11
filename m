Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3992F78282
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 15:11:08 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id e69so3225680pfg.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 08:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BmKHU0e76M98stZx0nfDom+mazWU2pOzeKMGOhHQpVs=;
	b=BG8x8ZjDuPYtemwfZgISL0Wusz5tZTpPclyfemKfKhqxXT8s6MqPH8vAN1Omehyrgc
	YnrQ7L2aeaUYiR2GdVJ/QUJhPJVmBZjcyXaWdpABUOsqDvAHLYZnVB7dvsbK+24ZVKrj
	4U+4JE0TJ8TI+nJIP91NJK3wGX5b49SuedFdNK0ELgOVfRz2mFpD/Aw2ERvm8FUNwzZ5
	l/SUDIlVziIqMQvjTWN0T7kMGTuFXSMl/BfQ5LRHbu+AElS5Ty9uYz36M5IlooNydcrS
	LCpradHIPJ0BU6DW5A7gODNzYDPuq1kmhzxbwsGJA9rYIjBeY6GvXGElUOfELrqiQeb0
	2mJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BmKHU0e76M98stZx0nfDom+mazWU2pOzeKMGOhHQpVs=;
	b=LQmq5PI7YkBIcerNbbszaK5cEKn3pDrCyn5AImLpAPSvQycohTfqc6PbUtzE6ApHZ2
	KHOO/Dbt4buph+IQS9phJgEkbZ8B7/1y/FwVe6gZlAxUya0WTnnn2z7LLltrBKNmZJID
	nw9I0Q9IqqqTL0lyMaImpzUzHJFv2IGeJud8Jj7tD7fOuDpLLSlBqqmQ3IC+HKBNGCne
	2hx7d4ZbsOPaBv2VpFTNnTl9YbW75pJW2e43Itut9lb4ZV+U8gOHOO3NODrwEbXybmVR
	tYnm9oiroePh/WnmspaRNQR8d46qqCHZKtwoI9jT8RS/LEPG7yaNL2mH978ygIlcsHyv
	Kw5A==
X-Gm-Message-State: AHPjjUghATKSm0HDoiaIerPVkwzsJOuf0OrxldUFEIuQp1GluazQ9W3K
	c95vIQ/0JStyJde/
X-Google-Smtp-Source: ADKCNb7oQjDKITSrrxKBbQspwn8XxhMV4Oq/EmP6+e8vNaolxQv2maPMwl0CXPri5OS0eMWJuwwtNw==
X-Received: by 10.84.209.197 with SMTP id y63mr14262509plh.316.1505142669688; 
	Mon, 11 Sep 2017 08:11:09 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::989f])
	by smtp.gmail.com with ESMTPSA id
	75sm4374067pfx.145.2017.09.11.08.11.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Sep 2017 08:11:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Sep 2017 08:10:56 -0700
Message-Id: <20170911151056.4577-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911151056.4577-1-raj.khem@gmail.com>
References: <20170911151056.4577-1-raj.khem@gmail.com>
Subject: [meta-initramfs][PATCH 5/5] klibc.bbclass: Add -mfloat-abi on arm
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
X-List-Received-Date: Mon, 11 Sep 2017 15:11:08 -0000

Default toolchain is not configured for hard float
therefore we need to pass the right -mfloat-abi option

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-initramfs/classes/klibc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/classes/klibc.bbclass b/meta-initramfs/classes/klibc.bbclass
index 2aacf241e..855382579 100644
--- a/meta-initramfs/classes/klibc.bbclass
+++ b/meta-initramfs/classes/klibc.bbclass
@@ -3,7 +3,7 @@ DEPENDS =+ "klcc-cross"
 
 # Default for klcc is to build static binaries.
 # Set CC = "${TARGET_PREFIX}klcc -shared" to build the dynamic version.
-CC_forcevariable = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS}"
+CC_forcevariable = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS} ${@ ' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if (d.getVar('TUNE_CCARGS_MFLOAT') != '') else ''}"
 CC_forcevariable_armv4_linux-gnueabi = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS} -march=armv4 -mthumb-interwork"
 
 CPP_forcevariable = "${CC} -E"
-- 
2.14.1


