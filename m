Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC89E77197
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 03:40:08 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.11176.1736307597903709386
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 19:39:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dxP8iGoZ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736307598; x=1767843598;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hxaXbvXYKViY/gqV2H8TQjr52IsPvfsV8wp58FWf6ME=;
  b=dxP8iGoZ17L5Tz6xzNgavfBo2XnnuqHde1NdZ/0xHbU1SNb607/6NVV6
   ejRMTocfviwzrQRwGrNb82WQ/6BqCJr0shJaeY0ugFA+cgQ49LY8O5W/f
   HXKPG9Nm9dN5tapxDp1UGQ+jxymEdQrqZ3zuzUAlJfxIQr+Srs8hYc/Co
   a8vY2/QyGIQf+bT5uAzNkrDeYvDpoODxaCeOBMm7NtkrYLqm5Cqk8oUAq
   Ofd80dTLpp//ltKKMuXtzu31dQvJhYujMiRCqnSjlHFnW+KClvFp72HPA
   989SdLN46yG628MyjPMBkUhVqHxNOZQ2g+r2nIFqfdGubhoYKZfd4uVp1
   w==;
X-CSE-ConnectionGUID: kL0Hvu1LSee/Hmxmnhpd2w==
X-CSE-MsgGUID: 3eBMLGF3QCOgq4MljYQA/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="174268897"
X-IronPort-AV: E=Sophos;i="6.12,297,1728918000"; 
   d="scan'208";a="174268897"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 12:39:55 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3BEEA96741
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jan 2025 12:39:53 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0E619F76B
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jan 2025 12:39:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8A45070B0C
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jan 2025 12:39:52 +0900 (JST)
Received: from ubuntu24.04 (unknown [10.193.130.22])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E59911A006C;
	Wed,  8 Jan 2025 11:39:51 +0800 (CST)
From: leimaohui@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [meta-oe][PATCH gjs: Deleted gsettings from gsettings. Because gsettings shouldn't be added and it causes an error in do_rootfs.
Date: Wed,  8 Jan 2025 11:39:47 +0800
Message-ID: <20250108033948.8611-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28910.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28910.004
X-TMASE-Result: 10--3.867400-10.000000
X-TMASE-MatchedRID: 1R9VFVb99ibjKECcYI0+Nf7FEhWgo0y8a9qiaDSLgo0d/7Rjf2mGgdnf
	JrUSEbFD8dT+Fcnsz3dztxUQS8urp8e3wV6A2hch8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDJXp3iGchmp4oI+xZY+0lxrxBNI9kTkfyCxlpnlQFCyh30tCKdnhB58ZYJ9vPJ1vSBp7q
	EhmmPgy46HM5rqDwqtzJKrbq/pAq+ZlhtVLDSb0Z70RzDowgPEI8lP2vLSZYprg6GakTMdxcKZu
	9aOokSXPywh033casYNfb33DrrkJZPHe8DOO3eF9UElV5SMCCrLt16YWtxzeF9NpZbddHv73iGQ
	YUPZme7O51vq1xhTsg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jan 2025 03:40:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114734

From: Lei Maohui <leimaohui@fujitsu.com>

%post(gjs-1.82.1-r0.aarch64): scriptlet start
%post(gjs-1.82.1-r0.aarch64): execv(/bin/sh) pid 217720
+ set -e
+ glib-compile-schemas /datadrive/workdir/build-dir/build-daily/tmp/work/armv8-linux/all-test/rr/rootfs/usr/share/glib-2.0/schemas
Error opening directory “/datadrive/workdir/build-dir/build-daily/tmp/work/armv8-linux/all-test/rr/rootfs/usr/share/glib-2.0/schemas”: No such
file or directory

......

ERROR: Postinstall scriptlets of ['gjs'] have failed. If the intention is to defer them to first boot,
then please place them into pkg_postinst_ontarget:${PN} ().
Deferring to first boot via 'exit 1' is no longer supported.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta-gnome/recipes-gnome/gjs/gjs_1.82.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.82.1.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.82.1.bb
index c4bccbe7b..55af04e4a 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.82.1.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.82.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8dcea832f6acf45d856abfeb2d51ec48"
 
 DEPENDS = "mozjs-128 cairo"
 
-inherit gnomebase gsettings gobject-introspection gettext features_check upstream-version-is-even pkgconfig
+inherit gnomebase gobject-introspection gettext features_check upstream-version-is-even pkgconfig
 
 SRC_URI[archive.sha256sum] = "fb39aa5636576de0e5a1171f56a1a5825e2bd1a69972fb120ba78bd109b5693c"
 SRC_URI += " \
-- 
2.43.0


