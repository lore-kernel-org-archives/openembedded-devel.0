Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpRy1-0001qr-RR
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 22:25:47 +0200
Received: by mail-pw0-f47.google.com with SMTP id 8so1730131pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 13:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=OzqIeSgsgWJx0ISfN4+EJMfxqIaOV7b5I7uwqelPzBo=;
	b=hxxpi1rygf+WugNrXcNLAUiaRVp2ihd+l3oYSE6Jb1mYajIo2qvfVguu3eNIOoUKOi
	PS/iKpbaTkWJzxGZJejC4Bx8cdEacv2S9xQdz7AB5FHJkwfzokbILGbwrbfs5928AZ0Q
	zvC6QkgeL0fol6ZB/nJ2l1IyMTd2lr//ChLmY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=GvtZtE2ufPZ8rSJGuVzDZsbQVLsWY5LSsAtmakPjOo61/miQsM24r2igpWSvsdOmR+
	FeJGpw3PQlwMaXh7hq7Q+wGX0tlGSne3mbpN/6Nf2GOduOytJVPxXeAquC8oUZjA7LYe
	PweV5cR4upcFNdvpqpFruXCp72hmx6omoWU3w=
Received: by 10.142.147.7 with SMTP id u7mr2689857wfd.217.1283027105752;
	Sat, 28 Aug 2010 13:25:05 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm6649371wfl.13.2010.08.28.13.25.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 28 Aug 2010 13:25:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Aug 2010 13:24:30 -0700
Message-Id: <1283027073-12308-21-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 20/23] openmoko-session_svn.bb: Replace openmoko-today with openmoko-today2
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
X-List-Received-Date: Sat, 28 Aug 2010 20:25:51 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/openmoko-base/openmoko-session_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/openmoko-base/openmoko-session_svn.bb b/recipes/openmoko-base/openmoko-session_svn.bb
index 19f1ce4..05625a1 100644
--- a/recipes/openmoko-base/openmoko-session_svn.bb
+++ b/recipes/openmoko-base/openmoko-session_svn.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Matchbox session files for Openmoko"
 SECTION = "openmoko/base"
-RDEPENDS_${PN} = "matchbox-panel-2 matchbox-wm openmoko-today gconf"
+RDEPENDS_${PN} = "matchbox-panel-2 matchbox-wm openmoko-today2 gconf"
 PV = "0.1+svnr${SRCPV}"
 PR = "r1"
 
-- 
1.7.1



