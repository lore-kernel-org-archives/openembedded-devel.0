Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 246BB60777
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Aug 2017 00:43:03 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id m85so19241170wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 17:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=2kwqc3F7ckN2ut9LUUkwh/AdwZhDmTbWTjciTO0TLoQ=;
	b=OAfIgpKadjsL9zH50LT95hWXeUQ9JdECkdtvD1GRRwlxcFS477FuZQ7apZb6a+fOmS
	TKWQZX7q+/4XLK/zyoJ1mvABO6KK7rnsouRLjTWLFouc4z5Rx9FHVzmgvHPQP9J/K1S0
	Gia0EHhQ207e9dGRj0KyRGkFr9/SNBLHXrlvbsm2up+JmgMBKdsz2ZpDIQOSsJpxSk2P
	R+wt5Ibwy/V5A86Pp36giCYdb5ol2ED13buERxeKQ4F2ghiKyN67cdJYr1OS5CyQjmXa
	hi637YHg3AkHpf+4ZSEyKkKcRD+2E4K82AuRHi9s/ObiuDh6crTlapUZvrSbBIWqUQvd
	zH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=2kwqc3F7ckN2ut9LUUkwh/AdwZhDmTbWTjciTO0TLoQ=;
	b=PcHKHsogIx7GRekxvPLvlzt+9v+D6CwQbqmPoMSKeNYr8wZNGS5ZJjcpCEijgIhynq
	tn3tgjW/VnUokYNOmBUU+LfJudTkeNkEt4u/uxd2LzoZXK7xthBKQPwZqQZRMbjPOchW
	W3EiHtYtDgkxXRLUaCSRzGv2K7P78KxBxjDVKvV+zEKgOhUrZOrpvkGUY2KV6zdqLH+8
	Zd2hqRfzbqSypkfyDIaky+b/BsMgqjvdE2xmj+GrS8F+RCVLmFdWtV38XDlUzlo+dUH8
	bB5xj6aUqMUvLG6mYHxkOD85QPSEFTxXRAoNAKCRxIIldFFxoF2YJ0qcuy/Su+zKx/nh
	XjLQ==
X-Gm-Message-State: AHYfb5iZBVvuZY5aNwAVN8CA/nY6RPEkkcEwmyU8MerIM3e+es9bw5XK
	Lky/0riutos8l1s6Q6HlyWCru0Xb6A==
X-Received: by 10.80.164.18 with SMTP id u18mr6096425edb.250.1502239384619;
	Tue, 08 Aug 2017 17:43:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Tue, 8 Aug 2017 17:42:34 -0700 (PDT)
In-Reply-To: <f3b1d5bc-6d6f-4fdd-8076-5d856af4b8cf@windriver.com>
References: <20170801170152.94586-1-Randy.MacLeod@windriver.com>
	<olqm6a$87a$1@blaine.gmane.org>
	<4aaa2c14-284f-71b4-47d2-fc7e8e27beef@windriver.com>
	<BFE10A87-CF18-46BA-88E4-A795FB20506E@dominion.thruhere.net>
	<f3b1d5bc-6d6f-4fdd-8076-5d856af4b8cf@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Aug 2017 17:42:34 -0700
Message-ID: <CAMKF1srRkN_vfF5HkMQy4YM5aa8bUCC+HOX0zALdbweUeT8dCQ@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] imagemagick: upgrade from 7.0.5 to 7.0.6p4
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
X-List-Received-Date: Wed, 09 Aug 2017 00:43:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am seeing

downloads 'http://www.imagemagick.org/download/releases/ImageMagick-7.0.6-4=
.tar.xz'
--progress=3Ddot -v failed with exit code 8, output:
--2017-08-08 15:05:59--
http://www.imagemagick.org/download/releases/ImageMagick-7.0.6-4.tar.xz
Resolving www.imagemagick.org... 198.72.81.86
Connecting to www.imagemagick.org|198.72.81.86|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2017-08-08 15:05:59 ERROR 404: Not Found.


