Return-Path: <leo.yan@linaro.org>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3FF4F60B5D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 07:39:03 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 6so6473076pgk.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 23:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Q5w3EaaFnwMx4+6js+EJxxfoiUgqxL5YsQbvDTZHGrc=;
	b=pGt3FzK7PdfjUA8YhEl9pe2jEYMv/qtLxcuNYVKs05dVn0nm3dQrlwhiCl5HEOsDKt
	6bYuvfJKGLh/9LUPZmu0xxg1TiQYC8JwFV2VsAznlSQuZe8cGEWxLacneEXiU5erN1Cm
	qZ2QoNoECER1A8HWdinB8vh+pQs/9iFXGJbW8RJB+jKMZQmakBP3ABXw53c1+wtYFyw0
	BFdSbmKC7Xz5R/OwIst5mKZr9UCaJfzcjBHgECjFXlHNtaotC14TF84kSIDAHv3jwUDH
	EPYj2XzTn3hxHQZJnkmTzHH41TsPHZ46RBADBAtoKJmW340cE2snrmvMhpmNd1qYdSG6
	0ceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Q5w3EaaFnwMx4+6js+EJxxfoiUgqxL5YsQbvDTZHGrc=;
	b=QUEDucYi0P3k/6qC4h/MNPwkSHdunw3ODUM1oCHcUMap3cZWtNQ1wQUDgHwavKhETh
	MtplYbMObRnHN/hlTb/iTWgldSBkFnGdCzbn60q71Ez5iLgk9on0X4IRvrJfg907MUDt
	lrqkA6Uc+gnkWp3VeeaeyGRkPyKRH+lcHFfLA/Aqj6L2Cjz+YIFmjGO/RPNIBfdz/YhZ
	JKA0Ljy9Nb3XHPtZ/byztiAbZGzZbivTJsDsTCZI66jBWJL1CyvetKgUe50CLYnYdPTe
	lteJVpHGdWnIH08qTBAgF2oKz3F7wwXE6J5CnbmhzVg6/35PILBxvq5qvyBvzX6H/JEk
	7ylQ==
X-Gm-Message-State: APjAAAU6E8ziHA05InFHiBeYJnSlo4OrqsBsPJ9k7Dl5s17NUf6q/9CQ
	am7zF2Uaqc2/OWBuRZ4kEm3RYg==
X-Google-Smtp-Source: APXvYqwvrRPT9600ssN1+zFdwH7FKjNHcCJl9HyTayK6hb4SBzqDfMe4xv6VXxTElJ6nXc3kqL1esw==
X-Received: by 2002:a63:4f0c:: with SMTP id d12mr58954101pgb.322.1582616344857;
	Mon, 24 Feb 2020 23:39:04 -0800 (PST)
Received: from leoy-ThinkPad-X240s ([2400:8902::f03c:91ff:fe3f:ee42])
	by smtp.gmail.com with ESMTPSA id
	y76sm15604505pfc.87.2020.02.24.23.38.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 24 Feb 2020 23:39:04 -0800 (PST)
Date: Tue, 25 Feb 2020 15:38:55 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200225073129.GA1169@leoy-ThinkPad-X240s>
References: <20200225063711.4848-1-leo.yan@linaro.org>
	<263955b2-9b82-f24c-172c-0761d86a1391@gmail.com>
MIME-Version: 1.0
In-Reply-To: <263955b2-9b82-f24c-172c-0761d86a1391@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] luajit: Upgrade to 2.1.0-beta3
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
X-List-Received-Date: Tue, 25 Feb 2020 07:39:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem,

On Mon, Feb 24, 2020 at 10:41:04PM -0800, Khem Raj wrote:
> 
> 
> On 2/24/20 10:37 PM, Leo Yan wrote:
> > Since luajit 2.1.0-beta3 can support architecture aarch64 and the old
> > misses to support aarch64, the patch upgrades to luajit 2.1.0-beta3.
> > 
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> > ---
> >   .../luajit/luajit/clang.patch                 | 19 -------------------
> 
> 
> why is this patch dropped ? it building with clang handled differently now ?
> if so please add a line or two in commit msg

