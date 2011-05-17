Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eyalreizer@googlemail.com>) id 1QME4x-0003Wo-AI
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 08:48:27 +0200
Received: by gxk3 with SMTP id 3so62007gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 23:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=sY09st19aP3Iu3aqGG2H4luIByDAM5or+NUj+nMnl7M=;
	b=frj68L+49kXzCjVb7bM80PwckqyduTYFLdS+6m1bRNkATJz706cR1iSw6hc5DiI4nG
	iBp+p0+vXvqcMaqF2NMuPtX4T9DiWoaaQWihIyPyRDMlbFNAguF0Hxz/NiIzEPL8Cj8E
	NgVp43zKLn4AXSJ4ozvDzhOuP6JVvWrEMFHsQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=T6ecwpPm/pX3sk6D4tMqPcJ9650aEreoyaB470zru4CP3Ooca2LGA+KbALxcMPDfhd
	DizTTDW4DFS536ZhneCeXoqoiTiCmE/s8txUCQIuDGAwln5eI+SvPQAcRY3usueTwd6+
	kmJeJLWDisXF4A7HTbsuntmy6TO0Nbssc0j+E=
Received: by 10.236.154.1 with SMTP id g1mr236191yhk.112.1305614733127;
	Mon, 16 May 2011 23:45:33 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id h43sm101595yhm.22.2011.05.16.23.45.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2011 23:45:32 -0700 (PDT)
From: Eyal Reizer <eyalreizer@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 May 2011 09:45:22 +0300
Message-Id: <1305614722-5460-1-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <y>
References: <y>
Cc: Eyal Reizer <eyalr@ti.com>
Subject: [PATCH] ti-wifi-utils: update to use the latest release
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
X-List-Received-Date: Tue, 17 May 2011 06:48:27 -0000

* Change to a newer calibrator version supporting latest mac80211 release.
* Bump PR number

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 recipes/ti/ti-wifi-utils_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/ti/ti-wifi-utils_git.bb b/recipes/ti/ti-wifi-utils_git.bb
index 1ee5f2d..8d10051 100644
--- a/recipes/ti/ti-wifi-utils_git.bb
+++ b/recipes/ti/ti-wifi-utils_git.bb
@@ -3,11 +3,11 @@ LICENSE = "TI-BSD"
 
 DEPENDS = "libnl"
 
-PR ="r1"
+PR ="r2"
 PV ="0.0"
 PR_append = "+gitr${SRCPV}"
 
-SRCREV = "7f63af54eb66e5b2515f92c59fcc19a8065ce481"
+SRCREV = "268dbf03091b632c2697eb8028e90fe40513a9d8"
 SRC_URI = "git://github.com/gxk/ti-utils.git;protocol=git"
 
 S = "${WORKDIR}/git"
-- 
1.7.0.4



