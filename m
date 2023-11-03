Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F8FFC07542
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:50 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.63871.1699041166188751429
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EtX1THaQ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=VvQ+aW89;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b96bebf28-3470b723-e2a5-4294-ae74-f7750b80e7cb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041165;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OwOHpWaxw4RVibIEP9Oy/47/EmckTLZMii13oMSuEwg=;
	b=EtX1THaQsxVs2ln2bOvMGxUPbzIqfhN8452MuyTd1OEHJvixHYZl1hMN+Afla5ya
	ZFsa/SE/YWgvrZWLAWGmaTR9MVVdzkFX6U3TJ/idhVuLz4LXfVkJBhyMrzWK6CpfGvU
	upxDcS8khsZZgD4js9wLUsbUF8PX2F5C1NtqddpY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041165;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OwOHpWaxw4RVibIEP9Oy/47/EmckTLZMii13oMSuEwg=;
	b=VvQ+aW89gXQGZgohxgA8ROmfpERVNctSh/ALOaqocck7utX6exE0/9McsdFMDQnS
	13nIMnfa+Ti/gpavReWsNJRxMWRVtGOyLcfcFJHvpc3uykNEHCsbDtfcpiyVwIeOJPr
	HZceSs+517l/U47RcjldE2Q/Bvo6JwHP4ws7iaR8=
Content-Type: multipart/mixed; boundary="===============6473982878749659550=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] cjson: upgrading to 1.7.16 SUCCEEDED
Message-ID: <0101018b96bebf28-3470b723-e2a5-4294-ae74-f7750b80e7cb-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:45 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105898

--===============6473982878749659550==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cjson* to *1.7.16* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cjson-upgrade-1.7.15-1.7.16.patch
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
From 6eabc83de3ddcb13a29ad35243d0f29faec3c1e1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 11:52:48 +0000
Subject: [PATCH] cjson: upgrade 1.7.15 -> 1.7.16

