Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id BE58D6077D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2013 20:23:48 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id m14so4734203eaj.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2013 13:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1xMCOx0G74GG+bibPNKqN9E1mfqHxO1XKcpbCkdRDpA=;
	b=IeVN4PnUvToL6DKktVATRA5EcbsS5BQzkoPp+6dBcKeG6ZxRWrW4hM/cfR5NA632HW
	ZnKEOlHy6atppmGgI6vy2e/J19i9FCGJcSIrsek88iiaQZOEZZyXV0o3YpnPywRX6sdN
	uCa3+D5/pZPO4RsbtCreOk98yRfW3iypCxIC+dhIvWOAI9UukRLgUeMv7jxSxGNjA1w5
	pb1Zk36E32/+PNGjHFpEQPMb2DLQBUacu6fa6iNOPXQz9Y1Ie4ctUrjNoY/jgXr6feDg
	T9nJWjrLrzyrp5GGkRt9RQrGBpLOHirv99YauZC5rTClkMvy/oLsvXPS4FV6p0B8ixXq
	Ro3w==
X-Received: by 10.15.107.194 with SMTP id cb42mr34303785eeb.136.1374611028258; 
	Tue, 23 Jul 2013 13:23:48 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	w43sm61035242eez.6.2013.07.23.13.23.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 23 Jul 2013 13:23:46 -0700 (PDT)
Date: Tue, 23 Jul 2013 22:24:09 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130723202409.GA4136@jama>
References: <20130723175159.GF3643@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20130723175159.GF3643@windriver.com>
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
X-List-Received-Date: Tue, 23 Jul 2013 20:23:49 -0000
X-Groupsio-MsgNum: 45453
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline

--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2013 at 01:51:59PM -0400, Joe MacDonald wrote:
>=20
>    If you are only using meta-networking from meta-openembedded, you
>    need read no further.  This is only for people using my side-project
>    on github.  Absolutely nothing has changed in the official
>    meta-networking.

Just out of curiosity why do you keep separate tree for it? Is there
some diff or is it exactly the same (now also with the same commit
IDs?).

>=20
>=20
>=20
> For anyone using the standalone meta-networking subtree I maintain on
> github, please be aware that I've made a change to the way I create the
> subtree which, unfortunately, will result in a forced update for all of
> your branches.  And probably a merge on whatever branch you happen to be
> on already (eg. master).  If you get into that scenario, I suggest
> pushing your current branch with the merge in it off a cliff and
> re-creating the current branch tracking the up-stream.  If you're not in
> the habit of doing a git-pull, though, this will probably be cleaner:
>=20
>    % git fetch --all --tags ; git rebase origin/<up-stream-branch-name
>=20
> The reason for this (and the advantage) has been in response to requests
> I've had to preserve the original (that is, meta-oe) commit hash so it
> is easy to connect a commit in the standalone meta-networking with the
> official meta-networking I maintain as a part of the larger meta-oe.
> The change is small and hopefully self-explanatory, but I won't let that =
stop
> me.
>=20
> Before:
>=20
> commit a0f9363caddbfb92212b4bf5d4a2590c451b7cef
> Author: Roy.Li <rongqing.li@windriver.com>
> Date:   Fri Jul 19 10:19:25 2013 +0800
>=20
>     Upgrade vsftpd to 3.0.0
>    =20
>     Upgrade vsftpd to 3.0.0 with below modification:
>     1. more strict access limitation, like: do not allow anonymous access
>     2. use vsftpd.ftpusers and vsftpd.user_list to confine user access
>     3. enable pam if DISTRO_FEATURE includes pam
>     4. enable tcp-wrapper
>     5. install vsftpd.conf with 0600 permission, not 0755
>    =20
>     Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>     Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
>=20
> After:
>=20
> commit b188e402a04db35424e22cb2b2100b7070648948
> Author: Roy.Li <rongqing.li@windriver.com>
> Date:   Fri Jul 19 10:19:25 2013 +0800
>=20
>     Upgrade vsftpd to 3.0.0
>    =20
>       (original commit: 441502b68d03a4ce7796436a53c5e95399724ad2)
>    =20
>     Upgrade vsftpd to 3.0.0 with below modification:
>     1. more strict access limitation, like: do not allow anonymous access
>     2. use vsftpd.ftpusers and vsftpd.user_list to confine user access
>     3. enable pam if DISTRO_FEATURE includes pam
>     4. enable tcp-wrapper
>     5. install vsftpd.conf with 0600 permission, not 0755
>    =20
>     Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>     Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
>=20
> Where 441502b6... is the commit in meta-oe from Roy that happens to
> upgrade vsftpd.
>=20
> FWIW, I don't anticipate doing anything destructive like this again.
>=20
> --=20
> -Joe MacDonald.
> :wq



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHu5mkACgkQN1Ujt2V2gBz69ACfQlnxLckPAD+G2ArHKUYRrt2o
CboAnjyB7LJmo99xPWZysqSzvVg0uSXr
=I07Z
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
