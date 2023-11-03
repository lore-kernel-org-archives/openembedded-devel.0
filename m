Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65EA6C25B64
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:54 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.62968.1699041164665655841
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ImQDh8K9;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=aXuu2hoK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b96bedf36-b9107028-46bf-4dff-8ad6-82a6921bf8b7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041173;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=W6y2S5l33pdiaear3m72igJQMs9jsr72G7Cxv7EfPFY=;
	b=ImQDh8K9o0Fk0CUsRibN/jTdKzguu6pdPP2IyeFsohrzneWUZp4wmvHiWpA+bpgh
	VM753+a/HOe+iM1ru/DT9wx/ofS8My0PaysD3mZk+q9qlvx3hyGc8Dshmmnel+fmDnC
	Yl3UlyyOh0D0Tj1X54Qeh0osn/oJbc28obd+2Rq8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041173;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=W6y2S5l33pdiaear3m72igJQMs9jsr72G7Cxv7EfPFY=;
	b=aXuu2hoKMQOjgr/VdfEBpde7nWglfDaAnTyh/krSVB9FxtBY8efcP7rfo2Mo/umu
	1N8nezyPAbklNaPT0bVD8EndvP0vYjLA5tXFSNFEjoFQtIyPyFr+uJ39L7lzQEZ0RBm
	zNvBJuXGbMhcVJHXmWrZt2wg59dDp5WKvSmMskCA=
Content-Type: multipart/mixed; boundary="===============6345701099276453514=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] sdbus-c++: upgrading to 1.4.0 SUCCEEDED
Message-ID: <0101018b96bedf36-b9107028-46bf-4dff-8ad6-82a6921bf8b7-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106006

--===============6345701099276453514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sdbus-c++* to *1.4.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sdbus-c-upgrade-1.3.0-1.4.0.patch
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
From 2264fbab1c460e5fe45f317187f3c00e3e04e819 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 18:18:12 +0000
Subject: [PATCH] sdbus-c++: upgrade 1.3.0 -> 1.4.0

---
 .../sdbus-c++/{sdbus-c++-1.3.0 => sdbus-c++-1.4.0}/run-ptest    | 0
 .../sdbus-c++/{sdbus-c++_1.3.0.bb => sdbus-c++_1.4.0.bb}        | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-1.3.0 => sdbus-c++-1.4.0}/run-ptest (100%)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++_1.3.0.bb => sdbus-c++_1.4.0.bb} (97%)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.3.0/run-ptest b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.4.0/run-ptest
similarity index 100%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.3.0/run-ptest
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.4.0/run-ptest
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.3.0.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.4.0.bb
similarity index 97%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.3.0.bb
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.4.0.bb
index 2ef4d5a4b..faf281485 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.3.0.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.4.0.bb
@@ -16,7 +16,7 @@ PACKAGECONFIG[with-tests] = "-DBUILD_TESTS=ON -DTESTS_INSTALL_PATH=${libdir}/${B
 
 DEPENDS += "expat"
 
-SRCREV = "0eda85574546d19d9f06d6d5418bc192b3846f96"
+SRCREV = "b482cd6d0890e3f9ae141b4aeb07d3724e48b3db"
 
 SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master"
 SRC_URI += "file://run-ptest"
-- 
2.39.2


--===============6345701099276453514==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sdbus-c-upgrade-1.3.0-1.4.0.patch"

