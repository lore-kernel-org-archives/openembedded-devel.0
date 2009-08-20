Received: from [209.85.220.224] (helo=mail-fx0-f224.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Me4uH-0007zz-HL
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 12:30:09 +0200
Received: by fxm24 with SMTP id 24so2622801fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2009 03:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:resent-from:resent-date
	:resent-message-id:resent-to:date:from:to:subject:message-id
	:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=3utB7GUpGM5Ij2qKEG525XdAr+R8c4gp4GZfiY6ZqPE=;
	b=CBkV8nNwzYrMZiMAEiGPyORfN3RIAKzSMn81gA5QKcTo2a4xJTuM1RttxUdHSiSqxI
	6fBUtmFXF8yPjKqaQytrDmuh4yF4sGSOJ7OLa1Gi6vY6MD2DmKHH8fOMyjgIQQdeOlgI
	nd0FjtNJKnU9XpPNU22o/sAK4yDRMruFpa+hs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=resent-from:resent-date:resent-message-id:resent-to:date:from:to
	:subject:message-id:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	b=PRCDO0sBnnsQ88DNAgIsBdLuIGtzR78r1tBIpnoBM7YRRX2zv1NcExQHehhC01IkxQ
	uddgJTHT8AJV31mzpJ3hAt3+Gq3fgOpiV68Y1QVbNYVOIdv0fnMCNlrFbG4WNTD2qgVe
	q3fLAdd4KsFbNIv6xBm6G0F6GS/wKegC1tPO4=
Received: by 10.102.245.35 with SMTP id s35mr2970418muh.124.1250763170902;
	Thu, 20 Aug 2009 03:12:50 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id g1sm4069595muf.46.2009.08.20.03.12.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 20 Aug 2009 03:12:50 -0700 (PDT)
Resent-From: Martin Jansa <Martin.Jansa@gmail.com>
Resent-Date: Thu, 20 Aug 2009 12:12:46 +0200
Resent-Message-ID: <20090820101246.GB16618@jama>
Resent-To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Aug 2009 11:46:42 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090820094642.GA16618@jama>
References: <20090820032802.GA32010@denix.org>
	<200908200752.58210.holger+oe@freyther.de>
	<20090820071052.GA459@denix.org> <h6j1rj$nvf$1@ger.gmane.org>
	<20090820090136.GD459@denix.org>
MIME-Version: 1.0
In-Reply-To: <20090820090136.GD459@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Use AUTOREV and have revision/commit number in package name?
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
X-List-Received-Date: Thu, 20 Aug 2009 10:30:10 -0000
X-Groupsio-MsgNum: 12627
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline

--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2009 at 05:01:36AM -0400, Denys Dmytriyenko wrote:
> On Thu, Aug 20, 2009 at 10:34:58AM +0200, Koen Kooi wrote:
> > On 20-08-09 09:10, Denys Dmytriyenko wrote:
> >> On Thu, Aug 20, 2009 at 07:52:58AM +0200, Holger Hans Peter Freyther=
=20
> >> wrote:
> >>> On Thursday 20 August 2009 05:28:02 Denys Dmytriyenko wrote:
> >>>> Now, when SRCREV =3D "${AUTOREV}", AUTOREV gets resolved into a Pyth=
on
> >>>> function, which does the magic of fetching the latest snapshot from a
> >>>> repository. But now if PV contains references to SRCREV, it breaks
> >>>> (undesrandably), since SRCREV gets resolved in do_fetch and PV needs=
 to=20
> >>>> be
> >>>> resolved early on.
> >>>>
> >>>> Are there any standard ways to work around this limitation?
> >>>
> >>> Check the mailinglist archives... Openmoko has deployed a solution th=
at=20
> >>> has
> >>> fixed that about 1 1/2 years ago.
> >>>
> >>> Short answer:
> >>> 	- Do not put SRCREV into PV, e.g. create a new var called SRCPV
> >>> 	- Populate SRCPV with something based on the SRCREV..
> >>
> >> Ah, thanks! I was able to find your RFC message from last year on the=
=20
> >> Openmoko
> >> mailing list:
> >> http://markmail.org/message/v3s32gmxxqcaxpph
> >>
> >> I'll give it a try. Thanks.
> >>
> >> To be clear - it's not used in OE. While there is a single=20
> >> python-phoneutils
> >> recipe, which references SRCPV, it is not being set anywhere,=20
> >> apparently...
> >
> > Take a look at=20
> > http://cgit.openembedded.org/cgit.cgi/openembedded/log/?h=3Dxora/angstr=
om-srcpv=20
> > :)
>=20
> Thanks! More specifically:
>=20
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?h=3Dxora/angst=
rom-srcpv&id=3D453a13c7a68087895f4048410aba1a519ec99897
>=20
> Any ETA for the merge back to .dev? :)

Just out of my curiosity:

How are PREFERRED_VERSION_pkg supposed to work when I prefer pkg with
autoreved revision.

bbfile will be named like pkg_git.bb
inside will be PV=3D"1.0.0+gitr${SRCPV}" and DEFAULT_PREFERENCE=3D-1

I would like to force using this _git version even when there will be
pkg_1.1.0.bb with PV=3D"1.1.0"

For fixed revision ie from sane-srcrevs i can bump PREFERRED_VERSION_pkg
with every revision bump in sane-srcrevs, but it also suboptimal :/.

With autorev I cannot set PREFERRED_VERSION_pkg at all, if I understand
it right, because I never know which string will be in ${SRCPV} and
using just PREFERRED_VERSION_pkg=3D"1.0.0+git" or "git" ends with
"preferred version is not available". Setting PREFERRED_VERSION_pkg to
"1.0.0+gitr${SRCPV}" is not expanded and ends with a bit confusing=20
bitbake exception about SRC_URI not referencing some SCM.

I've asked on IRC and they said that its common practise to remove
PREFERRED_VERSION_pkg and adjust DEFAULT_PREFERENCE or blacklist all
other versions (like that with PV=3D"1.1.0").

Now I solved my problem with updating PV in recipies which weren't
preferred by bitbake to latest version from all available (moved to
PV=3D"1.1.0+gitr${SRCPV}" when pkg_1.1.0.bb is commited and removed
DEFAULT_PREFERENCE=3D-1.

Could it be solved better? Something like:
1) use .bb file with exact the same PV
2) use .bb file where PV starts with the same string as is in
PREFERRED_VERSION_pkg if exact is not found and print warning.

Regards

--=20
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr=20
JaMa                        =20

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iEYEARECAAYFAkqNG4IACgkQN1Ujt2V2gBxkAgCfez2kep8rvHfQJ0eR52Ak0yoL
pU4AnR5QDgcmHPc2KdqZhWDXMnfMB6OC
=wzFk
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
