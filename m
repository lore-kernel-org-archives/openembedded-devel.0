Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id E4AA9605F8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 15:44:43 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id z10so2865562ead.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 07:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6HdhBmPkNxj0gAH3J/sj8+jOB2wqvIICD5KVKI+Ql7Y=;
	b=DyKCy+49dutswy+8olQh8CBdQLmClexEURcWBLv2ouejMXmKLufzd1MIPRLHWvdPve
	uqWPgD3QiUow3xLz97/G4p5AzGQ84nCDJmxpH3MrNlKrjxfc1KA1gccOmUDoPrDfft8Y
	hjCdTO00OIbZA2RozD0bNg5G5RUnwjbhTQMs7Q4RP6e9/to8keHYvhf/NrSY02UpZM81
	RQ7DEV7Px9PrH7QCp11uqq7G8+9zUanB2D+9A1NIHLt3MDAfJeHlDR/fPIq1zPCo8IZH
	kcPoJb7UDzNJny2Trp06ZTDhcPArXZzCPDvNzuoBa2/ONcPdrvfCjlR3sYKL4T6h9ykm
	widw==
X-Received: by 10.14.103.67 with SMTP id e43mr24936081eeg.94.1393256683963;
	Mon, 24 Feb 2014 07:44:43 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l4sm30031031eeo.9.2014.02.24.07.44.40 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Feb 2014 07:44:42 -0800 (PST)
Date: Mon, 24 Feb 2014 16:44:37 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140224154437.GH26981@jama>
References: <1392916331-30391-1-git-send-email-denis@denix.org>
	<20140222080505.GK3854@jama>
	<CAP9ODKpHFfexkFfqFvQWZGiXmoZKcigmCJukizYh1hJkGWkgoQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpHFfexkFfqFvQWZGiXmoZKcigmCJukizYh1hJkGWkgoQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-qt5][PATCHv2] nativesdk-qtbase: do qmake replacement in ${D} instead of ${B}
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
X-List-Received-Date: Mon, 24 Feb 2014 15:44:44 -0000
X-Groupsio-MsgNum: 48311
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mYYhpFXgKVw71fwr"
Content-Disposition: inline

--mYYhpFXgKVw71fwr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2014 at 12:18:48PM -0300, Otavio Salvador wrote:
> Hello Martin,
>=20
> On Sat, Feb 22, 2014 at 5:05 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Thu, Feb 20, 2014 at 12:12:11PM -0500, Denys Dmytriyenko wrote:
> >> From: Denys Dmytriyenko <denys@ti.com>
> >>
> >> * This way we don't mangle ${B} and can repeat do_install if necessary=
=2E And
> >>   previously it would require running do_compile again to restore the =
proper
> >>   state of ${B}.
> >> * Need to bump PR, since do_compile isn't changing, but needs to re-ru=
n to
> >>   re-populate qmake-real binary.
> >>
> >> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >> ---
> >>  recipes-qt/qt5/nativesdk-qtbase.inc | 12 ++++++------
> >>  1 file changed, 6 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc b/recipes-qt/qt5/nati=
vesdk-qtbase.inc
> >> index fa44009..3cb9b0e 100644
> >> --- a/recipes-qt/qt5/nativesdk-qtbase.inc
> >> +++ b/recipes-qt/qt5/nativesdk-qtbase.inc
> >> @@ -10,6 +10,8 @@ require nativesdk-qt5.inc
> >>  # it's already included with newer oe-core, but include it here for d=
ylan
> >>  FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/qtbase:"
> >>
> >> +PR =3D "r1"
> >> +
> >
> > It's already merged, but please don't add new PRs, especially to .inc
> > files.
>=20
> As explained by Denys this is really need, in this case.  I agree it
> could have been put in the bb recipe though.

Sorry I've overlooked it in message.

with rm_work you wouldn't see this issue, but for cost of reexecuting
do_compile :)

> Denys, could you move this to the bb recipe? This avoids the PR to be
> kept when we update to newer version.

I can try to remember this and remove it when doing next upgrade to
5.2.2.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mYYhpFXgKVw71fwr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMLaOUACgkQN1Ujt2V2gBzT9ACfect2+ijtUr4Sv7Njv+TDWsYO
KUwAn3xhvcfVrkhslhk/nSspvrFwLdrx
=Ogb7
-----END PGP SIGNATURE-----

--mYYhpFXgKVw71fwr--
