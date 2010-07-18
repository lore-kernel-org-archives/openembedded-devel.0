Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OaVAS-0005Tj-99 for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jul 2010 16:49:01 +0200
Received: from f053040034.adsl.alicedsl.de ([78.53.40.34]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OaVAM-00006H-5Q for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jul 2010 14:48:30 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <i1s6sg$d1j$1@dough.gmane.org>
References: <1279216536.3741.27.camel@mattotaupa>
	<1279270987.4164.29.camel@mattotaupa>
	<AANLkTimGrdHiLeLLsInSl9L-KS8SbvNt4ws2kDcpEEN1@mail.gmail.com>
	<i1qogv$i28$2@dough.gmane.org> <1279355702.14848.3.camel@mattotaupa>
	<i1s6sg$d1j$1@dough.gmane.org>
Date: Sun, 18 Jul 2010 16:48:27 +0200
Message-ID: <1279464507.18570.59.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: angstrom-2008.1, uclibc: git-native: sysroot-destdir 6, 4 GB big, since some executables are 100 MB each
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
X-List-Received-Date: Sun, 18 Jul 2010 14:49:03 -0000
X-Groupsio-MsgNum: 21109
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-R8KhA9j4+Gh/LAedakQb"

--=-R8KhA9j4+Gh/LAedakQb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 17.07.2010, 14:15 +0200 schrieb Koen Kooi:
> On 17-07-10 10:35, Paul Menzel wrote:
> > Am Samstag, den 17.07.2010, 01:03 +0200 schrieb Koen Kooi:
> >> On 16-07-10 17:23, Khem Raj wrote:
> >>> On Fri, Jul 16, 2010 at 2:03 AM, Paul Menzel
> >>> <paulepanter@users.sourceforge.net> wrote:
> >=20
> >>>> Am Donnerstag, den 15.07.2010, 19:55 +0200 schrieb Paul Menzel:
> >>>>
> >>>>> I ran out of space and noticed
> >>>>>
> >>>>>     /angstrom-dev/work/i686-linux/git-native-1.7.0.2-r4
> >>>>>
> >>>>> is 8,1G big.
> >>>>>
> >>>>> Some of the executable files in
> >>>>>
> >>>>>     /angstrom-dev/work/i686-linux/git-native-1.7.0.2-r4/sysroot-des=
tdir/angstrom-dev/sysroots/i686-linux/usr/libexec/git-core/
> >>>>>
> >>>>> are 101 MB big.
> >>>
> >>> its most probably the -g3/-ggdb3 bloat.
> >>
> >> No, it's git not creating (hard)links but copies of the same app. Run =
an
> >> md5sum on the binaries, they will all match. I suggest you stop
> >> spreading FUD about -ggdb3, it is not being appriciated.
> >=20
> > I do not know anything about the technical background. I can only repor=
t
> > that removing `-ggdb3` fixed it for me.
>=20
> Are you saying that removing -ggdb3 made git create proper (hard)links?

No, I just said, that after doing as Khem suggested the available space
was big enough.

Anyway, I tried to investigate a little and could not find anything
related to (hard)link problems. But probably I overlooked something. I
head refresh my memory about hard and soft links [1].

1. As you suggested in your reply I ran `md5sum` on the binaries. They
do indeed match on the binaries I posted, but also the inode matches. It
looks like that is way it should be.

        $ echo "Test" > test
        $ ln test test.link
        $ md5sum test*
        2205e48de5f93c784733ffcca841d2b5  test
        2205e48de5f93c784733ffcca841d2b5  test.link
        $ ls -1i test*
        3653430 test
        3653430 test.link

So I think the hardlinks were created properly. I did not think of this
when reporting the problem so I did not run `ls -i` on the listed files
and I did not check with `du`.

        /angstrom-dev/work/i686-linux/git-native-1.7.1.1-r0/image/angstrom-=
dev/sysroots/i686-linux/usr/libexec/git-core $ md5sum * | sort
        [=E2=80=A6]
        82c05218d9634923e301a9463e8f9c0d  git-shell
        85edbd7803242b4895ed33b4fcfa3622  git-remote-ftp
        85edbd7803242b4895ed33b4fcfa3622  git-remote-ftps
        85edbd7803242b4895ed33b4fcfa3622  git-remote-http
        85edbd7803242b4895ed33b4fcfa3622  git-remote-https
        89a6ef52f4b7c336fb5fc0601edfd95f  git-mergetool
        9a7f760ecef6e64f370c907d61ad0ffb  git-svn
        9b57eb61ce668f2105a61a467f4d6d9b  git-difftool
        ac3472a81bc59a69119b0d027c3f617b  git-merge-one-file
        b14a5bba57d0ae0ccfdb0fceac0eb4ec  git-merge-octopus
        b6899828bc756c5d30398d49dce91deb  git-cvsexportcommit
        b775de2d21923f5d08e0bdcf3f9d31f6  git-mergetool--lib
        bd786a897bdc214bd5d89f51ad79f152  git-instaweb
        c8466908a274e211a43d287e510f2f19  git-merge-resolve
        ce109bd27d9404980bd82ddb529eca90  git-send-email
        d3da496bd962246727ceaabc1d4b1bdd  git-sh-setup
        d46c9b755b712bf3c27521b3c6e5fd30  git-relink
        d4b577d9a69d9af883de29d6af4f04c5  git
        d4b577d9a69d9af883de29d6af4f04c5  git-add
        d4b577d9a69d9af883de29d6af4f04c5  git-annotate
        d4b577d9a69d9af883de29d6af4f04c5  git-apply
        [=E2=80=A6]

        /angstrom-dev/work/i686-linux/git-native-1.7.1.1-r0/image/angstrom-=
dev/sysroots/i686-linux/usr/libexec/git-core $ ls -1i
        [ =E2=80=A6 ordered manually to match md5sum output]
        3691063 git-shell
        3691070 git-remote-ftp
        3691070 git-remote-ftps
        3691070 git-remote-http
        3691070 git-remote-https
        3691082 git-mergetool
        3691100 git-svn
        3691093 git-difftool
        3691080 git-merge-one-file
        3691079 git-merge-octopus
        3691095 git-cvsexportcommit
        3691102 git-mergetool--lib
        3691101 git-instaweb
        3691081 git-merge-resolve
        3691099 git-send-email
        3691104 git-sh-setup
        3691098 git-relink
        3691105 git
        [=E2=80=A6]

What did I miss? Were you seeing something different?

2. You seem to have investigated this problem before and committed a fix
for git [2].

    git 1.7.0.2: fix hardlinking problems as reported by Eric Brombaugh

I could not find Eric=E2=80=99s report on this list or the Web. So I have t=
o
test without your patch. But `git-native` does not seem to use your
patch, so I guess the behavior should be the one without your patch.

Could you please tell me if my observations are correct.


Thanks,

Paul


[1] info coreutils "ln invocation"
[2] http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3D84de5163=
1e1e7bb76141332807ed2ba9e8df02ae

--=-R8KhA9j4+Gh/LAedakQb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxDFDQACgkQPX1aK2wOHVg0AgCfefObDySndr/o2i8JMYwg1gFi
mJ4An0fVzudseaxEA3x7BCVrux2wUo/6
=Njgj
-----END PGP SIGNATURE-----

--=-R8KhA9j4+Gh/LAedakQb--
