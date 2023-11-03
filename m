Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C754EC11F64
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:51 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.62992.1699041170844849037
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VV228Q9q;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=S5VqZehs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b96bed348-42ed6a05-69de-431c-a542-ee4672875343-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+Uq0u2IHVY8lXIVdPom5Gz6zJLiWYykP7yMlVJ/+Pfc=;
	b=VV228Q9q/MSm7QJH72aEZJMpVZ/buTTh+T70gbiIav/j7abDTQtJgTLLdnwl+bav
	qgcZW9oacE61sAupKkJRBP3Axi77h0Mx9no1CFDnJKjlINqB8SJmUyUSCAevluQdCr/
	l2bQ2oFwKvdE0CdjX5uUt99PSVRqScllxTd+Iyyk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+Uq0u2IHVY8lXIVdPom5Gz6zJLiWYykP7yMlVJ/+Pfc=;
	b=S5VqZehsFx+Xvsc7JtMcDiW0EMoii71NoVmjZjwkt4kKa3rK+8ec4zZHK7T4BxyB
	NKIOswZvUB+nYqR6nXegK0CZSc1W4AKVeudhKF5iqPFvweV5WRjGRYHQj2EbaWrf8mG
	MheWbSPasQUDhw7h5EvZAcleka7bL30t22qshQOM=
Content-Type: multipart/mixed; boundary="===============4977797671940768177=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] mksh: upgrading to R59c SUCCEEDED
Message-ID: <0101018b96bed348-42ed6a05-69de-431c-a542-ee4672875343-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105995

--===============4977797671940768177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mksh* to *R59c* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mksh-upgrade-59-R59c.patch
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
From f7c656296a17de3b8bb2d2a93edb3699bcb20f90 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 15:50:44 +0000
Subject: [PATCH] mksh: upgrade 59 -> R59c

---
 meta-oe/recipes-shells/mksh/{mksh_59.bb => mksh_R59c.bb} | 1 -
 1 file changed, 1 deletion(-)
 rename meta-oe/recipes-shells/mksh/{mksh_59.bb => mksh_R59c.bb} (95%)

diff --git a/meta-oe/recipes-shells/mksh/mksh_59.bb b/meta-oe/recipes-shells/mksh/mksh_R59c.bb
similarity index 95%
rename from meta-oe/recipes-shells/mksh/mksh_59.bb
rename to meta-oe/recipes-shells/mksh/mksh_R59c.bb
index 9cd0fbc25..a45107316 100644
--- a/meta-oe/recipes-shells/mksh/mksh_59.bb
+++ b/meta-oe/recipes-shells/mksh/mksh_R59c.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://main.c;beginline=6;endline=26;md5=6efc2c249328e4d2bd3
 
 SRC_URI = "http://www.mirbsd.org/MirOS/dist/mir/mksh/mksh-R59b.tgz"
 
-SRC_URI[md5sum] = "dce6abffc2036288540b9ba11dfb2ec8"
 SRC_URI[sha256sum] = "907ed1a9586e7f18bdefdd4a763aaa8397b755e15034aa54f4d753bfb272e0e6"
 
 inherit update-alternatives
-- 
2.39.2


