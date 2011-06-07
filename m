Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eyalr@ti.com>) id 1QTx2v-0008E8-M3
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Jun 2011 16:14:17 +0200
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id p57EAxHN005981
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 7 Jun 2011 09:10:59 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep34.itg.ti.com (8.13.7/8.13.8) with ESMTP id p57EAwnE015494
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 7 Jun 2011 09:10:58 -0500 (CDT)
Received: from dnce72.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p57EAwke009444
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 7 Jun 2011 09:10:58 -0500 (CDT)
Received: from dnce02.ent.ti.com ([137.167.131.106]) by dnce72.ent.ti.com
	([137.167.131.87]) with mapi; Tue, 7 Jun 2011 16:10:57 +0200
From: "Reizer, Eyal" <eyalr@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 7 Jun 2011 16:10:57 +0200
Thread-Topic: [oe] [PATCH] crda: fix regulatory domain agent for building
	with libnl2
Thread-Index: AcwlG9bKV8B3VXA9STmq/j8MJoDoKAAAOG6L
Message-ID: <5c905i4sqnunc7svhv1nkl4h.1307456085014@email.android.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH] crda: fix regulatory domain agent for building with libnl2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Jun 2011 14:14:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sure,

However we are on holiday until Thursday and i dont have access to my pc.
I would send it only Thursday morning.

Best regards,
Eyal

Koen Kooi <koen@dominion.thruhere.net> wrote:


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 06-06-11 17:08, Koen Kooi wrote:
> On 06-06-11 17:06, Eyal Reizer wrote:
>> This patch allows building the wireless regulatory domain agent with
>> libnl version 2.
>
>> Signed-off-by: Eyal Reizer <eyalr@ti.com>
>
> Acked-by: Koen Kooi <koen@dominion.thruhere.net>

While the change looks OK, the patch doesn't apply, could you please
send a patch against .dev?

>
>> ---
>>  recipes/crda/crda_1.1.1.bb |    4 +++-
>>  1 files changed, 3 insertions(+), 1 deletions(-)
>
>> diff --git a/recipes/crda/crda_1.1.1.bb b/recipes/crda/crda_1.1.1.bb
>> index cc19b90..046a9b7 100644
>> --- a/recipes/crda/crda_1.1.1.bb
>> +++ b/recipes/crda/crda_1.1.1.bb
>> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://wireless.kernel.org/en/developers/R=
egulatory/CRDA"
>>  SECTION =3D "base"
>>  PRIORITY =3D "optional"
>>  LICENSE =3D "ISC"
>> -PR =3D "r1"
>> +PR =3D "r2"
>
>>  DEPENDS =3D "libgcrypt libnl python-native python-m2crypto-native"
>>  RDEPENDS_${PN} =3D "udev"
>> @@ -12,6 +12,8 @@ SRC_URI =3D "http://wireless.kernel.org/download/crda/=
${P}.tar.bz2;name=3Dcrda \
>>      http://wireless.kernel.org/download/wireless-regdb/regulatory.bins/=
2009.11.25-regulatory.bin;name=3Dreg \
>>      "
>
>> +CFLAGS +=3D " -DCONFIG_LIBNL20"
>> +
>>  do_compile() {
>>      oe_runmake all_noverify
>>  }
>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN7i/IMkyGM64RGpERAo60AJ98NqHO/sxD6Yvx/kOoGde7mQj+EACfYumg
VThloVRT6GzudR2Pal1e6LY=3D
=3DJU6D
-----END PGP SIGNATURE-----


_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


