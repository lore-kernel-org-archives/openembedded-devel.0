Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id ACC2170E5A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 19:37:10 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id fb1so3826474pad.27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 12:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=LayZc8zZOCMEfJLf1yXYOdtv1pSC2Z/GDBzuIxJcTJw=;
	b=yZWWnwzecst0GaDDPWUxGcnNCPd5rooFJpliQxpSNaRKDzUkiLg5tCG79eDlvPDmwS
	fnxPMzUrf7YPp1wNFqd4rUYZGlRZ53sKUzSYq/M+D253Pzp9mszFQb4xktpyBkjo0wA6
	p3lD+5CWppZZw0NH5VyU0EdDtFvyW9a7FPU5O6H/t3mZCA8mS7Wsan0EUzkKgx+lMAzY
	b07mpiUr3A12IZmPQXLeeuW296wecd1pYFriHEb9z5ehIj/eTOiS3je8C6sUEIB77Z4l
	s7gdeG/IsAW04Ap9KNKGg44FRY2GEaz/hdHE1cVRJQcm9QB+Kpxh/3VYH//6ydUQOgxi
	ldYg==
X-Received: by 10.70.52.199 with SMTP id v7mr9198626pdo.49.1409254628070;
	Thu, 28 Aug 2014 12:37:08 -0700 (PDT)
Received: from [10.7.100.251] (64.2.3.195.ptr.us.xo.net. [64.2.3.195])
	by mx.google.com with ESMTPSA id
	ny7sm15623008pab.38.2014.08.28.12.37.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Aug 2014 12:37:06 -0700 (PDT)
Message-ID: <53FF84DE.7040402@gmail.com>
Date: Thu, 28 Aug 2014 12:37:02 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, 
	Cliff Brake <cliff.brake@gmail.com>, Martin Jansa <martin.jansa@gmail.com>
References: <1408914239-11562-1-git-send-email-otavio@ossystems.com.br>	<CAMKF1sqRuJ2Ncy=FR09ir4N0teHWvN3CfxGQR97niSDFAcHHzQ@mail.gmail.com>	<CAP9ODKoX8jUYPoZDqF4WYK45p3tYT8g-MUsox6=frigEY_Eo+Q@mail.gmail.com>	<CAP9ODKowYPXHShXiBVTG=2_r1_qm=E0gXRAtXDTUUYqD7vmmNQ@mail.gmail.com>
	<CAP9ODKrzJAW+NXr7LmzQ0+CnmJE_pc5786Xq64AMqeRN_X6=kg@mail.gmail.com>
In-Reply-To: <CAP9ODKrzJAW+NXr7LmzQ0+CnmJE_pc5786Xq64AMqeRN_X6=kg@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][for-daisy][PATCH] php: Fix native build due mistakenly linking against host's iconv
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Aug 2014 19:37:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

  Acked-by: Armin Kuster <akuster808@gmail.com>


might have acked the wrong one.



On 08/28/2014 06:54 AM, Otavio Salvador wrote:
> Martin,
>
> On Wed, Aug 27, 2014 at 11:04 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> On Mon, Aug 25, 2014 at 10:15 AM, Otavio Salvador
>> <otavio@ossystems.com.br> wrote:
>>> On Sun, Aug 24, 2014 at 8:36 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> On Sun, Aug 24, 2014 at 2:03 PM, Otavio Salvador
>>>> <otavio@ossystems.com.br> wrote:
>>>>> The configure script has mistakenly choose to enable iconv support,
>>>>> due host to provide it, adding '/usr/lib' to the linking flags and
>>>>> failing as:
>>>>>
>>>>> ,----[ Linking error while testing 'fork' support ]
>>>>> | conftest.c:268: warning: conflicting types for built-in function 'fork'
>>>>> | .../build/tmp/sysroots/x86_64-linux/usr/lib/libxml2.so:
>>>>> |     undefined reference to `gzopen64@ZLIB_1.2.3.3'
>>>>> | collect2: ld returned 1 exit status
>>>>> `----
>>>>>
>>>>> This patch disables iconv support for native builds fixing the error.
>>>>>
>>>>
>>>> the patch subject is confusing. enabling iconv is not mistake but its
>>>> probed and if found its used. in this case libz against which libxml2
>>>> is linked is not used here and that ends up in error.
>>>>
>>>> Can you try to add --with-iconv-dir=${STAGING_LIBDIR_NATIVE}
>>>> and see if it helps ?
>>>
>>> The native does not depends on virtual/iconv. So the natural thing is
>>> to disable it.
>>
>> Hey guys, can you review this one for backporting?
>
> This is the Daisy backport one.
>

