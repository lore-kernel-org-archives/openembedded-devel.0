Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0ACBD6BA13
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Jan 2014 11:14:08 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id m10so7158492eaj.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Jan 2014 03:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=xn1zAX19TMTZKV6P8zV1yrAX9XjSHKQGQ4xhIp/pp68=;
	b=TqU6HyYd4YLFX1R3qIQjd4RkjG2qja5cxPzAx6j/paz/2NX9q96g1vo4yJhMCHCAe1
	uG8mPw2MWs2kksaBr/uK8YzlL4Pa7fXhY4h3QTlgUd7t9OYmFvsu06ujlsFU5LtGQ2by
	wwc07BzRAWEI3P9YsqYnleQVUj/tOaDu+k9wfb/dnx6Y+/SZhCEBD3tM+rmqmViJc87k
	pevmQmYNWmpDUslSdsyjYc13n952N4rQlNWqZMYH2ymW/OWhUDJuF9C/2kPygB14f8XM
	xTMMrW77HjPSELWGZf0sgZQtDGQkv29RoTrIarP33lX8tYbmUp4YLjl7j+k+ud/Ggy4l
	9sQA==
X-Received: by 10.15.32.73 with SMTP id z49mr79079221eeu.27.1388834049731;
	Sat, 04 Jan 2014 03:14:09 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	o47sm152646531eem.21.2014.01.04.03.14.09 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Jan 2014 03:14:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Jan 2014 12:14:00 +0100
Message-Id: <7ffd054687958b403e3413ddc7dcf6e73b7f7732.1388833883.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <cover.1388833883.git.Martin.Jansa@gmail.com>
References: <cover.1388833883.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1388833883.git.Martin.Jansa@gmail.com>
References: <cover.1388833883.git.Martin.Jansa@gmail.com>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][for-dylan][PATCH 4/9] gateone: Drop allarch
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
X-List-Received-Date: Sat, 04 Jan 2014 11:14:09 -0000

* runtime dependencies are TUNE_PKGARCH causing do_package_write_*
  task to have different signature for MACHINEs with different
  TUNE_PKGARCH

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/gateone/gateone_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/gateone/gateone_git.bb b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
index e5b8527..e94376f 100644
--- a/meta-oe/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/liftoff/GateOne.git \
 
 S = "${WORKDIR}/git"
 
-inherit distutils allarch python-dir systemd
+inherit distutils python-dir systemd
 
 export prefix = "${localstatedir}/lib"
 
-- 
1.8.4.3


