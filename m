Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OZgp8-0006ap-3r for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 11:03:15 +0200
Received: from f053033078.adsl.alicedsl.de ([78.53.33.78]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OZgp4-0003ar-Ll for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 09:03:10 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1279216536.3741.27.camel@mattotaupa>
References: <1279216536.3741.27.camel@mattotaupa>
Date: Fri, 16 Jul 2010 11:03:07 +0200
Message-ID: <1279270987.4164.29.camel@mattotaupa>
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
X-List-Received-Date: Fri, 16 Jul 2010 09:03:15 -0000
X-Groupsio-MsgNum: 21036
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-FU++7l7h3HUchp5r/G9Q"

--=-FU++7l7h3HUchp5r/G9Q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


Am Donnerstag, den 15.07.2010, 19:55 +0200 schrieb Paul Menzel:

> I ran out of space and noticed
>=20
>     /angstrom-dev/work/i686-linux/git-native-1.7.0.2-r4
>=20
> is 8,1G big.
>=20
> Some of the executable files in
>=20
>     /angstrom-dev/work/i686-linux/git-native-1.7.0.2-r4/sysroot-destdir/a=
ngstrom-dev/sysroots/i686-linux/usr/libexec/git-core/
>=20
> are 101 MB big.
>=20
> This regression must have been introduced between this morning 6 a.m.
> UTC and now.
>=20
> I could not reproduce this using the distributions minimal-uclibc or
> angstrom-2008.1 with glibc.
>=20
> If you need more information I could try to downgrade the uclibc
> revision.

I can still reproduce the problem with angstrom-2008.1, uclibc-git and
OE dev branch HEAD from today 9fd5a8cb38a376633eb0bd7981548179b6bea25d.

        /angstrom-dev/work/i686-linux/git-native-1.7.0.2-r4/sysroot-destdir=
/angstrom-dev/sysroots/i686-linux/usr/libexec/git-core$ ls -lh | sort -k 5
        [=E2=80=A6]
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-annotate
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-apply
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-archive
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-blame
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-branch
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-bundle
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-cherry
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-cherry-pick
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-clean
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-clone
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-commit
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-commit-tree
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-config
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-diff
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-fetch
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-fmt-merge-msg
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-for-each-ref
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-fsck
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-fsck-objects
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-grep
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-hash-object
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-help
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-index-pack
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-init
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-init-db
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-ls-remote
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-mailsplit
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-merge
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-merge-recursive
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-merge-subtree
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-mktag
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-mktree
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-name-rev
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-pack-redundant
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-pack-refs
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-prune
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-push
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-read-tree
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-reset
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-rev-list
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-shortlog
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-show
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-show-branch
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-show-ref
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-stage
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-stripspace
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-symbolic-ref
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-update-index
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-upload-archive
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-verify-tag
        -rwxr-xr-x 1 usern usern 101M 16. Jul 10:51 git-write-tree
        [=E2=80=A6]

Could you please check your work directory and see if you have the same
problem.


Thanks,

Paul

--=-FU++7l7h3HUchp5r/G9Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxAIEsACgkQPX1aK2wOHVhlGgCePZsE3h6pnSDKh+jsMxBaGqBh
ft8An0AVxAqBePLIExjdriabjtzQYB36
=vnB2
-----END PGP SIGNATURE-----

--=-FU++7l7h3HUchp5r/G9Q--
