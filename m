Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>)
	id 1PeuLA-0005eZ-3e; Mon, 17 Jan 2011 20:02:08 +0100
Received: by iyj18 with SMTP id 18so5106955iyj.6
	for <multiple recipients>; Mon, 17 Jan 2011 11:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=qJ6NhZ1qoTWl2I2rv69tZMVdE+b6Eis/VMH25quqiac=;
	b=KbRg01ctODcGTxb3PvuEOEYz2DOM5a42htZZfQpJiIRxwuDxa3ZpZx+5j+IzlYPM2N
	gVhtlXwfGU2eXfDPe9uy3kZzwJ/FCG2zQuCj0OguRyJfWqytXg2GUEQWSjZQc9eC6muf
	8pXGUCKvnne2gYN4orX9FN+663NmBwiHOesyg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=jUGpSmlHePDD/E1aFc8Me82nQU2vt/bmZldsvPLVZ7TYfXAr1tEpQ6kWtxTsJcRn9R
	wqO+4wwa/Qw+TKGOZzjJCXK5qpt/szcpYlxVI5GSWTP0UVj1eOsOaUbf+0D+3UZr9f3h
	lv4jRBbecqaCN7Q7cuCKtoAND9A/bvn/A9wFQ=
MIME-Version: 1.0
Received: by 10.231.11.204 with SMTP id u12mr4701711ibu.109.1295290889695;
	Mon, 17 Jan 2011 11:01:29 -0800 (PST)
Received: by 10.231.213.234 with HTTP; Mon, 17 Jan 2011 11:01:29 -0800 (PST)
In-Reply-To: <1295027350.14388.6527.camel@rex>
References: <1295027350.14388.6527.camel@rex>
Date: Mon, 17 Jan 2011 20:01:29 +0100
Message-ID: <AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-members@lists.openembedded.org
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Yocto Project and OE - Where now?
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
X-List-Received-Date: Mon, 17 Jan 2011 19:02:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Richard,

Thanks for your post.
I think you describe the issues at hand quite clearly.
I would definitely be interested in working towards a new structure.

The one thing that I found partially missing in your post are the
actual design guidelines.

You mention
> * Creation of a subset of metadata that has a consistent high quality
> =A0standard:
> =A0 =A0- removal of legacy components (pkgconfig hacks, libtool hacks,
> =A0 =A0 =A0legacy staging, unneeded compiler arguments)
> =A0 =A0- consistent metadata layout, spacing, use of variables
> =A0 =A0- migration away from outdated practises (e.g. use BBCLASSEXTEND)

I fully agree with these but there are several other things in OE
metadata that we should discuss and probably try to avoid.
Without the aim of trying to be complete, I would like to name some,
also with the aim to kick off the discussion on these, order to come
to an accepted set of guidelines.

- where possible stick to one recipe per package. This reduces the
maintenance work and reduces the QA nightmare of lots of different
permutations.
I feel one recipe per package should be the common case for
applications, and preferably also for libs (although I am well aware
that especially in the latter case multiple versions cannot always be
avoided).
For kernel, u-boot and some toolchain parts , multiple recipes are unavoida=
ble.
When moving to a new version or when a recipe needs some more testing,
I can imagine two versions existing for a while, but I feel this
should be an exception.
If a new version is not stable enough to be in the mainline, it should
probably live in its own overlay, not in the main repos

We should try to avoid the version diarrhea that some packages
currently have in OE (e.g. I recall that at some point we had about 10
abiword recipes, I can not really imagine anyone knowing the
differences between these, and I fail to see the point in having
these). There is no need to keep old versions around, as they are
still retrievable from git (assuming git is used as SCM).

- avoid DEFAULT_PREFERENCE. For packages with only one recipe it
shouldn't be needed at all. New, not integrated or only partially
tested recipes should reside in a separate overlay. Machine
maintainers should know best what kernel and u-boot version works best
for their machine. We do probably need to come up with a model on how
to deal with version upgrades though. This could be done with
different layers (e.g. bsp-sheevaplug and bsp-sheevaplug-next) or
maybe there are two different machines (e.g. sheevaplug and
sheevaplug-next). There are probably other solutions as well.

- avoid unneeded .inc files. In case there is only one recipe they
only complicate things as people need to examine two files. Of course
if there are multiple recipes for a package they have some merits

- avoid complex and/or unneeded python constructs in recipes. Ideally
a recipe is a description of metadata and it should be able to
describe it using variables only. In practice regularly functions like
do_compile() will be needed though, but it is probably less desirable
to write a complex piece of anonymous python to e.g. populate a -dev
package. W.r.t. readability, maintainability and understandability it
is probably better to just write it out. The goal of a recipe is not
to show off how well-versed one is in python, the goal should be to
come up with something that Joe or Jane Average also can understand.

- strong directory naming for patches. E.g. for foo, patches only for
1.2 should go in foo-1.2/, patches for foo 1.x should go to foo-1/ if
that is possible or otherwise in foo/. Patches should only go in
files/ if they are intended for multiple recipes where the recipes
have different names (e.g. if foo and foobar recipes exist in the same
dir and they need the same foopatch that one could live in files/

- no FILESPATHPKG to different version of a recipe. E.g. in the past
we had the glibc_2.x recipe pointing to the patch dir of 2.y (forgot
the actual values of x and y). If patches are for multiple recipes
they should go in a common higher level named dir (e.g. in the case
above glibc-2 or glibc or maybe the dir can be named differently and
FILESPATHPKG being used. Having patches live in other dirs where it is
not obvious is error prone when recipes are obsoleted.


These points were the things that at this moment popped up in my mind.
There are undoubtly more (e.g order of metadata, mandatory metadata).
It seems useful to agree on where we want to go to before actually
starting to walk (or run :-) ) in an undefined direction and waste
effort

Feel free to add and discuss! Frans.


