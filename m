Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id B12F67320F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Aug 2016 03:13:53 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id cf3so263415pad.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 20:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=/Hgj4PxaxlVYwm07cOiQi+Zv+tCUvN+5QUdgJHP6hYQ=;
	b=VwkWF1A54vOCYbXHcXG8YwFmirt1CeNzbWh+FsLZ4qH2owynjcFjV4GTbV/ZKBYZ2c
	Nnqfr64DVaDC/l3Vfkl6sEU2Zw5XcgPQWnZbHeVFdbq2rf4wCqBYGVsq52VglROm+xp6
	PXrhoEABmd7WnNDZl4EkxqYwqdfYSd+lnJ8jYxGlj51XUgx1lwc2EoNZFH6T+JJz9f4s
	4LvG2AEgvuZ75kvfEwsRlRABn4jidacn5n8IChfjGO6b2mkLbOOH+OzXftdIG/HJPNn9
	P4F2WCbuDs7Q3Dq9V9AwTPn+OKnIsnLFeRAwWPTMU/pKh3NaOSCPhDFI70zVhpUeNAuy
	DwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=/Hgj4PxaxlVYwm07cOiQi+Zv+tCUvN+5QUdgJHP6hYQ=;
	b=G5LAQZuDFb0B7UVjHUe7fpFIfPRXpX35xXc9Y9FGDZx9VRmBPIDHqg5CRL5cC+fu/H
	+ZGJ5JopDlku60gRe4jG23Rs1W3e6xgQUwrmPRAhgsiG0CSIeevxnqdQgmKGDg9UxKbl
	qDixRMciIB6+4JGKDmvITlEr+WkxIyzthvo5jtKFzj/JXyC4w7VK03Y46oziCg5n1LIu
	Thk4dv3z8wlECOui+YChIGKHuQAtNOnHdLspEi6uWabDkX1UaQW/lWCZOL8wc6HX10A6
	IQO5NeSCkIBn9VSTty8FtEiYyrn6VuoZBI5leZEOaBwa2hYvX7sByr3MxrxmHu64MNYD
	8L7Q==
X-Gm-Message-State: AEkoouv9zx2FyvBAli2bxJqfguQdF+VuCKbz1IZR2G1ysznZi+gC8/n80daHrLKptVfWnQ==
X-Received: by 10.66.235.100 with SMTP id ul4mr32861959pac.50.1471058034561;
	Fri, 12 Aug 2016 20:13:54 -0700 (PDT)
Received: from haswell (c-76-102-32-192.hsd1.ca.comcast.net. [76.102.32.192])
	by smtp.gmail.com with ESMTPSA id
	c125sm16175227pfc.40.2016.08.12.20.13.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Aug 2016 20:13:53 -0700 (PDT)
Date: Fri, 12 Aug 2016 20:13:51 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160813031351.GC23947@haswell>
References: <bef7bc37-7691-5631-d232-80ffc0e29e26@smile.fr>
	<CAJTo0LYzmcMhA22cdJX5mS1n30tN1G9XSD3LV+-CpEVOQC=OQA@mail.gmail.com>
	<57f8c9eb-057b-e2c0-df16-826a6662dcc8@smile.fr>
MIME-Version: 1.0
In-Reply-To: <57f8c9eb-057b-e2c0-df16-826a6662dcc8@smile.fr>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [Jethro] Can't compile gcc-cross when gcc-6 is the host compiler
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
X-List-Received-Date: Sat, 13 Aug 2016 03:13:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 16-08-12 15:38:52, Jérémy Rosen wrote:
> 
> 
> On 11/08/2016 21:38, Burton, Ross wrote:
> >On 11 August 2016 at 13:40, Jérémy Rosen <jeremy.rosen@smile.fr> wrote:
> >
> >>This helped, and allowed me to go much further in my build, but the recipe
> >>gcc-cross-arm still failed. To be able to compile my build I had to add the
> >>following to my local.conf
> >>
> >>CC_pn-gcc-cross-arm= "${BUILD_CC}"
> >>CXX_pn-gcc-cross-arm= "${BUILD_CXX}"
> >>CC_pn-gcc-crosssdk-x86_64= "${BUILD_CC}"
> >>CXX_pn-gcc-crosssdk-x86_64= "${BUILD_CXX}"
> >>
> >>
> >>So apparently, gcc still has some reference to $CC and $CXX hardcoded
> >>somewhere (I think it's in do_configure)
> >>
> >>It seems to set $CC in the do_compile correctly, but not in do_configure.
> >>And it never sets $CXX
> >>
> >>I tried to understand what the GCC recipe was doing wrong, but I couldn't
> >>find out on first look and it's a really complicated recipe
> >>
> >Could you try adding a do_configure_prepend to gcc-cross.inc that sets
> >exports those (and extend the do_compile exports) to see if that solves it?
> 
> I did the following
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc
> b/meta/recipes-devtools/gcc/gcc-cross.inc
> index aa10633..9a2e06f 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> @@ -36,8 +36,14 @@ EXTRA_OECONF_PATHS = "\
> 
>  ARCH_FLAGS_FOR_TARGET +=
> "-isystem${STAGING_DIR_TARGET}${target_includedir}"
> 
> +do_configure_prepend () {
> +    export CC="${BUILD_CC}"
> +    export CXX="${BUILD_CXX}"
> +}
> +
>  do_compile () {
>      export CC="${BUILD_CC}"
> +    export CXX="${BUILD_CXX}"
>      export AR_FOR_TARGET="${TARGET_SYS}-ar"
>      export RANLIB_FOR_TARGET="${TARGET_SYS}-ranlib"
>      export LD_FOR_TARGET="${TARGET_SYS}-ld"
> 
> 
> (which I think is what you meant) and it did indeed solve the problem.

this looks ok.


