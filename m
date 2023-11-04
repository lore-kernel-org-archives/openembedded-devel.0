Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6211C41535
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 04:20:56 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.4225.1699071646726897414
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 21:20:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=E420ELkE;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=W9qOX3Ol;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b988fd8e7-40198b50-dfaf-4c81-8858-92d5bece2a22-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699071646;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=J45s4UllY86sXvzi/e38o1G3VU3+BXVlR061Yd4mqT4=;
	b=E420ELkEZpOL8KtKqPPQdEIMYY/lPuJm4rnPanAzkWZ1a0Q3lR4aDo8GP+d3QaA5
	JP/84Zwm+nNZRa7dhIDj3ngBSOzlSyqpV4/v+oFz9SBxd5sRuDtKylc2FlCflAfEfwh
	NvfHL4fCe17zQ1uKWOScsMfA2sQwnlWiqOIMy9DY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699071646;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=J45s4UllY86sXvzi/e38o1G3VU3+BXVlR061Yd4mqT4=;
	b=W9qOX3Oly7gRSFWYW8/MzFWWaiYchcTfgFNvgRaY/0lePhzwpu57CbGSzC4sc1yw
	FUhaDHo1tEn0fAkVMySJ2g0nvsEF/2BXUMMsOHn3jiBIW+swkN1uG1vyP9k7/AEXBT6
	sFHsLO4Z7gyWa+7YJP6pAn9r6XuB3voxQqAgySe4=
Content-Type: multipart/mixed; boundary="===============6670046778040613309=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] dav1d: upgrading to 1.3.0 SUCCEEDED
Message-ID: <0101018b988fd8e7-40198b50-dfaf-4c81-8858-92d5bece2a22-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 04:20:45 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 04:20:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106236

--===============6670046778040613309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dav1d* to *1.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dav1d-upgrade-1.2.0-1.3.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 07809d72eb71ce79ad3ae9ff7be7e3418b72c0c3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 03:15:56 +0000
Subject: [PATCH] dav1d: upgrade 1.2.0 -> 1.3.0

