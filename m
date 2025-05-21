Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78207C3ABC9
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 13:19:48 +0000 (UTC)
Received: from outbound5.mail.transip.nl (outbound5.mail.transip.nl [136.144.136.9])
 by mx.groups.io with SMTP id smtpd.web11.5608.1747813156961333658
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 00:39:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=GQXbs85r;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.9, mailfrom: jeroen@myspectrum.nl)
Received: from submission15.mail.transip.nl (unknown [10.103.8.166])
	by outbound5.mail.transip.nl (Postfix) with ESMTP id 4b2NbQ20LDzHTw6;
	Wed, 21 May 2025 09:39:14 +0200 (CEST)
Received: from yellow.myspectrum.nl (yellow.myspectrum.nl [136.144.146.76])
	by submission15.mail.transip.nl (Postfix) with ESMTPSA id 4b2NbN6zykz2mZN1M;
	Wed, 21 May 2025 09:39:12 +0200 (CEST)
Received: from [192.168.178.63] (84-27-20-154.cable.dynamic.v4.ziggo.nl [84.27.20.154])
	(Authenticated sender: jeroen@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id 8F736200E2;
	Wed, 21 May 2025 07:39:11 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=jeroen@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Message-ID: <4568b2f3-6231-4bc4-be50-184bdef4050c@myspectrum.nl>
Date: Wed, 21 May 2025 09:39:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][PATCH 2/2] socketcand: add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
 marc Kleine-Budde <mkl@pengutronix.de>,
 Jeroen Hofstee <jhofstee@victronenergy.com>
References: <20250519141525.3708957-1-jeroen@myspectrum.nl>
 <20250519141525.3708957-2-jeroen@myspectrum.nl>
 <CAMKF1sr_Ss+P2XnuwnJZ+5ZoJY_68+q-5Q0UwJfpR6XBaxsEbw@mail.gmail.com>
From: "Jeroen Hofstee" <jeroen@myspectrum.nl>
In-Reply-To: <CAMKF1sr_Ss+P2XnuwnJZ+5ZoJY_68+q-5Q0UwJfpR6XBaxsEbw@mail.gmail.com>
X-Scanned-By: ClueGetter at submission15.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1747813153; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version:content-type;
 bh=mXgt6bY0+b8s/kaCij0i+frS9g9e5PESFllQCBVbzr0=;
 b=GQXbs85r9E5+f9zZOYLp8WZ2058xEVXhZJTtO+JBGKwyw7rcRl8xxMj4ppDzJRvggl9EwX
 S84q1Hrw8ToeWib1C36bm7RcQTns+oUQV29crSOQ844rs41VJUqh5xsDRlyfXWaznutM6Z
 VkCHkRO58VGKXA1Rb6Ewa/PQv9VWLExGoPc+uWlbxxzeGItn9uGcxZNyretj0KVVj8RILY
 fwO+vcTrRHH79Nz7CO1D0jkKKWwWs+RXpRHXrKo23aFQsQU7Au/SjBTFNa0pZ2Be8dAj6S
 6kkx+gLJEIvb+13EbE2omiFSm8+5Yc494eCcKnSxNdrhk47fKX4OnQYth03r+A==
X-Report-Abuse-To: abuse@transip.nl
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 13:19:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117570

That is odd, I will have a look what is happening there.

On 5/21/25 09:17, Khem Raj wrote:
> Fails to build with gcc-15 -
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2442453/raw_inl=
ine
>
> On Mon, May 19, 2025 at 1:34=E2=80=AFPM jeroen via lists.openembedded.org
> <jeroen=3Dmyspectrum.nl@lists.openembedded.org> wrote:
>> From: Jeroen Hofstee <jhofstee@victronenergy.com>
>>
>> Socketcand allows to transfer socketcan messages over tcp/ip.
>>
>> Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
>> ---
>>   .../recipes-extended/socketcan/socketcand_git.bb | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>   create mode 100644 meta-oe/recipes-extended/socketcan/socketcand_git.b=
b
>>
>> diff --git a/meta-oe/recipes-extended/socketcan/socketcand_git.bb b/meta=
-oe/recipes-extended/socketcan/socketcand_git.bb
>> new file mode 100644
>> index 0000000000..764a87f874
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/socketcan/socketcand_git.bb
>> @@ -0,0 +1,16 @@
>> +SUMMARY =3D "Socketcand, socketcan over tcp/ip"
>> +LICENSE =3D "GPL-2.0-only | BSD-3-Clause"
>> +LIC_FILES_CHKSUM =3D " \
>> +    file://LICENSES/BSD-3-Clause;md5=3D4c00cf8b0a04a9441d8fa24850231d00=
 \
>> +    file://LICENSES/GPL-2.0-only.txt;md5=3Df9d20a453221a1b7e32ae84694da=
2c37 \
>> +"
>> +
>> +SRC_URI =3D "git://github.com/linux-can/socketcand;branch=3Dmaster;prot=
ocol=3Dhttps"
>> +SRCREV =3D "7b5e91ec656b33c325db2f9136daebb9e357bb65"
>> +S =3D "${WORKDIR}/git"
>> +
>> +inherit meson pkgconfig
>> +
>> +PACKAGECONFIG ?=3D "libconfig libsocketcan"
>> +PACKAGECONFIG[libconfig] =3D "-Dlibconfig=3Dtrue,-Dlibconfig=3Dfalse,li=
bconfig"
>> +PACKAGECONFIG[libsocketcan] =3D "-Dlibsocketcan=3Dtrue,-Dlibsocketcan=
=3Dfalse,libsocketcan"
>> --
>> 2.43.0
>>
>>
>>=20
>>

