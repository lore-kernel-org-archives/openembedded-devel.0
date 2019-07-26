Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 544DB7F1CE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jul 2019 08:59:49 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id 4so17526398pld.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jul 2019 01:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=RfkVVz9GmlmJ9tCZPBHF4u+4hI6ZU8EpNdEGSFByj/o=;
	b=RGRTlPBYysqqVkW89vCApldzAlDm26/GYPqbAKVAcHoFvQWqH8+2MEz+qBWEEIVdaD
	WlhrNli/3eaecKNEjt7TD0IZdA1FgolOG+4gS1JS697UqlChMQezwGaq4JO+YUVIRSGa
	rnVDTCjYxrJRAzrgOIZ3ckgeaq86T5tPBwCb0xg0g0MCMjtOQ8hgNu0vgHxjBF7vhyvl
	FdsLNGEF+YU3htBhsDA4YTif7hbDHFl+JVY2wHh5sD8tZS1mF6r4L64FEjhL3sM7hV9u
	yx17tF7mqF3u5X0a7vo4IGDnoLWH+HCHVVCsgLTXujXqJSets9U5uiOMnnxl4xCQ04AU
	E9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=RfkVVz9GmlmJ9tCZPBHF4u+4hI6ZU8EpNdEGSFByj/o=;
	b=P0a8DOzecgS3vHxYqbta5EBH4brouc0x485tMIbowu3BzoKDF3i7DN8qYCTogYDj8i
	76ZHrQ2GRO5nNqD2Fc8dj/R5M131ffJqiQwLWDlvigJ69HNgyqUbMbIeSmtBLU1ULck6
	zhdEpEyrTYk5j8kwWZ2F+F3vOKb5gXNOe6454YWUYlCqwZPMCV/KZ6Bxu8Iunz/w5Usd
	G1xj80IPs1R2XA0XxPK7P4FbJ7fbwpFlW2uch9fihFzdfdueWwdgc7e0LVVHjYEIvG8n
	M102s935RhnVJU9XxFsRS5cS0nVdPvbsvzIc47q8ytRX40gbAudaPgLQOGAviBXvVtY/
	gt+Q==
X-Gm-Message-State: APjAAAU72j4BDufw+ZZ63LRmux0wl5aIJmtgme7cZHq4RdvuJv2sEcaY
	mPH36BV06qjvl3RvQEoxDra01U8/auo=
X-Google-Smtp-Source: APXvYqybGnCHi1SlaHWfODff1eAtvHh4m8O5GdeSGXVZrAAANy6oAmEQUWujtRRlSdWNUeRiIWrejQ==
X-Received: by 2002:a17:902:4124:: with SMTP id
	e33mr88593455pld.6.1564131590196; 
	Fri, 26 Jul 2019 01:59:50 -0700 (PDT)
Received: from [192.168.99.50] ([92.39.202.78])
	by smtp.gmail.com with ESMTPSA id
	v184sm52036688pfb.82.2019.07.26.01.59.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Jul 2019 01:59:49 -0700 (PDT)
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
	"Yu, Mingli" <mingli.yu@windriver.com>
References: <1564038385-372982-1-git-send-email-mingli.yu@windriver.com>
	<CADkTA4N3zMSfjBe=eOvvbrArfXEenwpYZcJGgwqt2Mhrr-1tGw@mail.gmail.com>
	<5D3A65EA.9090601@windriver.com>
	<CADkTA4OS653HqdcG8nm=VqmUQ85m-tPniauwUD8a=gZZY-3whQ@mail.gmail.com>
	<5D3A6DB3.9080207@windriver.com>
	<CADkTA4NOAUebSDV2dUZzhoKS2pQefZentgwrXeaEOT3W8qxMzg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <cdafa962-f7b1-bf15-c3bf-fa10bb76d160@gmail.com>
