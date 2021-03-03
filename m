Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web12.6521.1614778389621935827
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 05:33:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=MBp9qLw6;
 spf=pass (domain: gherzan.com, ip: 64.147.123.25, mailfrom: andrei@gherzan.com)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.west.internal (Postfix) with ESMTP id D2CC817E8;
	Wed,  3 Mar 2021 08:33:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 03 Mar 2021 08:33:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm1; bh=Na46qRNHa94eT
	6nWAWpHHW3KXs+gwjKZh9ypWy7dYxY=; b=MBp9qLw6qR+zs5QKOnjiYnYiLlVMB
	S4HJlSrIbyB6TfSEtjMTkeJyV4BExJ3nfFDRqwRTQPkiQj2wJPoCbQg+a6NlzaXc
	Q5taTNN8edggqNSafQfZt/aEusv8vUYPTcn3anqPAfRkYFmLZvYRT4iEzMgRXI6n
	To4CJHRHwPV/yx54OXPq8P92FJhJ4muvoxDFfOiTZtRh2OEsnRxurLoEx5OZQFsW
	KxXcc0mEV8ZyjJC6zgLkWRMf4dl+3IrdA8nZzsJs/TqHDVsBFB+nvN/sbdLXRbD7
	U0h1B8Xg0tD705m44ry+UGVEqw7H/trQ4mlyVj5BY3EX51nxvhhnIESfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=Na46qRNHa94eT6nWAWpHHW3KXs+gwjKZh9ypWy7dYxY=; b=T3PdMBm/
	OlDybF5WRk5YU+0BowVA+6bzhZw/WJPXCNPNnhy0K+mBwLbg1adGSaRM57E9+sds
	76sDzAkjA99H1kcC2nVQOKxYQndLQ7jDPTdC3oU3f87DGG2kZqq7s57ncjg9Y9fA
	Mjo713WX0FvznpWJq2NAkj8J7Ir5QHMV/CX4O3TGSu8OG6Q2qcyEPfwYmpcOYwUC
	HiM0i00g5ws7j0ImVDxfeEdjrDhYbCS8w8l+KpkeKwE2+oQoYdTHKyfj+dgVTSez
	5v3krW9UiwrfLsRxH2uF7GKHkysoiNJp0eBl48BbreE3rMDzRcTqh18baArgCmel
	Xh+ejO4XlJ39zQ==
X-ME-Sender: <xms:FJA_YB3a8WeQeM9ZuY-NoZTU1PMbJxE5JEBMVMT5gr4jGFQGmlO-Tw>
    <xme:FJA_YBufQKDw-S57G3afoxIQGJu0Jq4erZjRIU9zg-ftde9yD3JsYySNbtrCn5urw
    B7YlKDT_SqyP4ASG1M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtvddgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgv
    ihcuifhhvghriigrnhcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqnecuggftrf
    grthhtvghrnhepleeliefhvedvvdejgfeuueekgeffieevhffgleduhfdugeegffdutdel
    feeugeeunecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddtledrudegie
    drfeejrddukedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:FJA_YB74KxO8AuVrUd0CkgJmuhrGeuHdGkqGAQ01bnRJltAEoBWcZg>
    <xmx:FJA_YCKhyZ4T-IDonuuKEH9yR4yqszWxdIa94apJDWdiRaeep61f9Q>
    <xmx:FJA_YB6rwLIKL8Qt22w58NGfhOzKH9mKZmwOAz1EZZ8v_Q6IHZgWQQ>
    <xmx:FJA_YF6P4KbvNCsjI1tA7qp6CST8LtFig6I9VdNqffi8si9vbLFJLw>
Received: from qwirkle.internal (host109-146-37-182.range109-146.btcentralplus.com [109.146.37.182])
	by mail.messagingengine.com (Postfix) with ESMTPA id C9A3B1080054;
	Wed,  3 Mar 2021 08:33:07 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrei Gherzan <andrei@gherzan.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH v2 6/6] python3-mccabe: Fix HOMEPAGE
Date: Wed,  3 Mar 2021 13:32:41 +0000
Message-Id: <20210303133241.29781-6-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210303133241.29781-1-andrei@gherzan.com>
References: <20210303133241.29781-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrei Gherzan <andrei@gherzan.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb b/meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb
index 63a9e35ac..b366f0430 100644
--- a/meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "McCabe checker, plugin for flake8"
-HOMEPAGE = "https://github.com/dreamhost/cliff"
+HOMEPAGE = "https://github.com/PyCQA/mccabe"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a489dc62bacbdad3335c0f160a974f0f"
-- 
2.30.1

