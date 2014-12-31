Return-Path: <Alex.Gonzalez@digi.com>
X-Greylist: delayed 418 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 31 Dec 2014 15:31:59 UTC
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.194])
	by mail.openembedded.org (Postfix) with ESMTP id 46F81610F5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Dec 2014 15:31:58 +0000 (UTC)
Received: from [216.82.241.132] by server-2.bemta-8.messagelabs.com id
	90/33-02991-D4514A45; Wed, 31 Dec 2014 15:25:01 +0000
X-Env-Sender: Alex.Gonzalez@digi.com
X-Msg-Ref: server-13.tower-45.messagelabs.com!1420039500!42240129!1
X-Originating-IP: [66.77.174.13]
X-StarScan-Received: 
X-StarScan-Version: 6.12.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32060 invoked from network); 31 Dec 2014 15:25:01 -0000
Received: from mail.mx1.digi.com (HELO mcl-sms-ns1.digi.com) (66.77.174.13)
	by server-13.tower-45.messagelabs.com with RC4-SHA encrypted SMTP;
	31 Dec 2014 15:25:01 -0000
Received: from MTK-SMS-XCH03.digi.com (10.10.8.197) by mail.mx1.digi.com
	(172.16.1.13) with Microsoft SMTP Server (TLS) id 8.3.389.2;
	Wed, 31 Dec 2014 09:24:49 -0600
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MTK-SMS-XCH03.digi.com
	(10.10.8.197) with Microsoft SMTP Server (TLS) id 14.3.210.2;
	Wed, 31 Dec 2014 09:25:00 -0600
Received: from log-linux-hp-agonzal.digi.com (10.101.2.169) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.210.2; Wed, 31 Dec 2014 16:24:57 +0100
From: Alex Gonzalez <alex.gonzalez@digi.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 31 Dec 2014 16:24:44 +0100
Message-ID: <1420039486-18734-1-git-send-email-alex.gonzalez@digi.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.101.2.169]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Subject: [meta-java][PATCH 0/2] Remove currency generation data expiration date
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
X-List-Received-Date: Wed, 31 Dec 2014 15:32:09 -0000
Content-Type: text/plain

The currency generation class makes a 10 year time expiration check which is
now expired. Hence, packages that use it to build are failing.

This commit removes the date expiration check as for embedded system we don't
want a system to have an expiration date for building.

Alex Gonzalez (2):
  icedtea: openjdk: Remove currency data generation expiration date.
  openjdk: Remove currency data generation expiration date.

 ...njdk-remove-currency-data-generation-expi.patch | 25 ++++++++++++++++++++++
 recipes-core/icedtea/icedtea6-native_1.8.11.bb     |  1 +
 ...njdk-remove-currency-data-generation-expi.patch | 25 ++++++++++++++++++++++
 recipes-core/openjdk/openjdk-7-release-25b30.inc   |  2 ++
 4 files changed, 53 insertions(+)
 create mode 100644 recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-openjdk-remove-currency-data-generation-expi.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-openjdk-remove-currency-data-generation-expi.patch


