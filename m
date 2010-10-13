Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1P61JH-00082k-0W
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 15:24:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 47A958C6510
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 09:23:30 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 05184-06 for <openembedded-devel@lists.openembedded.org>; 
	Wed, 13 Oct 2010 09:23:30 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id CF8048C5598
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 09:23:29 -0400 (EDT)
Message-ID: <4CB5B2D1.40207@cbnco.com>
Date: Wed, 13 Oct 2010 09:23:29 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1286545200-15699-1-git-send-email-msmith@cbnco.com>
	<1286921208.13054.18.camel@mattotaupa>
In-Reply-To: <1286921208.13054.18.camel@mattotaupa>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH resend 1/4] make 3.82: set DEFAULT_PREFERENCE = "-1"
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
X-List-Received-Date: Wed, 13 Oct 2010 13:24:01 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Paul Menzel wrote:
> Am Freitag, den 08.10.2010, 09:39 -0400 schrieb Michael Smith:
>> This version has introduced several backwards incompatibilities and so=
me
>> packages are known not to build with 3.82. In particular:
>>
>> - glibc-initial fails in do_install when prefix=3D"".
>> - eglibc manual/Makefile has not yet been patched (see 3a06f50f)
>=20
> Are there patches for these problems available upstream?

For eglibc, yes. For glibc-initial, no - this one seems like a make bug=20
and I don't have time to hunt it down.

>> Signed-off-by: Michael Smith <msmith@cbnco.com>
>> ---
>>  recipes/make/make_3.82.bb |    3 +++
>>  1 files changed, 3 insertions(+), 0 deletions(-)
>>
>> diff --git a/recipes/make/make_3.82.bb b/recipes/make/make_3.82.bb
>> index 3cdc0a0..86c58d6 100644
>> --- a/recipes/make/make_3.82.bb
>> +++ b/recipes/make/make_3.82.bb
>> @@ -1,5 +1,8 @@
>>  require make.inc
>> =20
>> +# Stock eglibc fails to build with make 3.82.
>=20
> What do you mean by =C2=BBstock=C2=AB? The pristine upstream version or=
 the
> version in OE?

The older versions in OE. Later upstream versions might have the patch.

>=20
>> +DEFAULT_PREFERENCE =3D "-1"
>> +
>>  BBCLASSEXTEND =3D "native"
>>  SRC_URI[md5sum] =3D "1a11100f3c63fcf5753818e59d63088f"
>>  SRC_URI[sha256sum] =3D "e2c1a73f179c40c71e2fe8abf8a8a0688b84995385129=
84da4a76958d0402966"
>=20
>=20
> Thanks,
>=20
> Paul


