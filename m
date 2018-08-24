Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 42CF671BF2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2018 16:35:05 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id a4-v6so1313301plm.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2018 09:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=IqloltNFnEHALtOferQhgw0CSkl/xWhviiNI8StoYuk=;
	b=RWVcVAmd/Z2hk/0noBgXZieTg3t0bw574FWFCiFXc3/y/LKE7mtSVBQuUxA/O9D9is
	TRUUxdGnuGnNFf6bnRxuMlsaA1JJhsuX5aArSEQ929ruCHM7f4KmJK67WEETG9HpCOl0
	MTDXdhuPkBBOUdtSPTqHSVlkpPu5F1OR2EaSZ76nvl5v0yFZ7tjgPEkI4G05SQQBAFUh
	h/kn1bl++LpKKXnX7lzMJn9pRBMVA9wdpupHVpJ/2b08fn5dQsSs1FxxR6OcKX2bx0gF
	iM7UyZOySHbp/+QUNKQXqR3Url4Iw355PYn3j68DWZ1zeTCtUIx46Z0T/+6ZejwGOZDl
	4yVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IqloltNFnEHALtOferQhgw0CSkl/xWhviiNI8StoYuk=;
	b=NcZZl3JxONjJX4WNlRvVPZuIFkoMQyw2xkF1IOzVcViC4vudTnhLTjw54fwPMlTBU3
	QCFPDMGeQndu81B9PzaHqC1qjVKauZhr0L5qnvkkcdStYzb/ls/YyqoR+vmmPbOWR8nD
	fsR0kT8XDAuQLDt6IyJTxigwUIgdddHZOEjw0HlttjyScxbRukyhod/JmCJdm/VMWpyR
	PJamr/A8bUNkfTody1I8X1RdJg24/GIOWg/hs/UI1Ha6T6ba9C6XSTEYCw81IbJuF66r
	cgbLU8L2LFUq01U4Sz3VriMOnBsrsmRD10ZlWFG05lEsZNeuIPHggYh48R4OaBB8qjI4
	Y9WA==
X-Gm-Message-State: APzg51DXd/9Vyfo0Yn17iAJ8teJHBJZ8TZIwqCpIyWpAimvBlxNUXzgc
	9pFQQYYb49XllLB4ntZcmDye4vSQ
X-Google-Smtp-Source: ANB0VdYk/NX3aTpAvxNRwFwJEXNjxQnod+EVqfmbJYcj6XM5Q342mi3t3YpCS//tBdz5fCiwDQsVSw==
X-Received: by 2002:a17:902:7c8e:: with SMTP id
	y14-v6mr2391976pll.259.1535128505779; 
	Fri, 24 Aug 2018 09:35:05 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	f87-v6sm15708240pfh.168.2018.08.24.09.35.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Aug 2018 09:35:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Aug 2018 09:34:55 -0700
Message-Id: <20180824163456.10528-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [meta-python][PATCH 1/2] python-pyflame: Limit support to just glibc based systems
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
X-List-Received-Date: Fri, 24 Aug 2018 16:35:05 -0000

Fixes:
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-bec-linux-musl
| configure: error: Pyflame can only be built for Linux hosts

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andrew Jeffery <andrew@aj.id.au>
---
 meta-python/recipes-devtools/python/python-pyflame.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-pyflame.inc b/meta-python/recipes-devtools/python/python-pyflame.inc
index 3b84a7e8f8..2ee79f7b8a 100644
--- a/meta-python/recipes-devtools/python/python-pyflame.inc
+++ b/meta-python/recipes-devtools/python/python-pyflame.inc
@@ -10,3 +10,4 @@ S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools
 
+COMPATIBLE_HOST_libc-musl_class-target = "null"
-- 
2.18.0


