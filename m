Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 646D5C001B2
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 20:02:28 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.64114.1699041739587019372
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 13:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gaLbPtlB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FOcTEpKw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018b96c78128-0107c679-1550-4599-9a84-526d0eaac6cd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lLi34j8FxT235eB+hfcf2vnqmpr1i7Hi3YD22EaHxtU=;
	b=gaLbPtlBH21PKKNE6uA5zNOgADvIKCdIkEmDih7MI5n1IGRVCy48qWr7YDJ2Lgse
	TB2o84/O4b7yod5yYzsHLLHFN371D072zikra8sQYwmfJBf6uSCQeaj0cRefBYWVfX9
	xjAtFioqgSvcJyRfEzSWlz5s7h4rI13sEbMJb5pY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lLi34j8FxT235eB+hfcf2vnqmpr1i7Hi3YD22EaHxtU=;
	b=FOcTEpKwiHAFuU5Ns5MfFq4L1YHAE/JoWFk7WAWU7aqEI6sd4RrNPR6NPPHdN47k
	PTGW+cYR21LEBht9YoHKQgRxGoIwzmAVeP3XJ31UzBuGyIZsDTw1NdTRXxCJGN0EFc3
	OLNS4uzQsAzYfB5RtoolL67ZsmDLC3ybBxYOvUnw=
Content-Type: multipart/mixed; boundary="===============2204626441923874512=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] wtmpdb: upgrading to 0.9.3 SUCCEEDED
Message-ID: <0101018b96c78128-0107c679-1550-4599-9a84-526d0eaac6cd-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 20:02:19 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.33
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 20:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106078

--===============2204626441923874512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wtmpdb* to *0.9.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wtmpdb-upgrade-0.7.1-0.9.3.patch
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
From bd87225d77cc219123378d8ef46dc9548bd1de53 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 19:19:33 +0000
Subject: [PATCH] wtmpdb: upgrade 0.7.1 -> 0.9.3

