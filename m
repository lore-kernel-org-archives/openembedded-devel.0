Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1KM0oL-000279-IQ
	for openembedded-devel@openembedded.org; Thu, 24 Jul 2008 15:24:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m6ODNYtb028579
	for <openembedded-devel@openembedded.org>;
	Thu, 24 Jul 2008 14:23:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28352-06 for <openembedded-devel@openembedded.org>;
	Thu, 24 Jul 2008 14:23:29 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m6ODNRVv028570
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Thu, 24 Jul 2008 14:23:27 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <48887DC7.3030603@xs4all.nl>
References: <200807240048.20980.bluelightning@bluelightning.org>
	<g69aeh$5cu$1@ger.gmane.org>
	<1404.78.86.188.127.1216886903.squirrel@webmail12.pair.com>
	<1216890490.6103.1.camel@dax.rpnet.com>  <48887DC7.3030603@xs4all.nl>
Date: Thu, 24 Jul 2008 14:23:27 +0100
Message-Id: <1216905807.6103.32.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: PATCH: make h2200-bootloader load & depend on mtdblock
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Thu, 24 Jul 2008 13:24:50 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Thu, 2008-07-24 at 15:04 +0200, Udo van den Heuvel wrote:
> Richard Purdie wrote:
> > Yes, its standard practise to RRECOMMEND kernel modules since if they're
> > built into the kernel you get build failures otherwise. The RRECOMMEND
> > is a standard approach and well tested.
> 
> Apart from this discussion, sorry to interrupt, but does mtdchar
> 9related to mtdblock I guess) actually work?
> On my H2200('s) it fails to properly flash a kernel.
> It doesn't matter much now because we boot from SD, but nevertheless it
> is strange.
> The mtd folks refuse to help me when I repeatedly queried them.

Yes, mtdchar usually works. It may not do exactly what you expect though
as its a bit different from a normal character device.

Cheers,

Richard





