Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0EF4471985
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:34:15 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id r14so3986924qtp.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PmYwyqkCCWyM6HsbmvAqAZBZliTeTulyGBvyiE9+yoQ=;
	b=Y8JHiqc4rSUWKiT0Sw//s6VquDoEDxTUY9Jm0dK2N73djkY8crOPNnvAIokIEUVuYb
	OWdPnJ6Mm2rHQRBkH4a07Q8BlXN6WAR4LjvqKTA0mBLM71cp79/geW20MGPGOkq1Q+gE
	cgQAmSXeixjQ7qzOPylRcp0SDrzAzC+hcDKfqurahD6rMOSviVU8XkGe5IL6lYrvshb0
	VF0Byl6jEm1fN+f9nvgGpVa7JqSz68zI05sOUTpZ7UJjn22POeB4/5c0Ah8XTHq2/VYM
	3sPyePID9WsVK2SXfdM4l3iWWFTATKQYGnydRjd98ZapwuPtDXI95ZJNrI4S1QNumcTa
	GCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PmYwyqkCCWyM6HsbmvAqAZBZliTeTulyGBvyiE9+yoQ=;
	b=VRsAyrcDWHbuVbSoIHWyb1fCQOUTzesWABUnIR4N1Zr1ilW+CvZXOn71OFZqNA7MoI
	qEiL9rlAOUcY694IrsVveboIcUP5eworlxXY/1QGk3o7jzE20OT65Q+CKC5N+MyRFDeu
	MrnnLB/Q2WiqdPT1PxMlav5bxX+Sm5RUkJ6c+8GICBmLIpXaKnItb0xPIUk/8TbX3+XF
	kbAceRhfYzhVFd5+a27fBGavQrZzA3jTJlNkIid3EDb9FKUWsPtmpHDKdrKD89Te7jl4
	V7mZCKHC1CTgWZHePQC7N1ImYBNNKhXKgYP6ldYvSKsHY95q19SNT4rY+IDplforsv0Z
	3KbA==
X-Gm-Message-State: AA+aEWabdcie4HqAC49xnMRjKfISQXeLi85UplmPscEWsfUgZO7KwUp3
	SV8FMqqWQGE1a+HB4RP0IlQr4BA9a82g222SDuo=
X-Google-Smtp-Source: AFSGD/V8eyuttR+hBCGY2OGpiGNI5wsUefUk+l/sXYCOns++6dIT0RazJJtTSvlfYDhnI8Fc7RFP8jtDs8QtlcfKgTs=
X-Received: by 2002:a0c:a144:: with SMTP id d62mr485281qva.50.1544736855822;
	Thu, 13 Dec 2018 13:34:15 -0800 (PST)
MIME-Version: 1.0
References: <20181213151533.13730-1-paolo.valente@linaro.org>
	<CAMKF1srK53HOyMG4+773eELKOigsqHwK0-bMkQnZagwR1gYssw@mail.gmail.com>
	<6C5A8DD4-110A-43D6-9976-0B429273AB26@linaro.org>
	<CAMKF1sqpeovnSSpswY4s2ZzZfE15tQoVhdu4m6rjuDkgP7ODfw@mail.gmail.com>
	<47F5AE94-3A9F-4C6E-86C4-F56E4E7ADA18@linaro.org>
	<CAMKF1spYyDAxBCHrcA6jTYYT7v8tprHWF6ZOxBkQJc+n1_eQ6w@mail.gmail.com>
	<3B9426AF-6E9F-45D7-9D6C-AA0B83188CEF@linaro.org>
	<CAMKF1srVtW2Utpj1PBsYRo6xMuUuiXVTzN+9t_nxcVHg-=PXFg@mail.gmail.com>
	<57748E3B-3B23-4BEC-9673-EB348494EAD5@linaro.org>
	<CAMKF1sq93eTKUi-X9hK2co1SRTPf0UUbRZgOHzqbvfO=fq5+vA@mail.gmail.com>
In-Reply-To: <CAMKF1sq93eTKUi-X9hK2co1SRTPf0UUbRZgOHzqbvfO=fq5+vA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Dec 2018 13:33:49 -0800
Message-ID: <CAMKF1srpE-9svv0bSzD1s-GZ1Z5qHjEmuOsU7hZWap8MZz9pSA@mail.gmail.com>
To: paolo.valente@linaro.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Mark Brown <broonie@linaro.org>
Subject: Re: [meta-oe][PATCH] s-suite: push SRCREV to version 3.0
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
X-List-Received-Date: Thu, 13 Dec 2018 21:34:16 -0000
Content-Type: text/plain; charset="UTF-8"

