Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id CAC3771B99
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Aug 2019 04:31:59 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id b7so43022297pls.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Aug 2019 21:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=gn9bDq6PcEu02seDchWxT0p9Gwm4G+Bhlttd9s7be3s=;
	b=lUPR5Zovc3gHwx0yVq3QjAca83dek9o6uftXy9Q+TXjxAIJf7aTEta/k3xL4pJhpJa
	1QCuvQQ4iYzEB6D1ybNiza/KFLl4Ns43ICOc80WIddboJfu0zHVoBrtCus8DrLyWfDQV
	ioiaIhiZTQUhAiBYiwR5jyP3VxRtzBwCw+eZpPt8d7ndSCx3Y/UaN/56ZTkFcuASkRcB
	08lmVKea+vhqoH3QfHlUcZuCAYbxn4UAm0pq7CXtRMh0MWqQ/RbPLRkWOK/D9DUBsieJ
	B3DV7t4Ely4vfj8aBWDmrSwetc9Xk4JW9zG68vy7od7uCuMrbeAXo6+xzKgYRTVznQnc
	hVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=gn9bDq6PcEu02seDchWxT0p9Gwm4G+Bhlttd9s7be3s=;
	b=ZqDZYDDHzRBHuecb7tSUUcZH1ODDY8YKx1KB92s3aHo3GeZIgUEli2sVXhQg426ajT
	NENBum3vM8ReMnaFPojT2q23d/B7P9ncz+kvYksfvX1vjuB24H2B7UuuXdJ8aETG5BoT
	gqMbvFYQZ9hFPIGKaFFR7CEdacON1IFO7iYXnZlO6wj9Pu4pdyiRcJEL+mwMLNGwgKR5
	SdbBxPAgbIXVKdkODE85stW4cblgFIvvEnST9M7WjYYR1dbfYqHYTUGvvlUYAuO5XasI
	l0Z6zPbNS/sjsd2fjkvbaUx1gUjLshCPzWKhDvpsWSXCg+FifhFfWFS3j3OMjIB+CMHv
	PGBQ==
X-Gm-Message-State: APjAAAVcAFfGKjHfmalRtTvoRhlyxh9FWYOo6foPb8XuPrgV5NvZVegk
	vqZSpesPkHSZfwN6eQiM5UstUiZdNwk=
X-Google-Smtp-Source: APXvYqyw2kSaBFiaKZzAduyJGi36S7A4ayd6JRPK8L3xiokVaxgUb6jcKcqo+5lZfsYlXet6hXTPFQ==
X-Received: by 2002:a17:902:24b:: with SMTP id
	69mr11095082plc.250.1565238720381; 
	Wed, 07 Aug 2019 21:32:00 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6::baaf? ([2601:646:8500:6bc6::baaf])
	by smtp.gmail.com with ESMTPSA id t9sm781597pji.18.2019.08.07.21.31.59
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Aug 2019 21:31:59 -0700 (PDT)
To: Andrej Valek <andrej.valek@siemens.com>,
	openembedded-devel@lists.openembedded.org
References: <20190806064731.17490-1-andrej.valek@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <76644068-fffd-3398-0898-e00db5a9f026@gmail.com>
Date: Wed, 7 Aug 2019 21:32:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806064731.17490-1-andrej.valek@siemens.com>
Subject: Re: [meta-oe][PATCH] nodejs: 10.16.0 -> 10.16.1
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
X-List-Received-Date: Thu, 08 Aug 2019 04:31:59 -0000
X-Groupsio-MsgNum: 78979
Content-Type: multipart/mixed; boundary="------------2298B8FB1EAA567798686460"
Content-Language: en-US

--------------2298B8FB1EAA567798686460
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Andrej

I am seeing

ERROR: nodejs-10.16.1-r0 do_package_qa: QA Issue:
/usr/lib/node_modules/npm/node_modules/node-gyp/gyp/samples/samples
contained in package nodejs-npm requires /usr/bin/python, but no
providers found in RDEPENDS_nodejs-npm? [file-rdeps]

Can you see whats going on ?

On 8/5/19 11:47 PM, Andrej Valek wrote:
> Update nodejs to active 10.x LTS release 10.16.1.
>=20
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  .../recipes-devtools/nodejs/{nodejs_10.16.0.bb =3D> nodejs_10.16.1.bb}=
  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-devtools/nodejs/{nodejs_10.16.0.bb =3D> nodejs_=
10.16.1.bb} (97%)
>=20
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.16.0.bb b/meta-o=
e/recipes-devtools/nodejs/nodejs_10.16.1.bb
> similarity index 97%
> rename from meta-oe/recipes-devtools/nodejs/nodejs_10.16.0.bb
> rename to meta-oe/recipes-devtools/nodejs/nodejs_10.16.1.bb
> index aaa1da0aa..8c7795c76 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_10.16.0.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.16.1.bb
> @@ -23,8 +23,8 @@ SRC_URI_append_class-target =3D " \
>             file://0002-Using-native-torque.patch \
>             "
> =20
> -SRC_URI[md5sum] =3D "c9a7ab43f8b50c8a4d5545de307b7540"
> -SRC_URI[sha256sum] =3D "18e37f891d10ea7fbc8f6410c444c2b1d9cc3cbbb1d35a=
a9c41f761816956608"
> +SRC_URI[md5sum] =3D "009e079ce7e2d695642fb61372459a77"
> +SRC_URI[sha256sum] =3D "6268319c8dddfdaa7886ea3f253ac5c2d133a6c682c007=
86296227e03f322009"
> =20
>  S =3D "${WORKDIR}/node-v${PV}"
> =20
>=20

--------------2298B8FB1EAA567798686460
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3Dsj8j
-----END PGP PUBLIC KEY BLOCK-----

--------------2298B8FB1EAA567798686460--
