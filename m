Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1STyeY-0004l4-FD
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 19:01:46 +0200
Received: by yhjj56 with SMTP id j56so4638021yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 09:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=bvVi82Cnb4ICfIGarqXbQ+6ibImnE1+K/mJrQgbyDnM=;
	b=R767yL8MhoxQ8Fh4ouayF4FfG3+kEIra90qL/OmWd/cmfKpXNq0Fxz2GJnahsDbeWM
	zqO93mxzHALdQ02JakP3K6IBxFS3V1cGOYQBGnfuheKVt5F4TLRnfjtDnyA01pX7tDWn
	Wr+iEdsj8sggt/k07y2YgcBSvEJuvpXAtuETHfUJMCewZ0Sb9bL6Pq9TgAqCez/30S60
	mhOUCs4MqWpek57l9l7nqjuIqcdQUt13ZiNbbq2jEk9n/Buq2QyPGIffaroIdyL09zfo
	uR5jGuGIsAMgE0zU6H3hbtBJEdLzAkMo5rBLsB4LOmviIDWbpG8yem5P/KLdyZJ+Dm+2
	ZXZw==
MIME-Version: 1.0
Received: by 10.50.47.196 with SMTP id f4mr4638721ign.21.1337014303892; Mon,
	14 May 2012 09:51:43 -0700 (PDT)
Received: by 10.64.59.130 with HTTP; Mon, 14 May 2012 09:51:43 -0700 (PDT)
In-Reply-To: <CADZ6=auhe9BbFPd-F-QNLcTksuWzZdY8tUb31P2JVm38LDjCsw@mail.gmail.com>
References: <CADZ6=auhe9BbFPd-F-QNLcTksuWzZdY8tUb31P2JVm38LDjCsw@mail.gmail.com>
Date: Mon, 14 May 2012 19:51:43 +0300
Message-ID: <CAF6bG8cN5ecwtehSBxy5M1JvR+Fbo_=q7mm7O+AJcz-9ZU79yw@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: New kmod {libdir} breaks udev, systemd build
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
X-List-Received-Date: Mon, 14 May 2012 17:01:46 -0000
Content-Type: text/plain; charset=UTF-8

On 14 May 2012 15:48, Thilo Fromm <fromm@dresearch-fe.de> wrote:
> Hi there,
>
> [...]
>
>>> Take meta-openembedded/meta-oe/recipes-core/udev/udev_182.bb, for
>>> example. The build predictably fails with
>>>
>>> checking for KMOD... no
>>> configure: error: Package requirements (libkmod >= 5) were not met:
>>>
>>> No package 'libkmod' found
>>>
>>> So what's the right thing do do here? Use a different package install
>>> path for libkmod, or point udev to /lib/pkgconfig by extending its
>>> PKG_CONFIG_PATH correspondingly?
>>
>> I have some build failure.
>
> Me too.

  Worked for me until I enabled meta-openembedded/meta-oe layer for
unrelated reason. Wouldn't behavior meet least-surprise goals better
if openembedded-core version of udev would be the default one
regardless of what additional layers one enables/disables, and meta-oe
version to be the one one has to request explicitly?


 - ML


