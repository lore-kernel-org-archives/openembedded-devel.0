Received: from [81.169.178.128] (helo=h6563.serverkompetenz.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <oe@hentges.net>) id 1HNXvB-0007JE-Tg
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Mar 2007 18:21:25 +0100
Received: from localhost (localhost [127.0.0.1])
	by h6563.serverkompetenz.net (Postfix) with ESMTP id 967C4308212
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Mar 2007 18:21:25 +0100 (CET)
Received: from h6563.serverkompetenz.net ([127.0.0.1])
	by localhost (h6563 [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 03011-10 for <openembedded-devel@lists.openembedded.org>;
	Sat, 3 Mar 2007 18:21:22 +0100 (CET)
Received: from mhcln04.hentges.priv (xdsl-213-196-243-194.netcologne.de
	[213.196.243.194]) (using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by h6563.serverkompetenz.net (Postfix) with ESMTP id DB4713081E9
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Mar 2007 18:21:01 +0100 (CET)
From: Matthias Hentges <oe@hentges.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <45E7F5C9.2000507@dominion.kabel.utwente.nl>
References: <HOECLKEKOHLAMMGDLLBHIEJEKEAA.skoroneos@digital-opsis.com>
	<45E7ED77.2090103@whitby.id.au>
	<45E7F5C9.2000507@dominion.kabel.utwente.nl>
Date: Sat, 03 Mar 2007 18:19:36 +0100
Message-Id: <1172942376.11398.107.camel@localhost.localdomain>
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
X-List-Received-Date: Sat, 03 Mar 2007 17:21:26 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I'm going to spare you a detailed reply to your previous email
regarding problems w/ ipkg feeds (all of which are either OE or ipkg
bugs, very few of which can be effectively caught via any type of
post-processing, rendering yet again your whole argument mute)

Am Freitag, den 02.03.2007, 11:00 +0100 schrieb Koen Kooi:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Rod Whitby schreef:
> > Stelios Koroneos wrote:
> >> I am not sure how many of you are building multimachine distro's but the old
> >> system was not a very good solution.
> >> We are building a distro for a number of machines x86 arch (i486, i585,
> >> i686), a number of powerpc targets  and recently mipsel and puttinng
> >> everything in a giant ipk pool is not the best of solutions.

Ahh, finally someone with _real_ arguments in favor of the change. I do
feel your pain, I really do. I can see that the change makes life easier
for multi-machine / multi-arch builders. I don't have any problems with
that at all, only with the way it was implemented.

> >> As far as i can understand its a case where  single machine distro's made
> >> use of this OE feature while multimachine distros had to look for other ways
> >> (i.e post processing).

Exactly.

> > Perhaps when multimachine was added, the deploy ipk feed support should
> > have been updated to continue to work, instead of later breaking single
> > machine feed support.

Correct again. It is however my _personal_ experience that
multi-machine.bb causes more problem than it solves (of course YMMV).
Most of them are caused by faulty/problematic package .bb's (not OE or
ipkg bugs) but IMO these errors are very hard to catch and it is almost
impossible to review all 4336 .bb's currently residing in OE.

The only way to build clean and (almost) guaranteed-working feeds is to
build each MACHINE in its own tmpdir. You'll get many duplicated
packages for sure but the feed will be consistent.

> Again, it didn't break anything that was *supported*. 

Who decides what is "supported" and what isn't? 
Where can I read black on white what is supported or not?

> Rootfs generation continued to work.
> However, rootfs_ipk.bbclass is *not* the place to put in feed management. That class is
> supposed to build a rootfs from ipkgs, which it does by treating deploy/ipk/<arch> as
> feeds. I can think of ways to do rootfs generation without Packages.* (e.g sqlite), and if
> they prove to be faster and more robust I _will_ replace the old methods.

The current feed-style "installation" of the rootfs has the huge
advantage of checking the feed for broken packages at _image-generation
time_.

Removing this important check will likely cause endless pains to feed
and distro maintainers for barely any benefit.

> So my proposal:
> 
> Make a contrib/deploy-ipkg-feed.bb that basically does:
> 
> cd ${DEPLOY_DIR_IPK}
> find */ -name  "*.ipk" -exec cp  '{}'  ./ \;
> rm Packages*
> ipkg-make-index -p Packages -l Packages.filelist -m .
> 
> and add the problems mentioned in other mails as comments.
> 
> This way people wanting a single feed get it with a simple 'bitbake -b
> contrib/deploy-ipkg-feed.bb' without the impression it's officially supported in OE.
> 
> Does anyone have problems with this proposal?

Well, since you asked...

- Putting comments inside a .bb file is less-than-ideal as nobody opens
up a .bb when it's working as expected. oe.warn() might be what you are
looking for. Not that I agree that there is anything a user should be
"warned" of when building a feed. 

- Even if you call it a ".bb", it is just a script for _manual_
post-processing. Exactly how is this different than requiring the user
to run as shell script to generate the feed? Hint: It isn't.

- The only acceptable way is an automatic method, integrated into the
image-generation process as before, which the user can enable/disable if
he choose to.

Not that there is much of a reason to disable this perfectly fine
feature since oe-feed could live happily side-by-side w/ deploy/ipk....

But for some reason you (and as I understand it, it is _only_ you) have
a problem with that. 

You reverted my _optional_ OFF BY DEFAULT _compromise_ cset, you even
revoked my commit access to OE ( until someone intervened, that is )

For every one else who would like his once-working oe feed back, I might
suggest applying the oe-feed patch at
http://stuff.pimp-your-penguin.org/oe-patches/dev/

It is basically the cset koen reverted, usage instructions inside.
Should even work fine for multi-machine and multi-arch builds w/ barely
any added time to the feed-generation process. Oh, it lives in
deploy/oe-feed and is triggered by package-index.bb and image creation.





