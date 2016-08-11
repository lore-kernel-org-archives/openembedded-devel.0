Return-Path: <jeremy.rosen@smile.fr>
X-Greylist: delayed 419 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 11 Aug 2016 12:47:26 UTC
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id 2F21B7721A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 12:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id E5B271EE0BC2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 14:40:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024) with ESMTP id ynpjXP1QYlRp
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 14:40:27 +0200 (CEST)
Received: from [10.5.19.62] (bob75-2-81-56-46-209.fbx.proxad.net
	[81.56.46.209])
	by idris.smile.fr (Postfix) with ESMTPSA id AA3F81EE0BB2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 14:40:27 +0200 (CEST)
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
From: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Message-ID: <bef7bc37-7691-5631-d232-80ffc0e29e26@smile.fr>
Date: Thu, 11 Aug 2016 14:40:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Firefox/45.0 Icedove/45.2.0
MIME-Version: 1.0
Subject: [Jethro] Can't compile gcc-cross when gcc-6 is the host compiler
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
X-List-Received-Date: Thu, 11 Aug 2016 12:47:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello everybody

I am working on a jethro-based project on my Debian/testing machine, and 
debian just migrated it's default gcc from gcc-5 to gcc-6

As expected, this caused all sort of errors in my build, starting by 
pkgconfig-native not being compilable anymore (new gcc warnings coupled 
with -Werror)


That's OK. I don't expect jethro to support future compilers out of the 
box so I installed gcc-5 in parallel to gcc-6 while keeping gcc-6 as the 
default compiler.

I then set the following variables in local.conf

#gcc-5
export BUILD_CC = "${CCACHE}${BUILD_PREFIX}gcc-5 ${BUILD_CC_ARCH}"
export BUILD_CXX = "${CCACHE}${BUILD_PREFIX}g++-5 ${BUILD_CC_ARCH}"
export BUILD_FC = "${CCACHE}${BUILD_PREFIX}gfortran-5 ${BUILD_CC_ARCH}"
export BUILD_CPP = "${BUILD_PREFIX}gcc-5 ${BUILD_CC_ARCH} -E"
export BUILD_LD = "${BUILD_PREFIX}ld ${BUILD_LD_ARCH}"
export BUILD_CCLD = "${BUILD_PREFIX}gcc-5 ${BUILD_CC_ARCH}"
export BUILD_AR = "${BUILD_PREFIX}gcc-ar-5"
export BUILD_AS = "${BUILD_PREFIX}as ${BUILD_AS_ARCH}"
export BUILD_RANLIB = "${BUILD_PREFIX}gcc-ranlib-5"
export BUILD_STRIP = "${BUILD_PREFIX}strip"
export BUILD_NM = "${BUILD_PREFIX}gcc-nm-5"

This helped, and allowed me to go much further in my build, but the 
recipe gcc-cross-arm still failed. To be able to compile my build I had 
to add the following to my local.conf

CC_pn-gcc-cross-arm= "${BUILD_CC}"
CXX_pn-gcc-cross-arm= "${BUILD_CXX}"
CC_pn-gcc-crosssdk-x86_64= "${BUILD_CC}"
CXX_pn-gcc-crosssdk-x86_64= "${BUILD_CXX}"


So apparently, gcc still has some reference to $CC and $CXX hardcoded 
somewhere (I think it's in do_configure)

It seems to set $CC in the do_compile correctly, but not in 
do_configure. And it never sets $CXX

I tried to understand what the GCC recipe was doing wrong, but I 
couldn't find out on first look and it's a really complicated recipe


I hope this is enough clues to allow someone more knowledgeable to 
create a proper fix...


Regards

Jeremy Rosen


