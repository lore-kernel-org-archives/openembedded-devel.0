Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f174.google.com (mail-wj0-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 99F1B600EB
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jan 2017 14:47:30 +0000 (UTC)
Received: by mail-wj0-f174.google.com with SMTP id v7so426358799wjy.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Jan 2017 06:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6lhl7v71fxou538LR4m+ijPkeqDAMJ9pRVthyjD1HSY=;
	b=Wqb+n10qtZrsUhBjzBFMRE+uSTum76cOMl2sGXyiITCKTXFsllEj4Vb2CeUxwAGqr+
	PDfqa8uI/quZMZO12AG/MbwOZ+vbrYK1dJCoWvOg7Rl/QwgEnMnHfn1d/WZu8hgs1e8/
	lS5pXz8N32jkvtqlmaCfwhLwqEADP45HIQk+aNh8vacWPnHvJATgn5SfrEGB4IDOWJ4e
	Jai4VyjES5eqbaq8M/PFL0CdMrBxl+gSY//u5+FIu+zXkUhde9lArM2VCdm+z15NYzFa
	Zp+zgQFTqZ38G+aNw358KI/2n6CrBDW1fwE3J+j6VPIZ35kWCIjUj46fAxA2Z0m1U3Se
	eakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6lhl7v71fxou538LR4m+ijPkeqDAMJ9pRVthyjD1HSY=;
	b=gJuPRC2BoWO6oobWWwr5cK5ieH/jIS0hD8Sxo4V3daTIXQ50lTeKyWjyMbEOcWcgpq
	F5I3DA6RI9WcEs1v8Dt9/+YFCo+CUnqqZaSRHxgmPy1X3YjiqGSoI6byBIPZqVO63ITK
	t28CWI5NcPEda5wAxSTug8yEIT+A5POoDmI2mrwJLhUCEWFbkrTjBUkmO5uk42cxuOvc
	skNEcp9W2N/6/c5RoW0LXerYqLq6u0OtTFTV7M7Go8249rdPrbJBiz9zIowZ+eQ+BWtT
	p62PH59SQly/hgmU3h+ioBOPGbt7ZMKVeaGo3ku+F3kbb+rsIHkpqMgL/sTUwJKhIQV9
	zaZQ==
X-Gm-Message-State: AIkVDXIqpbf4kLddgO2NKSB51z0xFrRSsEtooLItsEcL6Fqs/mEYkqHadF4GFNHQNGvrRK7GmY3uShslaO9iZQ==
X-Received: by 10.194.141.239 with SMTP id rr15mr48347501wjb.144.1483368450065;
	Mon, 02 Jan 2017 06:47:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Mon, 2 Jan 2017 06:47:29 -0800 (PST)
In-Reply-To: <94a0855e-a1a5-dd20-9854-c16fd17f2da9@elfin.de>
References: <CADnUhn2STGnqzDuYoAo8yLvDnPFcmm+4M+xq387oxdhwF_pFMQ@mail.gmail.com>
	<CAKuJqM9sse_hCpGQBbfQrcCThtichn=WLeuA2iEEU=NP9N_nMw@mail.gmail.com>
	<CADnUhn16Dyc2tnRgQtGMwy6xuBKchjWP3oCtnRdpg4GK1L0BcQ@mail.gmail.com>
	<20170102142908.GB3954@jama>
	<94a0855e-a1a5-dd20-9854-c16fd17f2da9@elfin.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 2 Jan 2017 15:47:29 +0100
Message-ID: <CA+chaQcezBrHioSU6SsVt_NzLgqhVx2+ZG5+2UPXT9vgL1P7nQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 02 Jan 2017 14:47:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

You need to ask armin to include it in next pull request for morty and
krogoth.

On Mon, Jan 2, 2017 at 3:31 PM, Piotr Lewicki <piotr.lewicki@elfin.de>
wrote:

> On 02.01.2017 15:29, Martin Jansa wrote:
>
>> On Mon, Jan 02, 2017 at 04:20:37PM +0200, matti kaasinen wrote:
>>
>>> Olkesandr,
>>> Actually it was regarding that jquery library that I patched today. Tha=
t
>>> really was pretty trivial fix if fix at all =C2=AD- just to make it mor=
e
>>> formal.
>>> However, I really do not know if it is just to update Apache version or
>>> is
>>> there something else to do. Pure revision change would be trivial for m=
e,
>>> too, or actually a new recipe should be made. Other choice would be
>>> trying
>>> to find that older version of Apache and fix source URL accordingly.
>>> It seems that old version is in archive:
>>> https://archive.apache.org/dist/httpd/
>>> I'm fine making the patch to update SRC to point to apache archive.
>>> However, recipe seems using several patches that I do not care creating
>>> for
>>> the new release now. That should do someone more devoted to apache
>>> functionality, I suppose.
>>> -Matti
>>>
>> Or just read last 2 weeks on this ML to find:
>> https://patchwork.openembedded.org/patch/135494/
>> and related discussion and just ask for backporting this to krogoth
>> branch
>>
> @Martin: Could I ask you to also port it to morty?
>
>
>
>
>>
>>> 2017-01-02 15:46 GMT+02:00 Oleksandr Kravchuk <
>>> oleksandr.kravchuk@pelagicore.com>:
>>>
>>> Matti -
>>>>
>>>> As I have previously suggested, you can make a patch and send it to
>>>> this mailing list. Here is an instruction:
>>>> http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
>>>>
>>>> Would you like to try to do it yourself or you actually want us to fix
>>>> it?
>>>>
>>>> On 2 January 2017 at 14:15, matti kaasinen <matti.kaasinen@gmail.com>
>>>> wrote:
>>>>
>>>>> Hi!
>>>>>
>>>>> http://www.apache.org/dist/httpd/httpd-2.4.23.tar.bz2 has been
>>>>> removed.
>>>>> Latest/current version on http://www.apache.org/dist/httpd/ page is
>>>>> httpd-2.4.25.tar.bz2. This crashes fetcher of
>>>>> meta-openembedded/meta-webserver/recipes-httpd/apache2/apach
>>>>> e2_2.4.23.bb
>>>>> that is Krogoth recipe for apache2.
>>>>>
>>>>> Thanks,
>>>>> Matti
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-devel mailing list
>>>>> Openembedded-devel@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>
>>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>
>>
>> --
> Piotr Lewicki
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

