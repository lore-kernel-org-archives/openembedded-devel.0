Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id CFBAC76D81
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 13:28:17 +0000 (UTC)
Received: by laba3 with SMTP id a3so12452168lab.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 06:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=8DLAmqdjtObfAwetUp6rOnIhtpuN1rjI3ivEWizcDcs=;
	b=ElhCPdcvHBspRi47tqJHwx9hW3/T8GN70/jrWaS5em2BEWvQ3H2lm7PiTECK1ILPjQ
	0FQcWNiWEwlpqSsmphWsYiUyz9EhQhsF2QbElDHEVxYOvWYo3rgTIO0lBmpnbiK8jhYJ
	D9v9KUO6GkUtL/H8pbSHpxFQRYmzxqm5I8AFqBaqbd3TMlAui0Qm3VNXvl0QTW2fIEKd
	Bj5u9PqsoXSIfv98e6lsR5yUB3YlT6rIcv7mYci7eCRKRXGmhsDYZZZkIemVwE7uCpmY
	qAdrqWoZLd6cpaJ8cfeH9axMml+XB0SMoJ02rIMbns9XmnoqaYcNxeYg0ifcD0MVL41l
	vpNw==
X-Gm-Message-State: ALoCoQn7MBxNR2tNbjY74khfb/dWTBwUOHvBJMPRWbwfbORse9kgJP4NW6Jn9gRnHxrbHoJX6CSH
X-Received: by 10.152.27.38 with SMTP id q6mr2525965lag.24.1440682097087;
	Thu, 27 Aug 2015 06:28:17 -0700 (PDT)
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com.
	[209.85.215.54])
	by smtp.gmail.com with ESMTPSA id rp6sm579262lbb.44.2015.08.27.06.28.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Aug 2015 06:28:15 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by laaa3 with SMTP id a3so3323469laa.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 06:28:15 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.112.85.204 with SMTP id j12mr2185058lbz.47.1440682095782;
	Thu, 27 Aug 2015 06:28:15 -0700 (PDT)
Received: by 10.112.211.132 with HTTP; Thu, 27 Aug 2015 06:28:15 -0700 (PDT)
In-Reply-To: <1A315F32-74AE-4B3B-A5B7-65A33C5A6BC7@gmail.com>
References: <1A315F32-74AE-4B3B-A5B7-65A33C5A6BC7@gmail.com>
Date: Thu, 27 Aug 2015 10:28:15 -0300
Message-ID: <CAP9ODKrwYHeeUdcLCLm6Bsw26V4ypZA-kNDYoX=fA4bx_MYQ0Q@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Tobias Theophile <Tobias.Theophile@rademacher.de>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: meta-java - recent commits break foreign (MY!) builds ...
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
X-List-Received-Date: Thu, 27 Aug 2015 13:28:18 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 24, 2015 at 1:48 PM, Jens Rehsack <rehsack@gmail.com> wrote:
\> recent commits (24b98ac3, 15ed9662) on meta-java broke my build, so
I reverted them for my fork and decided to report:
>
> 15ed9662
>
> This one is easy - and very likely similar easy to fix for patch author:
>
> The layer-readme tells users:
>
> Usage instructions
> ------------------
>
> You should define at least the following variables in a distro include file or local.conf
>
> PREFERRED_PROVIDER_virtual/java-initial-native = "cacao-initial-native"
>
> PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
> PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
>
> With 15ed9662, jamvm requires ecj-bootstrap-native and ecj-bootstrap-native requires virtual/java-native which shall be jamvm-native.
> Since I trust in you have a running version, there is very likely a way out by a nice and proper PREFERRED_PROVIDER_* setup making 15ed9662 succeed.

I ended reverting this one.

Can you help us to find a proper fix for this? We ended breaking this
as we were enabling the use of Oracle Java as builder and OpenJDK
ended broken.

> 24b98ac3
>
> This is more complicated. I announced that in a small round already - and without this
> commit I would hold back until I finished openjdk-8 cross-compiling and running on our
> i.MX6 box with Framebuffer-XBMC and Java-Service for Smart-Home control.

Yes, we need to fix it and to be honest I personally would kill
openjdk 7 once 8 is ready.

> See https://github.com/rehsack/meta-java/commits/master for an icedtea7-native and an
> openjdk-8-native without any alsa or x11 dependency, compiling smoothly alongside a
> gpu-viv-bin-mx6q (with a tiny patch removing hidden x11 dependency).

Can you prepare a patch for fsl-arm? we can review and fix it fast :)

> There is no serious need for x11 the dependency chain down from icedtea7-native.
>
> Maybe the requirement as added was intended for target packages only, but hit accidentally
> some native packages either.

You are right; we need _class-target on those. Can you fix it or want
me to cook a patch?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

