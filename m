Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id F1FD0731D6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 11:08:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 24 Aug 2016 04:08:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,570,1464678000"; d="scan'208";a="1030527918"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2016 04:08:23 -0700
Date: Wed, 24 Aug 2016 14:07:52 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160824110751.GA20458@mbabyjoh-desk.ger.corp.intel.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Updates to meta-java (master, master-next) in 2016-08-24
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
X-List-Received-Date: Wed, 24 Aug 2016 11:08:24 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

I merged the following commits to master and master-next branches:

commit 216481ba09c187d0b0fc8f864944af6ae026ff73
Author: Erkka K‰‰ri‰ <erkka.kaaria@intel.com>
Date:   Tue Aug 23 11:14:56 2016 +0300

openjdk-8: Fix QA error caused by a missing hash
        
EXTRA_LDFLAGS were not used when building certain shared objects. This
means that the Yocto specific linker flags were lost, which caused build
failures due to a bad hash style QA error.
                        
Signed-off-by: Erkka K‰‰ri‰ <erkka.kaaria@intel.com>
Signed-off-by: Maxin B. John <maxin.john@intel.com>

commit 0f127a49696696ac48c394f84232e7f56b29fbe7
Author: Erkka K‰‰ri‰ <erkka.kaaria@intel.com>
Date:   Mon Aug 15 12:36:20 2016 +0300

openjdk-8-release-102b14.inc: Ignore deprecation
                                       
readdir_r has been deprecated since glibc 2.24. As openjdk uses this
function, a warning is generated during build that gets turned into
an error when -Werror is used.
                                                        
While the readdir function is suggested as an replacement, it has
slightly different API. The warning is ignored instead to prevent any
unexpected breakage from patching the offending functions.
                                                                        
Signed-off-by: Erkka K‰‰ri‰ <erkka.kaaria@intel.com>
Signed-off-by: Maxin B. John <maxin.john@intel.com>

commit 0eeeb059751c00042bd0341d17f5cceddef3c502
Author: Erkka K‰‰ri‰ <erkka.kaaria@intel.com>
Date:   Tue Aug 9 10:32:17 2016 +0300

openjdk-8: Upgrade from u72 to u102
                                                                                        
Openjdk is upgraded from u72 to u102. Two patches are dropped, as these
were backports and the fixes are present in the current version. One
patch was refreshed. One patch was backported from the upcoming u112 to
fix a zero mode crash.
                                                                                                            
Signed-off-by: Erkka K‰‰ri‰ <erkka.kaaria@intel.com>
Signed-off-by: Maxin B. John <maxin.john@intel.com>

commit 0d58a4fb4236edeeeb3f23a66c0c14279066c8bb
Author: Richard Leitner <richard.leitner@skidata.com>
Date:   Tue Aug 16 14:49:00 2016 +0200

openjdk-7: disable IcedTea's auto-downloading

Pass "--enable-downloading=no" to IcedTea's make. This ensures
IcedTea uses the versions and checksums we defined in the openjdk-7-jre
recipe for its "sub-modules".

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
Signed-off-by: Maxin B. John <maxin.john@intel.com>

commit d41d541b4a3c570f6920d1bf44ab8cb651cfd4b7
Author: Maxin B. John <maxin.john@intel.com>
Date:   Tue Aug 16 16:23:56 2016 +0300

README: mention master in supported branches

Along with krogoth, meta-java also works with master branches
of respective layers.

Signed-off-by: Maxin B. John <maxin.john@intel.com>

Best Regards,
Maxin

