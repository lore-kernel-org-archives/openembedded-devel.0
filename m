Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q0aHG-0005UV-BM
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 15:03:42 +0100
Received: by fxm19 with SMTP id 19so3647417fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 07:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=ns9kQZDd5qFSo8wt5/i37y3EFTVw3F28CF0K63sX3is=;
	b=dz5JkbQX7k+KMcZw8UhnvP+6gPqOSBZ41FkiUCADOIGi1YF31s47tVafvXQwE4Ep3f
	D/iaufYKLBJlO3iCwirNG1gn6tKD6/gUC5DiL6iyGQhqlqK9O8IQfwsK3NFRDI0lwXVG
	wmitblCN6d8bAMp/ETp1bKLhIgJGC2UKg5eQc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=B5WFK8bDGlogr4UnX0I9Uh2OJBnHXEcMA7tOFy7idlBmYKSA0R7mYAkBrin/v2kKPe
	fn+1cYHnzDfg6L9zol3cnLeyO7MsW/Q7tOSvtoheY2KoNPOGbf+1CzrO+BdbUaiSjQ17
	83yNry8EBmBw01gBNOOuYFTowoR4zq5qxl898=
Received: by 10.223.127.210 with SMTP id h18mr1296964fas.73.1300456917096;
	Fri, 18 Mar 2011 07:01:57 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id e17sm485002fak.24.2011.03.18.07.01.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Mar 2011 07:01:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Mar 2011 15:00:24 +0100
Message-Id: <1300456829-25755-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1300456829-25755-1-git-send-email-Martin.Jansa@gmail.com>
References: <1300456829-25755-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 07/12] libfsobasics: depend only on libnl(-2.0) not libnl2(-2.0)
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
X-List-Received-Date: Fri, 18 Mar 2011 14:03:42 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/freesmartphone/libfsobasics_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/freesmartphone/libfsobasics_git.bb b/recipes/freesmartphone/libfsobasics_git.bb
index c99bd8e..1d751ca 100644
--- a/recipes/freesmartphone/libfsobasics_git.bb
+++ b/recipes/freesmartphone/libfsobasics_git.bb
@@ -1,8 +1,8 @@
 require cornucopia.inc
 
 DESCRIPTION = "freesmartphone.org support library"
-DEPENDS += "libnl2"
+DEPENDS += "libnl"
 SRCREV = "${FSO_CORNUCOPIA_SRCREV}"
 PV = "0.9.10+gitr${SRCPV}"
 PE = "1"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
-- 
1.7.4.1



