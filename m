Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id A7245601A4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 16:38:43 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id 206so8904637pfu.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 09:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=HWiEP7K42f4C+FRsDx/5qgjIzZ9FRNDYpIzwFqMqBnI=;
	b=RxO4/TWxdrJ2SLtLJy8iLlAMAB7rS8DGWbBv6EX4BwVUTMteKL+z5nClHLnOImVX9x
	fjwdo5SIF00BTEAmPp9f3LiaYAx8UyxO5g4u83HtMAp0nurTJSR9MZn7rK4borfqB/9S
	dlkR9naIGZG3D+6TkgL79rYEqJ5N5ii/PpL7OXW06VrjPeIqluEXMdTPFVsJoSo26wtd
	GBanzbdfSE9uLM2mlXJJjuH2m7OiRbZyfJcM8eR2FgmeUd2zGbd936BdQrl5ZhuM/mov
	QgM8nGAeumVi/NrtNPeJSeCwFNO+h8w3WuZKYwAdCgzg4xA7T1l5QMS1J2ALDgot+17Y
	HlPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=HWiEP7K42f4C+FRsDx/5qgjIzZ9FRNDYpIzwFqMqBnI=;
	b=Rh0WpWdxr57J2LAP9qvz0K0KWuIo9A9EKggTCd1ByfkbPOf38xJINSLoAugd7pRjQR
	BbAJbUnmhjy4Z2bMRjBCe/YL0CxeHKgvApNqcPP+zTG7IZubXrkPAvcrRZzETSNtwx4K
	9/LSCgXqHNZ1XUEEexl0f138SSctQ4HVCPuPlJna7zVugObQjWQ50/Jz9DQs2vlOoRgr
	MgNzaNv1koFmthFP9Ymu33fw49Cjc1Iw1Zlft0n7gsmsksVe8Hbz+wWHnR5W2Uy8QL8K
	/supTVstl6JMt4T3+QEQU9k3+VbpkypE22enpV/3vLCAiY87VkB+IUHApEFUzE6tYndn
	O5Qw==
X-Gm-Message-State: AOPr4FUbR3HbZwxjflbfoIGZ9KB9irSEzYY+q1oYJGk/t0qdMVeBt3GAnK9GnZCgaW7FIQ==
X-Received: by 10.98.42.211 with SMTP id q202mr4920597pfq.13.1461688724163;
	Tue, 26 Apr 2016 09:38:44 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:b93e:176b:d03b:ac8e?
	([2601:646:8800:5a9a:b93e:176b:d03b:ac8e])
	by smtp.gmail.com with ESMTPSA id
	w125sm6480579pfb.16.2016.04.26.09.38.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Apr 2016 09:38:43 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20160426153025.GH31113@denix.org>
Date: Tue, 26 Apr 2016 09:38:42 -0700
Message-Id: <139887C4-F77D-4838-A13A-877DDDF999CC@gmail.com>
References: <1459471643-7183-1-git-send-email-denis@denix.org>
	<20160420182710.GN16135@denix.org>
	<20160425180750.GW16135@denix.org>
	<CA+chaQeA63zpMf02NYbDrxZgXdSbx2=T3=nZGmxk4h8XxOx+Xg@mail.gmail.com>
	<20160425214326.GA31113@denix.org>
	<CA+chaQduVd3gEmHO1D9YSzid0F6Lm-Mrv+Yh2rW0a=f5fQWKFQ@mail.gmail.com>
	<20160426153025.GH31113@denix.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: [meta-qt5][PATCH 1/2] qtdeclarative: fix compilation of examples/qquickviewcomparison
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
X-List-Received-Date: Tue, 26 Apr 2016 16:38:44 -0000
X-Groupsio-MsgNum: 61180
Content-Type: multipart/signed;
	boundary="Apple-Mail=_81B89480-2BB9-4296-9220-2EB78B24180C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_81B89480-2BB9-4296-9220-2EB78B24180C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Apr 26, 2016, at 8:30 AM, Denys Dmytriyenko <denis@denix.org> =
wrote:
>=20
> On Tue, Apr 26, 2016 at 08:37:19AM +0200, Martin Jansa wrote:
>> The strange part is that examples built fine here with current master
>> (5.5.99/5.6-beta)
>> without your patches.
>=20
> That is strange. Can it be toolchain-related? I'm using Linaro =
gcc-5.3, but I
> would expect OE-built gcc-5.3 to be as strict and fail similarly on =
those
> undeclared or incomplete classes=E2=80=A6

can both of you paste the <gcc> -E -dM output of this file in question ?



--Apple-Mail=_81B89480-2BB9-4296-9220-2EB78B24180C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcfmZIACgkQuwUzVZGdMxSaQgCbBoicbYx2kgTlJDqG5KMzLCNU
QwsAn1pshBvIzuO7Y7e0R3oRz1PC+ygu
=az7F
-----END PGP SIGNATURE-----

--Apple-Mail=_81B89480-2BB9-4296-9220-2EB78B24180C--
