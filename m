Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id D08297E668
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Sep 2019 11:19:22 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id q10so37307583iop.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=agW1EHDR8ZTGsONmI7Txf3HjwKzsStz9BzeZRZPJAGI=;
	b=lwYF9WlaKS4JbT50wfE48Xoda7G+zjLpouGFOSRTtUd3/o2e3y/RI03qBoqrAAB1by
	cFYchfkCrUJTlH913nv3+w5p1/cRTKbniTU+LL4vKUceelOZiMBL73zCel3U09QIrRFV
	pUWzmYrV6u1W5+qtut3wZonFlIzje5VufTfzHT13fP9x2hd6QNqk43JU+3rPr6NjQrjm
	I+S2437malPcUN7Y4fmd7XfJiE3FT8ZHb8HNGxsi3RjEU3zsQQgvY7MF8ERfUMbDx5h4
	VlMHwwVWkBY/8G3YusifWnmsdKvYpF3gY4+OKpWkSapnXOe8sBmSGpUrwohRkaS5+V2K
	jXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=agW1EHDR8ZTGsONmI7Txf3HjwKzsStz9BzeZRZPJAGI=;
	b=F7wYa34vm5f4jvbzE5pZ3UVtAQeESLxbVuCzp/VWQlnb9+BpLjerq6eLxZeKB+5pfE
	QgdzwBDfc0Cuc/fsP2NSYQH3g7TL1dJ6iYbmFGBuVsa2GPXHzP9FIuGttMfuQwC3ME52
	LIVzCTlEBkUnPXWhkS+SXfmpf+2UAlSD7nlePXMw2KVLEdDjoYK8PdJ1MtjKyOiAI7KI
	VNhSXt0JrTFRPcxTerAM5O6P0WLY7nE95migyeMg4J4wbwVQgZB+4CvZw0JNsuh68Hxf
	mik/tWmhxrTr9e79wXTwMZorcsKfZpAbUFtaefDJTjokB/4Kzs+bP7GS2mFlYiekvCoO
	wrow==
X-Gm-Message-State: APjAAAUWsXpuQP0BD4OADrAOmoGEpNe5K0M5hcYVCBWduC6FfpI3CIFU
	LTI6yiJXI1s95Z9DjA5yBjVMcQmnXTgFpzoNf84=
X-Google-Smtp-Source: APXvYqz3ZquUwR9d866mEpSokt6+TnmKiZTftc2LxVewG2PwZNk81NPbTP4wEofMfZ2U89gKED/5E3Y74TJWjEGmZtY=
X-Received: by 2002:a5d:9849:: with SMTP id p9mr337962ios.102.1569842363687;
	Mon, 30 Sep 2019 04:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAB2nKc9YYhnO0YVn2Err6BtSQdP3fT_uz7xSS-W6VxEHX3dsiA@mail.gmail.com>
In-Reply-To: <CAB2nKc9YYhnO0YVn2Err6BtSQdP3fT_uz7xSS-W6VxEHX3dsiA@mail.gmail.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Mon, 30 Sep 2019 13:19:12 +0200
Message-ID: <CAB2nKc_wRyho9AK3r-_h35TLNSW87Xfmdm_EBng5BJQxYp7bgg@mail.gmail.com>
To: richard.leitner@skidata.com, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	erkka.kaaria@intel.com, "Maxin B. John" <maxin.john@intel.com>,
	Otavio Salvador <otavio.salvador@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-java] openjre-8 fmacro-prefix-map problem
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
X-List-Received-Date: Mon, 30 Sep 2019 11:19:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello again,

I see that there is a patch that should fix the problem:
https://git.yoctoproject.org/cgit/cgit.cgi/meta-java/tree/recipes-core/open=
jdk/patches-openjdk-8/openjdk8-fix-adlc-flags.patch
It is applied but it seems target compilation options are non filtered?

Regards,
Vincent

Le mer. 18 sept. 2019 =C3=A0 11:41, Vincent Prince <vincent.prince.fr@gmail=
.com>
a =C3=A9crit :

