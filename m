Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TxdDs-0003k9-K6
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 13:45:05 +0100
Received: by mail-pb0-f47.google.com with SMTP id wz17so3943671pbc.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2013 04:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kDZxX9pUvTjYrgbLNvfrPLgPPliZ0E43Cf/T1zkSyJ0=;
	b=luDx5/427nlmHKbYcnsWMxoCb57FqKzgCK0SrfNw+vJg8dCqtBiHI+3fd8DrEZV4X4
	gX5ANxAOGhOwPu0uO95oR32arRH8vOxitPUHkcJ41DTkjMM0VcHqNiouUNOCsysALK4o
	NFv/gw+cpN9ILQ3pNxbPgVhnnHMy25ydlaj9z3BWoCWWp9wRoL738RkWmTPutqiTOAhz
	/DPAdGBeohD8RhXEqWTtkAVnWhtFLnacVlaF04u4EptcNS8X5YyuuYLcHV2saH4zHMLX
	CPDwE13ZPKY/NRnCc1EVkOv3M9xx13QxVABbFEBkhWV8LrznjFc8v9r35jNRnloKtqzk
	cDcw==
X-Received: by 10.66.84.232 with SMTP id c8mr56004044paz.8.1358857773976;
	Tue, 22 Jan 2013 04:29:33 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id m3sm11349555pav.4.2013.01.22.04.29.31
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 04:29:33 -0800 (PST)
Date: Tue, 22 Jan 2013 13:29:33 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130122122933.GT29386@jama.palm1.palmone.com>
References: <1358461961-5703-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<20130119100356.GG29386@jama.palm1.palmone.com>
	<50FA7388.7080208@linaro.org>
	<20130120145347.GH29386@jama.palm1.palmone.com>
MIME-Version: 1.0
In-Reply-To: <20130120145347.GH29386@jama.palm1.palmone.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] php: cleanup QA warnings
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
X-List-Received-Date: Tue, 22 Jan 2013 12:45:07 -0000
X-Groupsio-MsgNum: 42799
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+OVWeTxrbAwQuiek"
Content-Disposition: inline

--+OVWeTxrbAwQuiek
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 20, 2013 at 03:53:47PM +0100, Martin Jansa wrote:
> On Sat, Jan 19, 2013 at 11:20:56AM +0100, Marcin Juszkiewicz wrote:
> > W dniu 19.01.2013 11:03, Martin Jansa pisze:
> > > I think this /home is still there:
> > > php-5.3.19: php: Files/directories were installed but not shipped
> > >   /home
> > >   /home/jenkins
> > >   /home/jenkins/oe
> > >   /home/jenkins/oe/shr-core-branches
> > >   /home/jenkins/oe/shr-core-branches/shr-core
> >=20
> > It is ${TMPDIR} not /home/ - if you have idea how to find out where it
> > is and how to safely remove it...
>=20
> Ah right. Last time I was touching php I was trying to prevent creating
> this directory structure but failed, maybe something ugly like:
>=20
> TMP=3D/OE/shr-core/tmp-eglibc/work/armv5te/php-5/OE/shr-core/tmp-eglibc/w=
ork;
> WORKDIR=3D/OE/shr-core/tmp-eglibc/work/armv5te/php-5
>=20
> while test ${TMP} !=3D ${WORKDIR}; do
>   rmdir ${TMP}
>   TMP=3D`dirname ${TMP}`;
> done

Merged with that while cycle added, thanks

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+OVWeTxrbAwQuiek
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD+hi0ACgkQN1Ujt2V2gBxFbgCdEB7HB19fnnBZxiEZFCPjqOEL
GSUAn2BV4Oah6KEXi83UCUuX+o42npMc
=6DxO
-----END PGP SIGNATURE-----

--+OVWeTxrbAwQuiek--
