Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B808C27C5C
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:53:07 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.62980.1699041166512237170
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PvzqHDjT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=RlOSKrot;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018b96bee9c1-ea9fc705-f4ef-4db8-a6a8-2cfa07f92fbe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041176;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OeftLarDQrEZB6VLzK/6SUUttj2vIMMFLGd7OO5ErXc=;
	b=PvzqHDjTXQ485yR5ER2ba9KEDdyCOkCIkJMDn32tWT9XMp9KsUnPOQiiDWztfZhD
	wISos+d7jfyAcfKTmduDpKFoAhQ0VcShgLw5mI6Ywo8OrenjrNQ41OgvKLCuUNtFdaY
	2GiqtQffxlJNvHY6ALJh1OQMMpTFl3A2Bs06wq08=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041176;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OeftLarDQrEZB6VLzK/6SUUttj2vIMMFLGd7OO5ErXc=;
	b=RlOSKrotnZQ3awBIdmMOfnfhZYK625ulST6V1ZV49I4FMCzMEUQ+alciNRbWtJn1
	YRNhQf1nKOp2erBAFhXyOJp7R3NVF2V2neZ2mjsQI9XtuSbpa6/hnoZSmR/dVHc9m7n
	wIGQpwuiVKwJb0ndMgNevOBYu6XF0M1pzH39ER2Q=
Content-Type: multipart/mixed; boundary="===============2516683920537587312=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] uftrace: upgrading to 0.14 SUCCEEDED
Message-ID: <0101018b96bee9c1-ea9fc705-f4ef-4db8-a6a8-2cfa07f92fbe-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:56 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:53:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106028

--===============2516683920537587312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *uftrace* to *0.14* has Succeeded.

Next steps:
    - apply the patch: git am 0001-uftrace-upgrade-0.13.1-0.14.patch
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
From 84cd99cb0ddaf775800463b97ede1416cf2aa8c9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 19:06:03 +0000
Subject: [PATCH] uftrace: upgrade 0.13.1 -> 0.14

