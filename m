Return-Path: <herve.jourdain@neuf.fr>
X-Greylist: delayed 377 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 18 Oct 2016 08:17:11 UTC
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.1])
	by mail.openembedded.org (Postfix) with ESMTP id 584C171AEF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 08:17:11 +0000 (UTC)
Received: from localhost.localdomain (111-250-195-39.dynamic.hinet.net
	[111.250.195.39])
	by msfrf2617.sfr.fr (SMTP Server) with ESMTP id 7CAFC1C000806;
	Tue, 18 Oct 2016 10:10:54 +0200 (CEST)
Received: from localhost.localdomain (111-250-195-39.dynamic.hinet.net
	[111.250.195.39])	(using TLSv1.2
	with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2617.sfr.fr (SMTP Server) with ESMTPSA;
	Tue, 18 Oct 2016 10:10:52 +0200 (CEST)
Authentication-Results: sfr.fr; auth=pass (PLAIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2016 16:10:29 +0800
Message-Id: <1476778230-105764-1-git-send-email-herve.jourdain@neuf.fr>
X-Mailer: git-send-email 2.7.4
X-sfr-mailing: LEGIT
MIME-Version: 1.0
Subject: [meta-oe][PATCH 0/1] v4l-utils: add support for "native" build
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
X-List-Received-Date: Tue, 18 Oct 2016 08:17:12 -0000

Herve Jourdain (1):
 Add support for "native" build (dvb-format-convert can be used in
 other packages, for instance)
 PARALLEL_MAKE is disabled for native because of a race condition between
 libv4l2 and v4l2convert when installing (because of relinking needed for both)

 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.7.4


