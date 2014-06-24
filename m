Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8FFA160E24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jun 2014 00:02:55 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id y10so7133821wgg.17
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 17:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YnRwEInLfDMPCvtLpsdGrTYkG7aqR3vfPkbH0mUttcw=;
	b=hHXvqVUJgr4+hg+Xw2TX58OZwpm7/CHNsPbHtsBd67l0v+tKserFHtBROCRqDJ9ARg
	cva+1ANdHoLqqDbQBnvR+z5WmGZ0Uu2sfeFDTFEW9rIUaEgyhxGuAtph0X9wfugusGQZ
	2loHLO2yWwrRMpyhv52zwg3KfsTv4+DR/8mzE1NTASnGKodWr+/+X7raPfV6MXeDCS//
	wi40svrjjZISDe6SbIwNiWuM8Jc5JAOPp3wvP+047J/xzVy03L3mXx0zdaw5IRKo/ClM
	u4MCq3dnkidc8VrbPDrt9iUKQ6tPHIN2N7SRASpXq1ihm/sJkAMsktOBK2dto5WQRPcj
	V8TQ==
X-Received: by 10.194.238.231 with SMTP id vn7mr569wjc.99.1403568176386;
	Mon, 23 Jun 2014 17:02:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	i6sm37884774wiy.17.2014.06.23.17.02.55 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jun 2014 17:02:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 24 Jun 2014 02:02:57 +0200
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Message-ID: <20140624000257.GL2437@jama>
References: <CAOd_LFwu0hwLcU1+oAvK9TVtsbbawDhRqd=1wafXfOKOWw5T+g@mail.gmail.com>
	<20140620160431.GY2117@jama>
	<CAOd_LFznwZYR68XeXKCcDoQyijih7TakvwnQreRSWPss460hZQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOd_LFznwZYR68XeXKCcDoQyijih7TakvwnQreRSWPss460hZQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][daisy] pull request, update README's, live555 fix
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
X-List-Received-Date: Tue, 24 Jun 2014 00:03:02 -0000
X-Groupsio-MsgNum: 50544
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="S6vg04ofUPzW4qJg"
Content-Disposition: inline

--S6vg04ofUPzW4qJg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2014 at 04:33:13PM -0400, Cliff Brake wrote:
> On Fri, Jun 20, 2014 at 12:04 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > On Thu, Jun 19, 2014 at 07:52:51AM -0400, Cliff Brake wrote:
> >> The following changes since commit dca466c074c9a35bc0133e7e0d65cca0731=
e2acf:
> >>
> >>   python-efl: add dependency on python-dbus and lua to always build
> >> edje and elementary bindings (2014-05-12 10:08:28 +0200)
> >>
> >> are available in the git repository at:
> >>
> >>   https://github.com/cbrake/meta-openembedded.git daisy-to-merge
> >>
> >> for you to fetch changes up to f3f1d14a6587d72388f50725b0a49c84cf417eb=
9:
> >>
> >>   live555: fix fetch problem (2014-06-18 13:42:35 -0400)
> >
> > BTW: there is daisy bundle on patchwork:
> > http://patchwork.openembedded.org/bundle/jama/daisy/?archive=3Dboth
> >
> > When I notice some patch in queue marked as for daisy or requesting
> > backport in text I move it to bundle (and mark it as archived)
> >
> > Would be great if one of you keeps an eye on this bundle and sort the
> > patches there (they usually aren't marked as applied automatically and
> > you need to do it manually).
>=20
> I will try to watch this.
>=20
> I was able to mark my merge request in this bundle as applied, but the
> other two it does not seem like I can edit in patchwork.  (Still
> figuring out patchwork flow ...)

Not your fault, you need to get some super cow (powers) in order to change
state of other people patches.

Khem: Can you please make Cliff maintainer on oe/patchwork? Thanks

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--S6vg04ofUPzW4qJg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOowDEACgkQN1Ujt2V2gBzWaQCeM0PM1Oc1kUaPNGcAyrJwYM/1
QuoAn2z9GMxl/MTiGAEgU2GzZOQhTUNz
=X88U
-----END PGP SIGNATURE-----

--S6vg04ofUPzW4qJg--
