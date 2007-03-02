Received: from [81.169.178.128] (helo=h6563.serverkompetenz.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <oe@hentges.net>) id 1HMvkJ-0006oS-Aa
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Mar 2007 01:35:39 +0100
Received: from localhost (localhost [127.0.0.1])
	by h6563.serverkompetenz.net (Postfix) with ESMTP id 2910B30820A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2007 01:35:19 +0100 (CET)
Received: from h6563.serverkompetenz.net ([127.0.0.1])
	by localhost (h6563 [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 27817-01 for <openembedded-devel@lists.openembedded.org>;
	Fri, 2 Mar 2007 01:35:16 +0100 (CET)
Received: from mhcln04.hentges.priv (xdsl-81-173-227-4.netcologne.de
	[81.173.227.4]) (using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by h6563.serverkompetenz.net (Postfix) with ESMTP id E02743081E6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2007 01:34:55 +0100 (CET)
From: Matthias Hentges <oe@hentges.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <45E6FDF8.2040103@dominion.kabel.utwente.nl>
References: <E1HMgkl-0004SM-Gs@linuxtogo.org>
	<1439152940.20070301165525@vanille-media.de>
	<45E6FDF8.2040103@dominion.kabel.utwente.nl>
Date: Fri, 02 Mar 2007 01:33:35 +0100
Message-Id: <1172795615.11398.32.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at hentges.net
Subject: Re: [oe-commits] org.oe.dev rootfs_ipk: as per OE	policy:	remove feed management tools
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
X-List-Received-Date: Fri, 02 Mar 2007 00:35:39 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Donnerstag, den 01.03.2007, 17:23 +0100 schrieb Koen Kooi:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Michael 'Mickey' Lauer schreef:
> > koen commit wrote:
> >> rootfs_ipk: as per OE policy: remove feed management tools
> > 
> > Guys, please don't play games. Since it is a handy feature indeed,
> > can we perhaps agree on making this a seperate bbclass to keep both of
> > you satisfied?
> 
> All feed management was removed a long time ago from OE because

Bullshit. Explain meta/package-index.bb (I know you can't as you ignored
my previous email due to lack of arguments)

> a) it's out of scope

So you alone define the "scope" of OpenEmbedded and it's usage?
Interesting indeed! I guess I didn't get the memo about that!

> b) can't be done right in an automated fashion

Bullshit again. Because _you_ can't do this doesn't mean anybody else
ever had any problems with it. It was working fine for _years_.

> And after discovering some bugs in ipkg-utils a while ago it seems you have to manually
> munge the Packages file to get something that ipkg will handle correctly when upgrading stuff.

Bullshit part three. I was managing a distribution which aimed to make
any updates available via "ipkg upgrade". Ignoring corner-cases like
kernel upgrades it worked as expected. Always. I never _ever_ had to
edit Packages. Sounds like you FUBAR'ed some packages and then blame the
fault on ipkg.

There are problems with corner-cases on ipkg-upgrade but I prefer
solving them to sticking my head into the ground.

> So whichever way you look at it it's going to add broken behaviour to OE. I don't want to
> explain to users why their 'feeds' don't work because they disabled common sense because
> 'OE generated it'.

It isn't broken, never was. And people compiling their images w/ OE from
scratch can be expected to handle their own feeds. We are talking
developers here, not mouse-pushing windows-hugging endusers!

> But but but but but... OE generates feeds now as well!! Right, deploy/ipk contains
> subdirectories people could abuse as feeds if they want, but I wouldn't recommend it.

No one even asked you about your opinion! You blindly removed a very
useful feature of OE for _bullshit_ reasons after a _bullshit_ RFC that
noone even had a chance to reply to in time. 

You even reverted (!) my compromise cset which added a completely
optional an OFF BY DEFAULT oe-feed quoting a _bullshit_ policy that is
no where to be found!

> So *if* people *need* OE to generate feeds, there you have them. However, I strongly
> oppose adding know broken behaviour to satisfy lazy people.

Oh I'm lazy all right. I don't see the point that 90% of all OE users
suddenly are forced to use custom feed-creation scripts (pointless
post-processing).

> regards,
> 
> Koen
> 
> PS: find */ -name  "*.ipk" -exec mv  '{}'  ./ \;
> 

Needless post-processing that is only required due to your selfish and
ignorant commit to rootfs_ipk and complete and utter disregard of other
peoples interest.





