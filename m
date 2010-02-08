Received: from mail-fx0-f227.google.com ([209.85.220.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Neax8-0004Y0-3h
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 22:15:33 +0100
Received: by fxm27 with SMTP id 27so1137681fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Feb 2010 13:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=g7AZYz5ibbbpkG1p7pOzVo1P7WNV6hyOnbZvRV1pS+c=;
	b=wK/b+J4WvONGnFtAFmXuYu7rIZzMnuQAHBKOLrTsA03dJcrNY6NbGGXLp0xwY9ZL3W
	vPc0ZuCkmwy1m1BMsWCQyvZ4FYkr80HCnHzHWOIauWbl5hP70aRWIWSCMHI/Wx/f3UHE
	9+tDcLbPuu8x7tlEICr/95J89WHHOiUkGQPrM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=lyNlbuTGT8/aLIFHQY5GNJ3ls8uxFL61jbH4+xTS9kuPDcaXeWtphkJg2sgc26rFBh
	aVpI19M+upfdaZ8RRJaT0saCFWoOjwXauWdKRSDyohcaCngVtR/s2DxlFYb7EcgeZQww
	Vc3gW6tF1aK/EIlrAHY2UhsYZ8JUDUGqPDJNY=
Received: by 10.223.76.141 with SMTP id c13mr5681757fak.31.1265663578162;
	Mon, 08 Feb 2010 13:12:58 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 2sm234774fks.13.2010.02.08.13.12.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 08 Feb 2010 13:12:56 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NeawH-0004Gb-JQ; Mon, 08 Feb 2010 22:14:37 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Feb 2010 22:14:33 +0100
Message-Id: <1265663673-16312-13-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1265663673-16312-12-git-send-email-rep.dot.nop@gmail.com>
References: <1265663673-16312-1-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-2-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-3-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-4-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-5-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-6-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-7-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-8-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-9-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-10-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-11-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-12-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.220.227
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 12/12] task-base.bb: use uniform test for set
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
X-List-Received-Date: Mon, 08 Feb 2010 21:15:33 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/tasks/task-base.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/tasks/task-base.bb b/recipes/tasks/task-base.bb
index d59acba..fc04b46 100644
--- a/recipes/tasks/task-base.bb
+++ b/recipes/tasks/task-base.bb
@@ -136,7 +136,9 @@ python __anonymous () {
 
     import bb
 
-    if not hasattr(__builtins__, 'set'):
+    try:
+	set
+    except NameError:
 	from sets import Set as set
 
     distro_features = set(bb.data.getVar("DISTRO_FEATURES", d, 1).split())
-- 
1.6.5



