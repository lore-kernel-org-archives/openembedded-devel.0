Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.4696.1600830190954660145
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Sep 2020 20:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: leM1cYAufgXKUD5qpj/kzKrtVtEN3F0J6qbMCWKgn9hBx+A5gysikgVc0j8H9S6x6USVtwjUTF
 8CLRhApZP8nw==
X-IronPort-AV: E=McAfee;i="6000,8403,9752"; a="222360628"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; 
   d="scan'208";a="222360628"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2020 20:03:09 -0700
IronPort-SDR: zJ7+U8/zc1SgRa5rvnLcQht9Sl7k2Dwx9633s2FH6tt3Si1O8lWRnMTXgdENm8jTZ45jPthnc+
 OWRzX+R48PMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; 
   d="scan'208";a="322453825"
Received: from andromeda01.png.intel.com (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.10])
  by orsmga002.jf.intel.com with ESMTP; 22 Sep 2020 20:03:08 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] ace : improve reproducibility
Date: Wed, 23 Sep 2020 11:03:07 +0800
Message-Id: <20200923030307.75891-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

improve ace and ace-dbg package reproducibility.

some diffoscope output from deb package :
│ │ │ │ -  0x0000c860 75696c64 2d636c61 6e672f74 6d702f77 uild-clang/tmp/w
│ │ │ │ -  0x0000c870 6f726b2f 736b796c 616b652d 36342d70 ork/skylake-64-p
│ │ │ │ -  0x0000c880 6f6b792d 6c696e75 782f6163 652f362e oky-linux/ace/6.
│ │ │ │ -  0x0000c890 352e3130 2d72302f 4143455f 77726170 5.10-r0/ACE_wrap
│ │ │ │ -  0x0000c8a0 70657273 2f616365 2f4d6f6e 69746f72 pers/ace/Monitor
│ │ │ │ -  0x0000c8b0 5f436f6e 74726f6c 2f4e756d 5f546872 _Control/Num_Thr
│ │ │ │ -  0x0000c8c0 65616473 5f4d6f6e 69746f72 2e637070 eads_Monitor.cpp
│ │ │ │ -  0x0000c8d0 00000000 00000000 4e756d20 74687265 ........Num thre
│ │ │ │ +  0x0000c860 75696c64 2d636c61 6e672d32 2f746d70 uild-clang-2/tmp
│ │ │ │ +  0x0000c870 2f776f72 6b2f736b 796c616b 652d3634 /work/skylake-64
│ │ │ │ +  0x0000c880 2d706f6b 792d6c69 6e75782f 6163652f -poky-linux/ace/
│ │ │ │ +  0x0000c890 362e352e 31302d72 302f4143 455f7772 6.5.10-r0/ACE_wr
│ │ │ │ +  0x0000c8a0 61707065 72732f61 63652f4d 6f6e6974 appers/ace/Monit
│ │ │ │ +  0x0000c8b0 6f725f43 6f6e7472 6f6c2f4e 756d5f54 or_Control/Num_T
│ │ │ │ +  0x0000c8c0 68726561 64735f4d 6f6e6974 6f722e63 hreads_Monitor.c
│ │ │ │ +  0x0000c8d0 70700000 00000000 4e756d20 74687265 pp......Num thre

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta-oe/recipes-connectivity/ace/ace_6.5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/ace/ace_6.5.10.bb b/meta-oe/recipes-connectivity/ace/ace_6.5.10.bb
index df194f95a0..80ae363dc5 100644
--- a/meta-oe/recipes-connectivity/ace/ace_6.5.10.bb
+++ b/meta-oe/recipes-connectivity/ace/ace_6.5.10.bb
@@ -23,7 +23,7 @@ export ACE_ROOT="${WORKDIR}/ACE_wrappers"
 inherit pkgconfig
 
 CXXFLAGS_append = " -fpermissive -Wnodeprecated-declarations"
-
+CXX_append = " -ffile-prefix-map=${WORKDIR}= -fdebug-prefix-map=${WORKDIR}= "
 EXTRA_OEMAKE += "INSTALL_LIB=${baselib}"
 
 do_install() {
-- 
2.17.1

