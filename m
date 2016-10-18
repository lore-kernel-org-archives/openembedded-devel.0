Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.1])
	by mail.openembedded.org (Postfix) with ESMTP id EF08760939
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 08:54:23 +0000 (UTC)
Received: from localhost.localdomain (111-250-195-39.dynamic.hinet.net
	[111.250.195.39])
	by msfrf2610.sfr.fr (SMTP Server) with ESMTP id 681441C0008BB;
	Tue, 18 Oct 2016 10:54:24 +0200 (CEST)
Received: from localhost.localdomain (111-250-195-39.dynamic.hinet.net
	[111.250.195.39])	(using TLSv1.2
	with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2610.sfr.fr (SMTP Server) with ESMTPSA;
	Tue, 18 Oct 2016 10:54:22 +0200 (CEST)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2016 16:54:06 +0800
Message-Id: <1476780847-106246-1-git-send-email-herve.jourdain@neuf.fr>
X-Mailer: git-send-email 2.7.4
X-sfr-mailing: LEGIT
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 0/1] dvb-apps: fix recipe, and update to the latest version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Oct 2016 08:54:25 -0000

Fixed error "GNU_HASH not present"
Fixed dvb-scan-data package
Fixed the VERSION_FILE (used to check the dvb api version) to the one used for the target
(by default, it uses the one on the host)
Updated to the "latest" version (2014/03/22)
The latest version suppressed the original scan tables (not maintained anymore), so fetch and install the latest ones (using dvb api v3 format)(introduces a dependency on v4l-utils-native)

Herve Jourdain (1):
  Fix recipe, and update to the latest version

 .../recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb         | 26 ++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

-- 
2.7.4


