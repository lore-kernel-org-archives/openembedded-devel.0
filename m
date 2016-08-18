Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 66F7776FE2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 17:47:07 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id hh10so2179471pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 10:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=gakTxYhfW27bdwCoeeshLURNrjnBNWc6/hgVEyYu15I=;
	b=gXGX3IsaXIm6csVIpDWMpBMewgGqKs0pqPJXd1Arb2ZG3qcoiWVSNGCfKjrPnAMoNl
	IplsKjTMfyHcBpZJY41fzjqHX7Kxo6UmZTNgY6QTVg/PH22YUynWJCcDnsjPLVvuhEyE
	HxHFn1g9R+W0HBUkZbIukGGmz1bCUiAA+KxygztsZBQFXsxG/7ttpmT9YDAAanjwXfid
	lnAgLskVXVfOE45qCxkQ/mtYkti7/krITJ5z2Iqw1C4QhJX8c6RCPZzw6pO93+iEaJ0N
	nTQMvmGXjHYwDhphf5dKcXetOKuq/w92HB6Nkmn6a1MI5jT3hNECx9K6dW74J3h9O1ul
	894w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=gakTxYhfW27bdwCoeeshLURNrjnBNWc6/hgVEyYu15I=;
	b=B7G7Z65Es1UdpDEtrVVBbgQWAzS62nTBS3Xz5xDSIkAadAFQy9rIjPeZ8HLo04i2Pc
	luhPZTlKoQ/QYDv6mtwOMU7DfggDIOt+TUmuNiImfcbaWdGb8Q+qGedYz5tay2YvxFnU
	XAzgIQ6pq+qXKmLZKeiJg+rOYrHrqSf1UfQ0L5FqXFsVRT4tfJuwATeSDUiaec6Xkcd1
	qcncm0v1J5ir2xZ1cVw62jcoug+z2NtUYYkinvd89QzfvakWJmgsCLUbhCTbmZP1iqft
	UZjAzXewo7FtQu5I86MGLOeiBL6Fn9i023ZabmjX6BtKCwndjRVqwdcCLfgswojAUe8f
	2dbQ==
X-Gm-Message-State: AEkoouv0aNQcNojJcGyucbqQEeqv/eSaTJRT3rCyCdWFpdF077Cn4jnK21G5eqQ88OkKfw==
X-Received: by 10.66.219.200 with SMTP id pq8mr6196918pac.75.1471542427595;
	Thu, 18 Aug 2016 10:47:07 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:e111:2047:280c:be38?
	([2601:647:4c00:3edf:e111:2047:280c:be38])
	by smtp.gmail.com with ESMTPSA id g21sm283864pfj.88.2016.08.18.10.47.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Aug 2016 10:47:06 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84B62087B0@ALA-MBA.corp.ad.wrs.com>
Date: Thu, 18 Aug 2016 10:47:05 -0700
Message-Id: <FC352143-7862-4840-8C49-D4A4A639DC8D@gmail.com>
References: <1471465334-32622-1-git-send-email-jslater@windriver.com>
	<69F4079B-660E-417C-827B-8D7458865C6E@gmail.com>
	<007BD92917A2324FA403BCF9A464CF84B62087B0@ALA-MBA.corp.ad.wrs.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3124)
Subject: Re: [meta-networking][PATCH 1/1] yp-tools: fix compile errors
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
X-List-Received-Date: Thu, 18 Aug 2016 17:47:09 -0000
X-Groupsio-MsgNum: 62730
Content-Type: multipart/signed;
	boundary="Apple-Mail=_06207698-DACE-4BB1-AF57-34C7E3DAA318";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_06207698-DACE-4BB1-AF57-34C7E3DAA318
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 18, 2016, at 9:52 AM, Slater, Joseph <joe.slater@windriver.com> =
wrote:
>=20
>=20
>=20
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-
>> bounces@lists.openembedded.org] On Behalf Of Khem Raj
>> Sent: Wednesday, August 17, 2016 4:20 PM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [meta-networking][PATCH 1/1] yp-tools: fix compile =
errors
>>=20
>>=20
>>> On Aug 17, 2016, at 1:22 PM, Joe Slater <jslater@windriver.com> =
wrote:
>>>=20
>>> Fix two fatal warnings.  The cast error only
>>> occurs for some architectures.
>>>=20
>>> Signed-off-by: Joe Slater <jslater@windriver.com>
>>> ---
>>> .../nis/yp-tools/alignment-cheat.patch             |   58 =
++++++++++++++++++++
>>> .../recipes-support/nis/yp-tools_3.3.bb            |    3 +-
>>> 2 files changed, 59 insertions(+), 2 deletions(-)
>>> create mode 100644 =
meta-networking/recipes-support/nis/yp-tools/alignment-cheat.patch
>>>=20
>>> diff --git =
a/meta-networking/recipes-support/nis/yp-tools/alignment-cheat.patch =
b/meta-
>> networking/recipes-support/nis/yp-tools/alignment-cheat.patch
>>> new file mode 100644
>>> index 0000000..856e42e
>>> --- /dev/null
>>> +++ =
b/meta-networking/recipes-support/nis/yp-tools/alignment-cheat.patch
>>> @@ -0,0 +1,58 @@
>>> +yp-tools: avoid fatal cast warning
>>> +
>>> +The way casting is done, we will get a fatal alignment warning on =
some
>>> +architectures.  This patch cheats our way around this.
>>> +
>>=20
>> These changes look fine, however you should run it by the upstream.
>=20
> Version 4.2 of the tools seems to bear little resemblance to 3.3.  The =
code and
> structures patched here no longer exist.

