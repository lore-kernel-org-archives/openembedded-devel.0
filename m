Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mickey@vanille-media.de>) id 1JRC2u-0001T1-IV
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Feb 2008 20:53:02 +0100
Received: from andromeda (e180166148.adsl.alicedsl.de [85.180.166.148])
	by drlauer-research.com (Postfix) with ESMTP id 75852584C24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2008 20:57:42 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Feb 2008 20:52:30 +0100
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Message-Id: <200802182052.30981.mickey@vanille-media.de>
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: DISTRO override logic in angstrom.inc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Feb 2008 19:53:02 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Not having paid close attention to the "A case for user distro" thread, I was 
quite surprised when today the OpenMoko distro override no longer worked.

OpenMoko bases on angstrom and subsequently includes angstrom.inc which 
forcefully sets DISTRO = angstrom. I wonder whether this is a bit too violent 
against sharing files.

I had to 

-OVERRIDES = "local:${MACHINE}:${DISTRO}:angstrom:${TARGET_OS}:
${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
+OVERRIDES = "local:${MACHINE}:openmoko:angstrom:${TARGET_OS}:
${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"

to get the wanted behaviour back.

:M:

-- 
Dr. Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de


