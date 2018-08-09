Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
	[209.85.161.66])
	by mail.openembedded.org (Postfix) with ESMTP id 97E6665C8F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Aug 2018 10:46:09 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id l9-v6so3860328ywc.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Aug 2018 03:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=p+3xbgPYN0H4Oie61x+JcTQf7BFGDfHg7iB5BD8YsvA=;
	b=esVXzZiynARDsq1cvyVWWAIB1yA67WBTDss50MBBoVoOf6Faz7aAkzC/XZGj2NQCKj
	qn3Ih19SpoQFiy+RM6AbVljYqCh2J8QefbHtkFMzVt1PJMcLtPzuY+3xhe8O3lJbwQjA
	r3zfLIgfUh2vmCQeJDvpoSulHWw2twg/xLx8DSiy4uxJimmt92w3OWa09R6y6hun3LXp
	eQ1Us9Fzg++5M30B9B3qwvus8gT1qtYKZhdmtXpreNI5l/mvVHM/mGoLnKgmW7or9TJ/
	aOKdD2PD05KbrxHqUvOrMW5WdE6f8ua5NrBXVF1TnpEmqPYNcoQZ/qd+M8iPFqp8Yr2A
	bVDw==
X-Gm-Message-State: AOUpUlForEqp03N8WG1nnZtca0sttUI4frlnl5/cInknc5U9GtkIJslR
	Lch2HiansW5WUgTpBHmWqJVfQjFM
X-Google-Smtp-Source: AA+uWPwa5CFUtxY263WEg1hOBBWGoAFDEb84IyXd3AZnPslvnDw0TvWUbTuUdXg51dGAN776w7V16Q==
X-Received: by 2002:a25:e6c6:: with SMTP id
	d189-v6mr682966ybh.341.1533811570344; 
	Thu, 09 Aug 2018 03:46:10 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	i81-v6sm2672249ywg.7.2018.08.09.03.46.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 09 Aug 2018 03:46:09 -0700 (PDT)
Message-ID: <2c2e520e7f67ddacfc65dc45a037580a419d4e12.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 09 Aug 2018 11:46:07 +0100
In-Reply-To: <20180809002644.18549-4-git@andred.net>
References: <20180809002644.18549-1-git@andred.net>
	<20180809002644.18549-4-git@andred.net>
