Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3163D6018C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jun 2016 13:04:52 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id l81so2775856qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jun 2016 06:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=9Dv9V9E4h1VHyf2JwcGagmFvMAuPej2a8cuf3flguYo=;
	b=FkV+HA0t0oH3CcYeWaeBNiOa0AtpvgcuvZBjnpcVYqwgDxX476MdVguwIM6lb88YBY
	5celOCBm/xC4IzJRxiXuvSRk0wUsdiqDH5RntC2evay9BwE9mxAhh2T1aJzlJUsXMXbR
	/7QUFqvz9F5aEGDRRXC7RDCjaZOtFi/nSFzGj6L90luIhHQe7TozQJZNM8W7QUH6jG9O
	bfi8RPDRz6dauY7+0ADwEvt4rAZrihdPM+2PxIgiP8KSv0r3tkRXZeX50rpKegGSeeSS
	xhhvd09d4+r0/3Czfkjptr8WVUcEURVohPHrDxq+IwE57lktUKYZbXdPIpkJXWkU0MBd
	8RAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=9Dv9V9E4h1VHyf2JwcGagmFvMAuPej2a8cuf3flguYo=;
	b=apIbo5JDQyeiNlwj9dOFGGz1G+fK8nm8UY8IM+zvasLh+f/NhK5LP6frqHUrJvCv3+
	jlRhOKVifp3rPAj/PCivw/jf8SsEs7tZGTBskFhHyqMiwXLQyG99LhfXJRfsq8pEik8A
	0xdS5fFhEQIM5Dait8KKIe5YgsnvlAm1GlkafZ7IhAzS8WXAjm9gVOwhE1NAnISe8QpE
	GM2Q3zw8mjjmzgXd+uFzBBZfSfzbUmHGhbbxaRuGCIRACdcbKJ62m96mZAP576LR197d
	3hYwi1rqt6XlDGGvdgRiASHivP/y8M9laD1oIJ5awJDHUPmxWyqSpqa95hHctSclfvdV
	FJnQ==
X-Gm-Message-State: ALyK8tIPiBH8fDv6S595nzQlmloLGx26wvalmzn3Y2v5/ZokwxHe4UhQfoJcamQSncbkAcntjeoFhXCtxG/aHw==
MIME-Version: 1.0
X-Received: by 10.55.39.141 with SMTP id n135mr30535109qkn.149.1466514293446; 
	Tue, 21 Jun 2016 06:04:53 -0700 (PDT)
Received: by 10.55.8.133 with HTTP; Tue, 21 Jun 2016 06:04:53 -0700 (PDT)
Received: by 10.55.8.133 with HTTP; Tue, 21 Jun 2016 06:04:53 -0700 (PDT)
In-Reply-To: <CAP0W-Rk=55MPUs2L19W27oERVYqrk5Q+PEEaDW372BF6qa7HfA@mail.gmail.com>
References: <1466415303-25975-1-git-send-email-koen.kooi@linaro.org>
	<CAMKF1sqc-6OpVNMb7m9FRg2tPtj32r9f4itzo4SSa4f_zh7BwA@mail.gmail.com>
	<CAP0W-Rk=55MPUs2L19W27oERVYqrk5Q+PEEaDW372BF6qa7HfA@mail.gmail.com>
Date: Tue, 21 Jun 2016 06:04:53 -0700
Message-ID: <CAMKF1sqbTfpfc7wCQfJZOcXz7WyxAaQsZHp=g1zz7qY5Mud-+g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Koen Kooi <koen.kooi@linaro.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] fwts: update to latest git and fix build with gcc 5
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
X-List-Received-Date: Tue, 21 Jun 2016 13:04:53 -0000
Content-Type: text/plain; charset=UTF-8

On Jun 20, 2016 10:04 PM, "Koen Kooi" <koen.kooi@linaro.org> wrote:
>
> On 20 June 2016 at 18:07, Khem Raj <raj.khem@gmail.com> wrote:
> > On Mon, Jun 20, 2016 at 2:35 AM, Koen Kooi <koen.kooi@linaro.org> wrote:
> >> License checksum change due to 2014->2016 changes. Fix build with gcc
5 by removing -Wno-werror:
> >>
> >>         cc1: error: -Werror=misleading-indentation: no option
-Wmisleading-indentation
> >
> > This would then break build with gcc6 unless the indentations are
> > fixed in new version. Can you confirm that
> > it works with gcc6 equally well ?
>
> ATM I can't, since I don't have a gcc6 config setup. But this is a
> general problem: How can we turn off that indentation warning for gcc6
> without breaking gcc5?

One way is to fix the code
>
> >
> >>
> >> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> >> ---
> >>  meta-oe/recipes-test/fwts/fwts_git.bb | 10 ++++++----
> >>  1 file changed, 6 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/meta-oe/recipes-test/fwts/fwts_git.bb
b/meta-oe/recipes-test/fwts/fwts_git.bb
> >> index 197fe20..2868034 100644
> >> --- a/meta-oe/recipes-test/fwts/fwts_git.bb
> >> +++ b/meta-oe/recipes-test/fwts/fwts_git.bb
> >> @@ -3,11 +3,11 @@ DESCRIPTION = "The tool fwts comprises of over fifty
tests that are designed to
> >>  HOMEPAGE = "https://wiki.ubuntu.com/Kernel/Reference/fwts"
> >>
> >>  LICENSE = "GPLv2+"
> >> -LIC_FILES_CHKSUM =
"file://src/main.c;beginline=1;endline=16;md5=deb8af5388e838d133eaa036f4d1496f"
> >> +LIC_FILES_CHKSUM =
"file://src/main.c;beginline=1;endline=16;md5=31da590f3e9f3bd34dcdb9e4db568519"
> >>
> >> -PV = "14.12.00"
> >> +PV = "16.05.01"
> >>
> >> -SRCREV = "efc18d16294f492b7f72bba64344b2eed50e6a69"
> >> +SRCREV = "4d9500d1fb119e2136e07c0cc2844f51b5e5b97a"
> >>  SRC_URI = "git://kernel.ubuntu.com/hwe/fwts.git"
> >>
> >>  S = "${WORKDIR}/git"
> >> @@ -16,7 +16,9 @@ DEPENDS = "libpcre json-c glib-2.0"
> >>
> >>  inherit autotools-brokensep
> >>
> >> -CFLAGS += "-I${STAGING_INCDIR}/json-c
-Wno-error=misleading-indentation"
> >> +CFLAGS += "-I${STAGING_INCDIR}/json-c"
> >> +
> >> +RDEPENDS_${PN} += "dtc"
> >>
> >>  FILES_${PN} += "${libdir}/fwts/lib*${SOLIBS}"
> >>  FILES_${PN}-dev += "${libdir}/fwts/lib*${SOLIBSDEV}
${libdir}/fwts/lib*.la"
> >> --
> >> 2.4.3
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>
> --
> Koen Kooi
>
> Builds and Baselines | Release Manager
> Linaro.org | Open source software for ARM SoCs

