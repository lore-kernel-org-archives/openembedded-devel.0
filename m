Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1RELaj-0007vZ-SP
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Oct 2011 15:44:58 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id C24A716608B5; Thu, 13 Oct 2011 07:39:12 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 79D9816601A1;
	Thu, 13 Oct 2011 07:39:10 -0600 (MDT)
Message-ID: <4E96E9FE.1060005@mlbassoc.com>
Date: Thu, 13 Oct 2011 07:39:10 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:7.0.1) Gecko/20110930 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Can't build libcgroup
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Oct 2011 13:44:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Trying to follow the Angstrom instructions directly.

OE Build Configuration:
BB_VERSION        = "1.13.3"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "beagleboard"
DISTRO            = "angstrom"
DISTRO_VERSION    = "v2011.10-core"
TUNE_FEATURES     = "armv7a vfp neon cortexa8"
TARGET_FPU        = "vfp-neon"
meta-angstrom     = "master:66263650f8548d6b0b5f593ab728f536d5e05a9f"
meta-oe
meta-efl
meta-gpe
meta-gnome
meta-xfce         = "master:1e5d73ec4f44200104de085838f04e31a49435da"
meta-ti           = "master:3530f1025efc3792334b897a4e70c6d5822ef56d"
meta              = "master:5ad1ca59dea6d5045f252ed7b786ad193faced64"

Fails with this error:
| ccache arm-angstrom-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 -mthumb-interwork -mno-thumb 
--sysroot=/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard -DHAVE_CONFIG_H -I. -I.. -I../include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c 
walk_test.c
| libcg_ba.cpp:18:18: fatal error: string: No such file or directory
| compilation terminated.
| make[2]: *** [libcg_ba.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| make[2]: Leaving directory `/home/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcgroup-0.37.1/tests'

Full compile log at http://www.mlbassoc.com/oe/libcgroup-log.do_compile

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


