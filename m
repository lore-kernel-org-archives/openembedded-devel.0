Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5758DCD4F58
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 10:19:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.18544.1695377960065652485
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 03:19:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=lkZahuND;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695377963; x=1726913963;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=gh9n+a3kTgo9/wI9U9HQIadDOjwLM44969tD+7jEn6I=;
  b=lkZahuNDIL9P5ZldbLvFawmBx62VIUrKEAUSBoSIQzl4EKnaSvSHtUJl
   hkqCO5BCx4CWaWzBTfzM15urIf8jFOJjDNMaSPJ3valff3uaffqQ65kmT
   IWuSUuDoYfh6AeKdoULJYAGy97BRWx0Txzs3vqLMeGXQkQhUiP2VPEoty
   Tj4FvZ2VtiEPcoX7IuOqfJzp7m8fECe38ghBW/jmwiOOUWKcdxarxOGWl
   Pb6gBm5KR3MmB96Xc8cCaQQnfvKspOMnZLrn0bA6wOWGbwSMcjZj3vDnV
   2gb67fxyTBe0W4dMXq5W2GsHWuDJrgQHkGWZiTsanMjrLdo4tV1Z8O5uK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="383543004"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="383543004"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 03:19:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="817729067"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="817729067"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga004.fm.intel.com with ESMTP; 22 Sep 2023 03:19:22 -0700
From: chee.yang.lee@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 5/5] libvncserver: update to 0.9.14
Date: Fri, 22 Sep 2023 17:59:41 +0800
Message-Id: <20230922095941.3958983-5-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230922095941.3958983-1-chee.yang.lee@intel.com>
References: <20230922095941.3958983-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 10:19:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105054

From: Lee Chee Yang <chee.yang.lee@intel.com>

0.9.14 represents a gradual improvement over 0.9.13 with lots of
developments all over the place. 40 issues and pull requests were
closed/merged with this release. Highlights on the LibVNCServer side are
a refined multi-threaded implementation, support for Unicode clipboard
data 📋❗ and an outbound-connection machinery that works for real world
use cases. LibVNCClient received support for SetDesktopSize (which had
been added server-side in 0.9.13) and a properly documented
SSH-tunneling setup.

Overall changes:
Added more documentation (build system integration, repeater setup) and
a legal FAQ.
Added contribution guidelines.
Ported the TravisCI continous integration machinery to GitHub workflows.

LibVNCServer/LibVNCClient:
Added qemu extended key event support.
Fixed several potential multiplication overflows.

LibVNCClient:
Fixes of several memory leaks and buffer overflows.
Added UltraVNC's MSLogonII authentication scheme.
Fixed TLS interoperability with GnuTLS servers.
Fixed detection of newer UltraVNC and TightVNC servers.
Added support for SetDesktopSize.
Added SSH tunneling example using libssh2.
Added some extensions to VeNCrypt in order to be compatible with a wider
range of servers.

LibVNCServer:
Fixes to the multi-threaded server implementation which should be a lot
more sound now.
Fixed TightVNC-filetransfer file upload for 64-bit systems.
Fixes of crashes in the zlib compression.
Added support for UTF8 clipboard data.
Fixed visual artifacts in framebuffer on ARM platforms.
Fixed several WebSockets bugs.
Fixed the UltraVNC-style repeater example.
Added support for larger framebuffers (two 4k screens possible now).
Added support for timeouts for outbound connections (to repeaters for
instance).
Fixed out-of-bounds memory access in Tight encoding.

Update include fix for CVE-2020-29260
https://github.com/LibVNC/libvncserver/commit/bef41f6ec4097a8ee094f90a1b34a708fbd757ec

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../{libvncserver_0.9.13.bb => libvncserver_0.9.14.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libvncserver/{libvncserver_0.9.13.bb => libvncserver_0.9.14.bb} (97%)

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.13.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
similarity index 97%
rename from meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.13.bb
rename to meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
index 93f6951739..50bdad57d5 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.13.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
@@ -45,7 +45,7 @@ FILES:libvncclient = "${libdir}/libvncclient.*"
 inherit cmake
 
 SRC_URI = "git://github.com/LibVNC/libvncserver;branch=master;protocol=https"
-SRCREV = "2aa20dad4c23c18948d3f63b33f9dfec1f837729"
+SRCREV = "10e9eb75f73e973725dc75c373de5d89807af028"
 
 S = "${WORKDIR}/git"
 
-- 
2.37.3


