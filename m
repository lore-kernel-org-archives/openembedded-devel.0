Received: from mta10.brinkster.com ([65.182.109.79])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1OeUsc-0008VL-Nk
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 17:19:10 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta10.brinkster.com (Postfix) with ESMTP id CDF214EAA50;
	Thu, 29 Jul 2010 11:11:26 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mta10.brinkster.com
Received: from mta10.brinkster.com ([127.0.0.1])
	by localhost (mta10.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sO4pxm4TxR+1; Thu, 29 Jul 2010 11:11:26 -0400 (EDT)
Received: from MareImbrium (cpc1-bath2-0-0-cust327.aztw.cable.virginmedia.com
	[82.46.19.72])
	by mta10.brinkster.com (Postfix) with ESMTPA id 1A6DC4EA9D3;
	Thu, 29 Jul 2010 11:11:25 -0400 (EDT)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
References: <1280406377-23902-1-git-send-email-chase.maupin@ti.com>
	<1280406377-23902-2-git-send-email-chase.maupin@ti.com>
In-Reply-To: <1280406377-23902-2-git-send-email-chase.maupin@ti.com>
Date: Thu, 29 Jul 2010 16:11:10 +0100
Message-ID: <0d6a01cb2f30$47a0b040$d6e210c0$@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQGtKv47OZmh4oXxqwyAaG276G0XDQH2MI1PkvRXbQA=
X-SA-Exim-Connect-IP: 65.182.109.79
X-SA-Exim-Mail-From: John.Willis@Distant-earth.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: 'Chase Maupin' <chase.maupin@ti.com>
Subject: Re: [PATCH 2/2] x-load: add signGP to sourceipk
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
X-List-Received-Date: Thu, 29 Jul 2010 15:19:48 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

> * When creating a source ipk for the x-load program copy the
>   signGP binary as well as this is needed when rebuilding.
> * Bump the PR for x-load-omap3pandora recipe.
> 
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>

Nack, this seems totally pointless, signGP is in the tree (signgp-native) so
is it not better to bring that in?

Out of interest, what is the problem you see with the current setup, the
recipes as they stand will give people signed and unsigned X-Loader binaries
for just about all purposes you could want them on the OMAP3. Or is this
patch aimed at using source IPK's for use in another non-OE SDK?

Shipping binaries in a source IPK seems very wrong regardless of the need,
it's not really source at that point ;-).

Regards,

John




