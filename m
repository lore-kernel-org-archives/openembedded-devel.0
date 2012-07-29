Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SvTV6-0005pw-Rs
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Jul 2012 15:25:40 +0200
Received: by wgbds1 with SMTP id ds1so1767563wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jul 2012 06:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VLyQT7eHfUBQy7iGQshD+1jqZCUDPkuoBiXrTYSkw8M=;
	b=Q2B5fHC55BpkmdAG6CVulPU6esdieGriQwe3tNYRViOfDOaUWM8W9+spjS8UidvaLD
	NLhnwLktNiRyqmq0V87sAi9BMer+elzdcvjPILgaIW1KfXmQWRVBjKELCv6K5DE7af+H
	LhQj+U9SQCTouVFqF7+Dve4Gsg7z9vjc4viDfjoTGYK4RZyYbPbwnmr3/H04YUPzW1kl
	5zMnEE/r8GveR8baDnmt7h8QbuuMAWAgxu+ijHanNQoKvrmUZW/jU6GvCE3a2aP5iQ8/
	hV1ktlcdL0E5IyMKrx62nXsXxXuceuh57VMKzWYoH25orX0kHv5YYkKJVFDjwaxBf8yH
	Kb/A==
Received: by 10.180.94.226 with SMTP id df2mr24725348wib.16.1343567646419;
	Sun, 29 Jul 2012 06:14:06 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id eu4sm10495706wib.2.2012.07.29.06.14.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Jul 2012 06:14:05 -0700 (PDT)
Date: Sun, 29 Jul 2012 15:13:59 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120729131359.GF3261@jama.jama.net>
References: <1343515918-20671-1-git-send-email-raj.khem@gmail.com>
	<1343515918-20671-2-git-send-email-raj.khem@gmail.com>
	<CAP9ODKrX04zfu_wVg317WPgc=u38niLtjmfkBiNrzfkTgBCbeA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKrX04zfu_wVg317WPgc=u38niLtjmfkBiNrzfkTgBCbeA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-systemd][PATCH 2/2] busybox: stopping systemd-kmsg-syslogd is not needed
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
X-List-Received-Date: Sun, 29 Jul 2012 13:25:40 -0000
X-Groupsio-MsgNum: 39914
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Il7n/DHsA0sMLmDu"
Content-Disposition: inline

--Il7n/DHsA0sMLmDu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 29, 2012 at 10:10:48AM -0300, Otavio Salvador wrote:
> On Sat, Jul 28, 2012 at 7:51 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > systemd-kmsg-syslogd.service is discontinued in systemd so
> > there is no need to stop it.
>=20
> I don't see a relationship in above description :-)
>=20
> Or we drop it completely or it needs to be stoped ;-)

It's not installed by current systemd, so busybox-syslogd-systemd is
failing (to start/stop) because it's trying to stop it.

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Il7n/DHsA0sMLmDu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAVNxcACgkQN1Ujt2V2gBzmuwCffFdwz+fI1ofDkDbP+Lt6D5y7
cVgAn27mqI+k1FDatfPPKhio0+gLOKo7
=aGjV
-----END PGP SIGNATURE-----

--Il7n/DHsA0sMLmDu--