---
 .../wtmpdb/{wtmpdb_0.7.1.bb => wtmpdb_0.9.3.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/wtmpdb/{wtmpdb_0.7.1.bb => wtmpdb_0.9.3.bb} (96%)

diff --git a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.7.1.bb b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.9.3.bb
similarity index 96%
rename from meta-oe/recipes-extended/wtmpdb/wtmpdb_0.7.1.bb
rename to meta-oe/recipes-extended/wtmpdb/wtmpdb_0.9.3.bb
index cffae2d43..6d23c0070 100644
--- a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.7.1.bb
+++ b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.9.3.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=020090a00b69dd2af9ab82eb0003ea2c"
 SECTION = "libs"
 
-SRCREV = "502b19a41c7a3b1b5e70969b18088683825f71f8"
+SRCREV = "8ef2677a13d19aee3a834500f9c8a4dac9d68ef7"
 
 SRC_URI = "git://github.com/thkukuk/wtmpdb.git;branch=main;protocol=https \
            file://0001-remove-lto-to-fix-link-error-of-clang.patch \
-- 
2.39.2


--===============2204626441923874512==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wtmpdb-upgrade-0.7.1-0.9.3.patch"

RnJvbSBiZDg3MjI1ZDc3Y2MyMTkxMjMzNzhkOGVmNDZkYzk1NDhiZDFkZTUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxOToxOTozMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHd0
bXBkYjogdXBncmFkZSAwLjcuMSAtPiAwLjkuMwoKLS0tCiAuLi4vd3RtcGRiL3t3dG1wZGJfMC43
LjEuYmIgPT4gd3RtcGRiXzAuOS4zLmJifSAgICAgICAgICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhLW9lL3Jl
Y2lwZXMtZXh0ZW5kZWQvd3RtcGRiL3t3dG1wZGJfMC43LjEuYmIgPT4gd3RtcGRiXzAuOS4zLmJi
fSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC93dG1wZGIvd3Rt
cGRiXzAuNy4xLmJiIGIvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3d0bXBkYi93dG1wZGJfMC45
LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS1vZS9yZWNpcGVzLWV4
dGVuZGVkL3d0bXBkYi93dG1wZGJfMC43LjEuYmIKcmVuYW1lIHRvIG1ldGEtb2UvcmVjaXBlcy1l
eHRlbmRlZC93dG1wZGIvd3RtcGRiXzAuOS4zLmJiCmluZGV4IGNmZmFlMmQ0My4uNmQyM2MwMDcw
IDEwMDY0NAotLS0gYS9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvd3RtcGRiL3d0bXBkYl8wLjcu
MS5iYgorKysgYi9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvd3RtcGRiL3d0bXBkYl8wLjkuMy5i
YgpAQCAtNSw3ICs1LDcgQEAgTElDRU5TRSA9ICJCU0QtMi1DbGF1c2UiCiBMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0wMjAwOTBhMDBiNjlkZDJhZjlhYjgyZWIwMDAzZWEy
YyIKIFNFQ1RJT04gPSAibGlicyIKIAotU1JDUkVWID0gIjUwMmIxOWE0MWM3YTNiMWI1ZTcwOTY5
YjE4MDg4NjgzODI1ZjcxZjgiCitTUkNSRVYgPSAiOGVmMjY3N2ExM2QxOWFlZTNhODM0NTAwZjlj
OGE0ZGFjOWQ2OGVmNyIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3Roa3VrdWsvd3Rt
cGRiLmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1odHRwcyBcCiAgICAgICAgICAgIGZpbGU6Ly8w
MDAxLXJlbW92ZS1sdG8tdG8tZml4LWxpbmstZXJyb3Itb2YtY2xhbmcucGF0Y2ggXAotLSAKMi4z
OS4yCgo=

--===============2204626441923874512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/wtmpdb: PV changed from "0.7.1" to "0.9.3"
packages/core2-64-poky-linux/wtmpdb: PKGV changed from 0.7.1 [default] to 0.9.3 [default]
Changes to packages/core2-64-poky-linux/wtmpdb (sysroot):
  /usr/lib/libwtmpdb.so.0 changed symlink target from libwtmpdb.so.0.7.1 to libwtmpdb.so.0.9.3
  /usr/lib/libwtmpdb.so.0.7.1 moved to /usr/lib/libwtmpdb.so.0.9.3
packages/core2-64-poky-linux/wtmpdb/wtmpdb-dbg: PKGSIZE changed from 92272 to 97360 (+6%)
packages/core2-64-poky-linux/wtmpdb/wtmpdb-dbg: PV changed from "0.7.1" to "0.9.3"
packages/core2-64-poky-linux/wtmpdb/wtmpdb-dbg: PKGV changed from 0.7.1 [default] to 0.9.3 [default]
packages/core2-64-poky-linux/wtmpdb/wtmpdb-dbg: FILELIST: removed "/usr/lib/.debug/libwtmpdb.so.0.7.1", added "/usr/lib/.debug/libwtmpdb.so.0.9.3"
packages/core2-64-poky-linux/wtmpdb/wtmpdb-dev: PKGSIZE changed from 3024 to 3143 (+4%)
packages/core2-64-poky-linux/wtmpdb/wtmpdb-dev: PV changed from "0.7.1" to "0.9.3"
packages/core2-64-poky-linux/wtmpdb/wtmpdb-dev: PKGV changed from 0.7.1 [default] to 0.9.3 [default]
packages/core2-64-poky-linux/wtmpdb/wtmpdb-doc: PV changed from "0.7.1" to "0.9.3"
packages/core2-64-poky-linux/wtmpdb/wtmpdb-doc: PKGV changed from 0.7.1 [default] to 0.9.3 [default]
packages/core2-64-poky-linux/wtmpdb/wtmpdb-locale: PV changed from "0.7.1" to "0.9.3"
packages/core2-64-poky-linux/wtmpdb/wtmpdb-locale: PKGV changed from 0.7.1 [default] to 0.9.3 [default]
packages/core2-64-poky-linux/wtmpdb/wtmpdb-src: PKGSIZE changed from 54820 to 59198 (+8%)
packages/core2-64-poky-linux/wtmpdb/wtmpdb-src: PV changed from "0.7.1" to "0.9.3"
packages/core2-64-poky-linux/wtmpdb/wtmpdb-src: PKGV changed from 0.7.1 [default] to 0.9.3 [default]
packages/core2-64-poky-linux/wtmpdb/wtmpdb-staticdev: PV changed from "0.7.1" to "0.9.3"
packages/core2-64-poky-linux/wtmpdb/wtmpdb-staticdev: PKGV changed from 0.7.1 [default] to 0.9.3 [default]
packages/core2-64-poky-linux/wtmpdb/wtmpdb: PKGSIZE changed from 64888 to 73072 (+13%)
packages/core2-64-poky-linux/wtmpdb/wtmpdb: PV changed from "0.7.1" to "0.9.3"
packages/core2-64-poky-linux/wtmpdb/wtmpdb: PKGV changed from 0.7.1 [default] to 0.9.3 [default]
packages/core2-64-poky-linux/wtmpdb/wtmpdb: FILELIST: removed "/usr/lib/libwtmpdb.so.0.7.1", added "/usr/lib/libwtmpdb.so.0.9.3"

--===============2204626441923874512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/wtmpdb (sysroot):
  /usr/lib/libwtmpdb.so.0 changed symlink target from libwtmpdb.so.0.7.1 to libwtmpdb.so.0.9.3
  /usr/lib/libwtmpdb.so.0.7.1 moved to /usr/lib/libwtmpdb.so.0.9.3
packages/core2-64-poky-linux/wtmpdb/wtmpdb: FILELIST: removed "/usr/lib/libwtmpdb.so.0.7.1", added "/usr/lib/libwtmpdb.so.0.9.3"
packages/core2-64-poky-linux/wtmpdb/wtmpdb: PKGSIZE changed from 64888 to 73072 (+13%)

--===============2204626441923874512==--

