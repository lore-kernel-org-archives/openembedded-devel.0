Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <woglinde@rhein.zuhause.netz>) id 1OcFHR-0001O0-Q2
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 12:15:02 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 8082211000A1;
	Fri, 23 Jul 2010 12:07:33 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 48AE2110009C;
	Fri, 23 Jul 2010 12:07:32 +0200 (CEST)
Received: from rhein.familie-heinold.de (g225145064.adsl.alicedsl.de
	[92.225.145.64]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Fri, 23 Jul 2010 12:07:32 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 198873C0F0; Fri, 23 Jul 2010 12:07:21 +0200 (CEST)
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Jul 2010 12:06:50 +0200
Message-Id: <1279879611-28171-1-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.1
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: woglinde@rhein.zuhause.netz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libpng security updates
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
X-List-Received-Date: Fri, 23 Jul 2010 10:15:02 -0000

Hi,

this fixes libpng security bugs, removes insecure versions and converts the recipe to BBCLASSEXTENDED.

Henning Heinold (1):
  libpng: update to version 1.2.44 because of CVE-2010-1205 and convert
    to BBCLASSEXTENDED

 recipes/libpng/libpng-native.inc       |    5 -----
 recipes/libpng/libpng-native_1.2.37.bb |    6 ------
 recipes/libpng/libpng-native_1.2.40.bb |    9 ---------
 recipes/libpng/libpng-native_1.2.41.bb |    6 ------
 recipes/libpng/libpng-native_1.2.42.bb |    6 ------
 recipes/libpng/libpng.inc              |    6 +++++-
 recipes/libpng/libpng_1.2.37.bb        |    8 --------
 recipes/libpng/libpng_1.2.40.bb        |    8 --------
 recipes/libpng/libpng_1.2.41.bb        |    8 --------
 recipes/libpng/libpng_1.2.42.bb        |    8 --------
 recipes/libpng/libpng_1.2.44.bb        |    8 ++++++++
 11 files changed, 13 insertions(+), 65 deletions(-)
 delete mode 100644 recipes/libpng/libpng-native.inc
 delete mode 100644 recipes/libpng/libpng-native_1.2.37.bb
 delete mode 100644 recipes/libpng/libpng-native_1.2.40.bb
 delete mode 100644 recipes/libpng/libpng-native_1.2.41.bb
 delete mode 100644 recipes/libpng/libpng-native_1.2.42.bb
 delete mode 100644 recipes/libpng/libpng_1.2.37.bb
 delete mode 100644 recipes/libpng/libpng_1.2.40.bb
 delete mode 100644 recipes/libpng/libpng_1.2.41.bb
 delete mode 100644 recipes/libpng/libpng_1.2.42.bb
 create mode 100644 recipes/libpng/libpng_1.2.44.bb


