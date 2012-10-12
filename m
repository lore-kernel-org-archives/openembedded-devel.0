Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TMjiO-00014m-Bd
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Oct 2012 20:12:04 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Oct 2012 10:58:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,577,1344236400"; d="scan'208";a="226201377"
Received: from unknown (HELO helios.localnet) ([10.252.122.39])
	by orsmga002.jf.intel.com with ESMTP; 12 Oct 2012 10:58:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Fri, 12 Oct 2012 18:58:49 +0100
Message-ID: <3713695.RcKMCbUqi3@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-31-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <507855D7.6080505@linaro.org>
References: <cover.1350062247.git.paul.eggleton@linux.intel.com>
	<507855D7.6080505@linaro.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH 0/2] modphp fixes
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
X-List-Received-Date: Fri, 12 Oct 2012 18:12:04 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 12 October 2012 19:39:35 Marcin Juszkiewicz wrote:
> Speaking of modphp:
> 
> 18:05 hrw@puchatek:build$ bitbake apache2 modphp
> Parsing of 1253 .bb files complete (1244 cached, 9 parsed). 1609 targets, 60
> skipped, 0 masked, 0 errors.
> 
> Build Configuration:
> BB_VERSION        = "1.16.0"
> TARGET_ARCH       = "aarch64"
> TARGET_OS         = "linux"
> MACHINE           = "genericarmv8"
> DISTRO_VERSION    = "oe-core.0"
> TUNE_FEATURES     = "aarch64"
> meta-aarch64      = "public:afe73a6c8cb3d8724f66408e707845a0821cfc0d"
> meta              = "master:7414cc6fd43249e33483684bc40c2f58d6a94c02"
> meta-oe
> meta-webserver    = "master:9e701bb060325bc47509d4874bd695f039191ea8"
> meta-linaro       = "master:318cd177663d23e598013f39024bf526d6473125"
> toolchain-layer   = "master:9e701bb060325bc47509d4874bd695f039191ea8"
> 
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> WARNING: modphp: No generic license file exists for: PHP in any provider
> ERROR: Function failed: do_install (see
> /home/hrw/HDD/devel/canonical/aarch64/build/tmp-eglibc/work/aarch64-oe-linu
> x/modphp-5.3.14-r1/temp/log.do_install.12308 for further information) ERROR:
> Logfile of failure stored in:
> /home/hrw/HDD/devel/canonical/aarch64/build/tmp-eglibc/work/aarch64-oe-linu
> x/modphp-5.3.14-r1/temp/log.do_install.12308
> Log data follows:
> | DEBUG: SITE files ['endian-little', 'bit-64', 'arm-common',
> | 'common-linux', 'common-glibc', 'aarch64-linux', 'common'] DEBUG:
> | Executing shell function do_install
> | install: cannot stat `libs/libphp5.so': No such file or directory
> | ERROR: Function failed: do_install (see
> | /home/hrw/HDD/devel/canonical/aarch64/build/tmp-eglibc/work/aarch64-oe-li
> | nux/modphp-5.3.14-r1/temp/log.do_install.12308 for further information)
> ERROR: Task 14
> (/home/hrw/HDD/devel/canonical/aarch64/meta-openembedded/meta-webserver/rec
> ipes-php/modphp/modphp_5.3.14.bb, do_install) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 1075 tasks of which 1068 didn't need to be
> rerun and 1 failed. No currently running tasks (1075 of 1080)
> 
> Summary: 1 task failed:
>  
> /home/hrw/HDD/devel/canonical/aarch64/meta-openembedded/meta-webserver/reci
> pes-php/modphp/modphp_5.3.14.bb, do_install Summary: There was 1 WARNING
> message shown.
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> 18:13 hrw@puchatek:build$ find
> tmp-eglibc/work/aarch64-oe-linux/modphp-5.3.14-r1/ -name libphp*
> tmp-eglibc/work/aarch64-oe-linux/modphp-5.3.14-r1/php-5.3.14/libphp5.la
> tmp-eglibc/work/aarch64-oe-linux/modphp-5.3.14-r1/php-5.3.14/.libs/libphp5.
> a
> tmp-eglibc/work/aarch64-oe-linux/modphp-5.3.14-r1/php-5.3.14/.libs/libphp5.
> la
> tmp-eglibc/work/aarch64-oe-linux/modphp-5.3.14-r1/php-5.3.14/.libs/libphp5.
> lai
> tmp-eglibc/work/aarch64-oe-linux/modphp-5.3.14-r1/php-5.3.14/sapi/apache/li
> bphp5.module.in
> tmp-eglibc/work/aarch64-oe-linux/modphp-5.3.14-r1/php-5.3.14/sapi/apache_ho
> oks/libphp5.module.in
> tmp-eglibc/work/aarch64-oe-linux/modphp-5.3.14-r1/php-5.3.14/libs/libphp5.a
> tmp-eglibc/work/aarch64-oe-linux/modphp-5.3.14-r1/php-5.3.14/libs/libphp5.l
> a
> 
> Will have to take a look at it on Monday.

Looks like it thinks it's supposed to be producing static libraries for some 
reason - when I build here (for qemuarm at the moment) I have these files:

[paul@morpheus php-5.3.14]$ find . -name 'libphp*'
./libs/libphp5.so
./libs/libphp5.la
./sapi/apache_hooks/libphp5.module.in
./sapi/apache/libphp5.module.in
./.libs/libphp5.lai
./.libs/libphp5.so
./.libs/libphp5.la
./libphp5.la

Not sure what would cause that specifically, but it's a clue at least.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