RnJvbSAyMjY0ZmJhYjFjNDYwZTVmZTQ1ZjMxNzE4N2YzYzAwZTNlMDRlODE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxODoxODoxMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNk
YnVzLWMrKzogdXBncmFkZSAxLjMuMCAtPiAxLjQuMAoKLS0tCiAuLi4vc2RidXMtYysrL3tzZGJ1
cy1jKystMS4zLjAgPT4gc2RidXMtYysrLTEuNC4wfS9ydW4tcHRlc3QgICAgfCAwCiAuLi4vc2Ri
dXMtYysrL3tzZGJ1cy1jKytfMS4zLjAuYmIgPT4gc2RidXMtYysrXzEuNC4wLmJifSAgICAgICAg
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS1vZS9yZWNpcGVzLWNvcmUvc2RidXMtYysrL3tzZGJ1cy1jKystMS4zLjAgPT4g
c2RidXMtYysrLTEuNC4wfS9ydW4tcHRlc3QgKDEwMCUpCiByZW5hbWUgbWV0YS1vZS9yZWNpcGVz
LWNvcmUvc2RidXMtYysrL3tzZGJ1cy1jKytfMS4zLjAuYmIgPT4gc2RidXMtYysrXzEuNC4wLmJi
fSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1jb3JlL3NkYnVzLWMrKy9zZGJ1
cy1jKystMS4zLjAvcnVuLXB0ZXN0IGIvbWV0YS1vZS9yZWNpcGVzLWNvcmUvc2RidXMtYysrL3Nk
YnVzLWMrKy0xLjQuMC9ydW4tcHRlc3QKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9t
IG1ldGEtb2UvcmVjaXBlcy1jb3JlL3NkYnVzLWMrKy9zZGJ1cy1jKystMS4zLjAvcnVuLXB0ZXN0
CnJlbmFtZSB0byBtZXRhLW9lL3JlY2lwZXMtY29yZS9zZGJ1cy1jKysvc2RidXMtYysrLTEuNC4w
L3J1bi1wdGVzdApkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWNvcmUvc2RidXMtYysrL3Nk
YnVzLWMrK18xLjMuMC5iYiBiL21ldGEtb2UvcmVjaXBlcy1jb3JlL3NkYnVzLWMrKy9zZGJ1cy1j
KytfMS40LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS1vZS9yZWNp
cGVzLWNvcmUvc2RidXMtYysrL3NkYnVzLWMrK18xLjMuMC5iYgpyZW5hbWUgdG8gbWV0YS1vZS9y
ZWNpcGVzLWNvcmUvc2RidXMtYysrL3NkYnVzLWMrK18xLjQuMC5iYgppbmRleCAyZWY0ZDVhNGIu
LmZhZjI4MTQ4NSAxMDA2NDQKLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWNvcmUvc2RidXMtYysrL3Nk
YnVzLWMrK18xLjMuMC5iYgorKysgYi9tZXRhLW9lL3JlY2lwZXMtY29yZS9zZGJ1cy1jKysvc2Ri
dXMtYysrXzEuNC4wLmJiCkBAIC0xNiw3ICsxNiw3IEBAIFBBQ0tBR0VDT05GSUdbd2l0aC10ZXN0
c10gPSAiLURCVUlMRF9URVNUUz1PTiAtRFRFU1RTX0lOU1RBTExfUEFUSD0ke2xpYmRpcn0vJHtC
CiAKIERFUEVORFMgKz0gImV4cGF0IgogCi1TUkNSRVYgPSAiMGVkYTg1NTc0NTQ2ZDE5ZDlmMDZk
NmQ1NDE4YmMxOTJiMzg0NmY5NiIKK1NSQ1JFViA9ICJiNDgyY2Q2ZDA4OTBlM2Y5YWUxNDFiNGFl
YjA3ZDM3MjRlNDhiM2RiIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2lzdGxlci1H
cm91cC9zZGJ1cy1jcHAuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXIiCiBTUkNfVVJJ
ICs9ICJmaWxlOi8vcnVuLXB0ZXN0IgotLSAKMi4zOS4yCgo=

