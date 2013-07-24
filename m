Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7EC0E6B0F2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 16:54:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6OGsYkb001699
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 09:54:34 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 24 Jul 2013 09:54:32 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id F0DDC7FE3	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:54:23 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 02E9A404D6; Wed,
	24 Jul 2013 12:54:31 -0400 (EDT)
Date: Wed, 24 Jul 2013 12:54:31 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130724165431.GA3797@windriver.com>
References: <20130723175159.GF3643@windriver.com>
	<5440164E-A494-4C7B-AE0D-1A411C699EBC@gmail.com>
MIME-Version: 1.0
In-Reply-To: <5440164E-A494-4C7B-AE0D-1A411C699EBC@gmail.com>
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
X-List-Received-Date: Wed, 24 Jul 2013 16:54:32 -0000
X-Groupsio-MsgNum: 45491
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline

--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking] Update to standalone tree] On 13.07.23 (Tue 14:=
53) Khem Raj wrote:

>=20
> On Jul 23, 2013, at 10:51 AM, Joe MacDonald <Joe.MacDonald@windriver.com>=
 wrote:
>=20
> >=20
> >   If you are only using meta-networking from meta-openembedded, you
> >   need read no further.  This is only for people using my side-project
> >   on github.  Absolutely nothing has changed in the official
> >   meta-networking.
> >=20
> >=20
> >=20
> > For anyone using the standalone meta-networking subtree I maintain on
> > github,
>=20
>=20
> whats the advantage of doing so ?
> you could still checkout the repository and just use meta-networking layer
> how is above different.=20

For the most part, it's not hugely different.  It does meet my specific
requirements in that it is contained (that is, it is possible for me to
distribute meta-networking without distributing meta-gnome, for example)
and it is dramatically smaller:

   % du -sh meta-openembedded meta-networking
   1.5G    meta-openembedded
   2M      meta-networking
   % du -sh meta-openembedded-bare meta-networking-bare
   20M     meta-openembedded
   464K    meta-networking

> We should be careful since in layer universe, this can easily escalate co=
nfusion

I can certainly understand that sentiment.  I do well to have a sense of
the universe of layers extant today, and I wouldn't want to confuse
anyone.  That is the main reason why I've not mentioned the standalone
meta-net here after the initial creation last year and why I didn't
include a link to it here.  But I know there are a few users around and
since I'd done something (in my mind) pretty dramatic, I wanted to make
sure I didn't leave anyone out.

The project page itself on github also includes this in the description:

   a read-only, automatically generated subtree of the meta-networking
   layer in meta-openembedded

So I would hope that anyone getting there in the first place understands
what it is and what it isn't.  The most important thing is it is a
convenience for me that I thought I'd share but nothing ever comes in
through it.

Certainly I won't mention it again here, though, and I'm not encouraging
anyone to adopt it.

-J.

>=20
>=20
> > please be aware that I've made a change to the way I create the
> > subtree which, unfortunately, will result in a forced update for all of
> > your branches.  And probably a merge on whatever branch you happen to be
> > on already (eg. master).  If you get into that scenario, I suggest
> > pushing your current branch with the merge in it off a cliff and
> > re-creating the current branch tracking the up-stream.  If you're not in
> > the habit of doing a git-pull, though, this will probably be cleaner:
> >=20
> >   % git fetch --all --tags ; git rebase origin/<up-stream-branch-name
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
> >    Upgrade vsftpd to 3.0.0
> >=20
> >    Upgrade vsftpd to 3.0.0 with below modification:
> >    1. more strict access limitation, like: do not allow anonymous access
> >    2. use vsftpd.ftpusers and vsftpd.user_list to confine user access
> >    3. enable pam if DISTRO_FEATURE includes pam
> >    4. enable tcp-wrapper
> >    5. install vsftpd.conf with 0600 permission, not 0755
> >=20
> >    Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> >    Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
> >=20
> > After:
> >=20
> > commit b188e402a04db35424e22cb2b2100b7070648948
> > Author: Roy.Li <rongqing.li@windriver.com>
> > Date:   Fri Jul 19 10:19:25 2013 +0800
> >=20
> >    Upgrade vsftpd to 3.0.0
> >=20
> >      (original commit: 441502b68d03a4ce7796436a53c5e95399724ad2)
> >=20
> >    Upgrade vsftpd to 3.0.0 with below modification:
> >    1. more strict access limitation, like: do not allow anonymous access
> >    2. use vsftpd.ftpusers and vsftpd.user_list to confine user access
> >    3. enable pam if DISTRO_FEATURE includes pam
> >    4. enable tcp-wrapper
> >    5. install vsftpd.conf with 0600 permission, not 0755
> >=20
> >    Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> >    Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
> >=20
> > Where 441502b6... is the commit in meta-oe from Roy that happens to
> > upgrade vsftpd.
> >=20
> > FWIW, I don't anticipate doing anything destructive like this again.
> >=20
> > --=20
> > -Joe MacDonald.
> > :wq
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
-Joe MacDonald.
:wq

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlHwBsQACgkQPN8S4W6ZZneY6ACfatWsE7nolUT3IJCjTdAxX7zd
QCoAn3yWae1W/82A2WJViiKia1nFBHhY
=qIsK
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
