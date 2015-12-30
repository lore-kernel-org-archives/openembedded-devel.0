Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id AAF8873166
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 22:05:47 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id 78so147197492pfw.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 14:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=BOTmvI3k3sPO81LYs6MzG2oayjTET6e/qOPFMpmc/nE=;
	b=UtAwsn1MzQTrKW9W9NeF/7tpHSIJe/zdcGWEDUkWIt4fGMK4+kifNtHVomhLXxLftW
	Qn1TrsOyGQSR3+aDIspsmS7Us5/jFl6zuH0QG0PhswF7etS2JQqdcRObcU2A4S9C669W
	byxDVkvqcM+a2DG3OPQ8lTp0UXKwa7F+Te4//xbzy1cSJNF/bwLlKZMN9lPrfwTxowjh
	XjLBD+8t1/Nv0D2bXjj9PDw4XPVmSgAqv01X38ssn75rZYehviBi+J7dRgZJg/aDu1mS
	x4lWWn10jpvwY5tUFzXdpia5X4B7l5LVnHPj9Yu8ziZXB4BME68s2iDycFDS4HVbhlbi
	hLBg==
X-Received: by 10.98.71.91 with SMTP id u88mr87022322pfa.30.1451513147717;
	Wed, 30 Dec 2015 14:05:47 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:30cb:380:8779:5f88?
	([2601:646:8802:5d5c:30cb:380:8779:5f88])
	by smtp.gmail.com with ESMTPSA id
	o13sm43111727pfi.2.2015.12.30.14.05.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Dec 2015 14:05:46 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <568454B1.4080803@gmail.com>
Date: Wed, 30 Dec 2015 14:05:42 -0800
Message-Id: <E160C73D-40EA-49B2-9EF1-00FE55BF86E5@gmail.com>
References: <1451506017-6206-1-git-send-email-twoerner@gmail.com>
	<D7088E06-64E6-48CF-B84B-4E47815CFA38@gmail.com>
	<568454B1.4080803@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Subject: Re: [meta-oe][PATCH v2] nodejs: update from 4.2.3 to 4.2.4
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
X-List-Received-Date: Wed, 30 Dec 2015 22:05:47 -0000
X-Groupsio-MsgNum: 59245
Content-Type: multipart/signed;
	boundary="Apple-Mail=_14828E8D-462A-403B-B7AB-A52A1A90FA9A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_14828E8D-462A-403B-B7AB-A52A1A90FA9A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Dec 30, 2015, at 2:03 PM, Trevor Woerner <twoerner@gmail.com> =
wrote:
>=20
> On 12/30/15 15:48, Khem Raj wrote:
>>> On Dec 30, 2015, at 12:06 PM, Trevor Woerner <twoerner@gmail.com> =
wrote:
>>>=20
>>> Additionally, the LICENSE file changed: Updated node LICENSE file =
with new npm
>>> license:
>>>=20
>>> - npm's license changed from being copyrighted "Isaac Z. Schlueter" =
to "npm,
>>> Inc. and Contributors"; more text was added clarifying the =
copyrights to
>>> things such as the npm logo, the typeface, and trademarks
>> Does this mean we need to alter packaging of these files ?
>> are there any commercial implications ?
>=20
> I'm not a lawyer so I can't say for certain and, to be honest, I don't
> spend much time understanding all the licensing issues revolving =
around
> Free/OpenSource Software, but both before and after this change the
> licensing of npm itself was and is Artistic License 2.0.

Yes. please include exact diff instead of summarizing as your patch =
does.


>=20
> before:
>=20
> -    Copyright (c) Isaac Z. Schlueter
> -    All rights reserved.
> -    npm is released under the Artistic 2.0 License.
> -    The text of the License follows:
>=20
> after:
>=20
> +    The npm application
> +    Copyright (c) npm, Inc. and Contributors
> +    Licensed on the terms of The Artistic License 2.0
> ... and then it goes on to mention that npm packages are licensed by
> their creators, npm isn't responsible for them or their contents, and
> specifies the ownership of various trademarks, logos, and the =
licensing
> of the typeface used on their website.
>=20
> So my best guess is that nothing has changed other than a legal entity
> was created "npm, Inc." to oversee npm instead of one person being
> personally responsible. But, like I said, I'm no expert in these =
things.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_14828E8D-462A-403B-B7AB-A52A1A90FA9A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaEVTkACgkQuwUzVZGdMxRtKQCffag/4lyBxBsSzLI92hPcHowX
Tg0AoJMZ9+4vZaHfP7rOPM8JW3Py6G3i
=GItd
-----END PGP SIGNATURE-----

--Apple-Mail=_14828E8D-462A-403B-B7AB-A52A1A90FA9A--
