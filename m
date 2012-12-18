Received: from mail-pa0-f54.google.com ([209.85.220.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tl0FI-00079H-FU
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2012 17:43:33 +0100
Received: by mail-pa0-f54.google.com with SMTP id bi5so653148pad.41
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2012 08:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=/h5mp0B84tV2V0Lbn+j/kpGDu3Z8dJPUThKd9aXe0W8=;
	b=PC9ClbC4Xx3stGcEr08sZa10jy0iH7uxUzUtIDFzuDV7139oq95Vz3oOGkO2ub0GHn
	uk4xlfEy5SYeYcFyBLO4omN1BLIQLNbjZ6Mcz3UK4RgQW/sz4YBHH34mRUN/rHnUSSYx
	uz84eZrAqMpf4tTZzpOSkP1pEnuKVwbRiYQIcaqHdYWHSsap3H0xYq6kM3zZmNFwYyAG
	T5dwLisXgQ/YuWxsCOmdURQxlqnhAW3VVGBQ8l5HGXfKvUDyr/kQ42cpAx7t7TUNfGbO
	6+tCh8LDt7mqLmgA7R4BcZFfUlIF7Zbme32PmdzrgTqNqdF3nDRDAXLCkLLNP67X59b/
	sAmA==
MIME-Version: 1.0
Received: by 10.66.77.200 with SMTP id u8mr8154296paw.43.1355848057859; Tue,
	18 Dec 2012 08:27:37 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.51.193 with HTTP; Tue, 18 Dec 2012 08:27:37 -0800 (PST)
In-Reply-To: <50D0978D.9090805@gmail.com>
References: <50D0978D.9090805@gmail.com>
Date: Tue, 18 Dec 2012 14:27:37 -0200
X-Google-Sender-Auth: OpCgZlzT8QPEE89CBKaVbg7-r5I
Message-ID: <CAP9ODKqThczL+=m0A2=Q+u+g8e=opB4ny60EtR9L-Pj4eM+o+A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Marco Cavallini <m.cavallini@koansoftware.com>
Subject: Re: oe-core 2.6 kernel support
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
X-List-Received-Date: Tue, 18 Dec 2012 16:43:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Dec 18, 2012 at 2:19 PM, Marco <koansoftware@gmail.com> wrote:
> Hi,
> after a lot of time spent trying to create my own oe-core BSP based on old
> recipes I have been using in oe-classic, I found that there is any BSP
> working with oe-core and using old kernels (< 3.0).
>
> Probably for most of you this is obsolete and irrelevant topic because
> everybody is focused on new CPUs (> Armv5)
>
> I avoid to discuss what I tried in older to create an oe-core/yocto BSP
> (using 2.6.30)  and I will focus on an example that anyone can easily
> verify.
>
> Paul had kindly pointed me to the meta-handheld stuff so I tried oe-core +
> meta-handheld and I built:
>  akita -> ok (3.2.32-git)
>  hx4700 -> ok (3.0.1)
>  h3600 -> fails (2.6.29)
>
> I wonder if it could be a gcc (4.7.2) issue with older kernels and moreover
> if anybody experienced this or has successfully built something with old
> kernels.
>
> Any hint would be greatly appreciated.

In meta-fsl-arm we support 2.6.35; we did include some patches for
newer GCC and GLibC support on it.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


