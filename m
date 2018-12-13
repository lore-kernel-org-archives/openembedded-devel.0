Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
	[209.85.222.172])
	by mail.openembedded.org (Postfix) with ESMTP id 06E0A6D470
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2018 17:11:27 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id y16so1552128qki.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2018 09:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Vr3IuXJnTKczLs2ID3rw06cqXUmrDiAyPDL9oLF2DWI=;
	b=i8xb7xttOwqQ55A3fM6olsrKSkastWpj6P5veFL74W58W/PQo/TnsCZOvidlzJQyoC
	GlGsKXS2mBY0TS4wMsF+i6ENdDsYtLEzT6TMIf2sMMChD8g/oxVLSRMvu3WyZL6UKw97
	ruldYo51JvQjX/vSH1E1Pw23Gy/qbNyHlyouNYpzWE4J7eDqSU8X7wuPPEpd+HTRZ9Ps
	Lw6euFZ8O+yPWVOyRgZ6QBgpFYc2tk2Xg+A3wTqIi8m8g7n72by2Qeq52pqY7F4xVOGw
	HaivFLhTvZyjWjb1GpwgGSjrKDFSjc1eCZ1gOM94qjGyBZkATkZ9m5L+1bazVpxXX4xP
	AkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Vr3IuXJnTKczLs2ID3rw06cqXUmrDiAyPDL9oLF2DWI=;
	b=XX29yEJYm/ThR9F4sgM+5n+eDFdEpMEKRBogNS7551NlFHYeAAU6FVpL7Emr7NBJXW
	zn2V487lxBAcerSSJk6CafRmB1c4RtzXGSZ9j0kHgHVWfriUr2TsqwGWUBF8DAOz1ppl
	9QJhZfXwADL1sCtEZxQOxwWhfo8DFKzW5Nlf/9r23CSbm+1cuWvFooArI30KR2eXr7Cb
	BMUzBCiFXE5RFAVQnCQHJvUhXro+i4jVQNeKvgX8p+NURp9Jj6CWf0biZaKRr8XGf0dS
	+Ci24mSY1P2eXP4C/Tb2Om7XaGgQ+fpz8ViJtSbyUKJnD2GSC0QohviiP3b71z9jn+JA
	zbPw==
X-Gm-Message-State: AA+aEWbKNMQR+HAIa8ubmvxQuhjAxmYghoQC4wgBMNZX7YkIgnOhbjh4
	iCqvau4JiEDYROEULE9Fk4108MSIlC37iFLRONQ=
X-Google-Smtp-Source: AFSGD/W7ugygVhJZbapyEG+tVgCNtk8FlpIDlPEitLSRcbnc1cWBnrTEqR9XSJKd0+E45QvqN8Qh2CSq6LM9esCrtfM=
X-Received: by 2002:a37:4c41:: with SMTP id z62mr22570840qka.206.1544721088760;
	Thu, 13 Dec 2018 09:11:28 -0800 (PST)
MIME-Version: 1.0
References: <20181213151533.13730-1-paolo.valente@linaro.org>
	<CAMKF1srK53HOyMG4+773eELKOigsqHwK0-bMkQnZagwR1gYssw@mail.gmail.com>
	<6C5A8DD4-110A-43D6-9976-0B429273AB26@linaro.org>
In-Reply-To: <6C5A8DD4-110A-43D6-9976-0B429273AB26@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Dec 2018 09:11:02 -0800
Message-ID: <CAMKF1sqpeovnSSpswY4s2ZzZfE15tQoVhdu4m6rjuDkgP7ODfw@mail.gmail.com>
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
X-List-Received-Date: Thu, 13 Dec 2018 17:11:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 13, 2018 at 7:33 AM Paolo Valente <paolo.valente@linaro.org> wrote:
>
>
>
> > Il giorno 13 dic 2018, alle ore 16:27, Khem Raj <raj.khem@gmail.com> ha scritto:
> >
> > On Thu, Dec 13, 2018 at 7:16 AM Paolo Valente <paolo.valente@linaro.org> wrote:
> >>
> >> Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
> >> ---
> >> meta-oe/recipes-benchmark/s-suite/s-suite_git.bb | 5 +++--
> >> 1 file changed, 3 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> >> index 77d172814..166f3000a 100644
> >> --- a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> >> +++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> >> @@ -2,7 +2,7 @@ SUMMARY = "Small collection of benchmarks for storage I/O"
> >> LICENSE = "GPLv2"
> >> LIC_FILES_CHKSUM = "file://COPYING;md5=b529aaa6a0c50f15d29f89609b5c22f3"
> >>
> >> -SRCREV = "79698f645bfb28d0d966484ddad3a1efb562246d"
> >> +SRCREV = "e2727f70ed79b5461689c062a4a66a87f1adb4ce"
> >> PV = "0.0+git${SRCPV}"
> >> SRC_URI = "git://github.com/Algodev-github/S.git;protocol=https;branch=master"
> >>
> >> @@ -21,7 +21,8 @@ do_install() {
> >>     install -m0755 ${S}/def_config_params.sh ${D}/opt/S-suite
> >> }
> >>
> >> -RDEPENDS_${PN} = "bash bc coreutils gawk g++ gcc fio libaio libaio-dev sysstat"
> >> +RDEPENDS_${PN} = "bash bc coreutils gawk g++ gcc fio libaio libaio-dev sysstat \
> >> +                 psmisc git"
> >
> > why these new rdeps
>
> psmisc is for killall, git is for ... git :)

I think busybox provides killall too.
>
> Some weeks ago, I bumped into this missing dependencies that made the
> automatic execution of a test fail on a system without either killall
> or git.

OK. so I wonder if we dont have killall enabled in oe-core by default in
busybox ? or does it need ps-misc one specifically ?

git is interesting, does it clone some sources during executing tests ?

>
> If these dependencies are certainly useless for oe, then I'll remove them.
>
> Thanks,
> Paolo
>
> >>
> >> FILES_${PN} = "/opt/S-suite/"
> >>
> >> --
> >> 2.16.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

