Return-Path: <sven.ebenfeld@vaillant.de>
X-Greylist: delayed 563 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 07 Aug 2014 14:50:01 UTC
Received: from mailgw02.hp-net.de (mailgw02.hp-net.de [213.15.0.26])
	by mail.openembedded.org (Postfix) with ESMTP id C6EAF6FE5C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Aug 2014 14:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailgw02.hp-net.de (Postfix) with ESMTP id D9412178C95
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Aug 2014 16:40:37 +0200 (CEST)
X-Virus-Scanned: Virusscanner at mailgw02
Received: from VADERU07.vaillant.vhgroup.lan (vaderu07.vaillant.vhgroup.lan
	[10.107.77.148])
	by mailgw02.hp-net.de (Postfix) with ESMTPS id C5645178C02
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Aug 2014 16:40:37 +0200 (CEST)
Received: from VADERU05.vaillant.vhgroup.lan ([fe80::4ca3:211f:12fe:63e3]) by
	VADERU07.vaillant.vhgroup.lan ([::1]) with mapi id 14.03.0169.001;
	Thu, 7 Aug 2014 16:39:36 +0200
From: "Ebenfeld, Sven" <sven.ebenfeld@vaillant.de>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: change systemd startup within image recipe
Thread-Index: Ac+yTWjOaJiolSvbSY+LpIPHxMcD5w==
Date: Thu, 7 Aug 2014 14:39:36 +0000
Message-ID: <D56C992E15F8814CADE76D2D1AABFF600EE0C5EB@vaderu05.vaillant.vhgroup.lan>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.107.185.223]
x-olx-disclaimer: Done
MIME-Version: 1.0
Subject: change systemd startup within image recipe
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
X-List-Received-Date: Thu, 07 Aug 2014 14:50:05 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm writing my own image-recipe that contains systemd as init manager. But =
all recipes are installing and enabling their systemd startupscripts when i=
nstalling them.
Is there a good way to disable them during image creation? Or do I have to =
manually remove them afterwards?

For instance my main problem at this time is, that I've installed (IMAGE_IN=
STALL) the hostapd package. But this one fails during boot because the wifi=
-device is not available yet.
I need this package but only want to start it manually, how can I remove th=
e systemd-startupscript during image creation?

Best Regards,
Sven

