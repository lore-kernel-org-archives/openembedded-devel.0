Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 16EC97C60C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2019 21:01:55 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id b20so14649801edw.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2019 13:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=R611jFxaNTfgMkJNrHyaUq0K09dtg+GIx5ufyY3sYoI=;
	b=m7kOx+In95Odsf6sGzvtZKT83ocsXD32PgtuLnE2ysxQD4b03gJhm5tu7ow3fIJq55
	JR27ijvX+w1twFNX7DFUa1nX7gb+EE6g7xtw3fjm+YQUYI+AwhhZYNx/hH+4oW6KN93T
	RGfYY6nO3kyfxR4TQglCxFIFJLzdhO7sKGFC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=R611jFxaNTfgMkJNrHyaUq0K09dtg+GIx5ufyY3sYoI=;
	b=DZAPkSnBw5MOt4yf87+lcByyF5S/b3z7AZUXpadcEUxwBGr5gs3Eq6ROQaiKbgdHZf
	NQqT3Nd020Fgyq/RqsrKpv7LODFd8U5Os88BG/JBOYdGXCn3y9gDonBEzGi6q0bN3wUH
	HsR82NYbHPCqyprkIKVm0FsSi8fqxOi8vcjTN1a/fs9aXnn7YaTXHc/QaB1t5ubsfDdT
	oVu3Jsy4JNyTiVUwWsIkw+Q0ruZNsDBbIUYGiqy7QvkfxHGxxSoE/xs8UnRmjsws1eGv
	tNZBOHa85pka6fvZp080rz6TXuIaX45DHnK960v4VcFC6uxFOgakGfJSbeNoi74nKELA
	DsyQ==
X-Gm-Message-State: APjAAAW4J9LJM5NJjNQoWwMQkQ/U4pwc6UKCc8FS5i6okr3gSuojP5Fd
	CNrB9BtIv92nxwpkmBPRO+S+yw==
X-Google-Smtp-Source: APXvYqyyZ7shSQSwNdEqERG0ZE0dRo2+ebvXAhAmujpIZs8chy3O98ZT0AN2qCf9mdwfo6gco3WPnQ==
X-Received: by 2002:a17:906:7b0f:: with SMTP id
	e15mr8858237ejo.143.1551992516575; 
	Thu, 07 Mar 2019 13:01:56 -0800 (PST)
Received: from bill-the-cat
	(cpe-2606-A000-1401-880D-606A-AF5B-88B1-B23A.dyn6.twc.com.
	[2606:a000:1401:880d:606a:af5b:88b1:b23a])
	by smtp.gmail.com with ESMTPSA id
	s12sm1687402edb.11.2019.03.07.13.01.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Mar 2019 13:01:55 -0800 (PST)
Date: Thu, 7 Mar 2019 16:01:51 -0500
From: Tom Rini <trini@konsulko.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190307210151.GY5026@bill-the-cat>
References: <20190306054548.16430-1-raj.khem@gmail.com>
	<20190306054548.16430-6-raj.khem@gmail.com>
	<20190307172333.GA1278@localhost>
	<CAMKF1sp-k21Pmw_soord9-Sbwj1B4QO=yhvJELtbSsT-PBhSZQ@mail.gmail.com>
	<20190307204834.GX5026@bill-the-cat>
	<CAMKF1sqqa3JziLChCLXt_5FmiRRmpgD=8PB7Ab=NGcn5pbCNLw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqqa3JziLChCLXt_5FmiRRmpgD=8PB7Ab=NGcn5pbCNLw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [meta-networking][PATCH 06/12] inetutils: Fix build on RISC-V
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
X-List-Received-Date: Thu, 07 Mar 2019 21:01:56 -0000
X-Groupsio-MsgNum: 76677
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nk27jClX7wGPY2hW"
Content-Disposition: inline

--nk27jClX7wGPY2hW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 07, 2019 at 12:53:40PM -0800, Khem Raj wrote:
> On Thu, Mar 7, 2019 at 12:48 PM Tom Rini <trini@konsulko.com> wrote:
> >
> > On Thu, Mar 07, 2019 at 09:25:33AM -0800, Khem Raj wrote:
> > > On Thu, Mar 7, 2019 at 9:23 AM Adrian Bunk <bunk@stusta.de> wrote:
> > > >
> > > > On Tue, Mar 05, 2019 at 09:45:42PM -0800, Khem Raj wrote:
> > > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > > ---
> > > > >  .../recipes-connectivity/inetutils/inetutils_1.9.4.bb           =
| 2 ++
> > > > >...
> > > >
> > > > This recipe moved to OE-core.
> > > >
> > >
> > > thansk of reminder, yeah it was in transition. I hoping Tom will send=
 a
> > > patch to delete these recipes from meta-oe repo.
> >
> > Yes, I sent one last week :)  Do you need me to rebase them?
> >
>=20
> its not in my inbox, maybe I missed it, please point me to it. In
> anycase I have pushed a patch into master-next

Lemme just wipe the egg off my face for sending it to the wrong list,
rebase it anyhow and send it properly.  Sorry about that!

--=20
Tom

--nk27jClX7wGPY2hW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcgYa/AAoJEIf59jXTHXZSlnAQAJq1YUkvy+hGNl6N8aiy5g0R
RIQFfw4tA847EkYo7zBpLhtd0RbJydATR6GHmJgrOc/T/gP6Leb/occRZdWzE23N
tf0QWrRZfLb1iGKMHWKd1qkcDDdZsC3AKbxuCpIhJW7yQgqyVarW3eYqHcNr9kiG
2obghEdD6YqoC9LkXfBgDLeYoX2VXhDRb0cCtRwksZn06qlaENr0MU1Pff7bNQ2j
PQbnZXfL19MsICo8c7g8NCK70PM20HiSFp5Lp+vmuxR+NhE4cHaLAsLyiNk1yneb
B3XJ8CwgQkAsIri/zTSoFNzLAlX4SOiaz4NiEPf9YeX3zmwpXWdGuv7w47m+z6WO
Eq3/WEQlfkqnHw8g9detorzTcCo2kZyXbVng58zZ6nfvcNMTL6QwUzgE2f9H9V5I
IYEVY5cZsD6MMG0rBQ/KJfplI/WJLgnwMWB1u+AlkH3Yw1FKV+4gFezoj81+mEy+
kJp3+J6TAG1e7hywSXRUiiSw0W8Qcg0J2aP8EEC1rb+1uflU6WRE3Esgjz2Pt35r
uGuASvdryuFK1QWAh9JZCoeF3diPx0JTtb0djd3oFHtrzvZJp/tE7SE0dnsUTUji
H7S+EAzJdX5flmY2IDXmrkiJnWe5gNuUxvl9eZKs+A6ana2aPcSidbeAhYBXu/iG
cwDRpxwdqqqMiy3RPOs3
=XuMd
-----END PGP SIGNATURE-----

--nk27jClX7wGPY2hW--
