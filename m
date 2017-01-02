Return-Path: <matti.kaasinen@gmail.com>
Received: from mail-ua0-f175.google.com (mail-ua0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 43F20606A8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jan 2017 18:58:05 +0000 (UTC)
Received: by mail-ua0-f175.google.com with SMTP id i68so202321896uad.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Jan 2017 10:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=J85ms7SPGUXRmGCvpUICA9BmEijvAi0OfvL/eO3TDo8=;
	b=L7OsItTxq1XDbfN4TKD7T9c0ci1dKZ0p9+Iirjd4sxI106D0izEqQSfahGq8GeBmF6
	HDKra2KeVnN3mFVRlOSWzFGT8+yLpTuhjip5nZnS7aQtO7skggx1diq/59sGiw/QDs/W
	KwyDzYJiQ9lfm72BbXswm9Gz654Q11BLBU37sXXEQ9rWk9IAjAqzTjIca8JkvhMQOSXQ
	MUMvA8XxrArW3HKNvD5emoBd6EEtrqG+dwBzuVm5pEqVz/XJm7St7vMrNjyw5jWfum8F
	grZehU68kBqGEn3WjI3r/virSUcoey40A99i8utAA7fD0U46iM0XB1EjnaMMJIWSVksY
	SdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=J85ms7SPGUXRmGCvpUICA9BmEijvAi0OfvL/eO3TDo8=;
	b=kxJ/8uez6uhfOvz59QacVYJnMYzwHoz1U9tBilwVDvsPkMiKT4T44Zz4rYJ7LDcXSx
	UUIZy74118dfg1Gzl/3Rh6Ccpp4BaEZuJnqTdZSt2Y50TkOBRJRwXFyOz6UlURr13gqF
	YJodsURGZjw17Ze1TQN4M5fz9NeOCyOYcEgouqq/B8237cmdhZDI4T3JyDT1dZn3ivCj
	EuTgLTPKK2n7w1OCuM+EE8Xzhf8mLD0VZJXOXmpylBIIDL2j8yDzHjg5wTVWcX49RxbY
	1J0WDPcJZ7TdgY42q1p0s1jVa4t64mxto/0rnF8c80nc1nRplOLax5QTacFFiawpAr44
	KS2g==
X-Gm-Message-State: AIkVDXLAsrTQpy4pzNx7sJIC7UNFWCO2o1ORtLWPwOiu061+XZsRrmvbHm+E6eSUH6mhGIQNlCsUzlJb4Vtyjg==
X-Received: by 10.176.2.145 with SMTP id 17mr36519880uah.38.1483383485437;
	Mon, 02 Jan 2017 10:58:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.103.14.2 with HTTP; Mon, 2 Jan 2017 10:58:04 -0800 (PST)
In-Reply-To: <8d2d2e87-8d6e-bf4c-4555-73e266971f11@elfin.de>
References: <CADnUhn2STGnqzDuYoAo8yLvDnPFcmm+4M+xq387oxdhwF_pFMQ@mail.gmail.com>
	<CAKuJqM9sse_hCpGQBbfQrcCThtichn=WLeuA2iEEU=NP9N_nMw@mail.gmail.com>
	<CADnUhn16Dyc2tnRgQtGMwy6xuBKchjWP3oCtnRdpg4GK1L0BcQ@mail.gmail.com>
	<20170102142908.GB3954@jama>
	<94a0855e-a1a5-dd20-9854-c16fd17f2da9@elfin.de>
	<CA+chaQcezBrHioSU6SsVt_NzLgqhVx2+ZG5+2UPXT9vgL1P7nQ@mail.gmail.com>
	<8d2d2e87-8d6e-bf4c-4555-73e266971f11@elfin.de>
From: matti kaasinen <matti.kaasinen@gmail.com>
Date: Mon, 2 Jan 2017 20:58:04 +0200
Message-ID: <CADnUhn2472gx8N_KUh=9L=8pANy6W8iWKYOxFdvf7s8j=zTG=g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: apache2_2.4.23.bb fetcher crashes
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
X-List-Received-Date: Mon, 02 Jan 2017 18:58:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thanks for your advices Martin.
So Armin, could you please backport this
https://patchwork.openembedded.org/patch/135494/ to krogoth or actually
backport patched apache2_2.4.25.bb, if possible?
-Matti

2017-01-02 16:52 GMT+02:00 Piotr Lewicki <piotr.lewicki@elfin.de>:

> Ok. Thanks
>
> @Armin? Can you include this?
>
>
> On 02.01.2017 15:47, Martin Jansa wrote:
>
>> You need to ask armin to include it in next pull request for morty and
>> krogoth.
>>
>> On Mon, Jan 2, 2017 at 3:31 PM, Piotr Lewicki <piotr.lewicki@elfin.de>
>> wrote:
>>
>> On 02.01.2017 15:29, Martin Jansa wrote:
>>>
>>> On Mon, Jan 02, 2017 at 04:20:37PM +0200, matti kaasinen wrote:
>>>>
>>>> Olkesandr,
>>>>> Actually it was regarding that jquery library that I patched today.
>>>>> That
>>>>> really was pretty trivial fix if fix at all =C2=AD- just to make it m=
ore
>>>>> formal.
>>>>> However, I really do not know if it is just to update Apache version =
or
>>>>> is
>>>>> there something else to do. Pure revision change would be trivial for
>>>>> me,
>>>>> too, or actually a new recipe should be made. Other choice would be
>>>>> trying
>>>>> to find that older version of Apache and fix source URL accordingly.
>>>>> It seems that old version is in archive:
>>>>> https://archive.apache.org/dist/httpd/
>>>>> I'm fine making the patch to update SRC to point to apache archive.
>>>>> However, recipe seems using several patches that I do not care creati=
ng
>>>>> for
>>>>> the new release now. That should do someone more devoted to apache
>>>>> functionality, I suppose.
>>>>> -Matti
>>>>>
>>>>> Or just read last 2 weeks on this ML to find:
>>>> https://patchwork.openembedded.org/patch/135494/
>>>> and related discussion and just ask for backporting this to krogoth
>>>> branch
>>>>
>>>> @Martin: Could I ask you to also port it to morty?
>>>
>>>
>>>
>>>
>>> 2017-01-02 15:46 GMT+02:00 Oleksandr Kravchuk <
>>>>> oleksandr.kravchuk@pelagicore.com>:
>>>>>
>>>>> Matti -
>>>>>
>>>>>> As I have previously suggested, you can make a patch and send it to
>>>>>> this mailing list. Here is an instruction:
>>>>>> http://www.openembedded.org/wiki/How_to_submit_a_patch_to_Op
>>>>>> enEmbedded
>>>>>>
>>>>>> Would you like to try to do it yourself or you actually want us to f=
ix
>>>>>> it?
>>>>>>
>>>>>> On 2 January 2017 at 14:15, matti kaasinen <matti.kaasinen@gmail.com=
>
>>>>>> wrote:
>>>>>>
>>>>>> Hi!
>>>>>>>
>>>>>>> http://www.apache.org/dist/httpd/httpd-2.4.23.tar.bz2 has been
>>>>>>> removed.
>>>>>>> Latest/current version on http://www.apache.org/dist/httpd/ page is
>>>>>>> httpd-2.4.25.tar.bz2. This crashes fetcher of
>>>>>>> meta-openembedded/meta-webserver/recipes-httpd/apache2/apach
>>>>>>> e2_2.4.23.bb
>>>>>>> that is Krogoth recipe for apache2.
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Matti
>>>>>>> --
>>>>>>> _______________________________________________
>>>>>>> Openembedded-devel mailing list
>>>>>>> Openembedded-devel@lists.openembedded.org
>>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>>>>
>>>>>>> --
>>>>>> _______________________________________________
>>>>>> Openembedded-devel mailing list
>>>>>> Openembedded-devel@lists.openembedded.org
>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>>>
>>>>>> --
>>>>>>
>>>>> _______________________________________________
>>>>> Openembedded-devel mailing list
>>>>> Openembedded-devel@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>>
>>>>>
>>>> --
>>>>
>>> Piotr Lewicki
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>> --
> Piotr Lewicki
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

