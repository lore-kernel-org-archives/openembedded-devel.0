Return-Path: <clopez@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id 4A9D673CBD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 14:07:35 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2CnAgBcd/lV/5tjdVtdGQEBgwhUaYVKt2IOgXWFfQKBPTgUAQEBAQEBAYEKhCQBAQR4EQsYCRYPCQMCAQIBDzYTBgICiBUDFgHFOw2EYgELIIZzhH2CUIFYbBeEFQEElV6CSYFdaoYGgW6TU4c+HwFDhAM8MwEBiGCBSAEBAQ
X-IPAS-Result: A2CnAgBcd/lV/5tjdVtdGQEBgwhUaYVKt2IOgXWFfQKBPTgUAQEBAQEBAYEKhCQBAQR4EQsYCRYPCQMCAQIBDzYTBgICiBUDFgHFOw2EYgELIIZzhH2CUIFYbBeEFQEElV6CSYFdaoYGgW6TU4c+HwFDhAM8MwEBiGCBSAEBAQ
X-IronPort-AV: E=Sophos;i="5.17,539,1437429600"; 
	d="asc'?scan'208";a="23567988"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 16 Sep 2015 16:07:30 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim) id 1ZcDMw-00064G-59
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 16:07:30 +0200
Received: from fanzine.local.igalia.com ([192.168.10.13] helo=[10.76.0.26])
	by mail.igalia.com with esmtps 
	(Cipher TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim)
	id 1ZcDMv-0007p7-Vk for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 16:07:30 +0200
To: openembedded-devel@lists.openembedded.org
references: <1442321402-22469-1-git-send-email-clopez@igalia.com>
	<1442321402-22469-2-git-send-email-clopez@igalia.com>
	<55F8333A.9000007@gmail.com>
	<CAMKF1srGtU9VS9FHTRsKACHXwJSmTQGVjg25ORom7w=_GM=QWw@mail.gmail.com>
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
openpgp: id=B5D2B50BC48EC7F1EE90D9AB965089CE6B95F882;
	url=http://key.neutrino.es
organization: Igalia S.L.
message-id: <55F9779A.8020402@igalia.com>
Date: Wed, 16 Sep 2015 16:07:22 +0200
user-agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:38.0) Gecko/20100101 Icedove/38.0
mime-version: 1.0
in-reply-to: <CAMKF1srGtU9VS9FHTRsKACHXwJSmTQGVjg25ORom7w=_GM=QWw@mail.gmail.com>
Subject: Re: [meta-browser][PATCH 1/3] chromium: Allow to build in Debug mode.
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
X-List-Received-Date: Wed, 16 Sep 2015 14:07:37 -0000
X-Groupsio-MsgNum: 57390
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="S0mMCEcREiA8ceIgFhCFTFSwrO2mId1eM"

--S0mMCEcREiA8ceIgFhCFTFSwrO2mId1eM
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 15/09/15 19:00, Khem Raj wrote:
> On Tue, Sep 15, 2015 at 8:03 AM, Trevor Woerner <twoerner@gmail.com> wr=
ote:
>> On 09/15/15 08:50, Carlos Alberto Lopez Perez wrote:
>>>   * Add also a patch that workarounds a build error when building
>>>     in Debug mode and using GCC. This patch has no effect when
>>>     building in Release mode because is guarded within ifdef(debug)
>>>     blocks.
>>>
>>> Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
>>> ---
>>>  recipes-browser/chromium/chromium.inc              |  4 ++-
>>>  .../fix-build-error-with-GCC-in-Debug-mode.patch   | 32 ++++++++++++=
++++++++++
>>>  recipes-browser/chromium/chromium_40.0.2214.91.bb  |  1 +
>>>  3 files changed, 36 insertions(+), 1 deletion(-)
>>>  create mode 100644 recipes-browser/chromium/chromium/chromium-40/fix=
-build-error-with-GCC-in-Debug-mode.patch
>>
>> Does the above patch need an upstream-status tag?
>=20
> Its not must for meta-broweser, but its good since it adds
> information. We do not have any automatic tracking of patch status
> so if one mentions url for source of patch or any information on where
> patch's status can be asserted at later times is good.
>=20

The patch itself includes in the comments at top the URL to the chromium
bugtracker where the issue was reported and the patch forwarded.


--S0mMCEcREiA8ceIgFhCFTFSwrO2mId1eM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: You can fetch my GnuPG key from http://key.neutrino.es

iQIcBAEBCgAGBQJV+XehAAoJEJZQic5rlfiCLxAP/0CqAVN7/K592fDfiHaaCEr8
zHzQgaKGGX7hTPc18RL8OweRhC7P0zqKe9V+xOY6KihXCyNEvfZ68Z2p5CKKlnLs
IOJPmWOMEVx/yyHPx0bfkwvL7E+HB5UWHDpIyjE8X1gaBB0r95aM1bOssS4Z1uPi
GFaqBQEs/TQJ7njFtBPHpS2qUnapWRhgWN8jZMVc52nFu6rQb3QSkweQPFcqNUu2
izbcuLBweRNTv69tgiQRhwSIhI8EkC1y9T1Lq+hCFWwlkuMkN6XKUxrifmPk70JP
kbeNzgeOK9Oz9j9Xgoc7wJFDlmk9viSY5qP0pIedcJN6rHvFBUbQBJWRDJkb6eR0
4tbqKCs5xtj35UkLxccUrs4FVuBzf+TCRZS7aGPEEgjX1dlAgwBVmm6GZ/mcEAIx
U8xhIy6FaB37hnLjZpKA0eUHZv/mEvH7x54sMBa/oh2UM8NLY+8OOtn/e8rvVqZJ
7rdmyxGvF3FqN3cCUeK+XJxv4KhNMZE7657EUO2A0LseqKE1h3Tbx8vk0BczgHoS
Sf/iMrSVRgvb4E0UuMKNPc1s+ZgCr//SHILyjGr9Pkrsuij1rRSNQiD7lp7OjPJR
vhRlZEwU80qPtvs/Bk4BT9fm7fD0wj+1OBQFlRTrAsgRl+BGlDpzIW+hbxmnK2Hk
AH+87gvKNNrMLvTEMSZI
=Cijh
-----END PGP SIGNATURE-----

--S0mMCEcREiA8ceIgFhCFTFSwrO2mId1eM--
