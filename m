Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 646C6C54E60
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:26 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.8212.1710827179463273382
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WynaURgw;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827179; x=1742363179;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=+mlUEkTJi+hlnvOK1vNsJrYyAV668KcNvEPx3qta/Jc=;
  b=WynaURgwEhgz8bNf0tH0lhdaDYagcwyQ7Oo8kgSUc0VAAQZaqYazoxzg
   6xrI39T5vUOhC/MyKJTebNmmSMv9/GTKf9N/Z96UpXEQJoIoP+NoyIFT2
   c07fXn7u8i8HRNSmuYoVKhqL4iS3yaAu/R3oAKYr4g3HvMLRG3WkGLJCT
   T856KTnaZDoArds0fPKamh+XWIuUmuPIcjzcmmlaBoGHbnUPNR7SObB6D
   qCG768cglU9JZnuZjVjaulEARgLzmnhu0bGMFdOx0ehJj7JUYjOus9alD
   CY8o9oC9NCoHQVXqLy9WHIoHT+9bpRUOE5PlAblZ/gZ2tQtPibNEGjW5y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="152721841"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="152721841"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:17 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id D4351D4805
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:14 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C096D9941
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 90D3A2235E1
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3A3D01A006B;
	Tue, 19 Mar 2024 13:46:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 13/50] networkd-dispatcher: upgrade 2.1 -> 2.2.4
Date: Tue, 19 Mar 2024 13:45:02 +0800
Message-Id: <1710827139-30056-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10-1.018000-10.000000
X-TMASE-MatchedRID: Sudfee3ORQqjz0nOeth/yUIIxwDaU5mr2FA7wK9mP9fGsuYyb68ajBH6
	cbAZmiKWjDVMw6TJvuGj5B60ph6fZxh0IW3DI+ouKsurITpSv+OTjlc0Xf11TkfyM5VfgjG2aba
	V5QfPKhf7DtvynCay74lUNlX//hgVGj8XjDB40G5bF+jvJlkOprTrV2IG143XyIKHzIGoT60Zid
	1Se2rOSDsXiitJ1OqM2x4ocHMSNYTtWteqKqfAdfx0ykrbAxjCRzUPAqhCjth2SRW/QXBz2xskA
	daEfeQKRrhA8w8T1IQoz8i7TDiE8XLtiGC0DcD/b056mCmF00Z9LQinZ4QefCP/VFuTOXUTKYOc
	jnHaFYKOhzOa6g8KrdIWYCI+j/soyQ2jm3UZ+vDF6RLsKE0giq98GYA+mzrTZgI29arhW+HoqG1
	tTs8xSDrF5EhwoV2TLoTVQrqNoe/noOkGQNI1Qx0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuEV
	M/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109429

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Improve performance when getting interface status
- update project URL
- Add environment variables to manpage.
- Don't start the daemon if there's nothing to do
- _interface_scan: fix wrong index into iface map
- _interface_scan: force handle_state for new interfaces
- Add missing administrative state 'initialized'
- use os.path.dirname instead of os.path.basename
- make sure scripts are not writeable by non-root users
- don't allow unknown operational/admin states (CVE-2022-29799, CVE-2022-29800)
- Fix missing word in exception message
- fix some new linting issues from pylint
- manpage: fix missing slash in "configured.d" directory name
- Normalize parsed IP address value
- Drop support for Python 3.4
- Add testing for Python 3.10
- README.md: fix code formatting

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{networkd-dispatcher_2.1.bb => networkd-dispatcher_2.2.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/networkd-dispatcher/{networkd-dispatcher_2.1.bb => networkd-dispatcher_2.2.4.bb} (95%)

diff --git a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.1.bb b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.2.4.bb
similarity index 95%
rename from meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.1.bb
rename to meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.2.4.bb
index 65bf91c7e..f0f7eb5df 100644
--- a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.1.bb
+++ b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.2.4.bb
@@ -11,7 +11,7 @@ inherit features_check systemd
 RDEPENDS:${PN} = "python3-pygobject python3-dbus"
 REQUIRED_DISTRO_FEATURES = "systemd gobject-introspection-data"
 
-SRCREV = "30e278e50749a60a930ceaa0971207c6436b8a0c"
+SRCREV = "dfd26d72793914eb3da910ef8c71de6d7c8942a2"
 SRC_URI = "git://gitlab.com/craftyguy/networkd-dispatcher;protocol=https;nobranch=1"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


