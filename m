Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 20CC1731AF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2016 04:51:22 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id v6so6298835vkb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 21:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=r8f9F+ra3BNu5nIqRhfdrvc8KN7QlzlDxPa5rGhVem8=;
	b=lPIkRxU17+yF6cg+6CyLzkGpNwN1x2EKWncYIvD61yH5lzlFawLjReiF0PK72UqkIo
	CyvIk0csb+Onma6E+kzA+UGi5nqTxmVC0r9qngH78oUoqHsNos3Zyh89DlomoyPfUerv
	xIqeAcYfyo4xTCvqQ74LEhHltgF7P9fGBRQaZSVKmNzgxJUYW6SPKOa3qCSDAYZt3PwW
	hXLPQIwvGRb1JpUiafqHkzwKiuMEZzLM7DCgA+8PjmLsWw/QVvDL/xUB1W2kdCX0o62A
	iTCB18eE1Kg3vupRcbxiKDGY4JsBWMnlVgDLgWqSgKAHg+Ybl7CQSP6NA3fOdZLr9Wif
	l4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=r8f9F+ra3BNu5nIqRhfdrvc8KN7QlzlDxPa5rGhVem8=;
	b=cXKVUSfPJixfTDy/FiZZrGEWmDIYatW2qRryBd43LqDSammfyZhWBoNZ5/YoE79Qfl
	tYBRcgZfcX7TE9FIXyc82RVC/2C3DARcZKgBd8FkYCgj3xPx5QF9XrCh3kRudWdDqMP0
	TUknOLwmG8xGvmjgFeWo3NebbAtIgqbt7s3C+D0i9I+usD9RS6y6s2AP4kZI63WJu1Q/
	v/3qI4FzgXqLG/SG3qyH70UJVhYztYaZE5cpyfwxnLT5ere/8bhkMaUGsm+uw3hS6Pk8
	s/mQWZTv1lbWYGdOlUXHbmnv9E1Lg/eP0gkwj4tmRYdZ7JxdgrQhsz/aTDLGRXmt22wB
	j9UA==
X-Gm-Message-State: ALyK8tJTR+1J3pA60CCc1BjDcpUG9lyFERLBhgJlCM6Sixu00VsZannfkASGO+ZqIfu0ZGlCfYGiqBU8QPdTNA==
MIME-Version: 1.0
X-Received: by 10.176.69.178 with SMTP id u47mr119079uau.133.1468299083074;
	Mon, 11 Jul 2016 21:51:23 -0700 (PDT)
Received: by 10.103.51.77 with HTTP; Mon, 11 Jul 2016 21:51:22 -0700 (PDT)
Received: by 10.103.51.77 with HTTP; Mon, 11 Jul 2016 21:51:22 -0700 (PDT)
In-Reply-To: <CAP9ODKo2j4Q9_CT9BSY9-d275tqrMzmuZR=THLHMRF9fyux8TA@mail.gmail.com>
References: <20160622163845.29573-1-danismostlikely@gmail.com>
	<loom.20160711T131713-153@post.gmane.org>
	<CAMKF1soG_dmoqDtjGqM+=trw9OLfJs54m6Z85N+A-8QVEHmAgg@mail.gmail.com>
	<CAP9ODKo2j4Q9_CT9BSY9-d275tqrMzmuZR=THLHMRF9fyux8TA@mail.gmail.com>
Date: Mon, 11 Jul 2016 22:51:22 -0600
Message-ID: <CACS+7ZQafmRdeVtDjWJvt8zv1yGdzAO_p+DPZMSArWrHx3LsLQ@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-java][PATCH] openjdk-8: make GCC6 happy
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
X-List-Received-Date: Tue, 12 Jul 2016 04:51:24 -0000
Content-Type: text/plain; charset=UTF-8