ERROR: imagemagick-7.0.6-r0 do_fetch: Fetcher failure for URL:
'http://www.imagemagick.org/download/releases/ImageMagick-7.0.6-4.tar.xz'.
Unable to fetch URL from any source.
ERROR: imagemagick-7.0.6-r0 do_fetch: Function failed: base_do_fetch
ERROR: Logfile of failure stored in:
/mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-gnueabi/imagemag=
ick/7.0.6-r0/temp/log.do_fetch.17282

On Wed, Aug 2, 2017 at 12:57 PM, Randy MacLeod
<randy.macleod@windriver.com> wrote:
> On 2017-08-02 01:21 PM, Koen Kooi wrote:
>>
>> Oops, I could=E2=80=99ve sworn I have submitted it to meta-oe :/ Thanks =
for
>> looking into this!
>>
>>> It's not working for me on qemux86 since python-wand
>>> is looking for:
>>>    libMagickWand-6.Q16HDRI and
>>>    libMagickWand-7.Q16HDRI is the current version.
>>> If I soft link to work-around that problem, there's another issue:
>>>    ImportError: MagickWand shared library not found.
>>>
>>> python-wand hasn't released a version newer than 0.4.4.
>>> I'm not really interested in trying the git repo.
>>
>> I=E2=80=99ll have a look at trying the git repo with your patch to updat=
e
>> imagemagick and hopefully get it working well enough to get it into oe-c=
ore
>> :)
>>
>
> Err,
> The meta-yocto version is actually still on 0.4.3.
> I updated to 0.4.4 and that didn't help.
>
> A simple patch to require imagemagick version 7 does
> get me one more step to:
>
> AttributeError: /usr/lib/libMagickWand-7.Q16HDRI.so.3: undefined symbol:
> MagickGetImageChannelDepth
>
> At first I thought this was due to the imagemagick .so being
> striped when packaged but it's a bunch of function renames from 6 to 7
> based on git. I asked if that had be fixed on the wand irc channel
> and it hasn't. Known misbehaving wand:
>   https://github.com/dahlia/wand/issues/287
>
> ../Randy
>
>
>
>>>> from wand.image import Image
> Traceback (most recent call last):
>   File "<stdin>", line 1, in <module>
>   File "/usr/lib/python2.7/site-packages/wand/image.py", line 20, in
> <module>
>     from .api import MagickPixelPacket, libc, libmagick, library
>   File "/usr/lib/python2.7/site-packages/wand/api.py", line 1394, in
> <module>
>     traceback.format_exc())
> ImportError: MagickWand shared library not found or incompatible
> Original exception was raised in:
> Traceback (most recent call last):
>   File "/usr/lib/python2.7/site-packages/wand/api.py", line 370, in <modu=
le>
>     ctypes.c_int]
>   File "/usr/lib/python2.7/ctypes/__init__.py", line 375, in __getattr__
>     func =3D self.__getitem__(name)
>   File "/usr/lib/python2.7/ctypes/__init__.py", line 380, in __getitem__
>     func =3D self._FuncPtr((name_or_ordinal, self))
> AttributeError: /usr/lib/libMagickWand-7.Q16HDRI.so.3: undefined symbol:
> MagickGetImageChannelDepth
>
>>>>
>
>
>
> [15:46] <vmeson> Hey, I'm trying to get wand to work with
> imagemagick-7.0.6p4 (in Yocto) -- several api have changed such as
> MagickGetImageChannelDepth -> MagickGetImageDepth or maybe just
> GetImageDepth
> [15:47] <vmeson> I've got the git repo and I'm working through it but I
> wonder if anyone has done this already and if a new tag is forthcoming to
> support imagemagick-7
> [15:47] * vmeson searchs for/in the email list.
> [15:47] <hongminh1e> No one did that yet
> [15:48] <hongminh1e> Afaik
> [15:48] <vmeson> hongminh1e: thanks for the info. I might take a stab at =
it
> but it's not a high priority for me right now.
>
>
>
>
>
>
> --
> # Randy MacLeod. SMTS, Linux, Wind River
> Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, Canada=
,
> K2K 2W5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

