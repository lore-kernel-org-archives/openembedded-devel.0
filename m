Return-Path: <andrei@gherzan.ro>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 099A97097D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jul 2014 09:39:07 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id n3so957288wiv.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jul 2014 02:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=OUNIbGMoMvJ/S+JixtxRu/BEV2XupayNDJXzJE47xaY=;
	b=HRUY01XW0KnQSqXznshbDy6qYUpRhzTMIjOkjdD37D5a9RQTvKBoq/8UHLg4ufQPH8
	fPxdxIdpgmSKhNzkocyZKjjBeTJaD/lPsfERCD4CEGg63/IDANH1GFB4gWqgI6wvTxm+
	y3G0mX1ORaiqX4/h8KSdkhMGKR2FRwHRrYoMEw7ZJvERxBnyVU4QbOrIviR9SaXcjVK0
	Hx+A7K2fOqEAVb7I2QYeJ6eDS41dKDwISRCp5L3H5MkBKwuJVJJv0i6mFV6K11w3skAX
	dk7o0f8k+IecqGx9+H9qRDqajMjnddxVmVTINqDTBhqmfjD6tr5okgPAR+1shQjKkzy/
	2dyA==
X-Gm-Message-State: ALoCoQkQFKMaUiKsaWAcIIlQWMgHoZKLOUVnPO+T1nKzXgnO76DTyiZFdXr/QHHt23dXAjM9GL31
X-Received: by 10.194.134.70 with SMTP id pi6mr15224506wjb.1.1406799546263;
	Thu, 31 Jul 2014 02:39:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.76.5 with HTTP; Thu, 31 Jul 2014 02:38:46 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <CAMKF1sq3ravDmn6dKzJXhNSEz8aZ6E7iROnW7tL1t7m4u9Eqzg@mail.gmail.com>
References: <CAK18fxEwnZdq5nObukmqOCahN6p7JcLRbctDzS2-tJjqALMDCw@mail.gmail.com>
	<CAMKF1sq3ravDmn6dKzJXhNSEz8aZ6E7iROnW7tL1t7m4u9Eqzg@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Thu, 31 Jul 2014 12:38:46 +0300
Message-ID: <CAK18fxHeWbDzPpgaerHoZCA1uF04mE-eb8w2d6hT_Apt=O8kCQ@mail.gmail.com>
To: openembedded <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe] Issues while building gpsd
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
X-List-Received-Date: Thu, 31 Jul 2014 09:39:11 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 30, 2014 at 8:00 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Jul 30, 2014 at 5:56 AM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> > | //usr/lib/libpthread.so.0: undefined reference to
> `__uname@GLIBC_PRIVATE'
> > | //usr/lib/libpthread.so.0: undefined reference to
> > `__getrlimit@GLIBC_PRIVATE'
> > | collect2: error: ld returned 1 exit status
> > | //usr/lib/libpthread.so.0: undefined reference to
> `__uname@GLIBC_PRIVATE'
> > | //usr/lib/libpthread.so.0: undefined reference to
> > `__getrlimit@GLIBC_PRIVATE'
> > | collect2: error: ld returned 1 exit status
>
> well gpsd's own build system seems to be not so cross compile
> friendly. Figure out why it decided to poke
> at your host thread library instead of one from target sysroot
>

Ok. Thanks. Hoped somebody already saw this before. No luck.


-- 
*Andrei Gherzan*
m: +40.744.478.414 |  f: +40.31.816.28.12

