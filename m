Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id E53D8707BE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Aug 2014 13:15:27 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id a41so10735208yho.19
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Aug 2014 06:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=R8ViV2vyZ426XKXfcFXpS95lAeqxVf8MOAawfRsYLh0=;
	b=Ur0G7aBuAdK0FiH9CtI0F9KcpOeS917oXZpHJjIKepLzqnlRMTZ/QoVTVRYDUrnbVQ
	QjpzwnW/lupPoiGMXrD0+eAWsE60TpOY/0PviN9bORrVoeTo/vg6fJl0oY85vDLfx1or
	s3wQCqgu4cTmST/6D6Gg4E5ZeY9b+UjKVRvxtE5yfzm6aaDhKocUe9/WKhFZ+fHJxuq1
	I+Dz+hMffsVxN4rd77im4DsjVaaWwlqpByp0VPzwQspCfNemvFnVeaTGsW9t6ChZQOul
	yrhQYmYQjQF76d9DZv5SunL0by2tIuuI3Bwo/6/0ZKNRBW42nKSLMzLONhh87ss9dW14
	fx3A==
MIME-Version: 1.0
X-Received: by 10.236.129.3 with SMTP id g3mr16320449yhi.67.1408972528905;
	Mon, 25 Aug 2014 06:15:28 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Mon, 25 Aug 2014 06:15:28 -0700 (PDT)
In-Reply-To: <CAMKF1sqRuJ2Ncy=FR09ir4N0teHWvN3CfxGQR97niSDFAcHHzQ@mail.gmail.com>
References: <1408914239-11562-1-git-send-email-otavio@ossystems.com.br>
	<CAMKF1sqRuJ2Ncy=FR09ir4N0teHWvN3CfxGQR97niSDFAcHHzQ@mail.gmail.com>
Date: Mon, 25 Aug 2014 10:15:28 -0300
X-Google-Sender-Auth: a3W7nad4Qsy6-vE4Rq8TaacWmiM
Message-ID: <CAP9ODKoX8jUYPoZDqF4WYK45p3tYT8g-MUsox6=frigEY_Eo+Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Mon, 25 Aug 2014 13:15:28 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 24, 2014 at 8:36 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sun, Aug 24, 2014 at 2:03 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> The configure script has mistakenly choose to enable iconv support,
>> due host to provide it, adding '/usr/lib' to the linking flags and
>> failing as:
>>
>> ,----[ Linking error while testing 'fork' support ]
>> | conftest.c:268: warning: conflicting types for built-in function 'fork'
>> | .../build/tmp/sysroots/x86_64-linux/usr/lib/libxml2.so:
>> |     undefined reference to `gzopen64@ZLIB_1.2.3.3'
>> | collect2: ld returned 1 exit status
>> `----
>>
>> This patch disables iconv support for native builds fixing the error.
>>
>
> the patch subject is confusing. enabling iconv is not mistake but its
> probed and if found its used. in this case libz against which libxml2
> is linked is not used here and that ends up in error.
>
> Can you try to add --with-iconv-dir=${STAGING_LIBDIR_NATIVE}
> and see if it helps ?

The native does not depends on virtual/iconv. So the natural thing is
to disable it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

