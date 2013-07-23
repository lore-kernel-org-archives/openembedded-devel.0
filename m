Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B31C06077D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2013 17:51:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6NHq0OL020119
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2013 10:52:00 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Tue, 23 Jul 2013 10:52:00 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 9DD917FE3;
	Tue, 23 Jul 2013 13:51:52 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 83B82404D8; Tue,
	23 Jul 2013 13:51:59 -0400 (EDT)
Date: Tue, 23 Jul 2013 13:51:59 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130723175159.GF3643@windriver.com>
MIME-Version: 1.0
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [meta-networking] Update to standalone tree
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
X-List-Received-Date: Tue, 23 Jul 2013 17:52:00 -0000
X-Groupsio-MsgNum: 45452
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4VrXvz3cwkc87Wze"
Content-Disposition: inline

--4VrXvz3cwkc87Wze
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


   If you are only using meta-networking from meta-openembedded, you
   need read no further.  This is only for people using my side-project
   on github.  Absolutely nothing has changed in the official
   meta-networking.



For anyone using the standalone meta-networking subtree I maintain on
github, please be aware that I've made a change to the way I create the
subtree which, unfortunately, will result in a forced update for all of
your branches.  And probably a merge on whatever branch you happen to be
on already (eg. master).  If you get into that scenario, I suggest
pushing your current branch with the merge in it off a cliff and
re-creating the current branch tracking the up-stream.  If you're not in
the habit of doing a git-pull, though, this will probably be cleaner:

   % git fetch --all --tags ; git rebase origin/<up-stream-branch-name

The reason for this (and the advantage) has been in response to requests
I've had to preserve the original (that is, meta-oe) commit hash so it
is easy to connect a commit in the standalone meta-networking with the
official meta-networking I maintain as a part of the larger meta-oe.
The change is small and hopefully self-explanatory, but I won't let that st=
op
me.

Before:

commit a0f9363caddbfb92212b4bf5d4a2590c451b7cef
Author: Roy.Li <rongqing.li@windriver.com>
Date:   Fri Jul 19 10:19:25 2013 +0800

    Upgrade vsftpd to 3.0.0
   =20
    Upgrade vsftpd to 3.0.0 with below modification:
    1. more strict access limitation, like: do not allow anonymous access
    2. use vsftpd.ftpusers and vsftpd.user_list to confine user access
    3. enable pam if DISTRO_FEATURE includes pam
    4. enable tcp-wrapper
    5. install vsftpd.conf with 0600 permission, not 0755
   =20
    Signed-off-by: Roy.Li <rongqing.li@windriver.com>
    Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>

After:

commit b188e402a04db35424e22cb2b2100b7070648948
Author: Roy.Li <rongqing.li@windriver.com>
Date:   Fri Jul 19 10:19:25 2013 +0800

    Upgrade vsftpd to 3.0.0
   =20
      (original commit: 441502b68d03a4ce7796436a53c5e95399724ad2)
   =20
    Upgrade vsftpd to 3.0.0 with below modification:
    1. more strict access limitation, like: do not allow anonymous access
    2. use vsftpd.ftpusers and vsftpd.user_list to confine user access
    3. enable pam if DISTRO_FEATURE includes pam
    4. enable tcp-wrapper
    5. install vsftpd.conf with 0600 permission, not 0755
   =20
    Signed-off-by: Roy.Li <rongqing.li@windriver.com>
    Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>

Where 441502b6... is the commit in meta-oe from Roy that happens to
upgrade vsftpd.

FWIW, I don't anticipate doing anything destructive like this again.

--=20
-Joe MacDonald.
:wq

--4VrXvz3cwkc87Wze
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlHuwr8ACgkQPN8S4W6ZZnef0ACeOdUv2VP0yarl1cBWSn08NtXi
IvMAnjMm2jE4ZkSVEjxtN8vHTLs+6fdG
=Ne8h
-----END PGP SIGNATURE-----

--4VrXvz3cwkc87Wze--
