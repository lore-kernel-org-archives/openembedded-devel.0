Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F02F37F1CF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jul 2019 08:48:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6Q8m9sE005792
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 Jul 2019 01:48:09 -0700 (PDT)
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Fri, 26 Jul 2019 01:48:08 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1564038385-372982-1-git-send-email-mingli.yu@windriver.com>
	<CADkTA4N3zMSfjBe=eOvvbrArfXEenwpYZcJGgwqt2Mhrr-1tGw@mail.gmail.com>
	<5D3A65EA.9090601@windriver.com>
	<CADkTA4OS653HqdcG8nm=VqmUQ85m-tPniauwUD8a=gZZY-3whQ@mail.gmail.com>
	<5D3A6DB3.9080207@windriver.com>
	<CADkTA4NOAUebSDV2dUZzhoKS2pQefZentgwrXeaEOT3W8qxMzg@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5D3ABEF9.5090907@windriver.com>
Date: Fri, 26 Jul 2019 16:51:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4NOAUebSDV2dUZzhoKS2pQefZentgwrXeaEOT3W8qxMzg@mail.gmail.com>
X-Originating-IP: [128.224.162.170]
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libseccomp: import from meta-security
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
X-List-Received-Date: Fri, 26 Jul 2019 08:48:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年07月26日 11:23, Bruce Ashfield wrote:
> On Thu, Jul 25, 2019 at 11:01 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>
>>
>>
>> On 2019年07月26日 10:46, Bruce Ashfield wrote:
>>>
>>>
>>> On Thu, Jul 25, 2019 at 10:28 PM Yu, Mingli <mingli.yu@windriver.com
>>> <mailto:mingli.yu@windriver.com>> wrote:
>>>
>>>
>>>
>>>      On 2019年07月25日 21:45, Bruce Ashfield wrote:
>>>       > On Thu, Jul 25, 2019 at 3:06 AM <mingli.yu@windriver.com
>>>      <mailto:mingli.yu@windriver.com>> wrote:
>>>       >>
>>>       >> From: Mingli Yu <Mingli.Yu@windriver.com
>>>      <mailto:Mingli.Yu@windriver.com>>
>>>       >
>>>       > Can you share some details as to why this should be pulled from
>>>       > meta-security into a different repo ?
>>>
>>>      Considering there is also some security related recipe under
>>>      meta-oe/recipes-security/, I think it's not strange to add a new one
>>>      libseccomp and libseccomp also provides a basic common filtering
>>>      mechanism.
>>>
>>>
>>> .. but it is literally churn for the sake of churn.
>>>
>>> Meaning, that isn't a great reason to move something. If Armin wanted to
>>> put the recipe in meta-oe, he would have done it himself.
>>
>> ^_^, I noticed Armin did try to do this in this thread "[oe]
>> [meta-oe][PATCH 1/2] libseccomp: move lib from meta-security to meta-oe"
>> in Jun 1, 2018.
>
> In that case, follow up to that thread so folks can remember why it
> didn't happen, or check to see if it was simply forgotten. Putting the
> maintainers on the cc' from the start of something like this helps
> immensely.
>
> But I see you added Armin to this thread, so that should be enough.

Hi Bruce,

I'm okay to keep libseccomp under meta-security and can consider moving 
it to meta-oe if anyone thinks it is worth.

>
> Bruce
>
>>
>>>
>>>
>>>      Meanwhile, the below yocto compliance check error disappears once we
>>>      move libseccomp from meta-security to meta-oe.
>>>      ERROR: Nothing PROVIDES 'libseccomp' (but
>>>      /buildarea/layers/meta-virtualization/recipes-containers/cri-o/cri-o_git.bb
>>>      <http://cri-o_git.bb>
>>>      DEPENDS on or otherwise requires it).
>>>      Close matches:
>>>      libcomps
>>>      ERROR: Required build target 'meta-world-pkgdata' has no buildable
>>>      providers.
>>>
>>>      Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
>>>      'cri-o', 'libseccomp']

I will find other solution to solve the above error related to yocto 
compliance check.

Thanks,

