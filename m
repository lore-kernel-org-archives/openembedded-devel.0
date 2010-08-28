Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpRy5-0001qz-Ga
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 22:25:46 +0200
Received: by mail-px0-f175.google.com with SMTP id 11so1624265pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 13:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=HMOgUXmMTUUzlrzDijr295TP3htunEKld6IldRHrkbw=;
	b=cjgs7p2+mIHsEDhEqvIH3OQcl1II917xcehjDBUnjRxZpDPVyaLzMPRS0uDwVqwHhw
	GdzbTIam2WZCfROlknGo6wGXdA3Eh4k4ifS9SWwyq/oZCtTuriGTikOeoTO4RsqZqacc
	7w5oNxo58yqKdynIeSgtVnpaCT/dDJyZZx97c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=vZOANqJzx/DahldvUmMBOWqpOUcS6UUeYR7EQMgEHX4Vvk5AcaGvz6PW7Kv+k5t4U9
	jyfJyxkA+SdxASmDanInb6zxZVWwcCFzLYyhxWyfv7ExJ2RTCQ41OiXDCWJmp4K5VrK9
	ZtK/6c5nj9w4L+FnfpM8QR5L+pFEjsLJKq3Ek=
Received: by 10.143.27.18 with SMTP id e18mr2644350wfj.339.1283027099298;
	Sat, 28 Aug 2010 13:24:59 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm6649371wfl.13.2010.08.28.13.24.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 28 Aug 2010 13:24:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Aug 2010 13:24:24 -0700
Message-Id: <1283027073-12308-15-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 14/23] libmsip_svn.bb: Rename libmnetutil0->libmnetutil in DEPENDS
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
 recipes/minisip/libmsip_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/minisip/libmsip_svn.bb b/recipes/minisip/libmsip_svn.bb
index 004eaa7..1b1299a 100644
--- a/recipes/minisip/libmsip_svn.bb
+++ b/recipes/minisip/libmsip_svn.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "C++ implementation Session Initiation Protocol (RFC3261)"
 HOMEPAGE = "http://www.minisip.org"
 SECTION = "libs/network"
 PRIORITY = "optional"
-DEPENDS = "libmnetutil0 libmutil0"
+DEPENDS = "libmnetutil libmutil0"
 PV = "0.2.2+svn${SRCDATE}"
 LICENSE = "LGPL"
 
-- 
1.7.1



