Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Txd5l-0002z7-H7
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 13:37:00 +0100
Received: by mail-we0-f175.google.com with SMTP id z53so1998048wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2013 04:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=AqaI8qvAvD+5JXF3cudMyh5kXzA/J5r6QUk+/SPMoj8=;
	b=ucskpTWYGvvgvF3Rh9QI/SScQ8O8QhcXVRgl/ApYVd+Hku0sgeSXLc6zAtIkNZf5cy
	fvSraPBh+GVUKDTaSrNTHYi8QyZL6stDXGHNXKNvMAcSYRIqwezmWSRuQJkWRL/qX1gA
	Th+ZRsYwclLCwxFToKYQSDZ8FamoTuCehFl6h9CbslNdzcrucN/fzZu11XG3q9P9AJFd
	m8Ggp2UuHbi4QLLgpuaXOwo78iUIn+rmHr+RSU5l8IOohlH4WISATqsbOYBOeugUO1KT
	7e8sDKYaOLAwZ9m/pmKIyEN/RyH52yVGMZxm+lGhjW7h5fOFfUdFPp9UjLWWNN305+n1
	vqVA==
X-Received: by 10.180.101.99 with SMTP id ff3mr20977298wib.21.1358857262466;
	Tue, 22 Jan 2013 04:21:02 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id p2sm23564257wic.7.2013.01.22.04.21.01
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 04:21:02 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Jan 2013 13:20:59 +0100
Message-Id: <1358857259-11444-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.1
In-Reply-To: <1358857259-11444-1-git-send-email-Martin.Jansa@gmail.com>
References: <1358857259-11444-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe][meta-networking][meta-xfce 4/4] autofs: fix QA warnings
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jan 2013 12:37:36 -0000

autofs-5.0.7: autofs: Files/directories were installed but not shipped
  /run

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
index bf679b4..2bf03f1 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
@@ -60,4 +60,8 @@ do_configure_prepend () {
         fi
 }
 
+do_install_append () {
+	test -d ${D}/run && rmdir ${D}/run
+}
+
 INSANE_SKIP_${PN} = "dev-so"
-- 
1.8.1.1



