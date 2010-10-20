Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P8g6b-00087c-7j
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 23:21:54 +0200
Received: by gyd5 with SMTP id 5so374658gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 14:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=qeEBgDgJVCmMZXksXLeWCqM45+kffQtAQjlAinx+j5o=;
	b=F1T0C2xO9dhBl0IVLX0sfr8KEeN4GnZ7JpQjP0oSxMXaoWPJzXZDyPLa8MAp0zh4DN
	UgKcqMpV0OogNm8gd5cXkUlWvIE0rdGIDfgG74zbFHp4mFbQnVnFkysr/tbbXK5CoN4R
	KahQiII1RCB3avyfwh/1uJdMh6Oa3icVcfHck=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ocuBNSfrFtlTDoJr9ngO6qGGlAnJY0HZVLlfIMrrJDYpE2ZWDrri5VVmrCIfxJgecf
	8WL5tfCPckvTuOumXaZwuup+LMKruGYDBxI/+I8ldl382vlHJZQYdrGPWKyX/kcekVL/
	lpFleGAVZD9AmH+L3Fg4ni2h4fgS7O27knSCc=
MIME-Version: 1.0
Received: by 10.150.49.8 with SMTP id w8mr2030214ybw.171.1287609675318; Wed,
	20 Oct 2010 14:21:15 -0700 (PDT)
Received: by 10.151.47.14 with HTTP; Wed, 20 Oct 2010 14:21:15 -0700 (PDT)
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F0803110B3441@dlee06.ent.ti.com>
References: <20101020203828.GU11514@denix.org>
	<131E5DFBE7373E4C8D813795A6AA7F0803110B3441@dlee06.ent.ti.com>
Date: Wed, 20 Oct 2010 23:21:15 +0200
Message-ID: <AANLkTim70imb4L22J7SOQFkrbQ=AyFvSJrq-O_KuPoG2@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: LICENSE field format
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
X-List-Received-Date: Wed, 20 Oct 2010 21:21:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/20 Maupin, Chase <chase.maupin@ti.com>:
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>> Denys Dmytriyenko
>> Sent: Wednesday, October 20, 2010 3:38 PM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: [oe] LICENSE field format
>>
>> All,
>>
>> We've had a number of discussions on the license matter recently. Trying
>> to
>> unify those brings us to the question of the LICENSE field format in
>> recipes.
>> As some projects are dual/triple licensed or use multiple licenses at th=
e
>> same
>> time, it becomes hard to specify it all in the LICENSE field, especially
>> when
>> there are no rules defined. We do have several different formats used to
>> separate multiple licenses, which is quite confusing and doesn't make it
>> clear
>> whether licenses are AND-ed or OR-ed (I know those are not legal terms,
>> but
>> for the purpose of this discussion that's fine :)) Here are some example=
s:
>>
>> LICENSE =3D "License1 License2"
>> LICENSE =3D "License1|License2"
>> LICENSE =3D "License1, License2"
>> LICENSE =3D "License1+License2"
>> LICENSE =3D "License1/License2"
>>
>> LICENSE =3D "Very Long License Name"
>> LICENSE =3D "License with some exceptions"
>
> I would vote for something along the following lines:
>
> LICENSE =3D "License1|License2"
> =A0 =A0 =A0 =A0- This means the code is licensed under the terms of both =
licenses
>
> LICENSE =3D "License1,License2"
> =A0 =A0 =A0 =A0- This means the code can use either license exclusively
>
> in the src_distribute class spaces should be replaced with "-"s. =A0Of co=
urse, this could lead to licenses like "GPLv3+-with-GCC-RLE".
>
> We should avoid separating licenses with "/" because that will mess up th=
e directory structure or "+" because that would be confusing when + is also=
 used to mean "or later" for some licenses like the GPL.
>
>
As a non-native speaker I'm lost wrt the | and , usage.
e.g. perl says either artistic or gplv1+.
I'd say either the difference between | and , needs to be more clearly
explained or we need to have one form.

If spaces are an issue we could use _
I agree with Chase that using + should be restricted to mean "or later"

Frans


