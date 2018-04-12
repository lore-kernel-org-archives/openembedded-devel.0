Return-Path: <jan.vermaete@gmail.com>
Received: from mail-ot0-f170.google.com (mail-ot0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7A2027453D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2018 15:09:35 +0000 (UTC)
Received: by mail-ot0-f170.google.com with SMTP id o9-v6so6384910otj.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2018 08:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=e3N6omlLWkqZhItWA1pOLjkvS0FCgBZjxJ+N/Xdapa8=;
	b=cSgCdInsls8I2K9wwQsG/ar/okOzNYljLTPa9diwa7mh0mnnDefsejsVshS5hploGR
	TKwWNG/7lyW71Cw8Af7SkdEuc1IQ6u9TgnhesvwQlQfS/cv+jWuNyeIyi5hflf2fAaAr
	o85eRfvRUxDLJFmdSMrmEvM6Mu/MYoBzmYouldkcQsHeNOz8QsRziF8iuReKfvbDa6ua
	2yXk9QzpyRV6GcWR/XBd6PKJHklmOaK1Hz7qHb/b4mWpy7mldhA/ObMQU0YxbCMtkPPh
	GTA1facCh15LXHsY4CvK9iOhwx7eq6uT8LQRTP4wVqDPCsXOgX63YYYuU1LQXEL65Z/U
	uAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=e3N6omlLWkqZhItWA1pOLjkvS0FCgBZjxJ+N/Xdapa8=;
	b=p21mRruiS3mPKo1opZv72+e2GetBe0sto9PwYsZdECQy6JTWJAVam9SgtX+fftCgc0
	tvDxtDsC4rH0IrPPYx/99PAGWqREu94lfwCYyborfBf7yaje14v1an3a7aPLLDbyZGST
	pdOtMd4R5j3yTUlmYs5cn0ADAwNRJsL+Yg/tuysQXdUbHB9ny/pftR7Ts/hOv5LKO4rG
	1Yd5Fp0rd3MD72oxZbdYVE1bP+LBXJHSsPgVbiyBODCY176nkchoagL0rZfXYeTIYmyN
	bmuI1x3wpsl5cexh5KEEypLgJJ/s4c9ZhY05wtaWgkh4oKgRl4RHKueCvlZUXdw94d2A
	Hu2w==
X-Gm-Message-State: ALQs6tCuoulGmGfu6CxF+nB4YuejWNjwJEowOEOF6nDItHjCqAWkzD5r
	ClwYMP6swaCYxsm+YPZne+VdAEzuXlaYwfczPO0=
X-Google-Smtp-Source: AIpwx499gGFVqxWyzu2QSmyIjnkiuuRnSatu9QaMx3olaKiq1IBypfEPXdbZGTcQTV5ntwwC36Ow5l3UWtpJ47hSE20=
X-Received: by 2002:a9d:2763:: with SMTP id
	r90-v6mr997441ota.226.1523545776965; 
	Thu, 12 Apr 2018 08:09:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.18.147 with HTTP; Thu, 12 Apr 2018 08:09:16 -0700 (PDT)
In-Reply-To: <CADNbA1qZLO+GbkVcedsqrVV7_-ggr-xsijZ4hZomnmmTAAPPeA@mail.gmail.com>
References: <CABF_=yiRrqZTGPkMEQNvm5f=LsUQTPKtbqrCrKHjBfbWuv29zQ@mail.gmail.com>
	<CADNbA1qZLO+GbkVcedsqrVV7_-ggr-xsijZ4hZomnmmTAAPPeA@mail.gmail.com>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Thu, 12 Apr 2018 17:09:16 +0200
Message-ID: <CABF_=yjBxXZQUYgfHhr94_Kkkxnrs4UV8CJBRe30N3wRp-+eaw@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-attrs: Adjust the RDEPENDS to include crypt rather than cryptography
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
X-List-Received-Date: Thu, 12 Apr 2018 15:09:36 -0000
Content-Type: text/plain; charset="UTF-8"

my mistake...
Thanks for the info

On Thu, Apr 12, 2018 at 4:12 PM, Derek Straka <derek@asterius.io> wrote:
> There is a usage of hashlib (provided by ${PYTHON_PN}-crypt) in _make.py.
>
> derek@sparta:/tmp$ dpkg -c
> upstream/build/tmp/deploy/ipk/core2-64/python-crypt_2.7.14-r1_core2-64.ipk
> drwxrwxrwx root/root         0 2018-03-24 09:28 ./
> drwxr-xr-x root/root         0 2018-03-24 09:28 ./usr/
> drwxr-xr-x root/root         0 2018-03-24 09:28 ./usr/lib/
> drwxr-xr-x root/root         0 2018-03-24 09:28 ./usr/lib/python2.7/
> -rw-r--r-- root/root      7842 2018-03-24 09:28
> ./usr/lib/python2.7/hashlib.py
> -rw-r--r-- root/root      6891 2018-03-24 09:28
> ./usr/lib/python2.7/hashlib.pyc
> drwxr-xr-x root/root         0 2018-03-24 09:28
> ./usr/lib/python2.7/lib-dynload/
> -rwxr-xr-x root/root     25184 2018-03-24 09:28
> ./usr/lib/python2.7/lib-dynload/_hashlib.so
> -rwxr-xr-x root/root      6520 2018-03-24 09:28
> ./usr/lib/python2.7/lib-dynload/crypt.so
> -rw-r--r-- root/root       358 2018-03-24 09:28 ./usr/lib/python2.7/md5.py
> -rw-r--r-- root/root       376 2018-03-24 09:28 ./usr/lib/python2.7/md5.pyc
> -rw-r--r-- root/root       393 2018-03-24 09:28 ./usr/lib/python2.7/sha.py
> -rw-r--r-- root/root       419 2018-03-24 09:28 ./usr/lib/python2.7/sha.pyc
>
> derek@sparta:/tmp$ grep -r hashlib attrs/
> attrs/src/attr/_make.py:import hashlib
> attrs/src/attr/_make.py:    sha1 = hashlib.sha1()
> attrs/src/attr/_make.py:    sha1 = hashlib.sha1()
> attrs/src/attr/_make.py:    sha1 = hashlib.sha1()
>
> On Thu, Apr 12, 2018 at 9:33 AM, jan vermaete <jan.vermaete@gmail.com>
> wrote:
>>
>> I'm afraid this patch just revert the file to the previous state.
>> As far as I can see, there is no need at all to have something of
>> crypto nor crypotgraphy needed for this python package.
>>
>> --
>> Jan Vermaete
>> "For every complex problem there is an answer that is clear, simple,
>> and wrong." - H.L. Mencken
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>



-- 
Jan Vermaete
"For every complex problem there is an answer that is clear, simple,
and wrong." - H.L. Mencken

