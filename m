Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1QmQ7y-00079t-8n
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jul 2011 14:55:57 +0200
Received: by gxk3 with SMTP id 3so1823183gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jul 2011 05:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=3Pg6w7swDP/z57hnGKkM9ep3W8sTUxHew1mFvcpfu54=;
	b=DDq0cICTL5tsqArCUvzjFqHXvmdJhioZXZbkcWTrebbZBgnfRDprWnzkoTvAV3FU4P
	sWHLUqJfoQup6mrKchEY0hs7SPLLhE7ExPwIUTTxGguHyp3ifuyoOtPfTWAAf5tfqB/O
	KD0eGBlPG4mGZfCYL52Yhq9P6f1/wnkypoFuY=
MIME-Version: 1.0
Received: by 10.142.204.3 with SMTP id b3mr667340wfg.213.1311857468284; Thu,
	28 Jul 2011 05:51:08 -0700 (PDT)
Received: by 10.142.141.2 with HTTP; Thu, 28 Jul 2011 05:51:08 -0700 (PDT)
In-Reply-To: <4E314658.2040900@mlbassoc.com>
References: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B7A25E@nzc-ap-xch-02.ap.trimblecorp.net>
	<4E314658.2040900@mlbassoc.com>
Date: Thu, 28 Jul 2011 14:51:08 +0200
Message-ID: <CAAQYJAuuFLX0X+7gs=q3653F4cq_1XLE3U+QWECx7uQV_znuMw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Kernel boot problems
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
X-List-Received-Date: Thu, 28 Jul 2011 12:55:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 28, 2011 at 1:22 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2011-07-27 20:20, Bernard Mentink wrote:
>>
>> Hi Guys,
>>
>> I have got a bit further with my efforts to boot linux on an imx31 based
>> platform using u-boot.
>>
>> My console output is now:
>>
>> ----------------------------------------------------------------
>> uboot> =A0bootm 80100000
>> ## Booting kernel from Legacy Image at 80100000 ...
>> =A0 =A0Image Name: =A0 Angstrom/2.6.36/mx31ads
>> =A0 =A0Created: =A0 =A0 =A02011-07-28 =A0 2:03:27 UTC
>> =A0 =A0Image Type: =A0 ARM Linux Kernel Image (uncompressed)
>> =A0 =A0Data Size: =A0 =A01586172 Bytes =3D 1.5 MiB
>> =A0 =A0Load Address: 8f000000
>> =A0 =A0Entry Point: =A08f000000
>> =A0 =A0Verifying Checksum ... OK
>> =A0 =A0Loading Kernel Image ... OK
>> OK
>>
>> Starting kernel ...
>>
>> Uncompressing Linux... done, booting the kernel.
>> -------------------------------------------------------------------
>>
>> So it seems to be getting to the 1st part of the kernel boot process,
>> then hangs (I presume the last line comes from kernel code.)
>> I don't know if the kernel is hanging, or if I don't have any more
>> serial out ....
>> I am passing "console=3Dttymxc0,115200" to the kernel ..
>> Can someone confirm:
>> A) If I have the correct Entry point, or does this need to be offset
>> into the kernel? ..
>> B) Is the serial console parameters correct?
>> C) What is the correct way to set up the memory map? (my ram starts at
>> 0x80000000, ends at 0x8fffffff)
>> D) Is there a way to debug initial kernel stuff with serial output?
>> In the above, I have decompressed the kernel to the top of the 256M ram,
>> but have only advertised 120M via the bootloader =A0 ... for now, not
>> knowing what is correct and not wanting the kernel
>> to stomp all over itself running in ram.
>
<cut>

In answer to D) there is earlyprintk using a custom-compiled debug-kernel

Regards

Andrea


