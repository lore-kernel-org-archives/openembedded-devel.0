Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id A159665D68
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Apr 2014 14:42:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,919,1389740400"; d="scan'208";a="50221285"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 24 Apr 2014 16:42:57 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Thu, 24 Apr 2014 16:42:57 +0200
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Thu, 24 Apr 2014 16:42:57 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 24 Apr 2014 16:42:58 +0200
Message-ID: <1398350578-633-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
MIME-Version: 1.0
Subject: [meta-oe][PATCH] cloud9: fix compilation error with o3 module
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Apr 2014 14:43:00 -0000
Content-Type: text/plain

Take a more recent revision.
See related issue:
https://github.com/ajaxorg/o3/commit/0bfd58559fee135d96788ba35115d5de68703609

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
index 757c954..b5dbaa8 100644
--- a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
+++ b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
@@ -40,7 +40,7 @@ SRC_URI = "git://github.com/ajaxorg/cloud9.git;name=cloud9ide \
 "
 
 SRCREV_cloud9ide = "c4e2574896a22bb749f0500b25f41c888d346bed"
-SRCREV_o3 = "302cd3a6d5039f53a9fa3932bed88b53281c1e1e"
+SRCREV_o3 = "d66d4e3252e505f44ada6804c8cab39915ce8afd"
 SRCREV_ace = "0fc5392cbe46fb134052c3065a238ad8e3b31cfd"
 SRCREV_acewiki = "d2a65d0addc2e5ab922bbff9cb6022a4652b4f13"
 SRCREV_apf = "2560b762b2b0e5a8b46f8a4062f927a9a9d239f4"
-- 
1.8.5.4