To be honest, I don't know how to hit the condition for
'#elif !LJ_TARGET_PS3', and since considering Clang has upgraded to new
version (9.0.1), this is another reason I dropped this patch.

But I cannot give out any concrete reason, will keep this patch.

Thanks,
Leo

> >   .../luajit/{luajit_2.0.5.bb => luajit_git.bb} | 14 ++++++--------
> >   2 files changed, 6 insertions(+), 27 deletions(-)
> >   delete mode 100644 meta-oe/recipes-devtools/luajit/luajit/clang.patch
> >   rename meta-oe/recipes-devtools/luajit/{luajit_2.0.5.bb => luajit_git.bb} (89%)
> > 
> > diff --git a/meta-oe/recipes-devtools/luajit/luajit/clang.patch b/meta-oe/recipes-devtools/luajit/luajit/clang.patch
> > deleted file mode 100644
> > index c39ef6fd4..000000000
> > --- a/meta-oe/recipes-devtools/luajit/luajit/clang.patch
> > +++ /dev/null
> > @@ -1,19 +0,0 @@
> > -clang pretends to be gcc 4.2.0 which is a big lie when it comes
> > -to features, its same as latest gcc
> > -
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > -Upstream-Status: Pending
> > -
> > -Index: LuaJIT-2.0.5/src/lj_arch.h
> > -===================================================================
> > ---- LuaJIT-2.0.5.orig/src/lj_arch.h
> > -+++ LuaJIT-2.0.5/src/lj_arch.h
> > -@@ -313,7 +313,7 @@
> > - #error "Need at least GCC 4.2 or newer"
> > - #endif
> > - #elif !LJ_TARGET_PS3
> > --#if (__GNUC__ < 4) || ((__GNUC__ == 4) && __GNUC_MINOR__ < 3)
> > -+#if (__GNUC__ < 4) || ((__GNUC__ == 4) && __GNUC_MINOR__ < 3) && !defined(__clang__)
> > - #error "Need at least GCC 4.3 or newer"
> > - #endif
> > - #endif
> > diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
> > similarity index 89%
> > rename from meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
> > rename to meta-oe/recipes-devtools/luajit/luajit_git.bb
> > index 93128dda8..da798328e 100644
> > --- a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
> > +++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
> > @@ -1,14 +1,13 @@
> >   SUMMARY = "Just-In-Time Compiler for Lua"
> >   LICENSE = "MIT"
> > -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=10a96c93403affcc34765f4c2612bc22"
> > +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d739bb9250a55c124a545b588fd76771"
> >   HOMEPAGE = "http://luajit.org"
> > -PV .= "+git${SRCPV}"
> > -SRCREV = "02b521981a1ab919ff2cd4d9bcaee80baf77dce2"
> > -SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http \
> > +PV = "2.0.5+2.1.0-beta3"
> > +SRCREV = "0ad60ccbc3768fa8e3e726858adf261950edbc22"
> > +SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1 \
> >              file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patch \
> > -           file://clang.patch \
> > -"
> > +           "
> >   S = "${WORKDIR}/git"
> > @@ -90,8 +89,7 @@ FILES_${PN}-dev += "${libdir}/libluajit-5.1.a \
> >   "
> >   FILES_luajit-common = "${datadir}/${BPN}-${PV}"
> > -# Aarch64/mips64/ppc/ppc64/riscv64 is not supported in this release
> > -COMPATIBLE_HOST_aarch64 = "null"
> > +# mips64/ppc/ppc64/riscv64 is not supported in this release
> >   COMPATIBLE_HOST_mipsarchn32 = "null"
> >   COMPATIBLE_HOST_mipsarchn64 = "null"
> >   COMPATIBLE_HOST_powerpc = "null"
> > 

