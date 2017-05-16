Return-Path: <marek.belisko@gmail.com>
Received: from mail-yb0-f195.google.com (mail-yb0-f195.google.com
	[209.85.213.195])
	by mail.openembedded.org (Postfix) with ESMTP id 225F265D35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 20:49:57 +0000 (UTC)
Received: by mail-yb0-f195.google.com with SMTP id d72so5651258ybh.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 13:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cAxy6MeMsSL4hABI3ww0d4Qs53V5eiL1qzrBW7CiJac=;
	b=CLfDiiA1s/RQT1+YpIjF5AT7i13rtUYoMAxI9Y17qVjFV/fP9CcELiW6IU0UfozgiE
	Ab8QqWrBm0niE0WJy2OtfWLTW28HHhtDSnByduKsOhBHm1Tace8t2r22OnQ9913Gej7a
	K4SOWxMUla1rHdr2AOikvT5DGcO/cOYRZniq8b+ePaw4KRBDCP6cKGN0qz/IrXXLyxwy
	BcHU07MvRyy6MH3EKSixCtGMwkE6p/934DFPeW1Pgp73f2NGRLqV1XB2T2mND6An+taz
	9QcIy6rEVsNd5Z+XBQY6C6QcWQF4EQ38kkUHIYlbPkyrBVq4i96Pa3zGR/LjBcG4SMs4
	bXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cAxy6MeMsSL4hABI3ww0d4Qs53V5eiL1qzrBW7CiJac=;
	b=cjnOt70/6S1LEpkuGZEx5cT5gRBKPRGVPI623QiLL9GIiqe/OjqJy9YHCUMUDhI99h
	frYqNQHhvXxOZ0R/9HBsx4mE3BAHTPO2sm9Hb/heGII9fAGVMv+B5Jf1DaU0WqNSc8zf
	JXTnZlN7fO5LiblaQ7COtKrZTSd7s6l1XtV6ID/VKXZkvD7Ug5i+6GdVRr7NpmE0gNGa
	YrlU0splwdNXtuywYqBXii68R/IRtVj1mzbCB1aC+Rhn7r7nOJR4SxIqjSu3S+hRMWcV
	fnueA/AxXPbw6d/d190grK+i2DafIgBCfh5behSkRjmOompcsdCYgIjwihedmDIgaMd4
	qq+w==
X-Gm-Message-State: AODbwcCfFieJNe7nbMXIJW4HvGu2ojOcJqkXHlBabce8jeC/7OZtliyG
	0CWW13tqI7PnPsVnsuwxQjvjYhurIQ==
X-Received: by 10.37.177.13 with SMTP id g13mr10740111ybj.5.1494967798835;
	Tue, 16 May 2017 13:49:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.176.168 with HTTP; Tue, 16 May 2017 13:49:58 -0700 (PDT)
In-Reply-To: <20170516202152.GA3119@jama>
References: <1494964615-15539-1-git-send-email-marek.belisko@open-nandra.com>
	<20170516202152.GA3119@jama>
From: Belisko Marek <marek.belisko@gmail.com>
Date: Tue, 16 May 2017 22:49:58 +0200
Message-ID: <CAAfyv35idjrzL=NwFSe6Fn6We1iYjRitj-CLnCHi5W0B+OCEEg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] recipes-support: Add handling for libgpiod
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
X-List-Received-Date: Tue, 16 May 2017 20:49:58 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Martin,

On Tue, May 16, 2017 at 10:21 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, May 16, 2017 at 09:56:55PM +0200, Marek Belisko wrote:
>> libgpiod - C library and tools for interacting with the linux GPIO
>> character device
>>
>> Since linux 4.8 the GPIO sysfs interface is deprecated.
>> User space should use the character device instead.
>> This library encapsulates the ioctl calls and data structures behind a
>> straightforward API.
>>
>> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
>> ---
>>  meta-oe/recipes-support/libgpiod/libgpiod_0.2.bb | 25 ++++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>  create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_0.2.bb
>>
>> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_0.2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_0.2.bb
>> new file mode 100644
>> index 0000000..fe2cd80
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_0.2.bb
>> @@ -0,0 +1,25 @@
>> +SUMMARY = "C library and tools for interacting with the linux GPIO character device"
>> +HOMEPAGE = "https://github.com/brgl/libgpiod"
>> +
>> +LICENSE = "LGPLv2.1+"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
>> +
>> +UPSTREAM_CHECK_URI = "https://github.com/brgl/libgpiod/releases"
>> +
>> +SRC_URI = "https://github.com/brgl/libgpiod/archive/v${PV}.tar.gz"
>
> Github archives are regenerated from time to time with different
> checksums, please use git fetcher and SRCREV matching with the SHA of
> the tag.
OK I'll update.
>
>> +
>> +SRC_URI[md5sum] = "e3430f35b6efa842693d659c0bfb7ad5"
>> +SRC_URI[sha256sum] = "de1947f3cb2cc4174364af430309fe6238976658575655bdbd76c60cffa7df92"
>> +
>> +inherit autotools pkgconfig
>> +
>> +# enable tools
>> +PACKAGECONFIG ?= "tools"
>> +
>> +PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
>> +PACKAGECONFIG[tools] = "--enable-tools,--disable-tools,"
>> +
>> +PACKAGES += " ${PN}-tools"
>> +
>> +FILES_${PN} = "${libdir}/*"
>
> What is missing in the default FILES_${PN}?
You're right it's not necessary to have this line. I'll drop it.
I also drop PV from recipe name and you PV = "0.2+git{SRCPV}" is that
OK? Thanks.
Will post V2 soon.
>
>> +FILES_${PN}-tools = "${bindir}/*"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

BR,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com

