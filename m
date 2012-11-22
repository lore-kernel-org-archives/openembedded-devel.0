Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TbYkZ-0001Pn-0I
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 16:31:35 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so3172439eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2012 07:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qBk3jIQ3jKi03lnX12mugZgohiyfqZFKcybNzyrevdU=;
	b=kxFBX4axlLIBeNsYXPdMXbfQe9JuBGC4+mqrXfm9dxCR6bG5k69F0h7NdUbi+7VAKx
	1h/oKCgCLDS9mzbXYO0hsLqbww4fq6Q62ZBBkLJ9NGM7qjyPMvsE/UjDxSKUq1b/Gv8i
	xcVxu7rvnM2fyLLpRCqLJWDbNvfr+uxYzfwjc38B9COKZZid81IaOapxflDx9kQ6Mi6R
	fUAUIrEhChrTowgH2oVH37oL6FcgJZRTbTdQ2JisOKDlqEU0nM70BfOzbLtxMr0l+dc6
	1g+MQJELDRr6MlbOCUgR9jwGWWrkefohAEyR+ZtMaKfDt3e8VVR7sniM/nYi1dhoP6rN
	/HOQ==
Received: by 10.14.184.134 with SMTP id s6mr2190889eem.43.1353597448539;
	Thu, 22 Nov 2012 07:17:28 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 46sm7514730eeg.4.2012.11.22.07.17.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Nov 2012 07:17:27 -0800 (PST)
Date: Thu, 22 Nov 2012 16:17:25 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121122151725.GG12637@jama.jama.net>
References: <50AE2633.1030006@nedap.com> <20121122133125.GC12637@jama.jama.net>
	<50AE2A59.4090802@nedap.com> <20121122135442.GD12637@jama.jama.net>
	<50AE37B9.3070406@nedap.com>
MIME-Version: 1.0
In-Reply-To: <50AE37B9.3070406@nedap.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: kernel image
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
X-List-Received-Date: Thu, 22 Nov 2012 15:31:35 -0000
X-Groupsio-MsgNum: 41648
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RdtFsg6OMqKngl0P"
Content-Disposition: inline

--RdtFsg6OMqKngl0P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 22, 2012 at 03:33:29PM +0100, Jaap de Jong wrote:
>=20
> On 11/22/2012 02:54 PM, Martin Jansa wrote:
> > On Thu, Nov 22, 2012 at 02:36:25PM +0100, Jaap de Jong wrote:
> >> On 11/22/2012 02:31 PM, Martin Jansa wrote:
> >>> On Thu, Nov 22, 2012 at 02:18:43PM +0100, Jaap de Jong wrote:
> >>>> Hi,
> >>>> does anyone know where the + (in
> >>>> kernel-2.6.35.14+_2.6.35-r14.6_mymachine.ipk) is added?
> >>>> It is added on my pc (running ubuntu); it is not added on my debian
> >>>> buildserver.
> >>> Check if you have oe-core 56fe5300
> >> I'm using oe-classic for this...
> > Then apply it in oe-classic kernel.bbclass or your recipe.
> >
> Stupid question probably.. Where can I find it?
> And one more: does it make sense that the '+' is added under ubuntu and=
=20
> that is absent on my buildserver?

http://git.openembedded.org/openembedded-core/commit/meta/classes/kernel.bb=
class?id=3D56fe5300ab5ab072c20acd03d7fc26e9cae4e652

Try to compare those 3 commands on both builders.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RdtFsg6OMqKngl0P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCuQgUACgkQN1Ujt2V2gBx3twCfSqKMz+F9oHzGj3vZKXH4bIwR
rrMAoJZP2VB5BTYh+87Lyqxf1jUPOZip
=K6VF
-----END PGP SIGNATURE-----

--RdtFsg6OMqKngl0P--
