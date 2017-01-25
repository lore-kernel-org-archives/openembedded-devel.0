Return-Path: <philip.balister@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id B76EB71BF2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 18:06:53 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id l7so32709488qtd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 10:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wBkLWD849rPhSTXoxSafANJwGPIKdDd5GQg3Km0iZ9Y=;
	b=iI/R/313oO3CKeZQy7LWVn6h3inUImgdAq1uGlam6jivzgWBW48fwb7hrT4JbpAVSf
	IUqkaG7baaknNbS0DsOOG+fTjEfSZL1bIjcCt6wuFBMVSNacR4+BCLpZPOFxNAfTy1W+
	Uwkzz8UdWgb04vJwl3yb0WKmJ7YVg7m6h2g6JJDe/hRaJmOBjL8NuArPYJP/4+HA3gXh
	pAguZSI3zRGPK5L19aO3VQVSbVoXuOWaZC6ktJA0XTqYMSxTfHVgdZlBEDam4GR97IJE
	479BxvGiEIVUsLyMzKgad3tr99dwMCYnE9qckzya3vZAtH9mwTl6jATzlYxlCP0UNLyG
	8/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=wBkLWD849rPhSTXoxSafANJwGPIKdDd5GQg3Km0iZ9Y=;
	b=FYj8g3QXjbTN4jbhwoSlT56bYLQeGG7x0MYqMQdPILSwg2h48NYQede4+nrzVCoZHm
	/8F8byyFQva3SW/DuxAjxpg22voKW5jssK3mpmEf9CvwXFUyiZgxygW2MYxYR0VR60P4
	DUCXfcNxA4NnEfaeo+LaX0nDP1aTZs66vyP6KR67PMuITHkhoWT821HNOtV1eEheHpNi
	kQvHCEu8E/b3cAd8KISgSVeP9UGaIkXSQL3wzKAs9Ppo3wwpq692CCHwv+3s2pFlyDPL
	Xt4c0n2CIak1ukLF+D3po+BncsbRT23+Z/14C0089cTZjAIFTGNNIY0Z2iP/chZBAr+q
	Fljw==
X-Gm-Message-State: AIkVDXI1OsC6EiXy+pQIs2BVlMBxhgaVWuuUcjjC6qcoEAxDp+jrwNW7acL0Ckeq8tyCeA==
X-Received: by 10.55.195.148 with SMTP id r20mr35312011qkl.45.1485367614295;
	Wed, 25 Jan 2017 10:06:54 -0800 (PST)
Received: from thuvia.localdomain (pool-108-4-175-67.ronkva.east.verizon.net.
	[108.4.175.67])
	by smtp.gmail.com with ESMTPSA id 140sm924624qkj.19.2017.01.25.10.06.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Jan 2017 10:06:53 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2017 13:06:43 -0500
Message-Id: <1485367604-27736-2-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485367604-27736-1-git-send-email-philip@balister.org>
References: <1485367604-27736-1-git-send-email-philip@balister.org>
Subject: [meta-python][PATCH 2/3] python-ndg-httpsclient: Fix build for per recipe sysroot.
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
X-List-Received-Date: Wed, 25 Jan 2017 18:06:54 -0000

Reverse order of include and inherit to prevent DEPENDS=
being overwritten.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-python/recipes-devtools/python/python-ndg-httpsclient_0.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-ndg-httpsclient_0.4.2.bb b/meta-python/recipes-devtools/python/python-ndg-httpsclient_0.4.2.bb
index 2da1112..ca0eb32 100644
--- a/meta-python/recipes-devtools/python/python-ndg-httpsclient_0.4.2.bb
+++ b/meta-python/recipes-devtools/python/python-ndg-httpsclient_0.4.2.bb
@@ -1,2 +1,2 @@
-inherit pypi setuptools
 require python-ndg-httpsclient.inc
+inherit pypi setuptools
-- 
2.7.4


