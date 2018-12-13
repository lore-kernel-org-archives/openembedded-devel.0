Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 271D36C49D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2018 17:25:03 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id 189so1577701qkj.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2018 09:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xL/H4Nv9uxYluwNIqg1lLxe6S76SDtBb+7zzKZCh1Dc=;
	b=nBMVBIsBf2SHGjx32AQM+r9OHZgnY0lwZwjYCb8BxVQdvbgyN38jQ4DSwDMQHpm3FX
	1vII7nTD3dUPnI2ll9NOFK+6/km5aAzs/T4wjAWW7p2JhTkCC3wkLWu65DlUywfpxTI1
	M7Ks1c+pYAtk7doR192sihTe+g68TI6+VmQOQ3GKn7HtYONwPEblYhMhUK8InPnoE101
	JioNHelDzJ3mBR5sk5TyGXwde8u8ANz/N2MYS2n6pGm5PeJa/zmVyrRprUrmZAHAT0Og
	r9kAd9uyVEb/jO/oHKCfe6DtejkFYpS9oRbNjjkw6wdiVU9oFCfUCRFDfGB3rAlfAw+L
	3W4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xL/H4Nv9uxYluwNIqg1lLxe6S76SDtBb+7zzKZCh1Dc=;
	b=EhrSydvIFFnB5+lbFinGRm61iTNdCI2qtKxDVasLxoByFI8zn5X2IshmIGdKat3H+N
	qOdS4AgXQiMT4YIvNERmVN+0O3zArNPSZESrd/LBW+3wCd0LJN7Lj7xINAJMm59QTvoe
	hnuX8Opb18b8VGpTUjqeEsp3ItQK7L8AXTjM5b+EzTxrhVIEt9ryQIA/taJCoqXulb7D
	mIrKbucHQc4qUS7e5A6P5+M+yF4dnpS9694wTPdC4ri6VIePG5Hn26ZvAYVy82s1Pjet
	A8apyQurL6aFfprb4VHhSHWHlSQVaq1Smj74pqmwPuHTftpN5TQFQFSIdy2RX6zWMLuM
	3g9g==
X-Gm-Message-State: AA+aEWZqnpQ2fwJAlbxHdsFu+qNBpDcuyPIr6givAeqRO+YpKpKHyGHq
	cHST7ufyFaXN9FkQFAI5rwUVzGzj09h/q6aKtjc=
X-Google-Smtp-Source: AFSGD/X45I3+z1I0KPhfIU8TmDp41akNaT31V8tQKcqT2w18oCRfKw64ClXh9NB1MDFLKPGP7ZW94F21hmuiErGZdFo=
X-Received: by 2002:a37:4c41:: with SMTP id z62mr22624022qka.206.1544721903845;
	Thu, 13 Dec 2018 09:25:03 -0800 (PST)
MIME-Version: 1.0
References: <20181213151533.13730-1-paolo.valente@linaro.org>
	<CAMKF1srK53HOyMG4+773eELKOigsqHwK0-bMkQnZagwR1gYssw@mail.gmail.com>
	<6C5A8DD4-110A-43D6-9976-0B429273AB26@linaro.org>
	<CAMKF1sqpeovnSSpswY4s2ZzZfE15tQoVhdu4m6rjuDkgP7ODfw@mail.gmail.com>
	<47F5AE94-3A9F-4C6E-86C4-F56E4E7ADA18@linaro.org>
	<CAMKF1spYyDAxBCHrcA6jTYYT7v8tprHWF6ZOxBkQJc+n1_eQ6w@mail.gmail.com>
	<3B9426AF-6E9F-45D7-9D6C-AA0B83188CEF@linaro.org>
