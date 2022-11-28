Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FBAC43217
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 13:13:10 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.117219.1669641180193212263
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Nov 2022 05:13:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: u.oelmann@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1ozdwP-0001EX-1x; Mon, 28 Nov 2022 14:12:57 +0100
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1ozdwI-007Zjt-Rl; Mon, 28 Nov 2022 14:12:50 +0100
References: <20221125123532.938920-1-u.oelmann@pengutronix.de>
 <14384172-6b21-6a13-5896-c25c081ef08b@gmail.com>
User-agent: mu4e 1.6.9; emacs 29.0.50
From: Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: Henning Heinold <henning@itconsulting-heinold.de>, Otavio Salvador
 <otavio.salvador@ossystems.com.br>, Richard Leitner
 <richard.leitner@skidata.com>, openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-java][PATCH] jsch: switch to inclusive language
Date: Mon, 28 Nov 2022 14:11:22 +0100
In-reply-to: <14384172-6b21-6a13-5896-c25c081ef08b@gmail.com>
Message-ID: <6rtu2j1aul.fsf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: u.oelmann@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 13:13:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99824

Hi Jacob,

On Fri, Nov 25 2022 at 14:57 +0100, "Jacob Kroon" <jacob.kroon@gmail.com> w=
rote:
> On 11/25/22 13:35, Ulrich =C3=96lmann wrote:
>> Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
>> ---
>>   recipes-core/jcraft/jsch_0.1.40.bb | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>> diff --git a/recipes-core/jcraft/jsch_0.1.40.bb
>> b/recipes-core/jcraft/jsch_0.1.40.bb
>> index 07d5b9e3108e..259712661f4d 100644
>> --- a/recipes-core/jcraft/jsch_0.1.40.bb
>> +++ b/recipes-core/jcraft/jsch_0.1.40.bb
>> @@ -25,8 +25,8 @@ do_compile() {
>>   SRC_URI[md5sum] =3D "b59cec19a487e95aed68378976b4b566"
>>   SRC_URI[sha256sum] =3D "ca9d2ae08fd7a8983fb00d04f0f0c216a985218a5eb364=
ff9bee73870f28e097"
>>   -# Whitelist the CVE because it only affects Windows platforms
>> -CVE_CHECK_WHITELIST +=3D "CVE-2016-5725"
>> +# Ignore the CVE because it only affects Windows platforms
>> +CVE_CHECK_IGNORE +=3D "CVE-2016-5725"
>>     BBCLASSEXTEND =3D "native"
>>
>
> Also your commit:
>
> 3161106f0879a6be0a016df3a8bb8fa800bd6044
> openjdk-8: refresh patches
>
> seems to have *introduced* fuzz warnings, rather than fix any on master b=
ranch
> ...

after reading your hint, at first sight I felt ashamed seeing that my
refreshed patches introduce fuzz warnings instead of fixing them as was
intended by me. Looking more closely I then realized that before my
commit 3161106f0879 ("openjdk-8: refresh patches") it was openjdk-8
where the patches did not apply cleanly (but openjdk-8-native where
everything was okay) while after that commit it is exactly the other way
round. Unfortunately I did not realize that when I stumbled across it
originally, sigh. At the bottom line sadly my commit neither improved
the overall situation nor did it worsen it. So: sorry for the noise!

Best regards
Ulrich


> Jacob
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

