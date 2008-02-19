Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mickey@vanille-media.de>) id 1JRGOg-0003mW-Qg
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Feb 2008 01:31:48 +0100
Received: from andromeda (e180166148.adsl.alicedsl.de [85.180.166.148])
	by drlauer-research.com (Postfix) with ESMTP id 93481584C26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2008 01:36:28 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Feb 2008 01:31:15 +0100
User-Agent: KMail/1.9.7
References: <200802182052.30981.mickey@vanille-media.de>
	<20080218222716.7fb73014@widy.localdomain>
	<1203371664.8578.46.camel@dax.rpnet.com>
In-Reply-To: <1203371664.8578.46.camel@dax.rpnet.com>
MIME-Version: 1.0
Message-Id: <200802190131.16052.mickey@vanille-media.de>
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: DISTRO override logic in angstrom.inc
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
X-List-Received-Date: Tue, 19 Feb 2008 00:31:48 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 18 February 2008 22:54:24 Richard Purdie wrote:
> I'm voting in favour of:
>
> DISTRO_OVERRIDES ?= ${DISTRO}
> OVERRIDES
> ="local:${MACHINE}:${DISTRO_OVERRIDES}:${TARGET_OS}:${TARGET_ARCH}:build-${
>BUILD_OS}:fail-fast:pn-${PN}"
>
> and then angstrom sets:
>
> DISTRO_OVERRIDES = "angstrom"
>
> and openmoko sets:
>
> DISTRO_OVERRIDES = "openmoko:angstrom"
>
> Note there is no longer any use of := and that the main list of
> overrides is only written in one place rather than spread out per distro
> which could cause maintenance problems in the future.

I like that a lot.

+1 from me.

:M:


