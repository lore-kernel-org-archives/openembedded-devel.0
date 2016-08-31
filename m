Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A13E560746
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 08:43:48 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 31 Aug 2016 01:43:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,261,1470726000"; d="scan'208";a="872914056"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga003.jf.intel.com with ESMTP; 31 Aug 2016 01:43:48 -0700
Date: Wed, 31 Aug 2016 11:43:29 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160831084329.GA27198@mbabyjoh-desk.ger.corp.intel.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Updates to meta-java (master, master-next) in 2016-08-30
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
X-List-Received-Date: Wed, 31 Aug 2016 08:43:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Merged the following commits to master and master-next branches:

commit 8c663efa4f8efccf50d094dbc61c7b78031b3b7d
Author: Kyle Russell <bkylerussell@gmail.com>
Date:   Wed Aug 24 09:28:40 2016 -0400

Reimplement helper method for parallelizing JDK builds
        
Simplifies duplicated implementation across multiple recipes that all
inherited from java.bbclass.
                    
Previously implementation was not flexible in supporting other make
job-limiting flags (like -l for load) that are typically passed in
through PARALLEL_MAKE.  (OpenJDK doesn't know about these other flags
that might have gotten tagged on after the value for -j.)
                                        
Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
Signed-off-by: Maxin B. John <maxin.john@intel.com>

commit b2827bf00734331fa6776909e2bfee8f94790fda
Author: Kyle Russell <bkylerussell@gmail.com>
Date:   Fri Aug 19 17:58:01 2016 -0400

rhino-native should depend on classpath-native
                                             
rhino's do_compile task passes
${STAGING_DATADIR_NATIVE}/classpath/glibj.zip to javac.  This glibj.zip
archive comes from the classpath-native package.
                                                                        
Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
Signed-off-by: Maxin B. John <maxin.john@intel.com>

commit 7d9264ca45076b0a0e52e9072989003c0687bda4
Author: Richard Leitner <richard.leitner@skidata.com>
Date:   Tue Aug 16 16:51:28 2016 +0200
openjdk-7: update to IcedTea 2.6.5 OpenJDK 7u99b00
                                                                                       
 OpenJDK 7 is updated from from 91b01 (IcedTea 2.6.2) to 99b00 (IcedTea
 2.6.5). This update introduces following security updates:
 * Mar 2016 (IcedTea 2.6.5, OpenJDK 7 u99)  [1]
 * Jan 2016 (IcedTea 2.6.4, OpenJDK 7 u95)  [2]
 * Oct 2015 (IcedTea 2.6.3, OpenJDK 7 u91)  [3]
                                                                                                                   
 Due to the fact some "byte behavior improvements" were not ported to
 the ARM32-JIT in IcedTea 2.6.6 yet [6], [7]  we need to stick IcedTea
 2.6.5 for now.
                                                                                                                      
 [1]http://blog.fuseyism.com/index.php/2016/03/25/security-icedtea-2-6-5-for-openjdk-7-released/
 [2]http://blog.fuseyism.com/index.php/2016/01/21/security-icedtea-2-6-4-for-openjdk-7-released/
 [3]http://blog.fuseyism.com/index.php/2015/11/17/security-icedtea-2-6-3-for-openjdk-7-released/
 [6]http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=2942
 [7]http://icedtea.classpath.org/hg/release/icedtea7-forest-2.6/hotspot/rev/1c5c4564204e
                                                                                                                                                          
 Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
 Signed-off-by: Maxin B. John <maxin.john@intel.com>

 Best Regards,
 Maxin

