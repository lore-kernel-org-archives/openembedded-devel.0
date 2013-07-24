Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D67B660664
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 16:58:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6OGwxH3001757
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 09:59:00 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 24 Jul 2013 09:58:58 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 64BDF7FE3	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:58:49 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 6E078404D6; Wed,
	24 Jul 2013 12:58:57 -0400 (EDT)
Date: Wed, 24 Jul 2013 12:58:57 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130724165857.GB3797@windriver.com>
References: <20130723175159.GF3643@windriver.com> <20130723202409.GA4136@jama>
MIME-Version: 1.0
In-Reply-To: <20130723202409.GA4136@jama>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking] Update to standalone tree
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Jul 2013 16:58:58 -0000
X-Groupsio-MsgNum: 45492
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VrqPEDrXMn8OVzN4"
Content-Disposition: inline

--VrqPEDrXMn8OVzN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking] Update to standalone tree] On 13.07.23 (Tue 22:=
24) Martin Jansa wrote:

> On Tue, Jul 23, 2013 at 01:51:59PM -0400, Joe MacDonald wrote:
> >=20
> >    If you are only using meta-networking from meta-openembedded, you
> >    need read no further.  This is only for people using my side-project
> >    on github.  Absolutely nothing has changed in the official
> >    meta-networking.
>=20
> Just out of curiosity why do you keep separate tree for it?

Mostly it spawned out of non-technical reasons and since it's nearly
free for me to continue to do, I continue to do it.  It's worked well
for me on some setups as well (eg. a new clone over an exceptionally
slow link where I only need to build yocto+a handful of meta-networking
apps) but if it actually amounted to any real work for me, I would've
dropped it by now.

> Is there some diff or is it exactly the same (now also with the same
> commit IDs?).

Note that the commit IDs aren't actually the same.  They can't be
because it has a pseudo-history constructed using git-subtree.  That's
why I made this most recent change to include the original meta-oe
commit IDs in the subtree'd version.

-J.

>=20
> >=20
> >=20
> >=20
> > For anyone using the standalone meta-networking subtree I maintain on
> > github, please be aware that I've made a change to the way I create the
> > subtree which, unfortunately, will result in a forced update for all of
> > your branches.  And probably a merge on whatever branch you happen to be
> > on already (eg. master).  If you get into that scenario, I suggest
> > pushing your current branch with the merge in it off a cliff and
> > re-creating the current branch tracking the up-stream.  If you're not in
> > the habit of doing a git-pull, though, this will probably be cleaner:
> >=20
> >    % git fetch --all --tags ; git rebase origin/<up-stream-branch-name
> >=20
> > The reason for this (and the advantage) has been in response to requests
> > I've had to preserve the original (that is, meta-oe) commit hash so it
> > is easy to connect a commit in the standalone meta-networking with the
> > official meta-networking I maintain as a part of the larger meta-oe.
> > The change is small and hopefully self-explanatory, but I won't let tha=
t stop
> > me.
> >=20
> > Before:
> >=20
> > commit a0f9363caddbfb92212b4bf5d4a2590c451b7cef
> > Author: Roy.Li <rongqing.li@windriver.com>
> > Date:   Fri Jul 19 10:19:25 2013 +0800
> >=20
> >     Upgrade vsftpd to 3.0.0
> >    =20
> >     Upgrade vsftpd to 3.0.0 with below modification:
> >     1. more strict access limitation, like: do not allow anonymous acce=
ss
> >     2. use vsftpd.ftpusers and vsftpd.user_list to confine user access
> >     3. enable pam if DISTRO_FEATURE includes pam
> >     4. enable tcp-wrapper
> >     5. install vsftpd.conf with 0600 permission, not 0755
> >    =20
> >     Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> >     Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
> >=20
> > After:
> >=20
> > commit b188e402a04db35424e22cb2b2100b7070648948
> > Author: Roy.Li <rongqing.li@windriver.com>
> > Date:   Fri Jul 19 10:19:25 2013 +0800
> >=20
> >     Upgrade vsftpd to 3.0.0
> >    =20
> >       (original commit: 441502b68d03a4ce7796436a53c5e95399724ad2)
> >    =20
> >     Upgrade vsftpd to 3.0.0 with below modification:
> >     1. more strict access limitation, like: do not allow anonymous acce=
ss
> >     2. use vsftpd.ftpusers and vsftpd.user_list to confine user access
> >     3. enable pam if DISTRO_FEATURE includes pam
> >     4. enable tcp-wrapper
> >     5. install vsftpd.conf with 0600 permission, not 0755
> >    =20
> >     Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> >     Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
> >=20
> > Where 441502b6... is the commit in meta-oe from Roy that happens to
> > upgrade vsftpd.
> >=20
> > FWIW, I don't anticipate doing anything destructive like this again.
> >=20
> > --=20
> > -Joe MacDonald.
> > :wq
>=20
>=20
>=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
>=20
--=20
-Joe MacDonald.
:wq

--VrqPEDrXMn8OVzN4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlHwB9EACgkQPN8S4W6ZZneqLACfRt7iDmlPxJryWrRn5rnGe4bN
/VMAnivmBEbYGHn68bwQp2ekMWedEfsl
=K31Z
-----END PGP SIGNATURE-----

--VrqPEDrXMn8OVzN4--
