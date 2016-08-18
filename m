Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D59C4760AC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 12:25:33 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 18 Aug 2016 05:25:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,539,1464678000"; d="scan'208";a="750410772"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Aug 2016 05:25:32 -0700
Date: Thu, 18 Aug 2016 15:26:55 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160818122655.GB16863@mbabyjoh-desk.ger.corp.intel.com>
References: <1471253780-28526-1-git-send-email-erkka.kaaria@intel.com>
	<1471253780-28526-2-git-send-email-erkka.kaaria@intel.com>
MIME-Version: 1.0
In-Reply-To: <1471253780-28526-2-git-send-email-erkka.kaaria@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-java][PATCH v2 2/2] openjdk-8-release-102b14.inc: Ignore deprecation
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
X-List-Received-Date: Thu, 18 Aug 2016 12:25:37 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Erkka,

On Mon, Aug 15, 2016 at 12:36:20PM +0300, Erkka Kääriä wrote:
> readdir_r has been deprecated since glibc 2.24. As openjdk uses this
> function, a warning is generated during build that gets turned into
> an error when -Werror is used.

Yes, this fixes the build error that we got with the first version. Thank you!

However,we are getting another QA Error with the build:

ERROR: openjre-8-102b14-r0 do_package_qa: QA Issue: No GNU_HASH in the elf binary: '/media/poky/build/tmp/work/core2-64-poky-linux/openjre-8/102b14-r0/packages-split/openjre-8/usr/lib/jvm/openjre-8/lib/amd64/libjsig.so'
No GNU_HASH in the elf binary: '/media/poky/build/tmp/work/core2-64-poky-linux/openjre-8/102b14-r0/packages-split/openjre-8/usr/lib/jvm/openjre-8/lib/amd64/server/libjvm.so' [ldflags]
ERROR: openjre-8-102b14-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.
ERROR: openjre-8-102b14-r0 do_package_qa: Function failed: do_package_qa
ERROR: Logfile of failure stored in: /media/poky/build/tmp/work/core2-64-poky-linux/openjre-8/102b14-r0/temp/log.do_package_qa.22839
ERROR: Task /home/maxin/clone/meta-java/recipes-core/openjdk/openjre-8_102b14.bb:do_package_qa (/home/maxin/clone/meta-java/recipes-core/openjdk/openjre-8_102b14.bb:do_package_qa) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1344 tasks of which 1332 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory

<snip>

Could you please look into this ?

Best Regards,
Maxin

