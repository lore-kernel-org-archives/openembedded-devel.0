Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1B84173AD0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2015 12:38:27 +0000 (UTC)
Received: by wggx12 with SMTP id x12so8862940wgg.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2015 05:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cO8QxLqeqFbSzJ3f5c96rlwQYH2oIWI9HftgS9h30OY=;
	b=yZJfUFbqqOA82m0130sbFfbiaqgZ+UCr+cW5j9QwPSBAPiJn3VfqlE6WDT7jUs71T2
	aMuJJBqkWFsFm4C6EOdHTxLJWEnvEFXqxzH2sa814MFwJCriOrASZNPb/AJyAYl4uQ3x
	rgxDFAxACtSUWgPdcHw3tVdcdgi9sZBcHPGCvNhlwS23vBucUVJzZyIZccfIRFtEc54C
	JWlsvVl6hJr5AIkF+wdw+xVN6b48DVmWfjx9+Y/yfUcwRC2Q8fRQL6Au4sQQcKDsbXb0
	/Uv569r9CEqbzTHvjTNZRNISu974HQ/Ku90kj0TUp7MYliMOEX21vscgZGxon3IMuCiy
	zxXg==
X-Received: by 10.180.79.1 with SMTP id f1mr9271913wix.24.1426077506941;
	Wed, 11 Mar 2015 05:38:26 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dj4sm5291676wjc.13.2015.03.11.05.38.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Mar 2015 05:38:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 11 Mar 2015 13:39:02 +0100
To: Joe MacDonald <Joe_MacDonald@mentor.com>
Message-ID: <20150311123902.GA6713@jama>
References: <EC21369A6993DD47985E1CBF1038266E263DC619@NA-MBX-04.mgc.mentorg.com>
	<20150310222718.GB4083@mentor.com>
MIME-Version: 1.0
In-Reply-To: <20150310222718.GB4083@mentor.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-networking pending patches
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
X-List-Received-Date: Wed, 11 Mar 2015 12:38:28 -0000
X-Groupsio-MsgNum: 54740
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline

--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2015 at 06:27:18PM -0400, Joe MacDonald wrote:
> [Re: [oe] meta-networking pending patches] On 15.03.10 (Tue 13:44) MacDon=
ald, Joe wrote:
>=20
> > Sure thing. I'll have a look today and update the status appropriately.
> >=20
> > -J.
> >=20
> > On 10 Mar 2015 06:30, Martin Jansa <martin.jansa@gmail.com> wrote:
> > Hi Joe,
> >=20
> > can you please check pending meta-networking patches?
> >=20
> > my master-next shows:
> > pick e7be331 openl2tp: add new recipe
>=20
> This has already been merged (ab75a8c8d0a57411af1452f9f8f41ccf29bb0cc7)
> and I don't see it in my patchworks list now.  The filter I'm using is
> this:
>=20
> http://patchwork.openembedded.org/project/oe/list/?state=3D1&q=3Dmeta-net=
working&archive=3Dboth

OK, master-next version was adding it to recipes-daemons instead of
recipes-protocols, that's why it wasn't resolved when rebasing
master-next. Will drop it now from master-next.

Please use meta-networking bundle as filter as well:
http://patchwork.openembedded.org/bundle/jama/meta-networking/?archive=3Dbo=
th
http://www.openembedded.org/wiki/Patchwork#Multiple_layers_sharing_the_same=
_oe_project_on_patchwork

> > pick 64461e1 ipvsadm: Add version 1.26 (initial recipe)
>=20
> I placed this one in 'rework' state on January 26th after requesting a
> clarification on the bash requirement and suggesting at least one of the
> patches be tweaked.
>=20
> http://article.gmane.org/gmane.comp.handhelds.openembedded/67476
>=20
> I haven't seen a follow-up on it, but it looks like master-next has the
> v3 that I commented on.

OK

> > pick f5ba5af netkit-telnet: add new recipe
>=20
> It looks like this was merged (56e58865851a3160c49d9929011a0eccc9b0c8e2)
> and I'm not seeing it in my filter.

again master-next version had it in different directory
recipes-daemons and merged version is recipes-netkit, will drop it from
master-next.

> > pick 1e6dd99 iscsi-initiator-utils: fix SELinux label for initiatorname=
=2Eiscsi
>=20
> This was dropped in favour of the version going to meta-selinux.  I
> updated patchworks to indicate it was being reworked a while back.

OK, dropping from master-next.

> > pick 8a09ac6 vlan: install vconfig into /sbin same as Ubuntu and Fedora.
>=20
> I've merged this today.

thanks

> > pick 6fdadbe stunnel: Update to version 5.10
>=20
> This got missed in my regular filter for obvious reasons.  I've merged
> it as well.

thanks

> > pick e74b325 postfix: add link file /usr/lib/sendmail
> > pick 64de50c wireshark: update to 12.4
> > pick 4428a44 crda: move libnl, libgcrypt to DEPENDS
> > pick 5cd9417 esmtp: update sendmail link files
>=20
> These were already in my queue but I've dumped them in favour of the
> cherry-picks.

thanks

> > and few more are in patchwork:
> > http://patchwork.openembedded.org/bundle/jama/meta-networking/?archive=
=3Dboth
>=20
> The others in this list also look like they were missed because they
> didn't contain the meta-networking tag in the subject line.  Are you
> manually creating that bundle or do you just have better filtering
> technology than I do for catching these oddball ones?

I'm maintaining all bundles manually

First I add to bundles based on e-mail prefix, but then when I'm reading
the commits for cherry-picking them to master-next I sometimes notice
that the patch is touching some layer without saying so in subject
prefix and I add these oddball onces to separate bundle just before
cherry-pick.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUAN2YACgkQN1Ujt2V2gBwqOwCfbVyPv6HRbkfDnqZyZU/Xp0Ga
El4AnjIIN8PbAOMFQuOIhUWlWPCA6yGS
=IY1C
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
