Return-Path: <philip.balister@gmail.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id B9A4B6E64A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2016 16:23:02 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id o124so29584829oia.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2016 08:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=3FCLRqcsy1PFv6PUdspQshTitcuW/OAxF19ElJag/zk=;
	b=EFyRjZ2ll+2+KYVA8qcgrKPJe6LYg87RRoco3ljF0DuisTqKp9zyz3kC709/oUKSBC
	/GnB3tl2xc9nPGjnqQ/w7RZskeH8LJO2Cp9+ai+saFclJhhGK6aAWIuvGctiu2Wmrviq
	yKmRAIc/CeYWdhPfZNJdDksdRTU++75N1Ri8DFVzFlOTl9b2g6dZyZKE2XTfdtjqo4eD
	LRgvS19T5rjWisCy0swOM1x0u1UnKZHfnhmVc+X4ijMHid27lDRFiqzMQAjAkxZ70tJc
	l4TirY8jpa6yaWx//Rd0xNaoLlRqRW/Miqo+GXzTi/WdMXiiN3bX/ljrzHRI87ZknNzm
	3qQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=3FCLRqcsy1PFv6PUdspQshTitcuW/OAxF19ElJag/zk=;
	b=Z5PcjI/g1fyP9HAeoOdVgUCiRs/ApPfRqxfw6x/Gm+dLBgbgKWdK08rrnJ5m2Z/Yoz
	zxnytH6s8BtrajGiSyAWUSJ94TKXbcaVjK7B1jwnk+rbXOgMy7G8nVgAFd1mvmQnIPl4
	hy0ZMzKUL2g1oxY9xc7lgkX2kVa7dMJBTPZUQ2i2t75b5NTrxyIYSH4ASs4+zUhhc6UY
	dYzbB9W9zj04wa/b+YRHOegFY+LcdoeQnb+sTYfAgedbKb/MHpjtnW/St+Mu6c/po9kr
	RUcCswdOeRha5CWmsYuh2VCT8dRDLHsZEyX42od71w5m5cunkA8wfuFYNjoRhmZaNnL6
	90kA==
X-Gm-Message-State: AG10YOQJt/1TT0uUH3Nm5Bw/c68khRjK9KZhG8r046GiEAc+fz9HVtWHLsvDIwmtgpA42g==
X-Received: by 10.202.177.193 with SMTP id a184mr2612150oif.86.1453998182502; 
	Thu, 28 Jan 2016 08:23:02 -0800 (PST)
Received: from thuvia.natinst.com (pool-108-44-110-59.ronkva.east.verizon.net.
	[108.44.110.59])
	by smtp.gmail.com with ESMTPSA id i7sm5854859oej.16.2016.01.28.08.23.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Jan 2016 08:23:01 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Jan 2016 11:22:57 -0500
Message-Id: <1453998177-24110-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.5.0
Subject: [meta-python][PATCH] python-vcversioner: Fix bad DESCRIPTION and HOMEPAGE entries.
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
X-List-Received-Date: Thu, 28 Jan 2016 16:23:04 -0000

Copy/paste is the root of all evil.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb b/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
index 152034b..6c96875 100644
--- a/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
+++ b/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
@@ -1,5 +1,5 @@
-DESCRIPTION = "Twisted Web Sockets"
-HOMEPAGE = "https://github.com/MostAwesomeDude/txWS"
+DESCRIPTION = "Python vcversioner"
+HOMEPAGE = "https://github.com/habnabit/vcversioner"
 
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=260625d695c5e0c9dd2c2ef898833c7d"
-- 
2.5.0


