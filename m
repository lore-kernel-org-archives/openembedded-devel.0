Return-Path: <net147@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id E8A29731A3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2016 10:43:27 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id b124so18431031pfb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2016 03:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=KwsEB8+dcB/ErZbThlhX81AhgpP2PWLRcrYCdb5hFlk=;
	b=X/Z95XOUF1y4pZxBvFvwoSnw9YeIVm/89DBMRTXc6yJ5IzbGk9KPbwZND9jFioA74B
	+zLb5CXINL0FxaPioRnN3GlSgVlMqIqL+Tavb8xQZBC48zvN76aHe7KeoG/GFh0MTjFT
	Pmyam5Xw8dUX4WZ6Ij3bWY8617ejjC0UW9lcqshg2bW2pvgeAm11/ZVWT6HSkm+NhkLF
	akwfUfJGHQtlFI2nYwLFNGK1kbySQqgUAtCM1vHTpEFN/PRymaUup5PCO6H1nKMGe2qu
	ebLJh7N8EK9FxswRYzqsePSyNK3YbihovsTBUZivnhEN5shGJ+AeRE9Gveld7WHKxNB3
	bL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KwsEB8+dcB/ErZbThlhX81AhgpP2PWLRcrYCdb5hFlk=;
	b=aPlDOZ7D8RDnmdb1vbnP+fnE/gV22nbyBgW6OOA8odOexqHWffOh/nNcrvfJg9ZdRa
	hKyWtPO0BzG2bSwroMrVmTJx2d+iYLzNY7qFtj5HEQH0TSQVT3BWH6rK19gGi1Skk+9D
	sBZP556JGdnlz9rgUnFofcY8Q6smiKispBxv4rm61fo1VZV7KLyWR0kaB7ccCwUBQOjw
	Tx5qPvmrBzJTEPM2bMhx9eBzjX18HJZOmPiV9Rho8K2dU7kB8sgJkAuRFlaxwI7jURnS
	OF62/IwwD4ycIDWZMeEHRV+PDrfoQ8Ujn+cXiu8fk4vNf6cmAFgxko6IJZwIXg8OjxmY
	8+5A==
X-Gm-Message-State: ALyK8tKzwYCF/n0+y4c28CPOxoJWw1xXQt0b3nj6TZvC5Pif+e0dWtrXxyVzpDyXxAK3+w==
X-Received: by 10.98.70.3 with SMTP id t3mr37646485pfa.147.1464518608192;
	Sun, 29 May 2016 03:43:28 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	w23sm25436772pfa.38.2016.05.29.03.43.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 May 2016 03:43:27 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 May 2016 20:43:43 +1000
Message-Id: <1464518623-23458-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.8.0
Subject: [meta-networking][PATCH] libtevent: add missing libaio dependency
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
X-List-Received-Date: Sun, 29 May 2016 10:43:28 -0000

Fixes the following compile error:
| [ 6/27] Compiling lib/replace/test/testsuite.c
| In file included from ../lib/replace/test/testsuite.c:49:0:
| ../lib/replace/system/aio.h:29:20: fatal error: libaio.h: No such file or directory
| compilation terminated.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-networking/recipes-support/libtevent/libtevent_0.9.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.9.28.bb b/meta-networking/recipes-support/libtevent/libtevent_0.9.28.bb
index d0ad748..3f5d7f4 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.9.28.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.9.28.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://tevent.samba.org"
 SECTION = "libs"
 LICENSE = "LGPLv3+"
 
-DEPENDS += "libbsd libtalloc"
+DEPENDS += "libaio libbsd libtalloc"
 RDEPENDS_python-tevent = "python"
 
 SRC_URI = "http://samba.org/ftp/tevent/tevent-${PV}.tar.gz"
-- 
2.8.0


