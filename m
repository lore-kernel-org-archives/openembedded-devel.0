Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 18261734DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 03:10:23 +0000 (UTC)
Received: by payr10 with SMTP id r10so19991361pay.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2015 20:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dyK2LT0/z+o4ouHMzmQmsSaW704sz0l3plmYzwefO5Y=;
	b=UXZAZI7UuUxdJfJve8cwt3qkpEPVNAUnhoW/s9AqHYsLviHUVXFWSA9ko3adtM8B4V
	qEHcCdgWIUFBVu4iwUh5WKdUVp4ZYkWVbTARk/RIDtzvSKyPYsJJYFi9xnSOuXbZWyye
	LHbc4f5oXXHjYW/IIZL2TK82Anblu66if0E49ik0uezMth8ONcjETCMVn872ah3oyXpS
	MtHLERqqhgpAp/RwT9+b+GhcNe67mj6g9JG+/Cw2SlGrTS4qFqdIfYLCwVlwxA50AC+A
	qphl3UrJEv6jPdt+yH70UMpoZwwiVcYjBW1+pZIXvXpMg2hDYZqdmuPvBl6RExfvdMYi
	M5tg==
X-Received: by 10.66.63.71 with SMTP id e7mr57867848pas.57.1433387424825;
	Wed, 03 Jun 2015 20:10:24 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id k13sm2018242pbq.79.2015.06.03.20.10.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Jun 2015 20:10:24 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jun 2015 20:09:48 -0700
Message-Id: <1433387388-7660-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1433387388-7660-1-git-send-email-armccurdy@gmail.com>
References: <1433387388-7660-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 5/5] mariadb.inc: duplicate i586 over-ride for i686
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Jun 2015 03:10:25 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-support/mysql/mariadb.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index 00fa965..3ee1b75 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -175,6 +175,7 @@ FILES_libmysqlclient-dbg = "${libdir}/plugin/.debug/ \
 # which are intentionally non-PIC on 32-bit x86 (see e.g.
 # storage/xtradb/plug.in in the source)
 INSANE_SKIP_libmysqlclient_append_i586 = " textrel"
+INSANE_SKIP_libmysqlclient_append_i686 = " textrel"
 
 FILES_libmysqlclient-r = "${libdir}/libmysqlclient_r.so.*"
 FILES_libmysqlclient-r-dev = "\
-- 
1.9.1


