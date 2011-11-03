Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RM5sh-0003F1-JJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Nov 2011 23:35:31 +0100
Received: by faas16 with SMTP id s16so2277740faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2011 15:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9l39D/QMR87d5Q7btRq2mWVeo7/yU5IIMusdEGVggsk=;
	b=hzOAhpugKDRD0cltIDpEps4E5jlEgJFZREgRWPCvRLKoLmLDf3SAYWY9Nd3KpI3cCz
	4i8L2r3iOJ6oKbBcHMbtMNnsXO+NIfwN+N8wRygkjJvGRYu5CdymzS4OwGRKLdhU1Dyp
	zGE2K922O5P0eOGFL37EoIoFwlrwlBMXbT0x4=
Received: by 10.223.75.129 with SMTP id y1mr3497843faj.34.1320359362513;
	Thu, 03 Nov 2011 15:29:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k13sm4804196fah.0.2011.11.03.15.29.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Nov 2011 15:29:21 -0700 (PDT)
Date: Thu, 3 Nov 2011 23:29:18 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111103222918.GP9949@jama.jama.net>
References: <20111101085901.447CF1032F@opal>
	<20111102233254.GJ9949@jama.jama.net>
	<201111030152.49177.schnitzeltony@gmx.de>
	<201111032245.17175.schnitzeltony@gmx.de>
MIME-Version: 1.0
In-Reply-To: <201111032245.17175.schnitzeltony@gmx.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-commits] Martin Jansa : midori: fix build with dirty vala
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
X-List-Received-Date: Thu, 03 Nov 2011 22:35:31 -0000
X-Groupsio-MsgNum: 35206
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y6PvmTFIYclVmRST"
Content-Disposition: inline

--y6PvmTFIYclVmRST
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 03, 2011 at 10:45:16PM +0100, Andreas M=FCller wrote:
> On Thursday, November 03, 2011 01:52:48 AM Andreas M=FCller wrote:
> > On Thursday, November 03, 2011 12:32:54 AM Martin Jansa wrote:
> > > > Hm - I am afraid since this update midori never finishes configuring
> > > > here. I waited for approximately 2 hours and stopped the process. T=
he
> > > > log file is attached ( a fresh retry creates similar log ). I comme=
nted
> > > > out the whole
> > >=20
> > > Have you tried to revert it to see that it's not caused ie by glib
> > > changes or something? Because my vala detection change is already
> > > finished before it writes this stuff and the tar in waf is compared w=
ith
> > > hardcoded checksum, so it also could not change just by this monster
> > > blob.
> >=20
> > When sending previous mail I had two runs with and without your patch w=
hich
> > gave me a clear picture. Now I have had some further rebuilds - seems
> > sometimes it builds sometimes not! It's a bit late - tomorrow I would l=
ike
> > to check further builds to see if I get a hang too with your patch
> > reverted.
> I created a simple script rebuilding midori again and again. I tested it =
with=20
> your patch reverted -> I cannot tell when, but when I came back had also =
hang on=20
> configure. So your patch is out of suspicion. For now my strategy will be=
 living=20
> with it.
> >=20
> > > Could you also check if there is something interesting in ps aux or
> > > strace when it's "hanging"? On all 3 boxes I have tried this it always
> > > worked as expected.
> > >=20
> > > > | do_configure_prepend()
> > > >=20
> > > > function, ran
> > > >=20
> > > > | bitbake -ccleanall midori
> > > >=20
> > > > and
> > > >=20
> > > > | bitbake midori
> > > >=20
> > > > without further issues in few minutes.
> > > >=20
> > > > Maybe we should rethink this monster blob commit intended to fix a
> > > > corner case...
> > >=20
> > > Yes pity that this corner case is our only vala-native and I was hopp=
ing
> > > that newer midori with newer waf-1.6 will be released soon and this
> > > won't be needed anymore..
> What I still do not unterstand: Since configure detetced vala correct wit=
h patch=20
> reverted I ran
>=20
> ~/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/valac --version
>=20
> I got
>=20
> Vala 0.12.1
>=20
> Why am I not dirty?

SHR buildhost with shr-chroot:
OE @ ~ $ ~/shr-core/tmp/sysroots/x86_64-linux/usr/bin/valac --version
Vala 0.12.1-dirty

my buildhost with shr-chroot:
OE @ ~ $ ~/shr-core/tmp/sysroots/x86_64-linux/usr/bin/valac --version
Vala 0.12.1

So right now only bad people are dirty and only sometimes.. see how they
get dirty

vala/build-aux/git-version-gen
=2E..
# Don't declare a version "dirty" merely because a time stamp has changed.
git status > /dev/null 2>&1

dirty=3D`sh -c 'git diff-index --name-only HEAD' 2>/dev/null` || dirty=3D
case "$dirty" in
    '') ;;
    *) # Append the suffix only if there isn't one already.
        case $v in
          *-dirty) ;;
          *) v=3D"$v-dirty" ;;
        esac ;;
esac

shr buildhost:
OE @ ~/shr-core/tmp/work/x86_64-linux $ git diff-index --name-only HEAD
dev/.keep
dev/null
etc/group
etc/hosts
etc/localtime
etc/passwd
etc/resolv.conf
proc/.keep
sys/.keep
var/cache/ldconfig/aux-cache
var/run/utmp

and my buildhost:
OE @ ~/shr-core/tmp/work/x86_64-linux $ git diff-index --name-only HEAD
fatal: Not a git repository (or any parent up to mount parent /OE/shr-core/=
tmp)
Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).

The difference is that my tmp/work dir is mount -o bind outside shr-chroot
(which is itself git checkout).

So yes.. the detection in vala is not optimal and and causes false positive=
 -dirty,=20
but midori should be able to build even with really dirty vala_git.bb and n=
ewer
waf is also fixing it like this.

If someone confirms that this patch is causing some problems I'll remove -d=
irty=20
detection from vala completely so it will also report clean on really dirty=
=20
vala_git.bb.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--y6PvmTFIYclVmRST
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6zFb0ACgkQN1Ujt2V2gBweBwCePLIs5j26VU28JWl6whu2FOJm
WuoAnjjaq7vObFULO1b2mlOho8RytW/c
=W2iC
-----END PGP SIGNATURE-----

--y6PvmTFIYclVmRST--
