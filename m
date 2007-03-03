Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HNd1B-0002pK-VN
	for openembedded-devel@openembedded.org; Sat, 03 Mar 2007 23:47:58 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l23Mlv6e019425
	for <openembedded-devel@openembedded.org>; Sat, 3 Mar 2007 22:47:57 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18265-08 for <openembedded-devel@openembedded.org>;
	Sat,  3 Mar 2007 22:47:55 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l23MlpoP019416
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Sat, 3 Mar 2007 22:47:52 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1172942376.11398.107.camel@localhost.localdomain>
References: <HOECLKEKOHLAMMGDLLBHIEJEKEAA.skoroneos@digital-opsis.com>
	<45E7ED77.2090103@whitby.id.au>
	<45E7F5C9.2000507@dominion.kabel.utwente.nl>
	<1172942376.11398.107.camel@localhost.localdomain>
Date: Sat, 03 Mar 2007 22:47:52 +0000
Message-Id: <1172962072.5942.68.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Sat, 03 Mar 2007 22:47:58 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2007-03-03 at 18:19 +0100, Matthias Hentges wrote:
> > Rod Whitby schreef:
> > > Stelios Koroneos wrote:
> > >> I am not sure how many of you are building multimachine distro's but the old
> > >> system was not a very good solution.
> > >> We are building a distro for a number of machines x86 arch (i486, i585,
> > >> i686), a number of powerpc targets  and recently mipsel and puttinng
> > >> everything in a giant ipk pool is not the best of solutions.
> 
> Ahh, finally someone with _real_ arguments in favor of the change. I do
> feel your pain, I really do. I can see that the change makes life easier
> for multi-machine / multi-arch builders. I don't have any problems with
> that at all, only with the way it was implemented.

Technically a giant pool of ipks should work and if it doesn't it points
at bugs that need fixing.

Equally, I don't mind having splitting implemented as per my last mail.
Lets not try and brush ipkg bugs under the mat though...

> Correct again. It is however my _personal_ experience that
> multi-machine.bb causes more problem than it solves (of course YMMV).
> Most of them are caused by faulty/problematic package .bb's (not OE or
> ipkg bugs) but IMO these errors are very hard to catch and it is almost
> impossible to review all 4336 .bb's currently residing in OE.
>
> The only way to build clean and (almost) guaranteed-working feeds is to
> build each MACHINE in its own tmpdir. You'll get many duplicated
> packages for sure but the feed will be consistent.

My personal experience says multimachine works well and I use if for
everything as standard these days. Have you any specific examples or
problems? I have been dealing with them as and when I've seen them but I
haven't seen any in quite a whiie... 

> > Rootfs generation continued to work.
> > However, rootfs_ipk.bbclass is *not* the place to put in feed management. That class is
> > supposed to build a rootfs from ipkgs, which it does by treating deploy/ipk/<arch> as
> > feeds. I can think of ways to do rootfs generation without Packages.* (e.g sqlite), and if
> > they prove to be faster and more robust I _will_ replace the old methods.
> 
> The current feed-style "installation" of the rootfs has the huge
> advantage of checking the feed for broken packages at _image-generation
> time_.
> 
> Removing this important check will likely cause endless pains to feed
> and distro maintainers for barely any benefit.

I must admit I fail to see what's wrong with the current image
generation methods. Yes, we can optimise some of it further but its not
that bad at the moment. If you don't like ipkg, you can also do it using
apt now...

Regards,

Richard