--===============4977797671940768177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mksh: PV changed from "59" to "R59c"
packages/core2-64-poky-linux/mksh: PKGV changed from 59 [default] to R59c [default]
packages/core2-64-poky-linux/mksh/mksh-dbg: PV changed from "59" to "R59c"
packages/core2-64-poky-linux/mksh/mksh-dbg: PKGV changed from 59 [default] to R59c [default]
packages/core2-64-poky-linux/mksh/mksh-dbg: PKGSIZE changed from 869664 to 869672 (+0%)
packages/core2-64-poky-linux/mksh/mksh-dev: PV changed from "59" to "R59c"
packages/core2-64-poky-linux/mksh/mksh-dev: PKGV changed from 59 [default] to R59c [default]
packages/core2-64-poky-linux/mksh/mksh-doc: PV changed from "59" to "R59c"
packages/core2-64-poky-linux/mksh/mksh-doc: PKGV changed from 59 [default] to R59c [default]
packages/core2-64-poky-linux/mksh/mksh-locale: PV changed from "59" to "R59c"
packages/core2-64-poky-linux/mksh/mksh-locale: PKGV changed from 59 [default] to R59c [default]
packages/core2-64-poky-linux/mksh/mksh-src: PV changed from "59" to "R59c"
packages/core2-64-poky-linux/mksh/mksh-src: PKGV changed from 59 [default] to R59c [default]
packages/core2-64-poky-linux/mksh/mksh-staticdev: PV changed from "59" to "R59c"
packages/core2-64-poky-linux/mksh/mksh-staticdev: PKGV changed from 59 [default] to R59c [default]
packages/core2-64-poky-linux/mksh/mksh: PV changed from "59" to "R59c"
packages/core2-64-poky-linux/mksh/mksh: PKGV changed from 59 [default] to R59c [default]

--===============4977797671940768177==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-mksh-upgrade-59-R59c.patch"

RnJvbSBmN2M2NTYyOTZhMTdkZTNiOGJiMmQyYTkzZWRiMzY5OWJjYjIwZjkwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxNTo1MDo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1r
c2g6IHVwZ3JhZGUgNTkgLT4gUjU5YwoKLS0tCiBtZXRhLW9lL3JlY2lwZXMtc2hlbGxzL21rc2gv
e21rc2hfNTkuYmIgPT4gbWtzaF9SNTljLmJifSB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVs
ZXRpb24oLSkKIHJlbmFtZSBtZXRhLW9lL3JlY2lwZXMtc2hlbGxzL21rc2gve21rc2hfNTkuYmIg
PT4gbWtzaF9SNTljLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1zaGVs
bHMvbWtzaC9ta3NoXzU5LmJiIGIvbWV0YS1vZS9yZWNpcGVzLXNoZWxscy9ta3NoL21rc2hfUjU5
Yy5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhLW9lL3JlY2lwZXMtc2hl
bGxzL21rc2gvbWtzaF81OS5iYgpyZW5hbWUgdG8gbWV0YS1vZS9yZWNpcGVzLXNoZWxscy9ta3No
L21rc2hfUjU5Yy5iYgppbmRleCA5Y2QwZmJjMjUuLmE0NTEwNzMxNiAxMDA2NDQKLS0tIGEvbWV0
YS1vZS9yZWNpcGVzLXNoZWxscy9ta3NoL21rc2hfNTkuYmIKKysrIGIvbWV0YS1vZS9yZWNpcGVz
LXNoZWxscy9ta3NoL21rc2hfUjU5Yy5iYgpAQCAtOSw3ICs5LDYgQEAgTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vbWFpbi5jO2JlZ2lubGluZT02O2VuZGxpbmU9MjY7bWQ1PTZlZmMyYzI0OTMy
OGU0ZDJiZDMKIAogU1JDX1VSSSA9ICJodHRwOi8vd3d3Lm1pcmJzZC5vcmcvTWlyT1MvZGlzdC9t
aXIvbWtzaC9ta3NoLVI1OWIudGd6IgogCi1TUkNfVVJJW21kNXN1bV0gPSAiZGNlNmFiZmZjMjAz
NjI4ODU0MGI5YmExMWRmYjJlYzgiCiBTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTA3ZWQxYTk1ODZl
N2YxOGJkZWZkZDRhNzYzYWFhODM5N2I3NTVlMTUwMzRhYTU0ZjRkNzUzYmZiMjcyZTBlNiIKIAog
aW5oZXJpdCB1cGRhdGUtYWx0ZXJuYXRpdmVzCi0tIAoyLjM5LjIKCg==

--===============4977797671940768177==--