In-Reply-To: <3B9426AF-6E9F-45D7-9D6C-AA0B83188CEF@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Dec 2018 09:24:37 -0800
Message-ID: <CAMKF1srVtW2Utpj1PBsYRo6xMuUuiXVTzN+9t_nxcVHg-=PXFg@mail.gmail.com>
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
X-List-Received-Date: Thu, 13 Dec 2018 17:25:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 13, 2018 at 9:20 AM Paolo Valente <paolo.valente@linaro.org> wrote:
>
>
>
> > Il giorno 13 dic 2018, alle ore 18:18, Khem Raj <raj.khem@gmail.com> ha scritto:
> >
> > On Thu, Dec 13, 2018 at 9:16 AM Paolo Valente <paolo.valente@linaro.org> wrote:
> >>
> >>
> >>
> >>> Il giorno 13 dic 2018, alle ore 18:11, Khem Raj <raj.khem@gmail.com> ha scritto:
> >>>
> >>> On Thu, Dec 13, 2018 at 7:33 AM Paolo Valente <paolo.valente@linaro.org> wrote:
> >>>>
> >>>>
> >>>>
> >>>>> Il giorno 13 dic 2018, alle ore 16:27, Khem Raj <raj.khem@gmail.com> ha scritto:
> >>>>>
> >>>>> On Thu, Dec 13, 2018 at 7:16 AM Paolo Valente <paolo.valente@linaro.org> wrote:
> >>>>>>
> >>>>>> Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
> >>>>>> ---
> >>>>>> meta-oe/recipes-benchmark/s-suite/s-suite_git.bb | 5 +++--
> >>>>>> 1 file changed, 3 insertions(+), 2 deletions(-)
> >>>>>>
> >>>>>> diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> >>>>>> index 77d172814..166f3000a 100644
> >>>>>> --- a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> >>>>>> +++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> >>>>>> @@ -2,7 +2,7 @@ SUMMARY = "Small collection of benchmarks for storage I/O"
> >>>>>> LICENSE = "GPLv2"
> >>>>>> LIC_FILES_CHKSUM = "file://COPYING;md5=b529aaa6a0c50f15d29f89609b5c22f3"
> >>>>>>
> >>>>>> -SRCREV = "79698f645bfb28d0d966484ddad3a1efb562246d"
> >>>>>> +SRCREV = "e2727f70ed79b5461689c062a4a66a87f1adb4ce"
> >>>>>> PV = "0.0+git${SRCPV}"
> >>>>>> SRC_URI = "git://github.com/Algodev-github/S.git;protocol=https;branch=master"
> >>>>>>
> >>>>>> @@ -21,7 +21,8 @@ do_install() {
> >>>>>>   install -m0755 ${S}/def_config_params.sh ${D}/opt/S-suite
> >>>>>> }
> >>>>>>
> >>>>>> -RDEPENDS_${PN} = "bash bc coreutils gawk g++ gcc fio libaio libaio-dev sysstat"
> >>>>>> +RDEPENDS_${PN} = "bash bc coreutils gawk g++ gcc fio libaio libaio-dev sysstat \
> >>>>>> +                 psmisc git"
> >>>>>
> >>>>> why these new rdeps
> >>>>
> >>>> psmisc is for killall, git is for ... git :)
> >>>
> >>> I think busybox provides killall too.
> >>
> >> Ok, I'll remove this dep.
> >>
> >>>>
> >>>> Some weeks ago, I bumped into this missing dependencies that made the
> >>>> automatic execution of a test fail on a system without either killall
> >>>> or git.
> >>>
> >>> OK. so I wonder if we dont have killall enabled in oe-core by default in
> >>> busybox ? or does it need ps-misc one specifically ?
> >>>
> >>> git is interesting, does it clone some sources during executing tests ?
> >>>
> >> In kernel-task benchmarks a mainline Linux is cloned.  But maybe such
> >> benchmarks do not make sense in oe.  Let me know, and I'll remove this
> >> dep too.
> >
> > they are fine. We just need to understand that they are well meaning changes.
> >
>
> So, is the patch ok, or shall I remove the psmisc dep?

I think it will be good to understand why killall went missing without
ps-misc package. As such patch is ok. Since I think killall should always
be there, either from ps-misc or a backfill from busybox.

>
> Thanks,
> Paolo
>

