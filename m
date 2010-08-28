Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpRxo-0001rA-Kl
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 22:25:22 +0200
Received: by pvg6 with SMTP id 6so1648315pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 13:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=HH6XJRw3mw2jwKMd57SCuPLys4pfNWJSIHpFtNhDqRw=;
	b=vzB7tjd+qRdpup5Y0zMiWtWDEbGGL9kliqbTH8MmYAEN/+iZRsSG5WeCEQ3cf6TJpd
	xiC5w59TR7F6N+FN32BOYBkAftdFPi4WojOArq2cnmWqP6qmwQpg+4Ntyd427T74OAeQ
	3GR41A0itjikOBczFDGOV0XLXNysDObPKCtHQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=c3pFjA4pY6BRosZGKE/tByQ+1twfNe/ATXZ5FyWxfuPZKg+afb6JLmuiLkG+TrDvFW
	4U60ClzZbxAg6MZReBfztdras66NN2035jMdyQhu3rl2fFQLIkNzm9002zdUNih1g8+O
	YLU+0XWaK+wPovaCEF+eeLKcPAmdpvCy21Sok=
Received: by 10.143.17.21 with SMTP id u21mr2659404wfi.302.1283027089261;
	Sat, 28 Aug 2010 13:24:49 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm6649371wfl.13.2010.08.28.13.24.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 28 Aug 2010 13:24:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Aug 2010 13:24:15 -0700
Message-Id: <1283027073-12308-6-git-send-email-raj.khem@gmail.com>
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
Subject: [PATCH 05/23] meta-toolchain-arago-dvsdk.bb: Exclude from world build.
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
X-List-Received-Date: Sat, 28 Aug 2010 20:25:27 -0000
X-List-Received-Date: Sat, 28 Aug 2010 20:25:27 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/meta/meta-toolchain-arago-dvsdk.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/meta/meta-toolchain-arago-dvsdk.bb b/recipes/meta/meta-toolchain-arago-dvsdk.bb
index 8e5b233..6deb2bc 100644
--- a/recipes/meta/meta-toolchain-arago-dvsdk.bb
+++ b/recipes/meta/meta-toolchain-arago-dvsdk.bb
@@ -1,3 +1,4 @@
+EXCLUDE_FROM_WORLD = "1"
 TOOLCHAIN_HOST_TASK = "task-arago-toolchain-dvsdk-host"
 TOOLCHAIN_TARGET_TASK = "task-arago-toolchain-dvsdk-target"
 
-- 
1.7.1



