Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 25788724DC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Apr 2015 11:18:33 +0000 (UTC)
Received: by wiaa2 with SMTP id a2so54161403wia.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Apr 2015 04:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=g6C7YL/SAjKufRaJHoRQIDrD9Kxr1HSrYEG9nQ0XmNg=;
	b=XGKI0OPba77hf7ylTdpyKXCTAk/vjsrHgOIz0GbydUhWn+5PPN0F2Oa7CI2NexcnYz
	af80cAOaDQAJcBFZwwCNlEow7pE73m9k+93XKEMpvFs7jLJ5fOA9nwgYOqrMJJ31Kwgl
	iRBOxozpp0GBiIo75PGInZTjz1l19USXWlriwppkUhtDaUvN5vSbkOu3VW1Nizoj5M2k
	d7h8699kwkt+s7lTpEmoFxTiXqpcTjsNVTGVMZbZ+ASf9YM6FGIJbzNaQ1JU558n9S2k
	Q5tlD6dbGMZjMMvyFe7Bb3Aq0RwkEjYvX7R3B7e9TCFOwj2QB6gP9DE+4Vf5KsVDjqL2
	/JIA==
X-Received: by 10.194.9.161 with SMTP id a1mr43325426wjb.39.1428491914691;
	Wed, 08 Apr 2015 04:18:34 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	ln8sm15159410wjc.18.2015.04.08.04.18.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Apr 2015 04:18:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 8 Apr 2015 13:18:36 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150408111836.GB2337@jama>
References: <1428070608-23355-1-git-send-email-cristian.iorga@intel.com>
	<20150403174528.GO14928@jama>
	<969F26A8BAB325438E7EB80D3C3134FB2F4944B9@irsmsx105.ger.corp.intel.com>
	<20150407105704.GB2340@jama>
	<969F26A8BAB325438E7EB80D3C3134FB2F497519@irsmsx105.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB2F497519@irsmsx105.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] bluez collection: add (moved from oe-core)
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
X-List-Received-Date: Wed, 08 Apr 2015 11:18:34 -0000
X-Groupsio-MsgNum: 55009
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QRj9sO5tAVLaXnSD"
Content-Disposition: inline

--QRj9sO5tAVLaXnSD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 08, 2015 at 11:05:57AM +0000, Iorga, Cristian wrote:
> Hi Martin,
>=20
> I have to ask...
> The patches (applying to bluez package) that are part of this submission,=
 also needs to be changed to a 4 spaces tab?

No, only the metadata (.bbclass, .bb, .inc, .conf) files are using 4
spaces, patches should follow whatever convention the component is
using.

> I do agree on the others, I am not sure if it would be ok to alter the or=
iginal patches.
> Also, I did not know the difference in policies of OE versus oe-core, sor=
ry, my fault.

See http://www.openembedded.org/wiki/Styleguide

Cheers,

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> Sent: Tuesday, April 7, 2015 1:57 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH] bluez collection: add (moved from oe-c=
ore)
>=20
> On Mon, Apr 06, 2015 at 07:21:49AM +0000, Iorga, Cristian wrote:
> > No, I intended to place it exactly where it is in the patch.
>=20
> Then improve the commit message and fix indentation (use 4 spaces instead=
 of tabs).
>=20
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org=20
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf=20
> > Of Martin Jansa
> > Sent: Friday, April 3, 2015 8:45 PM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe][PATCH] bluez collection: add (moved from=20
> > oe-core)
> >=20
> > On Fri, Apr 03, 2015 at 05:16:48PM +0300, Cristian Iorga wrote:
> > > BlueZ 4.x Bluetooth stack has been removed from oe-core.
> > > However, it is still supported, so add it to meta-oe networking layer.
> >=20
> > "meta-oe netwrorking layer" is very confusing, did you plan to put it i=
n meta-networking?
> >=20
> > > In order to use it in oe-core/poky/YP 'bluez4' needs to be added to=
=20
> > > distro features. 'bluetooth' distro feature needs to be present also.
> > >=20
> > > Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> > > ---
> > >  .../obsolete_automake_macros.patch                 | 14 +++++++
> > >  .../bluez/bluez-hcidump_2.5.bb                     | 22 +++++++++++
> > >  .../bluez/bluez4-4.101/bluetooth.conf              | 16 ++++++++
> > >  .../bluez/bluez4-4.101/fix-udev-paths.patch        | 37 ++++++++++++=
+++++
> > >  .../bluez/bluez4-4.101/install-test-script.patch   | 26 ++++++++++++
> > >  ...ork-fix-network-Connect-method-parameters.patch | 30 ++++++++++++=
++
> > >  .../bluez4-4.101/obsolete_automake_macros.patch    | 14 +++++++
> > >  .../bluez/bluez4-4.101/sbc_mmx.patch               | 24 +++++++++++
> > >  ...pygobject-instead-ofgobject-introspection.patch | 27 +++++++++++++
> > >  meta-oe/recipes-connectivity/bluez/bluez4.inc      | 46 ++++++++++++=
++++++++++
> > >  meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb | 46 ++++++++++++=
++++++++++
> > >  .../bluez/gst-plugin-bluetooth_4.101.bb            | 39 ++++++++++++=
++++++

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QRj9sO5tAVLaXnSD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUlDowACgkQN1Ujt2V2gBx68wCcD1rB3WoGEgOXSDTMlT1UZjFh
rj8AoI0EE7TcMq+a843rh9e+IrK1Sbuy
=Cv9R
-----END PGP SIGNATURE-----

--QRj9sO5tAVLaXnSD--
