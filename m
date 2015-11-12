Return-Path: <zoltan.kuscsik@linaro.org>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 589DE77116
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 06:08:17 +0000 (UTC)
Received: by wmww144 with SMTP id w144so73474975wmw.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 22:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=avH93Ro773WZB7c62HJLp8ddznQbXL7cgqeJR/KAxpo=;
	b=ej8I1Pizhf+qNNF/Fi+nk0tH8+vYsBqu0PvuT40ThT+ZxRy0/pga/m+TLmGLIqdVOm
	JFUM6yCMGKomxkb/DHNA3orSdjTpooTqEsbk4vj8y3KY2gjK4gzXhA9qzNQNsjZIgPUJ
	0j/L5CflU1oKo95IzTh6CKyZtFXFVpUNuZYLEu21DUU6yprJ9FHlN/xAB95EOSrchEZI
	WgOGoLHh8n8IEWBuLg5/bI/VMX/oZ3LF9zhF6RN/wSkYv83weq2+Nvun/oEbGCLdXvQo
	oEMNOKbMAI1jzcUieGA+gZH2vBbbzIQ5PSAUns3VNwBUbe72fJO8gFTBjbOxakEiw56G
	Qpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=avH93Ro773WZB7c62HJLp8ddznQbXL7cgqeJR/KAxpo=;
	b=PeE/AGpjbWYq99b7eVkdRj8zMrCSikHTiwXPD371ZZSz0bxDLldF4bQnkP8672VoqO
	Ft5OJy+sk/l8yf844/FgJdJkthtPgt98NAT9DNw1Lm28jGBoCLUQJ0Cz0gFVcTYXyAQL
	Bt/gXTFtYlZuOFHBCLzbkYqgfQJkBWh5Uw9fQfcLHePugA1Yp0AvUUgoe8qjEKxJfSbg
	qGJL4crcE4nC4t0rGgR6hHebyRt9oV18uvP8XN1NYqyWlqumQE0KeBjBFyqaMEr+Hk4G
	IDKrd+rtXKcnDRJsSWXo1U7ygFWtgEpP+LC8CCyCIiALeZfR3tN8UUKMFwQ9pzdtz2Ve
	JGSw==
X-Gm-Message-State: ALoCoQm3uOV2BEjVOVVu4KKH6nmQn3V5pbZcZabsJvBaLzZe85jwHcch+gKRnZxUyKSxPc80UM6G
X-Received: by 10.28.156.75 with SMTP id f72mr27332156wme.91.1447308497229;
	Wed, 11 Nov 2015 22:08:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.27.127.213 with HTTP; Wed, 11 Nov 2015 22:07:57 -0800 (PST)
In-Reply-To: <CAJ86T=X_4vtGKXxW5y8e3zS-tv9fAnnmsOPFFuOrZp8wHdJMCA@mail.gmail.com>
References: <1447217296-7145-1-git-send-email-armccurdy@gmail.com>
	<CAAzKXngADOxQ-rOfF1DBSNqhV-GUPookXZjLkTZ=CgOf4ks7Eg@mail.gmail.com>
	<CAJ86T=X_4vtGKXxW5y8e3zS-tv9fAnnmsOPFFuOrZp8wHdJMCA@mail.gmail.com>
From: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
Date: Thu, 12 Nov 2015 07:07:57 +0100
Message-ID: <CAAzKXnh-muNFgKm+ndHzLgMeSk7X-Zq3f3NWaenPHF-LkQgJ=w@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-browser][PATCH 1/2] cef3: use PARALLEL_MAKE to control build parallelism
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
X-List-Received-Date: Thu, 12 Nov 2015 06:08:23 -0000
Content-Type: text/plain; charset=UTF-8

Fair enough.

Z

On 11 November 2015 at 08:22, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Tue, Nov 10, 2015 at 9:48 PM, Zoltan Kuscsik
> <zoltan.kuscsik@linaro.org> wrote:
> > Hi,
> >
> > isn't ninja picking up the number of cores separately? I'm not sure why
> > this is needed.
>
> Without any -j option, ninja will default to "-j (logical_cores + 2)".
>
> The PARALLEL_MAKE value configured in OE isn't just about maximising
> parallelism though (although that's it's common usage), it's also
> useful to limit parallelism and reduce the load on the CPU. If
> PARALLEL_MAKE isn't passed to ninja builds then they will always fully
> load the CPU.
>
> > Z
> >
> > On 11 November 2015 at 05:48, Andre McCurdy <armccurdy@gmail.com> wrote:
> >
> >> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> >> ---
> >>  recipes-browser/chromium/cef3_280796.bb | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/recipes-browser/chromium/cef3_280796.bb
> >> b/recipes-browser/chromium/cef3_280796.bb
> >> index d827b8e..6872e5b 100644
> >> --- a/recipes-browser/chromium/cef3_280796.bb
> >> +++ b/recipes-browser/chromium/cef3_280796.bb
> >> @@ -60,5 +60,5 @@ do_qa_configure() {
> >>  }
> >>
> >>  do_compile() {
> >> -    ninja -C out/${CHROMIUM_BUILD_TYPE} -j${BB_NUMBER_THREADS}
> cefsimple
> >> +    ninja -C out/${CHROMIUM_BUILD_TYPE} ${PARALLEL_MAKE} cefsimple
> >>  }
> >> --
> >> 1.9.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> >
> >
> >
> > --
> > Zoltan Kuscsik
> >
> > Senior Software Developer, Linaro Digital Home Group
> > email: zoltan.kuscsik@linaro.org
> > IRC: zoli_ on irc.linaro.org
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



-- 
Zoltan Kuscsik

Senior Software Developer, Linaro Digital Home Group
email: zoltan.kuscsik@linaro.org
IRC: zoli_ on irc.linaro.org

