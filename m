Return-Path: <gizero@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id CD1EE73CBD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2015 13:41:22 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so63626135wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2015 06:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XMGcJu2hp4+WGOMg+F7ADGNL9Vl2krPk2buvISFJv7w=;
	b=E3l1RwhKx2aN8KH5g292jb3MBjy4ixBZXuRZ0pGuL7rXZ1o76Ft1LRRvUYETu9hezg
	Z8SOdAdE89EfzYYDh2bfemMVEn9z/GTjpb5HMYIdBB+kWbsfL9d+/Wn32qENMbccuprC
	zt4GLWTvm1T0FosQZgfI31A7hstRgZDaArg4CDi+C7Q7N6brKMhJwqVh1OKJxsFdh6Ig
	Ti3J0Gfep5Wbo6YZ5saXqlff7h76BdwrVljH+38MtEOUZd7j4ZEaXd/m+B3kCJzpBv+k
	qLjrYWDeMdksA/1qSOc+2lHq/FHsuadq/4K49KFc5kjOhgUrv0IaSFaH63iONMhuVbo5
	a61Q==
X-Received: by 10.194.82.198 with SMTP id k6mr24443291wjy.139.1441978882420;
	Fri, 11 Sep 2015 06:41:22 -0700 (PDT)
Received: from gizero-desktop.tw.it
	(host168-65-static.12-87-b.business.telecomitalia.it. [87.12.65.168])
	by smtp.gmail.com with ESMTPSA id
	nb10sm621368wic.11.2015.09.11.06.41.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 11 Sep 2015 06:41:21 -0700 (PDT)
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Sep 2015 15:41:06 +0200
Message-Id: <1441978867-24237-3-git-send-email-gizero@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1441978867-24237-1-git-send-email-gizero@gmail.com>
References: <1441978867-24237-1-git-send-email-gizero@gmail.com>
Subject: [meta-oe][PATCH 2/3] redis: add redis.conf to CONFFILES
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
X-List-Received-Date: Fri, 11 Sep 2015 13:41:23 -0000

Signed-off-by: Andrea Galbusera <gizero@gmail.com>
---
 meta-oe/recipes-extended/redis/redis_3.0.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/redis/redis_3.0.2.bb b/meta-oe/recipes-extended/redis/redis_3.0.2.bb
index 4aea90a..4ed6879 100644
--- a/meta-oe/recipes-extended/redis/redis_3.0.2.bb
+++ b/meta-oe/recipes-extended/redis/redis_3.0.2.bb
@@ -35,3 +35,4 @@ do_install() {
     install -d ${D}/var/lib/redis/
 }
 
+CONFFILES_${PN} = "${sysconfdir}/redis/redis.conf"
-- 
1.9.1


