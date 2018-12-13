Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 799616C460
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2018 17:18:38 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id n21so2987557qtl.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2018 09:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JNMoiqAIfJuFzuHJ/lwzWQd/5quTkiP/7vN/3mSXTK0=;
	b=EZJjkGJOvM5QihpJgYG21qThN7JHdJIO+cDDh1RhluFwJjtjHbR/OgOdl4heea5Y2q
	cddabvazIu8EGkHvhGihF9VXsYg3CL/eJPebGvr/aQlS1olM1J1zVxMT0P4vxv6bz7iu
	iEHlQUmtOWIKTR1pm3CtpPpyzfN+ogu5Ke15EmmQY6ZAuX62qjeNlaswb2sPa9Qge/3E
	u0ET+VL4Wd2WnGxHp3qFew4PGQlWtYiw8LH+SpMgTZr9IMTBY9uONHIgB10EtZl1XwAh
	COQZ6x6/cxn1SEqDjWBAKH7SwQu2/1IP/ulozOJAjdzHrwvZKENWBjvQTfaTLSsD75IB
	vbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JNMoiqAIfJuFzuHJ/lwzWQd/5quTkiP/7vN/3mSXTK0=;
	b=f+7PAWXi2z/Gs0s5rofx7ZHZiZYb+D8H27jenW8uo4o858vTkYS2KhwT5PCelcc2l4
	ltFOMTFhcenKZojQSKcYYXSY9F8fV5fyetTUYLdd6xqABlWJy7jIo4eOPIhWc6iJEATC
	CYI5BPAy7YlIWor8Ke90scgvLjKw2U5rTyyrT/lGvMhTLYKEWePnB8RuX+RzWRx+1pwZ
	OU/UNR1u3DoCMVhqhtg/mQf8qcn4tO3UFzhVFaiF2ONzDuJotPo4J1vn/h0iojmk/sM1
	H6BmMQNBqubkj6qxUazhi9Fl9vJyA8Oy42LOHuw/nYmggoQNTYNLoYq96MfCU22kapf5
	osVg==
X-Gm-Message-State: AA+aEWbHcWaaZYxCVwN+WRAbVk4Bd9U1zZK3UXqBXFDx9yRnUy5EZT5L
	D2QHyIikgvHZSMpcXrLL/TUmKCuemZqYHFqZrfY=
X-Google-Smtp-Source: AFSGD/WzqUid33fie2OM00mxMkAdyagesfPppCL6TGLIzRKcUyMlgx1KVWlO/ZYKHEdjddajUU6+0uO+4MdY9uoHf5Q=
X-Received: by 2002:ac8:36ba:: with SMTP id a55mr24399493qtc.236.1544721519254;
	Thu, 13 Dec 2018 09:18:39 -0800 (PST)
MIME-Version: 1.0
References: <20181213151533.13730-1-paolo.valente@linaro.org>
	<CAMKF1srK53HOyMG4+773eELKOigsqHwK0-bMkQnZagwR1gYssw@mail.gmail.com>
	<6C5A8DD4-110A-43D6-9976-0B429273AB26@linaro.org>
	<CAMKF1sqpeovnSSpswY4s2ZzZfE15tQoVhdu4m6rjuDkgP7ODfw@mail.gmail.com>
	<47F5AE94-3A9F-4C6E-86C4-F56E4E7ADA18@linaro.org>
In-Reply-To: <47F5AE94-3A9F-4C6E-86C4-F56E4E7ADA18@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Dec 2018 09:18:13 -0800
Message-ID: <CAMKF1spYyDAxBCHrcA6jTYYT7v8tprHWF6ZOxBkQJc+n1_eQ6w@mail.gmail.com>
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
X-List-Received-Date: Thu, 13 Dec 2018 17:18:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 13, 2018 at 9:16 AM Paolo Valente <paolo.valente@linaro.org> wrote:
>
>
>
> > Il giorno 13 dic 2018, alle ore 18:11, Khem Raj <raj.khem@gmail.com> ha scritto:
> >
> > On Thu, Dec 13, 2018 at 7:33 AM Paolo Valente <paolo.valente@linaro.org> wrote:
> >>
> >>
> >>
> >>> Il giorno 13 dic 2018, alle ore 16:27, Khem Raj <raj.khem@gmail.com> ha scritto:
> >>>
> >>> On Thu, Dec 13, 2018 at 7:16 AM Paolo Valente <paolo.valente@linaro.org> wrote:
> >>>>
> >>>> Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
> >>>> ---
> >>>> meta-oe/recipes-benchmark/s-suite/s-suite_git.bb | 5 +++--
> >>>> 1 file changed, 3 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> >>>> index 77d172814..166f3000a 100644
> >>>> --- a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> >>>> +++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> >>>> @@ -2,7 +2,7 @@ SUMMARY = "Small collection of benchmarks for storage I/O"
> >>>> LICENSE = "GPLv2"
> >>>> LIC_FILES_CHKSUM = "file://COPYING;md5=b529aaa6a0c50f15d29f89609b5c22f3"
> >>>>
> >>>> -SRCREV = "79698f645bfb28d0d966484ddad3a1efb562246d"
> >>>> +SRCREV = "e2727f70ed79b5461689c062a4a66a87f1adb4ce"
> >>>> PV = "0.0+git${SRCPV}"
> >>>> SRC_URI = "git://github.com/Algodev-github/S.git;protocol=https;branch=master"
> >>>>
> >>>> @@ -21,7 +21,8 @@ do_install() {
> >>>>    install -m0755 ${S}/def_config_params.sh ${D}/opt/S-suite
> >>>> }
> >>>>
> >>>> -RDEPENDS_${PN} = "bash bc coreutils gawk g++ gcc fio libaio libaio-dev sysstat"
> >>>> +RDEPENDS_${PN} = "bash bc coreutils gawk g++ gcc fio libaio libaio-dev sysstat \
> >>>> +                 psmisc git"
> >>>
> >>> why these new rdeps
> >>
> >> psmisc is for killall, git is for ... git :)
> >
> > I think busybox provides killall too.
>
> Ok, I'll remove this dep.
>
> >>
> >> Some weeks ago, I bumped into this missing dependencies that made the
> >> automatic execution of a test fail on a system without either killall
> >> or git.
> >
> > OK. so I wonder if we dont have killall enabled in oe-core by default in
> > busybox ? or does it need ps-misc one specifically ?
> >
> > git is interesting, does it clone some sources during executing tests ?
> >
> In kernel-task benchmarks a mainline Linux is cloned.  But maybe such
> benchmarks do not make sense in oe.  Let me know, and I'll remove this
> dep too.

they are fine. We just need to understand that they are well meaning changes.

>
>
> Thanks,
> Paolo
>
> >>
> >> If these dependencies are certainly useless for oe, then I'll remove them.
> >>
> >> Thanks,
> >> Paolo
> >>
> >>>>
> >>>> FILES_${PN} = "/opt/S-suite/"
> >>>>
> >>>> --
> >>>> 2.16.1
> >>>>
> >>>> --
> >>>> _______________________________________________
> >>>> Openembedded-devel mailing list
> >>>> Openembedded-devel@lists.openembedded.org
> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
>