X-Mailer: Evolution 3.28.2-1 
Mime-Version: 1.0
Subject: Re: [meta-java][master-next][PATCH 4/4] openjdk-8: update to work with gcc v8
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
X-List-Received-Date: Thu, 09 Aug 2018 10:46:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Argh, this last one still doesn't work, because of weird CFLAGS / CXXFLAGS
in this recipe :-(

We end up adding command line options to gcc based on the cross gcc version,
but openjdk uses the same ones for native tools compilation, which fails.

A,


On Thu, 2018-08-09 at 01:26 +0100, André Draszik wrote:
> From: André Draszik <andre.draszik@jci.com>
> 
> Similar to the existing gcc-6 and gcc-7 support, we need to
> add the same specific compiler flags to avoid miscompilation
> on gcc-8:
>   -fno-lifetime-dse
>   -fno-delete-null-pointer-checks
> 
> In addition, gcc v8 introduces new warnings (which are
> treated as errors), which we can just silence for the
> time being:
> 
> > <<PKGBUILDDIR>>/hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp
> > :223:32: error: control reaches end of non-void function [-
> > Werror=return-type]
> >  #define BREAKPOINT ::breakpoint()
> >                     ~~~~~~~~~~~~^~
> > <<PKGBUILDDIR>>/hotspot/src/share/vm/utilities/debug.hpp:192:3: note: in
> > expansion of macro 'BREAKPOINT'
> >    BREAKPOINT;                                                          
> >       \
> >    ^~~~~~~~~~
> > <<PKGBUILDDIR>>/hotspot/src/cpu/aarch64/vm/c1_LIRAssembler_aarch64.cpp:1
> > 97:2: note: in expansion of macro 'ShouldNotReachHere'
> >   ShouldNotReachHere();
> >   ^~~~~~~~~~~~~~~~~~
> 
> etc.
> 
> And
> > <<PKGBUILDDIR>>/hotspot/src/share/vm/runtime/arguments.cpp:3811:14:
> > error: 'char* strncat(char*, const char*, size_t)' specified bound 1
> > equals source length [-Werror=stringop-overflow=]
> >        strncat(shared_archive_path, os::file_separator(), file_sep_len);
> >        ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > <<PKGBUILDDIR>>/hotspot/src/share/vm/runtime/arguments.cpp: In static
> > member function 'static void Arguments::fix_appclasspath()':
> > <<PKGBUILDDIR>>/hotspot/src/share/vm/runtime/arguments.cpp:3433:12:
> > error: 'char* strncpy(char*, const char*, size_t)' specified bound
> > depends on the length of the source argument [-Werror=stringop-
> > overflow=]
> >      strncpy(copy, src, strlen(src) + 1);
> >      ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > <<PKGBUILDDIR>>/hotspot/src/share/vm/runtime/arguments.cpp:3433:30:
> > note: length computed here
> >      strncpy(copy, src, strlen(src) + 1);
> >                         ~~~~~~^~~~~
> > <<PKGBUILDDIR>>/hotspot/src/share/vm/runtime/arguments.cpp:3433:12:
> > error: 'char* strncpy(char*, const char*, size_t)' specified bound
> > depends on the length of the source argument [-Werror=stringop-
> > overflow=]
> >      strncpy(copy, src, strlen(src) + 1);
> >      ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > <<PKGBUILDDIR>>/hotspot/src/share/vm/runtime/arguments.cpp:3433:30:
> > note: length computed here
> >      strncpy(copy, src, strlen(src) + 1);
> >                         ~~~~~~^~~~~
> 
> etc.
> 
> With this,
>     bitbake -c testimage openjdk-8-test-image
> works again:
> RESULTS:
> RESULTS - ping.PingTest.test_ping - Testcase 964: PASSED (0.12s)
> RESULTS - ssh.SSHTest.test_ssh - Testcase 224: PASSED (1.20s)
> RESULTS - java.JavaTest.test_java_exists - Testcase -1: PASSED (0.15s)
> RESULTS - java.JavaTest.test_java_jar_comp_mode - Testcase -1: PASSED
> (41.98s)
> RESULTS - java.JavaTest.test_java_jar_int_mode - Testcase -1: PASSED
> (1.76s)
> RESULTS - java.JavaTest.test_java_jar_works - Testcase -1: PASSED (2.13s)
> RESULTS - java.JavaTest.test_java_version - Testcase -1: PASSED (1.51s)
> RESULTS - javac.JavacTest.test_javac_exists - Testcase -1: PASSED (0.11s)
> RESULTS - javac.JavacTest.test_javac_works - Testcase -1: PASSED (17.64s)
> SUMMARY:
> openjdk-8-test-image () - Ran 9 tests in 67.112s
> openjdk-8-test-image - OK - All required tests passed
> 
> Signed-off-by: André Draszik <andre.draszik@jci.com>
> ---
>  recipes-core/openjdk/openjdk-8-common.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-
> core/openjdk/openjdk-8-common.inc
> index 3b328e9..79af54a 100644
> --- a/recipes-core/openjdk/openjdk-8-common.inc
> +++ b/recipes-core/openjdk/openjdk-8-common.inc
> @@ -216,6 +216,7 @@ EXTRA_OECONF_append = "\
>  # of these changes.
>  FLAGS_GCC6 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
>  FLAGS_GCC7 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
> +FLAGS_GCC8 = "-fno-lifetime-dse -fno-delete-null-pointer-checks -Wno-
> error=stringop-overflow -Wno-error=return-type"
>  
>  # All supported cross compilers support the compiler flags that were
>  # added to make compilation with gcc6 work. But the host compiler for

