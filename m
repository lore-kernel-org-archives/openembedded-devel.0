Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 220CF748A0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2018 19:00:20 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id f7-v6so4843853plr.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 12:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=A32CR7LlXzdGOJc9U7UKlHs5/l/PRk2jw/n7bJyAsQU=;
	b=tqUv/W9loGIMTf1eebgUna/AvzC+J9q7lyaaqIfOjUcONc9z4r7fKh5Hj/9mOIUSIv
	8j1bENOlp29dfHU7r5YWf3e1UoUo1Td7eN0eXPhTnlKgHsJPr1/AxloHWGX6QborKlVm
	fdWbSPs9zM0oDMdxgNfQ3vRCovipXUXx3L/7iBXTot/p1yWfOmoVkxwh82c7QSFv+3sl
	P83BayplrBvaLMZYal9aeLmfEFG5a0Y4+HlmbJh0jkfVAv/RY7DonWz+ePeXt4Fg5t9r
	VFzjztIWmZn8jL4c8D7ixjlKVUlOm+8NfOog3HgTuZFAWnGUbLfP//Ug3iEQbFYKS/+D
	8iAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=A32CR7LlXzdGOJc9U7UKlHs5/l/PRk2jw/n7bJyAsQU=;
	b=frcnvyplhpDlv5nphYAYVSBrIh4Q+s59/u4a1hs4ADUL0nyw7gX7yLct7T5K3Y6jRv
	VEHI4w8w24JBIr+Jl8H7e/KQRMQ9KdYhbdlRnzWSw8Y66zmSQ4ehouH43pWjtTq7Rsnm
	Hn2Zysv+s8vlYxVbQgbJry8VN5ciHl1022xt8hYILzfRJY0xlkDKRVoackEuvoQ7X9RZ
	f4dYQSrPrVL4dc58VDFXlvpds2/ovZwt0JMGRCv8BFwTzFnP84dSB16Nf+OBIxq8+VuV
	x4SuC0bVDk1Cciir342ehsDuz/1ZKJkaPEZakjBlct77cQVQojXfCOYiy+YKXS1rgvZl
	nuBQ==
X-Gm-Message-State: ALQs6tCIBExa9ocAUvbTkpag+8DGwbShQdF26htfeYT43t/t6OZJUY2K
	f20pnDssJrvbvFJUiZCTS9PF+g==
X-Google-Smtp-Source: AB8JxZqzeHik5BhbY0YaGkFNl3y2Rn6i3nfTU/CQnMw1t5RUfq58gV5hLKMS5sdZ5PhRferm0PPVaQ==
X-Received: by 2002:a17:902:7b86:: with SMTP id
	w6-v6mr25466074pll.183.1525892421879; 
	Wed, 09 May 2018 12:00:21 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	131sm27732437pfa.128.2018.05.09.12.00.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 May 2018 12:00:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2018 11:59:58 -0700
Message-Id: <20180509190011.30006-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509190011.30006-1-raj.khem@gmail.com>
References: <20180509190011.30006-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 03/16] lmbench: Link with libtirpc on glibc as well
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
X-List-Received-Date: Wed, 09 May 2018 19:00:21 -0000

glibc has dropped obsoleted rpc support

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index 03b3721ca8..35f2306a06 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
 
 inherit autotools-brokensep
 
-DEPENDS_append_libc-musl = " libtirpc"
-CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
-LDLIBS_append_libc-musl = " -ltirpc "
+DEPENDS += "libtirpc"
+CFLAGS += "-I${STAGING_INCDIR}/tirpc"
+LDLIBS += " -ltirpc "
 
 PR = "r2"
 
-- 
2.17.0


