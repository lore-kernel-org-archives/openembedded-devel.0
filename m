Return-Path: <piotr.lewicki@elfin.de>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1E29960796
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jan 2017 14:52:40 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id c85so181611793wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Jan 2017 06:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elfin.de; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=AuMoGNCx3mxIUqwU1743C1gcyKpz7Cuye2RcnJnzvAA=;
	b=AI7DMHEostXDLuBJbwNv5LKtmspYk5FL0tnlnIyz5+2RJt5p6kZX31G6U9R4MrzYi5
	fDWvM8QqQbykIW6aPjU8AYbJCs2q0Gs+rHDeixHa9O8VjciB9t7ckS/e565cuDSJpNlw
	EXjk3tOSQr/+itc3peBe4CSC4146cP3VLg6teSkAJIo3hxnc7kQkZqcCe9fE5u4NPI+d
	vZDF4AIU9IZu9jiBuOnzL70tfAVdN82FzR+MVKjJKrE2AhHqZtXOvwlxjN3meh2j+gyk
	b9XbpM1S6+ildKhwDz3GvKWNL7WCMesyDAAmSkAzBwnl0fhyeUZNXxXnNzT4NqxJuU/Q
	PTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=AuMoGNCx3mxIUqwU1743C1gcyKpz7Cuye2RcnJnzvAA=;
	b=F6VrHHCnZJI1d7nLx2KUKB50BpceojvG6mKjaZ2fHHGE3FfZaEA1IrWDu1djnuj1C4
	+Ycp/baRGSRiREiD7Y3MHX0CvDo/CbyTwRMsESDBwagzCO7p7+/822J5pGAcMSxTgxH+
	IouJxS02N1sP+g5WqDaTZ96AiyP2xxRFljYEZJIR8x+6dEsNz713znE1uEV/BPJ9R8Ps
	y9sN4URmoa/Eu9KBYLqDrmddMkmZ43B21pQhQ+EnxDNCSL0pGixUDnIJy4t04JfhigLW
	ZFnfhp4PC7gfoI5Fwaml1yigaeeWwKgKaegMiVCwAp2a/dEqoosTgMojmCanwlqtVaCy
	M1SQ==
X-Gm-Message-State: AIkVDXLCc/1MnLfIaIDyVINeQD4W+PZSc7b0GzsiTsG4HbpHY2tna9OHhQWywvlwjj4E6w==
X-Received: by 10.28.230.194 with SMTP id e63mr43888960wmi.25.1483368760387;
	Mon, 02 Jan 2017 06:52:40 -0800 (PST)
Received: from [192.168.2.176] (b2b-94-79-174-114.unitymedia.biz.
	[94.79.174.114]) by smtp.gmail.com with ESMTPSA id
	x5sm88207764wje.36.2017.01.02.06.52.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Jan 2017 06:52:39 -0800 (PST)
To: openembedded-devel@lists.openembedded.org,
	Armin Kuster <akuster808@gmail.com>
References: <CADnUhn2STGnqzDuYoAo8yLvDnPFcmm+4M+xq387oxdhwF_pFMQ@mail.gmail.com>
	<CAKuJqM9sse_hCpGQBbfQrcCThtichn=WLeuA2iEEU=NP9N_nMw@mail.gmail.com>
	<CADnUhn16Dyc2tnRgQtGMwy6xuBKchjWP3oCtnRdpg4GK1L0BcQ@mail.gmail.com>
	<20170102142908.GB3954@jama>
	<94a0855e-a1a5-dd20-9854-c16fd17f2da9@elfin.de>
	<CA+chaQcezBrHioSU6SsVt_NzLgqhVx2+ZG5+2UPXT9vgL1P7nQ@mail.gmail.com>
From: Piotr Lewicki <piotr.lewicki@elfin.de>
Message-ID: <8d2d2e87-8d6e-bf4c-4555-73e266971f11@elfin.de>
Date: Mon, 2 Jan 2017 15:52:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQcezBrHioSU6SsVt_NzLgqhVx2+ZG5+2UPXT9vgL1P7nQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 02 Jan 2017 14:52:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Ok. Thanks

@Armin? Can you include this?

On 02.01.2017 15:47, Martin Jansa wrote:
> You need to ask armin to include it in next pull request for morty and
> krogoth.
>
> On Mon, Jan 2, 2017 at 3:31 PM, Piotr Lewicki <piotr.lewicki@elfin.de>
> wrote:
>
>> On 02.01.2017 15:29, Martin Jansa wrote:
>>
>>> On Mon, Jan 02, 2017 at 04:20:37PM +0200, matti kaasinen wrote:
>>>
>>>> Olkesandr,
>>>> Actually it was regarding that jquery library that I patched today. That
>>>> really was pretty trivial fix if fix at all ­- just to make it more
>>>> formal.
>>>> However, I really do not know if it is just to update Apache version or
>>>> is
>>>> there something else to do. Pure revision change would be trivial for me,
>>>> too, or actually a new recipe should be made. Other choice would be
>>>> trying
>>>> to find that older version of Apache and fix source URL accordingly.
>>>> It seems that old version is in archive:
>>>> https://archive.apache.org/dist/httpd/
>>>> I'm fine making the patch to update SRC to point to apache archive.
>>>> However, recipe seems using several patches that I do not care creating
>>>> for
>>>> the new release now. That should do someone more devoted to apache
>>>> functionality, I suppose.
>>>> -Matti
>>>>
>>> Or just read last 2 weeks on this ML to find:
>>> https://patchwork.openembedded.org/patch/135494/
>>> and related discussion and just ask for backporting this to krogoth
>>> branch
>>>
>> @Martin: Could I ask you to also port it to morty?
>>
>>
>>
>>
>>>> 2017-01-02 15:46 GMT+02:00 Oleksandr Kravchuk <
>>>> oleksandr.kravchuk@pelagicore.com>:
>>>>
>>>> Matti -
>>>>> As I have previously suggested, you can make a patch and send it to
>>>>> this mailing list. Here is an instruction:
>>>>> http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
>>>>>
>>>>> Would you like to try to do it yourself or you actually want us to fix
>>>>> it?
>>>>>
>>>>> On 2 January 2017 at 14:15, matti kaasinen <matti.kaasinen@gmail.com>
>>>>> wrote:
>>>>>
>>>>>> Hi!
>>>>>>
>>>>>> http://www.apache.org/dist/httpd/httpd-2.4.23.tar.bz2 has been
>>>>>> removed.
>>>>>> Latest/current version on http://www.apache.org/dist/httpd/ page is
>>>>>> httpd-2.4.25.tar.bz2. This crashes fetcher of
>>>>>> meta-openembedded/meta-webserver/recipes-httpd/apache2/apach
>>>>>> e2_2.4.23.bb
>>>>>> that is Krogoth recipe for apache2.
>>>>>>
>>>>>> Thanks,
>>>>>> Matti
>>>>>> --
>>>>>> _______________________________________________
>>>>>> Openembedded-devel mailing list
>>>>>> Openembedded-devel@lists.openembedded.org
>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>>>
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-devel mailing list
>>>>> Openembedded-devel@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>>
>>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>
>>>
>>> --
>> Piotr Lewicki
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
--
Piotr Lewicki

