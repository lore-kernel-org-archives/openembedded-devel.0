Received: from mail-fx0-f227.google.com ([209.85.220.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NeaxA-0005CE-JG
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 22:15:35 +0100
Received: by fxm27 with SMTP id 27so1137730fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Feb 2010 13:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=o7mbmVhOB5TYQG4E+BraxGJFglhJLNTpD1GhrDLQ4J0=;
	b=gO2BEl/Sw9GGZ4wl+UoCqrkWCAHS4L5wqTuVfnCcQQy7S6tCivM5wwcGvUydbfxVJI
	iftSdjGJzYkeA7dfJDq8X+tYFd/GHfAetWA6NqjoU4R1ka9GuSpGTAo94VLwxWEfglxP
	m1E5b839vOkHJWTX/Rr6Ed618oqEdF5K59GLQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ByGSktw0Q2UD6EMbfDvp7IwGwFw4+Ifn6fbr4p6vkKigq9/YHkSPbwhHays/i9SKpj
	YxFfz/Gq8Oj3AfqpKwaFoTWgVdYBngMCy7W9UuFTcq+jVO5YiusN61FCfuf5O5vHqNsa
	4YCi5/V/cR1UzF01G+Fq5MjcOTicPkUj46kg8=
Received: by 10.223.4.145 with SMTP id 17mr3148805far.17.1265663580340;
	Mon, 08 Feb 2010 13:13:00 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id z10sm7240241fka.0.2010.02.08.13.12.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 08 Feb 2010 13:12:56 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NeawH-0004GL-HI; Mon, 08 Feb 2010 22:14:37 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Feb 2010 22:14:30 +0100
Message-Id: <1265663673-16312-10-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1265663673-16312-9-git-send-email-rep.dot.nop@gmail.com>
References: <1265663673-16312-1-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-2-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-3-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-4-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-5-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-6-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-7-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-8-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-9-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.220.227
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 09/12] flex: remove version specifics from generic inc
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
X-List-Received-Date: Mon, 08 Feb 2010 21:15:35 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/flex/flex-native_2.5.31.bb |    4 ++--
 recipes/flex/flex.inc              |    3 ---
 recipes/flex/flex_2.5.31.bb        |    5 ++++-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes/flex/flex-native_2.5.31.bb b/recipes/flex/flex-native_2.5.31.bb
index 1e9354a..de3f215 100644
--- a/recipes/flex/flex-native_2.5.31.bb
+++ b/recipes/flex/flex-native_2.5.31.bb
@@ -1,6 +1,6 @@
-require flex.inc
+require flex_${PV}.bb
 inherit native
-PR = "r2"
+PR = "r3"
 
 do_stage () {
 	install -m 0755 flex ${STAGING_BINDIR}
diff --git a/recipes/flex/flex.inc b/recipes/flex/flex.inc
index 4ebd44a..37e34fe 100644
--- a/recipes/flex/flex.inc
+++ b/recipes/flex/flex.inc
@@ -2,9 +2,6 @@ DESCRIPTION = "Flex is a tool for generating programs that recognize lexical pat
 SECTION = "devel"
 LICENSE = "BSD"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-2.5.31.tar.bz2 \
-           file://flex-lvalue.diff;patch=1 \
-           file://fix-gen.patch;patch=1"
 S = "${WORKDIR}/flex-${PV}"
 
 inherit autotools
diff --git a/recipes/flex/flex_2.5.31.bb b/recipes/flex/flex_2.5.31.bb
index e247a03..ae9e6f9 100644
--- a/recipes/flex/flex_2.5.31.bb
+++ b/recipes/flex/flex_2.5.31.bb
@@ -1,7 +1,10 @@
 require flex.inc
 PR = "r5"
 
-SRC_URI += "file://include.patch;patch=1"
+SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
+           file://flex-lvalue.diff;patch=1 \
+           file://fix-gen.patch;patch=1 \
+           file://include.patch;patch=1"
 
 do_stage() {
 	oe_libinstall -a libfl ${STAGING_LIBDIR}
-- 
1.6.5