--===============6345701099276453514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/sdbus-c++: PV changed from "1.3.0" to "1.4.0"
packages/core2-64-poky-linux/sdbus-c++: PKGV changed from 1.3.0 [default] to 1.4.0 [default]
packages/core2-64-poky-linux/sdbus-c++/sdbus-c++-dbg: FILELIST: removed "/usr/lib/.debug/libsdbus-c++.so.1.3.0", added "/usr/lib/.debug/libsdbus-c++.so.1.4.0"
packages/core2-64-poky-linux/sdbus-c++/sdbus-c++-dbg: PV changed from "1.3.0" to "1.4.0"
packages/core2-64-poky-linux/sdbus-c++/sdbus-c++-dbg: PKGV changed from 1.3.0 [default] to 1.4.0 [default]
packages/core2-64-poky-linux/sdbus-c++/sdbus-c++-dbg: PKGSIZE changed from 3283576 to 3494256 (+6%)
packages/core2-64-poky-linux/sdbus-c++/sdbus-c++-dev: PV changed from "1.3.0" to "1.4.0"
packages/core2-64-poky-linux/sdbus-c++/sdbus-c++-dev: PKGV changed from 1.3.0 [default] to 1.4.0 [default]
packages/core2-64-poky-linux/sdbus-c++/sdbus-c++-dev: PKGSIZE changed from 202844 to 220588 (+9%)
packages/core2-64-poky-linux/sdbus-c++/sdbus-c++-doc: PV changed from "1.3.0" to "1.4.0"
packages/core2-64-poky-linux/sdbus-c++/sdbus-c++-doc: PKGV changed from 1.3.0 [default] to 1.4.0 [default]
packages/core2-64-poky-linux/sdbus-c++/sdbus-c++-doc: PKGSIZE changed from 165924 to 174370 (+5%)
packages/core2-64-poky-linux/sdbus-c++/sdbus-c++-locale: PV changed from "1.3.0" to "1.4.0"
packages/core2-64-poky-linux/sdbus-c++/sdbus-c++-locale: PKGV changed from 1.3.0 [default] to 1.4.0 [default]
packages/core2-64-poky-linux/sdbus-c++/sdbus-c++-ptest: PV changed from "1.3.0" to "1.4.0"
packages/core2-64-poky-linux/sdbus-c++/sdbus-c++-ptest: PKGV changed from 1.3.0 [default] to 1.4.0 [default]
packages/core2-64-poky-linux/sdbus-c++/sdbus-c++-src: PV changed from "1.3.0" to "1.4.0"
packages/core2-64-poky-linux/sdbus-c++/sdbus-c++-src: PKGV changed from 1.3.0 [default] to 1.4.0 [default]
packages/core2-64-poky-linux/sdbus-c++/sdbus-c++-src: PKGSIZE changed from 286116 to 300319 (+5%)
packages/core2-64-poky-linux/sdbus-c++/sdbus-c++-staticdev: PV changed from "1.3.0" to "1.4.0"
packages/core2-64-poky-linux/sdbus-c++/sdbus-c++-staticdev: PKGV changed from 1.3.0 [default] to 1.4.0 [default]
packages/core2-64-poky-linux/sdbus-c++/sdbus-c++: FILELIST: removed "/usr/lib/libsdbus-c++.so.1.3.0", added "/usr/lib/libsdbus-c++.so.1.4.0"
packages/core2-64-poky-linux/sdbus-c++/sdbus-c++: PV changed from "1.3.0" to "1.4.0"
packages/core2-64-poky-linux/sdbus-c++/sdbus-c++: PKGV changed from 1.3.0 [default] to 1.4.0 [default]
packages/core2-64-poky-linux/sdbus-c++/sdbus-c++: PKGSIZE changed from 264285 to 268381 (+2%)
Changes to packages/core2-64-poky-linux/sdbus-c++ (sysroot):
  /usr/lib/libsdbus-c++.so.1 changed symlink target from libsdbus-c++.so.1.3.0 to libsdbus-c++.so.1.4.0
  /usr/lib/libsdbus-c++.so.1.3.0 moved to /usr/lib/libsdbus-c++.so.1.4.0

--===============6345701099276453514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/sdbus-c++/sdbus-c++: FILELIST: removed "/usr/lib/libsdbus-c++.so.1.3.0", added "/usr/lib/libsdbus-c++.so.1.4.0"
Changes to packages/core2-64-poky-linux/sdbus-c++ (sysroot):
  /usr/lib/libsdbus-c++.so.1 changed symlink target from libsdbus-c++.so.1.3.0 to libsdbus-c++.so.1.4.0
  /usr/lib/libsdbus-c++.so.1.3.0 moved to /usr/lib/libsdbus-c++.so.1.4.0

--===============6345701099276453514==--

