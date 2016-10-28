Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 65522719D5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Oct 2016 15:32:39 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id 12so2733487uas.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Oct 2016 08:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to; 
	bh=DTZsCmxnzdJ2/FQJkQjmFpeqH1zkbiXhWGRiP1Xjr/w=;
	b=eGMlQuidfNK+oyT+IJO1Eulio1VclJeWM7QVxbo4yXWsgbHKatohP1rnhTSLPVf3Zk
	yvHIzmu+qS/lZ/deNT7vb/AMv8AZfaYRGpUyNfNx+mnZgc9R7Te7eau76OcVSA0x5NQd
	y6CEsoKImXj8stuDO3Ew/iw/4fY8bZYqEXOYB1Ffh9W5T9T1uCUvblV6YIgw6EI0tTQK
	oQATO7Vz6WqkSS+JivXno16kl5/Z3+VTgUL95eMc5uUsXdMzSPj/ZiJcdsY3HvIiY60G
	BeCvmrJkPqiXPcxN+V0ih1lcRPRv5aZXmd6G9Z5qOqUENDp50yWzTpu0IcNb5Si5IIcC
	JGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to;
	bh=DTZsCmxnzdJ2/FQJkQjmFpeqH1zkbiXhWGRiP1Xjr/w=;
	b=lDPLwveej6IlMLfVc2QMql9EInung9LEFlKTvVbciYsoBAa17D55yqLd25hcr2V7Ld
	7TfMKJlFKYoywnpTn21TFbEHr7yPn85ob2lziMpdYjW0HsWZiSYbdcAb8u+KYD3zgDmx
	bROZHD0VFfx94abnruESP0Q4lKj52L4eX+vzpwFEKQZWe+foXYh8dEm3quLtsS1i7XX+
	3VPENxLt8Hmcq/tsSCOcqCmsU20zLklCUmoKBS9B1HW4ZPK3Sx5kH/ZPtsPxG3E7JnFT
	+x4m6vI8MSuneR2CGlK6c3+oPxevSKNWrahefr2quT1n46UKI9BcQHHUMQGZMSP7aQP2
	nQGQ==
X-Gm-Message-State: ABUngvfsaG7qScVg3yFrrs2rJnJHEaw7YOUIS090aaVqjODNdpVPrHb2et/FQhazuVyvMQ==
X-Received: by 10.176.85.152 with SMTP id v24mr12494306uaa.67.1477668760016;
	Fri, 28 Oct 2016 08:32:40 -0700 (PDT)
Received: from mail-ua0-f173.google.com (mail-ua0-f173.google.com.
	[209.85.217.173]) by smtp.gmail.com with ESMTPSA id
	o12sm3126518vka.19.2016.10.28.08.32.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Oct 2016 08:32:39 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ua0-f173.google.com with SMTP id 12so57261218uas.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Oct 2016 08:32:38 -0700 (PDT)
X-Received: by 10.176.6.233 with SMTP id g96mr12499767uag.97.1477668758567;
	Fri, 28 Oct 2016 08:32:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.49.82 with HTTP; Fri, 28 Oct 2016 08:32:37 -0700 (PDT)
In-Reply-To: <CABcZANnSmHOMkrKJ3M6CQN62+JHXCbRzXKZ3Ucx8PQ2_9cfmhQ@mail.gmail.com>
References: <1477649243-26613-1-git-send-email-ting.liu@nxp.com>
	<CABcZANnSmHOMkrKJ3M6CQN62+JHXCbRzXKZ3Ucx8PQ2_9cfmhQ@mail.gmail.com>
Date: Fri, 28 Oct 2016 13:32:37 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqgJE_15K6=4RcTzh34u6wNLKiK+w1hZ2LMz-mFTY9C0Q@mail.gmail.com>
Message-ID: <CAP9ODKqgJE_15K6=4RcTzh34u6wNLKiK+w1hZ2LMz-mFTY9C0Q@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] xterm: use ${libdir} to avoid installed-vs-shipped error on ppc64
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
X-List-Received-Date: Fri, 28 Oct 2016 15:32:40 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 28, 2016 at 1:07 PM, Christopher Larson <clarson@kergoth.com> wrote:
> On Fri, Oct 28, 2016 at 3:07 AM, <ting.liu@nxp.com> wrote:
>
>> xterm installs files into PREFIX/lib/X11/app-defaults by default.
>> This leads to QA issue on ppc64 which defines libdir as /usr/lib64:
>> ERROR: QA Issue: xterm: Files/directories were installed but not shipped
>> in any package:
>>   /usr/lib
>>   /usr/lib/X11
>>   /usr/lib/X11/app-defaults
>>   /usr/lib/X11/app-defaults/UXTerm
>>   /usr/lib/X11/app-defaults/KOI8RXTerm-color
>>   /usr/lib/X11/app-defaults/XTerm-color
>>   /usr/lib/X11/app-defaults/UXTerm-color
>>   /usr/lib/X11/app-defaults/KOI8RXTerm
>>   /usr/lib/X11/app-defaults/XTerm
>>
>> Fix it by passing --with-app-defaults=${libdir}/X11/app-defaults to
>> configure.
>>
>> Signed-off-by: Ting Liu <ting.liu@nxp.com>
>> ---
>>  meta-oe/recipes-graphics/xorg-app/xterm_325.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_325.bb
>> b/meta-oe/recipes-graphics/xorg-app/xterm_325.bb
>> index e0baf3c..48556c7 100644
>> --- a/meta-oe/recipes-graphics/xorg-app/xterm_325.bb
>> +++ b/meta-oe/recipes-graphics/xorg-app/xterm_325.bb
>> @@ -14,6 +14,7 @@ PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft
>> fontconfig fre
>>
>>  EXTRA_OECONF = " --x-includes=${STAGING_INCDIR} \
>>                   --x-libraries=${STAGING_LIBDIR} \
>> +                 --with-app-defaults=${libdir}/X11/app-defaults \
>>                   FREETYPE_CONFIG=${STAGING_BINDIR_CROSS}/freetype-config
>> \
>>                   --disable-imake \
>>                   --disable-rpath-hack \
>>
>
> Are you sure this is correct? I highly doubt those files are actually
> multilib specific. Would it not be better to just package these files in
> their current location?

Or use datadir

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

