Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5C1D76C108
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Apr 2019 09:39:20 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id w1so11092404wrp.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Apr 2019 02:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=OqAf0F7cE0iVtta4VGD+SqvBUNqd8HBDRKC3tzay5no=;
	b=S3wsNnjj7vFnHedSeyBu1eWcF2tjxJqsEWhsOjy7g5gavmj3d2dcPvhRvjVYN+xAOP
	9yxgvoT8+ZTIgQJwtkOzSnpocf4XiKR9TUe4HaqTzujZDzXSCOaopf08mwn+LLZQFJJN
	NmSTQe+6/c8zqOmcA3JoAGdawN3eDcL//EoXZYtMZO2NphHXTOXqM8aAnBM12W9MJXc9
	mbj08amOGCtrcZ0xAfZlij8FA9M9yIxN8b47tevOJqrzCU8aW+NQlhLTf360NPHo2qiX
	yHk6FAAzIhlj+Gx9Vxqv8z9/4GA2K16Ym9W+/FcIwc9xYteKk6g5YJ4it8DoDlqNQrON
	q0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OqAf0F7cE0iVtta4VGD+SqvBUNqd8HBDRKC3tzay5no=;
	b=KjSj5LbadLJDKWYqlSL9bKwHpo1qhuhtLPqYo+HsEhMY4Zun8aw0xnEeQvrFXkGDcj
	I8E0acdHgDL5Pd23K4/mV/alYD5dBbT/OI37EFbVLLCNaEjVSzwCe5PEaq8jEHub1uFE
	0x5zdv1ciIGsjdvGTFSOQng5S9J6LULk6KvakzSBhRswBC3BgeHatlizuwAHywbJ+XLG
	3QUk8F+QmAm3UnFBUnyX9YxNzs69kvRVSJuamDIc9mj917IA5pcl0NFDdUuXJBn3EEKn
	g6ydcLyNTbT7e0Ju1GhFIscu6hSjIjGy2pwnx4lSFQi1aHn87zvW/D1avn+LqBWT8Rcg
	xxtg==
X-Gm-Message-State: APjAAAV/luekXLXkQnUkNfUAFrm6JjNPhpsUbOwhZiVRXj0Rqt0pT8sx
	Sz+6qti8FufUjBZ1lnn9hdGOXaMV
X-Google-Smtp-Source: APXvYqyY72PoBeMFMZmRRE370gFLupKvS+qqwUqH4Q1tj58hR1zlqwDnymMPsC6pxs8vnlRmqDroOg==
X-Received: by 2002:adf:dc8e:: with SMTP id r14mr41414306wrj.118.1554111560869;
	Mon, 01 Apr 2019 02:39:20 -0700 (PDT)
Received: from Unimatrix05-Bionic.lan
	([2001:b07:5d32:c012:6d2c:49fa:2112:b346])
	by smtp.gmail.com with ESMTPSA id
	x5sm15623269wmi.37.2019.04.01.02.39.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Apr 2019 02:39:20 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Apr 2019 11:39:17 +0200
Message-Id: <20190401093917.28952-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] libmodbus: start to prefer version 3.1.4, now that even Debian updated testing to it. Upstream declares this version as "very stable", so maybe it is really time to switch to it
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
X-List-Received-Date: Mon, 01 Apr 2019 09:39:20 -0000

---
 meta-oe/recipes-extended/libmodbus/libmodbus_3.1.4.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.4.bb b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.4.bb
index d438a0abc..cc45fa7e2 100644
--- a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.4.bb
+++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.4.bb
@@ -1,7 +1,4 @@
 require libmodbus.inc
 
-# Use the stable branch by default
-DEFAULT_PREFERENCE = "-1"
-
 SRC_URI[md5sum] = "b1a8fd3a40d2db4de51fb0cbcb201806"
 SRC_URI[sha256sum] = "c8c862b0e9a7ba699a49bc98f62bdffdfafd53a5716c0e162696b4bf108d3637"
-- 
2.17.1