---
 .../uftrace/{uftrace_0.13.1.bb => uftrace_0.14.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/uftrace/{uftrace_0.13.1.bb => uftrace_0.14.bb} (95%)

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.13.1.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.14.bb
similarity index 95%
rename from meta-oe/recipes-devtools/uftrace/uftrace_0.13.1.bb
rename to meta-oe/recipes-devtools/uftrace/uftrace_0.14.bb
index 4e1edc6ce..415cfe1b0 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.13.1.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.14.bb
@@ -10,7 +10,7 @@ DEPENDS:append:libc-musl = " argp-standalone"
 
 inherit autotools
 
-SRCREV = "be3f46f7656bd9243b1835337b5350247b030b02"
+SRCREV = "04d73dc31cafef4161321e3c2443a5490ef93018"
 SRC_URI = "git://github.com/namhyung/${BPN};branch=master;protocol=https"
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============2516683920537587312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/uftrace: PKGV changed from 0.13.1 [default] to 0.14 [default]
packages/core2-64-poky-linux/uftrace: PV changed from "0.13.1" to "0.14"
packages/core2-64-poky-linux/uftrace/uftrace-dbg: PKGV changed from 0.13.1 [default] to 0.14 [default]
packages/core2-64-poky-linux/uftrace/uftrace-dbg: PKGSIZE changed from 4697152 to 4805152 (+2%)
packages/core2-64-poky-linux/uftrace/uftrace-dbg: PV changed from "0.13.1" to "0.14"
packages/core2-64-poky-linux/uftrace/uftrace-dev: PKGV changed from 0.13.1 [default] to 0.14 [default]
packages/core2-64-poky-linux/uftrace/uftrace-dev: PV changed from "0.13.1" to "0.14"
packages/core2-64-poky-linux/uftrace/uftrace-doc: PKGV changed from 0.13.1 [default] to 0.14 [default]
packages/core2-64-poky-linux/uftrace/uftrace-doc: PV changed from "0.13.1" to "0.14"
packages/core2-64-poky-linux/uftrace/uftrace-locale: PKGV changed from 0.13.1 [default] to 0.14 [default]
packages/core2-64-poky-linux/uftrace/uftrace-locale: PV changed from "0.13.1" to "0.14"
packages/core2-64-poky-linux/uftrace/uftrace-src: FILELIST: directory renamed /usr/src/debug/uftrace/0.13.1-r0/arch/x86_64 -> /usr/src/debug/uftrace/0.14-r0/arch/x86_64, directory renamed /usr/src/debug/uftrace/0.13.1-r0/libmcount -> /usr/src/debug/uftrace/0.14-r0/libmcount, directory renamed /usr/src/debug/uftrace/0.13.1-r0 -> /usr/src/debug/uftrace/0.14-r0, directory renamed /usr/src/debug/uftrace/0.13.1-r0/cmds -> /usr/src/debug/uftrace/0.14-r0/cmds, directory renamed /usr/src/debug/uftrace/0.13.1-r0/libtraceevent -> /usr/src/debug/uftrace/0.14-r0/libtraceevent, removed "/usr/src/debug/uftrace/0.13.1-r0/utils/debug.c /usr/src/debug/uftrace/0.13.1-r0/utils/event.c /usr/src/debug/uftrace/0.13.1-r0/utils/script.c /usr/src/debug/uftrace/0.13.1-r0/utils/hashmap.c /usr/src/debug/uftrace/0.13.1-r0/utils/script.h /usr/src/debug/uftrace/0.13.1-r0/utils/event.h /usr/src/debug/uftrace/0.13.1-r0/utils/hashmap.h /usr/src/debug/uftrace/0.13.1-r0/utils/demangle.c /usr/src/debug/uftrace/0.13.1-r0
 /utils/socket.c /usr/src/debug/uftrace/0.13.1-r0/utils/regs.c /usr/src/debug/uftrace/0.13.1-r0/utils/socket.h /usr/src/debug/uftrace/0.13.1-r0/utils/utils.c /usr/src/debug/uftrace/0.13.1-r0/utils/report.c /usr/src/debug/uftrace/0.13.1-r0/utils/utils.h /usr/src/debug/uftrace/0.13.1-r0/utils/report.h /usr/src/debug/uftrace/0.13.1-r0/utils/fstack.c /usr/src/debug/uftrace/0.13.1-r0/utils/pager.c /usr/src/debug/uftrace/0.13.1-r0/utils/dwarf.h /usr/src/debug/uftrace/0.13.1-r0/utils/extern.c /usr/src/debug/uftrace/0.13.1-r0/utils/graph.c /usr/src/debug/uftrace/0.13.1-r0/utils/fstack.h /usr/src/debug/uftrace/0.13.1-r0/utils/dwarf.c /usr/src/debug/uftrace/0.13.1-r0/utils/graph.h /usr/src/debug/uftrace/0.13.1-r0/utils/tracefs.h /usr/src/debug/uftrace/0.13.1-r0/utils/symbol-libelf.c /usr/src/debug/uftrace/0.13.1-r0/utils/filter.h /usr/src/debug/uftrace/0.13.1-r0/utils/auto-args.c /usr/src/debug/uftrace/0.13.1-r0/utils/list.h /usr/src/debug/uftrace/0.13.1-r0/utils/symbol-libelf.h /usr/src/debug
 /uftrace/0.13.1-r0/utils/tracefs.c /usr/src/debug/uftrace/0.13.1-r0/utils/session.c /usr/src/debug/uftrace/0.13.1-r0/utils/auto-args.h /usr/src/debug/uftrace/0.13.1-r0/utils/filter.c /usr/src/debug/uftrace/0.13.1-r0/utils/argspec.h /usr/src/debug/uftrace/0.13.1-r0/utils/perf.c /usr/src/debug/uftrace/0.13.1-r0/utils/symbol.h /usr/src/debug/uftrace/0.13.1-r0/utils/kernel.h /usr/src/debug/uftrace/0.13.1-r0/utils/script-python.h /usr/src/debug/uftrace/0.13.1-r0/utils/perf.h /usr/src/debug/uftrace/0.13.1-r0/utils/argspec.c /usr/src/debug/uftrace/0.13.1-r0/utils/kernel.c /usr/src/debug/uftrace/0.13.1-r0/utils/script-luajit.h /usr/src/debug/uftrace/0.13.1-r0/utils/symbol.c /usr/src/debug/uftrace/0.13.1-r0/utils/arch.h /usr/src/debug/uftrace/0.13.1-r0/utils/rbtree.c /usr/src/debug/uftrace/0.13.1-r0/utils/field.h /usr/src/debug/uftrace/0.13.1-r0/utils/data-file.c /usr/src/debug/uftrace/0.13.1-r0/utils/rbtree.h /usr/src/debug/uftrace/0.13.1-r0/utils/field.c", added "/usr/src/debug/uftrace/0.1
 4-r0/utils/filter.c /usr/src/debug/uftrace/0.14-r0/utils/rbtree.c /usr/src/debug/uftrace/0.14-r0/utils/field.c /usr/src/debug/uftrace/0.14-r0/utils/graph.h /usr/src/debug/uftrace/0.14-r0/utils/rbtree.h /usr/src/debug/uftrace/0.14-r0/utils/filter.h /usr/src/debug/uftrace/0.14-r0/utils/graph.c /usr/src/debug/uftrace/0.14-r0/utils/field.h /usr/src/debug/uftrace/0.14-r0/utils/argspec.c /usr/src/debug/uftrace/0.14-r0/utils/kernel.h /usr/src/debug/uftrace/0.14-r0/utils/socket.h /usr/src/debug/uftrace/0.14-r0/utils/kernel.c /usr/src/debug/uftrace/0.14-r0/utils/argspec.h /usr/src/debug/uftrace/0.14-r0/utils/session.c /usr/src/debug/uftrace/0.14-r0/utils/socket.c /usr/src/debug/uftrace/0.14-r0/utils/report.c /usr/src/debug/uftrace/0.14-r0/utils/list.h /usr/src/debug/uftrace/0.14-r0/utils/script-luajit.h /usr/src/debug/uftrace/0.14-r0/utils/script-python.h /usr/src/debug/uftrace/0.14-r0/utils/symbol-libelf.c /usr/src/debug/uftrace/0.14-r0/utils/report.h /usr/src/debug/uftrace/0.14-r0/utils/sy
 mbol-libelf.h /usr/src/debug/uftrace/0.14-r0/utils/extern.c /usr/src/debug/uftrace/0.14-r0/utils/fstack.c /usr/src/debug/uftrace/0.14-r0/utils/pager.c /usr/src/debug/uftrace/0.14-r0/utils/hashmap.h /usr/src/debug/uftrace/0.14-r0/utils/fstack.h /usr/src/debug/uftrace/0.14-r0/utils/demangle.c /usr/src/debug/uftrace/0.14-r0/utils/debug.c /usr/src/debug/uftrace/0.14-r0/utils/hashmap.c /usr/src/debug/uftrace/0.14-r0/utils/data-file.c /usr/src/debug/uftrace/0.14-r0/utils/event.c /usr/src/debug/uftrace/0.14-r0/utils/tracefs.h /usr/src/debug/uftrace/0.14-r0/utils/event.h /usr/src/debug/uftrace/0.14-r0/utils/regs.c /usr/src/debug/uftrace/0.14-r0/utils/tracefs.c /usr/src/debug/uftrace/0.14-r0/utils/arch.h /usr/src/debug/uftrace/0.14-r0/utils/auto-args.h /usr/src/debug/uftrace/0.14-r0/utils/dwarf.c /usr/src/debug/uftrace/0.14-r0/utils/perf.h /usr/src/debug/uftrace/0.14-r0/utils/auto-args.c /usr/src/debug/uftrace/0.14-r0/utils/perf.c /usr/src/debug/uftrace/0.14-r0/utils/dwarf.h /usr/src/debug/u
 ftrace/0.14-r0/utils/utils.h /usr/src/debug/uftrace/0.14-r0/utils/symbol.h /usr/src/debug/uftrace/0.14-r0/utils/shmem.c /usr/src/debug/uftrace/0.14-r0/utils/script.h /usr/src/debug/uftrace/0.14-r0/utils/script.c /usr/src/debug/uftrace/0.14-r0/utils/shmem.h /usr/src/debug/uftrace/0.14-r0/utils/symbol.c /usr/src/debug/uftrace/0.14-r0/utils/utils.c"
packages/core2-64-poky-linux/uftrace/uftrace-src: PKGV changed from 0.13.1 [default] to 0.14 [default]
packages/core2-64-poky-linux/uftrace/uftrace-src: PKGSIZE changed from 1487632 to 1524749 (+2%)
packages/core2-64-poky-linux/uftrace/uftrace-src: PV changed from "0.13.1" to "0.14"
packages/core2-64-poky-linux/uftrace/uftrace-staticdev: PKGV changed from 0.13.1 [default] to 0.14 [default]
packages/core2-64-poky-linux/uftrace/uftrace-staticdev: PV changed from "0.13.1" to "0.14"
packages/core2-64-poky-linux/uftrace/uftrace: PKGV changed from 0.13.1 [default] to 0.14 [default]
packages/core2-64-poky-linux/uftrace/uftrace: PKGSIZE changed from 1543786 to 1556266 (+1%)
packages/core2-64-poky-linux/uftrace/uftrace: PV changed from "0.13.1" to "0.14"

--===============2516683920537587312==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-uftrace-upgrade-0.13.1-0.14.patch"

RnJvbSA4NGNkOTljYjBkZGFmNzc1ODAwNDYzYjk3ZWRlMTQxNmNmMmFhOGM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxOTowNjowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHVm
dHJhY2U6IHVwZ3JhZGUgMC4xMy4xIC0+IDAuMTQKCi0tLQogLi4uL3VmdHJhY2Uve3VmdHJhY2Vf
MC4xMy4xLmJiID0+IHVmdHJhY2VfMC4xNC5iYn0gICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS1vZS9y
ZWNpcGVzLWRldnRvb2xzL3VmdHJhY2Uve3VmdHJhY2VfMC4xMy4xLmJiID0+IHVmdHJhY2VfMC4x
NC5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvdWZ0cmFj
ZS91ZnRyYWNlXzAuMTMuMS5iYiBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy91ZnRyYWNlL3Vm
dHJhY2VfMC4xNC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhLW9lL3Jl
Y2lwZXMtZGV2dG9vbHMvdWZ0cmFjZS91ZnRyYWNlXzAuMTMuMS5iYgpyZW5hbWUgdG8gbWV0YS1v
ZS9yZWNpcGVzLWRldnRvb2xzL3VmdHJhY2UvdWZ0cmFjZV8wLjE0LmJiCmluZGV4IDRlMWVkYzZj
ZS4uNDE1Y2ZlMWIwIDEwMDY0NAotLS0gYS9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvdWZ0cmFj
ZS91ZnRyYWNlXzAuMTMuMS5iYgorKysgYi9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvdWZ0cmFj
ZS91ZnRyYWNlXzAuMTQuYmIKQEAgLTEwLDcgKzEwLDcgQEAgREVQRU5EUzphcHBlbmQ6bGliYy1t
dXNsID0gIiBhcmdwLXN0YW5kYWxvbmUiCiAKIGluaGVyaXQgYXV0b3Rvb2xzCiAKLVNSQ1JFViA9
ICJiZTNmNDZmNzY1NmJkOTI0M2IxODM1MzM3YjUzNTAyNDdiMDMwYjAyIgorU1JDUkVWID0gIjA0
ZDczZGMzMWNhZmVmNDE2MTMyMWUzYzI0NDNhNTQ5MGVmOTMwMTgiCiBTUkNfVVJJID0gImdpdDov
L2dpdGh1Yi5jb20vbmFtaHl1bmcvJHtCUE59O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMi
CiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCi0tIAoyLjM5LjIKCg==

--===============2516683920537587312==--

