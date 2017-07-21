Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id BF78378395
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 08:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Message-Id:Date:Subject:Cc:To:From;
	bh=Psht9zAsBZM3BQCnXxvc2kM+5nZjRFeTnLjPXSVGsyM=; 
	b=qdzTXAwiCFZkDcAqeBZae6W2RLUzOK41anlJ1o3qYnPsssE46EXH6ZFdpICPv9ghudjxBQqn8pF9G7M5l62t1DDOTz4bHlf8K8X3lyB8KMdGhpRpvfRQGjRtR4TAdJq1SXBP9rcE7mpEWqUhJXU+ATkFXIb6WdrctNOYTdwAnwYZIeOxNdsc/vd85Omwgljma4pvEtMGuhoZxGCOZYEwSfEX9zECci9hU0f0IAP8AxbmGmBUvsJy3+5LpoNWSOAzGxctMG/uZxoFGTeuClv/mQheNCm6rz04cosfKkUiqc/XEyVz25pmFTrWizaHjDDdxlCSzTwv53bjtdr+4Qlyuw==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dYTAq-0006hS-F8; Fri, 21 Jul 2017 11:20:36 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dYTAq-0007mi-Di; Fri, 21 Jul 2017 11:20:36 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Jul 2017 11:20:31 +0300
Message-Id: <1500625232-28885-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [meta-qt5][PATCH] set CVE_PRODUCT
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
X-List-Received-Date: Fri, 21 Jul 2017 08:20:38 -0000

This way yocto cve-check can find open CVE's for qt5 recipes. See also:

http://lists.openembedded.org/pipermail/openembedded-core/2017-July/139897.html

"Results from cve-check are not very good at the moment.
One of the reasons for this is that component names used in CVE
database differ from yocto recipe names. This series fixes several
of those name mapping problems by setting the CVE_PRODUCT correctly
in the recipes. To check this mapping with after a build, I'm exporting
LICENSE and CVE_PRODUCT variables to buildhistory for recipes and
packages."

Mikko Rapeli (1):
  qt5-git.inc: set CVE_PRODUCT to qt

 recipes-qt/qt5/qt5-git.inc | 2 ++
 1 file changed, 2 insertions(+)

-- 
1.9.1