OK

>=20
>>=20
>>> +We also eliminate an unused constant which causes a fatal warning.
>>> +
>>> +Upstream-status: Pending
>>> +
>>> +Signed-off-by: Joe Slater <jslater@windriver.com>
>>> +
>>> +
>>> +--- a/lib/do_ypcall.c
>>> ++++ b/lib/do_ypcall.c
>>> +@@ -44,7 +44,9 @@ struct dom_binding
>>> + typedef struct dom_binding dom_binding;
>>> +
>>> + static const struct timeval RPCTIMEOUT =3D {25, 0};
>>> ++#if 0
>>> + static const struct timeval UDPTIMEOUT =3D {5, 0};
>>> ++#endif
>>=20
>> perhaps its better to remove the unused code instead of making =
preprocessor
>> work even more.
>=20
> Probably.  I think RPCTIMEOUT made it to 4.2, but UDPTIMEOUT did not.
>=20
>>=20
>>> + static int const MAXTRIES =3D 2;
>>> + static pthread_mutex_t ypbindlist_lock =3D =
PTHREAD_MUTEX_INITIALIZER;
>>> + static dom_binding *ypbindlist =3D NULL;
>>> +@@ -381,7 +383,7 @@ __ypclnt_call (u_long prog, xdrproc_t xa
>>> +
>>> + int
>>> + do_ypcall (const char *domain, u_long prog, xdrproc_t xargs,
>>> +-	   caddr_t req, xdrproc_t xres, caddr_t resp)
>>> ++	   caddr_t req, xdrproc_t xres, void *resp)
>>> + {
>>> +   dom_binding *ydb;
>>> +   int status;
>>> +@@ -450,9 +452,9 @@ do_ypcall (const char *domain, u_long pr
>>> + /* Like do_ypcall, but translate the status value if necessary.  =
*/
>>> + int
>>> + do_ypcall_tr (const char *domain, u_long prog, xdrproc_t xargs,
>>> +-	      caddr_t req, xdrproc_t xres, caddr_t resp)
>>> ++	      caddr_t req, xdrproc_t xres, void *resp)
>>> + {
>>> +-  int status =3D do_ypcall (domain, prog, xargs, req, xres, resp);
>>> ++  int status =3D do_ypcall (domain, prog, xargs, req, xres, (void =
*) resp);
>>=20
>> resp is already a void pointer why is this typecast needed ?
>=20
> I put it in someplace along the line in trying to fix the problem and =
forgot
> to take it out.
>=20
> V2 or leave it?  This code does not look like it's going anywhere =
beyond here.
>=20

v2 just for this.


> Joe
>=20
>=20
>>=20
>>> +   if (status =3D=3D YPERR_SUCCESS)
>>> +     /* We cast to ypresp_val although the pointer could also be of
>>> +        type ypresp_key_val or ypresp_master or ypresp_order or
>>> +--- a/lib/internal.h
>>> ++++ b/lib/internal.h
>>> +@@ -17,8 +17,8 @@
>>> + #define _INTERNAL_H_
>>> +
>>> + extern int do_ypcall (const char *domain, u_long prog, xdrproc_t =
xargs,
>>> +-		      caddr_t req, xdrproc_t xres, caddr_t resp);
>>> ++		      caddr_t req, xdrproc_t xres, void *resp);
>>> + extern int do_ypcall_tr (const char *domain, u_long prog, =
xdrproc_t xargs,
>>> +-			 caddr_t req, xdrproc_t xres, caddr_t resp);
>>> ++			 caddr_t req, xdrproc_t xres, void *resp);
>>> + extern int yp_maplist (const char *, struct ypmaplist **);
>>> + #endif
>>> diff --git a/meta-networking/recipes-support/nis/yp-tools_3.3.bb =
b/meta-
>> networking/recipes-support/nis/yp-tools_3.3.bb
>>> index b89f0b8..69217fa 100644
>>> --- a/meta-networking/recipes-support/nis/yp-tools_3.3.bb
>>> +++ b/meta-networking/recipes-support/nis/yp-tools_3.3.bb
>>> @@ -11,11 +11,10 @@ ypwhich, yppasswd, domainname, nisdomainname \
>>> and ypdomainname. \
>>> "
>>>=20
>>> -PNBLACKLIST[yp-tools] ?=3D "BROKEN: fails to build for qemuarm."
>>> -
>>> SRC_URI =3D =
"http://www.linux-nis.org/download/yp-tools/${BP}.tar.bz2 \
>>>           file://domainname.service \
>>>           =
file://yp-tools-ipv4-ipv6-Provide-an-in-place-version-of-mapv4v6addr.patch=
 \
>>> +           file://alignment-cheat.patch \
>>> "
>>> SRC_URI[md5sum] =3D "acebeecc11a73fb8097503670344834c"
>>> SRC_URI[sha256sum] =3D =
"812be817df3d4c25813552be336c6c6ad5aedaf65611b81af3ad9f98fb3c2e50"
>>> --
>>> 1.7.9.5
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_06207698-DACE-4BB1-AF57-34C7E3DAA318
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAle19JoACgkQuwUzVZGdMxTM2gCdG9QudkG0i4sMttP38uNu1OIH
9N0AoIWzFv+pMXDIFNLftwbR9Ikhu4sD
=XIx0
-----END PGP SIGNATURE-----

--Apple-Mail=_06207698-DACE-4BB1-AF57-34C7E3DAA318--