btw. it fails on mips/musl
http://errors.yoctoproject.org/Errors/Details/211648/
On Thu, Dec 13, 2018 at 12:59 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Dec 13, 2018 at 11:13 AM Paolo Valente <paolo.valente@linaro.org> wrote:
> >
> >
> >
> > > Il giorno 13 dic 2018, alle ore 18:24, Khem Raj <raj.khem@gmail.com> ha scritto:
> > >
> > > On Thu, Dec 13, 2018 at 9:20 AM Paolo Valente <paolo.valente@linaro.org> wrote:
> > >>
> > >>
> > >>
> > >>> Il giorno 13 dic 2018, alle ore 18:18, Khem Raj <raj.khem@gmail.com> ha scritto:
> > >>>
> > >>> On Thu, Dec 13, 2018 at 9:16 AM Paolo Valente <paolo.valente@linaro.org> wrote:
> > >>>>
> > >>>>
> > >>>>
> > >>>>> Il giorno 13 dic 2018, alle ore 18:11, Khem Raj <raj.khem@gmail.com> ha scritto:
> > >>>>>
> > >>>>> On Thu, Dec 13, 2018 at 7:33 AM Paolo Valente <paolo.valente@linaro.org> wrote:
> > >>>>>>
> > >>>>>>
> > >>>>>>
> > >>>>>>> Il giorno 13 dic 2018, alle ore 16:27, Khem Raj <raj.khem@gmail.com> ha scritto:
> > >>>>>>>
> > >>>>>>> On Thu, Dec 13, 2018 at 7:16 AM Paolo Valente <paolo.valente@linaro.org> wrote:
> > >>>>>>>>
> > >>>>>>>> Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
> > >>>>>>>> ---
> > >>>>>>>> meta-oe/recipes-benchmark/s-suite/s-suite_git.bb | 5 +++--
> > >>>>>>>> 1 file changed, 3 insertions(+), 2 deletions(-)
> > >>>>>>>>
> > >>>>>>>> diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> > >>>>>>>> index 77d172814..166f3000a 100644
> > >>>>>>>> --- a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> > >>>>>>>> +++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> > >>>>>>>> @@ -2,7 +2,7 @@ SUMMARY = "Small collection of benchmarks for storage I/O"
> > >>>>>>>> LICENSE = "GPLv2"
> > >>>>>>>> LIC_FILES_CHKSUM = "file://COPYING;md5=b529aaa6a0c50f15d29f89609b5c22f3"
> > >>>>>>>>
> > >>>>>>>> -SRCREV = "79698f645bfb28d0d966484ddad3a1efb562246d"
> > >>>>>>>> +SRCREV = "e2727f70ed79b5461689c062a4a66a87f1adb4ce"
> > >>>>>>>> PV = "0.0+git${SRCPV}"
> > >>>>>>>> SRC_URI = "git://github.com/Algodev-github/S.git;protocol=https;branch=master"
> > >>>>>>>>
> > >>>>>>>> @@ -21,7 +21,8 @@ do_install() {
> > >>>>>>>>  install -m0755 ${S}/def_config_params.sh ${D}/opt/S-suite
> > >>>>>>>> }
> > >>>>>>>>
> > >>>>>>>> -RDEPENDS_${PN} = "bash bc coreutils gawk g++ gcc fio libaio libaio-dev sysstat"
> > >>>>>>>> +RDEPENDS_${PN} = "bash bc coreutils gawk g++ gcc fio libaio libaio-dev sysstat \
> > >>>>>>>> +                 psmisc git"
> > >>>>>>>
> > >>>>>>> why these new rdeps
> > >>>>>>
> > >>>>>> psmisc is for killall, git is for ... git :)
> > >>>>>
> > >>>>> I think busybox provides killall too.
> > >>>>
> > >>>> Ok, I'll remove this dep.
> > >>>>
> > >>>>>>
> > >>>>>> Some weeks ago, I bumped into this missing dependencies that made the
> > >>>>>> automatic execution of a test fail on a system without either killall
> > >>>>>> or git.
> > >>>>>
> > >>>>> OK. so I wonder if we dont have killall enabled in oe-core by default in
> > >>>>> busybox ? or does it need ps-misc one specifically ?
> > >>>>>
> > >>>>> git is interesting, does it clone some sources during executing tests ?
> > >>>>>
> > >>>> In kernel-task benchmarks a mainline Linux is cloned.  But maybe such
> > >>>> benchmarks do not make sense in oe.  Let me know, and I'll remove this
> > >>>> dep too.
> > >>>
> > >>> they are fine. We just need to understand that they are well meaning changes.
> > >>>
> > >>
> > >> So, is the patch ok, or shall I remove the psmisc dep?
> > >
> > > I think it will be good to understand why killall went missing without
> > > ps-misc package. As such patch is ok. Since I think killall should always
> > > be there, either from ps-misc or a backfill from busybox.
> > >
> >
> > Sorry, I created a lot of confusion.
> >
> > 1) killall *was not* missing in any of the oe rootfs that I tested
> > (rootfs made by Anders, in CC).  killall was missing on a non-oe
> > remote machine, made available for my tests by a company.  So, I added
> > that dependency (in my S suite) to make it work on that machine.  For
> > this reason, I thought of adding this dependency to this recipe.  But,
> > if it is not needed, I'll remove it.
>
> ok lets remove it
>
> >
> > 2) git is needed only if you want to run kernel-development tests.
> >
>
> lets keep it.
>
> > That said, just tell me whether the patch is ok, or tell me what
> > dependencies to remove, and I'll make a V2.
>
> yes please.
>
> >
> > Thanks,
> > Paolo
> >
> > >>
> > >> Thanks,
> > >> Paolo
> >

