Received: from [81.169.178.128] (helo=h6563.serverkompetenz.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <oe@hentges.net>) id 1HNeJ6-0005Or-Uy
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Mar 2007 01:10:32 +0100
Received: from localhost (localhost [127.0.0.1])
	by h6563.serverkompetenz.net (Postfix) with ESMTP id 6423B3081E9
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Mar 2007 01:10:09 +0100 (CET)
Received: from h6563.serverkompetenz.net ([127.0.0.1])
	by localhost (h6563 [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 06520-02 for <openembedded-devel@lists.openembedded.org>;
	Sun, 4 Mar 2007 01:10:06 +0100 (CET)
Received: from mhcln04.hentges.priv (xdsl-213-196-252-247.netcologne.de
	[213.196.252.247]) (using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by h6563.serverkompetenz.net (Postfix) with ESMTP id E31D8308214
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Mar 2007 01:09:45 +0100 (CET)
From: Matthias Hentges <oe@hentges.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1172962072.5942.68.camel@localhost.localdomain>
References: <HOECLKEKOHLAMMGDLLBHIEJEKEAA.skoroneos@digital-opsis.com>
	<45E7ED77.2090103@whitby.id.au>
	<45E7F5C9.2000507@dominion.kabel.utwente.nl>
	<1172942376.11398.107.camel@localhost.localdomain>
	<1172962072.5942.68.camel@localhost.localdomain>
Date: Sun, 04 Mar 2007 01:08:20 +0100
Message-Id: <1172966900.11398.124.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at hentges.net
Subject: Re: [oe-commits] org.oe.dev rootfs_ipk: as per OE, policy:	remove feed management tools
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
X-List-Received-Date: Sun, 04 Mar 2007 00:10:33 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Samstag, den 03.03.2007, 22:47 +0000 schrieb Richard Purdie:
> On Sat, 2007-03-03 at 18:19 +0100, Matthias Hentges wrote:
> > > Rod Whitby schreef:
> > > > Stelios Koroneos wrote:
> >  
> > Ahh, finally someone with _real_ arguments in favor of the change. I do
> > feel your pain, I really do. I can see that the change makes life easier
> > for multi-machine / multi-arch builders. I don't have any problems with
> > that at all, only with the way it was implemented.
> 
> Technically a giant pool of ipks should work and if it doesn't it points
> at bugs that need fixing.
> 
> Equally, I don't mind having splitting implemented as per my last mail.
> Lets not try and brush ipkg bugs under the mat though...

Using a very large ipk feed does indeed work nicely to generate images.
However, generating Packages can take ages ( and so do image rebuilds
because of this ). That's about the only problem I see w/ One Giant Feed


> My personal experience says multimachine works well and I use if for
> everything as standard these days. Have you any specific examples or
> problems? I have been dealing with them as and when I've seen them but I
> haven't seen any in quite a whiie... 

I wasn't exactly running into real ipkg bugs. I had problems with
packages using machine-specific stuff for some models ( say all
sl-c3x00) and hence having their ARCH set as $MACHINE, but not for other
models ( like collie, poodle ) having their ARCH set as $ARCH. 

It's a packaging bug, not an ipkg bug but annoying in any case ;)

> > > Rootfs generation continued to work.
> > > However, rootfs_ipk.bbclass is *not* the place to put in feed management. That class is
> > > supposed to build a rootfs from ipkgs, which it does by treating deploy/ipk/<arch> as
> > > feeds. I can think of ways to do rootfs generation without Packages.* (e.g sqlite), and if
> > > they prove to be faster and more robust I _will_ replace the old methods.
> > 
> > The current feed-style "installation" of the rootfs has the huge
> > advantage of checking the feed for broken packages at _image-generation
> > time_.
> > 
> > Removing this important check will likely cause endless pains to feed
> > and distro maintainers for barely any benefit.
> 
> I must admit I fail to see what's wrong with the current image
> generation methods. Yes, we can optimise some of it further but its not
> that bad at the moment. If you don't like ipkg, you can also do it using
> apt now...

Exactly.



