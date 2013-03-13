Received: from mail-da0-f45.google.com ([209.85.210.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UFcaN-0004zY-S2
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 04:42:41 +0100
Received: by mail-da0-f45.google.com with SMTP id v40so213723dad.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Mar 2013 20:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=tobdbmId0oXiSE7eKaepkxVgAoID4j7pCT0RFK6RMbs=;
	b=wiyW7w2IfUoBHbjWkU+cYttkq77c+A7cdriZINgKEeA/fD/lvBjgBflwIrGVIVVPA8
	8TjQ9pqLf/qAs0zMWIUS6sd6SW99PXO5gcbkRINhKoGpFAyviUbePpu22EobHjEZV28z
	pxDiD31RL4tXzOwC3YHxFmA7km4SCAD1AQvve0rt6EQlzXJa6FoULDiyR/xxnl4tXns1
	NCA40lms4j5nEBmFNsoL7l9NrzBZ5MQOF08rZlkQAFZetaLP2+HEdt+rSmCxFY4oKpLx
	n8Isb9kePJNcUXZhWahkUi8N/RJKMc8RfoLTTcHUZBEBdCs52wuiHRN0YcDpmQLHihjm
	zieg==
X-Received: by 10.68.211.37 with SMTP id mz5mr36497232pbc.83.1363145158549;
	Tue, 12 Mar 2013 20:25:58 -0700 (PDT)
Received: from [172.23.7.5] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id xr3sm27603411pbc.46.2013.03.12.20.25.57
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 Mar 2013 20:25:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20130313031343.GA18570@windriver.com>
Date: Tue, 12 Mar 2013 20:25:55 -0700
Message-Id: <CF5E1B15-C4C2-454C-82E1-A5214320C4CA@gmail.com>
References: <20130312211938.GA11498@windriver.com>
	<4C920E00-4E5F-47FF-9DB5-FCE7AE02E08B@gmail.com>
	<20130313031343.GA18570@windriver.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1499)
Subject: Re: question on App bitsize - need the same as the kernel (multilib situation)
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
X-List-Received-Date: Wed, 13 Mar 2013 03:42:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Mar 12, 2013, at 8:13 PM, Amy Fong <amy.fong@windriver.com> wrote:

> It may be a combination of kernel ppc64 + userspace ppc (32);
> or kernel x86-64 + userspace x86-32.


I think you to ship ppc64 C runtime at least and same is true for x86_64
and by bit size you mean machine word length right ? like sizeof(long)

>=20
> On Tue, Mar 12, 2013 at 03:41:29PM -0700, Khem Raj wrote:
>>=20
>> On Mar 12, 2013, at 2:19 PM, Amy Fong <amy.fong@windriver.com> wrote:
>>=20
>>> I need to build an application that has the same bitsize as the =
kernel. But in
>>> my multilib configuration, the default usersapce bitsize is not the =
same as=20
>>> the kernel's bitsize. How do you do this?
>>=20
>> which arch is this ?
>> since generally we have one in multilib combo that matches kernel bit =
size
>> but you might have left it out.=20
>>=20
>>>=20
>>> Thanks!
>>> Amy
>>>=20
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> =
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>=20
>>=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> =
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



