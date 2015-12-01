Return-Path: <ticotimo@gmail.com>
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id EC858606D1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Dec 2015 03:19:24 +0000 (UTC)
Received: by ykba77 with SMTP id a77so209538974ykb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Nov 2015 19:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:subject:references:content-type:in-reply-to:message-id:date:to
	:content-transfer-encoding:mime-version;
	bh=QFO0S1Ej+JU2t8ClliPVs/c4VidWiU0zq8PYYKCvpc0=;
	b=ZsPzojUwINa3+D1tC77mMoWPDJns5pV5vBzYBsce3zMEYGc+cr/+QHjXPDi2r4lnzd
	BEgk6FSMa6oSa7q5An4zkDDK+Gay/b7ccQvvLLdLoNbB12YHdT33bIU5XwvKW254YSRI
	hDSzU30CrWyT/If2x7TYHmgCTE0OlI02AKalmUrMJ0zqxvkGGdHqyacnpFYCjUFLSThu
	yFgcX/CSyArI1leXyJ0vZHlKF4dLBw26PPB+uTjh+/41xb6L8YPbuX47zIkbj1RkD1Py
	30YmEY4dy48MFxU6VnGcGmoUxNBw/iYSzqmN1h0QWSFCW8Baog7NQ6WBmP1lB4XNiEjw
	b6kg==
X-Received: by 10.129.87.212 with SMTP id l203mr23251853ywb.55.1448939965526; 
	Mon, 30 Nov 2015 19:19:25 -0800 (PST)
Received: from [192.168.1.115] (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by smtp.gmail.com with ESMTPSA id
	i12sm41002886ywg.40.2015.11.30.19.19.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Nov 2015 19:19:24 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
References: <CAPuovEJ8VKxjqWoXyUxw0VKLZy3E+uP4OTGjXMo6u7dKD9hQqw@mail.gmail.com>
X-Mailer: iPad Mail (13B143)
In-Reply-To: <CAPuovEJ8VKxjqWoXyUxw0VKLZy3E+uP4OTGjXMo6u7dKD9hQqw@mail.gmail.com>
Message-Id: <EF54A0B9-9FF0-4C2D-82C2-7134EA8974AB@gmail.com>
Date: Mon, 30 Nov 2015 19:19:19 -0800
To: openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (1.0)
Subject: Re: [meta-python][PATCH] python-cryptography, python-cryptography-vectors: uprev
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
X-List-Received-Date: Tue, 01 Dec 2015 03:19:28 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Nov 30, 2015, at 7:01 PM, Mark Asselstine <mark.asselstine@windriver.co=
m> wrote:
>=20
> On Sat, Nov 28, 2015 at 9:35 AM, Mark Asselstine
> <mark.asselstine@windriver.com> wrote:
>> On Wed, Nov 25, 2015 at 3:11 AM, Anders Darander <anders@chargestorm.se> w=
rote:
>>> * Tim Orling <ticotimo@gmail.com> [151124 19:00]:
>>>=20
>>>> We have never carried a license in meta-python, rather we use the
>>>> common-licenses from oe-core (
>>>> http://git.openembedded.org/openembedded-core/tree/meta/files/common-li=
censes
>>>> ).
>>>=20
>>> Does the Unicode license exist under another name in oe-core? Otherwise,=

>>> I'd assume that Mark did the right thing to add it here.
>>=20
>> I will look around to see that it is not duplication. I will also try
>> to assess the number of projects out there that might eventually be
>> added to oe that would warrant us putting this in 'common-licenses'
>> off the bat.
>=20
> I have looked around and still feel this is the best place for the
> license file. At any rate let me know if I should change this commit
> and I will gladly make needed adjustments.
>=20
That's fine by me. I just wanted to voice my concern, as this does set a pre=
cedent for the layer. I also wanted some discussion on the topic. We've now h=
ad time for that. We can always move the license file later if that becomes d=
esirable.

Thank you for investigating.

--Tim

> Thanks,
> Mark
>=20
>>=20
>> Mark
>>=20
>>>=20
>>> Cheers,
>>> Anders
>>>=20
>>>> Regards,
>>>=20
>>>> --Tim
>>>=20
>>>> On Mon, Nov 23, 2015 at 9:13 AM, Mark Asselstine <
>>>> mark.asselstine@windriver.com> wrote:
>>>=20
>>> --
>>> Anders Darander, Senior System Architect
>>> ChargeStorm AB / eStorm AB
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

