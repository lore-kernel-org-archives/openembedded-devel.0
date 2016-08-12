Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id 0C4AF731C2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 13:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id B1B041EE0501
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 15:38:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024) with ESMTP id HxntCwOMQ9tz
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 15:38:59 +0200 (CEST)
Received: from [10.9.18.224] (229.29.205.77.rev.sfr.net [77.205.29.229])
	by idris.smile.fr (Postfix) with ESMTPSA id 385A11EE0A32
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 15:38:57 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <bef7bc37-7691-5631-d232-80ffc0e29e26@smile.fr>
	<CAJTo0LYzmcMhA22cdJX5mS1n30tN1G9XSD3LV+-CpEVOQC=OQA@mail.gmail.com>
From: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Message-ID: <57f8c9eb-057b-e2c0-df16-826a6662dcc8@smile.fr>
Date: Fri, 12 Aug 2016 15:38:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Firefox/45.0 Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYzmcMhA22cdJX5mS1n30tN1G9XSD3LV+-CpEVOQC=OQA@mail.gmail.com>
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
X-List-Received-Date: Fri, 12 Aug 2016 13:39:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/08/2016 21:38, Burton, Ross wrote:
> On 11 August 2016 at 13:40, Jérémy Rosen <jeremy.rosen@smile.fr> wrote:
>
>> This helped, and allowed me to go much further in my build, but the recipe
>> gcc-cross-arm still failed. To be able to compile my build I had to add the
>> following to my local.conf
>>
>> CC_pn-gcc-cross-arm= "${BUILD_CC}"
>> CXX_pn-gcc-cross-arm= "${BUILD_CXX}"
>> CC_pn-gcc-crosssdk-x86_64= "${BUILD_CC}"
>> CXX_pn-gcc-crosssdk-x86_64= "${BUILD_CXX}"
>>
>>
>> So apparently, gcc still has some reference to $CC and $CXX hardcoded
>> somewhere (I think it's in do_configure)
>>
>> It seems to set $CC in the do_compile correctly, but not in do_configure.
>> And it never sets $CXX
>>
>> I tried to understand what the GCC recipe was doing wrong, but I couldn't
>> find out on first look and it's a really complicated recipe
>>
> Could you try adding a do_configure_prepend to gcc-cross.inc that sets
> exports those (and extend the do_compile exports) to see if that solves it?

I did the following

diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc 
b/meta/recipes-devtools/gcc/gcc-cross.inc
index aa10633..9a2e06f 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -36,8 +36,14 @@ EXTRA_OECONF_PATHS = "\

  ARCH_FLAGS_FOR_TARGET += 
"-isystem${STAGING_DIR_TARGET}${target_includedir}"

+do_configure_prepend () {
+    export CC="${BUILD_CC}"
+    export CXX="${BUILD_CXX}"
+}
+
  do_compile () {
      export CC="${BUILD_CC}"
+    export CXX="${BUILD_CXX}"
      export AR_FOR_TARGET="${TARGET_SYS}-ar"
      export RANLIB_FOR_TARGET="${TARGET_SYS}-ranlib"
      export LD_FOR_TARGET="${TARGET_SYS}-ld"


(which I think is what you meant) and it did indeed solve the problem.

> Ross


