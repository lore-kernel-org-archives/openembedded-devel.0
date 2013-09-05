Return-Path: <joe@deserted.net>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0623A6C6B7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 17:22:45 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id r16so1070949ead.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Sep 2013 10:22:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=jYy2FXCz5o4jRvHoDv8ipODSo7Jjlia3p4Jy0TRL+zw=;
	b=RWGpSFw9yMYfYL0yAfP88Qa77+Bc+3TF42EeC2DwGhOmrxs9WvuMHVoPC4NLVved8h
	1Aqg1wQTUP7SfRV/H8hvVFJqp+rIkOil/WnyapgKgSbnzXyZKWU2fD4BxPrM6BjsARdV
	IYBf+G01p8X3zAhpWmMp1P2sSBx0RxtB8eteFCWqSYjHXzP1fQYXy9WiXLwSr740lnga
	yDj2YQ6EG0noo2hlTmfMDs8JnBz5BUeGUSkkebwR4eDg4fiIDlcQ1lcXowPwlYDp+Nw9
	nVYP6Nbvqeg5MZzID0sp5HY6qI6j/fHA7Uiom5Rz0/fBBhOcRqiY5vFj1/HKpfbjO4+6
	WfmQ==
X-Gm-Message-State: ALoCoQlPF4qWsrTIytHdsvEiHRXevJu01dMhqeDl3ytXIeqeF03qnJdaQE5vFKsE4lxVfWlGPvTQ
X-Received: by 10.14.218.197 with SMTP id k45mr15001314eep.32.1378401766890;
	Thu, 05 Sep 2013 10:22:46 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id f49sm50380125eec.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 05 Sep 2013 10:22:45 -0700 (PDT)
Date: Thu, 5 Sep 2013 13:22:41 -0400
From: Joe MacDonald <joe@deserted.net>
To: Laszlo Papp <lpapp@kde.org>
Message-ID: <20130905172239.GB27479@deserted.net>
References: <CAOMwXhNZ+gPnaDF20MaXAQLUkEf_7w19pzt4PCS=JLM7_8=g-w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOMwXhNZ+gPnaDF20MaXAQLUkEf_7w19pzt4PCS=JLM7_8=g-w@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Dropped libnl fix for net-snmp: Why?
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
X-List-Received-Date: Thu, 05 Sep 2013 17:22:46 -0000
X-Groupsio-MsgNum: 46107
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LpQ9ahxlCli8rRTG"
Content-Disposition: inline

--LpQ9ahxlCli8rRTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Dropped libnl fix for net-snmp: Why?] On 13.09.05 (Thu 16:43) Laszlo Papp =
wrote:

> Hi Joe and co,
>=20
> what exactly is the reason for this patch having been dropped?
>=20
> http://patches.openembedded.org/patch/20563/
>=20
> This was not so thoughtful decision. The current net-snmp version will not
> build against denzil, and in fact, this patch should be even upstreamed. =
I will
> take care about that one, but is there any objection against me submittin=
g this
> change for net-snmp in meta-networking?

Nope, no objection from me.  It appears to be reasonable.  I think the
only reason it doesn't appear in meta-net today is it was sent against
OE Classic and perhaps never sent for inclusion in meta-openembedded.
That's just a wild guess, though, it looks like the whole thing
may pre-date my involvement with the project.

--=20
-Joe MacDonald.
:wq

--LpQ9ahxlCli8rRTG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlIovd8ACgkQwFvcllog0XxIBQCfXluJq4h+fnx5p+27odYxC+p6
hxsAnivlIrUqtQsKfUGgT+pwLyaoo36I
=fR09
-----END PGP SIGNATURE-----

--LpQ9ahxlCli8rRTG--
