Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56561C54E69
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:26 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.8211.1710827176492809700
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=N4/xSWLP;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827177; x=1742363177;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=mHvSB6zr1Hncm1D4i80wcE0Hnl2pzm+P2dewRZ3/+wE=;
  b=N4/xSWLPUpyUA0+EcGnhRC7imbR4YsTAEQ5vQFGSnuN9CGpM4SRuar5Y
   Ckyn3brpyIlg/qjUkfkk89b04vgCCCuba29hEp1A/YpHra+WGNrMj7B2I
   6gOPJnNarufG7gI+ecNehaG6SVJaCetgRHGjXut1UkX/xZiBcA6IOxbv6
   +aud4ba5JeKhaoH+0j2nJm0h9uFb/VOrciw3jnuI9GFrBd1sFFujw8COH
   Wm0OeqPKGhFOlLM2C94hL9ZMCvr0wE6373wqeJip8wYfyawyXDjRzS/iQ
   FzpKe/4RCPuN6XEfJl+Cm/MQd8BgA5J9sMjiQQh7PXr9JwZvmhhUmRSZU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="152562761"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="152562761"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:15 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 57ED8D4806
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:12 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4B50ABF4A9
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DB79E2009325C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 864B81A006B;
	Tue, 19 Mar 2024 13:46:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/50] libreport: upgrade 2.17.11 -> 2.17.15
Date: Tue, 19 Mar 2024 13:44:59 +0800
Message-Id: <1710827139-30056-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10--6.856700-10.000000
X-TMASE-MatchedRID: 6IstDyeExSCjz0nOeth/yUIIxwDaU5mrHFPG4NRqDFvZGPiiG8TMc12d
	sxCRbuoBq9YyptElK5eRpyyb1/36gIhyMNGalAO45TBV9C2UM3EnhzAhgvoq57qln+jYe7Zhc7D
	+O59v66sYvLOaE4VFHebFb89O3VxTXOxJ61hzipYs/CK1k8l04xfr23AsHsPclPH7Ysio2a3TI4
	8G/UH1dggvGgJhnjupVdNPsIcMVUMv+0FNnM7lDRIRh9wkXSlFkdS3kPlaZyXVtKZKT0dQ2g7oY
	cfGGBkPF9I3HgybRyEyh2C7EeKtCx8TzIzimOwPur1QVFMnSQrEQdG7H66TyH4gKq42LRYkCQEB
	j/x6Osydo6SObrq62FI42gJGkjVpcC6Sl9b+PNp+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109425

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
### Changed
- reporter-bugzilla: Improve bug formatting
- reporter-bugzilla: Reduce number of duplicate bug reports

### Fixed
- reporter-bugzilla: Fail gracefully if API key contains invalid characters
- reporter-bugzilla: Fix creating binary attachments
- reporter-bugzilla: Fix loading configuration
- Exclude coredump archives when creating a bug
- reporter-upload: Fix double free crash
- gui-wizard-gtk: Enable word wrap for comments
- Fix compatibility with libxml2 2.12
- Fix multiple problems with the test suite

### Added
- Add support for unpacking coredumps in the problem directory
- Add "MEMORY_PRESSURE_WATCH" to the list of ignored words

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libreport/{libreport_2.17.11.bb => libreport_2.17.15.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libreport/{libreport_2.17.11.bb => libreport_2.17.15.bb} (96%)

diff --git a/meta-oe/recipes-extended/libreport/libreport_2.17.11.bb b/meta-oe/recipes-extended/libreport/libreport_2.17.15.bb
similarity index 96%
rename from meta-oe/recipes-extended/libreport/libreport_2.17.11.bb
rename to meta-oe/recipes-extended/libreport/libreport_2.17.15.bb
index 322075cd6..28c64a161 100644
--- a/meta-oe/recipes-extended/libreport/libreport_2.17.11.bb
+++ b/meta-oe/recipes-extended/libreport/libreport_2.17.15.bb
@@ -17,7 +17,7 @@ SRC_URI += "file://0001-Makefile.am-remove-doc-and-apidoc.patch \
             file://0004-configure.ac-remove-prog-test-of-augparse.patch \
 "
 
-SRCREV = "d58110e1fc663c92ac3e36b166f114b6904796ff"
+SRCREV = "f6bb06a699617d078fcd4f8b71b4d063bf47b52b"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.34.1


