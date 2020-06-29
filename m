Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.21059.1593443998050442610
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 08:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@stusta.de header.s=default header.b=Pz8GSdg/;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=da39=ak=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49wWPj4b51z4t;
	Mon, 29 Jun 2020 17:19:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1593443994;
	bh=Ly/9bxe/SuNdzYF7NDuV49kZRT2HTpsW/4afwQcgBxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pz8GSdg/vwDzRLCkIGK8SFUq6+TRImUxUcyhwzHGHYQpGc4+BeQACkebWlqfk0iVu
	 Mh5f4x52lld13hi1mOaldc/gDQwvEtGAyR9ffZ6lKbC9AGW7FlO77N4G1W8mBr7KTK
	 RGl4jmuwbjl2+IGpwKKi6YsheZC2NcjAzUFKFxgggNXRZYNtvICBdfXjdL3yY9Pbor
	 whkyojkOzNgeXJrr2xcr3rJr7HJua9bTqGPNdq+64JbTl1wNCpDfDgcq+eNn0cBQj1
	 a+WJtKTfHbFzoD3RYJ2f1QVZamK5SLwMFBvDsKGll2Xcvk7EI+4HD/Pn0xDucFdmYV
	 u7G96YIwuEmbxkHUnBt5Ui3XqUz+n78sIzd+Z+qjw5SPqsI4mZHw5BjOuvBLwI3DxO
	 kXjfLhmnoxSHXLFIk+dS5r3XjlBq9ukRr8DgYP23d2BYHkINxDmkJPAplsHQIGYU46
	 LQGPGmRy2+uFUHi20gUFAKnswOCd6YQ1YHE4Xo3BEDuGX5j021DsWzxVViXpnG+9pY
	 mEP+h2ThH3FdSMVypT1MNkbTirV6yU3lCoZxp9+9d6K5XKyRTC99sM/JJi9hWvpfJy
	 Y9zmaeBYEg3nTQjAOJ3MqT1QmTdlJ5XA6/+qLwl/4yqw5SDzCrpg1m/ghr6DFhYuQY
	 W3tel9rH3gwHZGmlnAlvXYx0=
Date: Mon, 29 Jun 2020 18:19:51 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: akuster <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] meta-python Dunfell branch maintenance
Message-ID: <20200629151951.GA7038@localhost>
References: <c1502c01-c4c8-b05c-5db1-979b0d335b38@gmail.com>
MIME-Version: 1.0
In-Reply-To: <c1502c01-c4c8-b05c-5db1-979b0d335b38@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2020 at 07:59:13AM -0700, akuster wrote:
> Hello all,
>=20
> I have notice many meta-python3 recipes are having their .inc files
> being consolidated. I am considering backporting those consolidations
> that are bug fix only

Those consolidations can never be "bug fix only" - part of a recipe in
an .inc file is not a bug.

> so that maintenance moving forward is easier.
>=20
> Any concerns from the community on taking that route where=C2=A0 approp=
riate?

I wouldn't see it appropriate for a stable branch in most cases.

If you are backporting other changes for a recipe that were done in=20
master on top of such a change this approach sounds like an option, but=20
in the normal case that the recipe is never touched for other reasons in=20
a stable branch I do not see the benefits of making such unnecessary chan=
ges.

> regards,
> Armin

cu
Adrian
