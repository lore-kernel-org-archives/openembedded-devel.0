Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA159C04A95
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 20:02:28 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.63226.1699041739289928185
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 13:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=K8EuTGl+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=b6gUamn3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b96c77d83-a4f72c4b-92a1-462e-bc18-e36bf976238d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041738;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XMW6sNSdZjDVvo89gWB82qNSQC42o5r7n6zctDopSm4=;
	b=K8EuTGl+wHDpqwino8IRWwgVufgIRb+2QRHUOk7Cu1pu/pyb3HR6FMZUoEZH6IGT
	AyS6LLaBp4tl98qA6tNp1jTbZ7cpfrMI3tJzrKOKIyGRUgHjPMAUa/1da4Nu4LAa8bb
	yAB1kMhH37/DfFXBKLm1p1psdetTcs4l6JER8tiI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041738;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XMW6sNSdZjDVvo89gWB82qNSQC42o5r7n6zctDopSm4=;
	b=b6gUamn3td4cvM5iEcBlYl9gJBAlJk1FLJSMES34Ge6IL7WhV5tvyKjnmtM0EPlC
	Xiqc13+7n93fSGmlSSRcwIJLA+Vwd36hhoNWn/xl698bCyWKyYWdKDk56vkoqaJJWyr
	q4M3ht+/HKdkaFuD1P8aQLFddkRXu0BIvOIoRJQs=
Content-Type: multipart/mixed; boundary="===============0258308972728602584=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] pmdk: upgrading to 2.0.0 SUCCEEDED
Message-ID: <0101018b96c77d83-a4f72c4b-92a1-462e-bc18-e36bf976238d-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 20:02:18 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 20:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106069

--===============0258308972728602584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pmdk* to *2.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pmdk-upgrade-1.12.1-2.0.0.patch
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
From 09e62276d507d6a85d0c203055bf7508c8d5d38b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 17:51:49 +0000
Subject: [PATCH] pmdk: upgrade 1.12.1 -> 2.0.0

---
 ...unction-prototypes-of-enum_to_str_fn.patch | 43 -------------------
 .../pmdk/{pmdk_1.12.1.bb => pmdk_2.0.0.bb}    |  5 +--
 2 files changed, 2 insertions(+), 46 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/pmdk/pmdk/0001-pmempool-Match-function-prototypes-of-enum_to_str_fn.patch
 rename meta-oe/recipes-extended/pmdk/{pmdk_1.12.1.bb => pmdk_2.0.0.bb} (86%)

diff --git a/meta-oe/recipes-extended/pmdk/pmdk/0001-pmempool-Match-function-prototypes-of-enum_to_str_fn.patch b/meta-oe/recipes-extended/pmdk/pmdk/0001-pmempool-Match-function-prototypes-of-enum_to_str_fn.patch
deleted file mode 100644
index b16b633a3..000000000
--- a/meta-oe/recipes-extended/pmdk/pmdk/0001-pmempool-Match-function-prototypes-of-enum_to_str_fn.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From de6425acaa50426883e85a599001ae5e927aec5b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 2 Mar 2023 16:23:56 -0800
-Subject: [PATCH] pmempool: Match function prototypes of enum_to_str_fn
- function pointer
-
-This is flagged by clang 16+
-common.c:844:4: error: cast from 'const char *(*)(enum chunk_type)' to 'enum_to_str_fn' (aka 'const char *(*)(int)') converts to incompatible function type [-Werror,-Wcast-function-type-strict]
-                        (enum_to_str_fn)out_get_chunk_type_str);
-                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-1 error generated.
-
-Upstream-Status: Submitted [https://github.com/pmem/pmdk/pull/5543]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/tools/pmempool/common.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/tools/pmempool/common.c b/src/tools/pmempool/common.c
-index 5e7e472cc..4b7e9b95f 100644
---- a/src/tools/pmempool/common.c
-+++ b/src/tools/pmempool/common.c
-@@ -41,7 +41,7 @@
- 
- #define REQ_BUFF_SIZE	2048U
- #define Q_BUFF_SIZE	8192
--typedef const char *(*enum_to_str_fn)(int);
-+typedef const char *(*enum_to_str_fn)(enum chunk_type);
- 
- /*
-  * pmem_pool_type -- return pool type based on first two pages.
-@@ -790,7 +790,7 @@ util_parse_enum(const char *str, int first, int max, uint64_t *bitmap,
- 		enum_to_str_fn enum_to_str)
- {
- 	for (int i = first; i < max; i++) {
--		if (strcmp(str, enum_to_str(i)) == 0) {
-+		if (strcmp(str, enum_to_str((enum chunk_type)i)) == 0) {
- 			*bitmap |= (uint64_t)1<<i;
- 			return 0;
- 		}
--- 
-2.39.2
-
diff --git a/meta-oe/recipes-extended/pmdk/pmdk_1.12.1.bb b/meta-oe/recipes-extended/pmdk/pmdk_2.0.0.bb
similarity index 86%
rename from meta-oe/recipes-extended/pmdk/pmdk_1.12.1.bb
rename to meta-oe/recipes-extended/pmdk/pmdk_2.0.0.bb
index 5261922cd..aeda23690 100644
--- a/meta-oe/recipes-extended/pmdk/pmdk_1.12.1.bb
+++ b/meta-oe/recipes-extended/pmdk/pmdk_2.0.0.bb
@@ -11,9 +11,8 @@ DEPENDS:append:libc-musl = " fts"
 
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://github.com/pmem/pmdk.git;branch=stable-1.12;protocol=https \
-           file://0001-pmempool-Match-function-prototypes-of-enum_to_str_fn.patch"
-SRCREV = "786098a024c6fe60e746f2cb1041bcfcd21386c9"
+SRC_URI = "git://github.com/pmem/pmdk.git;branch=master;protocol=https"
+SRCREV = "ba92d6b469d52d16f26279bebaf317bbdbb3822c"
 
 inherit autotools-brokensep pkgconfig
 
-- 
2.39.2


--===============0258308972728602584==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pmdk-upgrade-1.12.1-2.0.0.patch"

RnJvbSAwOWU2MjI3NmQ1MDdkNmE4NWQwYzIwMzA1NWJmNzUwOGM4ZDVkMzhiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxNzo1MTo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBt
ZGs6IHVwZ3JhZGUgMS4xMi4xIC0+IDIuMC4wCgotLS0KIC4uLnVuY3Rpb24tcHJvdG90eXBlcy1v
Zi1lbnVtX3RvX3N0cl9mbi5wYXRjaCB8IDQzIC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi9wbWRr
L3twbWRrXzEuMTIuMS5iYiA9PiBwbWRrXzIuMC4wLmJifSAgICB8ICA1ICstLQogMiBmaWxlcyBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQ2IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAw
NjQ0IG1ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9wbWRrL3BtZGsvMDAwMS1wbWVtcG9vbC1NYXRj
aC1mdW5jdGlvbi1wcm90b3R5cGVzLW9mLWVudW1fdG9fc3RyX2ZuLnBhdGNoCiByZW5hbWUgbWV0
YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3BtZGsve3BtZGtfMS4xMi4xLmJiID0+IHBtZGtfMi4wLjAu
YmJ9ICg4NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3BtZGsvcG1k
ay8wMDAxLXBtZW1wb29sLU1hdGNoLWZ1bmN0aW9uLXByb3RvdHlwZXMtb2YtZW51bV90b19zdHJf
Zm4ucGF0Y2ggYi9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvcG1kay9wbWRrLzAwMDEtcG1lbXBv
b2wtTWF0Y2gtZnVuY3Rpb24tcHJvdG90eXBlcy1vZi1lbnVtX3RvX3N0cl9mbi5wYXRjaApkZWxl
dGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYjE2YjYzM2EzLi4wMDAwMDAwMDAKLS0tIGEvbWV0
YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3BtZGsvcG1kay8wMDAxLXBtZW1wb29sLU1hdGNoLWZ1bmN0
aW9uLXByb3RvdHlwZXMtb2YtZW51bV90b19zdHJfZm4ucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAt
MSw0MyArMCwwIEBACi1Gcm9tIGRlNjQyNWFjYWE1MDQyNjg4M2U4NWE1OTkwMDFhZTVlOTI3YWVj
NWIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21h
aWwuY29tPgotRGF0ZTogVGh1LCAyIE1hciAyMDIzIDE2OjIzOjU2IC0wODAwCi1TdWJqZWN0OiBb
UEFUQ0hdIHBtZW1wb29sOiBNYXRjaCBmdW5jdGlvbiBwcm90b3R5cGVzIG9mIGVudW1fdG9fc3Ry
X2ZuCi0gZnVuY3Rpb24gcG9pbnRlcgotCi1UaGlzIGlzIGZsYWdnZWQgYnkgY2xhbmcgMTYrCi1j
b21tb24uYzo4NDQ6NDogZXJyb3I6IGNhc3QgZnJvbSAnY29uc3QgY2hhciAqKCopKGVudW0gY2h1
bmtfdHlwZSknIHRvICdlbnVtX3RvX3N0cl9mbicgKGFrYSAnY29uc3QgY2hhciAqKCopKGludCkn
KSBjb252ZXJ0cyB0byBpbmNvbXBhdGlibGUgZnVuY3Rpb24gdHlwZSBbLVdlcnJvciwtV2Nhc3Qt
ZnVuY3Rpb24tdHlwZS1zdHJpY3RdCi0gICAgICAgICAgICAgICAgICAgICAgICAoZW51bV90b19z
dHJfZm4pb3V0X2dldF9jaHVua190eXBlX3N0cik7Ci0gICAgICAgICAgICAgICAgICAgICAgICBe
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgotMSBlcnJvciBnZW5lcmF0ZWQu
Ci0KLVVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dpdGh1Yi5jb20vcG1lbS9w
bWRrL3B1bGwvNTU0M10KLVNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5j
b20+Ci0tLS0KLSBzcmMvdG9vbHMvcG1lbXBvb2wvY29tbW9uLmMgfCA0ICsrLS0KLSAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEv
c3JjL3Rvb2xzL3BtZW1wb29sL2NvbW1vbi5jIGIvc3JjL3Rvb2xzL3BtZW1wb29sL2NvbW1vbi5j
Ci1pbmRleCA1ZTdlNDcyY2MuLjRiN2U5Yjk1ZiAxMDA2NDQKLS0tLSBhL3NyYy90b29scy9wbWVt
cG9vbC9jb21tb24uYwotKysrIGIvc3JjL3Rvb2xzL3BtZW1wb29sL2NvbW1vbi5jCi1AQCAtNDEs
NyArNDEsNyBAQAotIAotICNkZWZpbmUgUkVRX0JVRkZfU0laRQkyMDQ4VQotICNkZWZpbmUgUV9C
VUZGX1NJWkUJODE5MgotLXR5cGVkZWYgY29uc3QgY2hhciAqKCplbnVtX3RvX3N0cl9mbikoaW50
KTsKLSt0eXBlZGVmIGNvbnN0IGNoYXIgKigqZW51bV90b19zdHJfZm4pKGVudW0gY2h1bmtfdHlw
ZSk7Ci0gCi0gLyoKLSAgKiBwbWVtX3Bvb2xfdHlwZSAtLSByZXR1cm4gcG9vbCB0eXBlIGJhc2Vk
IG9uIGZpcnN0IHR3byBwYWdlcy4KLUBAIC03OTAsNyArNzkwLDcgQEAgdXRpbF9wYXJzZV9lbnVt
KGNvbnN0IGNoYXIgKnN0ciwgaW50IGZpcnN0LCBpbnQgbWF4LCB1aW50NjRfdCAqYml0bWFwLAot
IAkJZW51bV90b19zdHJfZm4gZW51bV90b19zdHIpCi0gewotIAlmb3IgKGludCBpID0gZmlyc3Q7
IGkgPCBtYXg7IGkrKykgewotLQkJaWYgKHN0cmNtcChzdHIsIGVudW1fdG9fc3RyKGkpKSA9PSAw
KSB7Ci0rCQlpZiAoc3RyY21wKHN0ciwgZW51bV90b19zdHIoKGVudW0gY2h1bmtfdHlwZSlpKSkg
PT0gMCkgewotIAkJCSpiaXRtYXAgfD0gKHVpbnQ2NF90KTE8PGk7Ci0gCQkJcmV0dXJuIDA7Ci0g
CQl9Ci0tLSAKLTIuMzkuMgotCmRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQv
cG1kay9wbWRrXzEuMTIuMS5iYiBiL21ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9wbWRrL3BtZGtf
Mi4wLjAuYmIKc2ltaWxhcml0eSBpbmRleCA4NiUKcmVuYW1lIGZyb20gbWV0YS1vZS9yZWNpcGVz
LWV4dGVuZGVkL3BtZGsvcG1ka18xLjEyLjEuYmIKcmVuYW1lIHRvIG1ldGEtb2UvcmVjaXBlcy1l
eHRlbmRlZC9wbWRrL3BtZGtfMi4wLjAuYmIKaW5kZXggNTI2MTkyMmNkLi5hZWRhMjM2OTAgMTAw
NjQ0Ci0tLSBhL21ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9wbWRrL3BtZGtfMS4xMi4xLmJiCisr
KyBiL21ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9wbWRrL3BtZGtfMi4wLjAuYmIKQEAgLTExLDkg
KzExLDggQEAgREVQRU5EUzphcHBlbmQ6bGliYy1tdXNsID0gIiBmdHMiCiAKIFMgPSAiJHtXT1JL
RElSfS9naXQiCiAKLVNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9wbWVtL3BtZGsuZ2l0O2Jy
YW5jaD1zdGFibGUtMS4xMjtwcm90b2NvbD1odHRwcyBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAx
LXBtZW1wb29sLU1hdGNoLWZ1bmN0aW9uLXByb3RvdHlwZXMtb2YtZW51bV90b19zdHJfZm4ucGF0
Y2giCi1TUkNSRVYgPSAiNzg2MDk4YTAyNGM2ZmU2MGU3NDZmMmNiMTA0MWJjZmNkMjEzODZjOSIK
K1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9wbWVtL3BtZGsuZ2l0O2JyYW5jaD1tYXN0ZXI7
cHJvdG9jb2w9aHR0cHMiCitTUkNSRVYgPSAiYmE5MmQ2YjQ2OWQ1MmQxNmYyNjI3OWJlYmFmMzE3
YmJkYmIzODIyYyIKIAogaW5oZXJpdCBhdXRvdG9vbHMtYnJva2Vuc2VwIHBrZ2NvbmZpZwogCi0t
IAoyLjM5LjIKCg==

--===============0258308972728602584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/pmdk: SRC_URI changed from "git://github.com/pmem/pmdk.git;branch=stable-1.12;protocol=https file://0001-pmempool-Match-function-prototypes-of-enum_to_str_fn.patch" to "git://github.com/pmem/pmdk.git;branch=master;protocol=https"
packages/core2-64-poky-linux/pmdk: PKGV changed from 1.12.1 [default] to 2.0.0 [default]
packages/core2-64-poky-linux/pmdk: PV changed from "1.12.1" to "2.0.0"
packages/core2-64-poky-linux/pmdk/pmdk-dbg: PKGSIZE changed from 15768312 to 13190808 (-16%)
packages/core2-64-poky-linux/pmdk/pmdk-dbg: FILELIST: removed "/usr/lib/.debug/libpmemlog.so.1.0.0 /usr/lib/.debug/libpmemblk.so.1.0.0"
packages/core2-64-poky-linux/pmdk/pmdk-dbg: PKGV changed from 1.12.1 [default] to 2.0.0 [default]
packages/core2-64-poky-linux/pmdk/pmdk-dbg: PV changed from "1.12.1" to "2.0.0"
packages/core2-64-poky-linux/pmdk/pmdk-dev: PKGSIZE changed from 93546 to 71371 (-24%)
packages/core2-64-poky-linux/pmdk/pmdk-dev: FILELIST: removed "/usr/lib/pkgconfig/libpmemblk.pc /usr/include/libpmemlog.h /usr/include/libpmemblk.h /usr/lib/libpmemlog.so /usr/lib/pkgconfig/libpmemlog.pc /usr/lib/libpmemblk.so /usr/include/libpmem2/async.h"
packages/core2-64-poky-linux/pmdk/pmdk-dev: PKGV changed from 1.12.1 [default] to 2.0.0 [default]
packages/core2-64-poky-linux/pmdk/pmdk-dev: PV changed from "1.12.1" to "2.0.0"
packages/core2-64-poky-linux/pmdk/pmdk-doc: PKGV changed from 1.12.1 [default] to 2.0.0 [default]
packages/core2-64-poky-linux/pmdk/pmdk-doc: PV changed from "1.12.1" to "2.0.0"
packages/core2-64-poky-linux/pmdk/pmdk-locale: PKGV changed from 1.12.1 [default] to 2.0.0 [default]
packages/core2-64-poky-linux/pmdk/pmdk-locale: PV changed from "1.12.1" to "2.0.0"
packages/core2-64-poky-linux/pmdk/pmdk-src: PKGSIZE changed from 2434558 to 2060308 (-15%)
packages/core2-64-poky-linux/pmdk/pmdk-src: FILELIST: directory renamed /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/x86_64/memcpy -> /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/x86_64/memcpy, directory renamed /usr/src/debug/pmdk/1.12.1-r0/src/libpmem -> /usr/src/debug/pmdk/2.0.0-r0/src/libpmem, directory renamed /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/x86_64/memset -> /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/x86_64/memset, directory renamed /usr/src/debug/pmdk/1.12.1-r0/src/tools/daxio -> /usr/src/debug/pmdk/2.0.0-r0/src/tools/daxio, directory renamed /usr/src/debug/pmdk/1.12.1-r0/src/libpmemobj -> /usr/src/debug/pmdk/2.0.0-r0/src/libpmemobj, directory renamed /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/x86_64 -> /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/x86_64, directory renamed /usr/src/debug/pmdk/1.12.1-r0/src/include/libpmemobj -> /usr/src/debug/pmdk/2.0.0-r0/src/include/libpmemobj, directory renamed /usr/src/debug/pmdk/1.12.1-r0/src/core/valgrind -> /usr/src/debug/pmdk/2.0.0-r0
 /src/core/valgrind, removed "/usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/vm_reservation_posix.c /usr/src/debug/pmdk/1.12.1-r0/src/core/pmemcore.h /usr/src/debug/pmdk/1.12.1-r0/src/common/set.c /usr/src/debug/pmdk/1.12.1-r0/src/common/set.h /usr/src/debug/pmdk/1.12.1-r0/src/deps/miniasync/src/include/libminiasync/vdm.h /usr/src/debug/pmdk/1.12.1-r0/src/core/os_thread_posix.c /usr/src/debug/pmdk/1.12.1-r0/src/core/util.h /usr/src/debug/pmdk/1.12.1-r0/src/common/file_posix.c /usr/src/debug/pmdk/1.12.1-r0/src/librpmem/rpmem_ssh.c /usr/src/debug/pmdk/1.12.1-r0/src/librpmem/rpmem_ssh.h /usr/src/debug/pmdk/1.12.1-r0/src/core/util.c /usr/src/debug/pmdk/1.12.1-r0/src/core/alloc.h /usr/src/debug/pmdk/1.12.1-r0/src/core/alloc.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/mcsafe_ops_posix.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/usc_ndctl.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/extent.h /usr/src/debug/pmdk/1.12.1-r0/src/tools/pmempool/rm.h /usr/src/debug/pmdk/1.12.1-r0/src/tools/pmempool
 /synchronize.c /usr/src/debug/pmdk/1.12.1-r0/src/tools/pmempool/transform.c /usr/src/debug/pmdk/1.12.1-r0/src/tools/pmempool/rm.c /usr/src/debug/pmdk/1.12.1-r0/src/tools/pmempool/transform.h /usr/src/debug/pmdk/1.12.1-r0/src/include/libpmem2/base.h /usr/src/debug/pmdk/1.12.1-r0/src/tools/pmempool/synchronize.h /usr/src/debug/pmdk/1.12.1-r0/src/include/libpmem.h /usr/src/debug/pmdk/1.12.1-r0/src/libpmempool/libpmempool.c /usr/src/debug/pmdk/1.12.1-r0/src/include/libpmem2/async.h /usr/src/debug/pmdk/1.12.1-r0/src/libpmempool/check_pool_hdr.c /usr/src/debug/pmdk/1.12.1-r0/src/tools/pmempool/dump.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/source.h /usr/src/debug/pmdk/1.12.1-r0/src/tools/pmempool/dump.h /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/source.c /usr/src/debug/pmdk/1.12.1-r0/src/core/out.h /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/deep_flush.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/pmem2_utils_ndctl.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/deep_flush.h /usr/src/debug/
 pmdk/1.12.1-r0/src/libpmem2/auto_flush.h /usr/src/debug/pmdk/1.12.1-r0/src/core/out.c /usr/src/debug/pmdk/1.12.1-r0/src/tools/pmempool/common.c /usr/src/debug/pmdk/1.12.1-r0/src/tools/pmempool/create.c /usr/src/debug/pmdk/1.12.1-r0/src/common/pool_hdr.c /usr/src/debug/pmdk/1.12.1-r0/src/tools/pmempool/output.c /usr/src/debug/pmdk/1.12.1-r0/src/tools/pmempool/common.h /usr/src/debug/pmdk/1.12.1-r0/src/libpmempool/check_btt_info.c /usr/src/debug/pmdk/1.12.1-r0/src/tools/pmempool/create.h /usr/src/debug/pmdk/1.12.1-r0/src/tools/pmempool/output.h /usr/src/debug/pmdk/1.12.1-r0/src/common/pool_hdr.h /usr/src/debug/pmdk/1.12.1-r0/src/core/fs.h /usr/src/debug/pmdk/1.12.1-r0/src/core/os.h /usr/src/debug/pmdk/1.12.1-r0/src/include/librpmem.h /usr/src/debug/pmdk/1.12.1-r0/src/common/dlsym.h /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/map_posix.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmempool/transform.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/region_namespace_ndctl.c /usr/src/debug/pmdk/1.12.
 1-r0/src/libpmem2/config.h /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/auto_flush_linux.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/deep_flush_linux.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/map.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/map.h /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/config.c /usr/src/debug/pmdk/1.12.1-r0/src/include/libpmemblk.h /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/region_namespace_ndctl.h /usr/src/debug/pmdk/1.12.1-r0/src/libpmempool/replica.c /usr/src/debug/pmdk/1.12.1-r0/src/tools/pmempool/check.c /usr/src/debug/pmdk/1.12.1-r0/src/rpmem_common/rpmem_common.h /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/vm_reservation.h /usr/src/debug/pmdk/1.12.1-r0/src/tools/pmempool/feature.h /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/vm_reservation.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmempool/check_bad_blocks.c /usr/src/debug/pmdk/1.12.1-r0/src/rpmem_common/rpmem_common.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmempool/replica.h /usr/src/debug/pmdk/1.12.1-r0/src/to
 ols/pmempool/check.h /usr/src/debug/pmdk/1.12.1-r0/src/tools/pmempool/feature.c /usr/src/debug/pmdk/1.12.1-r0/src/tools/pmempool/info_obj.c /usr/src/debug/pmdk/1.12.1-r0/src/include/libpmemlog.h /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/mover.h /usr/src/debug/pmdk/1.12.1-r0/src/libpmemblk/blk.h /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/extent_linux.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmemblk/btt.h /usr/src/debug/pmdk/1.12.1-r0/src/libpmemlog/log.h /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/mover.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmemblk/blk.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/source_posix.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmemblk/btt.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmemlog/log.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmempool/check_blk.c /usr/src/debug/pmdk/1.12.1-r0/src/common/pmemcommon.h /usr/src/debug/pmdk/1.12.1-r0/src/libpmempool/check_log.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmempool/check_sds.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmempool/rm.c
  /usr/src/debug/pmdk/1.12.1-r0/src/common/uuid_linux.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmemblk/btt_layout.h /usr/src/debug/pmdk/1.12.1-r0/src/core/sys_util.h /usr/src/debug/pmdk/1.12.1-r0/src/core/valgrind_internal.h /usr/src/debug/pmdk/1.12.1-r0/src/common/bad_blocks.c /usr/src/debug/pmdk/1.12.1-r0/src/core/membuf.h /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/badblocks.c /usr/src/debug/pmdk/1.12.1-r0/src/common/uuid.c /usr/src/debug/pmdk/1.12.1-r0/src/common/mmap_posix.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmempool/check.h /usr/src/debug/pmdk/1.12.1-r0/src/core/membuf.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmempool/check.c /usr/src/debug/pmdk/1.12.1-r0/src/common/uuid.h /usr/src/debug/pmdk/1.12.1-r0/src/tools/pmempool/info_blk.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmempool/check_write.c /usr/src/debug/pmdk/1.12.1-r0/src/common/set_badblocks.h /usr/src/debug/pmdk/1.12.1-r0/src/core/ravl.h /usr/src/debug/pmdk/1.12.1-r0/src/common/vecq.h /usr/src/debug/pmdk/1.12.1-r0/src/common/
 set_badblocks.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/region_namespace.h /usr/src/debug/pmdk/1.12.1-r0/src/core/ravl.c /usr/src/debug/pmdk/1.12.1-r0/src/core/ravl_interval.c /usr/src/debug/pmdk/1.12.1-r0/src/common/file.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmemblk/libpmemblk.c /usr/src/debug/pmdk/1.12.1-r0/src/common/file.h /usr/src/debug/pmdk/1.12.1-r0/src/core/ravl_interval.h /usr/src/debug/pmdk/1.12.1-r0/src/tools/pmempool/info_log.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmempool/sync.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmempool/check_util.c /usr/src/debug/pmdk/1.12.1-r0/src/common/util_pmem.h /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/pmem2_utils_linux.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmempool/check_util.h /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/pmem2_utils.h /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/libpmem2.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/pmem2_utils.c /usr/src/debug/pmdk/1.12.1-r0/src/common/mmap.c /usr/src/debug/pmdk/1.12.1-r0/src/common/os_de
 ep_linux.c /usr/src/debug/pmdk/1.12.1-r0/src/common/ctl.h /usr/src/debug/pmdk/1.12.1-r0/src/common/badblocks.h /usr/src/debug/pmdk/1.12.1-r0/src/core/fs_posix.c /usr/src/debug/pmdk/1.12.1-r0/src/core/os_posix.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmempool/pmempool.h /usr/src/debug/pmdk/1.12.1-r0/src/common/mmap.h /usr/src/debug/pmdk/1.12.1-r0/src/common/ctl.c /usr/src/debug/pmdk/1.12.1-r0/src/tools/pmempool/info.h /usr/src/debug/pmdk/1.12.1-r0/src/common/ctl_fallocate.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/memops_generic.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmempool/pool.h /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/badblocks_ndctl.c /usr/src/debug/pmdk/1.12.1-r0/src/tools/pmempool/info.c /usr/src/debug/pmdk/1.12.1-r0/src/tools/pmempool/pmempool.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmempool/pool.c /usr/src/debug/pmdk/1.12.1-r0/src/deps/miniasync/src/include/libminiasync/future.h /usr/src/debug/pmdk/1.12.1-r0/src/common/os_deep.h /usr/src/debug/pmdk/1.12.1-r0/src/common/ctl
 _global.h /usr/src/debug/pmdk/1.12.1-r0/src/common/ctl_sds.c /usr/src/debug/pmdk/1.12.1-r0/src/common/ctl_cow.c /usr/src/debug/pmdk/1.12.1-r0/src/core/os_thread.h /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/persist_posix.c /usr/src/debug/pmdk/1.12.1-r0/src/common/rand.h /usr/src/debug/pmdk/1.12.1-r0/src/libpmempool/check_backup.c /usr/src/debug/pmdk/1.12.1-r0/src/common/rand.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/errormsg.c /usr/src/debug/pmdk/1.12.1-r0/src/core/util_posix.c /usr/src/debug/pmdk/1.12.1-r0/src/tools/pmempool/convert.h /usr/src/debug/pmdk/1.12.1-r0/src/tools/pmempool/convert.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmempool/check_btt_map_flog.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/pmem2_arch.h /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/persist.h /usr/src/debug/pmdk/1.12.1-r0/src/librpmem/rpmem_cmd.h /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/numa_ndctl.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmem2/persist.c /usr/src/debug/pmdk/1.12.1-r0/src/librpmem/rpmem_cmd.c
  /usr/src/debug/pmdk/1.12.1-r0/src/include/libpmempool.h /usr/src/debug/pmdk/1.12.1-r0/src/common/ctl_prefault.c /usr/src/debug/pmdk/1.12.1-r0/src/common/vec.h /usr/src/debug/pmdk/1.12.1-r0/src/librpmem/rpmem_util.c /usr/src/debug/pmdk/1.12.1-r0/src/common/shutdown_state.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmempool/feature.c /usr/src/debug/pmdk/1.12.1-r0/src/libpmemlog/libpmemlog.c /usr/src/debug/pmdk/1.12.1-r0/src/common/shutdown_state.h /usr/src/debug/pmdk/1.12.1-r0/src/librpmem/rpmem_util.h", added "/usr/src/debug/pmdk/2.0.0-r0/src/common/ctl.h /usr/src/debug/pmdk/2.0.0-r0/src/core/valgrind_internal.h /usr/src/debug/pmdk/2.0.0-r0/src/core/util.h /usr/src/debug/pmdk/2.0.0-r0/src/common/ctl_fallocate.c /usr/src/debug/pmdk/2.0.0-r0/src/common/ctl.c /usr/src/debug/pmdk/2.0.0-r0/src/libpmempool/feature.c /usr/src/debug/pmdk/2.0.0-r0/src/core/util.c /usr/src/debug/pmdk/2.0.0-r0/src/tools/pmempool/check.h /usr/src/debug/pmdk/2.0.0-r0/src/libpmempool/pmempool.h /usr/src/debug/pmdk/2.0
 .0-r0/src/tools/pmempool/check.c /usr/src/debug/pmdk/2.0.0-r0/src/libpmempool/pool.h /usr/src/debug/pmdk/2.0.0-r0/src/tools/pmempool/feature.c /usr/src/debug/pmdk/2.0.0-r0/src/libpmempool/pool.c /usr/src/debug/pmdk/2.0.0-r0/src/tools/pmempool/feature.h /usr/src/debug/pmdk/2.0.0-r0/src/tools/pmempool/pmempool.c /usr/src/debug/pmdk/2.0.0-r0/src/tools/pmempool/synchronize.h /usr/src/debug/pmdk/2.0.0-r0/src/common/uuid.h /usr/src/debug/pmdk/2.0.0-r0/src/tools/pmempool/synchronize.c /usr/src/debug/pmdk/2.0.0-r0/src/common/uuid.c /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/extent_linux.c /usr/src/debug/pmdk/2.0.0-r0/src/core/alloc.h /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/usc_ndctl.c /usr/src/debug/pmdk/2.0.0-r0/src/core/alloc.c /usr/src/debug/pmdk/2.0.0-r0/src/libpmempool/check_bad_blocks.c /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/libpmem2.c /usr/src/debug/pmdk/2.0.0-r0/src/core/sys_util.h /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/vm_reservation.c /usr/src/debug/pmdk/2.0.0-r0/src/libpme
 m2/pmem2_utils.c /usr/src/debug/pmdk/2.0.0-r0/src/common/mmap_posix.c /usr/src/debug/pmdk/2.0.0-r0/src/include/libpmem2/base.h /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/vm_reservation.h /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/pmem2_utils.h /usr/src/debug/pmdk/2.0.0-r0/src/core/util_posix.c /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/pmem2_utils_ndctl.c /usr/src/debug/pmdk/2.0.0-r0/src/libpmempool/check.h /usr/src/debug/pmdk/2.0.0-r0/src/common/ctl_global.h /usr/src/debug/pmdk/2.0.0-r0/src/libpmempool/check.c /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/source_posix.c /usr/src/debug/pmdk/2.0.0-r0/src/common/vecq.h /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/vm_reservation_posix.c /usr/src/debug/pmdk/2.0.0-r0/src/core/ravl_interval.h /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/region_namespace_ndctl.c /usr/src/debug/pmdk/2.0.0-r0/src/core/ravl_interval.c /usr/src/debug/pmdk/2.0.0-r0/src/libpmempool/sync.c /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/region_namespace_ndctl.h /usr/src/debug/pmdk/
 2.0.0-r0/src/include/libpmempool.h /usr/src/debug/pmdk/2.0.0-r0/src/common/file.h /usr/src/debug/pmdk/2.0.0-r0/src/tools/pmempool/create.c /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/errormsg.c /usr/src/debug/pmdk/2.0.0-r0/src/tools/pmempool/info.c /usr/src/debug/pmdk/2.0.0-r0/src/common/badblocks.h /usr/src/debug/pmdk/2.0.0-r0/src/common/os_deep_linux.c /usr/src/debug/pmdk/2.0.0-r0/src/common/pmemcommon.h /usr/src/debug/pmdk/2.0.0-r0/src/core/ravl.h /usr/src/debug/pmdk/2.0.0-r0/src/tools/pmempool/create.h /usr/src/debug/pmdk/2.0.0-r0/src/common/file.c /usr/src/debug/pmdk/2.0.0-r0/src/core/ravl.c /usr/src/debug/pmdk/2.0.0-r0/src/tools/pmempool/info.h /usr/src/debug/pmdk/2.0.0-r0/src/common/set.c /usr/src/debug/pmdk/2.0.0-r0/src/core/fs_posix.c /usr/src/debug/pmdk/2.0.0-r0/src/core/os_posix.c /usr/src/debug/pmdk/2.0.0-r0/src/core/os_thread_posix.c /usr/src/debug/pmdk/2.0.0-r0/src/tools/pmempool/rm.c /usr/src/debug/pmdk/2.0.0-r0/src/libpmempool/check_sds.c /usr/src/debug/pmdk/2.0.0-r0/s
 rc/common/set.h /usr/src/debug/pmdk/2.0.0-r0/src/include/libpmem.h /usr/src/debug/pmdk/2.0.0-r0/src/tools/pmempool/rm.h /usr/src/debug/pmdk/2.0.0-r0/src/tools/pmempool/info_obj.c /usr/src/debug/pmdk/2.0.0-r0/src/libpmempool/check_backup.c /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/mcsafe_ops_posix.c /usr/src/debug/pmdk/2.0.0-r0/src/tools/pmempool/transform.c /usr/src/debug/pmdk/2.0.0-r0/src/common/shutdown_state.c /usr/src/debug/pmdk/2.0.0-r0/src/core/os_thread.h /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/auto_flush_linux.c /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/deep_flush_linux.c /usr/src/debug/pmdk/2.0.0-r0/src/common/shutdown_state.h /usr/src/debug/pmdk/2.0.0-r0/src/tools/pmempool/transform.h /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/map.c /usr/src/debug/pmdk/2.0.0-r0/src/tools/pmempool/convert.h /usr/src/debug/pmdk/2.0.0-r0/src/tools/pmempool/convert.c /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/map.h /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/persist.h /usr/src/debug/pmdk/2.0.0-r
 0/src/libpmem2/pmem2_utils_linux.c /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/persist.c /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/persist_posix.c /usr/src/debug/pmdk/2.0.0-r0/src/core/fs.h /usr/src/debug/pmdk/2.0.0-r0/src/core/os.h /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/pmem2_arch.h /usr/src/debug/pmdk/2.0.0-r0/src/common/uuid_linux.c /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/badblocks_ndctl.c /usr/src/debug/pmdk/2.0.0-r0/src/core/out.c /usr/src/debug/pmdk/2.0.0-r0/src/core/out.h /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/region_namespace.h /usr/src/debug/pmdk/2.0.0-r0/src/common/mmap.c /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/config.c /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/source.c /usr/src/debug/pmdk/2.0.0-r0/src/libpmempool/replica.h /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/extent.h /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/config.h /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/source.h /usr/src/debug/pmdk/2.0.0-r0/src/common/mmap.h /usr/src/debug/pmdk/2.0.0-r0/src/libpmempool/
 replica.c /usr/src/debug/pmdk/2.0.0-r0/src/common/ctl_prefault.c /usr/src/debug/pmdk/2.0.0-r0/src/tools/pmempool/common.c /usr/src/debug/pmdk/2.0.0-r0/src/tools/pmempool/dump.h /usr/src/debug/pmdk/2.0.0-r0/src/common/ctl_cow.c /usr/src/debug/pmdk/2.0.0-r0/src/common/ctl_sds.c /usr/src/debug/pmdk/2.0.0-r0/src/tools/pmempool/common.h /usr/src/debug/pmdk/2.0.0-r0/src/tools/pmempool/dump.c /usr/src/debug/pmdk/2.0.0-r0/src/common/rand.c /usr/src/debug/pmdk/2.0.0-r0/src/libpmempool/check_pool_hdr.c /usr/src/debug/pmdk/2.0.0-r0/src/common/rand.h /usr/src/debug/pmdk/2.0.0-r0/src/common/util_pmem.h /usr/src/debug/pmdk/2.0.0-r0/src/tools/pmempool/output.c /usr/src/debug/pmdk/2.0.0-r0/src/common/os_deep.h /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/badblocks.c /usr/src/debug/pmdk/2.0.0-r0/src/tools/pmempool/output.h /usr/src/debug/pmdk/2.0.0-r0/src/libpmempool/rm.c /usr/src/debug/pmdk/2.0.0-r0/src/libpmempool/transform.c /usr/src/debug/pmdk/2.0.0-r0/src/core/membuf.c /usr/src/debug/pmdk/2.0.0-r0
 /src/common/vec.h /usr/src/debug/pmdk/2.0.0-r0/src/common/set_badblocks.c /usr/src/debug/pmdk/2.0.0-r0/src/common/bad_blocks.c /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/memops_generic.c /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/numa_ndctl.c /usr/src/debug/pmdk/2.0.0-r0/src/common/set_badblocks.h /usr/src/debug/pmdk/2.0.0-r0/src/core/pmemcore.h /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/map_posix.c /usr/src/debug/pmdk/2.0.0-r0/src/common/pool_hdr.c /usr/src/debug/pmdk/2.0.0-r0/src/common/pool_hdr.h /usr/src/debug/pmdk/2.0.0-r0/src/common/file_posix.c /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/auto_flush.h /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/deep_flush.h /usr/src/debug/pmdk/2.0.0-r0/src/libpmempool/check_util.h /usr/src/debug/pmdk/2.0.0-r0/src/libpmempool/libpmempool.c /usr/src/debug/pmdk/2.0.0-r0/src/libpmempool/check_util.c /usr/src/debug/pmdk/2.0.0-r0/src/libpmem2/deep_flush.c"
packages/core2-64-poky-linux/pmdk/pmdk-src: PKGV changed from 1.12.1 [default] to 2.0.0 [default]
packages/core2-64-poky-linux/pmdk/pmdk-src: PV changed from "1.12.1" to "2.0.0"
packages/core2-64-poky-linux/pmdk/pmdk-staticdev: PKGSIZE changed from 29850374 to 25140172 (-16%)
packages/core2-64-poky-linux/pmdk/pmdk-staticdev: FILELIST: removed "/usr/lib/libpmemblk.a /usr/lib/libpmemlog.a"
packages/core2-64-poky-linux/pmdk/pmdk-staticdev: PKGV changed from 1.12.1 [default] to 2.0.0 [default]
packages/core2-64-poky-linux/pmdk/pmdk-staticdev: PV changed from "1.12.1" to "2.0.0"
packages/core2-64-poky-linux/pmdk/pmdk: PKGSIZE changed from 2552406 to 1887496 (-26%)
packages/core2-64-poky-linux/pmdk/pmdk: FILELIST: removed "/usr/lib/libpmemblk.so.1.0.0 /usr/lib/libpmemblk.so.1 /usr/lib/libpmemlog.so.1 /usr/lib/libpmemlog.so.1.0.0"
packages/core2-64-poky-linux/pmdk/pmdk: PKGV changed from 1.12.1 [default] to 2.0.0 [default]
packages/core2-64-poky-linux/pmdk/pmdk: PV changed from "1.12.1" to "2.0.0"
Changes to packages/core2-64-poky-linux/pmdk (sysroot):
  /usr/include/libpmem2/async.h was removed
  /usr/include/libpmemblk.h was removed
  /usr/include/libpmemlog.h was removed
  /usr/lib/libpmemblk.a was removed
  /usr/lib/libpmemblk.so.1.0.0 was removed
  /usr/lib/libpmemblk.so.1 was removed
  /usr/lib/libpmemblk.so was removed
  /usr/lib/libpmemlog.a was removed
  /usr/lib/libpmemlog.so.1.0.0 was removed
  /usr/lib/libpmemlog.so.1 was removed
  /usr/lib/libpmemlog.so was removed
  /usr/lib/pkgconfig/libpmemblk.pc was removed
  /usr/lib/pkgconfig/libpmemlog.pc was removed

--===============0258308972728602584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/pmdk/pmdk-dbg: PKGSIZE changed from 15768312 to 13190808 (-16%)
packages/core2-64-poky-linux/pmdk/pmdk-dev: PKGSIZE changed from 93546 to 71371 (-24%)
packages/core2-64-poky-linux/pmdk/pmdk-dev: FILELIST: removed "/usr/lib/pkgconfig/libpmemblk.pc /usr/lib/pkgconfig/libpmemlog.pc /usr/include/libpmem2/async.h /usr/include/libpmemlog.h /usr/include/libpmemblk.h /usr/lib/libpmemlog.so /usr/lib/libpmemblk.so"
packages/core2-64-poky-linux/pmdk/pmdk-src: PKGSIZE changed from 2434558 to 2060308 (-15%)
packages/core2-64-poky-linux/pmdk/pmdk-staticdev: PKGSIZE changed from 29850374 to 25140172 (-16%)
packages/core2-64-poky-linux/pmdk/pmdk-staticdev: FILELIST: removed "/usr/lib/libpmemlog.a /usr/lib/libpmemblk.a"
packages/core2-64-poky-linux/pmdk/pmdk: PKGSIZE changed from 2552406 to 1887496 (-26%)
packages/core2-64-poky-linux/pmdk/pmdk: FILELIST: removed "/usr/lib/libpmemblk.so.1.0.0 /usr/lib/libpmemlog.so.1 /usr/lib/libpmemlog.so.1.0.0 /usr/lib/libpmemblk.so.1"
Changes to packages/core2-64-poky-linux/pmdk (sysroot):
  /usr/include/libpmem2/async.h was removed
  /usr/include/libpmemblk.h was removed
  /usr/include/libpmemlog.h was removed
  /usr/lib/libpmemblk.a was removed
  /usr/lib/libpmemblk.so.1.0.0 was removed
  /usr/lib/libpmemblk.so.1 was removed
  /usr/lib/libpmemblk.so was removed
  /usr/lib/libpmemlog.a was removed
  /usr/lib/libpmemlog.so.1.0.0 was removed
  /usr/lib/libpmemlog.so.1 was removed
  /usr/lib/libpmemlog.so was removed
  /usr/lib/pkgconfig/libpmemblk.pc was removed
  /usr/lib/pkgconfig/libpmemlog.pc was removed

--===============0258308972728602584==--