> Hi,
>
> I'm trying to build my image on Yocto master branch, and it fails to
> compile openjre-8 (It works fine on Warrior).
>
> Here's the error message:
>
> openjre-8-172b11-r0 do_compile: oe_runmake failed:
>
> g++ -DLINUX -D_GNU_SOURCE -DAMD64
> -I/yocto/build-vc/tmp/work/corei7-64-cb-linux/openjre-8/172b11-r0/jdk8u-3=
3d274a7dda0/hotspot/src/share/vm/prims
> -I[skip...] -DASSERT -O2 -pipe -g -feliminate-unused-debug-types
> -fmacro-prefix-map=3D/yocto/build-vc/tmp/work/corei7-64-cb-linux/openjre-=
8/172b11-r0=3D/usr/src/debug/openjre-8/172b11-r0
>
> -fdebug-prefix-map=3D/yocto/build-vc/tmp/work/corei7-64-cb-linux/openjre-=
8/172b11-r0=3D/usr/src/debug/openjre-8/172b11-r0
>
> -fdebug-prefix-map=3D/yocto/build-vc/tmp/work/corei7-64-cb-linux/openjre-=
8/172b11-r0/recipe-sysroot=3D
>
> -fdebug-prefix-map=3D/yocto/build-vc/tmp/work/corei7-64-cb-linux/openjre-=
8/172b11-r0/recipe-sysroot-native=3D
>
> -Wno-error=3Ddeprecated-declarations -DTARGET_OS_FAMILY_linux
> -DTARGET_ARCH_x86 -DTARGET_ARCH_MODEL_x86_64 -DTARGET_OS_ARCH_linux_x86
> -DTARGET_OS_ARCH_MODEL_linux_x86_64
> -DTARGET_COMPILER_gcc -DCOMPILER2 -DCOMPILER1
> -DDONT_USE_PRECOMPILED_HEADER -fno-rtti -fno-exceptions -D_REENTRANT
> -fcheck-new -fvisibility=3Dhidden -pipe -fno-strict-aliasing -g
> -fno-omit-frame-pointer -DTARGET_OS_FAMILY_linux -DTARGET_ARCH_x86
> -DTARGET_ARCH_MODEL_x86_64 -DTARGET_OS_ARCH_linux_x86
> -DTARGET_OS_ARCH_MODEL_linux_x86_64
> -DTARGET_COMPILER_gcc -DCOMPILER2 -DCOMPILER1
> -DDONT_USE_PRECOMPILED_HEADER -fno-rtti -fno-exceptions -D_REENTRANT
> -fcheck-new -fvisibility=3Dhidden -pipe -fno-strict-aliasing -g
> -fno-omit-frame-pointer
> -isystem/yocto/build-vc/tmp/work/corei7-64-cb-linux/openjre-8/172b11-r0/r=
ecipe-sysroot-native/usr/include
> -O2 -pipe -Wno-error=3Ddeprecated-declarations -Werror
> -c -o ../generated/adfiles/adlparse.o
> /yocto/build-vc/tmp/work/corei7-64-cb-linux/openjre-8/172b11-r0/jdk8u-33d=
274a7dda0/hotspot/src/share/vm/adlc/adlparse.cpp
>
> g++: error: unrecognized command line option
> =E2=80=98-fmacro-prefix-map=3D/yocto/build-vc/tmp/work/corei7-64-cb-linux=
/openjre-8/172b11-r0=3D/usr/src/debug/openjre-8/172b11-r0=E2=80=99
>
> /yocto/build-vc/tmp/work/corei7-64-cb-linux/openjre-8/172b11-r0/jdk8u-33d=
274a7dda0/hotspot/make/linux/makefiles/adlc.make:222:
> recipe for target '../generated/adfiles/adlparse.o' failed
>
> It seems Yocto master introduces new -fmacro-prefix-map compile flag that
> g++ does not recognize?
> Does it means I need to upgrade my gcc (5.4.0) version on build machine?
> (Ubuntu 16.04).
> If so, why it does not use -native package?
>
> Best regards,
> Vincent
>

