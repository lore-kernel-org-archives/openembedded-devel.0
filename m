Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NjDlO-0001z6-4X
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Feb 2010 16:30:33 +0100
Received: by fxm8 with SMTP id 8so1609764fxm.28
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Feb 2010 07:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=cZ6qtL9LwEcaiRviu1MLYDMKNUXgBdJkFVYOLWcAYyQ=;
	b=aoLegllZuhqBTFuK7GdCjyXzaRinb+vp5u+YAC5/nHbLYGVm5sKx2AtJjntZa1X7dQ
	jpn6zh+DvZyrqaUVGyGX74jfFsxb2Aft91LJSIUvpzB6dG//FHJXNbHy5D6BP0vv0Yxs
	HGkxh22cQhD0Tk60cCQ9Y0qaRLSUQrR98RJiM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=H0F3aMZjZcqbFY4m8eMwYqVrkqGWCxYyLJzSyZTkbOBDsgCS61rDgBSFDCeu2anqyU
	NRVDh2REXcgnP1XkfRQtcZL1Oy2+pR32DhDRTV96+OPhEPck4n+U7RjaOdfcLc1BRoAm
	yBWy4nJzh765N5I4EQJQhj6gemdiTSRWAqS/U=
Received: by 10.223.63.208 with SMTP id c16mr11995804fai.29.1266766067262;
	Sun, 21 Feb 2010 07:27:47 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 18sm3207019fks.5.2010.02.21.07.27.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 21 Feb 2010 07:27:46 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NjDnN-0007W5-Kt; Sun, 21 Feb 2010 16:32:33 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Feb 2010 16:32:32 +0100
Message-Id: <1266766352-28786-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.6.6.1
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] git: add SRC_URI name
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
X-List-Received-Date: Sun, 21 Feb 2010 15:30:33 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/git/git.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/git/git.inc b/recipes/git/git.inc
index 644e159..fd7b708 100644
--- a/recipes/git/git.inc
+++ b/recipes/git/git.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "The git revision control system used by the Linux kernel develope
 SECTION = "console/utils"
 LICENSE = "GPL"
 
-SRC_URI = "http://www.kernel.org/pub/software/scm/git/git-${PV}.tar.bz2"
+SRC_URI = "http://www.kernel.org/pub/software/scm/git/git-${PV}.tar.bz2;name=git"
 
 S = "${WORKDIR}/git-${PV}"
 
-- 
1.6.6



