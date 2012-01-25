Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rpy11-0006xa-Ok
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 09:15:35 +0100
Received: by eekd41 with SMTP id d41so1595196eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 00:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6b4v663652uc/W20VTm0IpPLEG0HfBk2cN3fg7MOsYU=;
	b=ZNBVnkszz6+G7TcczyNzkUpfhwoRJARFip59/blp8xa4oXunmZkSGK/MXmHlPO9xX1
	6xCFzuTSL6uutOp4Kro6vfKt3EBnVA5ntmyckXE5wyfv7F1I2OTnV4pmmB/B4RgD82l7
	sRO9ydW4K4O5qsy34XpLCE0KSUi660QDABpjg=
Received: by 10.14.16.129 with SMTP id h1mr5780443eeh.46.1327478868580;
	Wed, 25 Jan 2012 00:07:48 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b49sm78326237eec.9.2012.01.25.00.07.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 00:07:47 -0800 (PST)
Date: Wed, 25 Jan 2012 09:07:45 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120125080745.GA3843@jama.jama.net>
References: <4F1FB448.3040404@nedap.com>
MIME-Version: 1.0
In-Reply-To: <4F1FB448.3040404@nedap.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: build error
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
X-List-Received-Date: Wed, 25 Jan 2012 08:15:35 -0000
X-Groupsio-MsgNum: 36656
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Content-Disposition: inline

--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2012 at 08:50:32AM +0100, Jaap de Jong wrote:
> Hi,
> not sure if this is the right list...
> Running into a failure:
>=20
>     MACHINE=3Dat91sam9263ek bitbake console-image-base
>     //
>     //
>     | + rm -f
>     /media/OpenEmbedded/oe-core/build/tmp-eglibc/work/at91sam9263ek-oe-li=
nux-gnueabi/core-image-base-1.0-r0/rootfs/var/lib/opkg/lists/oe
>     /media/OpenEmbedded/oe-core/build/tmp-eglibc/work/at91sam9263ek-oe-li=
nux-gnueabi/core-image-base-1.0-r0/rootfs/var/lib/opkg/lists/oe-all
>     /media/OpenEmbedded/oe-core/build/tmp-eglibc/work/at91sam9263ek-oe-li=
nux-gnueabi/core-image-base-1.0-r0/rootfs/var/lib/opkg/lists/oe-armv5te
>     /media/OpenEmbedded/oe-core/build/tmp-eglibc/work/at91sam9263ek-oe-li=
nux-gnueabi/core-image-base-1.0-r0/rootfs/var/lib/opkg/lists/oe-at91sam9263=
ek
>=20
>     | + true
>     | + '[' -eq 0 ']'
>     |
>     /media/OpenEmbedded/oe-core/build/tmp-eglibc/work/at91sam9263ek-oe-li=
nux-gnueabi/core-image-base-1.0-r0/temp/run.do_rootfs.20251:
>     line 214: [: -eq: unary operator expected
>     | + set +x
>     | log_check: Using
>     /media/OpenEmbedded/oe-core/build/tmp-eglibc/work/at91sam9263ek-oe-li=
nux-gnueabi/core-image-base-1.0-r0/temp/log.do_rootfs.20251
>     as logfile
>=20
>     213    if true; then
>     214        if [ $runtime_script_required -eq 0 ]; then
>     215            # All packages were successfully configured.
>     216            # update-rc.d, base-passwd are no further use, remove
>     them now
>=20
>=20
> No error when:
>=20
>     MACHINE=3Dat91sam9263ek bitbake console-image-base

try this
http://patchwork.openembedded.org/patch/20111/

Cheers,

>=20
> Thanks!
> Jaap
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8fuFEACgkQN1Ujt2V2gByFoACcDokPYjB8tYQ9kaW9yWrDbGsf
jr4AniJQoYJ/wjYEt6HGkg3CZXrpIKVm
=iktw
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--
