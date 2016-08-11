Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 309FC76E4A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 08:06:12 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id o80so1512933wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 01:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=TouK2JR/jkDRqknWxcSnd2N73pm+tx/v3nB26hQMNf0=;
	b=LiNhOlJjYRaSeCG/87ERTj04WxvFzf7wthum7Fe6yZgEu0ztA7AFW1isxu9xJrGA/P
	Hy//CokjoAW7q9sV3vUXaCMdj8+sfsOLRr9viHtnV8SqCsNaCXShuzNVeJwdQgk5IJXO
	ULuSgAretDQT4cn354TcIXBjEg0JSIL775uTOf9lamGO/6Owt01tbJ7PYxHccYkpS8ya
	xpBoYG9Hny3pC7DYbfswhv/fPIklfrM00QZW8EW0pP9aAp8j9CIYJ4yz90x0HYGnCjro
	Ho/vNTzHnQchJ48ugdwywzwigtzB59RkiRFUvbf+j8gedwS2OPB8Iwka+1VatiDER33e
	nXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=TouK2JR/jkDRqknWxcSnd2N73pm+tx/v3nB26hQMNf0=;
	b=eI1kZvBon2BmCT5rUbNBPezIL36/TmGwaZK1t3ZgxI9Ue5v4EYv/WN4KE5Z5mcWyMm
	fqesQHeZA/n1jNmla/ujFjA6DcdZ5nUxj4lHqhqm/uUkF49pPSyqFgiBNdb/ZuNhF3lZ
	OZ8JFwfqUZ8jyDixOGgflMSx9vwlAo0nSmR4lx8+l7KbQT63vuI8w4SM4YpmXW8578Ua
	r0FEKXS/JH1Hp5xAa25XSirW5MBCMNtmwhwLmmZKGE3CS/a86OeXPOLy7htVIfkFhgnI
	rzVB+gPDNC0od5nl9eVBSAt9nRKOK5uMoiHAXPazHP2Z0ondJ5oWgW90lx5ksONGWNo4
	rsgA==
X-Gm-Message-State: AEkoouvHCYs2OCIkOZZB4l/lg6ka0eCwoxIQoNj9ZPZGQmyI23zqEMkX3vLfIhQKf4pIxMx+IzhXW/FqAgtjXg==
X-Received: by 10.28.37.71 with SMTP id l68mr8124400wml.50.1470902772756; Thu,
	11 Aug 2016 01:06:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.139.148 with HTTP; Thu, 11 Aug 2016 01:05:52 -0700 (PDT)
In-Reply-To: <CA+chaQdBBR9fys5njeqfsPSz9KoykhBDJT21sm0thtdoMKDZTg@mail.gmail.com>
References: <1470827677-19644-1-git-send-email-ricardo.ribalda@gmail.com>
	<CA+chaQdBBR9fys5njeqfsPSz9KoykhBDJT21sm0thtdoMKDZTg@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 11 Aug 2016 10:05:52 +0200
Message-ID: <CAPybu_2Vx8ZmbUMKwOzAs_K5fY-VYQZS7ia+2zcOz0KBSn1REA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] glog: Add missing dependency
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
X-List-Received-Date: Thu, 11 Aug 2016 08:06:13 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin

My bad, it is on my layer. I send it right I away.

Regards!



On Wed, Aug 10, 2016 at 9:59 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Which layer provides gflags?
>
> You'll probably need to add PACKAGECONFIG for it and let it disabled by
> default, because there isn't gflags in meta-oe.
>
> On Wed, Aug 10, 2016 at 1:14 PM, Ricardo Ribalda Delgado <
> ricardo.ribalda@gmail.com> wrote:
>
>> Fixes:
>>
>> WARNING: glog-0.3.3-r0 do_package_qa: QA Issue:
>> /usr/lib/libglog.so.0.0.0 contained in package glog requires
>> libgflags.so.2()(64bit), but no providers found in RDEPENDS_glog?
>> [file-rdeps]
>>
>> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>> ---
>>  meta-oe/recipes-support/glog/glog.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-support/glog/glog.inc
>> b/meta-oe/recipes-support/glog/glog.inc
>> index 8a1fb4250bbb..503904164312 100644
>> --- a/meta-oe/recipes-support/glog/glog.inc
>> +++ b/meta-oe/recipes-support/glog/glog.inc
>> @@ -6,6 +6,6 @@ HOMEPAGE = "https://code.google.com/p/google-glog/"
>>  LICENSE = "BSD"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=dc9db360e0bbd4e46672f3fd91dd6c4b"
>>
>> -DEPENDS = "libunwind"
>> +DEPENDS = "libunwind gflags"
>>
>>  inherit autotools pkgconfig
>> --
>> 2.8.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Ricardo Ribalda

