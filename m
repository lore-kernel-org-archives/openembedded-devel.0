Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7A8F4719C8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Oct 2017 15:33:09 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id k70so629323itk.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Oct 2017 08:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=TcM6dt0/nBhzvbbwC7qTCcQIRxTfR7X3KT2H+2bJoCo=;
	b=jOQdV9RDEw7pCZE2CIloN7Uax5A5NmrhMMEkwyuqAvNTdYpDOmXPnbWhffcdpmJKh4
	mqPgZQ2DOPIymABcUvz46/m2GpKO8WjHRM4qZZFfKg7Saro2HrvkuW8VRCqF/J5nNr/P
	n8oW2iDUXkLkAQiy4vEp7rh70NFrkoBUwEN88ib9Rz1daxG+qyaHazU1G/GODolCo7Zx
	nJSmOx2s2QOGvFDELVHz3uPFZX/KxvJpzJlj3+4kRSTVBk/DGz1ckO2x95nf5mwYAVmM
	rqCtm7E4QJ9jngIfM+H0jonybQEZfFX5QHNjcYfbLAlKrhHGm3w3wgdNmDfQO/DVf6ga
	JEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=TcM6dt0/nBhzvbbwC7qTCcQIRxTfR7X3KT2H+2bJoCo=;
	b=hqAfPIFPW8Ix2kC8TSZ7EFwR4tQe01WGoGVE3t+elNhgMmKNqh+fd6Ir6fnrN+furI
	Q3TLpcPsLTYCFN35EDkw/Zhty6bxKStm4WpL19NyqEWg2+FON61ZXzMwld2IHRDguNXY
	8kRBYIgCDP26RGcWl4X0GCVMT/29sB/2PgTxeSmhA6q7KG6g2OATX0jY9OpTyLCGkc7q
	2BpH6fZzEqIWGDwIpTom5GI7T7xcCYKWiwBcj6mpW3GAuz+ZBD/GSnLhqxvaEqmCncC0
	v53H9yn+nlrbsiUzaA0wAMoRc7C01o3DNZ08w/cNI4FezeiD7PW58TIdqiOUFoUjTzlO
	bKlQ==
X-Gm-Message-State: AMCzsaVUXnlY2YYd8eWL374bzQ0AB0LzuAbgKzP7HWmlwVgPQYSWBKaw
	DUulfRQCDKWmIV7w/mYyeuo=
X-Google-Smtp-Source: ABhQp+QO/c9COeFdS1XXvfX+0MrQg/7sOfvyrvyuqvJSRAKJ7vrS7NixjNzQAMFN6CWREmNw7YM9eA==
X-Received: by 10.36.105.17 with SMTP id e17mr3419117itc.46.1508513590579;
	Fri, 20 Oct 2017 08:33:10 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id v20sm449264iob.0.2017.10.20.08.33.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Oct 2017 08:33:09 -0700 (PDT)
Date: Fri, 20 Oct 2017 11:33:08 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
Message-ID: <20171020153307.GA6636@linux-uys3>
References: <cc8aeb58-0a29-de25-29b2-d6f1620409f9@igalia.com>
	<CAP9ODKq_x-xT_ux1tmcgDBuaUc2ekw36YAjQ66=iR3OBRgebJA@mail.gmail.com>
	<CAHUNapS+dr5Uc4upvd00vve+WubDT0Fgsc16vQmWXh3O1ErcLw@mail.gmail.com>
	<4e71f40e-63cb-0857-f292-ec3a120776c1@igalia.com>
	<5612aa4c-d986-89f7-7667-14898b5f7bfc@igalia.com>
	<878tgbxio5.fsf@rkubodac-desk.ger.corp.intel.com>
	<874lqzxhoc.fsf@rkubodac-desk.ger.corp.intel.com>
	<87efq0wnt0.fsf@rkubodac-desk.ger.corp.intel.com>
	<87shefnm1g.fsf@rkubodac-desk.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <87shefnm1g.fsf@rkubodac-desk.ger.corp.intel.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-browser] Modern Chromium with GN
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
X-List-Received-Date: Fri, 20 Oct 2017 15:33:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu 2017-10-19 @ 06:24:11 PM, Raphael Kubo da Costa wrote:
> Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com> writes:
> > Work on Chromium 62 has started, but updating is a bit slower now that
> > I'm trying to test GCC 5, 7, pyro and rocko.
> 
> I've pushed a new branch called "chromium62". It's been test-built
> against Yocto's pyro (with GCC 5) and rocko (with GCC 7) for x86 and
> x86-64.
> 
> Additional testing is appreciated!

It looks like something in the chromium62 build is calling my native g++ and
expecting that this native g++ will be recent enough to support c++14:


	| g++  -MMD -MF base/base_paths.o.d  -I/z/chromium/crosswalk/build/tmp-glibc/work/x86_64-linux/gn-native/62.0.3202.62-r0/chromium-62.0.3202.62/out_bootstrap/gen -I/z/chromium/crosswalk/build/tmp-glibc/work/x86_64-linux/gn-native/62.0.3202.62-r0/chromium-62.0.3202.62 -isystem/z/chromium/crosswalk/build/tmp-glibc/work/x86_64-linux/gn-native/62.0.3202.62-r0/recipe-sysroot-native/usr/include -O2 -pipe -DNO_TCMALLOC -D__STDC_FORMAT_MACROS -O2 -g0 -D_FILE_OFFSET_BITS=64 -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -pthread -pipe -fno-exceptions -isystem/z/chromium/crosswalk/build/tmp-glibc/work/x86_64-linux/gn-native/62.0.3202.62-r0/recipe-sysroot-native/usr/include -O2 -pipe -std=c++14 -Wno-c++11-narrowing -c /z/chromium/crosswalk/build/tmp-glibc/work/x86_64-linux/gn-native/62.0.3202.62-r0/chromium-62.0.3202.62/base/base_paths.cc -o base/base_paths.o
	| g++: error: unrecognized command line option ‘-std=c++14’


Unfortunately on my openSUSE 42.2 host this isn't the case:

	$ g++ -v
	Using built-in specs.
	COLLECT_GCC=g++
	COLLECT_LTO_WRAPPER=/usr/lib64/gcc/x86_64-suse-linux/4.8/lto-wrapper
	Target: x86_64-suse-linux
	Configured with: ../configure --prefix=/usr --infodir=/usr/share/info --mandir=/usr/share/man --libdir=/usr/lib64 --libexecdir=/usr/lib64 --enable-languages=c,c++,objc,fortran,obj-c++,java,ada --enable-checking=release --with-gxx-include-dir=/usr/include/c++/4.8 --enable-ssp --disable-libssp --disable-plugin --with-bugurl=http://bugs.opensuse.org/ --with-pkgversion='SUSE Linux' --disable-libgcj --disable-libmudflap --with-slibdir=/lib64 --with-system-zlib --enable-__cxa_atexit --enable-libstdcxx-allocator=new --disable-libstdcxx-pch --enable-version-specific-runtime-libs --enable-linker-build-id --enable-linux-futex --program-suffix=-4.8 --without-system-libunwind --with-arch-32=i586 --with-tune=generic --build=x86_64-suse-linux --host=x86_64-suse-linux
	Thread model: posix
	gcc version 4.8.5 (SUSE Linux)


Is there any way to intercept these calls and have it call OE's gcc-native
instead?

