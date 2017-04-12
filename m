Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A8FB777C81
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 04:29:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3C4TiIt014339
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Apr 2017 21:29:44 -0700 (PDT)
Received: from [128.224.162.189] (128.224.162.189) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Tue, 11 Apr 2017 21:29:43 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <1491962624-152617-1-git-send-email-dengke.du@windriver.com>
	<0f0d1e28-d0b2-ef82-53b7-868c3d1dc534@windriver.com>
	<bec3152746cc44c18098f5a5c7ffa528@XBOX02.axis.com>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <28bdac6c-9a8b-d5c5-0177-22ed5bb4a96c@windriver.com>
Date: Wed, 12 Apr 2017 12:29:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <bec3152746cc44c18098f5a5c7ffa528@XBOX02.axis.com>
X-Originating-IP: [128.224.162.189]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] crash: 7.1.5 -> 7.1.8
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
X-List-Received-Date: Wed, 12 Apr 2017 04:29:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2017年04月12日 12:03, Peter Kjellerstedt wrote:
>> This patch need to add the "id cc" to HOSTTOOLS in bitbake.conf in
>> oe-core, I will send the patch to oe-core later.
> I doubt you will get either "id" or "cc" accepted into HOSTTOOLS
> in OE-Core. Definitely not "cc" as recipes are expected to use
> ${BUILD_CC} (which uses "gcc") for the host compiler. And probably
Thanks, I find the "cc" come from patch:
     0001-cross_add_configure_option.patch
in ./meta-openembedded/meta-oe/recipes-kernel/crash/crash
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 From cbaaa42933bb27b1bcff4c7d71d54c913201ee88 Mon Sep 17 00:00:00 2001
From: Lei Maohui <leimaohui@cn.fujitsu.com>
Date: Fri, 9 Jan 2015 11:51:18 +0900
Subject: [PATCH] cross_add_configure_option

---
  Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 9c44633..39bebd0 100644
--- a/Makefile
+++ b/Makefile
@@ -232,7 +232,7 @@ gdb_merge: force
         @echo "../../${PROGRAM} ../../${PROGRAM}lib.a" > 
${GDB}/gdb/mergeobj
         @rm -f ${PROGRAM}
         @if [ ! -f ${GDB}/config.status ]; then \
-         (cd ${GDB}; ./configure ${GDB_CONF_FLAGS} 
--with-separate-debug-dir=/usr/lib/debug \
+         (cd ${GDB}; ./configure --host=${GDB_TARGET} 
--build=${GDB_HOST} --with-separate-debug-dir=/usr/lib/debug \
             --with-bugurl="" --with-expat=no --with-python=no 
--disable-sim; \
           make --no-print-directory CRASH_TARGET=${TARGET}; echo 
${TARGET} > crash.target) \
         else make --no-print-directory rebuild; fi
@@ -277,7 +277,7 @@ force:

  make_configure: force
         @rm -f configure
-       @${CC} ${CONF_FLAGS} -o configure configure.c ${WARNING_ERROR} 
${WARNING_OPTIONS}
+       @cc ${CONF_FLAGS} -o configure configure.c ${WARNING_ERROR} 
${WARNING_OPTIONS}

  clean: make_configure
         @./configure ${CONF_TARGET_FLAG} -q -b
-- 
1.8.4.2
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
I will check the above patch now.

The "id" is here:
     https://github.com/crash-utility/crash/blob/master/Makefile#L567

> not "id" unless you have a very good explanation for why it is
> needed. The problem with "id" is that it is typically used to get
> information about the running user, which makes it a problem from
> a deterministic view. Also, since nothing in OE-Core requires "id",
> there is no reason to add it there. It could be added to layer.conf
> in meta-oe, but the concerns about determinism still stands.
>
> //Peter
>
>


