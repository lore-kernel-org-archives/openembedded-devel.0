Received: from mail-pa0-f45.google.com ([209.85.220.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TlKqK-00029t-Bf
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Dec 2012 15:42:02 +0100
Received: by mail-pa0-f45.google.com with SMTP id bg2so1350100pad.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2012 06:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=BN878Rtga4rx1n9qIln/Thd1y8e2bL3mYLAWonDy0Bo=;
	b=cMb8EIuHhZXPkluhTFDFGsIeDwwuxQ3o0dDVUoyQi/kLGpRWbS1r/dLJ02Uw1VD6e4
	YoTKSPzvW0ClMLUsq2LiFesvX8C6UCq6Jxiv0tQper5iT1dlxtd0ejhtcBLvCDXJKIbf
	f/zLZikVlE73Ds5dZXY8w1jmL7oF0wbO+rKxLDV+Wx1XRYV6J8r9/57zS5TPREcBb/4w
	9/zUGXD+gkkoKxM8hC561J7yAf20m7L2NhgQ1ka9NySkJeFxkXBDNeeF2s2kspsbTy1D
	eAEo/tVeV5973VpnByEz3Kr4iZRqNoDWuImoTBk8yvdbxD+0sCb8Z/4BFax4ppaPZa4I
	6n/Q==
X-Received: by 10.68.219.164 with SMTP id pp4mr19160474pbc.72.1355927232422;
	Wed, 19 Dec 2012 06:27:12 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id pl10sm3192502pbc.60.2012.12.19.06.27.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Dec 2012 06:27:11 -0800 (PST)
Date: Wed, 19 Dec 2012 15:27:08 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20121219142708.GB14543@jama.palm1.palmone.com>
References: <1355865358-21642-1-git-send-email-otavio@ossystems.com.br>
	<20121219134033.GD3525@jama.palm1.palmone.com>
	<CAP9ODKoSQrBs2iu+dqdCe03Xju=NfB=Xqy0ddN+r3GesZSkvVw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoSQrBs2iu+dqdCe03Xju=NfB=Xqy0ddN+r3GesZSkvVw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/3] openmotif: Update SRC_URI and add libxft in depends
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
X-List-Received-Date: Wed, 19 Dec 2012 14:42:02 -0000
X-Groupsio-MsgNum: 42258
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LpQ9ahxlCli8rRTG"
Content-Disposition: inline

--LpQ9ahxlCli8rRTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 19, 2012 at 12:07:40PM -0200, Otavio Salvador wrote:
> On Wed, Dec 19, 2012 at 11:40 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > On Tue, Dec 18, 2012 at 07:15:56PM -0200, Otavio Salvador wrote:
> >> The file couldn't be found in the official repository and it seems
> >> unmaintained as it had processing errors when trying to register to be
> >> able to download the last release. Researching in the web a mirror has
> >> been found and than we're using now this mirror so fetch works again.
> >>
> >> During build test, from a clean tmp directory we found that libxft is
> >> a hard dependency so we add it to depends list.
> >
> > Does not apply on master, because openmotif was removed:
> > commit 14b68506078a4133e743491d35245775a58a1317
> > Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> > Date:   Wed Nov 14 12:31:18 2012 +0100
> >
> >     openmotif: remove due to lack of libxp in repository
> >
> > Can you rebase on master and resubmit if still needed?
>=20
> Yes I can but wouldn't be better to just revert the removal commit and
> apply it? If you want I can prepare it in my tree.

That does not resolve missing libxp.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LpQ9ahxlCli8rRTG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDRzrwACgkQN1Ujt2V2gBwcEwCfa08iT/9IfcPe0hWMtrQdzZ14
FvAAninhlkNZr4S4WICLaxV79jmbqUxV
=wVHx
-----END PGP SIGNATURE-----

--LpQ9ahxlCli8rRTG--
