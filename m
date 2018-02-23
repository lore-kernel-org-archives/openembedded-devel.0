Return-Path: <samuli.piippo@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 53F9E7881D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Feb 2018 08:00:18 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id p78so8895150iod.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Feb 2018 00:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BvzAo3aST7LEwBAW0UyBqcwc6+sOfb29678qEOR9gbU=;
	b=URcjeWvHK86Ccb/qW3VbpB/uNcDf8ej1mWAFW+49K6KJG9rtGyeCKhU68CcxwOLbW+
	BHqCSDkauuPBNLT4eezjGIS7K0KQgLAHouZCG6HlPz16aFVkLqI3yE04kMCIU74dL7UC
	n6weHagHmk6TM3TTxrRIcVKM2SFhlmdvRGkcQxIJwj9IGv2rgwZ9pK0Ko9ApjSOkh09b
	j9P3o7ZcNF8r9SUqyvqH/ahV04UDcLtKlrw4aKpZOcqSUWCdlOyW7J4pIKlQe+/a6aMU
	MPTIHyC++qXho4X2nzHhvJQoVmd30i/UgNKzj7ABsmoDVl6grfQJemq1oFuUne827z+p
	uueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BvzAo3aST7LEwBAW0UyBqcwc6+sOfb29678qEOR9gbU=;
	b=KGgnekwVsltuO8RAjXKvKtxvcWlXrONBhH8vzgfDiKrSTRZFdcon1mMtG5UhsAkFv8
	Zb/Nj7h6GJ1fcuKMmdTemJRaFs+NvDZjjtj++asiL4SynWWslWtsqkJB06xCWPljlve5
	UAEHd2QVem8jH3qwaqHeC2aQvQ19rz/7MM6toysLQ6bk9/+cUQLSFYvOitjxGtxPYDNa
	dXFt1v+11TGAXgsgcAg9BJoSSo0qzWlcACI3naiG2qIpDunNsVUZI0m6BM+eJbdl/y/w
	rQuuOiEJucC3S889e8iSll+DRgDqky0sCGHL0Bzz/AmqLEmyYOyYzo/A+eytEHUPMHHl
	0A5Q==
X-Gm-Message-State: APf1xPBFe6ZtoLg1HDFdbqiYlOYxVuKSeriGPL7UhjF+A/aoniqa4US6
	hy/UQ+iMBhiEF3HpJXXqjfpr0o1rVqG8y2ereCk=
X-Google-Smtp-Source: AG47ELuMN0ePNce2vRkz0PalPeArPW1fXe9Ej0migXoe5hVetyMVN6aUDfZ0w009XsNrGZjThRlo9Wm43YfZ4JQDGEI=
X-Received: by 10.107.161.200 with SMTP id k191mr786213ioe.270.1519372819420; 
	Fri, 23 Feb 2018 00:00:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.166.68 with HTTP; Fri, 23 Feb 2018 00:00:18 -0800 (PST)
In-Reply-To: <CAMKF1soxS4aUMzd5d+uiHvnEjFEh5vyUvZcGQ_9CUdNugb7LvQ@mail.gmail.com>
References: <20180222042940.3770-1-raj.khem@gmail.com>
	<20180222042940.3770-2-raj.khem@gmail.com>
	<20180223012757.GA1413@jama>
	<CAMKF1soxS4aUMzd5d+uiHvnEjFEh5vyUvZcGQ_9CUdNugb7LvQ@mail.gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Fri, 23 Feb 2018 10:00:18 +0200
Message-ID: <CABXoSoUtZuS+u_YjAPQYUKwoMPtxUXP6ABNDBq-Ww03O7_9Gaw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 2/2] qtbase: Add packageconfigs for renameat2 and getentropy use
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
X-List-Received-Date: Fri, 23 Feb 2018 08:00:18 -0000
Content-Type: text/plain; charset="UTF-8"

renameat2 is a system call without a libc wrapper, so the configure
test will always fail. The system call will still be used if that is
defined, so PACKAGECONFIG doesn't make sense for it.

On 23 February 2018 at 04:17, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Feb 22, 2018 at 5:27 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> On Wed, Feb 21, 2018 at 08:29:40PM -0800, Khem Raj wrote:
>>> These features depend on underlying syscall support in kernel
>>> and if older kernels are in use, then we can have a knob to
>>> turn them off.
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>  recipes-qt/qt5/qtbase_git.bb | 6 +++++-
>>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
>>> index e495b8c..843648f 100644
>>> --- a/recipes-qt/qt5/qtbase_git.bb
>>> +++ b/recipes-qt/qt5/qtbase_git.bb
>>> @@ -71,7 +71,7 @@ PACKAGECONFIG_DISTRO ?= ""
>>>  PACKAGECONFIG_RELEASE ?= "release"
>>>  # This is in qt5.inc, because qtwebkit-examples are using it to enable ca-certificates dependency
>>>  # PACKAGECONFIG_OPENSSL ?= "openssl"
>>> -PACKAGECONFIG_DEFAULT ?= "dbus udev evdev widgets tools libs freetype tests"
>>> +PACKAGECONFIG_DEFAULT ?= "dbus udev evdev widgets tools libs freetype tests renameat2 getentropy"
>>
>> Should renameat2 be enabled by default?
>>
>> Either the test for it is broken in 5.11 or it's not available in
>> default setup.
>>
>
> Its ok to keep them enabled by default. but I think this is a bug that
> should be reported
> to upstream QT, if the feature is knobbale then it should have worked.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

