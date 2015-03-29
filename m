Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id E5C8E73C0D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Mar 2015 22:40:00 +0000 (UTC)
Received: by wibgn9 with SMTP id gn9so101732120wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Mar 2015 15:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=t0jxQXC5up09GBSjP1QtEqprCzNCQ3+hV3kA0g0zkNc=;
	b=kz7yDZA9zPGbeR06QkPADCeJj9nKSPHzaPwQsNZZbc/+E6QYeHGbnpMdqrmCoOBn61
	d7RRLOkbcNcfUsn9p+eQCBsb+3JGhk8kJpeECxSdbL2QqI6oEoIFx/aUJuteV9WJoqCh
	VuhNMdux0dGZe8eWaBTCslUGsG44+zEVWWpCBJcXgjfgMrXu2muXxCC9GLwx/m6mPeBi
	nH8yRpt0SAijOyGs9KGkqdVWBas9YZqesowfL5SnziMy+8yjBGeNGSIrN7C24P+W+sAL
	sV27vVI1dardd0r2I5YdHn4ekor3emVQFubKk3WLBsCT6vk8aYlntdtswG0Xqm72xM2k
	XUGg==
X-Received: by 10.180.182.67 with SMTP id ec3mr16402215wic.32.1427668801190;
	Sun, 29 Mar 2015 15:40:01 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	pv2sm13000196wjc.33.2015.03.29.15.39.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Mar 2015 15:39:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 30 Mar 2015 00:40:22 +0200
To: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <20150329224021.GF2343@jama>
References: <1425449908-22847-1-git-send-email-wenzong.fan@windriver.com>
	<54F6CC88.8080402@opendreambox.org>
	<54F6D3AA.3010302@windriver.com>
	<54F6E640.1010903@opendreambox.org>
	<54F7B0BC.7010203@windriver.com>
	<55180D9F.3020604@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <55180D9F.3020604@opendreambox.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-oe] samba: disable services for sysvinit
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
X-List-Received-Date: Sun, 29 Mar 2015 22:40:01 -0000
X-Groupsio-MsgNum: 54894
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KlAEzMkarCnErv5Q"
Content-Disposition: inline

--KlAEzMkarCnErv5Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 29, 2015 at 04:35:11PM +0200, Andreas Oberritter wrote:
> Hi Martin,
>=20
> On 05.03.2015 02:26, wenzong fan wrote:
> > On 03/04/2015 07:02 PM, Andreas Oberritter wrote:
> >> On 04.03.2015 10:43, wenzong fan wrote:
> >>> On 03/04/2015 05:12 PM, Andreas Oberritter wrote:
> >>>> Dear Wenzong Fan,
> >>>>
> >>>> On 04.03.2015 07:18, wenzong.fan@windriver.com wrote:
> >>>>> From: Wenzong Fan <wenzong.fan@windriver.com>
> >>>>>
> >>>>> The smb, nmb, winbind services have been disabled for systemd system
> >>>>> by default, disable them for sysvinit as well.
> >>>>
> >>>> why would anybody install these services without the desire for using
> >>>> them? Did the patch disabling them for systemd get merged by mistake=
? I
> >>>> remember Paul objecting to it.
> >>>
> >>> The samba is not a common service that required by system, especially=
 in
> >>> some security environment, it should be configured correctly first -
> >>> This is why I incline to disable it by default.
> >>
> >> This doesn't convince me, as the line you're drawing between samba and
> >> other services seems to be chosen arbitrarily.
> >>
> >> "git grep INITSCRIPT_PARAMS.*disable" shows no results in both
> >> openembedded-core and meta-openembedded (dizzy). So samba will be the
> >> first and only service that's disabled by default and requires manual
> >> intervention by the user? Why don't you ship a safe configuration
> >> instead?
> >>
> >> As Paul stated, the distro is responsible for correct configuration.
> >> IMHO there's no reason to deviate from common behaviour just because
> >> samba seems to be less safe than any other network service in your vie=
w.
> >>
> >=20
> > Ok, thanks for your advises, I agree with you.
> >=20
> > Please maintainer ignore my patch.
> >=20
> >>> Yes, it did - this may give me some hints that it should be disabled =
=2E..
> >>
> >> Unfortunately I don't understand what you're referring to here.
> >=20
> > Sorry for the confusion, it answered you second question about if "the
> > patch disabling them for systemd get merged by mistake?".
> >=20
> > Yes, the patch for systemd has been merged - It gives me hint that it's
> > a proper behavior for samba, but looks it isn't ...
> >=20
> > Please refer to the commit: 20a624928c030fa13d8b7d45b4f4d7e1ac624f60
> >=20
> > It should be reverted now!
>=20
> You applied this patch to jansa/master. Would you mind reverting
> 20a624928c030fa13d8b7d45b4f4d7e1ac624f60 instead, as discussed in this
> thread?

It was applied there before this discussion started and I wasn't planing
to merge it before seeing some conclusion from this.

But you're right, I've moved it to jansa/master-next-unresolved-review
branch to make it more obvious and I've added revert of 20a624 to
master-next.

Thanks,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KlAEzMkarCnErv5Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUYf1UACgkQN1Ujt2V2gBxnHwCeKkDbh9cpdauR+tuRAQnLuY5f
PzQAoLHfsU6YugnlFKGGTGdAb3jNHX7n
=aOXr
-----END PGP SIGNATURE-----

--KlAEzMkarCnErv5Q--
