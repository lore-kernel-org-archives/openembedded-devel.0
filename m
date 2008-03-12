Received: from [64.233.178.243] (helo=hs-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JZaLL-0003Bf-Tx
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Mar 2008 00:26:45 +0100
Received: by hs-out-0708.google.com with SMTP id 23so2576831hsn.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2008 16:24:37 -0700 (PDT)
Received: by 10.100.48.16 with SMTP id v16mr17720503anv.67.1205364277332;
	Wed, 12 Mar 2008 16:24:37 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Wed, 12 Mar 2008 16:24:37 -0700 (PDT)
Message-ID: <c384c5ea0803121624m2992d688scdefefc2e3caba79@mail.gmail.com>
Date: Thu, 13 Mar 2008 00:24:37 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <fr9n05$sm7$1@ger.gmane.org>
MIME-Version: 1.0
References: <200803110807.11368.zecke@selfish.org>
	<1205250588.4521.111.camel@dax.rpnet.com>
	<20080312014945.4783ae6a@widy.localdomain>
	<1205280598.16531.26.camel@dax.rpnet.com>
	<20080312024408.44d9192e@widy.localdomain>
	<c384c5ea0803121138r4bf89729t18c530b67e80c107@mail.gmail.com>
	<fr997r$aat$1@ger.gmane.org>
	<c384c5ea0803121326r631bf595v72126de8c7905835@mail.gmail.com>
	<1205358843.4530.22.camel@dax.rpnet.com> <fr9n05$sm7$1@ger.gmane.org>
X-SA-Exim-Connect-IP: 64.233.178.243
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Reconsidering the work flow and how the SCM system fits in
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
X-List-Received-Date: Wed, 12 Mar 2008 23:26:46 -0000
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello,

On Wed, Mar 12, 2008 at 11:54 PM, Koen Kooi
<koen@dominion.kabel.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
>  | Whilst I think OE will always have a central master .dev repository I
>  | see a lot of gain from having branches. I would have happily put the
>  | sysroot changes into a branch and likewise the packaged-staging stuff
>  | I'm working on. As it is I'm keeping it locally uncommitted with no
>  | version tracking since I don't really want to play games with monotone=
.
>
>  Thank you for saying it right out: "I haven't tried to use branches in
>  mtn, ever".
>
mtn will handle branches, no issue. But how easy can a branch be
merged back if it has been branching off for too long? I guess we end
up in the same situation as the dreambox branch?

Paul, *yes* a head is like a branch in the revision control system,
but I cannot use it as a branch! Unless you can explain me how I could
*easily track or pluck from* the AVR work if it wasn't branched but a
different head.

>  So we only have Holger saying mtn can't merge the dreambox branch, and
>  people ignoring what I said about the avr32 branch.
>
We would like to merge easily and branch cheaply. Obviously, mtn can
cope with the latter and lacks in the first. Is that alone enough to
move to hg or git?

I found this: http://utsl.gen.nz/talks/git-svn/intro.html, and I quote belo=
w:

What Mercurial (=3DHg) has over git
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Mercurial is missing lightweight branches that makes git so powerful,
and there is no content hashing, so it doesn't really do the whole
"revision protocol" thing like git. This is why people like Ted T'so
say "git has more legs".

However as a version control system in its own right, it's certainly
one of the best. And if you consider that it is almost a twin brother
of git, being written in response to Larry McVoy's Great Temper
Tantrum=99 and its first release only a couple of weeks later than git's
first release, and given all that it has achieved, it's an outstanding
accomplishment.

Here are some of the reasons why.

Portability and Consistency

Mercurial, like Bazaar-NG, is written completely in Python (with some
performance critical parts in C). So, if you like Python you might
find that good. If you're on Windows it's probably a lot easier to get
going. Hey, maybe it will even one day run on IronPython on .NET.
Optimisation for the Cold Cache case

In the "cold cache" case, git typically needs to load a lot of blocks
to do some operations. Mercurial, on the other hand, gets away with
far fewer seeks for them. This means it can be a lot faster - for
instance, one use case that Mercurial is a lot faster is applying a
ton of patches.

In the "hot cache" case, git typically blows Mercurial out of the
water, except for operations where git is having to do searches to get
the data, like annotate.

Bundle efficiency

Mercurial's hg bundle does a really, really good job of making small
packs. With the e2fsprogs repository, it managed to make a pack that
was 50% smaller than the default git pack, and its default bundle was
20% smaller than an agressively (and expensively) packed git pack.


Regards,
--=20
Leon


