Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OssD9-00039G-VH
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 09:03:20 +0200
Received: by pxi11 with SMTP id 11so1249443pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Sep 2010 00:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=pyFDetaNI5moN/XVcOC97GxGGnF8GJ7TS0t2HvJvr0Q=;
	b=YAIHj89Zy3zCMbxGq/RaXMCVeJXO+ZQZoLFqGg9I2Dl0AF96jz9t3POkLlyhwj7i9o
	ZNd28yGpCDI8xHW23mBI26MbJIdx3he3MqspdnmzeQhZgaaNe3BFwp0VA+aXKGNIGBS2
	i+gFJLTDdenjHKEN+C59UgwAnI3q3Ze4uBgZc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Ax9qv3lsoDAjgVjdwHGzcP4Pfk2KI4kj3wNZIe0cvcB3kBZ5mIfMI2iUj1fajdvvo+
	D4RA85woj9JSNw2ihESLHiWPk/0oPW+1nf6gaXbnjwO4Ys4OOhJhHuEIew4mkY+mO4+c
	bm/H0CMMPqoG2thIXw9uoj+gHA584+oePeFE0=
Received: by 10.114.136.19 with SMTP id j19mr4654891wad.54.1283842959071;
	Tue, 07 Sep 2010 00:02:39 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id o17sm12901596wal.9.2010.09.07.00.02.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 07 Sep 2010 00:02:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Sep 2010 00:02:32 -0700
Message-Id: <1283842952-20249-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1283842952-20249-1-git-send-email-raj.khem@gmail.com>
References: <1283842952-20249-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] jaxme_0.5.2.bb, xpp3_1.1.3.4.O.bb: Remove do_stage_append
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
X-List-Received-Date: Tue, 07 Sep 2010 07:03:21 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/xml-commons/jaxme_0.5.2.bb    |    7 -------
 recipes/xml-commons/xpp3_1.1.3.4.O.bb |    4 ----
 2 files changed, 0 insertions(+), 11 deletions(-)

diff --git a/recipes/xml-commons/jaxme_0.5.2.bb b/recipes/xml-commons/jaxme_0.5.2.bb
index 4fa9cdf..304c06d 100644
--- a/recipes/xml-commons/jaxme_0.5.2.bb
+++ b/recipes/xml-commons/jaxme_0.5.2.bb
@@ -39,13 +39,6 @@ do_install_append() {
 	oe_jarinstall jaxmepm-${PV}.jar jaxmepm.jar
 }
 
-do_stage_append() {
-	oe_jarinstall -s jaxmeapi-${PV}.jar jaxmeapi.jar
-	oe_jarinstall -s jaxmejs-${PV}.jar jaxmejs.jar
-	oe_jarinstall -s jaxmexs-${PV}.jar jaxmexs.jar
-	oe_jarinstall -s jaxmepm-${PV}.jar jaxmepm.jar
-}
-
 # Compile helper
 # 1 - source dir
 # 2 - dest dir
diff --git a/recipes/xml-commons/xpp3_1.1.3.4.O.bb b/recipes/xml-commons/xpp3_1.1.3.4.O.bb
index 11b82ab..40f7cb2 100644
--- a/recipes/xml-commons/xpp3_1.1.3.4.O.bb
+++ b/recipes/xml-commons/xpp3_1.1.3.4.O.bb
@@ -42,10 +42,6 @@ do_install_append() {
 	oe_jarinstall xpp3-xpath-${PV}.jar xpp3-xpath.jar
 }
 
-do_stage_append() {
-	oe_jarinstall -s xpp3-xpath-${PV}.jar xpp3-xpath.jar
-}
-
 FILES_libxpp3-xpath-java = "${datadir}/java/xpp3-xpath*"
 
 
-- 
1.7.1



