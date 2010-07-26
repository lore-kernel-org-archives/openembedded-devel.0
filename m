Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1OdTxc-0007zS-3P
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 22:07:40 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 4FF52110009D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 22:07:25 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 24C8F1100097
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 22:07:24 +0200 (CEST)
Received: from rhein.familie-heinold.de (g225073069.adsl.alicedsl.de
	[92.225.73.69]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 22:07:24 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id B6B023C0EF; Mon, 26 Jul 2010 22:07:11 +0200 (CEST)
Date: Mon, 26 Jul 2010 22:07:11 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100726200711.GA14360@rhein.zuhause.netz>
References: <AANLkTimz9CwgpLeXVJfSpML7Piqh3M53jsx-ALgTJ+ac@mail.gmail.com>
	<20100726175620.GA30949@rhein.zuhause.netz>
	<AANLkTi=G+LN=nGOpPY-+KEMzRkJZonY-CTDx=jHpxE=g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=G+LN=nGOpPY-+KEMzRkJZonY-CTDx=jHpxE=g@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Recipes for cmake 2.8.2
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
X-List-Received-Date: Mon, 26 Jul 2010 20:07:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 26, 2010 at 03:13:52PM -0300, Eduardo Lima (Etrunko) wrote:
> On Mon, Jul 26, 2010 at 2:56 PM, Henning Heinold
> <heinold@inf.fu-berlin.de> wrote:
> > Hi,
> >
> > no chance to use BBCLASSEXTENDED = "native" ?
> >
> 
> Well, I'm quite new to the OE world, not very sure of what is the best
> way to do things yet. How would it be implemented?
> 
> Best regards, Etrunko
> 
> -- 
> Eduardo de Barros Lima
> eblima@gmail.com

Look at other recipes which has it already. The clue is that you dont need 
an extra recipe for the native part. But you have to override some stuff with _virtclass-native
maybee.

Bye Henning