Date: Fri, 26 Jul 2019 01:59:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4NOAUebSDV2dUZzhoKS2pQefZentgwrXeaEOT3W8qxMzg@mail.gmail.com>
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
X-List-Received-Date: Fri, 26 Jul 2019 08:59:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 7/25/19 8:23 PM, Bruce Ashfield wrote:
> On Thu, Jul 25, 2019 at 11:01 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>
>>
>> On 2019年07月26日 10:46, Bruce Ashfield wrote:
>>>
>>> On Thu, Jul 25, 2019 at 10:28 PM Yu, Mingli <mingli.yu@windriver.com
>>> <mailto:mingli.yu@windriver.com>> wrote:
>>>
>>>
>>>
>>>     On 2019年07月25日 21:45, Bruce Ashfield wrote:
>>>      > On Thu, Jul 25, 2019 at 3:06 AM <mingli.yu@windriver.com
>>>     <mailto:mingli.yu@windriver.com>> wrote:
>>>      >>
>>>      >> From: Mingli Yu <Mingli.Yu@windriver.com
>>>     <mailto:Mingli.Yu@windriver.com>>
>>>      >
>>>      > Can you share some details as to why this should be pulled from
>>>      > meta-security into a different repo ?
>>>
>>>     Considering there is also some security related recipe under
>>>     meta-oe/recipes-security/, I think it's not strange to add a new one
>>>     libseccomp and libseccomp also provides a basic common filtering
>>>     mechanism.
>>>
>>>
>>> .. but it is literally churn for the sake of churn.
>>>
>>> Meaning, that isn't a great reason to move something. If Armin wanted to
>>> put the recipe in meta-oe, he would have done it himself.
>> ^_^, I noticed Armin did try to do this in this thread "[oe]
>> [meta-oe][PATCH 1/2] libseccomp: move lib from meta-security to meta-oe"
>> in Jun 1, 2018.
> In that case, follow up to that thread so folks can remember why it
> didn't happen, or check to see if it was simply forgotten. Putting the
> maintainers on the cc' from the start of something like this helps
> immensely.
>
> But I see you added Armin to this thread, so that should be enough.

I am fine if we move the recipe. The issue was Khem didn't want the
"bash" dependency and I never followed up to clean that up.

I would have responded sooner but this is the first time I have reliable
Internet.