---
 .../recipes-multimedia/dav1d/{dav1d_1.2.0.bb => dav1d_1.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/dav1d/{dav1d_1.2.0.bb => dav1d_1.3.0.bb} (89%)

diff --git a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.2.0.bb b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.3.0.bb
similarity index 89%
rename from meta-multimedia/recipes-multimedia/dav1d/dav1d_1.2.0.bb
rename to meta-multimedia/recipes-multimedia/dav1d/dav1d_1.3.0.bb
index 5d43921b0..2d5049b9a 100644
--- a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.2.0.bb
+++ b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.3.0.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c8055cfe7548dfdaa3a6dc45d8793669"
 
 SRC_URI = "git://code.videolan.org/videolan/dav1d.git;protocol=https;branch=master"
-SRCREV = "676a864a11af2c0522e1f992e770589543894686"
+SRCREV = "48035599cdd4e4415732e408c407e0c1cd1c7444"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============6670046778040613309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/dav1d/dav1d-dbg: PKGSIZE changed from 3234744 to 3238440 (+0%)
packages/core2-64-poky-linux/dav1d/dav1d-dbg: PV changed from "1.2.0" to "1.3.0"
packages/core2-64-poky-linux/dav1d/dav1d-dbg: FILELIST: removed "/usr/lib/.debug/libdav1d.so.6.9.0", added "/usr/lib/.debug/libdav1d.so.7.0.0"
packages/core2-64-poky-linux/dav1d/dav1d-dbg: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/core2-64-poky-linux/dav1d/dav1d-dev: PKGSIZE changed from 41439 to 42876 (+3%)
packages/core2-64-poky-linux/dav1d/dav1d-dev: PV changed from "1.2.0" to "1.3.0"
packages/core2-64-poky-linux/dav1d/dav1d-dev: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/core2-64-poky-linux/dav1d/dav1d-doc: PV changed from "1.2.0" to "1.3.0"
packages/core2-64-poky-linux/dav1d/dav1d-doc: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/core2-64-poky-linux/dav1d/dav1d-locale: PV changed from "1.2.0" to "1.3.0"
packages/core2-64-poky-linux/dav1d/dav1d-locale: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/core2-64-poky-linux/dav1d/dav1d-src: PKGSIZE changed from 1714975 to 1730553 (+1%)
packages/core2-64-poky-linux/dav1d/dav1d-src: PV changed from "1.2.0" to "1.3.0"
packages/core2-64-poky-linux/dav1d/dav1d-src: FILELIST: directory renamed /usr/src/debug/dav1d/1.2.0-r0/tools -> /usr/src/debug/dav1d/1.3.0-r0/tools, directory renamed /usr/src/debug/dav1d/1.2.0-r0/tools/input -> /usr/src/debug/dav1d/1.3.0-r0/tools/input, directory renamed /usr/src/debug/dav1d/1.2.0-r0/include/common -> /usr/src/debug/dav1d/1.3.0-r0/include/common, directory renamed /usr/src/debug/dav1d/1.2.0-r0/tools/output -> /usr/src/debug/dav1d/1.3.0-r0/tools/output, directory renamed /usr/src/debug/dav1d/1.2.0-r0/include/dav1d -> /usr/src/debug/dav1d/1.3.0-r0/include/dav1d, removed "/usr/src/debug/dav1d/1.2.0-r0/src/intra_edge.h /usr/src/debug/dav1d/1.2.0-r0/src/x86/looprestoration.h /usr/src/debug/dav1d/1.2.0-r0/src/lf_mask.c /usr/src/debug/dav1d/1.2.0-r0/src/cdef_tmpl.c /usr/src/debug/dav1d/1.2.0-r0/src/lf_mask.h /usr/src/debug/dav1d/1.2.0-r0/src/lib.c /usr/src/debug/dav1d/1.2.0-r0/src/cdef_apply.h /usr/src/debug/dav1d/1.2.0-r0/src/picture.h /usr/src/debug/dav1d/1.2.0-r0/src/p
 icture.c /usr/src/debug/dav1d/1.2.0-r0/src/x86/itx.h /usr/src/debug/dav1d/1.2.0-r0/src/scan.h /usr/src/debug/dav1d/1.2.0-r0/src/scan.c /usr/src/debug/dav1d/1.2.0-r0/src/ref.c /usr/src/debug/dav1d/1.2.0-r0/src/mc.h /usr/src/debug/dav1d/1.2.0-r0/src/ref.h /usr/src/debug/dav1d/1.2.0-r0/src/x86/msac.h /usr/src/debug/dav1d/1.2.0-r0/src/looprestoration.h /usr/src/debug/dav1d/1.2.0-r0/src/decode.h /usr/src/debug/dav1d/1.2.0-r0/src/itx_1d.h /usr/src/debug/dav1d/1.2.0-r0/src/levels.h /usr/src/debug/dav1d/1.2.0-r0/src/data.h /usr/src/debug/dav1d/1.2.0-r0/src/refmvs.h /usr/src/debug/dav1d/1.2.0-r0/src/tables.h /usr/src/debug/dav1d/1.2.0-r0/src/thread.h /usr/src/debug/dav1d/1.2.0-r0/src/warpmv.h /usr/src/debug/dav1d/1.2.0-r0/src/x86/mc.h /usr/src/debug/dav1d/1.2.0-r0/src/decode.c /usr/src/debug/dav1d/1.2.0-r0/src/itx_1d.c /usr/src/debug/dav1d/1.2.0-r0/src/refmvs.c /usr/src/debug/dav1d/1.2.0-r0/src/tables.c /usr/src/debug/dav1d/1.2.0-r0/src/warpmv.c /usr/src/debug/dav1d/1.2.0-r0/src/data.c /usr/
 src/debug/dav1d/1.2.0-r0/src/log.h /usr/src/debug/dav1d/1.2.0-r0/src/log.c /usr/src/debug/dav1d/1.2.0-r0/src/env.h /usr/src/debug/dav1d/1.2.0-r0/src/thread_data.h /usr/src/debug/dav1d/1.2.0-r0/src/x86/filmgrain.h /usr/src/debug/dav1d/1.2.0-r0/src/fg_apply_tmpl.c /usr/src/debug/dav1d/1.2.0-r0/src/lf_apply_tmpl.c /usr/src/debug/dav1d/1.2.0-r0/src/lr_apply_tmpl.c /usr/src/debug/dav1d/1.2.0-r0/src/ipred_prepare.h /usr/src/debug/dav1d/1.2.0-r0/src/msac.h /usr/src/debug/dav1d/1.2.0-r0/src/msac.c /usr/src/debug/dav1d/1.2.0-r0/src/internal.h /usr/src/debug/dav1d/1.2.0-r0/src/loopfilter_tmpl.c /usr/src/debug/dav1d/1.2.0-r0/src/wedge.h /usr/src/debug/dav1d/1.2.0-r0/src/ipred.h /usr/src/debug/dav1d/1.2.0-r0/src/recon.h /usr/src/debug/dav1d/1.2.0-r0/src/filmgrain_tmpl.c /usr/src/debug/dav1d/1.2.0-r0/src/wedge.c /usr/src/debug/dav1d/1.2.0-r0/src/ctx.h /usr/src/debug/dav1d/1.2.0-r0/src/x86/refmvs.h /usr/src/debug/dav1d/1.2.0-r0/src/x86/loopfilter.h /usr/src/debug/dav1d/1.2.0-r0/src/filmgrain.h /u
 sr/src/debug/dav1d/1.2.0-r0/src/x86/ipred.h /usr/src/debug/dav1d/1.2.0-r0/src/dequant_tables.c /usr/src/debug/dav1d/1.2.0-r0/src/getbits.h /usr/src/debug/dav1d/1.2.0-r0/src/getbits.c /usr/src/debug/dav1d/1.2.0-r0/src/dequant_tables.h /usr/src/debug/dav1d/1.2.0-r0/src/cpu.c /usr/src/debug/dav1d/1.2.0-r0/src/looprestoration_tmpl.c /usr/src/debug/dav1d/1.2.0-r0/src/cpu.h /usr/src/debug/dav1d/1.2.0-r0/src/cdef.h /usr/src/debug/dav1d/1.2.0-r0/src/cdef_apply_tmpl.c /usr/src/debug/dav1d/1.2.0-r0/src/ipred_tmpl.c /usr/src/debug/dav1d/1.2.0-r0/src/recon_tmpl.c /usr/src/debug/dav1d/1.2.0-r0/src/mem.h /usr/src/debug/dav1d/1.2.0-r0/src/itx_tmpl.c /usr/src/debug/dav1d/1.2.0-r0/src/mem.c /usr/src/debug/dav1d/1.2.0-r0/src/mc_tmpl.c /usr/src/debug/dav1d/1.2.0-r0/src/fg_apply.h /usr/src/debug/dav1d/1.2.0-r0/src/lf_apply.h /usr/src/debug/dav1d/1.2.0-r0/src/lr_apply.h /usr/src/debug/dav1d/1.2.0-r0/src/obu.h /usr/src/debug/dav1d/1.2.0-r0/src/obu.c /usr/src/debug/dav1d/1.2.0-r0/src/qm.h /usr/src/debug/d
 av1d/1.2.0-r0/src/x86/cdef.h /usr/src/debug/dav1d/1.2.0-r0/src/ipred_prepare_tmpl.c /usr/src/debug/dav1d/1.2.0-r0/src/qm.c /usr/src/debug/dav1d/1.2.0-r0/src/itx.h /usr/src/debug/dav1d/1.2.0-r0/src/thread_task.h /usr/src/debug/dav1d/1.2.0-r0/src/cdf.h /usr/src/debug/dav1d/1.2.0-r0/src/thread_task.c /usr/src/debug/dav1d/1.2.0-r0/src/cdf.c /usr/src/debug/dav1d/1.2.0-r0/src/intra_edge.c /usr/src/debug/dav1d/1.2.0-r0/src/x86/cpu.h /usr/src/debug/dav1d/1.2.0-r0/src/loopfilter.h /usr/src/debug/dav1d/1.2.0-r0/src/x86/cpu.c", added "/usr/src/debug/dav1d/1.3.0-r0/src/intra_edge.h /usr/src/debug/dav1d/1.3.0-r0/src/x86/looprestoration.h /usr/src/debug/dav1d/1.3.0-r0/src/lf_mask.c /usr/src/debug/dav1d/1.3.0-r0/src/cdef_tmpl.c /usr/src/debug/dav1d/1.3.0-r0/src/lf_mask.h /usr/src/debug/dav1d/1.3.0-r0/src/pal.h /usr/src/debug/dav1d/1.3.0-r0/src/lib.c /usr/src/debug/dav1d/1.3.0-r0/src/pal.c /usr/src/debug/dav1d/1.3.0-r0/src/cdef_apply.h /usr/src/debug/dav1d/1.3.0-r0/src/picture.h /usr/src/debug/dav1
 d/1.3.0-r0/src/picture.c /usr/src/debug/dav1d/1.3.0-r0/src/x86/itx.h /usr/src/debug/dav1d/1.3.0-r0/src/scan.h /usr/src/debug/dav1d/1.3.0-r0/src/scan.c /usr/src/debug/dav1d/1.3.0-r0/src/ref.c /usr/src/debug/dav1d/1.3.0-r0/src/mc.h /usr/src/debug/dav1d/1.3.0-r0/src/ref.h /usr/src/debug/dav1d/1.3.0-r0/src/x86/msac.h /usr/src/debug/dav1d/1.3.0-r0/src/looprestoration.h /usr/src/debug/dav1d/1.3.0-r0/src/decode.h /usr/src/debug/dav1d/1.3.0-r0/src/itx_1d.h /usr/src/debug/dav1d/1.3.0-r0/src/levels.h /usr/src/debug/dav1d/1.3.0-r0/src/data.h /usr/src/debug/dav1d/1.3.0-r0/src/refmvs.h /usr/src/debug/dav1d/1.3.0-r0/src/tables.h /usr/src/debug/dav1d/1.3.0-r0/src/thread.h /usr/src/debug/dav1d/1.3.0-r0/src/warpmv.h /usr/src/debug/dav1d/1.3.0-r0/src/x86/mc.h /usr/src/debug/dav1d/1.3.0-r0/src/decode.c /usr/src/debug/dav1d/1.3.0-r0/src/itx_1d.c /usr/src/debug/dav1d/1.3.0-r0/src/refmvs.c /usr/src/debug/dav1d/1.3.0-r0/src/tables.c /usr/src/debug/dav1d/1.3.0-r0/src/warpmv.c /usr/src/debug/dav1d/1.3.0-r0/
 src/data.c /usr/src/debug/dav1d/1.3.0-r0/src/log.h /usr/src/debug/dav1d/1.3.0-r0/src/log.c /usr/src/debug/dav1d/1.3.0-r0/src/env.h /usr/src/debug/dav1d/1.3.0-r0/src/thread_data.h /usr/src/debug/dav1d/1.3.0-r0/src/x86/filmgrain.h /usr/src/debug/dav1d/1.3.0-r0/src/fg_apply_tmpl.c /usr/src/debug/dav1d/1.3.0-r0/src/lf_apply_tmpl.c /usr/src/debug/dav1d/1.3.0-r0/src/lr_apply_tmpl.c /usr/src/debug/dav1d/1.3.0-r0/src/ipred_prepare.h /usr/src/debug/dav1d/1.3.0-r0/src/msac.h /usr/src/debug/dav1d/1.3.0-r0/src/msac.c /usr/src/debug/dav1d/1.3.0-r0/src/internal.h /usr/src/debug/dav1d/1.3.0-r0/src/loopfilter_tmpl.c /usr/src/debug/dav1d/1.3.0-r0/src/ipred.h /usr/src/debug/dav1d/1.3.0-r0/src/recon.h /usr/src/debug/dav1d/1.3.0-r0/src/wedge.h /usr/src/debug/dav1d/1.3.0-r0/src/filmgrain_tmpl.c /usr/src/debug/dav1d/1.3.0-r0/src/wedge.c /usr/src/debug/dav1d/1.3.0-r0/src/ctx.h /usr/src/debug/dav1d/1.3.0-r0/src/x86/refmvs.h /usr/src/debug/dav1d/1.3.0-r0/src/x86/loopfilter.h /usr/src/debug/dav1d/1.3.0-r0/sr
 c/filmgrain.h /usr/src/debug/dav1d/1.3.0-r0/src/x86/ipred.h /usr/src/debug/dav1d/1.3.0-r0/src/dequant_tables.c /usr/src/debug/dav1d/1.3.0-r0/src/getbits.h /usr/src/debug/dav1d/1.3.0-r0/src/getbits.c /usr/src/debug/dav1d/1.3.0-r0/src/dequant_tables.h /usr/src/debug/dav1d/1.3.0-r0/src/cpu.c /usr/src/debug/dav1d/1.3.0-r0/src/looprestoration_tmpl.c /usr/src/debug/dav1d/1.3.0-r0/src/cpu.h /usr/src/debug/dav1d/1.3.0-r0/src/cdef.h /usr/src/debug/dav1d/1.3.0-r0/src/cdef_apply_tmpl.c /usr/src/debug/dav1d/1.3.0-r0/src/ipred_tmpl.c /usr/src/debug/dav1d/1.3.0-r0/src/recon_tmpl.c /usr/src/debug/dav1d/1.3.0-r0/src/mem.h /usr/src/debug/dav1d/1.3.0-r0/src/itx_tmpl.c /usr/src/debug/dav1d/1.3.0-r0/src/mem.c /usr/src/debug/dav1d/1.3.0-r0/src/mc_tmpl.c /usr/src/debug/dav1d/1.3.0-r0/src/fg_apply.h /usr/src/debug/dav1d/1.3.0-r0/src/lf_apply.h /usr/src/debug/dav1d/1.3.0-r0/src/lr_apply.h /usr/src/debug/dav1d/1.3.0-r0/src/x86/pal.h /usr/src/debug/dav1d/1.3.0-r0/src/obu.h /usr/src/debug/dav1d/1.3.0-r0/src/o
 bu.c /usr/src/debug/dav1d/1.3.0-r0/src/qm.h /usr/src/debug/dav1d/1.3.0-r0/src/x86/cdef.h /usr/src/debug/dav1d/1.3.0-r0/src/ipred_prepare_tmpl.c /usr/src/debug/dav1d/1.3.0-r0/src/qm.c /usr/src/debug/dav1d/1.3.0-r0/src/itx.h /usr/src/debug/dav1d/1.3.0-r0/src/thread_task.h /usr/src/debug/dav1d/1.3.0-r0/src/cdf.h /usr/src/debug/dav1d/1.3.0-r0/src/thread_task.c /usr/src/debug/dav1d/1.3.0-r0/src/cdf.c /usr/src/debug/dav1d/1.3.0-r0/src/intra_edge.c /usr/src/debug/dav1d/1.3.0-r0/src/x86/cpu.h /usr/src/debug/dav1d/1.3.0-r0/src/loopfilter.h /usr/src/debug/dav1d/1.3.0-r0/src/x86/cpu.c"
packages/core2-64-poky-linux/dav1d/dav1d-src: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/core2-64-poky-linux/dav1d/dav1d-staticdev: PV changed from "1.2.0" to "1.3.0"
packages/core2-64-poky-linux/dav1d/dav1d-staticdev: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/core2-64-poky-linux/dav1d/dav1d: PKGSIZE changed from 1763433 to 1757225 (-0%)
packages/core2-64-poky-linux/dav1d/dav1d: PV changed from "1.2.0" to "1.3.0"
packages/core2-64-poky-linux/dav1d/dav1d: FILELIST: removed "/usr/lib/libdav1d.so.6.9.0 /usr/lib/libdav1d.so.6", added "/usr/lib/libdav1d.so.7.0.0 /usr/lib/libdav1d.so.7"
packages/core2-64-poky-linux/dav1d/dav1d: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
packages/core2-64-poky-linux/dav1d: PV changed from "1.2.0" to "1.3.0"
packages/core2-64-poky-linux/dav1d: PKGV changed from 1.2.0 [default] to 1.3.0 [default]
Changes to packages/core2-64-poky-linux/dav1d (sysroot):
  /usr/lib/libdav1d.so changed symlink target from libdav1d.so.6 to libdav1d.so.7
  /usr/lib/libdav1d.so.6.9.0 moved to /usr/lib/libdav1d.so.7.0.0
  /usr/lib/libdav1d.so.6 moved to /usr/lib/libdav1d.so.7

--===============6670046778040613309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/dav1d/dav1d: FILELIST: removed "/usr/lib/libdav1d.so.6 /usr/lib/libdav1d.so.6.9.0", added "/usr/lib/libdav1d.so.7 /usr/lib/libdav1d.so.7.0.0"
Changes to packages/core2-64-poky-linux/dav1d (sysroot):
  /usr/lib/libdav1d.so changed symlink target from libdav1d.so.6 to libdav1d.so.7
  /usr/lib/libdav1d.so.6.9.0 moved to /usr/lib/libdav1d.so.7.0.0
  /usr/lib/libdav1d.so.6 moved to /usr/lib/libdav1d.so.7

--===============6670046778040613309==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dav1d-upgrade-1.2.0-1.3.0.patch"

RnJvbSAwNzgwOWQ3MmViNzFjZTc5YWQzYWU5ZmY3YmU3ZTM0MThiNzJjMGMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMzoxNTo1NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRh
djFkOiB1cGdyYWRlIDEuMi4wIC0+IDEuMy4wCgotLS0KIC4uLi9yZWNpcGVzLW11bHRpbWVkaWEv
ZGF2MWQve2RhdjFkXzEuMi4wLmJiID0+IGRhdjFkXzEuMy4wLmJifSB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEtbXVsdGlt
ZWRpYS9yZWNpcGVzLW11bHRpbWVkaWEvZGF2MWQve2RhdjFkXzEuMi4wLmJiID0+IGRhdjFkXzEu
My4wLmJifSAoODklKQoKZGlmZiAtLWdpdCBhL21ldGEtbXVsdGltZWRpYS9yZWNpcGVzLW11bHRp
bWVkaWEvZGF2MWQvZGF2MWRfMS4yLjAuYmIgYi9tZXRhLW11bHRpbWVkaWEvcmVjaXBlcy1tdWx0
aW1lZGlhL2RhdjFkL2RhdjFkXzEuMy4wLmJiCnNpbWlsYXJpdHkgaW5kZXggODklCnJlbmFtZSBm
cm9tIG1ldGEtbXVsdGltZWRpYS9yZWNpcGVzLW11bHRpbWVkaWEvZGF2MWQvZGF2MWRfMS4yLjAu
YmIKcmVuYW1lIHRvIG1ldGEtbXVsdGltZWRpYS9yZWNpcGVzLW11bHRpbWVkaWEvZGF2MWQvZGF2
MWRfMS4zLjAuYmIKaW5kZXggNWQ0MzkyMWIwLi4yZDUwNDliOWEgMTAwNjQ0Ci0tLSBhL21ldGEt
bXVsdGltZWRpYS9yZWNpcGVzLW11bHRpbWVkaWEvZGF2MWQvZGF2MWRfMS4yLjAuYmIKKysrIGIv
bWV0YS1tdWx0aW1lZGlhL3JlY2lwZXMtbXVsdGltZWRpYS9kYXYxZC9kYXYxZF8xLjMuMC5iYgpA
QCAtNyw3ICs3LDcgQEAgTElDRU5TRSA9ICJCU0QtMi1DbGF1c2UiCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT1jODA1NWNmZTc1NDhkZmRhYTNhNmRjNDVkODc5MzY2OSIK
IAogU1JDX1VSSSA9ICJnaXQ6Ly9jb2RlLnZpZGVvbGFuLm9yZy92aWRlb2xhbi9kYXYxZC5naXQ7
cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciIKLVNSQ1JFViA9ICI2NzZhODY0YTExYWYyYzA1
MjJlMWY5OTJlNzcwNTg5NTQzODk0Njg2IgorU1JDUkVWID0gIjQ4MDM1NTk5Y2RkNGU0NDE1NzMy
ZTQwOGM0MDdlMGMxY2QxYzc0NDQiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIuMzku
MgoK

--===============6670046778040613309==--

