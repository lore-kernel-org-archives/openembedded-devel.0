Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ss5nJ-0005hz-7m
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Jul 2012 07:30:29 +0200
Received: by pbbrq2 with SMTP id rq2so4953799pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 22:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=W4SROeL/8TKBQmb1drLNlWFjGbXW9jFYQOJNwNkCyOc=;
	b=HimDLWDoexMcEQSm2dwFkQbaifPnNHlH9+cX8AxGZxTH2xg/FXj+XpmzTGCgN7Vwf2
	za+h2iplOZZsyIYpq0w9G30JiddgjTrauTxfYSsQfJ9f7Dgr2vNWgk+eQJXFIY0iZ3PJ
	Wy7QjBIv3l7MdHJA9whkMS8DHNI7qpw1OosUdDnzYjNp66jr5hxHJlhfBjQPxoHyA7CT
	bFDRfcGM46OtYNVQ0JF2KMBAW+Y+CGTMXJoQbpd/jyeRUcpbND5Q08EvAB4ZjVXFXD35
	5QFYpcx0qN7WI9kQU8TiVPaqQgjYkT1iP3kzVftqOLSRKy/V1sJ/zMAkbBqt+DPRaItq
	sa+Q==
Received: by 10.68.242.7 with SMTP id wm7mr10818182pbc.98.1342761545332;
	Thu, 19 Jul 2012 22:19:05 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id ng8sm3217474pbc.13.2012.07.19.22.19.03
	(version=SSLv3 cipher=OTHER); Thu, 19 Jul 2012 22:19:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 22:18:57 -0700
Message-Id: <1342761538-19890-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1342761538-19890-1-git-send-email-raj.khem@gmail.com>
References: <1342761538-19890-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-java][PATCH 4/5] jaxp1.3_1.4.01.bb: Fix SRC_URI checksums
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
X-List-Received-Date: Fri, 20 Jul 2012 05:30:29 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-core/xml-commons/jaxp1.3_1.4.01.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/xml-commons/jaxp1.3_1.4.01.bb b/recipes-core/xml-commons/jaxp1.3_1.4.01.bb
index ffd704c..481a1ec 100644
--- a/recipes-core/xml-commons/jaxp1.3_1.4.01.bb
+++ b/recipes-core/xml-commons/jaxp1.3_1.4.01.bb
@@ -27,7 +27,7 @@ do_compile() {
   fastjar -c -m manifest.commons -f ${JARFILENAME} -C build .
 }
 
-SRC_URI[md5sum] = "5536f87a816c766f4999ed60593a8701"
-SRC_URI[sha256sum] = "8e8a412aeb95644eaf14ec1a5cfd04833e38cac4a01b83d73d7de2368a35a597"
+SRC_URI[md5sum] = "2fea8e97a5d4d1a24bd05f5f62f3e04e"
+SRC_URI[sha256sum] = "d34bd88dc89c5c1ed2545ec5c61e4606fc28beb200a6fecf8c3ed17694181866"
 
 BBCLASSEXTEND = "native"
-- 
1.7.9.5