---
 .../recipes-devtools/cjson/{cjson_1.7.15.bb => cjson_1.7.16.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/cjson/{cjson_1.7.15.bb => cjson_1.7.16.bb} (96%)

diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.15.bb b/meta-oe/recipes-devtools/cjson/cjson_1.7.16.bb
similarity index 96%
rename from meta-oe/recipes-devtools/cjson/cjson_1.7.15.bb
rename to meta-oe/recipes-devtools/cjson/cjson_1.7.16.bb
index 1841aeffc..f8e0bbff0 100644
--- a/meta-oe/recipes-devtools/cjson/cjson_1.7.15.bb
+++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.16.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=218947f77e8cb8e2fa02918dc41c50d0"
 SRC_URI = "git://github.com/DaveGamble/cJSON.git;branch=master;protocol=https \
            file://run-ptest \
          "
-SRCREV = "d348621ca93571343a56862df7de4ff3bc9b5667"
+SRCREV = "cb8693b058ba302f4829ec6d03f609ac6f848546"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============6473982878749659550==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/cjson/cjson-dbg: PKGSIZE changed from 3779056 to 3787384 (+0%)
packages/core2-64-poky-linux/cjson/cjson-dbg: PKGV changed from 1.7.15 [default] to 1.7.16 [default]
packages/core2-64-poky-linux/cjson/cjson-dbg: FILELIST: removed "/usr/lib/.debug/libcjson_utils.so.1.7.15 /usr/lib/.debug/libcjson.so.1.7.15", added "/usr/lib/.debug/libcjson_utils.so.1.7.16 /usr/lib/.debug/libcjson.so.1.7.16"
packages/core2-64-poky-linux/cjson/cjson-dbg: PV changed from "1.7.15" to "1.7.16"
packages/core2-64-poky-linux/cjson/cjson-dev: PKGSIZE changed from 30919 to 32858 (+6%)
packages/core2-64-poky-linux/cjson/cjson-dev: PKGV changed from 1.7.15 [default] to 1.7.16 [default]
packages/core2-64-poky-linux/cjson/cjson-dev: PV changed from "1.7.15" to "1.7.16"
packages/core2-64-poky-linux/cjson/cjson-doc: PKGV changed from 1.7.15 [default] to 1.7.16 [default]
packages/core2-64-poky-linux/cjson/cjson-doc: PV changed from "1.7.15" to "1.7.16"
packages/core2-64-poky-linux/cjson/cjson-locale: PKGV changed from 1.7.15 [default] to 1.7.16 [default]
packages/core2-64-poky-linux/cjson/cjson-locale: PV changed from "1.7.15" to "1.7.16"
packages/core2-64-poky-linux/cjson/cjson-ptest: PKGSIZE changed from 1287884 to 1304268 (+1%)
packages/core2-64-poky-linux/cjson/cjson-ptest: PKGV changed from 1.7.15 [default] to 1.7.16 [default]
packages/core2-64-poky-linux/cjson/cjson-ptest: PV changed from "1.7.15" to "1.7.16"
packages/core2-64-poky-linux/cjson/cjson-src: PKGSIZE changed from 472713 to 475432 (+1%)
packages/core2-64-poky-linux/cjson/cjson-src: PKGV changed from 1.7.15 [default] to 1.7.16 [default]
packages/core2-64-poky-linux/cjson/cjson-src: PV changed from "1.7.15" to "1.7.16"
packages/core2-64-poky-linux/cjson/cjson-staticdev: PKGSIZE changed from 197752 to 198168 (+0%)
packages/core2-64-poky-linux/cjson/cjson-staticdev: PKGV changed from 1.7.15 [default] to 1.7.16 [default]
packages/core2-64-poky-linux/cjson/cjson-staticdev: PV changed from "1.7.15" to "1.7.16"
packages/core2-64-poky-linux/cjson/cjson: PKGV changed from 1.7.15 [default] to 1.7.16 [default]
packages/core2-64-poky-linux/cjson/cjson: FILELIST: removed "/usr/lib/libcjson.so.1.7.15 /usr/lib/libcjson_utils.so.1.7.15", added "/usr/lib/libcjson_utils.so.1.7.16 /usr/lib/libcjson.so.1.7.16"
packages/core2-64-poky-linux/cjson/cjson: PV changed from "1.7.15" to "1.7.16"
packages/core2-64-poky-linux/cjson: PKGV changed from 1.7.15 [default] to 1.7.16 [default]
packages/core2-64-poky-linux/cjson: PV changed from "1.7.15" to "1.7.16"
Changes to packages/core2-64-poky-linux/cjson (sysroot):
  /usr/lib/libcjson.so.1 changed symlink target from libcjson.so.1.7.15 to libcjson.so.1.7.16
  /usr/lib/libcjson_utils.so.1 changed symlink target from libcjson_utils.so.1.7.15 to libcjson_utils.so.1.7.16
  /usr/lib/libcjson.so.1.7.15 moved to /usr/lib/libcjson.so.1.7.16
  /usr/lib/libcjson_utils.so.1.7.15 moved to /usr/lib/libcjson_utils.so.1.7.16

--===============6473982878749659550==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/cjson/cjson: FILELIST: removed "/usr/lib/libcjson.so.1.7.15 /usr/lib/libcjson_utils.so.1.7.15", added "/usr/lib/libcjson.so.1.7.16 /usr/lib/libcjson_utils.so.1.7.16"
Changes to packages/core2-64-poky-linux/cjson (sysroot):
  /usr/lib/libcjson.so.1 changed symlink target from libcjson.so.1.7.15 to libcjson.so.1.7.16
  /usr/lib/libcjson_utils.so.1 changed symlink target from libcjson_utils.so.1.7.15 to libcjson_utils.so.1.7.16
  /usr/lib/libcjson.so.1.7.15 moved to /usr/lib/libcjson.so.1.7.16
  /usr/lib/libcjson_utils.so.1.7.15 moved to /usr/lib/libcjson_utils.so.1.7.16

--===============6473982878749659550==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cjson-upgrade-1.7.15-1.7.16.patch"

RnJvbSA2ZWFiYzgzZGUzZGRjYjEzYTI5YWQzNTI0M2QwZjI5ZmFlYzNjMWUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxMTo1Mjo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNq
c29uOiB1cGdyYWRlIDEuNy4xNSAtPiAxLjcuMTYKCi0tLQogLi4uL3JlY2lwZXMtZGV2dG9vbHMv
Y2pzb24ve2Nqc29uXzEuNy4xNS5iYiA9PiBjanNvbl8xLjcuMTYuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS1vZS9y
ZWNpcGVzLWRldnRvb2xzL2Nqc29uL3tjanNvbl8xLjcuMTUuYmIgPT4gY2pzb25fMS43LjE2LmJi
fSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9janNvbi9janNv
bl8xLjcuMTUuYmIgYi9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvY2pzb24vY2pzb25fMS43LjE2
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEtb2UvcmVjaXBlcy1kZXZ0
b29scy9janNvbi9janNvbl8xLjcuMTUuYmIKcmVuYW1lIHRvIG1ldGEtb2UvcmVjaXBlcy1kZXZ0
b29scy9janNvbi9janNvbl8xLjcuMTYuYmIKaW5kZXggMTg0MWFlZmZjLi5mOGUwYmJmZjAgMTAw
NjQ0Ci0tLSBhL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9janNvbi9janNvbl8xLjcuMTUuYmIK
KysrIGIvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2Nqc29uL2Nqc29uXzEuNy4xNi5iYgpAQCAt
Nyw3ICs3LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MjE4OTQ3
Zjc3ZThjYjhlMmZhMDI5MThkYzQxYzUwZDAiCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20v
RGF2ZUdhbWJsZS9jSlNPTi5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyBcCiAgICAg
ICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAgIgotU1JDUkVWID0gImQzNDg2MjFj
YTkzNTcxMzQzYTU2ODYyZGY3ZGU0ZmYzYmM5YjU2NjciCitTUkNSRVYgPSAiY2I4NjkzYjA1OGJh
MzAyZjQ4MjllYzZkMDNmNjA5YWM2Zjg0ODU0NiIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAot
LSAKMi4zOS4yCgo=

--===============6473982878749659550==--

