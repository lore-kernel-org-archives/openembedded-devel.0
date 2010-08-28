Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpRy4-0001r3-Az
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 22:25:44 +0200
Received: by mail-pz0-f47.google.com with SMTP id 2so1637529pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 13:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=wcJ9PYmh6Gcd+ILhSFpmZ2LLexAWd2df+OWR/dIMtxg=;
	b=vBQ6U2sVDqYEIaiaB3epttXipsdScq1CDjO1Dtg9tOwHuNfuoTumVidxBK4PvEL9cz
	Qu5dOR1JnPi3aQhat7TF7bCofwzno1WVamxEaE9VjYbM0GDPedVQx7N411j8O58xqoYe
	cocG6crX+VZtKyzSWz/F/pV5Ai3tQwfvAXBnY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=O5tBqzcDVsENzk+CFcqPoZ18IdZ1iithInLR7g6BZVV7hH3Xs7JSE5CNoo0iQgxQ2c
	KT70VF/JgGT44v1NM25nxMRK5EmSibTivw6qsGNOlSjXEDye3Vce1Au5cVN0SHLb9EVd
	M4UTXOJua6cxeIeNfUYPCAoreRmyyDEQs0SpQ=
Received: by 10.142.207.5 with SMTP id e5mr2684163wfg.229.1283027107835;
	Sat, 28 Aug 2010 13:25:07 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm6649371wfl.13.2010.08.28.13.25.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 28 Aug 2010 13:25:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Aug 2010 13:24:32 -0700
Message-Id: <1283027073-12308-23-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 22/23] task-openprotium.bb: Define missing DISTRO_SSH_DAEMON, DISTRO_DEV_MANAGER, DISTRO_INIT_MANAGER, DISTRO_LOGIN_MANAGER
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
X-List-Received-Date: Sat, 28 Aug 2010 20:25:46 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/tasks/task-openprotium.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes/tasks/task-openprotium.bb b/recipes/tasks/task-openprotium.bb
index 2cfe30d..1cfc740 100644
--- a/recipes/tasks/task-openprotium.bb
+++ b/recipes/tasks/task-openprotium.bb
@@ -4,7 +4,10 @@ ALLOW_EMPTY = "1"
 PR = "r3"
 
 inherit task
-
+DISTRO_SSH_DAEMON ?= "dropbear"
+DISTRO_DEV_MANAGER ?= ""
+DISTRO_INIT_MANAGER ?= ""
+DISTRO_LOGIN_MANAGER ?= ""
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 # be sure to build the kernel:
 DEPENDS = "virtual/kernel"
-- 
1.7.1



