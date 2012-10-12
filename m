Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TMjQI-0000Ja-EK
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Oct 2012 19:53:22 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 9D796D22BC; Fri, 12 Oct 2012 19:40:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 7A165D22B7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2012 19:39:43 +0200 (CEST)
Message-ID: <507855D7.6080505@linaro.org>
Date: Fri, 12 Oct 2012 19:39:35 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20121003 Thunderbird/15.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1350062247.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1350062247.git.paul.eggleton@linux.intel.com>
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
X-List-Received-Date: Fri, 12 Oct 2012 17:53:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Speaking of modphp:

18:05 hrw@puchatek:build$ bitbake apache2 modphp
Parsing of 1253 .bb files complete (1244 cached, 9 parsed). 1609 targets, 60 skipped, 0 masked, 0 errors.

Build Configuration:
BB_VERSION        = "1.16.0"
TARGET_ARCH       = "aarch64"
TARGET_OS         = "linux"
MACHINE           = "genericarmv8"
DISTRO_VERSION    = "oe-core.0"
TUNE_FEATURES     = "aarch64"
meta-aarch64      = "public:afe73a6c8cb3d8724f66408e707845a0821cfc0d"
meta              = "master:7414cc6fd43249e33483684bc40c2f58d6a94c02"
meta-oe           
meta-webserver    = "master:9e701bb060325bc47509d4874bd695f039191ea8"
meta-linaro       = "master:318cd177663d23e598013f39024bf526d6473125"
toolchain-layer   = "master:9e701bb060325bc47509d4874bd695f039191ea8"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: modphp: No generic license file exists for: PHP in any provider
ERROR: Function failed: do_install (see /home/hrw/HDD/devel/canonical/aarch64/build/tmp-eglibc/work/aarch64-oe-linux/modphp-5.3.14-r1/temp/log.do_install.12308 for further information)
ERROR: Logfile of failure stored in: /home/hrw/HDD/devel/canonical/aarch64/build/tmp-eglibc/work/aarch64-oe-linux/modphp-5.3.14-r1/temp/log.do_install.12308
Log data follows:
| DEBUG: SITE files ['endian-little', 'bit-64', 'arm-common', 'common-linux', 'common-glibc', 'aarch64-linux', 'common']
| DEBUG: Executing shell function do_install
| install: cannot stat `libs/libphp5.so': No such file or directory
| ERROR: Function failed: do_install (see /home/hrw/HDD/devel/canonical/aarch64/build/tmp-eglibc/work/aarch64-oe-linux/modphp-5.3.14-r1/temp/log.do_install.12308 for further information)
ERROR: Task 14 (/home/hrw/HDD/devel/canonical/aarch64/meta-openembedded/meta-webserver/recipes-php/modphp/modphp_5.3.14.bb, do_install) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1075 tasks of which 1068 didn't need to be rerun and 1 failed.
No currently running tasks (1075 of 1080)

Summary: 1 task failed:
  /home/hrw/HDD/devel/canonical/aarch64/meta-openembedded/meta-webserver/recipes-php/modphp/modphp_5.3.14.bb, do_install
Summary: There was 1 WARNING message shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.
18:13 hrw@puchatek:build$ find tmp-eglibc/work/aarch64-oe-linux/modphp-5.3.14-r1/ -name libphp*
tmp-eglibc/work/aarch64-oe-linux/modphp-5.3.14-r1/php-5.3.14/libphp5.la
tmp-eglibc/work/aarch64-oe-linux/modphp-5.3.14-r1/php-5.3.14/.libs/libphp5.a
tmp-eglibc/work/aarch64-oe-linux/modphp-5.3.14-r1/php-5.3.14/.libs/libphp5.la
tmp-eglibc/work/aarch64-oe-linux/modphp-5.3.14-r1/php-5.3.14/.libs/libphp5.lai
tmp-eglibc/work/aarch64-oe-linux/modphp-5.3.14-r1/php-5.3.14/sapi/apache/libphp5.module.in
tmp-eglibc/work/aarch64-oe-linux/modphp-5.3.14-r1/php-5.3.14/sapi/apache_hooks/libphp5.module.in
tmp-eglibc/work/aarch64-oe-linux/modphp-5.3.14-r1/php-5.3.14/libs/libphp5.a
tmp-eglibc/work/aarch64-oe-linux/modphp-5.3.14-r1/php-5.3.14/libs/libphp5.la

Will have to take a look at it on Monday.


