Received: from dd20204.kasserver.com ([85.13.140.93])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Bernhard.Guillon@opensimpad.org>) id 1POrYi-0001nU-EQ
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Dec 2010 13:49:49 +0100
Received: from localhost (95-90-74-25-dynip.superkabel.de [95.90.74.25])
	by dd20204.kasserver.com (Postfix) with ESMTP id 525AF18051DB2;
	Sat,  4 Dec 2010 13:48:25 +0100 (CET)
From: Bernhard.Guillon@opensimpad.org
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Dec 2010 13:48:22 +0100
Message-Id: <1291466902-9119-1-git-send-email-Bernhard.Guillon@opensimpad.org>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 85.13.140.93
X-SA-Exim-Mail-From: Bernhard.Guillon@opensimpad.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] usermanual: use the latest git revison date of the usermanual dir as pubdate. Basic idea taken from http://sources.redhat.com/ml/docbook-apps/2003-q2/msg00036.html
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
X-List-Received-Date: Sat, 04 Dec 2010 12:49:49 -0000

From: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>


Signed-off-by: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
---
 docs/usermanual/Makefile       |    7 ++++++-
 docs/usermanual/usermanual.xml |    3 +++
 2 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/docs/usermanual/Makefile b/docs/usermanual/Makefile
index 36ea5e2..cde0918 100644
--- a/docs/usermanual/Makefile
+++ b/docs/usermanual/Makefile
@@ -26,12 +26,15 @@ define command
 endef
 endif
 
+releasedate:
+	git log --date=iso -n 1 --date-order ./ | grep Date | cut -f 2-$N -d ":" > releasedate.txt
+
 all: $(types)
 
 lint: $(manual) FORCE
 	$(call command,xmllint --xinclude --postvalid --noout $(manual),XMLLINT $(manual))
 
-$(types) $(foreach type,$(htmltypes),$(type)-nochunks): lint FORCE
+$(types) $(foreach type,$(htmltypes),$(type)-nochunks): releasedate lint FORCE
 
 $(foreach type,$(htmltypes),$(type)-nochunks): $(if $(htmlcss),$(htmlcss)) $(manual)
 	@mkdir -p $@
@@ -59,4 +62,6 @@ clean:
 $(foreach i,$(types) $(foreach type,$(htmltypes),$(type)-nochunks),clean-$(i)):
 	rm -rf $(patsubst clean-%,%,$@)
 
+.PHONY: releasedate
+
 FORCE: 
diff --git a/docs/usermanual/usermanual.xml b/docs/usermanual/usermanual.xml
index dc38aba..8cd5d97 100644
--- a/docs/usermanual/usermanual.xml
+++ b/docs/usermanual/usermanual.xml
@@ -5,6 +5,7 @@
 -->
 <!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd" [
+<!ENTITY releasedate SYSTEM "releasedate.txt">
 <!ENTITY chapter-introduction SYSTEM "chapters/introduction.xml">
 <!ENTITY chapter-metadata SYSTEM "chapters/metadata.xml">
 <!ENTITY chapter-gettingoe SYSTEM "chapters/getting_oe.xml">
@@ -59,6 +60,8 @@
       <holder>Rolf Leggewie</holder>
     </copyright>
 
+    <pubdate>&releasedate;</pubdate>
+
     <legalnotice>
       <para>This work is licensed under the Creative Commons Attribution
       License. To view a copy of this license, visit <ulink
-- 
1.7.1



