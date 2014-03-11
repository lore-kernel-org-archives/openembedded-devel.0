Return-Path: <joe@deserted.net>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9BCB46F88B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 17:05:46 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id x13so9564273qcv.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 10:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=Q4wPb5IMXwnNP+ibCpXLBhtkdAx0nGOhdw9MSQ0Q0AY=;
	b=ezzQkmWTZcpKXPbsaoB8vrkeCyJOtnALGU5HzjKEwymZcwfZO1X1E0a/LXBAxMQNky
	c/VhIy1Soh1mtL33NgH3AFldD7cYJCTw8MEPs6kHLKCUYF7xUUMmPRX5icuwlh+ZESfY
	AekZFP0EblnB5y9un2pMaqw/lLztKxJuucg/sQj2FrAwMU/DNlWikD7rIgHQ4NiNtFSE
	E2/qd4xk94/y8+BiyJThT/RUxHBEgkRvo8OWZin+JEFT5kJT0Y+CbrbtV9qOMmas6Cp0
	G9OMyemUN/zyMkT0G/K9L6UNQ5B2ZQpS6rM6cNSr0alyWOMxUGtZ0/kTbGK7A5zi/8A4
	5new==
X-Gm-Message-State: ALoCoQkUDiZzf5KyLcajRs7zMu+5wG1ckyN87WN1c60SuRfFkwYQ3oOU2vXNbavbikCKvSFV1CE5
X-Received: by 10.229.112.5 with SMTP id u5mr42949936qcp.3.1394557546951;
	Tue, 11 Mar 2014 10:05:46 -0700 (PDT)
Received: from deserted.net ([128.224.252.2]) by mx.google.com with ESMTPSA id
	m11sm32340975qge.13.2014.03.11.10.05.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 11 Mar 2014 10:05:45 -0700 (PDT)
Date: Tue, 11 Mar 2014 13:05:43 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140311170540.GA13065@deserted.net>
References: <1386874857-8596-1-git-send-email-joe@deserted.net>
	<531F372B.8010907@digi.com>
MIME-Version: 1.0
In-Reply-To: <531F372B.8010907@digi.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-networking][PATCH] vsftpd: install volatiles file based on init system
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
X-List-Received-Date: Tue, 11 Mar 2014 17:05:48 -0000
X-Groupsio-MsgNum: 48603
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline

--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] vsftpd: install volatiles file based on =
init system] On 14.03.11 (Tue 17:17) Javier Viguera wrote:

> Hi all,
>=20
> Was this patch finally merged?

Sorry, no, not yet.  At the end of the thread I think I had a workable
solution but I've not merged the result.  If you have an updated patch
that addresses all of the systemd/sysvinit/systemd+sysvinit
combinations, I'll be happy to merge it instead of my work.

-J.

>=20
> At the moment building *vsftpd* in a sysvinit-based system is *broken*. T=
he
> failure is:
>=20
> ERROR: QA Issue: vsftpd: Files/directories were installed but not shipped
>   /run
>   /run/vsftpd
>   /run/vsftpd/empty
> ERROR: QA run found fatal errors. Please consider fixing them.
>=20
> In such sysvinit systems, '/run' usually is a TMPFS and '/run/vsftpd/empt=
y'
> is created at *runtime* via volatiles bootscript.
>=20
> Creating the directory in the recipe at build time leads to the above
> mentioned error.
>=20
> -
> Javier Viguera
> Software Engineer
> Digi International=AE Spain S.A.U.
--=20
-Joe MacDonald.
:wq

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlMfQmQACgkQwFvcllog0XzByACfcq9syBeKm/wlHB5i2yYQktKE
YO8An2zA5l9v6YftVaoYMAsVYU0Ok+pJ
=nHlA
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
