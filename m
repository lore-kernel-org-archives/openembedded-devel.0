Return-Path: <cliff.brake@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 87B8560E49
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Aug 2014 18:11:23 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id q107so2651887qgd.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Aug 2014 11:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=IJ5hdCunDjALUDJUEeojvxxnfaIpEfDpGe6tiBu7+Qc=;
	b=eIeeYs/MCZeTkV88qvLaB/G0yDmFK4beWLmSyhQazkIl1zF5tGZyAtS9bxhgjVNVyW
	tyGLF19kAzbnDNCytKjxqEinJrQD0wT8JdXsLk7OkiE94bEo2ftoRF/qxyUJV14VLctX
	jewawseGLgqz3KpU3bC//i79slG70ug6/HYVzlaqPKymcKJADKvXaKXpjGh8zP8aRc8h
	HiyJOq4nTCwxttSQtDcOI5gh0miWRf+rbzthjuzw5PIjguRdddCF7Dsn7LfOUUAjSQfG
	hByvcPhtfC4Aof4KxHv9QNbKCpctMm29E3PcZ/Xb6UaAF5BTr2m1Z7CishyHIH0c6nFB
	ohVw==
MIME-Version: 1.0
X-Received: by 10.224.93.11 with SMTP id t11mr20343434qam.102.1409335885005;
	Fri, 29 Aug 2014 11:11:25 -0700 (PDT)
Received: by 10.140.88.233 with HTTP; Fri, 29 Aug 2014 11:11:24 -0700 (PDT)
In-Reply-To: <53FF84DE.7040402@gmail.com>
References: <1408914239-11562-1-git-send-email-otavio@ossystems.com.br>
	<CAMKF1sqRuJ2Ncy=FR09ir4N0teHWvN3CfxGQR97niSDFAcHHzQ@mail.gmail.com>
	<CAP9ODKoX8jUYPoZDqF4WYK45p3tYT8g-MUsox6=frigEY_Eo+Q@mail.gmail.com>
	<CAP9ODKowYPXHShXiBVTG=2_r1_qm=E0gXRAtXDTUUYqD7vmmNQ@mail.gmail.com>
	<CAP9ODKrzJAW+NXr7LmzQ0+CnmJE_pc5786Xq64AMqeRN_X6=kg@mail.gmail.com>
	<53FF84DE.7040402@gmail.com>
Date: Fri, 29 Aug 2014 14:11:24 -0400
Message-ID: <CAOd_LFyq4QeFRViJsxYtST3fTWaPAH5=fmbFjx1b58bCxkitQA@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 29 Aug 2014 18:11:26 -0000
Content-Type: text/plain; charset=UTF-8

Acked-by: Cliff Brake <cbrake@bec-systems.com>

On Thu, Aug 28, 2014 at 3:37 PM, akuster808 <akuster808@gmail.com> wrote:
>  Acked-by: Armin Kuster <akuster808@gmail.com>
>
>
> might have acked the wrong one.
>
>
>
>
> On 08/28/2014 06:54 AM, Otavio Salvador wrote:
>>
>> Martin,
>>
>> On Wed, Aug 27, 2014 at 11:04 PM, Otavio Salvador
>> <otavio@ossystems.com.br> wrote:
>>>
>>> On Mon, Aug 25, 2014 at 10:15 AM, Otavio Salvador
>>> <otavio@ossystems.com.br> wrote:
>>>>
>>>> On Sun, Aug 24, 2014 at 8:36 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>>
>>>>> On Sun, Aug 24, 2014 at 2:03 PM, Otavio Salvador
>>>>> <otavio@ossystems.com.br> wrote:
>>>>>>
>>>>>> The configure script has mistakenly choose to enable iconv support,
>>>>>> due host to provide it, adding '/usr/lib' to the linking flags and
>>>>>> failing as:
>>>>>>
>>>>>> ,----[ Linking error while testing 'fork' support ]
>>>>>> | conftest.c:268: warning: conflicting types for built-in function
>>>>>> 'fork'
>>>>>> | .../build/tmp/sysroots/x86_64-linux/usr/lib/libxml2.so:
>>>>>> |     undefined reference to `gzopen64@ZLIB_1.2.3.3'
>>>>>> | collect2: ld returned 1 exit status
>>>>>> `----
>>>>>>
>>>>>> This patch disables iconv support for native builds fixing the error.
>>>>>>
>>>>>
>>>>> the patch subject is confusing. enabling iconv is not mistake but its
>>>>> probed and if found its used. in this case libz against which libxml2
>>>>> is linked is not used here and that ends up in error.
>>>>>
>>>>> Can you try to add --with-iconv-dir=${STAGING_LIBDIR_NATIVE}
>>>>> and see if it helps ?
>>>>
>>>>
>>>> The native does not depends on virtual/iconv. So the natural thing is
>>>> to disable it.
>>>
>>>
>>> Hey guys, can you review this one for backporting?
>>
>>
>> This is the Daisy backport one.
>>
>



-- 
=================
http://bec-systems.com

