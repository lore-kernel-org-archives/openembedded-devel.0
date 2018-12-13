Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 84B806C4F3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:00:01 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id n12so1992511qkh.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XXnIYrqrPiwQA8EcA6yr9gDwuKh3/xyJttUJcxXSY8E=;
	b=t+Gwzn9P8oIfyQ/9ncSGYKfZjOwIWE0rtHHgqZwE8Xd2Skv6qrKzPV0eUBqYZY9YFx
	DBzgKU71sfD4Zc4VaSRhlaf6rmWUvkF/ewFUcXFEvZxGveoqzes1pfUhM0C9QC3/Y0cd
	j+7l9umHmzFE92vM+tBU0fTzMswAksGQ6U3BZ+qLkqmQ51cUCWvD67qqEJpb51xeLg7I
	UgLgX0lk53zl9Uv9ae0TiZ0tCNPvG9Ns/CAJbFA/c2qR57yrUfohW/10dKvccFPb0wUl
	K8lMR8TAWRGmOviDi/NQzaFde8H8lIAAUtlOGqqLm57X1AE8i+Sk2stXl65NWe7nSrle
	H25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XXnIYrqrPiwQA8EcA6yr9gDwuKh3/xyJttUJcxXSY8E=;
	b=AMUcFA/yJjxO31SVww4ojj4wLkLtkM74Hmo8oXUudaS8pxrWKGQO3rxNDD6PWrVmly
	JRvWAftO4fvS747r0w0xiREQFqyTOhxGDZvFcX03Cx8rb1bt86xBBXf6Wwyr6wHxXHok
	mRiJXo6hVFpzpqo4E2IPgCZa8FpH91a3mC59RxSLxVjkE/Xtp/EKvqnLpix4Wfl6se5L
	D3+3j6NBz7gG7YC2eM2/PMBKdwnNanEMyQVCKO2gHkYzIpUOgL4LSOl44bht3fAsPZVC
	/YH0UbuXHUv+dOpS6acSFjYtfCURjUl6SL7geep72K4XHtDY5THixErvwAx5WA5KCqEY
	GGKg==
X-Gm-Message-State: AA+aEWZs3EX/Wz/0xYMBjmroM6yGkP6vgp/ImO798y+fVJSLh17gnaes
	weh97IhGwaTBZ9msdI9/vJycL7yeAiOk5hdX/aI=
