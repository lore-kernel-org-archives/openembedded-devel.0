Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 166F3755F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 11:11:25 +0000 (UTC)
Received: by wmll128 with SMTP id l128so22739925wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 04:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Z4KLlRe6Cl1WuM7Pu5tWPiQ5Rlo1cOld8T0plrLqG7o=;
	b=bERXswoUQB0+GWBXFQiWVfwtgcnPeHv2YOOZVpMvPj7ZwTpj1TlEFDOvJn6OrMj1tP
	eEZVYlulS5LgtCVn8smnot8Fwu6IOpnxn3xzoOPP2b1mzYEQqIlaiD1op8udUv0asaNM
	omMa8AvbKXSLuZAb1TFBTnSdsTX277JWXxAtbAaZrBplcfktbt8HM2UA6INXoiHbpPRw
	N9453wXpmYZ6Nz8MaTagHf+SeA6cvulr1h69kA561oz2+kbuD6UzvdR5R4RU3a93Y7r/
	qfmct78q0pr29Vcw4e0vvQvJlT6xTx/GqwnSLVZYuhZO+q/b2nCJD0GfEApV7CaOZVCG
	Beng==
X-Received: by 10.28.140.213 with SMTP id o204mr6508495wmd.12.1446117084956;
	Thu, 29 Oct 2015 04:11:24 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ka10sm1234767wjc.30.2015.10.29.04.11.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Oct 2015 04:11:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 29 Oct 2015 12:11:52 +0100
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Message-ID: <20151029111152.GA2564@jama>
References: <1445594855-39110-1-git-send-email-zhiquan.li@windriver.com>
	<1445594855-39110-2-git-send-email-zhiquan.li@windriver.com>
	<20151026124914.2854e87e@adi-pc-linux>
	<689881552969744788D482C9A8FAED214EBAA9@ALA-MBB.corp.ad.wrs.com>
	<20151027124927.448d2c15@adi-pc-linux>
	<56317960.6030108@windriver.com>
	<20151029110402.76ae98c8@adi-pc-linux>
MIME-Version: 1.0
In-Reply-To: <20151029110402.76ae98c8@adi-pc-linux>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/1] snort: fix m4 causes out of memory during configure [ LIN8-299 ]
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
X-List-Received-Date: Thu, 29 Oct 2015 11:11:27 -0000
X-Groupsio-MsgNum: 58138
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Content-Disposition: inline

--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2015 at 11:04:02AM +0200, Ioan-Adrian Ratiu wrote:
> On Thu, 29 Oct 2015 09:41:52 +0800
> Zhiquan Li <zhiquan.li@windriver.com> wrote:
>=20
> >=20
> >=20
> > On 2015.10.27 18:49, Ioan-Adrian Ratiu wrote:
> > > On Tue, 27 Oct 2015 09:54:07 +0000
> > > "Li, Zhiquan" <Zhiquan.Li@windriver.com> wrote:
> > >
> > >> I need to evaluate the possibility to upgrade the snort recipe to
> > >> >2.9.7, because upgrade to > 2.9.7, some patches will not work
> > >> >anymore and the daq recipe also need to be upgraded to 2.0.4 at
> > >> >least. The side-effect is uncertainty.
> > >>
> > > What exactly do you mean by "patches will not work anymore"?.
> > > Do you mean thy do not apply on >2.9.7? AFAIK two of those
> > > patches are not needed in 2.9.7.6 (fixed upstream), the others
> > > just need refreshing.
> > I've tried to upgrade snort from 2.9.6.0 to 2.9.7.5, as its
> > dependency I also upgrade daq recipe from 2.0.2 to 2.0.6, and
> > accordingly update the patches:
> > * add 2 new patches for snort to solve the cross compile issues.
> > * discard a snort patch since it is not needed.
> > * refresh the patch for daq new version.
> > Please see the attachment for the changes.
> >=20
> > Unfortunately , it was failed when packaging debug files, the rpm=20
> > debugedit complain: canonicalization unexpectedly shrank by one
> > character. At a glance it is a bug of debugedit, please see:=20
> > http://sourceforge.net/p/snort/mailman/message/34130268/
> > Redhat hasn't resolved this bug:=20
> > https://bugzilla.redhat.com/show_bug.cgi?id=3D304121
> >=20
> > So, the options are:
> > * Fix rpm debugedit bug and update it to OE
> > * Take the workaround that skip the snort debug package
> > * Backport the fix from snort upstream
> >=20
>=20
> IMO anything rpm-based is fundamentally broken and not worth fixing
> because of these kind of long-standing bugs. You spend tons of time
> fixing one, then just hit another that was also ignored for +8 years.
>=20
> I don't think we should skip the debug package entirely because ipks
> and debs should be fine. If it is possible to skip only rpm-debug pkgs
> then this would be the best way to go IMO.
>=20
> Not upgrading the package and backporting fixes only to avoid this rpm
> bug should be the last option.
>=20
> @Martin and @Khem, do you have any suggestions?

I've already merged this change to master-next and I plan to merge it to
master and jethro soon (when jenkins builds are finished).

It's good incremental step (fixes the root cause why it was
blacklisted), upgrade to newer version is also good, but can be separate
and only for master branch (as jethro is almost closed now).

"canonicalization unexpectedly shrank by one character" is something we
have to fix from time to time, but it's always doable in the component
source (usually double slash in one of the paths), so it's not 8+ years
kind of issue.

Regards,

--DocE+STaALJfprDB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYx/vcACgkQN1Ujt2V2gBz22wCgpI5AKgvKsE1xMsKmQBtWXO14
O5oAoLjUzEuOyB9fkF3SD3js7zYMR5Yv
=TR/i
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--
