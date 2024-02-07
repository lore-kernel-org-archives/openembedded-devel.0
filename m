Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1081C4828D
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 01:22:57 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.10695.1707268971318500010
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 17:22:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XigHh004;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707268971; x=1738804971;
  h=from:to:cc:subject:date:message-id;
  bh=lU4+gsRhf1EjbrOpa9Sy7t1cJCJRzea8biAMk5PjDrc=;
  b=XigHh0048nkQ5iy7VnskeLCUSPMapoqf5QPlAGlwNh9z/+fYmUNN2pn/
   rM83OzbOZtqJKXx/RoJrXCA6+xeZsEhYueZhxWiaqVHQnInxhDM1laVre
   Jq94b5KDAXgpqIzupoI7RMnLWm+AE8bYq2RQHblYPhUvJgr6FzgHbLHLl
   8OLUq3KMriO4dYC1oRL+SBEsmrXpRlLwlTRcnzlrFF1zegF4HHP/M9wBk
   5Fe+wnf+DIN+KwYerF9vwtd78u4jlIhb8E1EtQfXsNP6aK9DfStoVIS0i
   dt0YXg+EG3yLeY8CCnPl0Fn2YcozAf4htF52sIVAecqJ4l14LEGq25jqV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="128007236"
X-IronPort-AV: E=Sophos;i="6.05,248,1701097200"; 
   d="scan'208";a="128007236"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 10:22:48 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E3B031FA082
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Feb 2024 10:22:46 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 26941CFA5F
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Feb 2024 10:22:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A53B7200932D1
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Feb 2024 10:22:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 575E21A006B;
	Wed,  7 Feb 2024 09:22:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] tcpslice: upgrade 1.6 -> 1.7
Date: Wed,  7 Feb 2024 09:22:12 +0800
Message-Id: <1707268932-12069-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28174.001
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28174.001
X-TMASE-Result: 10--2.984400-10.000000
X-TMASE-MatchedRID: PXzrFdFmygGjz0nOeth/yUIIxwDaU5mr6SmFaeUM9vfozDhGeQC9EiVO
	3uXnDBkUEFRfkXUcAJmBUk0um/9nw+SG32/q3ytjEhGH3CRdKUXoqNj4K1y7ONBNAiN947gzaKY
	jNvWpvU92TKGjRaQBeKuVCdsHobg3h2Em++ruuH9/OBWacv+iVflSepWcgdLPWnq/tYmiZBDSNB
	CKUsVBSXqFHlEgfJyJuFcRhUATSXjtWteqKqfAdfx0ykrbAxjCRzUPAqhCjtjAuQ0xDMaXkN9ku
	tSXDwfHHH8BkCG8K5BjTXyQP0YA4SJcv5X7ObmJdXu122+iJtpV4BnlVId1nZsoi2XrUn/JQYMO
	RuDWAmTfaY87m2dqxydET58jp62Sgp/0SUT77D3lngDLXBETR+tBZ6NjGB4dywzSw6Jr1UO5Xfp
	FoNXmJmYJfAkvxWBUOCjCB9mVFs+YnkR6UXJMnrdMMSXl80vJS7+RMq/2CK6rA4c7UV2fQpvi2P
	QO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Feb 2024 01:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108646

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Use "git archive" for the "make releasetar" process.
- Makefile.in: Add the releasecheck target.
- Cirrus CI: Add the "make releasecheck" command in the Linux task.
- INSTALL.md: Add missing files.
- Makefile.in: Add "make -s install" in the releasecheck target.
- Makefile.in: Add the whitespacecheck target.
- Cirrus CI: Run the "make whitespacecheck" command in the Linux task.
- Makefile.in: Add some missing files in the distclean target.
- autoconf: Add autogen.sh, remove configure and config.h.in.
- autoconf: Require at least autoconf 2.69.
- autoconf: Address most warnings from Autoconf 2.71.
- autoconf: Update install-sh script to the latest available version.
- autoconf: Update config.{guess,sub}, timestamps 2024-01-01
- Fix a build error on Haiku.
- Do the version number the same way as in tcpdump and libpcap.
- Lose unused missing/strlcpy.c.
- Use posix_fadvise() on input files if available.
- Prefer calloc() over malloc().
- Fix --static-pcap-only test on Solaris 10.
- autoconf: replace --with-system-libpcap with --disable-local-libpcap.
- autoconf: Find a local libpcap even with rcX directory suffix
- configure: special-case macOS /usr/bin/pcap-config
- On Solaris, for 64-bit builds, use the 64-bit pcap-config.
- configure: don't use egrep, use $EGREP.
- Add some warning flags for Clang 13 or newer.
- Fix some warnings with -Wmissing-variable-declarations.
- Make various improvements to the instrument functions.
- autoconf: Remove many obsolete elements, including workarounds for BSD/OS,
  IRIX, OSF/1, Solaris, Ultrix and possibly other OSes.
- autoconf: Refine reporting of os-proto.h.
- tcpslice(1): Use bold font more consistently.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tcpdump/{tcpslice_1.6.bb => tcpslice_1.7.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/tcpdump/{tcpslice_1.6.bb => tcpslice_1.7.bb} (87%)

diff --git a/meta-networking/recipes-support/tcpdump/tcpslice_1.6.bb b/meta-networking/recipes-support/tcpdump/tcpslice_1.7.bb
similarity index 87%
rename from meta-networking/recipes-support/tcpdump/tcpslice_1.6.bb
rename to meta-networking/recipes-support/tcpdump/tcpslice_1.7.bb
index 7128a23cd..93197dc3b 100644
--- a/meta-networking/recipes-support/tcpdump/tcpslice_1.6.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpslice_1.7.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://tcpslice.c;endline=20;md5=99519e2e5234d1662a4ce16baa6
 
 SRC_URI = "http://www.tcpdump.org/release/${BP}.tar.gz \
            "
-SRC_URI[sha256sum] = "60d23f00d4c485fef2dda9b12c2018af958df3a511238c45374733bbc1231920"
+SRC_URI[sha256sum] = "e513f0710c4ab45ec627e5df6f7b80d12e488146e1bd500c92247e20ca608903"
 
 UPSTREAM_CHECK_REGEX = "tcpslice-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.34.1


