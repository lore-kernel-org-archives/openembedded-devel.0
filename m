Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OzB2M-0005co-1c
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 18:22:15 +0200
Received: by mail-yx0-f175.google.com with SMTP id 6so1071727yxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 09:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=+ZA/bXxk/V8YUUjJ8tTMfDGzf9CPV/LbIV5RO1C7+PE=;
	b=Re0nnYzyiEq71/hoE13cA4wQX7lnF8aKcl2c2GBAoGH83oSQiuvZl3ciNL+BHg3OE0
	F3HYJ33X9GKm4qgzQ2Ucq5SZpDNpoNcsRt+zsx7jDTIo0h4JKDA1EJyBFvLwOaEJ9ke3
	FOUBXKHLT5M99gjaygi7nVnjKDk3f4xpV6EBc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=lcb9+d6TP2xtV0yTMzIolNSqwyShOBJK8L6xDOxRo3EbAer8tH/IcfMR2epzPCMRN3
	mXdOrfivlw42zOaPV/V7SBQVIjsstUbPdjg0/dTuMSGZ4BlfqxNRf32zuZ2RjWBQOiEm
	9/SS44shFlQukG3r8yzKuVybZsqtvEB9Ifx9U=
Received: by 10.100.254.11 with SMTP id b11mr4138211ani.108.1285345323938;
	Fri, 24 Sep 2010 09:22:03 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id c7sm3616921ana.18.2010.09.24.09.22.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 24 Sep 2010 09:22:03 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Sep 2010 11:09:35 -0500
Message-Id: <1285344575-25214-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] fbset_2.1: add dependency on bison-native
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
X-List-Received-Date: Fri, 24 Sep 2010 16:22:15 -0000

* fbset requires bison in order to build.  This patch adds
  bison-native to the DEPENDS.  This has the following benefits:
    * The user does not have to have bison installed on their
      host system
    * The version of bison can be specified in the configuration
      files instead of being the version on the host system.
      In my case the version of bison used on my host was adding
      GPLv3 licensing with exceptions but other systems would
      build and provide GPLv2 with older versions of bison
    * Adds predictability for version of bison being used
      between builds.  The first time fbset is built bison-native
      may not have been built and the host version of the tool
      is used.  The next time bison-native has been built and
      the staged version is used.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 recipes/fbset/fbset_2.1.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/fbset/fbset_2.1.bb b/recipes/fbset/fbset_2.1.bb
index 029f751..04ea35f 100644
--- a/recipes/fbset/fbset_2.1.bb
+++ b/recipes/fbset/fbset_2.1.bb
@@ -8,8 +8,9 @@
 DESCRIPTION = "The fbset console tool"
 LICENSE = "GPLv2"
 RRECOMMENDS_${PN} = "fbset-modes"
+DEPENDS = "bison-native"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://ftp.debian.org/debian/pool/main/f/fbset/fbset_2.1.orig.tar.gz \
            file://makefile.patch"
-- 
1.7.0.4



