Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id B7969609B2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2015 14:11:29 +0000 (UTC)
Received: by wghq2 with SMTP id q2so87065713wgh.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2015 07:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oFRyDp9mx88kuw3SSBXEqzuHISvew24PAiZZNtx57Tk=;
	b=IiWtWoQds4gvvXi7q8l3OyuT7cHG3LWZ74K947RHDlL+NS6Fnzx/kcfUMx/YJbQG/E
	TiampMOWSyZrVJyzP3+u0PR0rrFAAf1BV+2qaYlyWbyaOVch/buiqcuCG0qWZbEos5wo
	MDyn/TQGHqi4SECYQVo0Hje1iPV0E8ulFEMbuTAu78pRczUVvHC4pAg2vPk524K/fzzF
	lL3xerjQtPUu7D4mB4Bh/J980tYaqFAfnKf9OMWZKNUA+LcKz+qFuIfb1+TfbhUMjyL8
	ZfnCK4BzLHvm3wjbibIfsLUEspEQkiZBhWXfeEedvCiKFOUZHrme+g8nQvdVzpusorPy
	TkGg==
X-Received: by 10.180.101.3 with SMTP id fc3mr6635074wib.47.1432217489177;
	Thu, 21 May 2015 07:11:29 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id ny7sm3068124wic.11.2015.05.21.07.11.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 May 2015 07:11:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 21 May 2015 16:11:44 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150521141144.GG2377@jama>
References: <1431958369-14668-1-git-send-email-alexander.kanavin@linux.intel.com>
	<20150521110638.GB2377@jama> <555DDEB7.7040909@linux.intel.com>
	<20150521134835.GF2377@jama> <555DE57B.1050706@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <555DE57B.1050706@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 0/4] Add GStreamer 0.10 and things that depend on it from oe-core
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
X-List-Received-Date: Thu, 21 May 2015 14:11:32 -0000
X-Groupsio-MsgNum: 55584
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline

--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2015 at 05:02:35PM +0300, Alexander Kanavin wrote:
> On 05/21/2015 04:48 PM, Martin Jansa wrote:
> > No you don't need to copy it, just use path to it, I've already fixed=
=20
> > it for my jenkins builds, you don't need to resend just because of this=
=2E.
>=20
> I wanted to send an updated set, because also this recipe requires a=20
> file with a path, so that will break after the directory rename (to=20
> gstreamer-0.10) patch is applied:

Are you going to rename gstreamer to gstreamer-0.10 in oe-core? I don't
think so or I misunderstood what you meant, these 2 lines look correct
to me:
$ git grep gst-plugins-package.inc
meta-multimedia/recipes-multimedia/gstreamer/gst-plugins.inc:require recipe=
s-multimedia/gstreamer/gst-plugins-package.inc
meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:require re=
cipes-multimedia/gstreamer/gst-plugins-package.inc

and renaming the directory in meta-multimedia doesn't have any impact on
this.

> gst-plugins-gl_0.10.3.bb:require=20
> recipes-multimedia/gstreamer/gst-plugins.inc
>=20
>=20
> Here the path should be removed instead.
>=20
>=20
> Alex
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlVd56AACgkQN1Ujt2V2gBzX+QCePMuS/E8H2Usg7JBTWcaEYcKO
iE8AoLIv/RDN64qByHDWgejALef3701g
=Bqcr
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--
