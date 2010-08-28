Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpRy2-0001rG-Om
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 22:25:48 +0200
Received: by mail-pv0-f175.google.com with SMTP id 6so1648318pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 13:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=vcdVNaUUXFMHAZLcC2lTGPKaGaIh65DodhfmG7vyyyc=;
	b=FfeWMZOi8EZdA6BS+DLgzUGUQGw3D9KeGPtlM9VAapNO/rJe0IFqLdjXHJT7PEbB+s
	XmrQkaZ17RtUYrF9ZKRMMmguoy7YQz5mA5Cyj6VpTLWP2miDsv0WZ605Si6p48bRXPea
	kyaqQQmwUyVsJd5BXfyTAr1vEKH5LJuaenppg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=TOx9zBZvMPDhRJTHl0iU7j9e35G5iz3REUK95zxSl2GVRRe/oXDCEDaxkNPDJYux5r
	DdaTfNLZ020TPTD5+9yNtx3uJNQLXALtfp33B5003m4DaHutryr0elZVZt0UQujHDrkq
	Ju8XzT1p/crR6jFMKr6vvkeqSAQWK4bNNoZCk=
Received: by 10.142.147.7 with SMTP id u7mr2690844wfd.216.1283027104749;
	Sat, 28 Aug 2010 13:25:04 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm6649371wfl.13.2010.08.28.13.25.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 28 Aug 2010 13:25:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Aug 2010 13:24:29 -0700
Message-Id: <1283027073-12308-20-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 19/23] cnetworkmanager_git.bb: python-uuid is not provided remove it from RDENEDS
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
 recipes/networkmanager/cnetworkmanager_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/networkmanager/cnetworkmanager_git.bb b/recipes/networkmanager/cnetworkmanager_git.bb
index d8ec179..5625502 100644
--- a/recipes/networkmanager/cnetworkmanager_git.bb
+++ b/recipes/networkmanager/cnetworkmanager_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Command line interface for Network Manager"
 HOMEPAGE = "http://vidner.net/martin/software/cnetworkmanager/"
 LICENSE = "GPL"
 SECTION = "console/network"
-RDEPENDS_${PN} = "python-core python-crypt python-dbus python-math python-pygobject python-re python-textutils python-uuid python-xml"
+RDEPENDS_${PN} = "python-core python-crypt python-dbus python-math python-pygobject python-re python-textutils python-xml"
 PR = "r2"
 PV = "0.8+git"
 
-- 
1.7.1



