Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1LZ1Yp-0003We-8f
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Feb 2009 12:22:51 +0100
Received: from andromeda.vanille.de (e180132210.adsl.alicedsl.de
	[85.180.132.210])
	by drlauer-research.com (Postfix) with ESMTP id B66365843C9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2009 12:44:20 +0100 (CET)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Feb 2009 12:20:57 +0100
User-Agent: KMail/1.9.10
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF672@hiob.intern.dresearch.de>
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF672@hiob.intern.dresearch.de>
MIME-Version: 1.0
Message-Id: <200902161220.58448.mickey@vanille-media.de>
Subject: Re: How to determine DEPENDS and RDEPENDS
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
X-List-Received-Date: Mon, 16 Feb 2009 11:22:51 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Am Monday 16 February 2009 11:53:16 schrieb Sledz, Steffen:
> Is there tool support in OE to determine valuas for DEPENDS and/or RDEPENDS
> in a safe way? This would be really helpful when setting up the bb for a
> new package.

No, however usually DEPENDS can be figured out by looking at configure.ac. 
RDEPENDS are more special, for dynamic linking, OE will figure out on its, 
own, so you only have to provide these for dlopened libraries, config files, 
artwork, or otherwise plugins, etc.

-- 
:M:


