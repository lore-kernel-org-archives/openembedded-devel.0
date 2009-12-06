Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NHOSN-0001pb-BE
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 22:15:54 +0100
Received: by bwz9 with SMTP id 9so3028873bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 13:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=UjalmPaE9eZ7Ntw00mcCD6ZXPWe3kqTHnfsv71zK2g0=;
	b=o0mLR+fg+qXYwdYdECxKMiYLQ5Wq/+48LdkVv7j4KCmjj3mqvITJx20JI3av89jJS8
	1lRaYiLxL1eQK9zuUBnfiffcKRwKj67HHva9+L3ITKeaAxvDI1P0/D8sWCCL1Ag3DDSk
	dsuq9L2ylGCqMrUq5d4as3WHsBbusdV311t2g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=NMgSuW3g/E/Lpdx6kOc6DeXdbnHvT5Zj2bUMKODz7R/akIFT4p0XWSEBayAvMqD+Yk
	SgAEwEBGnTBEPDirJy86r6Mmdf/Bfs/MYPESIPHasz880wAAzM3SqSSOX7noAlf7bjPB
	qUny/jd6qlgGYBVfwfPAHcPk+X5yDAYVUstag=
Received: by 10.204.29.18 with SMTP id o18mr6204798bkc.39.1260134052459;
	Sun, 06 Dec 2009 13:14:12 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm1747349fxm.13.2009.12.06.13.14.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Dec 2009 13:14:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Dec 2009 22:13:46 +0100
Message-Id: <1260134030-3658-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.5.4
In-Reply-To: <1260134030-3658-2-git-send-email-Martin.Jansa@gmail.com>
References: <20091204090048.GA3233@jama>
	<1260134030-3658-1-git-send-email-Martin.Jansa@gmail.com>
	<1260134030-3658-2-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 2/6] micro.conf: remove preferred providers as the same are defined in compatibility-providers.conf
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
X-List-Received-Date: Sun, 06 Dec 2009 21:15:54 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/micro.conf |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
index 25880df..d9fc595 100644
--- a/conf/distro/micro.conf
+++ b/conf/distro/micro.conf
@@ -72,12 +72,6 @@ OVERRIDES = "local:${MACHINE}:${MACHINE_CLASS}:${DISTRO}:${TARGET_OS}:\
 ${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
 
 #############################################################################
-# PREFERRED PROVIDERS
-#############################################################################
-PREFERRED_PROVIDER_task-bootstrap	= "task-bootstrap"
-PREFERRED_PROVIDER_virtual/libx11	= "libx11"
-PREFERRED_PROVIDER_virtual/gail         ?= "gtk+"
-#############################################################################
 # PREFERRED VERSIONS
 #############################################################################
 require conf/distro/include/sane-srcdates.inc
-- 
1.6.5.4



