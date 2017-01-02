Return-Path: <piotr.lewicki@elfin.de>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id CA48660796
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jan 2017 14:31:37 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id t79so408061572wmt.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Jan 2017 06:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elfin.de; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=s6sV7VIhtnT0nNG0Kh8P7KsHqpjBY24XfuE04n7sKr0=;
	b=iaCmVBvuJpr4JPWP4HBj8mpelZPaPmEzxkb41/1dWvQ4iz9cS1+uBmNTsz71d4b/LI
	CHjLkx59Cen/bNxARHh2G7+IgaIeHSOaDpqe6kDA5MdfJXgUNbhU2bvQA2HV1PG7F/GB
	Tz2FyhYkXtXODqrRmWvUvCsE6URkhcJ1H+hD5DknLhZBKDXjOgKlTAtYyVnPyIAxasuG
	BvPTBJuuykmHVoZz62FC/0KEYrUlfNKTnPR+kf1Q/cnd797dkPqkdVv4t9f+HAzTfqP2
	AvY4VHURKtRWJyklG8UCAO1QIRJCNc6dPiEvWzP6PDPDC3UUMNH1/TEKLH7r43FCXlYY
	jqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=s6sV7VIhtnT0nNG0Kh8P7KsHqpjBY24XfuE04n7sKr0=;
	b=DBGy+kkZxWu71b1Q5akVHNhwtueIM08u316BhfygMN7AhWVS+U3lge9kJh9bcVoxqy
	+HClh4T3kcXcsnm0BRt4D4EfMG5F9TNS4uwROUzzk9XbIvFr7FtJyQNu17fZ2XjE7m1j
	F7R2Gy85ZZq3WyDHWqRbf7x681o2rXAAyGwpC7tKoRL7v4Tgr/Sh5NBIXqcqo/qbtT2v
	d2QucyDPUghlMrnNpliSOcmre3MyuQAPeRQ4h81Asbt2u9c19n4vD7+Qr8S4Q8+kerbC
	q69fOlRZWSkehJbV06IMbWlxczna4sXTHwmm2xoCf+E6AW4pu3YixpX19me2a+Uu37Ot
	JxZw==
X-Gm-Message-State: AIkVDXKYKW6NoZEL24Pgm9y3+JXHlQ27to3SM3u7D060wTAL+2MIY4eW8BN8iEbK3pj8SA==
X-Received: by 10.28.191.87 with SMTP id p84mr51087628wmf.63.1483367497198;
	Mon, 02 Jan 2017 06:31:37 -0800 (PST)
Received: from [192.168.2.176] (b2b-94-79-174-114.unitymedia.biz.
	[94.79.174.114]) by smtp.gmail.com with ESMTPSA id
	j1sm88141946wjm.26.2017.01.02.06.31.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Jan 2017 06:31:36 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <CADnUhn2STGnqzDuYoAo8yLvDnPFcmm+4M+xq387oxdhwF_pFMQ@mail.gmail.com>
	<CAKuJqM9sse_hCpGQBbfQrcCThtichn=WLeuA2iEEU=NP9N_nMw@mail.gmail.com>
	<CADnUhn16Dyc2tnRgQtGMwy6xuBKchjWP3oCtnRdpg4GK1L0BcQ@mail.gmail.com>
	<20170102142908.GB3954@jama>
From: Piotr Lewicki <piotr.lewicki@elfin.de>
Message-ID: <94a0855e-a1a5-dd20-9854-c16fd17f2da9@elfin.de>
Date: Mon, 2 Jan 2017 15:31:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20170102142908.GB3954@jama>
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
X-List-Received-Date: Mon, 02 Jan 2017 14:31:38 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 02.01.2017 15:29, Martin Jansa wrote:
> On Mon, Jan 02, 2017 at 04:20:37PM +0200, matti kaasinen wrote:
>> Olkesandr,
>> Actually it was regarding that jquery library that I patched today. That
>> really was pretty trivial fix if fix at all ­- just to make it more formal.
>> However, I really do not know if it is just to update Apache version or is
>> there something else to do. Pure revision change would be trivial for me,
>> too, or actually a new recipe should be made. Other choice would be trying
>> to find that older version of Apache and fix source URL accordingly.
>> It seems that old version is in archive:
>> https://archive.apache.org/dist/httpd/
>> I'm fine making the patch to update SRC to point to apache archive.
>> However, recipe seems using several patches that I do not care creating for
>> the new release now. That should do someone more devoted to apache
>> functionality, I suppose.
>> -Matti
> Or just read last 2 weeks on this ML to find:
> https://patchwork.openembedded.org/patch/135494/
> and related discussion and just ask for backporting this to krogoth
> branch
@Martin: Could I ask you to also port it to morty?


>
>>
>> 2017-01-02 15:46 GMT+02:00 Oleksandr Kravchuk <
>> oleksandr.kravchuk@pelagicore.com>:
>>
>>> Matti -
>>>
>>> As I have previously suggested, you can make a patch and send it to
>>> this mailing list. Here is an instruction:
>>> http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
>>>
>>> Would you like to try to do it yourself or you actually want us to fix it?
>>>
>>> On 2 January 2017 at 14:15, matti kaasinen <matti.kaasinen@gmail.com>
>>> wrote:
>>>> Hi!
>>>>
>>>> http://www.apache.org/dist/httpd/httpd-2.4.23.tar.bz2 has been removed.
>>>> Latest/current version on http://www.apache.org/dist/httpd/ page is
>>>> httpd-2.4.25.tar.bz2. This crashes fetcher of
>>>> meta-openembedded/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
>>>> that is Krogoth recipe for apache2.
>>>>
>>>> Thanks,
>>>> Matti
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
--
Piotr Lewicki

