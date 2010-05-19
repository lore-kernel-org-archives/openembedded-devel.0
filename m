Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OEYg7-0003qd-Te
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 May 2010 04:06:40 +0200
Received: by pxi14 with SMTP id 14so3072523pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 May 2010 19:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=mLgknFCIwzLnJnSzAk7wo0r3Betm+F+llF8Q+eg4WyY=;
	b=GR2o1PffhiCCpjrjfhaqacb+1RY5oS9P2ghsI46pPEmuecqDbaDXM1heqHmen/pk2C
	4f7EuitgaeYFD2p0Cl8zmaeDEz7GFCEsWtcFv2/maiywx4dxrV1ALBYRnbdTQHDGxHeV
	9xAm+ddup1d5e7acRjyUTx+Ccj3UvrqIusQKA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=f2UYThbhrBBlrjt9lqTEtLUZRJ/QJbKHtCH3lsIaLcd7t5eGPCPcbAmDbBR9STNo4v
	/nHw8IBDfaUKlcXXIoclMZodZxOMSH0tBB1SrxDWNYtljCpYSqTCqFBtGoBADPSVWrgZ
	m1h2Hn0IEWx8SqVmmFKqo+SUFYHeEP5vrmZP8=
Received: by 10.141.22.19 with SMTP id z19mr5728969rvi.250.1274234554296;
	Tue, 18 May 2010 19:02:34 -0700 (PDT)
Received: from localhost (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id k17sm5700393rvh.5.2010.05.18.19.02.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 18 May 2010 19:02:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 May 2010 19:02:18 -0700
Message-Id: <1274234538-26516-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFA][PATCH] automake_1.11.1.bb: Remove DEFAULT_PREFERENCE = "-1"
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
X-List-Received-Date: Wed, 19 May 2010 02:06:40 -0000

Hi,

I was working on upgrading gettext and some other packages to latest
versions but they use features from automake 1.11. We have this recipe
but it not enabled. I ask for approval to make it default. I have
build few images thus far without any problems and SHR already uses
it as preferred automake. Some distributions ask for specific versions
they wont be affected. 

Thanks

-Khem

* This would enable it by default for distributions
  who do not stick to a particular version of automake.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/automake/automake_1.11.1.bb |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/recipes/automake/automake_1.11.1.bb b/recipes/automake/automake_1.11.1.bb
index 4b46787..74477e7 100644
--- a/recipes/automake/automake_1.11.1.bb
+++ b/recipes/automake/automake_1.11.1.bb
@@ -1,7 +1,5 @@
 require automake.inc
 PR = "${INC_PR}.0"
 
-DEFAULT_PREFERENCE = "-1"
-
 SRC_URI[automake.md5sum] = "c2972c4d9b3e29c03d5f2af86249876f"
 SRC_URI[automake.sha256sum] = "5b159d3c0e0a1f87de71b68bcb9f1a1c49e9e71749c9b723f17e2e1e0295c7ae"
-- 
1.7.0.4



