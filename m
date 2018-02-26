Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 2EB13786C9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Feb 2018 23:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2A9D3209AE;
	Mon, 26 Feb 2018 23:13:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 2Q2sRQ1Kui4B; Mon, 26 Feb 2018 23:13:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 05E3E2005F;
	Mon, 26 Feb 2018 23:13:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6137B1632CD; Mon, 26 Feb 2018 18:13:55 -0500 (EST)
Date: Mon, 26 Feb 2018 18:13:55 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20180226231355.GM2786@denix.org>
References: <20180226215718.GK2786@denix.org>
	<CA+chaQfbv6=ZQBzZRs4q5h0GbnHkpOs_QQ1chYGoN+wPUnOerg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQfbv6=ZQBzZRs4q5h0GbnHkpOs_QQ1chYGoN+wPUnOerg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] qtwebengine/chromium/v8 requires lib32 version of host C++ headers (libc++-dev:i386)
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
X-List-Received-Date: Mon, 26 Feb 2018 23:13:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ah, I now remember that discussion regarding chromium in meta-browser! I guess 
I forgot about it by the time it landed in Qt 5.9 and missed your comments... 
Sorry about the noise.

-- 
Denys


On Mon, Feb 26, 2018 at 11:21:35PM +0100, Martin Jansa wrote:
> See
> http://lists.openembedded.org/pipermail/openembedded-devel/2017-August/114417.html
> 
> There was no update on multilib issue since then and many requests to get
> 5.9 merged, so after couple weeks or months after this e-mail I've merged
> upgrade to 5.9 with this new requirement documented in commit message.
> 
> On Mon, Feb 26, 2018 at 10:57 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > I've got this error below on one of my build machines, and on close
> > inspection, it looks like qtwebengine/chromium/v8 requires host side C++
> > headers in 32-bit besides normal 64-bit version, i.e. libc++-dev:i386 or
> > lib32stdc++-dev.
> >
> > How can we check for this and/or document this requirement?
> >
> > Logs (notice hosttools/g++ and -m32):
> >
> > FAILED: v8_snapshot/obj/v8/mkpeephole/bytecodes.o
> > .../tmp-glibc/hosttools/g++ -MMD -MF v8_snapshot/obj/v8/mkpeephole/bytecodes.o.d
> > -DV8_DEPRECATION_WARNINGS -DUSE_UDEV -DUSE_AURA=1 -DUSE_NSS_CERTS=1
> > -DUSE_OZONE=1 -DNO_TCMALLOC -DDISABLE_NACL -DENABLE_TASK_MANAGER=1
> > -DENABLE_THEMES=1 -DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD
> > -DSAFE_BROWSING_DB_LOCAL -DCHROMIUM_BUILD -DFIELDTRIAL_TESTING_ENABLED
> > -DTOOLKIT_QT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
> > -D_LARGEFILE64_SOURCE -DNDEBUG -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0
> > -DV8_I18N_SUPPORT -DV8_TARGET_ARCH_ARM -DCAN_USE_ARMV7_INSTRUCTIONS
> > -DCAN_USE_VFP3_INSTRUCTIONS -DCAN_USE_VFP32DREGS -DCAN_USE_NEON
> > -DUSE_EABI_HARDFLOAT=1 -Iv8_snapshot/gen -I../../../../git/src/3rdparty/chromium
> > -I../../../../git/src/3rdparty/chromium/v8/include
> > -Iv8_snapshot/gen/v8/include -I../../../../git/src/3rdparty/chromium/v8
> > -fno-strict-aliasing --param=ssp-buffer-size=4 -fstack-protector
> > -funwind-tables -fPIC -pipe -pthread -m32 -msse2 -mfpmath=sse -mmmx -g0
> > -fvisibility=hidden -Wno-unused-local-ty
> >  pedefs -Wno-maybe-uninitialized -Wno-missing-field-initializers
> > -Wno-unused-parameter -O3 -fno-ident -fdata-sections -ffunction-sections
> > -fno-threadsafe-statics -fvisibility-inlines-hidden -std=gnu++11
> > -fno-delete-null-pointer-checks -fno-rtti -fno-exceptions -Wno-deprecated
> > -Wno-narrowing -c ../../../../git/src/3rdparty/
> > chromium/v8/src/interpreter/bytecodes.cc -o v8_snapshot/obj/v8/mkpeephole/
> > bytecodes.o
> > In file included from ../../../../git/src/3rdparty/
> > chromium/v8/src/interpreter/bytecodes.h:8:0,
> >                  from ../../../../git/src/3rdparty/
> > chromium/v8/src/interpreter/bytecodes.cc:5:
> > /usr/include/c++/5/cstdint:38:28: fatal error: bits/c++config.h: No such
> > file or directory
> > compilation terminated.
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >

