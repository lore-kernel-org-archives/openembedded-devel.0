Received: from mail01.baslerweb.com (mail01.baslerweb.com [80.156.24.166])
 by mx.groups.io with SMTP id smtpd.web11.906.1596059949179188288
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2020 14:59:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: baslerweb.com, ip: 80.156.24.166, mailfrom: prvs=472508db4=thomas.koeller@baslerweb.com)
Received: from unknown (HELO ahr206s.basler.corp) ([172.16.20.206])
  by mail01-out.baslerweb.com with ESMTP; 29 Jul 2020 23:59:06 +0200
Subject: Re: [oe] [meta-java] commit 90984a33f407265493d54a8240e7d78701b3fb50 breaks build on Ubuntu 16.04
To: <openembedded-devel@lists.openembedded.org>
References: <MKXl.1593173003991452078.9WGL@lists.openembedded.org>
 <20200729052352.GA2877@pcleri>
From: =?UTF-8?B?VGhvbWFzIEvDtmxsZXI=?= <thomas.koeller@baslerweb.com>
Message-ID: <6f231202-0844-e044-4106-b9c120557a01@baslerweb.com>
Date: Wed, 29 Jul 2020 23:59:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200729052352.GA2877@pcleri>
Return-Path: thomas.koeller@baslerweb.com
X-Originating-IP: [172.31.200.3]
X-ClientProxiedBy: ahr205s.basler.corp (172.16.20.205) To ahr206s.basler.corp
 (172.16.20.206)
X-C2ProcessedOrg: edc209ba-7b98-423a-8e4d-b8fa22bc0743
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 29.07.20 07:23, Richard Leitner wrote:
> Hi Thomas,
>=20
> On Fri, Jun 26, 2020 at 05:03:23AM -0700, Thomas K=C3=B6ller wrote:
>> I noticed that building the zeus branch on Ubuntu 16.04 does not work. A=
FAIK Ubuntu 16.04 is still listed as a supported build environment, so this=
 should be fixed.
>>
>> The Problem is that Ubuntu 16.04 comes with gcc 5.4.0, which is too old =
to understand -Wno-error=3Dstringop-overflow; this causes the configure ste=
p of icedtea7-native to fail.
>=20
> Thanks for the catch. Do you have already worked on a patch to fix this
> issue?
>=20
> If yes: It would be great if you could post it to the ml.
>=20
> If not: I'll take a look into creating a fix asap.
>=20
> regards;rl
>=20
> Email scanned successfully
>=20

The fix is obvious: revert commit 90984a33f407265493d54a8240e7d78701b3fb50.

regards,
Thomas


Thomas Koeller=20
Senior Software Developer


Basler AG
An der Strusbek 60-62
22926 Ahrensburg
Germany

Tel. +49 4102 463 390
Fax +49 4102 463 46 390


Thomas.Koeller@baslerweb.com
www.baslerweb.com

Management board: Dr.-Ing. Dietmar Ley (CEO)=C2=A0=C2=B7=C2=A0John P. Jenni=
ngs=C2=A0=C2=B7=C2=A0Arndt Bake =C2=B7=C2=A0Hardy Mehl=20
Chairman of the supervisory board: Norbert Basler=20
Basler AG =C2=B7 Amtsgericht L=C3=BCbeck HRB 4090 =C2=B7 Ust-IdNr.: DE 135 =
098 121 =C2=B7 Steuer-Nr.: 30 292 04497 =C2=B7 WEEE-Reg.-Nr. DE 83888045
