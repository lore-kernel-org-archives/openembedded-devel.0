Received: from mail-ee0-f54.google.com ([74.125.83.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TmkqC-0001ng-UM
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 13:39:58 +0100
Received: by mail-ee0-f54.google.com with SMTP id c13so3101744eek.27
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 04:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=eiXm2PaZB0l5DRnQt9se5rqVk13AbOLqFxItNggcUgs=;
	b=qscFJUkG2ViEQjaVB6FjYmGb2zKBWR9KuJdV27Pz7EpYVhekRdhfy/tPcuGS33+kcc
	zk4xW502hlIilC3hX8Q4yT2njxtflFvgIpdzrtQXMU/JFEMY+sjpWXFOm2g9MeQutRrM
	8uq55N0XNbR/KDe3qEk/vDDa1ss9vjI0VkBEPsA8It//C5A8IrZcnozLqTpTJefGIQUo
	HYj4J2Lt35vo4gexUBZzYSKZhcp39R3D/VqRFFNaaAnoCjYD+Ua56DfKV50sh8ADZlNA
	75NYwJ7maUx7Tsj6aQmiPA+//aRqCgsasZOBTl7QPQP8AxOPOXh2rEoJbrqyYKY4e1OA
	5COA==
X-Received: by 10.14.205.199 with SMTP id j47mr47778405eeo.26.1356265492636;
	Sun, 23 Dec 2012 04:24:52 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id v46sm34563963eep.1.2012.12.23.04.24.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 04:24:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 13:21:45 +0100
Message-Id: <d5bb26f8ace3a3b9802f40a5ef5778d51954ba81.1356264861.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 20/30] libedit: upgrade to 20121213 and fix download
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
X-List-Received-Date: Sun, 23 Dec 2012 12:40:34 -0000
X-List-Received-Date: Sun, 23 Dec 2012 12:40:34 -0000

* pass bitbake as User-Agent to wget, without this upstream site refuses with 406

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libedit/{libedit_20120601.bb => libedit_20121213.bb}            | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/libedit/{libedit_20120601.bb => libedit_20121213.bb} (60%)

diff --git a/meta-oe/recipes-devtools/libedit/libedit_20120601.bb b/meta-oe/recipes-devtools/libedit/libedit_20121213.bb
similarity index 60%
rename from meta-oe/recipes-devtools/libedit/libedit_20120601.bb
rename to meta-oe/recipes-devtools/libedit/libedit_20121213.bb
index 1be967d..35e619c 100644
--- a/meta-oe/recipes-devtools/libedit/libedit_20120601.bb
+++ b/meta-oe/recipes-devtools/libedit/libedit_20121213.bb
@@ -8,9 +8,11 @@ DEPENDS = "ncurses"
 
 inherit autotools
 
+# upstream site does not allow wget's User-Agent
+FETCHCMD_wget += "-U bitbake"
 SRC_URI = "http://www.thrysoee.dk/editline/${PN}-${PV}-3.0.tar.gz"
 
 S = "${WORKDIR}/${PN}-${PV}-3.0"
 
-SRC_URI[md5sum] = "e50f6a7afb4de00c81650f7b1a0f5aea"
-SRC_URI[sha256sum] = "51f0f4b4a97b7ebab26e7b5c2564c47628cdb3042fd8ba8d0605c719d2541918"
+SRC_URI[md5sum] = "f475f50fe7467c1074c0fbae8b5bca1a"
+SRC_URI[sha256sum] = "0379e4a73c219f260e6d16adbc2e87635532ebb4c5a83a7399f231dc40108d1f"
-- 
1.8.0.2



