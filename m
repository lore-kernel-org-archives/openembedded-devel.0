Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id B2C8174FCB
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Sep 2018 09:38:22 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id g33-v6so3242688wrd.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Sep 2018 02:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nj2/h1IWIXXUPqWEr1TkxcADekTRwWueunQf4+25lcY=;
	b=tZ9hV2ZAJd/BIsN+tT91pJqM5IWY2rbqQgYkpdIC9pKu6B1dO7djXWKkJww2wHLony
	za60DcQ0zYCvLW4rwx7PsoR7p9u07DllU0YHtoiMij/k9jZTOrqgk4103krxwTH9juoO
	lgQ4r5vl+Iuh4JDtw5aj1t1sR1vGidX1Ivlro++qaspiq/ItIGDX4fu189Db7UBdrgrr
	0ev+9UuNFE3lI86BolQHPTU5yuu+8q+keb1X8pBJdq4PCz4cT8aW/xVWnpHyUbZyAOtB
	smM4DfcR43WRXSiD21lnd+/nZK/59WlX4wA2ThaTMZQbPrqbx62O16K5ONMvm+Ut4WQO
	U1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nj2/h1IWIXXUPqWEr1TkxcADekTRwWueunQf4+25lcY=;
	b=G1GTjZpnZVfFG4GyCCkPmA6Ov2VqHR4HJ/3qesczdH2skYKfaiEcMahdMn4gAHQEm5
	1PeA2TfFz2ArkQvhPjfB3IiAX6WMCSigp8zS1AmgcZKdSMo0kAjrCKAOZCtV8vPOkgbO
	jLM6RTD7l9pgCnYkamtodK6UjiGPb3RgeQSFdu7ns/xZhI1FggbX13X6mctBr1nm9YLC
	FggSMcGQZOGw1U2ztZNA9LV3xnVt2+vFmRL6nR0nc8lhz1AVMQRICNe2A/NagA3MPEUS
	r+AXos10d6ylayKtfgLue4XYsi1P3H/J3/VXoFhka407yLiLpj9Nu+S7x7j7wC9udELc
	EyBg==
X-Gm-Message-State: APzg51Chxnzqne9oXcfS5k62N2Lf6n22k+Pz5WC1fZ1BNlLw2ajfH4N1
	XyRVFv63FB8ZGNMUa9phZhEPPFfZs78n0yWT8fM=
X-Google-Smtp-Source: ANB0VdbP9idcS9bpkPT7BmEaNLzJWqx2h/0vwstgrExz4o+bF3kyphtFnnbAie4KvuJnIWIvamXTkKauOMGaAdby/2M=
X-Received: by 2002:adf:bd90:: with SMTP id
	l16-v6mr22854767wrh.250.1536053903430; 
	Tue, 04 Sep 2018 02:38:23 -0700 (PDT)
MIME-Version: 1.0
References: <20180510063718.16913-1-andrew@aj.id.au>
	<1527594494.687641.1388974752.4113AC8F@webmail.messagingengine.com>
	<CAMKF1spm=GQQq90gu58BdrNtqPQx_fxnA01ar9Jmr4PbQnmttQ@mail.gmail.com>
In-Reply-To: <CAMKF1spm=GQQq90gu58BdrNtqPQx_fxnA01ar9Jmr4PbQnmttQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 4 Sep 2018 11:38:12 +0200
Message-ID: <CA+chaQcY0TXd5ZpsaV-pOn-zO+kMQ8=_2hK3OOKbOEF-CFWEBg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openbmc@lists.ozlabs.org,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH v2 1/3] meta-python: Add python-pyflame recipe
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
X-List-Received-Date: Tue, 04 Sep 2018 09:38:23 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

it also fails for aarch64:

| ../../git/src/ptrace.cc: In function 'user_regs_struct
pyflame::PtraceGetRegs(pid_t)':
| ../../git/src/ptrace.cc:127:14: error: 'PTRACE_GETREGS' was not declared
in this scope
|    if (ptrace(PTRACE_GETREGS, pid, 0, &regs)) {
|               ^~~~~~~~~~~~~~
| ../../git/src/ptrace.cc:127:14: note: suggested alternative:
'PTRACE_GETREGSET'
|    if (ptrace(PTRACE_GETREGS, pid, 0, &regs)) {
|               ^~~~~~~~~~~~~~
|               PTRACE_GETREGSET
| ../../git/src/ptrace.cc: In function 'void pyflame::PtraceSetRegs(pid_t,
user_regs_struct)':
| ../../git/src/ptrace.cc:136:14: error: 'PTRACE_SETREGS' was not declared
in this scope
|    if (ptrace(PTRACE_SETREGS, pid, 0, &regs)) {
|               ^~~~~~~~~~~~~~
| ../../git/src/ptrace.cc:136:14: note: suggested alternative:
'PTRACE_SETREGSET'
|    if (ptrace(PTRACE_SETREGS, pid, 0, &regs)) {
|               ^~~~~~~~~~~~~~
|               PTRACE_SETREGSET
| Makefile:524: recipe for target 'ptrace.o' failed
| make[2]: *** [ptrace.o] Error 1

I don't plan to use it, so I'm ok with aarch64 removal from compatible
archs if the fix turns to be complicated.

Cheers,

On Thu, May 31, 2018 at 6:49 PM Khem Raj <raj.khem@gmail.com> wrote:

> fails to build on qemumips
>
> | ../../git/src/ptrace.cc: In function 'user_regs_struct
> pyflame::PtraceGetRegs(pid_t)':
> | ../../git/src/ptrace.cc:125:41: error: return type 'user_regs_struct
> {aka struct user_regs_struct}' is incomplete
> |  user_regs_struct PtraceGetRegs(pid_t pid) {
> |                                          ^
> | ../../git/src/ptrace.cc:125:18: error: ambiguating new declaration
> of 'void pyflame::PtraceGetRegs(pid_t)'
> |  user_regs_struct PtraceGetRegs(pid_t pid) {
> |                   ^~~~~~~~~~~~~
> | In file included from ../../git/src/ptrace.cc:15:0:
> | ../../git/src/./ptrace.h:48:18: note: old declaration
> 'user_regs_struct pyflame::PtraceGetRegs(pid_t)'
> |  user_regs_struct PtraceGetRegs(pid_t pid);
> |                   ^~~~~~~~~~~~~
> | ../../git/src/ptrace.cc:126:20: error: aggregate 'user_regs_struct
> regs' has incomplete type and cannot be defined
> |    user_regs_struct regs;
> |                     ^~~~
> | ../../git/src/ptrace.cc: In function 'void
> pyflame::PtraceSetRegs(pid_t, user_regs_struct)':
> | ../../git/src/ptrace.cc:135:48: error: 'regs' has incomplete type
> |  void PtraceSetRegs(pid_t pid, user_regs_struct regs) {
> |                                                 ^~~~
> | In file included from ../../git/src/ptrace.cc:15:0:
> | ../../git/src/./ptrace.h:29:16: note: forward declaration of
> 'user_regs_struct {aka struct user_regs_struct}'
> |  typedef struct user_regs_struct user_regs_struct;
> |                 ^~~~~~~~~~~~~~~~
> | make[2]: *** [ptrace.o] Error 1
> | make[2]: *** Waiting for unfinished jobs....
> | make[2]: Leaving directory
>
> `/mnt/jenkins/workspace/OpenEmbedded/build/tmp/work/mips32r2-bec-linux/python-pyflame/1.6.6-r0/build/src'
>
> On Tue, May 29, 2018 at 4:48 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> > On Thu, 10 May 2018, at 16:07, Andrew Jeffery wrote:
> >> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> >
> > Ping - is there anything I need to revise for this patch or the
> following two?
> >
> > Cheers,
> >
> > Andrew
> >
> >> ---
> >>  meta-python/recipes-devtools/python/python-pyflame.inc      | 12
> ++++++++++++
> >>  meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb |  1 +
> >>  2 files changed, 13 insertions(+)
> >>  create mode 100644
> meta-python/recipes-devtools/python/python-pyflame.inc
> >>  create mode 100644 meta-python/recipes-devtools/python/
> python-pyflame_1.6.6.bb
> >>
> >> diff --git a/meta-python/recipes-devtools/python/python-pyflame.inc b/
> >> meta-python/recipes-devtools/python/python-pyflame.inc
> >> new file mode 100644
> >> index 000000000000..3b84a7e8f8e3
> >> --- /dev/null
> >> +++ b/meta-python/recipes-devtools/python/python-pyflame.inc
> >> @@ -0,0 +1,12 @@
> >> +SUMMARY = "Pyflame: A Ptracing Profiler For Python"
> >> +HOMEPAGE = "https://github.com/uber/pyflame"
> >> +SECTION = "devel/python"
> >> +LICENSE = "Apache-2.0"
> >> +LIC_FILES_CHKSUM = "file://${S}/
> >> LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
> >> +DEPENDS = "python"
> >> +
> >> +SRC_URI = "git://github.com/uber/pyflame.git;protocol=https;tag=v${PV}
> <http://github.com/uber/pyflame.git;protocol=https;tag=v$%7BPV%7D>"
> >> +S = "${WORKDIR}/git"
> >> +
> >> +inherit pkgconfig autotools
> >> +
> >> diff --git a/meta-python/recipes-devtools/python/
> python-pyflame_1.6.6.bb
> >> b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
> >> new file mode 100644
> >> index 000000000000..96f03305f883
> >> --- /dev/null
> >> +++ b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
> >> @@ -0,0 +1 @@
> >> +require python-pyflame.inc
> >> --
> >> 2.14.1
> >>
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