X-Google-Smtp-Source: AFSGD/XrNzTUgQjhIzzirWOImeYdXFIafJEskzsoBl7dPk028N7/DsWccuw0Bvm4SzhaJltxfs7/8Z+vlEb0Wp7e8f8=
X-Received: by 2002:a37:a80a:: with SMTP id r10mr362095qke.2.1544734802106;
	Thu, 13 Dec 2018 13:00:02 -0800 (PST)
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
In-Reply-To: <57748E3B-3B23-4BEC-9673-EB348494EAD5@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Dec 2018 12:59:36 -0800
Message-ID: <CAMKF1sq93eTKUi-X9hK2co1SRTPf0UUbRZgOHzqbvfO=fq5+vA@mail.gmail.com>
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
X-List-Received-Date: Thu, 13 Dec 2018 21:00:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 13, 2018 at 11:13 AM Paolo Valente <paolo.valente@linaro.org> wrote:
>
>
>
> > Il giorno 13 dic 2018, alle ore 18:24, Khem Raj <raj.khem@gmail.com> ha scritto:
> >
> > On Thu, Dec 13, 2018 at 9:20 AM Paolo Valente <paolo.valente@linaro.org> wrote:
> >>
> >>
> >>
> >>> Il giorno 13 dic 2018, alle ore 18:18, Khem Raj <raj.khem@gmail.com> ha scritto:
> >>>
> >>> On Thu, Dec 13, 2018 at 9:16 AM Paolo Valente <paolo.valente@linaro.org> wrote:
> >>>>
> >>>>
> >>>>
> >>>>> Il giorno 13 dic 2018, alle ore 18:11, Khem Raj <raj.khem@gmail.com> ha scritto:
> >>>>>
> >>>>> On Thu, Dec 13, 2018 at 7:33 AM Paolo Valente <paolo.valente@linaro.org> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>> Il giorno 13 dic 2018, alle ore 16:27, Khem Raj <raj.khem@gmail.com> ha scritto:
> >>>>>>>
> >>>>>>> On Thu, Dec 13, 2018 at 7:16 AM Paolo Valente <paolo.valente@linaro.org> wrote:
> >>>>>>>>
> >>>>>>>> Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
> >>>>>>>> ---
> >>>>>>>> meta-oe/recipes-benchmark/s-suite/s-suite_git.bb | 5 +++--
> >>>>>>>> 1 file changed, 3 insertions(+), 2 deletions(-)
> >>>>>>>>
> >>>>>>>> diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> >>>>>>>> index 77d172814..166f3000a 100644
> >>>>>>>> --- a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> >>>>>>>> +++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> >>>>>>>> @@ -2,7 +2,7 @@ SUMMARY = "Small collection of benchmarks for storage I/O"
> >>>>>>>> LICENSE = "GPLv2"
> >>>>>>>> LIC_FILES_CHKSUM = "file://COPYING;md5=b529aaa6a0c50f15d29f89609b5c22f3"
> >>>>>>>>
> >>>>>>>> -SRCREV = "79698f645bfb28d0d966484ddad3a1efb562246d"
> >>>>>>>> +SRCREV = "e2727f70ed79b5461689c062a4a66a87f1adb4ce"
> >>>>>>>> PV = "0.0+git${SRCPV}"
> >>>>>>>> SRC_URI = "git://github.com/Algodev-github/S.git;protocol=https;branch=master"
> >>>>>>>>
> >>>>>>>> @@ -21,7 +21,8 @@ do_install() {
> >>>>>>>>  install -m0755 ${S}/def_config_params.sh ${D}/opt/S-suite
> >>>>>>>> }
> >>>>>>>>
> >>>>>>>> -RDEPENDS_${PN} = "bash bc coreutils gawk g++ gcc fio libaio libaio-dev sysstat"
> >>>>>>>> +RDEPENDS_${PN} = "bash bc coreutils gawk g++ gcc fio libaio libaio-dev sysstat \
> >>>>>>>> +                 psmisc git"
> >>>>>>>
> >>>>>>> why these new rdeps
> >>>>>>
> >>>>>> psmisc is for killall, git is for ... git :)
> >>>>>
> >>>>> I think busybox provides killall too.
> >>>>
> >>>> Ok, I'll remove this dep.
> >>>>
> >>>>>>
> >>>>>> Some weeks ago, I bumped into this missing dependencies that made the
> >>>>>> automatic execution of a test fail on a system without either killall
> >>>>>> or git.
> >>>>>
> >>>>> OK. so I wonder if we dont have killall enabled in oe-core by default in
> >>>>> busybox ? or does it need ps-misc one specifically ?
> >>>>>
> >>>>> git is interesting, does it clone some sources during executing tests ?
> >>>>>
> >>>> In kernel-task benchmarks a mainline Linux is cloned.  But maybe such
> >>>> benchmarks do not make sense in oe.  Let me know, and I'll remove this
> >>>> dep too.
> >>>
> >>> they are fine. We just need to understand that they are well meaning changes.
> >>>
> >>
> >> So, is the patch ok, or shall I remove the psmisc dep?
> >
> > I think it will be good to understand why killall went missing without
> > ps-misc package. As such patch is ok. Since I think killall should always
> > be there, either from ps-misc or a backfill from busybox.
> >
>
> Sorry, I created a lot of confusion.
>
> 1) killall *was not* missing in any of the oe rootfs that I tested
> (rootfs made by Anders, in CC).  killall was missing on a non-oe
> remote machine, made available for my tests by a company.  So, I added
> that dependency (in my S suite) to make it work on that machine.  For
> this reason, I thought of adding this dependency to this recipe.  But,
> if it is not needed, I'll remove it.

ok lets remove it

>
> 2) git is needed only if you want to run kernel-development tests.
>

lets keep it.

> That said, just tell me whether the patch is ok, or tell me what
> dependencies to remove, and I'll make a V2.

yes please.

>
> Thanks,
> Paolo
>
> >>
> >> Thanks,
> >> Paolo
>

