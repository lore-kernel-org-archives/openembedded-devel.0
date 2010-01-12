Received: from proxy2.bredband.net ([195.54.101.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1NUprk-0008Br-3H
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 00:09:39 +0100
Received: from ipb1.telenor.se (195.54.127.164) by proxy2.bredband.net
	(7.3.140.3)
	id 4AD3E1BC0254CD29 for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 23:47:05 +0100
X-SMTPAUTH-B2: 
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Al4VADqKTEtT4zqIPGdsb2JhbAAIiCqTKAEBAQE3ul+EMAQ
X-IronPort-AV: E=Sophos;i="4.49,264,1262559600"; d="scan'208";a="26151560"
Received: from c-883ae353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.224]) ([83.227.58.136])
	by ipb1.telenor.se with ESMTP; 12 Jan 2010 23:47:05 +0100
Message-ID: <4B4CFBE9.5020101@atmel.com>
Date: Tue, 12 Jan 2010 23:47:05 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 195.54.101.72
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH} AT91SAM9G45 BSP [3/4] u-boot-2009-08
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
X-List-Received-Date: Tue, 12 Jan 2010 23:09:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

From: Ulf Samuelsson <ulf.samuelsson@atmel.com>

Add U-boot recipe for AT91SAM9G45EK

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---

diff --git a/recipes/u-boot/u-boot_2009.08.bb
b/recipes/u-boot/u-boot_2009.08.bb
index b7f7851..6401b7a 100644
--- a/recipes/u-boot/u-boot_2009.08.bb
+++ b/recipes/u-boot/u-boot_2009.08.bb
@@ -1,8 +1,9 @@
-PR = "r1"
+PR = "r2"
 require u-boot.inc

 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_at91sam9g20ek = "1"
+DEFAULT_PREFERENCE_at91sam9g45ek = "1"
 DEFAULT_PREFERENCE_igep0020 = "1"

 SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 "

-- 
Best Regards
Ulf Samuelsson



