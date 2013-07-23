Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 125CE6A59C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2013 21:53:11 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id y10so8697478pdj.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2013 14:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=+D5erKSdXdeZJ1+e177zk9DsoiRvjcBRPgMIs2J8RL4=;
	b=rtBHEWbOj0ORllgrm/q5AX8frkZA4V8NEj9Np3sD39NvpEV0IifXOIsTlQ1nvRT4VD
	PYAh7Hb79gjwPmWwEeCcuEfluT/4n2tONIz2pq0oQD651VJ+xkU4E9pEdHuci14LyXDN
	gEcQyl5iMVJibVEFyMOToyLCbHX++9FojZiUAeniAoSbjfpckCRJZRsIbvWVZ6yMX2YV
	OzmAT/4n92orkyckuWZUjZIuRP+6tNUs9Wrg5DoOylfIAA+8NW9+w4TsULbz7PA6EOa3
	0RgMlN/vVtsHyRgrkWPCi9q6mM1Fplu56mF8fpQk5ZhtojOcjE+bLWdVfuCnKZQpMeU7
	JgsQ==
X-Received: by 10.68.103.131 with SMTP id fw3mr38773473pbb.65.1374616391648;
	Tue, 23 Jul 2013 14:53:11 -0700 (PDT)
Received: from ddeviny-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	qb15sm47339648pab.13.2013.07.23.14.53.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 23 Jul 2013 14:53:10 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20130723175159.GF3643@windriver.com>
Date: Tue, 23 Jul 2013 14:53:09 -0700
Message-Id: <5440164E-A494-4C7B-AE0D-1A411C699EBC@gmail.com>
References: <20130723175159.GF3643@windriver.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1508)
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
X-List-Received-Date: Tue, 23 Jul 2013 21:53:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jul 23, 2013, at 10:51 AM, Joe MacDonald =
<Joe.MacDonald@windriver.com> wrote:

>=20
>   If you are only using meta-networking from meta-openembedded, you
>   need read no further.  This is only for people using my side-project
>   on github.  Absolutely nothing has changed in the official
>   meta-networking.
>=20
>=20
>=20
> For anyone using the standalone meta-networking subtree I maintain on
> github,


whats the advantage of doing so ?
you could still checkout the repository and just use meta-networking =
layer
how is above different.=20

We should be careful since in layer universe, this can easily escalate =
confusion


> please be aware that I've made a change to the way I create the
> subtree which, unfortunately, will result in a forced update for all =
of
> your branches.  And probably a merge on whatever branch you happen to =
be
> on already (eg. master).  If you get into that scenario, I suggest
> pushing your current branch with the merge in it off a cliff and
> re-creating the current branch tracking the up-stream.  If you're not =
in
> the habit of doing a git-pull, though, this will probably be cleaner:
>=20
>   % git fetch --all --tags ; git rebase origin/<up-stream-branch-name
>=20
> The reason for this (and the advantage) has been in response to =
requests
> I've had to preserve the original (that is, meta-oe) commit hash so it
> is easy to connect a commit in the standalone meta-networking with the
> official meta-networking I maintain as a part of the larger meta-oe.
> The change is small and hopefully self-explanatory, but I won't let =
that stop
> me.
>=20
> Before:
>=20
> commit a0f9363caddbfb92212b4bf5d4a2590c451b7cef
> Author: Roy.Li <rongqing.li@windriver.com>
> Date:   Fri Jul 19 10:19:25 2013 +0800
>=20
>    Upgrade vsftpd to 3.0.0
>=20
>    Upgrade vsftpd to 3.0.0 with below modification:
>    1. more strict access limitation, like: do not allow anonymous =
access
>    2. use vsftpd.ftpusers and vsftpd.user_list to confine user access
>    3. enable pam if DISTRO_FEATURE includes pam
>    4. enable tcp-wrapper
>    5. install vsftpd.conf with 0600 permission, not 0755
>=20
>    Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>    Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
>=20
> After:
>=20
> commit b188e402a04db35424e22cb2b2100b7070648948
> Author: Roy.Li <rongqing.li@windriver.com>
> Date:   Fri Jul 19 10:19:25 2013 +0800
>=20
>    Upgrade vsftpd to 3.0.0
>=20
>      (original commit: 441502b68d03a4ce7796436a53c5e95399724ad2)
>=20
>    Upgrade vsftpd to 3.0.0 with below modification:
>    1. more strict access limitation, like: do not allow anonymous =
access
>    2. use vsftpd.ftpusers and vsftpd.user_list to confine user access
>    3. enable pam if DISTRO_FEATURE includes pam
>    4. enable tcp-wrapper
>    5. install vsftpd.conf with 0600 permission, not 0755
>=20
>    Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>    Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
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


