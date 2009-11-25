Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1NDHHv-0007Vt-4X
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Nov 2009 13:48:06 +0100
Received: from homiemail-a20.g.dreamhost.com (mailbigip.dreamhost.com
	[208.97.132.5])
	by hapkido.dreamhost.com (Postfix) with ESMTP id B1B7A17DC53
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2009 04:46:33 -0800 (PST)
Received: from [129.132.208.142] (vpn-global-dhcp1-142.ethz.ch
	[129.132.208.142])
	by homiemail-a20.g.dreamhost.com (Postfix) with ESMTPA id 1A41D7EC063
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2009 04:46:30 -0800 (PST)
Message-ID: <4B0D2724.3070709@SSpaeth.de>
Date: Wed, 25 Nov 2009 13:46:28 +0100
From: Sebastian Spaeth <Sebastian@SSpaeth.de>
Organization: ETH Zurich
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.7
OpenPGP: id=C827A062
X-SA-Exim-Connect-IP: 66.33.216.122
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: pkgconfig bbclass: also sed out bogus includes
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
X-List-Received-Date: Wed, 25 Nov 2009 12:48:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

> author	Koen Kooi <koen@openembedded.org>
> commit	2c8134baa56ad047f5c37069379c0e560dd6477e
>
> RP says: In theory the recipes themselves should be patched to stop
> this nonesense getting in there in the first place but that is
> appropriate for pkgconfig.bbclass

Nice one. Should we add a warning when we find such a bogus include so
recipes can be fixed up over time?

Sebastian