>>>
>>>
>>> Also not a valid reason. We've just fixed meta-virtualization, so
>>> there's no need to shuffle something like this around, just to keep
>>> another layers compliance check working.
>>>
>>> Bruce
>>>
>>>
>>>      Thanks,
>>>
>>>       >
>>>       > It seems to fit the mandate of meta-security quite nicely ;)
>>>       >
>>>       > Is there some sort of dependency issue, or other technical problem
>>>       > that is causing a problem ?
>>>       >
>>>       > Bruce
>>>       >
>>>       >>
>>>       >> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com
>>>      <mailto:Mingli.Yu@windriver.com>>
>>>       >> ---
>>>       >>   .../recipes-security/libseccomp/files/run-ptest    |  4 +++
>>>       >>   .../libseccomp/libseccomp_2.4.1.bb
>>>      <http://libseccomp_2.4.1.bb>                 | 41 ++++++++++++++++++++++
>>>       >>   2 files changed, 45 insertions(+)
>>>       >>   create mode 100644
>>>      meta-oe/recipes-security/libseccomp/files/run-ptest
>>>       >>   create mode 100644
>>>      meta-oe/recipes-security/libseccomp/libseccomp_2.4.1.bb
>>>      <http://libseccomp_2.4.1.bb>
>>>       >>
>>>       >> diff --git a/meta-oe/recipes-security/libseccomp/files/run-ptest
>>>      b/meta-oe/recipes-security/libseccomp/files/run-ptest
>>>       >> new file mode 100644
>>>       >> index 0000000..54b4a63
>>>       >> --- /dev/null
>>>       >> +++ b/meta-oe/recipes-security/libseccomp/files/run-ptest
>>>       >> @@ -0,0 +1,4 @@
>>>       >> +#!/bin/sh
>>>       >> +
>>>       >> +cd tests
>>>       >> +./regression -a
>>>       >> diff --git
>>>      a/meta-oe/recipes-security/libseccomp/libseccomp_2.4.1.bb
>>>      <http://libseccomp_2.4.1.bb>
>>>      b/meta-oe/recipes-security/libseccomp/libseccomp_2.4.1.bb
>>>      <http://libseccomp_2.4.1.bb>
>>>       >> new file mode 100644
>>>       >> index 0000000..dba1be5
>>>       >> --- /dev/null
>>>       >> +++ b/meta-oe/recipes-security/libseccomp/libseccomp_2.4.1.bb
>>>      <http://libseccomp_2.4.1.bb>
>>>       >> @@ -0,0 +1,41 @@
>>>       >> +SUMMARY = "interface to seccomp filtering mechanism"
>>>       >> +DESCRIPTION = "The libseccomp library provides and easy to use,
>>>      platform independent,interface to the Linux Kernel's syscall
>>>      filtering mechanism: seccomp."
>>>       >> +SECTION = "security"
>>>       >> +LICENSE = "LGPL-2.1"
>>>       >> +LIC_FILES_CHKSUM =
>>>      "file://LICENSE;beginline=0;endline=1;md5=8eac08d22113880357ceb8e7c37f989f"
>>>       >> +
>>>       >> +SRCREV = "fb43972ea1aab24f2a70193fb7445c2674f594e3"
>>>       >> +
>>>       >> +SRC_URI =
>>>      "git://github.com/seccomp/libseccomp.git;branch=release-2.4
>>>      <http://github.com/seccomp/libseccomp.git;branch=release-2.4> \
>>>       >> +           file://run-ptest \
>>>       >> +"
>>>       >> +
>>>       >> +S = "${WORKDIR}/git"
>>>       >> +
>>>       >> +inherit autotools-brokensep pkgconfig ptest
>>>       >> +
>>>       >> +PACKAGECONFIG ??= ""
>>>       >> +PACKAGECONFIG[python] = "--enable-python, --disable-python, python"
>>>       >> +
>>>       >> +do_compile_ptest() {
>>>       >> +    oe_runmake -C tests check-build
>>>       >> +}
>>>       >> +
>>>       >> +do_install_ptest() {
>>>       >> +    install -d ${D}${PTEST_PATH}/tests
>>>       >> +    install -d ${D}${PTEST_PATH}/tools
>>>       >> +    for file in $(find tests/* -executable -type f); do
>>>       >> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
>>>       >> +    done
>>>       >> +    for file in $(find tests/*.tests -type f); do
>>>       >> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
>>>       >> +    done
>>>       >> +    for file in $(find tools/* -executable -type f); do
>>>       >> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tools
>>>       >> +    done
>>>       >> +}
>>>       >> +
>>>       >> +FILES_${PN} = "${bindir} ${libdir}/${BPN}.so*"
>>>       >> +FILES_${PN}-dbg += "${libdir}/${PN}/tests/.debug/*
>>>      ${libdir}/${PN}/tools/.debug"
>>>       >> +
>>>       >> +RDEPENDS_${PN}-ptest = "bash"
>>>       >> --
>>>       >> 2.7.4
>>>       >>
>>>       >> --
>>>       >> _______________________________________________
>>>       >> Openembedded-devel mailing list
>>>       >> Openembedded-devel@lists.openembedded.org
>>>      <mailto:Openembedded-devel@lists.openembedded.org>
>>>       >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>       >
>>>       >
>>>       >
>>>
>>>
>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>
>
>
>

