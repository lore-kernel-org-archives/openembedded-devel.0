Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id A1DCA761D8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Mar 2016 10:26:30 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id p65so28511287wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Mar 2016 02:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=MGERZf1BBEq+QfjhSGJ5THZgvrv9ivDFLkRUhH2xh8g=;
	b=N4wiQXjz5DLk8yzmJt1Zu5sChIQ3cMEeiQzMHpTaPajpfrHKonRMF2/OUG1OGFaYxL
	hfGIjxBOdpIkdNBoGaIjcytByWPVQU5GzBUPh7BtBalc+3x+p+rVOPYayD9u0nRG4yiD
	HmZ6GpIYF3vpSOOv2RRiJlFnO8aBeCFSZGwQMZZhGQdA7jnMr9C73202VlO/FqgotEeG
	eSu50i6c+sXc/NxLimGenR8l0SRLpA4PMTOdF5aNKZUGAvr90AOpJiysypWNnycfPtpq
	hA74F+r4q0Fj+nJ2tKvdQizYq7rAswZleY6UF7n2YECZIjQdTInIrEOjb34+hE/BDhJ9
	oH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=MGERZf1BBEq+QfjhSGJ5THZgvrv9ivDFLkRUhH2xh8g=;
	b=gVNJhKbU3EP3UE0Cpaq6HBAD8EM5o2TNQUB2lVtHM7JZFMYuLViT8LOdkg40Vzb5jW
	kyxuRWNH3QQj+ojD+M552ceKa4Cndo2GFc8EMjkxQ7dyx+9srMrCozba1I4jy+cCzjdm
	HL/72Zo8TOBotzrEeT8DNkPQVRi/DZswiE0Szwn2bfd+99TsMXeICLuwV1oA05+LCuYK
	+/SAqQYWbSAtKXX0yBy9al5stcCzDW3PuvItFTQU0lXHjPnxKB++j6/XzVQHPMzkvtGQ
	pl42WYhvyxUDbwiDt7H0KMpNKYZ8FK8G+4Cp2hTIF20T/Ph1VgtYYcFUgHey/CR+3NzJ
	EIIg==
X-Gm-Message-State: AD7BkJKyjyU7XKqjSq6fVhBZjNJbaniJXm7TtD7AWk1dK9rEVGCQeY+/9iBAeOZOCk0k5w==
X-Received: by 10.28.23.196 with SMTP id 187mr2668970wmx.17.1456827990833;
	Tue, 01 Mar 2016 02:26:30 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	za6sm30164459wjc.18.2016.03.01.02.26.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Mar 2016 02:26:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 1 Mar 2016 11:28:21 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160301102821.GC6407@jama>
References: <1451923194-60100-1-git-send-email-javier.viguera@digi.com>
	<56D56048.204@digi.com>
MIME-Version: 1.0
In-Reply-To: <56D56048.204@digi.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-qt5][master][jethro][PATCH] qtconnectivity, qtsystems: fix bluetooth support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Mar 2016 10:26:38 -0000
X-Groupsio-MsgNum: 60282
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hYooF8G/hrfVAmum"
Content-Disposition: inline

--hYooF8G/hrfVAmum
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 01, 2016 at 10:26:32AM +0100, Javier Viguera wrote:
> On 04/01/16 16:59, Javier Viguera wrote:
> > QMAKE_CACHE_EVAL is only used in qtwebengine and qtwebkit, but not in
> > the rest of the QT5 packages, so use EXTRA_QMAKEVARS_PRE to pass the
> > packageconfig options to the do_configure task.
> >
> > Also generalize bluetooth support so it can be used not only with bluez4
> > but with bluez5 as well.
> >
> > Signed-off-by: Javier Viguera <javier.viguera@digi.com>
>=20
> Hi all,
>=20
> This patch has been in *jethro-next* for almost two months now.
>=20
> Is there a date to have 'jethro-next' merged into jethro? Is it planned?

merged

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hYooF8G/hrfVAmum
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbVbsQACgkQN1Ujt2V2gBya/gCfZRIWhXFxddWJKZAq7T3dj3iX
rDcAnj1K7+/2M37fQhwqU9SUEvYQcXKv
=Iake
-----END PGP SIGNATURE-----

--hYooF8G/hrfVAmum--