On 11 Jul 2016 11:44 a.m., "Otavio Salvador" <
otavio.salvador@ossystems.com.br> wrote:
>
> On Mon, Jul 11, 2016 at 11:33 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Mon, Jul 11, 2016 at 4:29 AM, Patrick Ohly <patrick.ohly@intel.com>
wrote:
> >> Dan McGregor <danismostlikely <at> gmail.com> writes:
> >>> From: Daniel McGregor <daniel.mcgregor <at> vecima.com>
> >>>
> >>> GCC 6 sets the default C++ standard to C++14 and introduces dead store
> >>> elimination by default. OpenJDK 8 is not ready for either of these
> >>> changes, so set the C++ standard back to gnu++98 and disable dead
> >>> store elimination.
> >>>
> >>> Switched to using --with-extra-cflags, cxxflags, and ldflags. The
added
> >>> patch fixes building when using those flags, and are needed to get
> >>> CFLAGS into the JDK build in the native case.
> >>
> >> Has anyone tested this on a host system where gcc is still 4.x, like
4.9.2
> >> on Debian Wheezy?
> >>
> >> I'm finding that -fno-lifetime-dse is also getting passed to the gcc
used
> >> for compiling native binaries (obviously in openjdk-8-native, but also
for
> >> some helper executables in openjdk-8). This then breaks the compilation
> >> because older gcc rejects that flag.
> >>
> >> I've briefly toyed with the patch below which worked for
openjdk-8-native,
> >> but not for openjdk-8. I'm just going to work around it by staying on
gcc
> >> 5.x and clearing these extra flags.
> >>
> >> I'm not familiar enough with the openjdk-8 build process to propose a
better
> >> solution, but perhaps someone else has an idea?
> >>
> >> diff --git a/meta-java/recipes-core/openjdk/openjdk-8-common.inc
> >> b/meta-java/recipes-core/openjdk/openjdk-8-common.inc
> >> index dd3d397..060d828 100644
> >> --- a/meta-java/recipes-core/openjdk/openjdk-8-common.inc
> >> +++ b/meta-java/recipes-core/openjdk/openjdk-8-common.inc
> >> @@ -237,6 +237,25 @@ EXTRA_OECONF_append = "\
> >>          --with-update-version=${OPENJDK_UPDATE_VERSION} \
> >>  "
> >>
> >> -CFLAGS_append = " -fno-lifetime-dse -fno-delete-null-pointer-checks"
> >> -CXXFLAGS_append = " -fno-lifetime-dse -fno-delete-null-pointer-checks"
> >> +# GCC 6 sets the default C++ standard to C++14 and introduces dead
store
> >> +# elimination by default. OpenJDK 8 is not ready for either of these
> >> +# changes.
> >> +FLAGS_GCC6 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
> >> +
> >> +# All supported cross compilers support the compiler flags that were
> >> +# added to make compilation with gcc6 work. But the host compiler for
> >> +# native compilation is a different story: it may be too old (for
example,
> >> +# gcc 4.9.2 on Debian Wheezy). In that case we need to check what the
> >> +# version is and unset the flags when gcc is not yet GCC 6.
> >> +python () {
> >> +    if d.getVar('PN', True).endswith('-native'):
> >> +        import re, subprocess
> >> +        version = subprocess.check_output(d.expand('${CC}
> >> --version').split()).decode('utf-8')
> >> +        m = re.search(r'^gcc.* (\d+)(\.\d+)*$', version, re.MULTILINE)
> >> +        if m and int(m.group(1)) < 6:
> >> +            d.setVar('FLAGS_GCC6', '')
> >> +}
> >> +
> >> +CFLAGS_append = " ${FLAGS_GCC6}"
> >> +CXXFLAGS_append = " ${FLAGS_GCC6}"
> >>  CXX_append = " -std=gnu++98"
> >
> > I can see this needed in several other cases too. May be this should be
made
> > a common utility
>
> I agree but this can be done after we fix meta-java case, so we can
> avoid a bottleneck here.

Yup. I did know about this. I'm glad somebody found a solution.

>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