- armin
>
> Bruce
>
>>>
>>>     Meanwhile, the below yocto compliance check error disappears once we
>>>     move libseccomp from meta-security to meta-oe.
>>>     ERROR: Nothing PROVIDES 'libseccomp' (but
>>>     /buildarea/layers/meta-virtualization/recipes-containers/cri-o/cri-o_git.bb
>>>     <http://cri-o_git.bb>
>>>     DEPENDS on or otherwise requires it).
>>>     Close matches:
>>>     libcomps
>>>     ERROR: Required build target 'meta-world-pkgdata' has no buildable
>>>     providers.
>>>
>>>     Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
>>>     'cri-o', 'libseccomp']
>>>
>>>
>>> Also not a valid reason. We've just fixed meta-virtualization, so
>>> there's no need to shuffle something like this around, just to keep
>>> another layers compliance check working.
>>>
>>> Bruce
>>>
>>>
>>>     Thanks,
>>>
>>>      >
>>>      > It seems to fit the mandate of meta-security quite nicely ;)
>>>      >
>>>      > Is there some sort of dependency issue, or other technical problem
>>>      > that is causing a problem ?
>>>      >
>>>      > Bruce
>>>      >
>>>      >>
>>>      >> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com
>>>     <mailto:Mingli.Yu@windriver.com>>
>>>      >> ---
>>>      >>   .../recipes-security/libseccomp/files/run-ptest    |  4 +++
>>>      >>   .../libseccomp/libseccomp_2.4.1.bb
>>>     <http://libseccomp_2.4.1.bb>                 | 41 ++++++++++++++++++++++
>>>      >>   2 files changed, 45 insertions(+)
>>>      >>   create mode 100644
>>>     meta-oe/recipes-security/libseccomp/files/run-ptest
>>>      >>   create mode 100644
>>>     meta-oe/recipes-security/libseccomp/libseccomp_2.4.1.bb
>>>     <http://libseccomp_2.4.1.bb>
>>>      >>
>>>      >> diff --git a/meta-oe/recipes-security/libseccomp/files/run-ptest
>>>     b/meta-oe/recipes-security/libseccomp/files/run-ptest
>>>      >> new file mode 100644
>>>      >> index 0000000..54b4a63
>>>      >> --- /dev/null
>>>      >> +++ b/meta-oe/recipes-security/libseccomp/files/run-ptest
>>>      >> @@ -0,0 +1,4 @@
>>>      >> +#!/bin/sh
>>>      >> +
>>>      >> +cd tests
>>>      >> +./regression -a
>>>      >> diff --git
>>>     a/meta-oe/recipes-security/libseccomp/libseccomp_2.4.1.bb
>>>     <http://libseccomp_2.4.1.bb>
>>>     b/meta-oe/recipes-security/libseccomp/libseccomp_2.4.1.bb
>>>     <http://libseccomp_2.4.1.bb>
>>>      >> new file mode 100644
>>>      >> index 0000000..dba1be5
>>>      >> --- /dev/null
>>>      >> +++ b/meta-oe/recipes-security/libseccomp/libseccomp_2.4.1.bb
>>>     <http://libseccomp_2.4.1.bb>
>>>      >> @@ -0,0 +1,41 @@
>>>      >> +SUMMARY = "interface to seccomp filtering mechanism"
>>>      >> +DESCRIPTION = "The libseccomp library provides and easy to use,
>>>     platform independent,interface to the Linux Kernel's syscall
>>>     filtering mechanism: seccomp."
>>>      >> +SECTION = "security"
>>>      >> +LICENSE = "LGPL-2.1"
>>>      >> +LIC_FILES_CHKSUM =
>>>     "file://LICENSE;beginline=0;endline=1;md5=8eac08d22113880357ceb8e7c37f989f"
>>>      >> +
>>>      >> +SRCREV = "fb43972ea1aab24f2a70193fb7445c2674f594e3"
>>>      >> +
>>>      >> +SRC_URI =
>>>     "git://github.com/seccomp/libseccomp.git;branch=release-2.4
>>>     <http://github.com/seccomp/libseccomp.git;branch=release-2.4> \
>>>      >> +           file://run-ptest \
>>>      >> +"
>>>      >> +
>>>      >> +S = "${WORKDIR}/git"
>>>      >> +
>>>      >> +inherit autotools-brokensep pkgconfig ptest
>>>      >> +
>>>      >> +PACKAGECONFIG ??= ""
>>>      >> +PACKAGECONFIG[python] = "--enable-python, --disable-python, python"
>>>      >> +
>>>      >> +do_compile_ptest() {
>>>      >> +    oe_runmake -C tests check-build
>>>      >> +}
>>>      >> +
>>>      >> +do_install_ptest() {
>>>      >> +    install -d ${D}${PTEST_PATH}/tests
>>>      >> +    install -d ${D}${PTEST_PATH}/tools
>>>      >> +    for file in $(find tests/* -executable -type f); do
>>>      >> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
>>>      >> +    done
>>>      >> +    for file in $(find tests/*.tests -type f); do
>>>      >> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
>>>      >> +    done
>>>      >> +    for file in $(find tools/* -executable -type f); do
>>>      >> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tools
>>>      >> +    done
>>>      >> +}
>>>      >> +
>>>      >> +FILES_${PN} = "${bindir} ${libdir}/${BPN}.so*"
>>>      >> +FILES_${PN}-dbg += "${libdir}/${PN}/tests/.debug/*
>>>     ${libdir}/${PN}/tools/.debug"
>>>      >> +
>>>      >> +RDEPENDS_${PN}-ptest = "bash"
>>>      >> --
>>>      >> 2.7.4
>>>      >>
>>>      >> --
>>>      >> _______________________________________________
>>>      >> Openembedded-devel mailing list
>>>      >> Openembedded-devel@lists.openembedded.org
>>>     <mailto:Openembedded-devel@lists.openembedded.org>
>>>      >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>      >
>>>      >
>>>      >
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


