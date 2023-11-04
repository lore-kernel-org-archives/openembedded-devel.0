Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A98C001B0
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:33 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.2298.1699061903260450834
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GgGpTJMI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cUOMJY2c;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b97fb2c5b-94063c7a-3430-40b8-aca3-3ee05a3a2dac-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061902;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZClAxv1tYT4vIUuLH95bekNHgc4Gf5rdfu5cMZF68+0=;
	b=GgGpTJMIOpwV0uJXFIbVOSYmlN6Cw4NcNFZA68HrSdKNZnfsuzb3NoJDRYWnMvE+
	JMIKF77f3R8T5cP52Gp4tDvDnjR4/1rpa6LSfDEVrQqE8JRzxSKQmxuXeSVpTP41UdZ
	SGkTfXTHiPwdryoTGP3QV9ApnJ1MbQuSliPtALiE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061902;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZClAxv1tYT4vIUuLH95bekNHgc4Gf5rdfu5cMZF68+0=;
	b=cUOMJY2cv13r7tFQNhp20KYqwWwA39LA8XYWjUjctfwUeGC5obbKwOjg4ONHukXp
	HcFt3ZTbCusZfd2quNENgha64UujdaxiHPNkehTSKK+Y+LfltuV8XcOc9A7jU2KAB4g
	00htz9nd0oA/yDvvPpUMeol9XQHpQ656xB2mtbe4=
Content-Type: multipart/mixed; boundary="===============8577133817063291918=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-xstatic-font-awesome: upgrading to 6.2.1.1 SUCCEEDED
Message-ID: <0101018b97fb2c5b-94063c7a-3430-40b8-aca3-3ee05a3a2dac-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106183

--===============8577133817063291918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-xstatic-font-awesome* to *6.2.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-xstatic-font-awesome-upgrade-4.7.0.0-6.2.1.1.patch
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
From 21b9dea459a563f84520472e92ed3c8dee195735 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 01:32:40 +0000
Subject: [PATCH] python3-xstatic-font-awesome: upgrade 4.7.0.0 -> 6.2.1.1

---
 ...> python3-xstatic-font-awesome_6.2.1.1.bb} | 65 ++++++++++++++++++-
 1 file changed, 62 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xstatic-font-awesome_4.7.0.0.bb => python3-xstatic-font-awesome_6.2.1.1.bb} (12%)

diff --git a/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_4.7.0.0.bb b/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.1.bb
similarity index 12%
rename from meta-python/recipes-devtools/python/python3-xstatic-font-awesome_4.7.0.0.bb
rename to meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.1.bb
index ccd1cd787..a7b7a3e5f 100644
--- a/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_4.7.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.1.bb
@@ -1,13 +1,72 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- PKG-INFO
+# +++ PKG-INFO
+# @@ -1,24 +1,25 @@
+# -Metadata-Version: 1.0
+# +Metadata-Version: 2.1
+#  Name: XStatic-Font-Awesome
+# -Version: 4.7.0.0
+# -Summary: Font-Awesome 4.7.0 (XStatic packaging standard)
+# -Home-page: https://fortawesome.github.io/Font-Awesome/
+# -Author: Rob Cresswell
+# -Author-email: robert.cresswell@outlook.com
+# -License: SIL OFL 1.1
+# -Description: XStatic-Font-Awesome
+# -        --------------
+# -        
+# -        Font Awesome icons packaged for setuptools (easy_install) / pip.
+# -        
+# -        This package is intended to be used by **any** project that needs these files.
+# -        
+# -        It intentionally does **not** provide any extra code except some metadata
+# -        **nor** has any extra requirements. You MAY use some minimal support code from
+# -        the XStatic base package, if you like.
+# -        
+# -        You can find more info about the xstatic packaging way in the package `XStatic`.
+# -        
+# -        
+# +Version: 6.2.1.1
+# +Summary: Font-Awesome 6.2.1 (XStatic packaging standard)
+# +Home-page: https://github.com/FortAwesome/Font-Awesome
+# +Maintainer: Reimar Bauer
+# +Maintainer-email: rb.proj@gmail.com
+# +License: (same as Font-Awesome)
+# +Project-URL: Repository, https://github.com/xstatic-py/xstatic-font-awesome
+#  Keywords: font_awesome xstatic
+#  Platform: any
+# +
+# +XStatic-Font-Awesome
+# +--------------------
+# +
+# +Font Awesome packaged for setuptools (easy_install) / pip.
+# +
+# +This package is intended to be used by **any** project that needs these files.
+# +
+# +It intentionally does **not** provide any extra code except some metadata
+# +**nor** has any extra requirements. You MAY use some minimal support code from
+# +the XStatic base package, if you like.
+# +
+# +You can find more info about the xstatic packaging way in the package `XStatic`.
+# +
+# 
+#
+
 DESCRIPTION = "Font Awesome icons packaged for setuptools (easy_install) / pip."
 HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Font-Awesome"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=313d021898694cd2b0ea6508bdfe51a2"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=f1a2fe131dcb2fc6243c26cf05ecdb36"
 
 PYPI_PACKAGE = "XStatic-Font-Awesome"
 
-SRC_URI[md5sum] = "141a0e9a7e21e82f922573a00ae0c166"
-SRC_URI[sha256sum] = "e01fb480caaa7c7963dcb3328a4700e631bef6070db0e8b685816d220e685f6c"
+SRC_URI[sha256sum] = "f075871096128638f2e1539020d8227754c3d885dd68e7ee6de9a01235076828"
 
 DEPENDS += " \
     ${PYTHON_PN}-xstatic \
-- 
2.39.2


--===============8577133817063291918==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-xstatic-font-awesome-upgrade-4.7.0.0-6.2.1.1.patch"

RnJvbSAyMWI5ZGVhNDU5YTU2M2Y4NDUyMDQ3MmU5MmVkM2M4ZGVlMTk1NzM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMTozMjo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMteHN0YXRpYy1mb250LWF3ZXNvbWU6IHVwZ3JhZGUgNC43LjAuMCAtPiA2LjIuMS4xCgot
LS0KIC4uLj4gcHl0aG9uMy14c3RhdGljLWZvbnQtYXdlc29tZV82LjIuMS4xLmJifSB8IDY1ICsr
KysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA2MiBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQogcmVuYW1lIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tw
eXRob24zLXhzdGF0aWMtZm9udC1hd2Vzb21lXzQuNy4wLjAuYmIgPT4gcHl0aG9uMy14c3RhdGlj
LWZvbnQtYXdlc29tZV82LjIuMS4xLmJifSAoMTIlKQoKZGlmZiAtLWdpdCBhL21ldGEtcHl0aG9u
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMteHN0YXRpYy1mb250LWF3ZXNvbWVfNC43
LjAuMC5iYiBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMteHN0
YXRpYy1mb250LWF3ZXNvbWVfNi4yLjEuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDEyJQpyZW5hbWUg
ZnJvbSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXhzdGF0aWMt
Zm9udC1hd2Vzb21lXzQuNy4wLjAuYmIKcmVuYW1lIHRvIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMteHN0YXRpYy1mb250LWF3ZXNvbWVfNi4yLjEuMS5iYgppbmRl
eCBjY2QxY2Q3ODcuLmE3YjdhM2U1ZiAxMDA2NDQKLS0tIGEvbWV0YS1weXRob24vcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy14c3RhdGljLWZvbnQtYXdlc29tZV80LjcuMC4wLmJiCisr
KyBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMteHN0YXRpYy1m
b250LWF3ZXNvbWVfNi4yLjEuMS5iYgpAQCAtMSwxMyArMSw3MiBAQAorIyBGSVhNRTogdGhlIExJ
Q19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3Jh
ZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBh
bmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFs
dWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQg
bWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2Ut
VXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMK
KyMgLS0tIFBLRy1JTkZPCisjICsrKyBQS0ctSU5GTworIyBAQCAtMSwyNCArMSwyNSBAQAorIyAt
TWV0YWRhdGEtVmVyc2lvbjogMS4wCisjICtNZXRhZGF0YS1WZXJzaW9uOiAyLjEKKyMgIE5hbWU6
IFhTdGF0aWMtRm9udC1Bd2Vzb21lCisjIC1WZXJzaW9uOiA0LjcuMC4wCisjIC1TdW1tYXJ5OiBG
b250LUF3ZXNvbWUgNC43LjAgKFhTdGF0aWMgcGFja2FnaW5nIHN0YW5kYXJkKQorIyAtSG9tZS1w
YWdlOiBodHRwczovL2ZvcnRhd2Vzb21lLmdpdGh1Yi5pby9Gb250LUF3ZXNvbWUvCisjIC1BdXRo
b3I6IFJvYiBDcmVzc3dlbGwKKyMgLUF1dGhvci1lbWFpbDogcm9iZXJ0LmNyZXNzd2VsbEBvdXRs
b29rLmNvbQorIyAtTGljZW5zZTogU0lMIE9GTCAxLjEKKyMgLURlc2NyaXB0aW9uOiBYU3RhdGlj
LUZvbnQtQXdlc29tZQorIyAtICAgICAgICAtLS0tLS0tLS0tLS0tLQorIyAtICAgICAgICAKKyMg
LSAgICAgICAgRm9udCBBd2Vzb21lIGljb25zIHBhY2thZ2VkIGZvciBzZXR1cHRvb2xzIChlYXN5
X2luc3RhbGwpIC8gcGlwLgorIyAtICAgICAgICAKKyMgLSAgICAgICAgVGhpcyBwYWNrYWdlIGlz
IGludGVuZGVkIHRvIGJlIHVzZWQgYnkgKiphbnkqKiBwcm9qZWN0IHRoYXQgbmVlZHMgdGhlc2Ug
ZmlsZXMuCisjIC0gICAgICAgIAorIyAtICAgICAgICBJdCBpbnRlbnRpb25hbGx5IGRvZXMgKipu
b3QqKiBwcm92aWRlIGFueSBleHRyYSBjb2RlIGV4Y2VwdCBzb21lIG1ldGFkYXRhCisjIC0gICAg
ICAgICoqbm9yKiogaGFzIGFueSBleHRyYSByZXF1aXJlbWVudHMuIFlvdSBNQVkgdXNlIHNvbWUg
bWluaW1hbCBzdXBwb3J0IGNvZGUgZnJvbQorIyAtICAgICAgICB0aGUgWFN0YXRpYyBiYXNlIHBh
Y2thZ2UsIGlmIHlvdSBsaWtlLgorIyAtICAgICAgICAKKyMgLSAgICAgICAgWW91IGNhbiBmaW5k
IG1vcmUgaW5mbyBhYm91dCB0aGUgeHN0YXRpYyBwYWNrYWdpbmcgd2F5IGluIHRoZSBwYWNrYWdl
IGBYU3RhdGljYC4KKyMgLSAgICAgICAgCisjIC0gICAgICAgIAorIyArVmVyc2lvbjogNi4yLjEu
MQorIyArU3VtbWFyeTogRm9udC1Bd2Vzb21lIDYuMi4xIChYU3RhdGljIHBhY2thZ2luZyBzdGFu
ZGFyZCkKKyMgK0hvbWUtcGFnZTogaHR0cHM6Ly9naXRodWIuY29tL0ZvcnRBd2Vzb21lL0ZvbnQt
QXdlc29tZQorIyArTWFpbnRhaW5lcjogUmVpbWFyIEJhdWVyCisjICtNYWludGFpbmVyLWVtYWls
OiByYi5wcm9qQGdtYWlsLmNvbQorIyArTGljZW5zZTogKHNhbWUgYXMgRm9udC1Bd2Vzb21lKQor
IyArUHJvamVjdC1VUkw6IFJlcG9zaXRvcnksIGh0dHBzOi8vZ2l0aHViLmNvbS94c3RhdGljLXB5
L3hzdGF0aWMtZm9udC1hd2Vzb21lCisjICBLZXl3b3JkczogZm9udF9hd2Vzb21lIHhzdGF0aWMK
KyMgIFBsYXRmb3JtOiBhbnkKKyMgKworIyArWFN0YXRpYy1Gb250LUF3ZXNvbWUKKyMgKy0tLS0t
LS0tLS0tLS0tLS0tLS0tCisjICsKKyMgK0ZvbnQgQXdlc29tZSBwYWNrYWdlZCBmb3Igc2V0dXB0
b29scyAoZWFzeV9pbnN0YWxsKSAvIHBpcC4KKyMgKworIyArVGhpcyBwYWNrYWdlIGlzIGludGVu
ZGVkIHRvIGJlIHVzZWQgYnkgKiphbnkqKiBwcm9qZWN0IHRoYXQgbmVlZHMgdGhlc2UgZmlsZXMu
CisjICsKKyMgK0l0IGludGVudGlvbmFsbHkgZG9lcyAqKm5vdCoqIHByb3ZpZGUgYW55IGV4dHJh
IGNvZGUgZXhjZXB0IHNvbWUgbWV0YWRhdGEKKyMgKyoqbm9yKiogaGFzIGFueSBleHRyYSByZXF1
aXJlbWVudHMuIFlvdSBNQVkgdXNlIHNvbWUgbWluaW1hbCBzdXBwb3J0IGNvZGUgZnJvbQorIyAr
dGhlIFhTdGF0aWMgYmFzZSBwYWNrYWdlLCBpZiB5b3UgbGlrZS4KKyMgKworIyArWW91IGNhbiBm
aW5kIG1vcmUgaW5mbyBhYm91dCB0aGUgeHN0YXRpYyBwYWNrYWdpbmcgd2F5IGluIHRoZSBwYWNr
YWdlIGBYU3RhdGljYC4KKyMgKworIyAKKyMKKwogREVTQ1JJUFRJT04gPSAiRm9udCBBd2Vzb21l
IGljb25zIHBhY2thZ2VkIGZvciBzZXR1cHRvb2xzIChlYXN5X2luc3RhbGwpIC8gcGlwLiIKIEhP
TUVQQUdFID0gImh0dHBzOi8vcHlwaS5weXRob24ub3JnL3B5cGkvWFN0YXRpYy1Gb250LUF3ZXNv
bWUiCiBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKLUxJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL1BLRy1JTkZPO21kNT0zMTNkMDIxODk4Njk0Y2QyYjBl
YTY1MDhiZGZlNTFhMiIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL1BLRy1JTkZPO21kNT1m
MWEyZmUxMzFkY2IyZmM2MjQzYzI2Y2YwNWVjZGIzNiIKIAogUFlQSV9QQUNLQUdFID0gIlhTdGF0
aWMtRm9udC1Bd2Vzb21lIgogCi1TUkNfVVJJW21kNXN1bV0gPSAiMTQxYTBlOWE3ZTIxZTgyZjky
MjU3M2EwMGFlMGMxNjYiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZTAxZmI0ODBjYWFhN2M3OTYz
ZGNiMzMyOGE0NzAwZTYzMWJlZjYwNzBkYjBlOGI2ODU4MTZkMjIwZTY4NWY2YyIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICJmMDc1ODcxMDk2MTI4NjM4ZjJlMTUzOTAyMGQ4MjI3NzU0YzNkODg1ZGQ2
OGU3ZWU2ZGU5YTAxMjM1MDc2ODI4IgogCiBERVBFTkRTICs9ICIgXAogICAgICR7UFlUSE9OX1BO
fS14c3RhdGljIFwKLS0gCjIuMzkuMgoK

--===============8577133817063291918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-xstatic-font-awesome: PKGV changed from 4.7.0.0 [default] to 6.2.1.1 [default]
packages/core2-64-poky-linux/python3-xstatic-font-awesome: PV changed from "4.7.0.0" to "6.2.1.1"
packages/core2-64-poky-linux/python3-xstatic-font-awesome: SRC_URI changed from "https://files.pythonhosted.org/packages/source/X/XStatic-Font-Awesome/XStatic-Font-Awesome-4.7.0.0.tar.gz;downloadfilename=XStatic-Font-Awesome-4.7.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/X/XStatic-Font-Awesome/XStatic-Font-Awesome-6.2.1.1.tar.gz;downloadfilename=XStatic-Font-Awesome-6.2.1.1.tar.gz"
packages/core2-64-poky-linux/python3-xstatic-font-awesome/python3-xstatic-font-awesome-dbg: PKGV changed from 4.7.0.0 [default] to 6.2.1.1 [default]
packages/core2-64-poky-linux/python3-xstatic-font-awesome/python3-xstatic-font-awesome-dbg: PV changed from "4.7.0.0" to "6.2.1.1"
packages/core2-64-poky-linux/python3-xstatic-font-awesome/python3-xstatic-font-awesome-dev: PKGV changed from 4.7.0.0 [default] to 6.2.1.1 [default]
packages/core2-64-poky-linux/python3-xstatic-font-awesome/python3-xstatic-font-awesome-dev: PV changed from "4.7.0.0" to "6.2.1.1"
packages/core2-64-poky-linux/python3-xstatic-font-awesome/python3-xstatic-font-awesome-doc: PKGV changed from 4.7.0.0 [default] to 6.2.1.1 [default]
packages/core2-64-poky-linux/python3-xstatic-font-awesome/python3-xstatic-font-awesome-doc: PV changed from "4.7.0.0" to "6.2.1.1"
packages/core2-64-poky-linux/python3-xstatic-font-awesome/python3-xstatic-font-awesome-locale: PKGV changed from 4.7.0.0 [default] to 6.2.1.1 [default]
packages/core2-64-poky-linux/python3-xstatic-font-awesome/python3-xstatic-font-awesome-locale: PV changed from "4.7.0.0" to "6.2.1.1"
packages/core2-64-poky-linux/python3-xstatic-font-awesome/python3-xstatic-font-awesome-src: PKGV changed from 4.7.0.0 [default] to 6.2.1.1 [default]
packages/core2-64-poky-linux/python3-xstatic-font-awesome/python3-xstatic-font-awesome-src: PV changed from "4.7.0.0" to "6.2.1.1"
packages/core2-64-poky-linux/python3-xstatic-font-awesome/python3-xstatic-font-awesome-staticdev: PKGV changed from 4.7.0.0 [default] to 6.2.1.1 [default]
packages/core2-64-poky-linux/python3-xstatic-font-awesome/python3-xstatic-font-awesome-staticdev: PV changed from "4.7.0.0" to "6.2.1.1"
packages/core2-64-poky-linux/python3-xstatic-font-awesome/python3-xstatic-font-awesome: PKGV changed from 4.7.0.0 [default] to 6.2.1.1 [default]
packages/core2-64-poky-linux/python3-xstatic-font-awesome/python3-xstatic-font-awesome: PV changed from "4.7.0.0" to "6.2.1.1"
packages/core2-64-poky-linux/python3-xstatic-font-awesome/python3-xstatic-font-awesome: PKGSIZE changed from 1322522 to 22015052 (+1565%)
packages/core2-64-poky-linux/python3-xstatic-font-awesome/python3-xstatic-font-awesome: FILELIST: directory renamed /usr/lib/python3.11/site-packages/XStatic_Font_Awesome-4.7.0.0.dist-info -> /usr/lib/python3.11/site-packages/XStatic_Font_Awesome-6.2.1.1.dist-info, removed "/usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/fonts/fontawesome-webfont.woff2 /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/_path.scss /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/animated.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/_larger.scss /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/fonts/fontawesome-webfont.ttf /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/font-awesome.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/stacked.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/screen-reader.less /usr/lib/python3.11/site-packages
 /xstatic/pkg/font_awesome/data/scss/font-awesome.scss /usr/lib/python3.11/site-packages/XStatic_Font_Awesome-4.7.0.0-py3.11-nspkg.pth /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/font-awesome.min.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/fonts/fontawesome-webfont.eot /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/icons.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/rotated-flipped.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/fonts/fontawesome-webfont.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/path.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/bordered-pulled.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/larger.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/variables.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/font-awesome.
 less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/fonts/FontAwesome.otf /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/fixed-width.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/fonts/fontawesome-webfont.woff /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/core.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/mixins.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/list.less", added "/usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/comments.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-open.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/door-open.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/algolia.svg /usr/lib/python3.11/site-package
 s/xstatic/pkg/font_awesome/data/svgs/solid/lock-open.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dumbbell.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/oil-well.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/youtube.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/down-long.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/left-long.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-open-reader.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/confluence.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/image.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/paragraph.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-share-nodes.svg /usr/lib/python3.11/site-packages/xst
 atic/pkg/font_awesome/data/less/solid.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/phone-volume.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice-d20.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/place-of-worship.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/z.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/spray-can-sparkles.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/umbrella-beach.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-beam.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-kiss-beam.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bolt-lightning.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/themeisle.svg /usr/lib/python3.11/site-pack
 ages/xstatic/pkg/font_awesome/data/svgs/solid/head-side-virus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shop.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/star.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/stop.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-point-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-root-variable.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/v4-font-face.min.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/v5-font-face.min.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata/shims.yml /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/v.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/schlix.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awe
 some/data/svgs/solid/person-dots-from-line.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ghost.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gifts.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/globe.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/water.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/linkedin.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/network-wired.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bars-staggered.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-from-bracket.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hacker-news.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pinterest-p.svg /usr/lib/python3.11/site-packages/xstatic/pkg/fon
 t_awesome/data/svgs/solid/house-circle-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane-circle-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/google-play.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/google-plus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart-circle-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-circle-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane-circle-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/border-all.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pepper-hot.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hourglass-start.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-chimney.svg /usr
 /lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/table-columns.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/clock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-by.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-nc.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-nd.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-pd.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-sa.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/glasses.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/icicles.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/viruses.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/d
 ata/svgs/solid/clipboard-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/i.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fire-extinguisher.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/exclamation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/angellist.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/slideshare.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-twitter.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-font-awesome-stroke.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/copy.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/tiktok.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-h.svg /usr/lib/python3.11/site-packages/xstatic/pkg/fon
 t_awesome/data/svgs/solid/square-h.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/x.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-wink.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/joomla.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/newspaper.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/satellite-dish.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/nimblr.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/tumblr.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/freebsd.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-arrow-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-caret-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awes
 ome/data/svgs/solid/stamp.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/store.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/star-half.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/turkish-lira-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/d.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/dropbox.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/memory.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trophy.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ruler-combined.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/avianex.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/object-group.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bell
 -slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/link-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shop-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/text-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/flag-usa.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/zhihu.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bowling-ball.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/magnifying-glass-plus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ranking-star.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rectangle-ad.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/regula
 r.scss /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/radiation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart-circle-bolt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chevron-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/filter-circle-dollar.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/orcid.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-facebook.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/get-pocket.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/credit-card.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/microphone-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/google-wallet.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awes
 ome/data/svgs/solid/prescription-bottle-medical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/volleyball.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-point-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bucket.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/carrot.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/faucet.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/indent.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/locust.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/magnet.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pallet.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/repeat.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/sol
 id/rocket.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/buysellads.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/blender.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/soundcloud.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/feather.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-bill-1-wave.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/spinner.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/paintbrush.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/stapler.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trailer.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/h.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-youtube.svg /us
 r/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mobile-screen-button.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/less-than-equal.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bread-slice.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/phone-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pizza-slice.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/staff-snake.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/store-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tablets.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/users-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/video-
 slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/virus-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-jcb.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-turn-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gauge-simple-high.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-nc-eu.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/napster.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/twitter.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hooli.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clapperboard.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/greater-than.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs
 /brands/hornbill.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cannabis.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/moon.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/thumbs-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-right-from-square.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-smile.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_mixins.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/table.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/houzz.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/code-pull-request.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-bill-wheat.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svg
 s/solid/teeth.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tents.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tooth.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/train.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trash.svg /usr/lib/python3.11/site-packages/XStatic_Font_Awesome-6.2.1.1-py3.11-nspkg.pth /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/flipboard.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square-caret-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/box-archive.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-up-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calendar-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calendar-xmark.
 svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-sun-rain.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-visa.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bezier-curve.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/folder-minus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-medical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/notes-medical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-medical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-monster.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-smile-beam.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ring.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/r
 oad.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/skull-crossbones.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bluetooth-b.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chalkboard.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/martini-glass-empty.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sign-hanging.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/envelopes-bulk.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-shield.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-shield.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/earth-africa.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/keybase.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/
 sprites/solid.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/alipay.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/snowflake.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gripfire.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-skiing-nordic.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-circle-exclamation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sun-plant-wilt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tornado.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-circle-exclamation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plug-circle-exclamation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-powerpoint.svg /usr/lib/python3.11/site-
 packages/xstatic/pkg/font_awesome/data/svgs/solid/road-circle-exclamation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sourcetree.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mask-face.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/behance.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/folder.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chess-king.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/apper.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ember.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mixer.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/viber.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-booth.svg /usr/lib/python3.11/site-packages/xst
 atic/pkg/font_awesome/data/svgs/solid/person-burst.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-dress.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-rifle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/building.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/uniregistry.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/font-awesome.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fort-awesome.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/app-store.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bootstrap.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/asterisk.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-squint.svg /usr/lib/python3.11/site-p
 ackages/xstatic/pkg/font_awesome/data/svgs/brands/strava.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hat-cowboy.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/rectangle-list.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sort-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/turn-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/LICENSE.txt /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/microsoft.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-right-dots.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-short-wide.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/thumbs-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/critical-role.svg /usr/lib/python3.11/sit
 e-packages/xstatic/pkg/font_awesome/data/svgs/solid/chevron-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chevron-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-point-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/closed-captioning.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/palette.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/staylinked.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shoe-prints.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-flood-water-circle-arrow-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart-circle-minus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/weight-scale.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/sv
 gs/solid/bridge-circle-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/microphone.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/earth-americas.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/volume-high.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/down-left-and-up-right-to-center.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/nutritionix.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-code.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/address-book.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gitkraken.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/train-tram.svg /usr/lib/python3.11/site-packages/xs
 tatic/pkg/font_awesome/data/svgs/solid/envelope.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/seedling.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/users.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/charging-station.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-minus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/magento.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-walking-arrow-loop-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/typo3.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/closed-captioning.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-tongue-squint.svg /usr/lib/p
 ython3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/helicopter.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/poo-storm.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/comment.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/outdent.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hryvnia-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/percent.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/briefcase-medical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-right-long.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/jedi-order.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/earth-oceania.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/amilia.svg /usr/lib/py
 thon3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-phone-flip.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-laugh-beam.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-sampling.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/people-carry-box.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bilibili.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/css3-alt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands-asl-interpreting.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/envelope-open.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mars-double.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sack-dollar.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesom
 e/data/svgs/solid/user-doctor.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/list-ul.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/optin-monster.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/futbol.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/spray-can.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trash-can.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/reacteurope.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bag-shopping.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-github.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-gitlab.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-holding.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_a
 wesome/data/svgs/solid/house-medical-circle-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bed-pulse.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cart-plus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-plus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-peace.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wine-bottle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts/fa-regular-400.woff2 /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/scale-unbalanced-flip.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-falling-burst.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/steam.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-import.svg /usr/lib/python3.11/sit
 e-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-squint-tears.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/buromobelexperte.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bottle-water.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bridge-water.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-minus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-nodes.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-notch.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-pau
 se.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/f.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chart-area.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/pen-to-square.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/earth-asia.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-spock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tablet-screen-button.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/reddit.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-laugh-wink.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-shelter.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/redhat.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/at.svg
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/om.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tv.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/envira.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fedora.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hotjar.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/deploydog.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/vimeo.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/weibo.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/yahoo.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-surprise.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/grip-lines-vertical.svg /usr/lib/python3.11/site-pack
 ages/xstatic/pkg/font_awesome/data/svgs/solid/file-video.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vial-virus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/floppy-disk.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hockey-puck.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/compress.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata/icon-families.yml /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/lemon.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-dollar-to-slot.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/screwdriver.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ellipsis-vertical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice.svg /usr/lib/python3.11/site-
 packages/xstatic/pkg/font_awesome/data/svgs/solid/dove.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/drum.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fill.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/film.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fire.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fish.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/flag.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/font.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/think-peaks.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/angles-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/angles-l
 eft.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-spin.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-medical-circle-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/thumbs-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/droplet.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/headset.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/retweet.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/code-merge.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/martini-glass-citrus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/car-battery.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice-five.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/s
 olid/square-person-confined.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/monument.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hat-wizard.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/code-branch.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/road-bridge.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/delete-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-plus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/brazilian-real-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/people-line.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/broom-ball.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-bolt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_aw
 esome/data/svgs/solid/money-bill.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/piggy-bank.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rotate-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shuttle-space.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/users-between-lines.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/palfed.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pushed.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gitlab.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice-one.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ideal.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/rebel.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/sv
 gs/solid/joint.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/magnifying-glass-location.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pen-clip.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/linkedin-in.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/splotch.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chevron-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/shirtsinbulk.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/stack-overflow.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/campground.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/eye-dropper.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/location-dot.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awes
 ome/data/svgs/solid/location-pin.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/school-circle-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/anchor-circle-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/expeditedssl.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/magnifying-glass-arrow-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_stacked.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-middle-finger.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/vaadin.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/weixin.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/angrycreative.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/nfc-symbol.svg /usr/lib/python3.11/s
 ite-packages/xstatic/pkg/font_awesome/data/svgs/solid/leaf.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/link.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/list.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/star-half-stroke.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rainbow.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-1-9.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-circle-minus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-lines.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-video.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-angry.svg /usr/lib/python3.11/site-pac
 kages/xstatic/pkg/font_awesome/data/svgs/regular/face-dizzy.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-frown.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-laugh.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-smile.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-tired.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-audio.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-excel.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mars-stroke.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/note-sticky.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-1-9.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-9-1.svg /usr/lib/python
 3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-a-z.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-z-a.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/stethoscope.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-arrow-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-caret-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-circle-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plug-circle-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/road-circle-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/chart-bar.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart-circle-exclamation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awes
 ome/data/svgs/solid/bottle-droplet.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-circle-exclamation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane-circle-exclamation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/bell-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-field.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-front.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/fontawesome.scss /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/golf-ball-tee.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/android.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-frown-open.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/volcano.svg /usr/lib/python3.11/site-pa
 ckages/xstatic/pkg/font_awesome/data/svgs/solid/laptop-medical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-arrow-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trash-arrow-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ice-cream.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/microphone-lines.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-snapchat.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/y-combinator.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/expand.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shield.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/lightbulb.svg /usr/lib
 /python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/upload.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/up-right-and-down-left-from-center.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-showers-heavy.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hashtag.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/facebook.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/comment-dots.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/text-width.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/anchor.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/burger.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clover.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/eraser.svg /u
 sr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/filter.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/folder.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/guitar.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hammer.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/marker.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/meteor.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/forward.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/id-card.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sd-card.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/star-half-stroke.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-turn-right.svg /usr/lib/python3.11/site-pack
 ages/xstatic/pkg/font_awesome/data/svgs/brands/itunes-note.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-left-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grimace.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-surprise.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-back-fist.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-wide-short.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mountain.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/grunt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/joget.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/medrt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/react.svg /usr/lib/python3.11/sit
 e-packages/xstatic/pkg/font_awesome/data/svgs/brands/swift.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/uikit.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/yoast.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/shopify.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/spotify.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-snowboarding.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/i-cursor.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-medical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-medical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pump-medical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sun.svg /usr/lib/python3.11/site-packages/xstati
 c/pkg/font_awesome/data/scss/_shims.scss /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/unlock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/airbnb.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/microphone-lines-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/centercode.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hackerrank.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-from-water-pump.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-signature.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-radiation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/chrome.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/readme.svg /usr/lib/python3.11/site-packag
 es/xstatic/pkg/font_awesome/data/svgs/brands/digital-ocean.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/skyatlas.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-bill-wave.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gg-circle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/weight-hanging.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-arrow-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calendar.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/newspaper.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-whatsapp.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/car.svg /usr/lib/python3.11/site-pa
 ckages/xstatic/pkg/font_awesome/data/svgs/solid/cat.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fax.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gem.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/regular.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gun.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-hearts.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/jar.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-lines.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/grip-lines.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/republican.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-military-pointing.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awes
 ome/data/svgs/solid/arrow-right-to-city.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/solid.min.js /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-right-from-bracket.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/angles-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/thumbs-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/object-group.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/toilet-paper.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/share.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shirt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/skull.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svg
 s/solid/socks.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/spoon.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/comment-dollar.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bridge.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cheese.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cookie.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/divide.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mobile.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mosque.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/qrcode.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/v4-shims.js /usr/lib/python3.11/site-packages
 /xstatic/pkg/font_awesome/data/svgs/solid/rotate.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/kiwi-bird.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trademark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bandage.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/message.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/syringe.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/restroom.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/periscope.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/quinscape.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/snowplow.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/equals.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data
 /svgs/solid/images.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shapes.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/stairs.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/industry.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ravelry.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cow.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dna.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dog.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/egg.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/eye.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fan.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ban.svg /usr/lib/python3.11/site-packages/xstatic/pkg
 /font_awesome/data/svgs/solid/bed.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/box.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bug.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/html5.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/black-tie.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/firefox.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/v4-shims.scss /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/linode.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/atom.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/baby.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bars.svg /usr/lib/python3.11/s
 ite-packages/xstatic/pkg/font_awesome/data/svgs/solid/bath.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bell.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/blog.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/copy.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/crop.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/crow.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cube.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ship.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bridge-lock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-info.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/bran
 ds/hashnode.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-play.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/d-and-d-beyond.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wolf-pack-battalion.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cookie-bite.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mercury.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/up-down-left-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-columns.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clipboard.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awes
 ome/data/svgs/solid/book-bible.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/edge.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ello.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/etsy.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hive.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/imdb.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/java.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/less.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/line.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/grav.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gulp.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chart-simple.svg /usr/lib/python3.11/
 site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gauge-simple.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-signal.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/thermometer.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/train-subway.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/suitcase-rolling.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/car-rear.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/peseta-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart-pulse.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-beam-sweat.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/paper-plane.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/solar-panel.svg 
 /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-plane.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bus-simple.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-image.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/desktop.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/handshake-simple-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-biking.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-hiking.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-skiing.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/regular.min.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-user.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice-two.
 svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/up-right-from-square.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/neos.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/node.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/rust.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sass.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sith.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/suse.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hospital.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/uber.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/usps.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/vine.svg /usr/lib/python3.11/site-packages/xsta
 tic/pkg/font_awesome/data/svgs/solid/5.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-powerpoint.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/anchor-lock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/folder-plus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/folder-tree.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/table-cells-large.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-prescription.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/vimeo-v.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/discourse.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-through-window.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/heart.svg /usr/lib/python3.11/site
 -packages/xstatic/pkg/font_awesome/data/svgs/solid/school-circle-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/conflict-detection.min.js /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/list-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wheelchair.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/stackpath.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/laptop.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shrimp.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/adn.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/aws.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/btc.svg /usr/lib/python3.11/site-packages/xstatic/pkg
 /font_awesome/data/svgs/brands/dev.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/dhl.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fly.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/git.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mdb.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mix.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/npm.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/up-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/page4.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-meh.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-pdf.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-peace.svg /usr/lib/
 python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-spock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hard-drive.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bowl-rice.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cart-flatbed.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-flushed.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/basket-shopping.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/crop-simple.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/draft2digital.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-pdf.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plus-minus.svg /usr/
 lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-minus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/svg-with-js.min.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/erlang.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/golang.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_core.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/kickstarter.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/playstation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/whatsapp.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/adversal.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-pause.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/people-pulling.svg /usr/lib/python3.11/
 site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-parking.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata/icons.json /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cake-candles.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/waze.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wodu.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/xbox.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/xing.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/yarn.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/yelp.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-arrow-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-up-across-line.svg /usr/lib/python3.11/site-packages/x
 static/pkg/font_awesome/data/svgs/solid/flask-vial.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-up-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-right-to-bracket.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata/icons.yml /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hourglass-end.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-wink.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pied-piper-hat.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sliders.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-military-rifle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_list.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pager.svg /usr/lib/python3.11/site-
 packages/xstatic/pkg/font_awesome/data/svgs/solid/paste.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-fist.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pause.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/peace.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/phone.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pills.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/print.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/barcode.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/free-code-camp.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/font-awesome.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/dat
 a/svgs/solid/head-side-mask.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/road-barrier.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/envelope-open-text.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-exclamation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/calendar-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/renren.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/keyboard.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/v4-shims.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-kiss-beam.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-long.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/map-pin.svg /usr/lib/python3.11/site-packages/xstatic/pkg/f
 ont_awesome/data/sprites/brands.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-graduate.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-meh.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/star-and-crescent.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/frog.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vest.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vial.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/right-long.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/figma.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/opera.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/quora.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vest-pat
 ches.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/text-height.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-walking-luggage.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/stroopwafel.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/space-awesome.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/road-spikes.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands-holding-circle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/basketball.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/jenkins.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-excel.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chess-board.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/d
 ata/svgs/solid/hands-bound.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/holly-berry.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-bills.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/briefcase.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/brands.scss /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/candy-cane.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tower-cell.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-chimney-user.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-tie.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/handcuffs.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-reddit.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/s
 vgs/solid/file-circle-question.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/id-badge.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sack-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/envelope-open.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mask-ventilator.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/flag.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gopuram.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/timeline.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/v4-shims.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-droplet.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/so
 lid/land-mine-on.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/car-burst.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/blogger-b.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-ninja.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-walking-arrow-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gamepad.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/e.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/brands.js /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-laugh-squint.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mizuni.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/star-of-life.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fea
 ther-pointed.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/folder-closed.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chart-bar.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/download.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mars-and-venus-burst.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/paint-roller.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/42-group.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/calendar-minus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/flickr.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-astronaut.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-moon-rain.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awes
 ome/data/js/regular.js /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts/fa-regular-400.ttf /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-up-to-line.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/object-ungroup.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/apple-pay.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata/shims.json /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/code-compare.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/menorah.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cmplid.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/openid.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-un.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/bran
 ds/guilded.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/red-river.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/scale-balanced.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/caret-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chart-line.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/galactic-senate.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square-minus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/align-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/angle-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-lock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs
 /solid/plane-lock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/quote-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cable-car.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mobile-retro.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rotate-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-virus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/handshake-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mars-stroke-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/simplybuilt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/nfc-directional.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-walking-dashed-line-arrow-right.svg /usr/lib/python3.11/si
 te-packages/xstatic/pkg/font_awesome/data/svgs/regular/message.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wizards-of-the-coast.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/left-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hurricane.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-trend-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/warehouse.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/jar-wheat.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/computer-mouse.svg /usr/lib/p
 ython3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-tongue.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-point-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/svg-with-js.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/invision.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/draw-polygon.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-pointer.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/magnifying-glass-minus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/first-order.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-circle-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sitrox.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/
 eye-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/fontawesome.min.js /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-odnoklassniki.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/all.js /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-pinterest.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/9.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-bookmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/leanpub.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/fontawesome.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/martini-glass.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-circle-plus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plug-circle-p
 lus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wheat-awn-circle-exclamation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/opencart.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/headphones.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/location-arrow.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/d-and-d.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-breastfeeding.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/business-time.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/eject.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/award.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bacon.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/sol
 id/bahai.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/brain.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/broom.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/brush.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/burst.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chair.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-holding-droplet.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pen-ruler.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-pregnant.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-left.svg /usr
 /lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-play.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-stop.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-user.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-invoice.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bitcoin-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-ngo.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-injured.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/baby-carriage.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/edge-legacy.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/firefox-browser.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/soli
 d/stopwatch-20.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-flag.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-lock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-user.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sterling-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/octopus-deploy.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/instalod.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-image.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-beam.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/registered.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fort-awesome-alt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/f
 ont_awesome/data/svgs/solid/border-top-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chart-gantt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/6.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/layer-group.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/safari.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/empire.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gofore.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square-caret-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square-caret-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-atlas.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/steam-symbol.svg /usr/lib/python3.11/site-packages/xstatic/pk
 g/font_awesome/data/svgs/solid/utensils.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-stop.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-medical-flag.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trowel-bricks.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-scissors.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/1.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shield-cat.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shield-dog.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wikipedia-w.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vault.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/venus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_aw
 esome/data/svgs/solid/vials.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bore-hole.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-hearts.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/video.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/virus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/battery-empty.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pen-to-square.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-kiss.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-code.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/backward-fast.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome
 /data/svgs/solid/backward-step.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-arrow-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-word.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/scribd.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/life-ring.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/jet-fighter-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/landmark-dome.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/landmark-flag.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tent-arrow-down-to-line.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clipboard-user.svg /usr/lib/python3.11/site-pack
 ages/xstatic/pkg/font_awesome/data/svgs/solid/prescription.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-circle-arrow-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/accessible-icon.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/audio-description.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-tag.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/snowflake.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/fontawesome.min.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/delicious.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/toilet-portable.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/camera-retro.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/diagram-next.svg 
 /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/foursquare.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/school-circle-exclamation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/play.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plug.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bug-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/eye-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/poop.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/school-flag.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/school-lock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-share.svg /u
 sr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shekel-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/envelope.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/resolving.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/speaker-deck.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sticker-mule.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bookmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/landmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-moving.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/tencent-weibo.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-full.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rectangle
 -xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/share-nodes.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/3.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/highlighter.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/jet-fighter.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-tongue-wink.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/meetup.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/angular.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plant-wilt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands-holding-child.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temp
 erature-quarter.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-sad-cry.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/guarani-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-pointer.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-chimney-medical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_rotated-flipped.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/headphones-simple.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/stripe-s.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/flag-checkered.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fantasy-flight-games.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mosquito-net.svg /usr/lib/python3.11/site-packages/
 xstatic/pkg/font_awesome/data/svgs/regular/chess-knight.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grimace.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/greater-than-equal.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hill-rockslide.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/c.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hanukiah.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-tumblr.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gas-pump.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-circle-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plug-circle-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/road-circle-check.svg /usr/lib/
 python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vial-circle-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/kitchen-set.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pagelines.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/battle-net.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cuttlefish.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/google-pay.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/amazon.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/conflict-detection.js /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/python.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-empty.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/backward.svg /usr/li
 b/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/markdown.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/comment-sms.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/keyboard.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sim-card.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/0.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/paperclip.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/deviantart.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-dot.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-nfi.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-pen.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chess-queen.svg /usr/lib/python3.11/site-p
 ackages/xstatic/pkg/font_awesome/data/svgs/solid/square-rss.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/toggle-off.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/volume-low.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/volume-off.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_animated.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clipboard-list.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-holding-hand.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-zero.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calendar-day.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sink.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bluetooth.svg /usr/lib/python3.11/
 site-packages/xstatic/pkg/font_awesome/data/svgs/solid/smog.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/soap.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sort.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/share-from-square.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/goodreads.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-js.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mars-and-venus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/phoenix-framework.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chess-pawn.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/signs-post.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calculator.svg /usr/lib/python3.11/site-p
 ackages/xstatic/pkg/font_awesome/data/svgs/solid/face-laugh.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-large.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hot-tub-person.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/product-hunt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/themeco.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/beer-mug-empty.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/otter.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/life-ring.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tent-arrows-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/v4-shims.min.js /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cart-shopping.svg /usr/lib/python3.11/site-pac
 kages/xstatic/pkg/font_awesome/data/svgs/regular/face-laugh-beam.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-smile-beam.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-smile-wink.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-beam-sweat.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-poll-horizontal.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/image-portrait.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/evernote.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/boxes-stacked.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cubes-stacked.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-stars.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/s
 olid/face-grin-tears.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/contao.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-tanakh.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gear.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dumpster-fire.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gift.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/grip.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/clipboard.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wifi.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wind.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/worm.svg /usr/lib/python3.11/s
 ite-packages/xstatic/pkg/font_awesome/data/svgs/solid/drumstick-bite.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/stumbleupon-circle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/phoenix-squadron.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cloudflare.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/all.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/laptop-code.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/laptop-file.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mixcloud.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-arrow-up-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts/fa-solid-900.woff2 /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chess-knight.svg /usr/
 lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/child-combatant.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bullhorn.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-bill-trend-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-from-ground-water.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-stripe.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/studiovinari.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-flushed.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fire-flame-simple.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-mastercard.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/champagne-glasses.svg /usr/lib/python3.11/site-packages/xstatic/pkg/fon
 t_awesome/data/svgs/solid/parachute-box.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/_sizing.scss /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-moon.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/venus-mars.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bangladeshi-taka-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-a-z.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-to-circle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/deskpro.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/folder-open.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/images.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-holding-medical.svg /usr/lib/python3.11/site-packages
 /xstatic/pkg/font_awesome/data/svgs/solid/o.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/maximize.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/minimize.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/codepen.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pied-piper.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/forward-fast.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/forward-step.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/id-card-clip.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vr-cardboard.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands-bubbles.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-half.svg /usr/lib/python3.11/site-packages/xst
 atic/pkg/font_awesome/data/svgs/solid/circle-arrow-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-caret-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tag.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tty.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts/fa-v4compatibility.woff2 /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/diamond-turn-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/phabricator.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-export.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fulcrum.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sketch.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/twitch.svg /usr/lib/python3.11/site-packages/xst
 atic/pkg/font_awesome/data/svgs/brands/cloudscale.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cloudsmith.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/microchip.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wave-square.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-laptop.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/water-ladder.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-point-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/democrat.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wand-magic.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/clone.svg /usr/lib/python3.11/site-packages/x
 static/pkg/font_awesome/data/svgs/regular/face-frown-open.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart-crack.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-crack.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/spell-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-dots.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/table-cells.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/virus-covid.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts/fa-v4compatibility.ttf /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/car-on.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dragon.svg /usr/lib/python3.11/site-package
 s/xstatic/pkg/font_awesome/data/svgs/solid/mitten.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/git-alt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ribbon.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/j.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/question.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-walking-with-cane.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/dashcube.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bridge-circle-exclamation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/facebook-messenger.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/capsules.svg /usr/lib/python3.11/site-pack
 ages/xstatic/pkg/font_awesome/data/svgs/solid/church.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/crutch.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lightbulb.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sleigh.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wrench.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lemon.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lungs.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-question.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cash-register.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/galactic-republic.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-journal-whills.svg /usr/lib/python3.11/site-packages/xsta
 tic/pkg/font_awesome/data/svgs/solid/pen-nib.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-check-dollar.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/litecoin-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gratipay.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-holding-heart.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-tongue-wink.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/laravel.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wheat-awn.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square-caret-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/triangle-exclamation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wine-glass.svg /us
 r/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/comments.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-three-quarters.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-squint-tears.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/binoculars.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-sad-tear.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/jedi.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/receipt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tent-arrow-turn-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tent-arrow-left-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-meatball.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_
 awesome/data/svgs/brands/ussunnah.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/diagram-project.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-lizard.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/copyright.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ear-deaf.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wheelchair-move.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/accusoft.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rupiah-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/florin-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-cane.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-rays.svg /usr/lib/python3.11/site-packages/xstatic/pkg/
 font_awesome/data/svgs/solid/certificate.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/buffer.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/deezer.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/docker.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gitter.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/yammer.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-question.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wpbeginner.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/box-tissue.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ear-listen.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-rotate-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_a
 wesome/data/svgs/solid/clock-rotate-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/database.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/suitcase.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-audio.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pinterest.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mug-saucer.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/aviato.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/copyright.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/sprites/regular.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/underline.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/toilet-paper-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/
 data/svgs/solid/building-circle-exclamation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/window-maximize.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/window-minimize.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/artstation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/whiskey-glass.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/itch-io.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/paste.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts/fa-brands-400.ttf /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/camera-rotate.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hubspot.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fish-fins.svg /usr/lib/python3.11/site-packages/x
 static/pkg/font_awesome/data/svgs/solid/rectangle-list.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lines-leaning.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hill-avalanche.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hire-a-helper.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mailchimp.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-contract.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/8.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/terminal.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wand-magic-sparkles.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/weebly.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calendar-minus.svg /usr/lib/python3.11/site-
 packages/xstatic/pkg/font_awesome/data/svgs/solid/building-shield.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/right-to-bracket.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/megaport.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/unity.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/handshake.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/superscript.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/grip-vertical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/star-half.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/screwdriver-wrench.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-military-to-person.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clipboard-qu
 estion.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/raspberry-pi.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-csv.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chart-pie.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/buy-n-large.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/calendar-plus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/thumbtack.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/blackberry.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/baseball.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/football.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/handshake.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/n.svg /us
 r/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/replyd.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/compass.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/caret-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/angle-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-laugh-wink.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-smile-wink.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/old-republic.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-steam.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-vimeo.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/the-red
 -yeti.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-skull.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bowl-food.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-chimney-crack.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-nc-jp.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/solid.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/medal.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/minus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/lastfm.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mound.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/music.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/people-group.svg /usr/lib/
 python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/solid.min.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/all.min.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/droplet-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/jug-detergent.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/strikethrough.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/drum-steelpan.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/solid.js /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wine-glass-empty.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/4.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice-four.svg /usr/lib/python3.11/site-packages/xsta
 tic/pkg/font_awesome/data/svgs/solid/border-none.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/crown.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cubes.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clone.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/coins.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/couch.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cross.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dollar-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dolly.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/anchor-circle
 -exclamation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata/sponsors.yml /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/microblog.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-zipper.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/head-side-cough.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pied-piper-alt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/scale-unbalanced.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/bookmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/k.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/credit-card.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/faucet-drip.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid
 /house-flood-water.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/street-view.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/a.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/info.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hospital-user.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hourglass-half.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/universal-access.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/calendar.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-hacker-news.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/map-location.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ups.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs
 /brands/usb.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/vnv.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wix.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ns8.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/osi.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/php.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pix.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/fontawesome.js /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/rev.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/comment.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/m.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/toolbox.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awe
 some/data/svgs/brands/square-font-awesome.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/viadeo.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/b.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-bill-transfer.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-harassing.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/peso-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pied-piper-pp.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/windows.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/child-dress.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/helmet-un.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bridge-circle-xmark.svg /usr/lib/python3.11/site-packages/xsta
 tic/pkg/font_awesome/data/svgs/brands/sistrix.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/compact-disc.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-viadeo.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-discover.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fonticons-fi.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/servicestack.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/yandex.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/instagram.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/window-maximize.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/window-minimize.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/rockrms.svg /usr/lib/python3.11/site-pac
 kages/xstatic/pkg/font_awesome/data/svgs/brands/wpforms.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/synagogue.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/archway.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/display.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/regular.min.js /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/address-book.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/address-card.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-stars.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/eye.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/gem.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/map.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_aweso
 me/data/svgs/regular/sun.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-circle-question.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/7.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-lastfm.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-rolling-eyes.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/code-fork.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-field-un.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/subscript.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-arrow-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_variables.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-ramp-box.svg /usr/lib/python3.11/site-packages/xstatic/pkg/f
 ont_awesome/data/svgs/solid/power-off.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/yandex-international.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/folder-open.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/austral-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts/fa-solid-900.ttf /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/group-arrows-rotate.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/dochub.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/github.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/goodreads-g.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-xing.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/squarespace.svg /usr/lib/python3.11/site-packa
 ges/xstatic/pkg/font_awesome/data/svgs/solid/kit-medical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mattress-pillow.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/table-tennis-paddle-ball.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cart-arrow-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/baht-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cedi-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cent-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dong-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/euro-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-arrow-down.svg /usr/lib/pyth
 on3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lari-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lira-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mill-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/reply-all.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/umbrella.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/rectangle-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-pickup.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/children.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/battery-quarter.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/earlybirds.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tree-city.svg /usr/lib/pytho
 n3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/l.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/v4-shims.min.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/solid.scss /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tower-broadcast.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-trend-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/reddit-alien.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/floppy-disk.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calendar-days.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calendar-plus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calendar-week.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/signal.svg /usr/lib/python3.11/site-
 packages/xstatic/pkg/font_awesome/data/svgs/solid/handshake-angle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trowel.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/people-roof.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-full.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chess-rook.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-rain.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/users-rays.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-wide-short.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chalkboard-user.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/spaghetti-monster-flying.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/radio.svg /usr/l
 ib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-long.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/less-than.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/elevator.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/reply.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/robot.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/route.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ruler.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/github-alt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/s.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/dailymotion.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/virus-covid-slash.svg /usr/lib/python3.11/site-packa
 ges/xstatic/pkg/font_awesome/data/svgs/regular/chess-bishop.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_icons.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/magnifying-glass.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/u.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cotton-bureau.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-apple-pay.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-sad-cry.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wpexplorer.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sitemap.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-poll-vertical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tags.svg /usr/lib/python3.11/site-package
 s/xstatic/pkg/font_awesome/data/svgs/solid/tape.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tarp.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/taxi.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tent.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tree.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/superpowers.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/brands.min.js /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ban-smoking.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-quran.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/money-bill-1.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-amazon-pay.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svg
 s/brands/patreon.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/earth-europe.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cpanel.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/infinity.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fonticons.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lungs-virus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-high.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hourglass-half.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/elementor.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/screenpal.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-kiss-wink-heart.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_aweso
 me/data/svgs/brands/bandcamp.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/odnoklassniki.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-low.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/car-side.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/teeth-open.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/trade-federation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hard-drive.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/centos.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/people-robbery.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-laugh-squint.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-left-right-to-line.svg /usr/lib/python3.11/site-pa
 ckages/xstatic/pkg/font_awesome/data/svgs/brands/ubuntu.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/kip-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/teamspeak.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/chess-king.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/chess-pawn.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/amazon-pay.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/chess-rook.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/magnifying-glass-dollar.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mountain-city.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/won-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/yen-sign.svg /usr/lib/python3.11/
 site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mastodon.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/calendar-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/anchor-circle-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/filter-circle-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cloudversify.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-half-dress.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-git.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands-holding.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-meh-blank.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/bra
 nds/first-order-alt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-nurse.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wordpress.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/shopware.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hips.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/jira.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bity.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bots.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/css3.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/digg.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ebay.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/lyft.svg /usr/lib/python3.11/site
 -packages/xstatic/pkg/font_awesome/data/svgs/brands/meta.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/modx.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-up-down-left-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-large-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sellsy.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/brands.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bell-concierge.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mandalorian.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/jsfiddle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-point-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/indian-rupee-sign.svg /usr/lib/python
 3.11/site-packages/xstatic/pkg/font_awesome/data/less/_bordered-pulled.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ethereum.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-dot.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/umbraco.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gauge-high.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/horse-head.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/drupal.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/paypal.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-dribbble.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-showers-water.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/kaaba.svg /usr/lib/python3.1
 1/site-packages/xstatic/pkg/font_awesome/data/js/all.min.js /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square-full.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/atlassian.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square-plus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-sparkles.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/q.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/stopwatch.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wand-sparkles.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/not-equal.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/id-badge.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/box-open.svg /usr/lib/python3.11/site-packages/xsta
 tic/pkg/font_awesome/data/svgs/solid/file-pen.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-pen.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/autoprefixer.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/comments-dollar.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hotdog.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dharmachakra.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/traffic-light.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/car-tunnel.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/helmet-safety.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tablet-button.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ticket-simple.svg /usr/lib/python3.11/site-packag
 es/xstatic/pkg/font_awesome/data/svgs/solid/eye-low-vision.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-remix.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/window-restore.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/align-center.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chart-column.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/stack-exchange.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice-d6.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-chevron-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/2.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-pied-piper.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/trash-can.svg /u
 sr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-rotate-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/prescription-bottle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hourglass.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/neuter.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/server.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shower.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/spider.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/dyalog.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-circle-minus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plug-circle-minus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bullseye.svg 
 /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bacterium.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-down-to-people.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-back-fist.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/brands.min.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-up-lock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/fontawesome.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/internet-explorer.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart-circle-plus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/magnifying-glass-chart.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trash-can-arrow-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_aw
 esome/data/svgs/solid/star-of-david.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-tears.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-waveform.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-squint.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fingerprint.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/unlock-keyhole.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/align-justify.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/itunes.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fill-drip.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tachograph-digital.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cruzeiro-sign.svg /usr/lib/python3.11/site
 -packages/xstatic/pkg/font_awesome/data/svgs/solid/diamond.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dungeon.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/section.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/rocketchat.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-circle-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/discord.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/slack.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/diaspora.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_shims.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-chimney-window.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/check-double.svg /usr/lib/python3.11/site-packages/
 xstatic/pkg/font_awesome/data/svgs/solid/venus-double.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/registered.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-amex.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-digging.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-falling.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-praying.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-running.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-skating.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-walking.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hospital.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/right-from-bracket.svg /usr/lib/py
 thon3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/app-store-ios.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/window-restore.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/monero.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/language.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-plus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/forumbee.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shield-halved.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sailboat.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/uncharted.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sort-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/turn-up.svg /usr/lib/python3.11/
 site-packages/xstatic/pkg/font_awesome/data/svgs/regular/star.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/user.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-kiss.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/users-rectangle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-fire.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-flag.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/phone-flip.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/photo-film.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-fast.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-google-plus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-dizzy.svg /usr/lib/python3.11/si
 te-packages/xstatic/pkg/font_awesome/data/svgs/solid/hamsa.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hippo.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/horse.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hotel.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plug-circle-bolt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/x-ray.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/folder-closed.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mortar-pestle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesom
 e/data/svgs/solid/vector-square.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/blender-phone.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-medical-circle-exclamation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/calendar-days.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bitbucket.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_fixed-width.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-point-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wordpress-simple.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-circle-plus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-chevron-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/symfony.svg /usr/l
 ib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/motorcycle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-chalkboard.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/glide-g.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/italic.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mountain-sun.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/chess-queen.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/graduation-cap.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-gear.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-diners-club.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/connectdevelop.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/t.svg /us
 r/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-sun.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ellipsis.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/medium.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/compass.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/right-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/table-list.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/users-line.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-wide.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/van-shuttle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/battery-three-quarters.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-frown.sv
 g /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bold.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bolt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bomb.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bone.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bong.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bugs.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/city.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/code.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ankh.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/caravan.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs
 /solid/code-commit.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/oil-can.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/snowman.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/canadian-maple-leaf.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/align-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/angle-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/caret-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hat-cowboy-side.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/quote-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fire-burner.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/
 data/svgs/brands/audible.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-z-a.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pen-fancy.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-paypal.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/p.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/notdef.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-chevron-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-chevron-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/crosshairs.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/searchengin.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/futbol.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/dat
 a/svgs/solid/pencil.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/colon-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/franc-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/manat-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/naira-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ruble-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rupee-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/school.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/scroll.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/envelope-circle-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tenge-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/s
 olid/hand-holding-dollar.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/google-drive.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/snapchat.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-wheat.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/angles-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/google-plus-g.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/xmarks-lines.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bimobject.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-sad-tear.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_screen-reader.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-sampling-plus.svg /usr/lib/python3.11/site-packag
 es/xstatic/pkg/font_awesome/data/svgs/solid/circle-half-stroke.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/child-reaching.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-word.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mars-stroke-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/head-side-cough-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bicycle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/braille.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/recycle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/scroll-torah.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-turn-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/check-to-slot.svg /usr/lib/pyth
 on3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-tsunami.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/masks-theater.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shuffle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tower-observation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ioxhost.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bars-progress.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/glass-water-droplet.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/v4-font-face.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/v5-font-face.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-circle-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-circl
 e-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ruler-vertical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/paper-plane.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/perbyte.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chess-bishop.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-bill-1.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/intercom.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/bell.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/brands.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata/icon-families.json /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-angry.svg /us
 r/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/id-card.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/diagram-successor.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/helicopter-symbol.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/record-vinyl.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shield-heart.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shield-virus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/swatchbook.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/location-pin-lock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/explosion.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/microscope.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands
 /square-behance.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-rolling-eyes.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/icons.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/igloo.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/image.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/inbox.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/puzzle-piece.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-phone.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/volume-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/apple.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/glide.sv
 g /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/skype.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-arrow-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/stumbleupon.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cart-flatbed-suitcase.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/map-location-dot.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/toilets-portable.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/camera.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/korvue.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/khanda.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands-clapping.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/
 solid/vihara.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/r-project.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/podcast.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-down-to-line.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-turn-to-dots.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-group.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-arrow-up-from-line.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/font-awesome.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/stripe.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mars.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mask.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data
 /svgs/solid/moon.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/suitcase-medical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/w.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mendeley.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata/categories.yml /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-instagram.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/researchgate.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/handshake-simple.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/share-from-square.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/scissors.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/diagram-predecessor.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font
 _awesome/data/svgs/solid/passport.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/users-viewfinder.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/keycdn.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/maxcdn.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts/fa-brands-400.woff2 /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice-three.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/angle-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/caret-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/transgender.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data
 /svgs/regular/face-meh-blank.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heading.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/smoking.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/up-long.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mosquito.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tarp-droplet.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/regular.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wirsindhandwerk.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/speakap.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pump-soap.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/kickstarter-k.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/p
 lane-departure.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-scissors.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wpressr.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tractor.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-split-up-and-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-clock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/untappd.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice-six.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/affiliatetheme.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sellcast.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-lizard.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data
 /svgs/regular/address-card.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/baseball-bat-ball.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/500px.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fedex.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/linux.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/telegram.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/panorama.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bitcoin.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/viacoin.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/codiepie.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-secret.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/doo
 r-closed.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/unsplash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/key.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-tired.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/map.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/paw.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pen.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/poo.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hourglass.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rss.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rug.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/spa.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font
 _awesome/data/svgs/brands/facebook-f.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/apple-whole.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/glass-water.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plate-wheat.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tablet.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ticket.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/toilet.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ruler-horizontal.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wallet.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/comment-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/signature.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/da
 ta/svgs/brands/vuejs.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/whmcs.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-9-1.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/computer.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dumpster.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-right-arrow-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/g.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-tongue.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gg.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/js.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/qq.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/vk.svg /usr/
 lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-user.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/compass-drafting.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-arrow-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-caret-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/road-lock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shop-lock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-lock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/comment-dots.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-left-long.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/list-ol.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/firs
 tdraft.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/blogger.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/trello.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-wide.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/node-js.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/yin-yang.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/dribbble.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/biohazard.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/toggle-on.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/medapps.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/battery-full.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/battery-half.svg /u
 sr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane-arrival.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/satellite.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/location-crosshairs.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-point-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-kiss-wink-heart.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bacteria.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_sizing.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-zipper.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/note-sticky.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-gri
 n-tongue-squint.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/asymmetrik.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/chromecast.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/_functions.scss /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/disease.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/google.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/kaggle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/supple.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-dress-burst.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ethernet.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-drowning.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person
 -swimming.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-pd-alt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mug-hot.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-short-wide.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-envelope.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/r.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/torii-gate.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/users-gear.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/y.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mobile-button.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-invoice-dollar.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/dat
 a/svgs/solid/mobile-screen.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/people-arrows.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/walkie-talkie.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/object-ungroup.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart-circle-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chess.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/child.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ferry.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-rotate.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-to-dot.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-to-eye.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_a
 wesome/data/svgs/solid/flask.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gauge.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gavel.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gears.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/genderless.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/watchman-monitoring.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-arrow-down-to-line.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/padlet.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fire-flame-curved.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-pointer.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/boxes-packing.svg /usr/lib/python3.11/site-packages/xstatic/pk
 g/font_awesome/data/svgs/solid/hands-praying.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sheet-plastic.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/voicemail.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/comment-medical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/salesforce.svg"
Changes to packages/core2-64-poky-linux/python3-xstatic-font-awesome (sysroot):
  /usr/lib/python3.11/site-packages/XStatic_Font_Awesome-4.7.0.0.dist-info moved to /usr/lib/python3.11/site-packages/XStatic_Font_Awesome-6.2.1.1.dist-info
  /usr/lib/python3.11/site-packages/XStatic_Font_Awesome-4.7.0.0-py3.11-nspkg.pth moved to /usr/lib/python3.11/site-packages/XStatic_Font_Awesome-6.2.1.1-py3.11-nspkg.pth
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/all.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/all.min.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/brands.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/brands.min.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/fontawesome.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/fontawesome.min.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/regular.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/regular.min.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/solid.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/solid.min.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/svg-with-js.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/svg-with-js.min.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/v4-font-face.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/v4-font-face.min.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/v4-shims.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/v4-shims.min.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/v5-font-face.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/v5-font-face.min.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/all.js was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/all.min.js was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/brands.js was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/brands.min.js was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/conflict-detection.js was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/conflict-detection.min.js was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/fontawesome.js was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/fontawesome.min.js was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/regular.js was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/regular.min.js was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/solid.js was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/solid.min.js was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/v4-shims.js was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/v4-shims.min.js was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_animated.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_bordered-pulled.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/brands.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_core.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_fixed-width.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/fontawesome.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_icons.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_list.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_mixins.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/regular.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_rotated-flipped.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_screen-reader.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_shims.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_sizing.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/solid.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_stacked.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/v4-shims.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_variables.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/LICENSE.txt was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata/categories.yml was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata/icon-families.json was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata/icon-families.yml was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata/icons.json was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata/icons.yml was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata/shims.json was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata/shims.yml was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata/sponsors.yml was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/brands.scss was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/fontawesome.scss was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/_functions.scss was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/regular.scss was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/_shims.scss was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/_sizing.scss was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/solid.scss was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/v4-shims.scss was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/sprites was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/sprites/brands.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/sprites/regular.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/sprites/solid.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/42-group.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/500px.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/accessible-icon.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/accusoft.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/adn.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/adversal.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/affiliatetheme.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/airbnb.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/algolia.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/alipay.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/amazon-pay.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/amazon.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/amilia.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/android.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/angellist.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/angrycreative.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/angular.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/apper.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/apple-pay.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/apple.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/app-store-ios.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/app-store.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/artstation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/asymmetrik.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/atlassian.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/audible.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/autoprefixer.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/avianex.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/aviato.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/aws.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bandcamp.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/battle-net.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/behance.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bilibili.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bimobject.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bitbucket.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bitcoin.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bity.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/blackberry.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/black-tie.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/blogger-b.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/blogger.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bluetooth-b.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bluetooth.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bootstrap.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bots.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/btc.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/buffer.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/buromobelexperte.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/buy-n-large.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/buysellads.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/canadian-maple-leaf.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-amazon-pay.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-amex.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-apple-pay.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-diners-club.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-discover.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-jcb.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-mastercard.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-paypal.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-stripe.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-visa.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/centercode.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/centos.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/chromecast.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/chrome.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cloudflare.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cloudscale.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cloudsmith.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cloudversify.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cmplid.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/codepen.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/codiepie.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/confluence.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/connectdevelop.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/contao.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cotton-bureau.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cpanel.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-by.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-nc-eu.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-nc-jp.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-nc.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-nd.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-pd-alt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-pd.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-remix.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-sampling-plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-sampling.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-sa.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-share.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-zero.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/critical-role.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/css3-alt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/css3.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cuttlefish.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/dailymotion.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/d-and-d-beyond.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/d-and-d.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/dashcube.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/deezer.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/delicious.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/deploydog.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/deskpro.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/deviantart.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/dev.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/dhl.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/diaspora.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/digg.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/digital-ocean.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/discord.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/discourse.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/dochub.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/docker.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/draft2digital.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/dribbble.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/dropbox.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/drupal.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/dyalog.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/earlybirds.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ebay.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/edge-legacy.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/edge.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/elementor.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ello.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ember.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/empire.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/envira.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/erlang.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ethereum.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/etsy.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/evernote.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/expeditedssl.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/facebook-f.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/facebook-messenger.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/facebook.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fantasy-flight-games.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fedex.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fedora.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/figma.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/firefox-browser.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/firefox.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/firstdraft.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/first-order-alt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/first-order.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/flickr.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/flipboard.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fly.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/font-awesome.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fonticons-fi.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fonticons.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fort-awesome-alt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fort-awesome.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/forumbee.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/foursquare.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/freebsd.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/free-code-camp.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fulcrum.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/galactic-republic.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/galactic-senate.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/get-pocket.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gg-circle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gg.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/git-alt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/github-alt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/github.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gitkraken.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gitlab.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/git.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gitter.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/glide-g.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/glide.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gofore.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/golang.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/goodreads-g.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/goodreads.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/google-drive.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/google-pay.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/google-play.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/google-plus-g.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/google-plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/google.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/google-wallet.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gratipay.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/grav.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gripfire.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/grunt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/guilded.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gulp.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hacker-news.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hackerrank.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hashnode.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hips.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hire-a-helper.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hive.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hooli.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hornbill.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hotjar.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/houzz.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/html5.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hubspot.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ideal.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/imdb.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/instagram.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/instalod.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/intercom.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/internet-explorer.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/invision.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ioxhost.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/itch-io.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/itunes-note.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/itunes.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/java.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/jedi-order.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/jenkins.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/jira.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/joget.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/joomla.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/jsfiddle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/js.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/kaggle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/keybase.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/keycdn.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/kickstarter-k.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/kickstarter.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/korvue.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/laravel.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/lastfm.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/leanpub.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/less.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/line.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/linkedin-in.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/linkedin.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/linode.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/linux.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/lyft.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/magento.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mailchimp.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mandalorian.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/markdown.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mastodon.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/maxcdn.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mdb.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/medapps.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/medium.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/medrt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/meetup.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/megaport.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mendeley.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/meta.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/microblog.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/microsoft.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mixcloud.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mixer.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mix.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mizuni.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/modx.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/monero.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/napster.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/neos.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/nfc-directional.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/nfc-symbol.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/nimblr.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/node-js.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/node.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/npm.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ns8.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/nutritionix.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/octopus-deploy.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/odnoklassniki.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/old-republic.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/opencart.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/openid.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/opera.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/optin-monster.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/orcid.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/osi.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/padlet.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/page4.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pagelines.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/palfed.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/patreon.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/paypal.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/perbyte.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/periscope.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/phabricator.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/phoenix-framework.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/phoenix-squadron.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/php.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pied-piper-alt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pied-piper-hat.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pied-piper-pp.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pied-piper.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pinterest-p.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pinterest.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pix.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/playstation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/product-hunt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pushed.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/python.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/qq.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/quinscape.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/quora.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/raspberry-pi.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ravelry.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/reacteurope.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/react.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/readme.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/rebel.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/reddit-alien.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/reddit.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/redhat.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/red-river.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/renren.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/replyd.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/researchgate.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/resolving.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/rev.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/rocketchat.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/rockrms.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/r-project.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/rust.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/safari.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/salesforce.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sass.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/schlix.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/screenpal.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/scribd.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/searchengin.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sellcast.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sellsy.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/servicestack.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/shirtsinbulk.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/shopify.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/shopware.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/simplybuilt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sistrix.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sith.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sitrox.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sketch.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/skyatlas.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/skype.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/slack.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/slideshare.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/snapchat.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/soundcloud.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sourcetree.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/space-awesome.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/speakap.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/speaker-deck.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/spotify.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-behance.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-dribbble.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-facebook.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-font-awesome-stroke.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-font-awesome.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-github.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-gitlab.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-git.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-google-plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-hacker-news.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-instagram.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-js.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-lastfm.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-odnoklassniki.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-pied-piper.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-pinterest.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-reddit.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-snapchat.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/squarespace.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-steam.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-tumblr.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-twitter.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-viadeo.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-vimeo.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-whatsapp.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-xing.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-youtube.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/stack-exchange.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/stack-overflow.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/stackpath.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/staylinked.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/steam.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/steam-symbol.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sticker-mule.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/strava.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/stripe-s.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/stripe.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/studiovinari.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/stumbleupon-circle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/stumbleupon.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/superpowers.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/supple.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/suse.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/swift.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/symfony.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/teamspeak.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/telegram.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/tencent-weibo.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/themeco.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/themeisle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/the-red-yeti.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/think-peaks.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/tiktok.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/trade-federation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/trello.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/tumblr.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/twitch.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/twitter.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/typo3.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/uber.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ubuntu.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/uikit.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/umbraco.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/uncharted.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/uniregistry.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/unity.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/unsplash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/untappd.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ups.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/usb.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/usps.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ussunnah.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/vaadin.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/viacoin.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/viadeo.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/viber.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/vimeo.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/vimeo-v.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/vine.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/vk.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/vnv.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/vuejs.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/watchman-monitoring.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/waze.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/weebly.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/weibo.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/weixin.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/whatsapp.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/whmcs.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wikipedia-w.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/windows.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wirsindhandwerk.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wix.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wizards-of-the-coast.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wodu.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wolf-pack-battalion.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wordpress-simple.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wordpress.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wpbeginner.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wpexplorer.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wpforms.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wpressr.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/xbox.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/xing.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/yahoo.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/yammer.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/yandex-international.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/yandex.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/yarn.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/y-combinator.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/yelp.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/yoast.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/youtube.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/zhihu.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/address-book.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/address-card.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/bell-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/bell.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/bookmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/building.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/calendar-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/calendar-days.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/calendar-minus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/calendar-plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/calendar.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/calendar-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/chart-bar.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/chess-bishop.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/chess-king.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/chess-knight.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/chess-pawn.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/chess-queen.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/chess-rook.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-dot.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-pause.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-play.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-question.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-stop.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-user.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/clipboard.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/clock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/clone.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/closed-captioning.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/comment-dots.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/comments.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/comment.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/compass.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/copyright.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/copy.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/credit-card.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/envelope-open.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/envelope.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/eye-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/eye.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-angry.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-dizzy.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-flushed.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-frown-open.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-frown.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grimace.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-beam.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-beam-sweat.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-hearts.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-squint.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-squint-tears.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-stars.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-tears.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-tongue-squint.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-tongue.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-tongue-wink.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-wide.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-wink.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-kiss-beam.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-kiss.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-kiss-wink-heart.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-laugh-beam.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-laugh-squint.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-laugh.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-laugh-wink.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-meh-blank.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-meh.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-rolling-eyes.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-sad-cry.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-sad-tear.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-smile-beam.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-smile.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-smile-wink.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-surprise.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-tired.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-audio.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-code.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-excel.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-image.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-lines.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-pdf.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-powerpoint.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-video.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-word.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-zipper.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/flag.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/floppy-disk.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/folder-closed.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/folder-open.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/folder.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/font-awesome.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/futbol.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/gem.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-back-fist.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-lizard.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-peace.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-point-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-pointer.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-point-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-point-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-point-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-scissors.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/handshake.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-spock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hard-drive.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/heart.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hospital.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hourglass-half.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hourglass.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/id-badge.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/id-card.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/images.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/image.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/keyboard.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/lemon.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/life-ring.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/lightbulb.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/map.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/message.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/money-bill-1.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/moon.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/newspaper.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/note-sticky.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/object-group.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/object-ungroup.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/paper-plane.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/paste.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/pen-to-square.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/rectangle-list.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/rectangle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/registered.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/share-from-square.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/snowflake.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square-caret-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square-caret-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square-caret-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square-caret-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square-full.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square-minus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square-plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/star-half-stroke.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/star-half.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/star.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/sun.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/thumbs-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/thumbs-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/trash-can.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/user.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/window-maximize.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/window-minimize.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/window-restore.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/0.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/1.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/2.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/3.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/4.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/5.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/6.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/7.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/8.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/9.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/address-book.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/address-card.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/align-center.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/align-justify.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/align-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/align-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/anchor-circle-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/anchor-circle-exclamation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/anchor-circle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/anchor-lock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/anchor.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/angle-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/angle-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/angle-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/angles-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/angles-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/angles-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/angles-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/angle-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ankh.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/apple-whole.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/archway.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-1-9.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-9-1.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-a-z.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-long.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-short-wide.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-up-across-line.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-up-lock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-wide-short.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-z-a.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-left-long.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-pointer.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-right-arrow-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-right-from-bracket.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-right-long.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-right-to-bracket.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-right-to-city.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-rotate-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-rotate-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-down-to-line.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-down-to-people.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-left-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-left-right-to-line.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-rotate.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-spin.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-split-up-and-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-to-circle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-to-dot.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-to-eye.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-turn-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-turn-to-dots.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-up-down-left-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-up-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-up-to-line.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-trend-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-trend-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-turn-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-turn-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-1-9.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-9-1.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-a-z.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-from-bracket.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-from-ground-water.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-from-water-pump.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-long.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-right-dots.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-right-from-square.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-short-wide.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-wide-short.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-z-a.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/asterisk.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/a.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/atom.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/at.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/audio-description.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/austral-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/award.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/baby-carriage.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/baby.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/backward-fast.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/backward-step.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/backward.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bacon.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bacteria.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bacterium.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bag-shopping.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bahai.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/baht-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bandage.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bangladeshi-taka-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ban-smoking.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ban.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/barcode.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bars-progress.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bars-staggered.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bars.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/baseball-bat-ball.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/baseball.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/basketball.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/basket-shopping.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bath.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/battery-empty.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/battery-full.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/battery-half.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/battery-quarter.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/battery-three-quarters.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bed-pulse.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bed.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/beer-mug-empty.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bell-concierge.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bell-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bell.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bezier-curve.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bicycle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/binoculars.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/biohazard.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bitcoin-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/blender-phone.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/blender.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/blog.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bold.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bolt-lightning.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bolt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bomb.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bone.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bong.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-atlas.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-bible.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-bookmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-journal-whills.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bookmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-medical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-open-reader.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-open.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-quran.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-skull.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-tanakh.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/border-all.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/border-none.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/border-top-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bore-hole.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bottle-droplet.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bottle-water.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bowl-food.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bowling-ball.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bowl-rice.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/box-archive.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/boxes-packing.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/boxes-stacked.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/box-open.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/box.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/box-tissue.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/braille.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/brain.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/brazilian-real-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bread-slice.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bridge-circle-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bridge-circle-exclamation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bridge-circle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bridge-lock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bridge.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bridge-water.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/briefcase-medical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/briefcase.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/broom-ball.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/broom.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/brush.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/b.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bucket.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bug-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bugs.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bug.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-circle-arrow-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-circle-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-circle-exclamation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-circle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-columns.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-flag.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-lock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-ngo.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-shield.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-un.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-user.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-wheat.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bullhorn.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bullseye.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/burger.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/burst.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/business-time.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bus-simple.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cable-car.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cake-candles.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calculator.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calendar-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calendar-days.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calendar-day.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calendar-minus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calendar-plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calendar.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calendar-week.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calendar-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/camera-retro.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/camera-rotate.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/camera.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/campground.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/candy-cane.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cannabis.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/capsules.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/caravan.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/car-battery.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/car-burst.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/caret-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/caret-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/caret-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/caret-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/car-on.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/car-rear.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/carrot.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/car-side.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/car.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cart-arrow-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cart-flatbed-suitcase.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cart-flatbed.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cart-plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cart-shopping.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/car-tunnel.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cash-register.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cat.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cedi-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cent-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/certificate.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chair.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chalkboard.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chalkboard-user.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/champagne-glasses.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/charging-station.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chart-area.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chart-bar.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chart-column.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chart-gantt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chart-line.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chart-pie.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chart-simple.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/check-double.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/check-to-slot.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cheese.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chess-bishop.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chess-board.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chess-king.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chess-knight.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chess-pawn.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chess-queen.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chess-rook.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chess.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chevron-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chevron-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chevron-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chevron-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/child-combatant.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/child-dress.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/child-reaching.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/children.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/child.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/church.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-arrow-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-arrow-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-arrow-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-arrow-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-chevron-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-chevron-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-chevron-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-chevron-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-dollar-to-slot.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-dot.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-exclamation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-half-stroke.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-h.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-info.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-minus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-nodes.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-notch.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-pause.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-play.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-question.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-radiation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-stop.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-user.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/city.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clapperboard.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clipboard-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clipboard-list.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clipboard-question.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clipboard.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clipboard-user.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clock-rotate-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clone.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/closed-captioning.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-arrow-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-arrow-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-bolt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-meatball.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-moon-rain.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-moon.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-rain.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-showers-heavy.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-showers-water.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-sun-rain.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-sun.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clover.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/code-branch.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/code-commit.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/code-compare.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/code-fork.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/code-merge.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/code-pull-request.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/code.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/coins.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/colon-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/comment-dollar.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/comment-dots.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/comment-medical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/comments-dollar.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/comment-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/comment-sms.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/comments.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/comment.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/compact-disc.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/compass-drafting.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/compass.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/compress.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/computer-mouse.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/computer.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cookie-bite.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cookie.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/copyright.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/copy.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/couch.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cow.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/credit-card.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/crop-simple.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/crop.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/crosshairs.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cross.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/crown.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/crow.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/crutch.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cruzeiro-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/c.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cubes-stacked.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cubes.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cube.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/database.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/delete-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/democrat.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/desktop.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dharmachakra.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/diagram-next.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/diagram-predecessor.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/diagram-project.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/diagram-successor.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/diamond.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/diamond-turn-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice-d20.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice-d6.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice-five.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice-four.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice-one.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice-six.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice-three.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice-two.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/disease.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/display.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/divide.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dna.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dog.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dollar-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dolly.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dong-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/door-closed.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/door-open.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dove.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/down-left-and-up-right-to-center.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/download.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/down-long.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dragon.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/draw-polygon.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/droplet-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/droplet.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/drum-steelpan.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/drumstick-bite.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/drum.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/d.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dumbbell.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dumpster-fire.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dumpster.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dungeon.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ear-deaf.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ear-listen.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/earth-africa.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/earth-americas.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/earth-asia.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/earth-europe.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/earth-oceania.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/egg.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/eject.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/elevator.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ellipsis.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ellipsis-vertical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/envelope-circle-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/envelope-open.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/envelope-open-text.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/envelopes-bulk.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/envelope.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/equals.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/eraser.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/e.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ethernet.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/euro-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/exclamation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/expand.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/explosion.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/eye-dropper.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/eye-low-vision.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/eye-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/eye.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-angry.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-dizzy.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-flushed.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-frown-open.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-frown.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grimace.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-beam.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-beam-sweat.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-hearts.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-squint.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-squint-tears.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-stars.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-tears.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-tongue-squint.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-tongue.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-tongue-wink.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-wide.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-wink.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-kiss-beam.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-kiss.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-kiss-wink-heart.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-laugh-beam.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-laugh-squint.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-laugh.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-laugh-wink.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-meh-blank.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-meh.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-rolling-eyes.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-sad-cry.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-sad-tear.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-smile-beam.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-smile.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-smile-wink.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-surprise.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-tired.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fan.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/faucet-drip.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/faucet.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fax.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/feather-pointed.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/feather.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ferry.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-arrow-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-arrow-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-audio.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-circle-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-circle-exclamation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-circle-minus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-circle-plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-circle-question.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-circle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-code.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-contract.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-csv.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-excel.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-export.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-image.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-import.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-invoice-dollar.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-invoice.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-lines.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-medical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-pdf.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-pen.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-powerpoint.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-prescription.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-shield.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-signature.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-video.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-waveform.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-word.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-zipper.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fill-drip.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fill.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/film.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/filter-circle-dollar.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/filter-circle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/filter.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fingerprint.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fire-burner.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fire-extinguisher.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fire-flame-curved.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fire-flame-simple.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fire.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fish-fins.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fish.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/flag-checkered.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/flag.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/flag-usa.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/flask.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/flask-vial.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/floppy-disk.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/florin-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/folder-closed.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/folder-minus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/folder-open.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/folder-plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/folder.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/folder-tree.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/font-awesome.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/font.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/football.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/forward-fast.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/forward-step.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/forward.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/franc-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/frog.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/f.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/futbol.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gamepad.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gas-pump.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gauge-high.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gauge-simple-high.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gauge-simple.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gauge.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gavel.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gears.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gear.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gem.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/genderless.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ghost.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gifts.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gift.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/glasses.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/glass-water-droplet.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/glass-water.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/globe.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/golf-ball-tee.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gopuram.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/graduation-cap.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/greater-than-equal.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/greater-than.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/grip-lines.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/grip-lines-vertical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/grip.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/grip-vertical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/group-arrows-rotate.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/g.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/guarani-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/guitar.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gun.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hammer.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hamsa.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-back-fist.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/handcuffs.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-dots.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-fist.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-holding-dollar.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-holding-droplet.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-holding-hand.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-holding-heart.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-holding-medical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-holding.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-lizard.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-middle-finger.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-peace.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-point-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-pointer.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-point-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-point-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-point-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands-asl-interpreting.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands-bound.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands-bubbles.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-scissors.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands-clapping.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/handshake-angle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/handshake-simple-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/handshake-simple.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/handshake-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/handshake.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands-holding-child.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands-holding-circle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands-holding.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-sparkles.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-spock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands-praying.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hanukiah.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hard-drive.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hashtag.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hat-cowboy-side.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hat-cowboy.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hat-wizard.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heading.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/headphones-simple.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/headphones.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/headset.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/head-side-cough-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/head-side-cough.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/head-side-mask.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/head-side-virus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart-circle-bolt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart-circle-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart-circle-exclamation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart-circle-minus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart-circle-plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart-circle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart-crack.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart-pulse.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/helicopter.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/helicopter-symbol.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/helmet-safety.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/helmet-un.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/highlighter.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hill-avalanche.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hill-rockslide.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hippo.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hockey-puck.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/holly-berry.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/horse-head.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/horse.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hospital.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hospital-user.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hotdog.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hotel.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hot-tub-person.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hourglass-end.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hourglass-half.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hourglass-start.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hourglass.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-chimney-crack.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-chimney-medical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-chimney.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-chimney-user.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-chimney-window.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-circle-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-circle-exclamation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-circle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-crack.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-fire.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-flag.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-flood-water-circle-arrow-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-flood-water.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-laptop.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-lock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-medical-circle-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-medical-circle-exclamation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-medical-circle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-medical-flag.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-medical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-signal.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-tsunami.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-user.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hryvnia-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/h.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hurricane.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ice-cream.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/icicles.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/icons.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/i-cursor.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/id-badge.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/id-card-clip.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/id-card.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/igloo.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/image-portrait.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/images.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/image.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/inbox.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/indent.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/indian-rupee-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/industry.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/infinity.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/info.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/i.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/italic.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/jar.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/jar-wheat.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/jedi.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/jet-fighter.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/jet-fighter-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/joint.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/j.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/jug-detergent.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/kaaba.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/keyboard.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/key.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/khanda.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/kip-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/kitchen-set.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/kit-medical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/kiwi-bird.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/k.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/landmark-dome.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/landmark-flag.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/landmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/land-mine-on.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/language.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/laptop-code.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/laptop-file.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/laptop-medical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/laptop.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lari-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/layer-group.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/leaf.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/left-long.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/left-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lemon.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/less-than-equal.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/less-than.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/life-ring.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lightbulb.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lines-leaning.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/link-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/link.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lira-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/list-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/list-ol.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/list.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/list-ul.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/litecoin-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/location-arrow.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/location-crosshairs.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/location-dot.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/location-pin-lock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/location-pin.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lock-open.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/locust.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/l.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lungs.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lungs-virus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/magnet.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/magnifying-glass-arrow-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/magnifying-glass-chart.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/magnifying-glass-dollar.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/magnifying-glass-location.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/magnifying-glass-minus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/magnifying-glass-plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/magnifying-glass.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/manat-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/map-location-dot.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/map-location.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/map-pin.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/map.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/marker.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mars-and-venus-burst.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mars-and-venus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mars-double.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mars-stroke-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mars-stroke.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mars-stroke-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mars.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/martini-glass-citrus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/martini-glass-empty.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/martini-glass.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mask-face.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/masks-theater.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mask.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mask-ventilator.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mattress-pillow.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/maximize.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/medal.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/memory.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/menorah.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mercury.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/message.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/meteor.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/microchip.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/microphone-lines-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/microphone-lines.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/microphone-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/microphone.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/microscope.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mill-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/minimize.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/minus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mitten.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mobile-button.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mobile-retro.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mobile-screen-button.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mobile-screen.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mobile.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-bill-1.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-bill-1-wave.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-bills.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-bill.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-bill-transfer.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-bill-trend-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-bill-wave.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-bill-wheat.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-check-dollar.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/monument.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/moon.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mortar-pestle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mosque.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mosquito-net.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mosquito.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/motorcycle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mound.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mountain-city.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mountain-sun.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mountain.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/m.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mug-hot.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mug-saucer.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/music.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/naira-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/network-wired.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/neuter.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/newspaper.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/notdef.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/not-equal.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/notes-medical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/note-sticky.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/n.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/object-group.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/object-ungroup.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/oil-can.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/oil-well.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/om.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/o.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/otter.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/outdent.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pager.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/paintbrush.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/paint-roller.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/palette.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pallet.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/panorama.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/paperclip.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/paper-plane.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/parachute-box.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/paragraph.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/passport.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/paste.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pause.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/paw.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/peace.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pencil.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pen-clip.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pen-fancy.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pen-nib.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pen-ruler.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pen.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pen-to-square.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/people-arrows.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/people-carry-box.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/people-group.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/people-line.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/people-pulling.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/people-robbery.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/people-roof.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pepper-hot.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/percent.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-arrow-down-to-line.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-arrow-up-from-line.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-biking.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-booth.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-breastfeeding.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-burst.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-cane.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-chalkboard.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-circle-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-circle-exclamation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-circle-minus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-circle-plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-circle-question.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-circle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-digging.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-dots-from-line.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-dress-burst.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-dress.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-drowning.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-falling-burst.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-falling.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-half-dress.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-harassing.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-hiking.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-military-pointing.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-military-rifle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-military-to-person.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-praying.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-pregnant.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-rays.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-rifle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-running.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-shelter.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-skating.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-skiing-nordic.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-skiing.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-snowboarding.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-swimming.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-through-window.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-walking-arrow-loop-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-walking-arrow-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-walking-dashed-line-arrow-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-walking-luggage.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-walking.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-walking-with-cane.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/peseta-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/peso-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/phone-flip.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/phone-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/phone.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/phone-volume.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/photo-film.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/piggy-bank.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pills.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pizza-slice.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/place-of-worship.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane-arrival.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane-circle-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane-circle-exclamation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane-circle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane-departure.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane-lock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plant-wilt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plate-wheat.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/play.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plug-circle-bolt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plug-circle-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plug-circle-exclamation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plug-circle-minus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plug-circle-plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plug-circle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plug.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plus-minus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/podcast.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/poop.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/poo-storm.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/poo.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/power-off.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/prescription-bottle-medical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/prescription-bottle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/prescription.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/print.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/p.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pump-medical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pump-soap.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/puzzle-piece.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/qrcode.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/q.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/question.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/quote-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/quote-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/radiation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/radio.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rainbow.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ranking-star.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/receipt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/record-vinyl.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rectangle-ad.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rectangle-list.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rectangle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/recycle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/registered.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/repeat.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/reply-all.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/reply.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/republican.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/restroom.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/retweet.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ribbon.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/right-from-bracket.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/right-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/right-long.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/right-to-bracket.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ring.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/road-barrier.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/road-bridge.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/road-circle-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/road-circle-exclamation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/road-circle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/road-lock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/road-spikes.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/road.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/robot.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rocket.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rotate-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rotate-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rotate.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/route.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rss.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/r.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ruble-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rug.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ruler-combined.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ruler-horizontal.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ruler.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ruler-vertical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rupee-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rupiah-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sack-dollar.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sack-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sailboat.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/satellite-dish.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/satellite.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/scale-balanced.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/scale-unbalanced-flip.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/scale-unbalanced.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/school-circle-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/school-circle-exclamation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/school-circle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/school-flag.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/school-lock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/school.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/scissors.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/screwdriver.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/screwdriver-wrench.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/scroll.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/scroll-torah.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sd-card.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/section.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/seedling.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/server.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shapes.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/share-from-square.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/share-nodes.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/share.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sheet-plastic.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shekel-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shield-cat.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shield-dog.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shield-halved.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shield-heart.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shield.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shield-virus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ship.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shirt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shoe-prints.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shop-lock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shop-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shop.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shower.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shrimp.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shuffle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shuttle-space.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/signal.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/signature.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sign-hanging.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/signs-post.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sim-card.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sink.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sitemap.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/skull-crossbones.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/skull.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sleigh.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sliders.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/smog.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/smoking.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/snowflake.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/snowman.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/snowplow.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/soap.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/socks.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/solar-panel.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sort-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sort.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sort-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/spaghetti-monster-flying.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/spa.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/spell-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/spider.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/spinner.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/splotch.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/spoon.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/spray-can-sparkles.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/spray-can.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-arrow-up-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-caret-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-caret-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-caret-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-caret-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-envelope.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-full.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-h.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-minus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-nfi.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-parking.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-pen.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-person-confined.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-phone-flip.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-phone.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-poll-horizontal.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-poll-vertical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-root-variable.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-rss.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-share-nodes.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-up-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-virus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/s.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/staff-snake.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/stairs.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/stamp.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/stapler.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/star-and-crescent.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/star-half-stroke.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/star-half.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/star-of-david.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/star-of-life.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/star.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sterling-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/stethoscope.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/stop.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/stopwatch-20.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/stopwatch.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/store-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/store.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/street-view.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/strikethrough.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/stroopwafel.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/subscript.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/suitcase-medical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/suitcase-rolling.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/suitcase.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sun-plant-wilt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sun.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/superscript.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/swatchbook.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/synagogue.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/syringe.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/table-cells-large.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/table-cells.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/table-columns.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/table-list.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/table.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tablet-button.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/table-tennis-paddle-ball.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tablet-screen-button.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tablets.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tablet.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tachograph-digital.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tags.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tag.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tape.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tarp-droplet.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tarp.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/taxi.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/teeth-open.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/teeth.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-arrow-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-arrow-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-empty.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-full.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-half.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-high.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-low.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-quarter.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-three-quarters.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tenge-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tent-arrow-down-to-line.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tent-arrow-left-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tent-arrows-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tent-arrow-turn-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tents.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tent.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/terminal.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/text-height.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/text-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/text-width.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/thermometer.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/thumbs-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/thumbs-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/thumbtack.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ticket-simple.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ticket.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/timeline.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/toggle-off.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/toggle-on.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/toilet-paper-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/toilet-paper.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/toilet-portable.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/toilets-portable.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/toilet.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/toolbox.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tooth.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/torii-gate.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tornado.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tower-broadcast.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tower-cell.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tower-observation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tractor.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trademark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/traffic-light.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trailer.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/train-subway.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/train.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/train-tram.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/transgender.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trash-arrow-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trash-can-arrow-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trash-can.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tree-city.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tree.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/triangle-exclamation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trophy.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trowel-bricks.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trowel.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-arrow-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-droplet.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-fast.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-field.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-field-un.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-front.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-medical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-monster.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-moving.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-pickup.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-plane.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-ramp-box.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/t.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tty.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/turkish-lira-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/turn-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/turn-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tv.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/umbrella-beach.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/umbrella.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/underline.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/universal-access.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/unlock-keyhole.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/unlock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/up-down-left-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/up-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/upload.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/up-long.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/up-right-and-down-left-from-center.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/up-right-from-square.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-astronaut.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-clock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-doctor.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-gear.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-graduate.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-group.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-injured.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-large-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-large.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-lock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-minus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-ninja.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-nurse.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-pen.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/users-between-lines.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-secret.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/users-gear.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-shield.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/users-line.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/users-rays.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/users-rectangle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/users-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/users.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/users-viewfinder.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-tag.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-tie.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/u.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/utensils.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/van-shuttle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vault.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vector-square.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/venus-double.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/venus-mars.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/venus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vest-patches.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vest.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vial-circle-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vials.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vial.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vial-virus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/video-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/video.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vihara.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/virus-covid-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/virus-covid.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/viruses.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/virus-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/virus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/voicemail.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/volcano.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/volleyball.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/volume-high.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/volume-low.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/volume-off.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/volume-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vr-cardboard.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/v.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/walkie-talkie.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wallet.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wand-magic-sparkles.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wand-magic.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wand-sparkles.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/warehouse.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/water-ladder.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/water.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wave-square.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/weight-hanging.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/weight-scale.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wheat-awn-circle-exclamation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wheat-awn.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wheelchair-move.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wheelchair.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/whiskey-glass.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wifi.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/window-maximize.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/window-minimize.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/window-restore.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wind.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wine-bottle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wine-glass-empty.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wine-glass.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/won-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/worm.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wrench.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/w.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/xmarks-lines.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/x-ray.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/x.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/yen-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/yin-yang.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/y.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/z.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts/fa-brands-400.ttf was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts/fa-brands-400.woff2 was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts/fa-regular-400.ttf was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts/fa-regular-400.woff2 was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts/fa-solid-900.ttf was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts/fa-solid-900.woff2 was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts/fa-v4compatibility.ttf was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts/fa-v4compatibility.woff2 was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/font-awesome.css was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/font-awesome.min.css was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/fonts was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/fonts/FontAwesome.otf was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/fonts/fontawesome-webfont.eot was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/fonts/fontawesome-webfont.svg was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/fonts/fontawesome-webfont.ttf was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/fonts/fontawesome-webfont.woff was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/fonts/fontawesome-webfont.woff2 was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/animated.less was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/bordered-pulled.less was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/core.less was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/fixed-width.less was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/font-awesome.less was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/icons.less was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/larger.less was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/list.less was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/mixins.less was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/path.less was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/rotated-flipped.less was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/screen-reader.less was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/stacked.less was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/variables.less was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/font-awesome.scss was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/_larger.scss was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/_path.scss was removed

--===============8577133817063291918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-xstatic-font-awesome/python3-xstatic-font-awesome: FILELIST: directory renamed /usr/lib/python3.11/site-packages/XStatic_Font_Awesome-4.7.0.0.dist-info -> /usr/lib/python3.11/site-packages/XStatic_Font_Awesome-6.2.1.1.dist-info, removed "/usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/larger.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/font-awesome.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/rotated-flipped.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/icons.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/fonts/fontawesome-webfont.eot /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/font-awesome.scss /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/fonts/fontawesome-webfont.ttf /usr/lib/python3.11/site-packages/XStatic_Font_Awesome-4.7.0.0-py3.11-nspkg.pth /usr/lib/python3.11/site-package
 s/xstatic/pkg/font_awesome/data/less/stacked.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/_larger.scss /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/variables.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/mixins.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/fonts/fontawesome-webfont.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/font-awesome.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/fonts/FontAwesome.otf /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/font-awesome.min.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/path.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/screen-reader.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/fixed-width.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/fonts/fontawesome-webfont.w
 off2 /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/animated.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/list.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/_path.scss /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/bordered-pulled.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/fonts/fontawesome-webfont.woff /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/core.less", added "/usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/slideshare.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-circle-exclamation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gratipay.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/head-side-cough.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/apple-whole.svg /usr
 /lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/glass-water.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plate-wheat.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-back-fist.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/solid.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/asterisk.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/apper.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ember.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mixer.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/viber.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/2.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/drupal.svg /usr/lib/python3.11/site-packages/xstatic/pkg
 /font_awesome/data/svgs/brands/paypal.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-spock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/font-awesome.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/laptop-code.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/laptop-file.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-dribbble.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-question.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-ramp-box.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice-d6.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/helicopter.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/font-awesome.svg /usr/lib/python3.11/site-packages
 /xstatic/pkg/font_awesome/data/svgs/solid/arrow-trend-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-question.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/envelopes-bulk.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-drowning.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-swimming.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/envelope.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/scissors.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/toilet-portable.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/itunes-note.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata/categories.yml /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/computer-mouse.svg /usr/lib/pyt
 hon3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-dot.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-circle-exclamation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plug-circle-exclamation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/road-circle-exclamation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/car-tunnel.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/dyalog.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/head-side-virus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cpanel.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/signature.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/_shims.scss /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bim
 object.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-sparkles.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wand-sparkles.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square-minus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-half-stroke.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/handcuffs.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bell-concierge.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-holding-heart.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/backward-fast.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/backward-step.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-arrow-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/fo
 nt_awesome/data/svgs/solid/landmark-dome.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-turn-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/check-to-slot.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-tsunami.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/landmark-flag.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/masks-theater.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-sun.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/feather-pointed.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tags.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tape.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tarp.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_
 awesome/data/svgs/solid/taxi.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tent.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tree.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-font-awesome.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/parachute-box.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/school-flag.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/school-lock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shekel-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/virus-covid.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_rotated-flipped.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calendar-minus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awe
 some/data/svgs/solid/chart-bar.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/futbol.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/fontawesome.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pencil.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/school.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/scroll.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/signal.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trowel.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/compress.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/comment-dots.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/microblog.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/m.svg /usr/li
 b/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-back-fist.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rectangle-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-snapchat.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-split-up-and-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bars-progress.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/subscript.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-fire.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-flag.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lemon.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lungs.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/phone-fl
 ip.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/photo-film.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/palette.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-fast.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-quarter.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gitlab.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/diaspora.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-from-ground-water.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-sad-tear.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/flag.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/baseball.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/
 football.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ellipsis-vertical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/box-tissue.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ear-listen.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vest-patches.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/land-mine-on.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shield-halved.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-holding-droplet.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/4.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-harassing.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-odnoklassniki.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_a
 wesome/data/svgs/solid/tent-arrows-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/kickstarter-k.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chair.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chess.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/child.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clone.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/coins.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/eject.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dolly.svg /usr/lib/
 python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/text-width.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-hearts.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/first-order-alt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/timeline.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/disease.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/turkish-lira-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/yin-yang.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sistrix.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/keycdn.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/maxcdn.svg /usr/lib/python3.
 11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/object-group.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-moon.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/venus-mars.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fish-fins.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-laptop.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/copyright.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/water-ladder.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/comments.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fire-extinguisher.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/3.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/angrycreative.svg /usr/lib/python3.1
 1/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sack-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/css3.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/1.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/digg.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ebay.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/edge.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ello.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/less.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/line.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/lyft.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brand
 s/meta.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-phone-flip.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-military-pointing.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-atlas.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chess-board.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands-bound.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/holly-berry.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-bills.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bottle-droplet.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/info.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/vimeo.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svg
 s/brands/weibo.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/yahoo.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wheat-awn-circle-exclamation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/trello.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/austral-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-astronaut.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fonticons-fi.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/servicestack.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-hearts.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chevron-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice-d20.svg /usr/lib/python3.11/site-packages/xstatic/pkg/
 font_awesome/data/svgs/regular/face-grin-squint.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-laugh-beam.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-smile-beam.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/worm.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/a.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/leanpub.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-exclamation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/people-robbery.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clipboard.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/list-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-check.svg /usr/lib/python3.11/site-packages/xst
 atic/pkg/font_awesome/data/svgs/solid/wheelchair.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/octopus-deploy.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/otter.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/poo-storm.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/align-center.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chart-column.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/phoenix-squadron.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bridge-circle-exclamation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pen-ruler.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bus-simple.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-image.svg /usr/lib/python3.11/
 site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dove.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/drum.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bold.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bolt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bomb.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bone.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bong.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bugs.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/scribd.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-chimney.s
 vg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/table-columns.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/battery-empty.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-zipper.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rocket.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tablet.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ticket.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/toilet.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/car-on.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bread-slice.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dragon.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/helmet-safety.svg /usr/lib/python3.
 11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mitten.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/phone-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pizza-slice.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ribbon.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/staff-snake.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tablet-button.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ticket-simple.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/apple-pay.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-walking-dashed-line-arrow-right.sv
 g /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/people-line.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rotate-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fire-flame-curved.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-plus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/volume-high.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cart-flatbed.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-flushed.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-military-rifle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-minus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pagelines.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svg
 s/solid/church.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/crutch.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sleigh.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wrench.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/sprites/regular.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hanukiah.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/car-side.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sailboat.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-gear.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-sun-rain.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/certificate.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bridge-circle-check.svg
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/fontawesome.min.js /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/teamspeak.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/business-time.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice-three.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/i.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/code-commit.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-kiss-wink-heart.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/biohazard.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-peace.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/css3-alt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-arrow-down.sv
 g /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/prescription-bottle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-caret-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/s.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/uniregistry.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata/sponsors.yml /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/6.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wordpress-simple.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/folder-closed.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/grunt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/joget.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/medrt.svg /usr/lib/
 python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/react.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/swift.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/uikit.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/yoast.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bicycle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/braille.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/recycle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shuffle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/teeth-open.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-squint.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-diners-club.svg /usr/lib/python3.11/site-packages
 /xstatic/pkg/font_awesome/data/js/solid.js /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-falling-burst.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/glasses.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/icicles.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/viruses.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/map-location.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/soundcloud.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/nimblr.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/tumblr.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/unity.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-pointer.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesom
 e/data/svgs/solid/boxes-packing.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands-praying.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sheet-plastic.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-github.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-gitlab.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lightbulb.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-arrow-up-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-kiss-beam.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/unlock-keyhole.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/jedi.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-walking-luggage.svg /usr/lib/python3.11/sit
 e-packages/xstatic/pkg/font_awesome/data/svgs/regular/comment.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/o.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-zero.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_screen-reader.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-high.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/rockrms.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wpforms.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fulcrum.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-lizard.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/stethoscope.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-medical-circle-exclamation.svg /usr/
 lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/copyright.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/text-height.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mercury.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/c.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/unsplash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/paragraph.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hourglass.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-up-across-line.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bridge.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cheese.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle.svg /usr/lib/python3.11/
 site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cookie.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/divide.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mobile.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mosque.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/qrcode.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rotate.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tent-arrow-down-to-line.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/memory.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-pause.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trophy.svg /usr/lib/python3.11/site-packages/xstatic/pkg/
 font_awesome/data/svgs/solid/window-restore.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tablets.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/fontawesome.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/5.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-left-right-to-line.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-moving.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/handshake-angle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/menorah.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-reddit.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fire-flame-simple.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hashtag.svg /usr/lib/python3.11/site-packages/xstati
 c/pkg/font_awesome/data/svgs/solid/helmet-un.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/brands.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-up-down-left-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/h.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane-arrival.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-large-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-full.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/typo3.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grimace.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/place-of-worship.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/forward-fast.svg /usr/lib/python3.11/site-packa
 ges/xstatic/pkg/font_awesome/data/svgs/solid/forward-step.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/id-card-clip.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/goodreads-g.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-xing.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/squarespace.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/laptop-medical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vr-cardboard.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hill-avalanche.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/stripe-s.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bullhorn.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/html5.svg /usr/lib/python3.11/site
 -packages/xstatic/pkg/font_awesome/data/webfonts/fa-solid-900.woff2 /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/window-maximize.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/window-minimize.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/kit-medical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wirsindhandwerk.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/camera-retro.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/diagram-next.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/unlock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-tears.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rainbow.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/svg-with-js.min.css /usr/lib/p
 ython3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mandalorian.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/digital-ocean.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/virus-covid-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trowel-bricks.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/car-burst.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_list.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/basketball.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-arrow-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/v4-shims.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/utensils.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chart-area.svg /usr/lib/py
 thon3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/earth-asia.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/address-card.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/headphones-simple.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-holding-dollar.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-powerpoint.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/star-and-crescent.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/android.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cart-arrow-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-arrow-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hotjar.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/so
 lid/square-poll-horizontal.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata/shims.yml /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/expeditedssl.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fingerprint.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-short-wide.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/closed-captioning.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/table-list.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/users-line.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_fixed-width.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-rotate-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/f
 ont_awesome/data/svgs/solid/bucket.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/carrot.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/faucet.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/indent.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/locust.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pinterest.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-visa.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/magnet.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pallet.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/repeat.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/podcast.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/anchor-circle-ex
 clamation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/think-peaks.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/exclamation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/handshake.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/facebook.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wheelchair-move.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/clone.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-dress-burst.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-bill-transfer.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-tired.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart-circle-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awes
 ome/data/svgs/solid/house-circle-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hourglass.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane-circle-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/right-to-bracket.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/dribbble.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-tongue-wink.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-columns.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-radiation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-lizard.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chart-line.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/align-left.svg /usr/lib/pytho
 n3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/angle-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-turn-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/caret-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-lock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane-lock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/quote-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/right-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mountain.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/down-long.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/left-long.svg /usr/lib/python3.11/
 site-packages/xstatic/pkg/font_awesome/data/svgs/brands/dashcube.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-scissors.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cloudflare.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cloudversify.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/school-circle-exclamation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/google.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/kaggle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/supple.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/code-pull-request.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/child-combatant.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/table-cells-large.
 svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-beam.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/diagram-project.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-tanakh.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-up-lock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-wink.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/_sizing.scss /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ethernet.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/paintbrush.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/money-bill-1.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/comment-dollar.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/soli
 d/ellipsis.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mars-stroke-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/amilia.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-down-to-line.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-turn-to-dots.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-flushed.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/critical-role.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/eye-low-vision.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-arrow-up-from-line.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/martini-glass-empty.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/bookmark.svg /usr/lib/python3.11/site-pa
 ckages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-from-bracket.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-lastfm.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/compass.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/location-pin-lock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/candy-cane.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tower-cell.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/headphones.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/paint-roller.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bars-staggered.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/microphone-lines-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/v4-shims.min.css 
 /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/earth-americas.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hospital.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/kickstarter.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/playstation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-tie.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cart-flatbed-suitcase.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/schlix.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cart-shopping.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/stripe.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/voicemail.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/briefcase
 .svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/compass-drafting.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart-circle-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-circle-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lines-leaning.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-snowboarding.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/border-all.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pepper-hot.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane-circle-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/child-dress.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-biking.svg /usr/lib/python3.11/site-packages/xstatic/pkg/
 font_awesome/data/svgs/solid/person-hiking.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-skiing.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-flood-water-circle-arrow-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mars-stroke-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/goodreads.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-js.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bookmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/landmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/0.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-right-from-bracket.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-stripe.svg /usr/lib/pyth
 on3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-circle-arrow-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/play.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plug.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/poop.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/firefox-browser.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/award.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bacon.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bahai.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/brain.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/broom.svg /usr/lib/python3.11/site-packages/xstatic/pkg/
 font_awesome/data/svgs/solid/brush.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/burst.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cubes.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/crown.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/couch.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ban-smoking.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/city.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/code.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/copy.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/crop.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fill.svg /usr/lib/python3.11/sit
 e-packages/xstatic/pkg/font_awesome/data/svgs/solid/film.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fire.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fish.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/flag.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/not-equal.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/atlassian.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-rolling-eyes.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square-full.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square-plus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/r-project.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/adn.svg /usr/lib/python3.11/site-packages/xstatic/pkg/fo
 nt_awesome/data/svgs/brands/aws.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/btc.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/dev.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/dhl.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fly.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/git.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mdb.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mix.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/npm.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/satellite.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/language.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/behance.svg /usr/lib/python3.11/site
 -packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-from-water-pump.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/infinity.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pager.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/paste.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pause.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/peace.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/phone.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/earth-africa.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pills.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/print.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesom
 e/data/svgs/brands/mizuni.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/nfc-directional.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hourglass-half.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_mixins.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/lemon.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-up-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mask-face.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_variables.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/brands.min.js /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-open-reader.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/sol
 id/n.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/up-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-arrow-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-caret-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pen-nib.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/solid.min.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-circle-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-circle-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/l.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/diagram-successor.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/compass.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/fon
 tawesome.min.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-arrow-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-caret-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-kiss.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-amazon-pay.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/school-circle-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-viadeo.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mobile-button.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mobile-screen.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/people-arrows.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-booth.svg /usr/lib/python3.11/site-packages/xst
 atic/pkg/font_awesome/data/svgs/solid/person-burst.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-dress.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-rifle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/walkie-talkie.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/right-from-bracket.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata/icon-families.json /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/nfc-symbol.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-circle-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plug-circle-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/road-circle-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/optin-monster.svg
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hryvnia-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/w.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-by.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-nc.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-nd.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-pd.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-sa.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-dollar-to-slot.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tractor.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-user.svg /usr/lib/python3.11/site-packages/xstatic/pkg
 /font_awesome/data/svgs/solid/person-arrow-down-to-line.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/blogger.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/q.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/crosshairs.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/notdef.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/stopwatch.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/conflict-detection.js /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pump-soap.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/airbnb.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/regular.scss /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/map-location-dot.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/d
 ata/svgs/brands/canadian-maple-leaf.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sitrox.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/linkedin.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/users-viewfinder.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fedex.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/500px.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/linux.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/backward.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/code-merge.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/id-badge.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/keyboard.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/soli
 d/sim-card.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/brands.scss /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/instalod.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/handshake-simple-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/replyd.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-point-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/terminal.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hubspot.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/microphone-lines.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pen-clip.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regul
 ar/circle-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-play.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/strava.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-stop.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-user.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bore-hole.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/reply-all.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sign-hanging.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/erlang.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/golang.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/stopwatch
 -20.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_core.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/safari.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/sprites/solid.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gem.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gun.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/jar.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/v4-shims.min.js /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/key.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/map.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/paw.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/soli
 d/pen.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/poo.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-chevron-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-chevron-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/monero.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/star-of-david.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/screwdriver-wrench.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tornado.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/fontawesome.js /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-google-plus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-tongue-squint.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesom
 e/data/svgs/solid/file-csv.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/comment.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/outdent.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/telegram.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/percent.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fort-awesome-alt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/head-side-cough-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/reply.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/robot.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mosquito-net.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/route.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/so
 lid/ruler.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wpressr.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/shirtsinbulk.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-behance.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/credit-card.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/share.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shirt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/skull.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-beam-sweat.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/socks.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chess-knight
 .svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/raspberry-pi.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/spoon.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-right-to-city.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/vaadin.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/weixin.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-powerpoint.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fantasy-flight-games.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-dizzy.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-laugh-wink.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/toilets-portable.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/dat
 a/svgs/brands/staylinked.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cart-plus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-plus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/snowflake.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/x-ray.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/closed-captioning.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/up-down-left-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bacteria.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dumpster-fire.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/
 data/svgs/solid/cannabis.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-tongue-squint.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-point-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/reddit.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bed-pulse.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/database.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/suitcase.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-wheat.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hill-rockslide.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tower-broadcast.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/kitchen-set.svg /usr/lib/python3.11/site-packages/xstatic/
 pkg/font_awesome/data/svgs/solid/mobile-retro.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rotate-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-virus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bell-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/link-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shop-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/text-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/children.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hooli.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-un.svg /usr/lib/python3.11/site-packages/xstatic/pkg/fo
 nt_awesome/data/svgs/brands/wpexplorer.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-nfi.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-rss.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cable-car.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/martini-glass-citrus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/object-ungroup.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/snowflake.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rectangle-list.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/microsoft.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/angle-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up.svg /usr/lib/python3.11/site-packages/xsta
 tic/pkg/font_awesome/data/svgs/solid/caret-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-circle-plus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-wide-short.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plug-circle-plus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/record-vinyl.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shield-heart.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shield-virus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bandcamp.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/palfed.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pushed.svg /usr/lib/python3.11/site-pack
 ages/xstatic/pkg/font_awesome/data/svgs/brands/weebly.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plant-wilt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/untappd.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/message.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tablet-screen-button.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/passport.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/code-compare.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hourglass-start.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/glide-g.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wave-square.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-to-circle.svg /usr/lib/python3.11/si
 te-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands-holding.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/rev.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/share-from-square.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/martini-glass.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/instagram.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/battery-full.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/battery-half.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/brands.min.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/connectdevelop.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/old-republic.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-steam.svg /usr/lib/pytho
 n3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-vimeo.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/the-red-yeti.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/newspaper.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/font.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/frog.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vest.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vial.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-rotate-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clock-rotate-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/crow.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cube.svg /usr/lib/python3.11/site-packages/xsta
 tic/pkg/font_awesome/data/svgs/solid/ankh.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/atom.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/baby.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bars.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bath.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bell.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/barcode.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/blog.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/explosion.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-git.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-through-window.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hous
 e-flood-water.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/highlighter.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/jet-fighter.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/image.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/u.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_sizing.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/jet-fighter-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-mastercard.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/product-hunt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-arrow-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bowl-rice.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/commen
 ts-dollar.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ubuntu.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ups.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/usb.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/vnv.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wix.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ns8.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/osi.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/php.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pied-piper-pp.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pix.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/houzz.svg /usr/lib/python3.11/site-packages/xstatic/pk
 g/font_awesome/data/svgs/brands/cc-apple-pay.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/people-pulling.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-parking.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/broom-ball.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-bolt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-1-9.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-bill.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/piggy-bank.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/radio.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-circle-question.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/meetup.svg /usr/lib/python3.11/site-packages/
 xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-1-9.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-9-1.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-a-z.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-z-a.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/google-wallet.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-surprise.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/d-and-d-beyond.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wizards-of-the-coast.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-medical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-medical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pump-medical.svg /usr
 /lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/less-than-equal.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calendar-days.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calendar-plus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calendar-week.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/genderless.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/alipay.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice-five.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/uncharted.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-point-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-wide.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/eleva
 tor.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wikipedia-w.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/vimeo-v.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/prescription-bottle-medical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gas-pump.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-zipper.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/note-sticky.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/stroopwafel.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-arrow-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts/fa-regular-400.woff2 /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-pointer.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_a
 wesome/data/svgs/solid/8.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shuttle-space.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-squint-tears.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-stars.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-tears.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pen-to-square.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/image-portrait.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/anchor-circle-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/eye-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/toolbox.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata/shims.json /usr/lib/python3.11/site-packages/x
 static/pkg/font_awesome/data/svgs/solid/italic.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-chimney-crack.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/motorcycle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hire-a-helper.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ruler-horizontal.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/at.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/om.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tv.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tree-city.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-tag.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice-one.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_aweso
 me/data/svgs/solid/mug-hot.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/svg-with-js.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hackerrank.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/centercode.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hat-wizard.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-left-long.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-stars.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/r.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/searchengin.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fonticons.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-medical-circle-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/fon
 t_awesome/data/svgs/regular/square-caret-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lungs-virus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/regular.min.js /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-paypal.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands-holding-circle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/spaghetti-monster-flying.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-sad-cry.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/resolving.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-smile.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tower-observation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/v.svg /usr/lib/python3.11/site-packa
 ges/xstatic/pkg/font_awesome/data/svgs/brands/google-play.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/google-plus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/page4.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/star-half.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-wide-short.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-arrow-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trash-arrow-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/comment-dots.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/envelope-open.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/filter-circle-dollar.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/linkedin-in.sv
 g /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/moon.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/lastfm.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/location-arrow.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/folder-open.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/indian-rupee-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-root-variable.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/train-tram.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/users.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pied-piper-alt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-bookmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/
 brazilian-real-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/deviantart.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-pied-piper.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/b.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/object-group.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/toilet-paper.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/weight-scale.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts/fa-solid-900.ttf /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/magnifying-glass-arrow-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/renren.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hat-cowboy-side.svg /usr/lib/python3.11/site-packages/xstatic/pkg/f
 ont_awesome/data/svgs/brands/google-pay.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/battle-net.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cuttlefish.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/dropbox.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/9.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mars-stroke.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/note-sticky.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/draw-polygon.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-pointer.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/camera-rotate.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/folder-closed.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font
 _awesome/data/svgs/solid/mortar-pestle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vector-square.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/industry.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chart-gantt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/layer-group.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hospital-user.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/guilded.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/bell.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/comment-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/themeisle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/x.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/d
 ata/svgs/brands/bluetooth.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/y-combinator.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_icons.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/diamond-turn-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/apple.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/glide.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/dailymotion.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/skype.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/conflict-detection.min.js /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/audio-description.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/magnifying-glass-plus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awe
 some/data/svgs/regular/face-grin-wink.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/rectangle-list.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/handshake-simple.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dumbbell.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/k.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/oil-well.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/contao.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/location-crosshairs.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sellcast.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calendar-day.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_animated.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awes
 ome/data/svgs/solid/square-up-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ideal.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/rebel.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chess-king.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/discord.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/thumbs-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/t.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/kiwi-bird.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/road-lock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shop-lock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-lock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/equa
 ls.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/images.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shapes.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/stairs.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/reacteurope.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/f.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/font-awesome.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fort-awesome.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/angles-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/angles-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-spin.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rss.svg /usr/lib/python3.
 11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rug.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/thumbs-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/codepen.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/freebsd.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/microphone-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-droplet.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/stack-exchange.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/satellite-dish.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calendar.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-up.svg /usr/lib/p
 ython3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bezier-curve.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/folder-minus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pied-piper.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chalkboard-user.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/v4-font-face.min.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/v5-font-face.min.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/leaf.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/link.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/beer-mug-empty.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-fist.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/list.svg /usr/lib/python3.11/site
 -packages/xstatic/pkg/font_awesome/data/svgs/solid/lock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/z.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/table-cells.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/tencent-weibo.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cow.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/baseball-bat-ball.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dna.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dog.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/egg.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/eye.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fan.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/f
 ax.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-beam-sweat.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/calendar-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-arrow-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/patreon.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/napster.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/twitter.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/yandex.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/droplet-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/jug-detergent.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/strikethrough.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/dat
 a/svgs/brands/ioxhost.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-contract.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/head-side-mask.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/weight-hanging.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/flask-vial.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/table.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/teeth.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calculator.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-laugh.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/dat
 a/svgs/brands/buy-n-large.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tents.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/swatchbook.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tooth.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/train.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-large.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tent-arrow-turn-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/whatsapp.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-invoice-dollar.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/baht-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/s
 olid/cedi-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cent-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/all.js /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dong-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/euro-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lari-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lira-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mill-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/monument.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/eye-dropper.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/e.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/fontawesome.scss /usr/lib/python3.11/site
 -packages/xstatic/pkg/font_awesome/data/svgs/brands/git-alt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/slack.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-long.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/chess-queen.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-graduate.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/group-arrows-rotate.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/solid.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/medapps.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-pd-alt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-right-from-square.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-left-righ
 t.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-turn-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/skyatlas.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/steam.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/v4-shims.js /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-export.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-nurse.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wheat-awn.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice-six.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/star-half-stroke.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mountain-sun.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-chalkboard.s
 vg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/archway.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/regular.js /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/display.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ruler-vertical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/people-carry-box.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hourglass-end.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shield.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/upload.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/litecoin-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hornbill.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wine-bottle.svg /usr/lib/pytho
 n3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mosquito.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/deploydog.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/foursquare.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-showers-water.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/medium.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-laugh-squint.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-facebook.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/scale-balanced.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bacterium.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/newspaper.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/accessible-
 icon.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/diamond.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/researchgate.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/envelope.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/shopware.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pied-piper-hat.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/evernote.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/perbyte.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bluetooth-b.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/superscript.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/pen-to-square.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/anch
 or.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/burger.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clover.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/eraser.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/filter.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/folder.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/align-justify.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/guitar.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hammer.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/campground.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/snowplow.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/camera.svg /usr/lib/python3.11/site-packag
 es/xstatic/pkg/font_awesome/data/svgs/solid/khanda.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/users-rectangle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vihara.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/angles-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/d-and-d.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/xmarks-lines.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/align-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/angle-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bug-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/caret-right.svg /usr/lib/python3.11/site-packages/xs
 tatic/pkg/font_awesome/data/svgs/solid/eye-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/quote-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/elementor.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/screenpal.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/jar-wheat.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/volleyball.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-medical-flag.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/amazon-pay.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mars-double.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sack-dollar.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-doctor.svg /usr/lib/python3.11/site-package
 s/xstatic/pkg/font_awesome/data/svgs/solid/face-kiss-wink-heart.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/adversal.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/viadeo.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/42-group.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/triangle-exclamation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-chevron-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-meatball.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/battery-three-quarters.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/eye.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/gem.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/simplybuilt.svg /usr/l
 ib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/map.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/sun.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/magnifying-glass-dollar.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart-circle-minus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-shelter.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/umbraco.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/registered.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane-departure.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/itch-io.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-showers-heavy.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fla
 g-usa.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/autoprefixer.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands-holding-child.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/laptop.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shrimp.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/scale-unbalanced-flip.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-down-to-people.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-right-to-bracket.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gauge-high.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gg.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/js.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data
 /svgs/brands/qq.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/vk.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/horse-head.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/water.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chart-simple.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gauge-simple.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-signal.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-person-confined.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/train-subway.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/sprites/brands.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fill-drip.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts/fa-r
 egular-400.ttf /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/p.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-right-dots.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-short-wide.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/road-spikes.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/jenkins.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mountain-city.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/boxes-stacked.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/youtube.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cubes-stacked.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/glass-water-droplet.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome
 /data/svgs/solid/bottle-water.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bridge-water.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-minus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-nodes.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-notch.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-pause.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart-crack.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-crack.svg /usr/lib/python3.11/site-packages/xstatic/pkg
 /font_awesome/data/svgs/solid/map-pin.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-pdf.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-point-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/droplet.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/headset.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/retweet.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/people-roof.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-full.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bandage.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/message.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/syringe.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less
 /_bordered-pulled.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/people-group.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-right-long.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-open.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/door-open.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lock-open.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/box-open.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-pen.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/toggle-off.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-pen.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/soli
 d/square-envelope.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/volume-off.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-chevron-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calendar-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calendar-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/greater-than-equal.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bowling-ball.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ranking-star.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rectangle-ad.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/stamp.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fire-burner.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font
 _awesome/data/svgs/solid/store.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-meh.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-group.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/thumbs-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/users-between-lines.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/seedling.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/v4-font-face.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/v5-font-face.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/drumstick-bite.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/calendar.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/dat
 a/svgs/solid/traffic-light.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-laugh-squint.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gopuram.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/copy.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cotton-bureau.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/galactic-republic.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/capsules.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-code.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cloudscale.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cloudsmith.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/crop-simple.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awe
 some/data/svgs/brands/rocketchat.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tag.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tty.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/basket-shopping.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/amazon.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/python.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/left-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/magnifying-glass-minus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/markdown.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hourglass-half.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gitkraken.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/d
 ata/svgs/solid/heart-circle-plus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-military-to-person.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-font-awesome-stroke.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ring.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/road.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/code-fork.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/microscope.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/underline.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/vuejs.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/whmcs.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/car-rear.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_a
 wesome/data/svgs/solid/up-right-and-down-left-from-center.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/van-shuttle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sort-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/turn-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-signature.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/node-js.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-bill-1-wave.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata/icon-families.yml /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-half-dress.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/code-branch.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/road-bridge.svg /usr/lib/python3.11/s
 ite-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-shield.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-frown-open.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-invoice.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bitcoin-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-ngo.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/up-right-from-square.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-injured.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-chimney-medical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/calendar-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/clock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/v
 ault.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/venus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/odnoklassniki.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vials.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/golf-ball-tee.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/internet-explorer.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clipboard-user.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/video.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/virus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/facebook-f.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ice-cream.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-point-dow
 n.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-rotate.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-to-dot.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-to-eye.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/futbol.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-point-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/d.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/dochub.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/github.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts/fa-v4compatibility.woff2 /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/star-of-life.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bitbuc
 ket.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/border-top-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/skull-crossbones.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/speakap.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-walking-arrow-loop-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hospital.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clipboard-question.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chess-queen.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wpbeginner.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-share.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bangladeshi-taka-sign.svg /usr/lib/python3.11/site-pac
 kages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-empty.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/scroll-torah.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-tongue.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-chimney-user.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/magnifying-glass.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/screwdriver.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_stacked.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-ninja.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-squint-tears.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/j.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-low.svg /u
 sr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-surprise.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/vine.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/waze.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wodu.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/xbox.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/xing.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/yarn.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/yelp.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/modx.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/neos.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/node.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awe
 some/data/svgs/solid/tent-arrow-left-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chevron-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-half.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/guarani-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/stackpath.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wolf-pack-battalion.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/magnifying-glass-location.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/regular.min.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/aviato.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-circle-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-point-up.svg /usr/lib/pytho
 n3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/y.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-sad-tear.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cmplid.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/megaport.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/openid.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-pickup.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/floppy-disk.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hockey-puck.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/yandex-international.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-smile-beam.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mobile-screen-button.svg /u
 sr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/draft2digital.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/app-store-ios.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sun-plant-wilt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wand-magic.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-long.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heading.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/smoking.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/up-long.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/right-long.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ravelry.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mattress-pillow.sv
 g /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts/fa-v4compatibility.ttf /usr/lib/python3.11/site-packages/XStatic_Font_Awesome-6.2.1.1-py3.11-nspkg.pth /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-sad-cry.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/share-nodes.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/comment-medical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-waveform.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts/fa-brands-400.ttf /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/steam-symbol.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gear.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/linode.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/all.css /usr/lib/python3.
 11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-pinterest.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gift.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/grip.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wifi.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/codiepie.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wind.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cookie-bite.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/delete-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bridge-lock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-info.svg /usr/lib/python3.11/site-packages/xst
 atic/pkg/font_awesome/data/svgs/solid/circle-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-play.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-plus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-nc-eu.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-stop.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-frown.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chalkboard.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-import.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/studiovinari.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-prescription.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart-circle-bolt.svg /usr/lib/
 python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-bill-wheat.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/umbrella.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-meh-blank.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/nutritionix.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/paste.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/artstation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/chess-king.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/chess-pawn.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/chess-rook.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grimace.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice-two.svg 
 /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dungeon.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/section.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/helicopter-symbol.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tarp-droplet.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-clock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/list-ul.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-circle-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/champagne-glasses.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/blender.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/feather.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/spinner.svg 
 /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/stapler.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trailer.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wordpress.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/icons.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/igloo.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/image.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/inbox.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/receipt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/thumbtack.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-meh.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-pdf.svg /usr/lib/python3.11/site-packages/xst
 atic/pkg/font_awesome/data/svgs/brands/square-tumblr.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/kip-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/won-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/calendar-plus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/yen-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/flipboard.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/LICENSE.txt /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/envelope-open-text.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-tongue-wink.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/watchman-monitoring.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-h.svg /usr/lib/python3.11/site-pac
 kages/xstatic/pkg/font_awesome/data/svgs/solid/square-h.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/earth-oceania.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cash-register.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/images.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/korvue.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-jcb.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/i-cursor.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/all.min.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/forward.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/id-card.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sd-card.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/d
 ata/css/regular.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/algolia.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-share-nodes.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sitemap.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/reddit-alien.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/computer.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dumpster.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/earlybirds.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bilibili.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/chart-bar.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-discover.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/bra
 nds/app-store.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bootstrap.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-sampling.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tenge-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata/icons.json /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/microchip.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/location-dot.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-laugh.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/heart.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/location-pin.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/galactic-senate.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/da
 ta/svgs/brands/mailchimp.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/blogger-b.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/avianex.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mars-and-venus-burst.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/colon-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/franc-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/manat-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/naira-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/lightbulb.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ruble-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rupee-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/
 data/svgs/solid/chess-bishop.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/stumbleupon-circle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-bill-1.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/diagram-predecessor.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-nc-jp.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-breastfeeding.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-check-dollar.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/paperclip.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/first-order.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-secret.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/suitcase-medical.svg /usr/
 lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/free-code-camp.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-poll-vertical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/id-badge.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tachograph-digital.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ban.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bed.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/box.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/address-book.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/address-card.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bug.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bus.svg /usr/lib/python3.11/
 site-packages/xstatic/pkg/font_awesome/data/svgs/solid/car.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cat.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ussunnah.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bag-shopping.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-holding.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/volcano.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/star-half-stroke.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-arrow-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-caret-up.svg /usr/lib/python3.11/site-packag
 es/xstatic/pkg/font_awesome/data/svgs/solid/panorama.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square-caret-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/spell-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/paper-plane.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/handshake.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chart-pie.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shoe-prints.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-bible.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands-clapping.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/google-plus-g.svg /usr/lib/python3
 .11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mastodon.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-skiing-nordic.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hat-cowboy.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/envelope-open.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/periscope.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/quinscape.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/school-circle-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/itunes.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/joomla.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/less-than.svg /usr/lib/py
 thon3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/chess-bishop.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hamsa.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-lines.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/grip-lines.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hippo.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/horse.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hotel.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/republican.svg /usr/lib/python3.11/site-packages/xstatic/pkg/fon
 t_awesome/data/svgs/solid/face-meh-blank.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/calendar-minus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/7.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/tiktok.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/life-ring.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/car-battery.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trash-can-arrow-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-amex.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clipboard-list.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/keybase.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/shopify.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_a
 wesome/data/svgs/brands/spotify.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-journal-whills.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/desktop.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/briefcase-medical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-medical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/notes-medical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-medical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/network-wired.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-monster.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/solid.min.js /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/invision.svg /usr/lib/python3.11/site-packages/xstatic/pk
 g/font_awesome/data/svgs/solid/umbrella-beach.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/phabricator.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/list-ol.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/etsy.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/grav.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gulp.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hips.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hive.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/imdb.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/java.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/jira.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bity.svg /us
 r/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bots.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-wide.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/all.min.js /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/road-barrier.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/firstdraft.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/toggle-on.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/id-card.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/centos.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/trash-can.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/magento.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/audible.svg /usr/lib/python3.11/site-p
 ackages/xstatic/pkg/font_awesome/data/svgs/solid/hot-tub-person.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/check-double.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/venus-double.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-tongue.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-quran.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/democrat.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hard-drive.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/peseta-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands-asl-interpreting.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/building.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/asymmetrik.svg /usr/
 lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/chromecast.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-spock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hard-drive.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-peace.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-medical-circle-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mask-ventilator.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands-bubbles.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/snapchat.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/buffer.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/deezer.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/do
 cker.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gitter.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/yammer.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/question.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/stack-overflow.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/_functions.scss /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/charging-station.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mars.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mask.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/chrome.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/readme.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/moon.svg /usr/lib/python3.11/site
 -packages/xstatic/pkg/font_awesome/data/svgs/solid/thermometer.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/angular.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/spray-can.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trash-can.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-holding-medical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/get-pocket.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sketch.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/twitch.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/power-off.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/themeco.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square-caret-down.svg /usr/lib/python3.11/sit
 e-packages/xstatic/pkg/font_awesome/data/svgs/regular/square-caret-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-circle-question.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/share-from-square.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bridge-circle-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/blackberry.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/blender-phone.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-smile.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-tired.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-audio.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svg
 s/regular/file-excel.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-image.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-lines.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-video.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-angry.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-dizzy.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-frown.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/intercom.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/firefox.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/handshake-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/salesforce.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesom
 e/data/svgs/brands/delicious.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/registered.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chess-pawn.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/kaaba.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/signs-post.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hurricane.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/star.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/user.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/window-maximize.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/window-minimize.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/laravel.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/
 svgs/solid/caravan.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/oil-can.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/snowman.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cruzeiro-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-frown-open.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-scissors.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/padlet.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/star-half.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/opencart.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/magnifying-glass-chart.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/restroom.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/d
 ata/svgs/brands/hashnode.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/v4-shims.css /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-shield.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-shield.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dollar-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/anchor-lock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/border-none.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/folder-open.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/folder-plus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/folder-tree.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-twitter.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/
 svgs/solid/grip-lines-vertical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/rectangle-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-video.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hotdog.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gg-circle.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vial-virus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-holding-hand.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/spray-can-sparkles.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/credit-card.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/faucet-drip.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/street-view.svg /usr/lib/python3.11/site-packages/xstatic
 /pkg/font_awesome/data/svgs/brands/jedi-order.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-user.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-chimney-window.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/puzzle-piece.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-phone.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/volume-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gauge-simple-high.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-walking-arrow-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dharmachakra.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-moon-rain.sv
 g /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-kiss.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-code.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-word.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/life-ring.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bullseye.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/graduation-cap.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-bill-trend-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-pen.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/volume-low.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/g.sv
 g /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/comment-sms.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-remix.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice-four.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-circle-minus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/v4-shims.scss /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wand-magic-sparkles.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/torii-gate.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/users-gear.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/phone-volume.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/bran
 ds/figma.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/opera.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/quora.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/splotch.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/envira.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fedora.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/windows.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata/icons.yml /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/drum-steelpan.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-sampling-plus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/buysellads.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-dot
 .svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart-circle-exclamation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/regular.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/expand.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-angry.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-circle-exclamation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane-circle-exclamation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-laugh-wink.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-smile-wink.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart-pulse.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/paper-plane.svg /usr/lib/python3.11/site-packages/xstatic/pkg/
 font_awesome/data/svgs/solid/pen-fancy.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/solar-panel.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-plane.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/battery-quarter.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/prescription.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/object-ungroup.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-beam.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-kiss-beam.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/comments.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/peso-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/red-river.svg /usr/lib/python3.11/site-packa
 ges/xstatic/pkg/font_awesome/data/svgs/brands/edge-legacy.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/angles-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-point-right.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/thumbs-up.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/symfony.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/scale-unbalanced.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/toilet-paper-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/angellist.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clipboard-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-skull.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/jsfiddle.svg /usr/lib/pyth
 on3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rupiah-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-9-1.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/flickr.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mixcloud.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/florin-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-cane.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-rays.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-field-un.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/anchor-circle-xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-a-z.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/filter-circle-
 xmark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/door-closed.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/microphone.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-walking-with-cane.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gamepad.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/black-tie.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/deskpro.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hacker-news.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pinterest-p.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cross.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ferry.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/flask.sv
 g /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gauge.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gavel.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gears.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ghost.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gifts.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/globe.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts/fa-brands-400.woff2 /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sellsy.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/rust.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sass.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sith.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font
 _awesome/data/svgs/brands/suse.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/uber.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/usps.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ruler-combined.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chess-rook.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-rain.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/download.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/joint.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/radiation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/users-rays.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/google-drive.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/soli
 d/earth-europe.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/store-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/users-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/video-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-z-a.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/empire.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gofore.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/flag-checkered.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/virus-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/marker.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/meteor.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/neute
 r.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/server.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shower.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/spider.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/buromobelexperte.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wine-glass-empty.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-rolling-eyes.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ethereum.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chevron-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chevron-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-dots.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pers
 on-digging.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-falling.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-praying.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-running.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/box-archive.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-skating.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-walking.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-hacker-news.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/orcid.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sourcetree.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/space-awesome.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_
 awesome/data/svgs/solid/grip-vertical.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/floppy-disk.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/maximize.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/minimize.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-excel.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-audio.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-circle-minus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mug-saucer.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plug-circle-minus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/window-restore.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/chess-knight.svg /usr/lib/python3.11/site-package
 s/xstatic/pkg/font_awesome/data/svgs/solid/face-laugh-beam.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-dots-from-line.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mars-and-venus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/child-reaching.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/suitcase-rolling.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/zhihu.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/whiskey-glass.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-trend-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trademark.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wine-glass.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/address-book.svg /
 usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/discourse.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-instagram.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_shims.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bolt-lightning.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-circle-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plug-circle-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/road-circle-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/transgender.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vial-circle-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/binoculars.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svg
 s/brands/trade-federation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/redhat.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/solid.scss /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/affiliatetheme.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gripfire.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bowl-food.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/bell-slash.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cake-candles.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mendeley.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/brands.less /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-whatsapp.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/en
 velope-circle-check.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plus-minus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-minus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/spa.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/calendar-days.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sun.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-circle-plus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/keyboard.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bitcoin.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/viacoin.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/speaker-deck.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands
 /sticker-mule.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-right-arrow-left.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clapperboard.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/greater-than.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-field.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-front.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/universal-access.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-three-quarters.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/superpowers.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/clipboard.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ship.svg /usr/lib/python3.11/site-packages/xstatic/
 pkg/font_awesome/data/svgs/solid/shop.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sink.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/smog.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/soap.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sort.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sliders.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/star.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/stop.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-bill-wave.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/facebook-messenger.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/stumbleupon.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fil
 e-word.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/phoenix-framework.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sort-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/turn-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/synagogue.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/forumbee.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/github-alt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/baby-carriage.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ear-deaf.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wallet.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/down-left-and-up-right-to-center.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/dat
 a/svgs/regular/folder.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/brands.js /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/table-tennis-paddle-ball.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plug-circle-bolt.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-pregnant.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/accusoft.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-smile-wink.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/angle-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/caret-down.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-middle-finger.svg /usr/lib/python3.11/site-packages/xstatic/pkg/f
 ont_awesome/data/svgs/solid/medal.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/minus.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mound.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/music.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/warehouse.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-flag.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-lock.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-user.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sterling-sign.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shield-cat.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shield-dog.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data
 /svgs/solid/person-circle-exclamation.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-youtube.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/compact-disc.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-up-to-line.svg /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/confluence.svg"
packages/core2-64-poky-linux/python3-xstatic-font-awesome/python3-xstatic-font-awesome: PKGSIZE changed from 1322522 to 22015052 (+1565%)
Changes to packages/core2-64-poky-linux/python3-xstatic-font-awesome (sysroot):
  /usr/lib/python3.11/site-packages/XStatic_Font_Awesome-4.7.0.0.dist-info moved to /usr/lib/python3.11/site-packages/XStatic_Font_Awesome-6.2.1.1.dist-info
  /usr/lib/python3.11/site-packages/XStatic_Font_Awesome-4.7.0.0-py3.11-nspkg.pth moved to /usr/lib/python3.11/site-packages/XStatic_Font_Awesome-6.2.1.1-py3.11-nspkg.pth
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/all.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/all.min.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/brands.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/brands.min.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/fontawesome.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/fontawesome.min.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/regular.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/regular.min.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/solid.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/solid.min.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/svg-with-js.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/svg-with-js.min.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/v4-font-face.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/v4-font-face.min.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/v4-shims.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/v4-shims.min.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/v5-font-face.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/v5-font-face.min.css was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/all.js was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/all.min.js was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/brands.js was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/brands.min.js was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/conflict-detection.js was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/conflict-detection.min.js was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/fontawesome.js was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/fontawesome.min.js was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/regular.js was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/regular.min.js was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/solid.js was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/solid.min.js was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/v4-shims.js was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/js/v4-shims.min.js was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_animated.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_bordered-pulled.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/brands.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_core.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_fixed-width.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/fontawesome.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_icons.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_list.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_mixins.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/regular.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_rotated-flipped.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_screen-reader.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_shims.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_sizing.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/solid.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_stacked.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/v4-shims.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/_variables.less was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/LICENSE.txt was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata/categories.yml was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata/icon-families.json was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata/icon-families.yml was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata/icons.json was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata/icons.yml was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata/shims.json was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata/shims.yml was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/metadata/sponsors.yml was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/brands.scss was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/fontawesome.scss was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/_functions.scss was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/regular.scss was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/_shims.scss was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/_sizing.scss was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/solid.scss was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/v4-shims.scss was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/sprites was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/sprites/brands.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/sprites/regular.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/sprites/solid.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/42-group.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/500px.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/accessible-icon.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/accusoft.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/adn.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/adversal.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/affiliatetheme.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/airbnb.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/algolia.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/alipay.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/amazon-pay.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/amazon.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/amilia.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/android.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/angellist.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/angrycreative.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/angular.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/apper.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/apple-pay.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/apple.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/app-store-ios.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/app-store.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/artstation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/asymmetrik.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/atlassian.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/audible.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/autoprefixer.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/avianex.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/aviato.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/aws.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bandcamp.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/battle-net.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/behance.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bilibili.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bimobject.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bitbucket.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bitcoin.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bity.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/blackberry.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/black-tie.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/blogger-b.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/blogger.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bluetooth-b.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bluetooth.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bootstrap.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/bots.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/btc.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/buffer.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/buromobelexperte.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/buy-n-large.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/buysellads.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/canadian-maple-leaf.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-amazon-pay.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-amex.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-apple-pay.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-diners-club.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-discover.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-jcb.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-mastercard.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-paypal.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-stripe.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cc-visa.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/centercode.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/centos.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/chromecast.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/chrome.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cloudflare.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cloudscale.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cloudsmith.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cloudversify.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cmplid.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/codepen.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/codiepie.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/confluence.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/connectdevelop.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/contao.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cotton-bureau.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cpanel.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-by.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-nc-eu.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-nc-jp.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-nc.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-nd.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-pd-alt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-pd.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-remix.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-sampling-plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-sampling.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-sa.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-share.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/creative-commons-zero.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/critical-role.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/css3-alt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/css3.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/cuttlefish.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/dailymotion.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/d-and-d-beyond.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/d-and-d.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/dashcube.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/deezer.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/delicious.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/deploydog.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/deskpro.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/deviantart.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/dev.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/dhl.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/diaspora.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/digg.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/digital-ocean.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/discord.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/discourse.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/dochub.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/docker.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/draft2digital.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/dribbble.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/dropbox.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/drupal.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/dyalog.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/earlybirds.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ebay.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/edge-legacy.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/edge.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/elementor.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ello.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ember.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/empire.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/envira.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/erlang.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ethereum.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/etsy.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/evernote.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/expeditedssl.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/facebook-f.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/facebook-messenger.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/facebook.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fantasy-flight-games.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fedex.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fedora.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/figma.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/firefox-browser.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/firefox.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/firstdraft.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/first-order-alt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/first-order.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/flickr.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/flipboard.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fly.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/font-awesome.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fonticons-fi.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fonticons.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fort-awesome-alt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fort-awesome.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/forumbee.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/foursquare.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/freebsd.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/free-code-camp.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/fulcrum.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/galactic-republic.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/galactic-senate.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/get-pocket.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gg-circle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gg.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/git-alt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/github-alt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/github.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gitkraken.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gitlab.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/git.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gitter.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/glide-g.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/glide.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gofore.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/golang.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/goodreads-g.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/goodreads.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/google-drive.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/google-pay.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/google-play.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/google-plus-g.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/google-plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/google.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/google-wallet.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gratipay.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/grav.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gripfire.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/grunt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/guilded.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/gulp.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hacker-news.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hackerrank.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hashnode.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hips.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hire-a-helper.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hive.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hooli.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hornbill.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hotjar.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/houzz.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/html5.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/hubspot.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ideal.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/imdb.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/instagram.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/instalod.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/intercom.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/internet-explorer.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/invision.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ioxhost.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/itch-io.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/itunes-note.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/itunes.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/java.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/jedi-order.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/jenkins.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/jira.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/joget.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/joomla.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/jsfiddle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/js.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/kaggle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/keybase.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/keycdn.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/kickstarter-k.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/kickstarter.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/korvue.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/laravel.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/lastfm.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/leanpub.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/less.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/line.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/linkedin-in.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/linkedin.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/linode.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/linux.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/lyft.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/magento.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mailchimp.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mandalorian.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/markdown.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mastodon.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/maxcdn.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mdb.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/medapps.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/medium.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/medrt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/meetup.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/megaport.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mendeley.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/meta.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/microblog.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/microsoft.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mixcloud.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mixer.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mix.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/mizuni.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/modx.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/monero.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/napster.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/neos.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/nfc-directional.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/nfc-symbol.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/nimblr.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/node-js.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/node.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/npm.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ns8.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/nutritionix.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/octopus-deploy.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/odnoklassniki.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/old-republic.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/opencart.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/openid.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/opera.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/optin-monster.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/orcid.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/osi.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/padlet.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/page4.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pagelines.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/palfed.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/patreon.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/paypal.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/perbyte.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/periscope.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/phabricator.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/phoenix-framework.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/phoenix-squadron.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/php.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pied-piper-alt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pied-piper-hat.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pied-piper-pp.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pied-piper.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pinterest-p.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pinterest.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pix.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/playstation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/product-hunt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/pushed.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/python.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/qq.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/quinscape.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/quora.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/raspberry-pi.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ravelry.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/reacteurope.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/react.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/readme.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/rebel.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/reddit-alien.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/reddit.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/redhat.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/red-river.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/renren.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/replyd.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/researchgate.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/resolving.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/rev.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/rocketchat.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/rockrms.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/r-project.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/rust.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/safari.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/salesforce.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sass.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/schlix.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/screenpal.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/scribd.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/searchengin.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sellcast.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sellsy.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/servicestack.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/shirtsinbulk.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/shopify.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/shopware.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/simplybuilt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sistrix.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sith.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sitrox.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sketch.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/skyatlas.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/skype.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/slack.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/slideshare.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/snapchat.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/soundcloud.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sourcetree.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/space-awesome.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/speakap.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/speaker-deck.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/spotify.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-behance.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-dribbble.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-facebook.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-font-awesome-stroke.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-font-awesome.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-github.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-gitlab.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-git.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-google-plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-hacker-news.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-instagram.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-js.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-lastfm.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-odnoklassniki.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-pied-piper.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-pinterest.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-reddit.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-snapchat.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/squarespace.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-steam.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-tumblr.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-twitter.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-viadeo.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-vimeo.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-whatsapp.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-xing.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/square-youtube.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/stack-exchange.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/stack-overflow.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/stackpath.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/staylinked.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/steam.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/steam-symbol.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/sticker-mule.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/strava.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/stripe-s.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/stripe.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/studiovinari.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/stumbleupon-circle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/stumbleupon.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/superpowers.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/supple.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/suse.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/swift.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/symfony.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/teamspeak.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/telegram.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/tencent-weibo.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/themeco.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/themeisle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/the-red-yeti.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/think-peaks.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/tiktok.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/trade-federation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/trello.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/tumblr.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/twitch.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/twitter.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/typo3.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/uber.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ubuntu.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/uikit.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/umbraco.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/uncharted.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/uniregistry.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/unity.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/unsplash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/untappd.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ups.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/usb.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/usps.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/ussunnah.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/vaadin.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/viacoin.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/viadeo.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/viber.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/vimeo.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/vimeo-v.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/vine.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/vk.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/vnv.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/vuejs.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/watchman-monitoring.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/waze.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/weebly.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/weibo.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/weixin.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/whatsapp.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/whmcs.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wikipedia-w.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/windows.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wirsindhandwerk.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wix.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wizards-of-the-coast.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wodu.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wolf-pack-battalion.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wordpress-simple.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wordpress.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wpbeginner.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wpexplorer.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wpforms.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/wpressr.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/xbox.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/xing.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/yahoo.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/yammer.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/yandex-international.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/yandex.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/yarn.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/y-combinator.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/yelp.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/yoast.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/youtube.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/brands/zhihu.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/address-book.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/address-card.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/bell-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/bell.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/bookmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/building.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/calendar-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/calendar-days.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/calendar-minus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/calendar-plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/calendar.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/calendar-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/chart-bar.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/chess-bishop.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/chess-king.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/chess-knight.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/chess-pawn.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/chess-queen.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/chess-rook.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-dot.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-pause.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-play.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-question.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-stop.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-user.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/circle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/clipboard.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/clock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/clone.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/closed-captioning.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/comment-dots.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/comments.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/comment.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/compass.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/copyright.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/copy.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/credit-card.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/envelope-open.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/envelope.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/eye-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/eye.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-angry.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-dizzy.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-flushed.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-frown-open.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-frown.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grimace.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-beam.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-beam-sweat.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-hearts.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-squint.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-squint-tears.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-stars.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-tears.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-tongue-squint.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-tongue.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-tongue-wink.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-wide.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-grin-wink.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-kiss-beam.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-kiss.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-kiss-wink-heart.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-laugh-beam.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-laugh-squint.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-laugh.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-laugh-wink.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-meh-blank.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-meh.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-rolling-eyes.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-sad-cry.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-sad-tear.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-smile-beam.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-smile.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-smile-wink.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-surprise.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/face-tired.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-audio.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-code.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-excel.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-image.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-lines.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-pdf.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-powerpoint.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-video.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-word.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/file-zipper.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/flag.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/floppy-disk.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/folder-closed.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/folder-open.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/folder.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/font-awesome.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/futbol.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/gem.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-back-fist.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-lizard.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-peace.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-point-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-pointer.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-point-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-point-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-point-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-scissors.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/handshake.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand-spock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hand.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hard-drive.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/heart.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hospital.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hourglass-half.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/hourglass.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/id-badge.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/id-card.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/images.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/image.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/keyboard.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/lemon.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/life-ring.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/lightbulb.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/map.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/message.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/money-bill-1.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/moon.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/newspaper.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/note-sticky.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/object-group.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/object-ungroup.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/paper-plane.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/paste.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/pen-to-square.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/rectangle-list.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/rectangle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/registered.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/share-from-square.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/snowflake.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square-caret-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square-caret-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square-caret-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square-caret-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square-full.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square-minus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square-plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/square.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/star-half-stroke.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/star-half.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/star.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/sun.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/thumbs-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/thumbs-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/trash-can.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/user.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/window-maximize.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/window-minimize.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/regular/window-restore.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/0.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/1.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/2.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/3.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/4.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/5.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/6.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/7.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/8.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/9.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/address-book.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/address-card.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/align-center.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/align-justify.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/align-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/align-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/anchor-circle-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/anchor-circle-exclamation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/anchor-circle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/anchor-lock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/anchor.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/angle-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/angle-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/angle-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/angles-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/angles-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/angles-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/angles-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/angle-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ankh.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/apple-whole.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/archway.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-1-9.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-9-1.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-a-z.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-long.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-short-wide.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-up-across-line.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-up-lock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-wide-short.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-down-z-a.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-left-long.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-pointer.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-right-arrow-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-right-from-bracket.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-right-long.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-right-to-bracket.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-right-to-city.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-rotate-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-rotate-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-down-to-line.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-down-to-people.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-left-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-left-right-to-line.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-rotate.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-spin.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-split-up-and-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-to-circle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-to-dot.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-to-eye.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-turn-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-turn-to-dots.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-up-down-left-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-up-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrows-up-to-line.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-trend-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-trend-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-turn-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-turn-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-1-9.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-9-1.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-a-z.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-from-bracket.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-from-ground-water.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-from-water-pump.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-long.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-right-dots.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-right-from-square.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-short-wide.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-wide-short.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/arrow-up-z-a.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/asterisk.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/a.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/atom.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/at.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/audio-description.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/austral-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/award.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/baby-carriage.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/baby.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/backward-fast.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/backward-step.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/backward.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bacon.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bacteria.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bacterium.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bag-shopping.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bahai.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/baht-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bandage.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bangladeshi-taka-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ban-smoking.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ban.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/barcode.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bars-progress.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bars-staggered.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bars.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/baseball-bat-ball.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/baseball.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/basketball.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/basket-shopping.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bath.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/battery-empty.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/battery-full.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/battery-half.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/battery-quarter.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/battery-three-quarters.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bed-pulse.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bed.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/beer-mug-empty.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bell-concierge.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bell-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bell.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bezier-curve.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bicycle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/binoculars.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/biohazard.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bitcoin-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/blender-phone.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/blender.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/blog.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bold.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bolt-lightning.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bolt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bomb.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bone.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bong.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-atlas.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-bible.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-bookmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-journal-whills.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bookmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-medical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-open-reader.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-open.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-quran.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-skull.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/book-tanakh.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/border-all.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/border-none.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/border-top-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bore-hole.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bottle-droplet.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bottle-water.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bowl-food.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bowling-ball.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bowl-rice.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/box-archive.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/boxes-packing.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/boxes-stacked.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/box-open.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/box.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/box-tissue.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/braille.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/brain.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/brazilian-real-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bread-slice.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bridge-circle-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bridge-circle-exclamation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bridge-circle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bridge-lock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bridge.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bridge-water.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/briefcase-medical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/briefcase.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/broom-ball.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/broom.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/brush.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/b.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bucket.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bug-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bugs.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bug.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-circle-arrow-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-circle-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-circle-exclamation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-circle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-columns.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-flag.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-lock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-ngo.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-shield.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-un.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-user.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/building-wheat.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bullhorn.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bullseye.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/burger.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/burst.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/business-time.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bus-simple.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/bus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cable-car.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cake-candles.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calculator.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calendar-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calendar-days.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calendar-day.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calendar-minus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calendar-plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calendar.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calendar-week.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/calendar-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/camera-retro.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/camera-rotate.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/camera.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/campground.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/candy-cane.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cannabis.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/capsules.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/caravan.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/car-battery.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/car-burst.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/caret-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/caret-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/caret-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/caret-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/car-on.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/car-rear.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/carrot.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/car-side.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/car.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cart-arrow-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cart-flatbed-suitcase.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cart-flatbed.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cart-plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cart-shopping.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/car-tunnel.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cash-register.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cat.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cedi-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cent-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/certificate.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chair.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chalkboard.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chalkboard-user.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/champagne-glasses.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/charging-station.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chart-area.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chart-bar.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chart-column.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chart-gantt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chart-line.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chart-pie.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chart-simple.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/check-double.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/check-to-slot.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cheese.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chess-bishop.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chess-board.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chess-king.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chess-knight.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chess-pawn.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chess-queen.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chess-rook.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chess.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chevron-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chevron-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chevron-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/chevron-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/child-combatant.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/child-dress.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/child-reaching.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/children.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/child.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/church.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-arrow-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-arrow-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-arrow-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-arrow-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-chevron-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-chevron-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-chevron-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-chevron-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-dollar-to-slot.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-dot.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-exclamation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-half-stroke.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-h.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-info.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-minus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-nodes.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-notch.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-pause.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-play.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-question.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-radiation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-stop.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-user.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/circle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/city.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clapperboard.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clipboard-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clipboard-list.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clipboard-question.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clipboard.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clipboard-user.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clock-rotate-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clone.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/closed-captioning.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-arrow-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-arrow-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-bolt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-meatball.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-moon-rain.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-moon.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-rain.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-showers-heavy.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-showers-water.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-sun-rain.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud-sun.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cloud.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/clover.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/code-branch.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/code-commit.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/code-compare.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/code-fork.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/code-merge.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/code-pull-request.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/code.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/coins.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/colon-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/comment-dollar.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/comment-dots.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/comment-medical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/comments-dollar.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/comment-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/comment-sms.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/comments.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/comment.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/compact-disc.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/compass-drafting.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/compass.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/compress.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/computer-mouse.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/computer.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cookie-bite.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cookie.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/copyright.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/copy.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/couch.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cow.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/credit-card.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/crop-simple.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/crop.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/crosshairs.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cross.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/crown.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/crow.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/crutch.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cruzeiro-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/c.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cubes-stacked.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cubes.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/cube.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/database.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/delete-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/democrat.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/desktop.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dharmachakra.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/diagram-next.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/diagram-predecessor.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/diagram-project.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/diagram-successor.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/diamond.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/diamond-turn-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice-d20.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice-d6.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice-five.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice-four.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice-one.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice-six.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice-three.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dice-two.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/disease.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/display.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/divide.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dna.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dog.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dollar-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dolly.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dong-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/door-closed.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/door-open.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dove.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/down-left-and-up-right-to-center.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/download.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/down-long.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dragon.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/draw-polygon.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/droplet-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/droplet.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/drum-steelpan.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/drumstick-bite.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/drum.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/d.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dumbbell.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dumpster-fire.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dumpster.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/dungeon.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ear-deaf.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ear-listen.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/earth-africa.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/earth-americas.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/earth-asia.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/earth-europe.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/earth-oceania.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/egg.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/eject.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/elevator.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ellipsis.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ellipsis-vertical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/envelope-circle-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/envelope-open.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/envelope-open-text.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/envelopes-bulk.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/envelope.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/equals.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/eraser.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/e.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ethernet.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/euro-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/exclamation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/expand.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/explosion.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/eye-dropper.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/eye-low-vision.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/eye-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/eye.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-angry.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-dizzy.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-flushed.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-frown-open.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-frown.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grimace.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-beam.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-beam-sweat.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-hearts.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-squint.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-squint-tears.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-stars.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-tears.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-tongue-squint.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-tongue.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-tongue-wink.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-wide.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-grin-wink.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-kiss-beam.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-kiss.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-kiss-wink-heart.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-laugh-beam.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-laugh-squint.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-laugh.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-laugh-wink.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-meh-blank.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-meh.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-rolling-eyes.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-sad-cry.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-sad-tear.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-smile-beam.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-smile.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-smile-wink.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-surprise.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/face-tired.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fan.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/faucet-drip.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/faucet.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fax.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/feather-pointed.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/feather.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ferry.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-arrow-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-arrow-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-audio.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-circle-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-circle-exclamation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-circle-minus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-circle-plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-circle-question.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-circle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-code.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-contract.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-csv.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-excel.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-export.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-image.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-import.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-invoice-dollar.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-invoice.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-lines.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-medical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-pdf.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-pen.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-powerpoint.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-prescription.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-shield.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-signature.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-video.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-waveform.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-word.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/file-zipper.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fill-drip.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fill.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/film.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/filter-circle-dollar.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/filter-circle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/filter.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fingerprint.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fire-burner.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fire-extinguisher.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fire-flame-curved.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fire-flame-simple.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fire.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fish-fins.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/fish.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/flag-checkered.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/flag.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/flag-usa.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/flask.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/flask-vial.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/floppy-disk.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/florin-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/folder-closed.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/folder-minus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/folder-open.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/folder-plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/folder.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/folder-tree.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/font-awesome.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/font.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/football.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/forward-fast.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/forward-step.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/forward.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/franc-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/frog.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/f.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/futbol.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gamepad.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gas-pump.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gauge-high.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gauge-simple-high.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gauge-simple.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gauge.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gavel.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gears.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gear.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gem.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/genderless.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ghost.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gifts.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gift.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/glasses.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/glass-water-droplet.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/glass-water.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/globe.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/golf-ball-tee.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gopuram.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/graduation-cap.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/greater-than-equal.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/greater-than.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/grip-lines.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/grip-lines-vertical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/grip.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/grip-vertical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/group-arrows-rotate.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/g.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/guarani-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/guitar.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/gun.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hammer.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hamsa.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-back-fist.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/handcuffs.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-dots.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-fist.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-holding-dollar.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-holding-droplet.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-holding-hand.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-holding-heart.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-holding-medical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-holding.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-lizard.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-middle-finger.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-peace.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-point-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-pointer.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-point-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-point-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-point-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands-asl-interpreting.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands-bound.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands-bubbles.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-scissors.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands-clapping.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/handshake-angle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/handshake-simple-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/handshake-simple.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/handshake-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/handshake.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands-holding-child.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands-holding-circle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands-holding.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-sparkles.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand-spock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands-praying.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hands.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hand.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hanukiah.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hard-drive.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hashtag.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hat-cowboy-side.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hat-cowboy.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hat-wizard.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heading.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/headphones-simple.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/headphones.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/headset.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/head-side-cough-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/head-side-cough.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/head-side-mask.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/head-side-virus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart-circle-bolt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart-circle-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart-circle-exclamation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart-circle-minus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart-circle-plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart-circle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart-crack.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart-pulse.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/heart.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/helicopter.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/helicopter-symbol.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/helmet-safety.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/helmet-un.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/highlighter.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hill-avalanche.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hill-rockslide.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hippo.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hockey-puck.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/holly-berry.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/horse-head.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/horse.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hospital.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hospital-user.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hotdog.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hotel.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hot-tub-person.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hourglass-end.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hourglass-half.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hourglass-start.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hourglass.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-chimney-crack.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-chimney-medical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-chimney.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-chimney-user.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-chimney-window.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-circle-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-circle-exclamation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-circle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-crack.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-fire.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-flag.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-flood-water-circle-arrow-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-flood-water.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-laptop.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-lock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-medical-circle-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-medical-circle-exclamation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-medical-circle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-medical-flag.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-medical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-signal.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-tsunami.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/house-user.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hryvnia-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/h.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/hurricane.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ice-cream.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/icicles.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/icons.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/i-cursor.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/id-badge.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/id-card-clip.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/id-card.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/igloo.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/image-portrait.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/images.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/image.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/inbox.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/indent.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/indian-rupee-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/industry.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/infinity.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/info.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/i.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/italic.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/jar.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/jar-wheat.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/jedi.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/jet-fighter.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/jet-fighter-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/joint.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/j.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/jug-detergent.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/kaaba.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/keyboard.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/key.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/khanda.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/kip-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/kitchen-set.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/kit-medical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/kiwi-bird.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/k.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/landmark-dome.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/landmark-flag.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/landmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/land-mine-on.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/language.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/laptop-code.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/laptop-file.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/laptop-medical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/laptop.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lari-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/layer-group.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/leaf.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/left-long.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/left-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lemon.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/less-than-equal.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/less-than.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/life-ring.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lightbulb.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lines-leaning.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/link-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/link.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lira-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/list-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/list-ol.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/list.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/list-ul.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/litecoin-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/location-arrow.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/location-crosshairs.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/location-dot.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/location-pin-lock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/location-pin.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lock-open.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/locust.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/l.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lungs.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/lungs-virus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/magnet.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/magnifying-glass-arrow-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/magnifying-glass-chart.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/magnifying-glass-dollar.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/magnifying-glass-location.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/magnifying-glass-minus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/magnifying-glass-plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/magnifying-glass.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/manat-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/map-location-dot.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/map-location.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/map-pin.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/map.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/marker.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mars-and-venus-burst.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mars-and-venus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mars-double.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mars-stroke-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mars-stroke.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mars-stroke-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mars.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/martini-glass-citrus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/martini-glass-empty.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/martini-glass.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mask-face.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/masks-theater.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mask.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mask-ventilator.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mattress-pillow.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/maximize.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/medal.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/memory.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/menorah.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mercury.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/message.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/meteor.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/microchip.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/microphone-lines-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/microphone-lines.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/microphone-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/microphone.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/microscope.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mill-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/minimize.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/minus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mitten.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mobile-button.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mobile-retro.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mobile-screen-button.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mobile-screen.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mobile.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-bill-1.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-bill-1-wave.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-bills.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-bill.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-bill-transfer.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-bill-trend-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-bill-wave.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-bill-wheat.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-check-dollar.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/money-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/monument.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/moon.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mortar-pestle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mosque.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mosquito-net.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mosquito.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/motorcycle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mound.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mountain-city.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mountain-sun.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mountain.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/m.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mug-hot.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/mug-saucer.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/music.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/naira-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/network-wired.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/neuter.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/newspaper.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/notdef.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/not-equal.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/notes-medical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/note-sticky.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/n.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/object-group.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/object-ungroup.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/oil-can.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/oil-well.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/om.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/o.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/otter.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/outdent.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pager.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/paintbrush.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/paint-roller.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/palette.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pallet.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/panorama.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/paperclip.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/paper-plane.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/parachute-box.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/paragraph.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/passport.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/paste.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pause.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/paw.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/peace.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pencil.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pen-clip.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pen-fancy.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pen-nib.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pen-ruler.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pen.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pen-to-square.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/people-arrows.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/people-carry-box.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/people-group.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/people-line.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/people-pulling.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/people-robbery.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/people-roof.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pepper-hot.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/percent.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-arrow-down-to-line.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-arrow-up-from-line.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-biking.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-booth.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-breastfeeding.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-burst.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-cane.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-chalkboard.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-circle-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-circle-exclamation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-circle-minus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-circle-plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-circle-question.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-circle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-digging.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-dots-from-line.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-dress-burst.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-dress.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-drowning.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-falling-burst.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-falling.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-half-dress.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-harassing.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-hiking.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-military-pointing.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-military-rifle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-military-to-person.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-praying.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-pregnant.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-rays.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-rifle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-running.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-shelter.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-skating.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-skiing-nordic.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-skiing.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-snowboarding.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-swimming.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-through-window.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-walking-arrow-loop-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-walking-arrow-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-walking-dashed-line-arrow-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-walking-luggage.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-walking.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/person-walking-with-cane.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/peseta-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/peso-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/phone-flip.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/phone-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/phone.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/phone-volume.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/photo-film.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/piggy-bank.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pills.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pizza-slice.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/place-of-worship.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane-arrival.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane-circle-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane-circle-exclamation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane-circle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane-departure.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane-lock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plane-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plant-wilt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plate-wheat.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/play.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plug-circle-bolt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plug-circle-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plug-circle-exclamation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plug-circle-minus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plug-circle-plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plug-circle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plug.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plus-minus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/podcast.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/poop.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/poo-storm.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/poo.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/power-off.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/prescription-bottle-medical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/prescription-bottle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/prescription.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/print.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/p.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pump-medical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/pump-soap.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/puzzle-piece.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/qrcode.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/q.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/question.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/quote-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/quote-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/radiation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/radio.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rainbow.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ranking-star.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/receipt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/record-vinyl.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rectangle-ad.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rectangle-list.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rectangle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/recycle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/registered.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/repeat.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/reply-all.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/reply.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/republican.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/restroom.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/retweet.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ribbon.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/right-from-bracket.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/right-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/right-long.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/right-to-bracket.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ring.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/road-barrier.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/road-bridge.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/road-circle-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/road-circle-exclamation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/road-circle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/road-lock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/road-spikes.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/road.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/robot.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rocket.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rotate-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rotate-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rotate.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/route.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rss.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/r.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ruble-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rug.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ruler-combined.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ruler-horizontal.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ruler.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ruler-vertical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rupee-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/rupiah-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sack-dollar.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sack-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sailboat.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/satellite-dish.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/satellite.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/scale-balanced.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/scale-unbalanced-flip.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/scale-unbalanced.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/school-circle-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/school-circle-exclamation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/school-circle-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/school-flag.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/school-lock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/school.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/scissors.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/screwdriver.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/screwdriver-wrench.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/scroll.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/scroll-torah.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sd-card.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/section.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/seedling.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/server.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shapes.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/share-from-square.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/share-nodes.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/share.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sheet-plastic.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shekel-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shield-cat.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shield-dog.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shield-halved.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shield-heart.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shield.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shield-virus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ship.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shirt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shoe-prints.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shop-lock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shop-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shop.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shower.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shrimp.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shuffle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/shuttle-space.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/signal.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/signature.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sign-hanging.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/signs-post.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sim-card.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sink.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sitemap.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/skull-crossbones.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/skull.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sleigh.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sliders.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/smog.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/smoking.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/snowflake.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/snowman.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/snowplow.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/soap.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/socks.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/solar-panel.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sort-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sort.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sort-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/spaghetti-monster-flying.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/spa.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/spell-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/spider.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/spinner.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/splotch.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/spoon.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/spray-can-sparkles.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/spray-can.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-arrow-up-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-caret-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-caret-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-caret-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-caret-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-envelope.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-full.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-h.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-minus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-nfi.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-parking.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-pen.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-person-confined.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-phone-flip.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-phone.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-poll-horizontal.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-poll-vertical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-root-variable.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-rss.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-share-nodes.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-up-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-virus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/square-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/s.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/staff-snake.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/stairs.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/stamp.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/stapler.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/star-and-crescent.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/star-half-stroke.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/star-half.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/star-of-david.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/star-of-life.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/star.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sterling-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/stethoscope.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/stop.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/stopwatch-20.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/stopwatch.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/store-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/store.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/street-view.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/strikethrough.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/stroopwafel.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/subscript.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/suitcase-medical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/suitcase-rolling.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/suitcase.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sun-plant-wilt.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/sun.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/superscript.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/swatchbook.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/synagogue.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/syringe.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/table-cells-large.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/table-cells.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/table-columns.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/table-list.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/table.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tablet-button.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/table-tennis-paddle-ball.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tablet-screen-button.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tablets.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tablet.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tachograph-digital.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tags.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tag.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tape.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tarp-droplet.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tarp.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/taxi.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/teeth-open.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/teeth.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-arrow-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-arrow-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-empty.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-full.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-half.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-high.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-low.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-quarter.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/temperature-three-quarters.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tenge-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tent-arrow-down-to-line.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tent-arrow-left-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tent-arrows-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tent-arrow-turn-left.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tents.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tent.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/terminal.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/text-height.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/text-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/text-width.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/thermometer.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/thumbs-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/thumbs-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/thumbtack.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ticket-simple.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/ticket.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/timeline.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/toggle-off.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/toggle-on.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/toilet-paper-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/toilet-paper.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/toilet-portable.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/toilets-portable.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/toilet.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/toolbox.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tooth.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/torii-gate.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tornado.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tower-broadcast.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tower-cell.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tower-observation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tractor.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trademark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/traffic-light.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trailer.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/train-subway.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/train.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/train-tram.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/transgender.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trash-arrow-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trash-can-arrow-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trash-can.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tree-city.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tree.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/triangle-exclamation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trophy.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trowel-bricks.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/trowel.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-arrow-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-droplet.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-fast.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-field.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-field-un.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-front.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-medical.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-monster.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-moving.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-pickup.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-plane.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck-ramp-box.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/truck.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/t.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tty.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/turkish-lira-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/turn-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/turn-up.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/tv.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/umbrella-beach.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/umbrella.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/underline.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/universal-access.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/unlock-keyhole.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/unlock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/up-down-left-right.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/up-down.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/upload.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/up-long.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/up-right-and-down-left-from-center.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/up-right-from-square.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-astronaut.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-clock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-doctor.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-gear.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-graduate.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-group.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-injured.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-large-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-large.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-lock.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-minus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-ninja.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-nurse.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-pen.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-plus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/users-between-lines.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-secret.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/users-gear.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-shield.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/users-line.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/users-rays.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/users-rectangle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/users-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/users.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/users-viewfinder.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-tag.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-tie.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/user-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/u.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/utensils.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/van-shuttle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vault.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vector-square.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/venus-double.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/venus-mars.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/venus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vest-patches.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vest.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vial-circle-check.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vials.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vial.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vial-virus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/video-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/video.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vihara.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/virus-covid-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/virus-covid.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/viruses.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/virus-slash.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/virus.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/voicemail.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/volcano.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/volleyball.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/volume-high.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/volume-low.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/volume-off.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/volume-xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/vr-cardboard.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/v.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/walkie-talkie.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wallet.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wand-magic-sparkles.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wand-magic.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wand-sparkles.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/warehouse.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/water-ladder.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/water.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wave-square.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/weight-hanging.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/weight-scale.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wheat-awn-circle-exclamation.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wheat-awn.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wheelchair-move.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wheelchair.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/whiskey-glass.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wifi.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/window-maximize.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/window-minimize.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/window-restore.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wind.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wine-bottle.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wine-glass-empty.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wine-glass.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/won-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/worm.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/wrench.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/w.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/xmarks-lines.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/xmark.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/x-ray.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/x.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/yen-sign.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/yin-yang.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/y.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/svgs/solid/z.svg was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts/fa-brands-400.ttf was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts/fa-brands-400.woff2 was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts/fa-regular-400.ttf was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts/fa-regular-400.woff2 was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts/fa-solid-900.ttf was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts/fa-solid-900.woff2 was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts/fa-v4compatibility.ttf was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/webfonts/fa-v4compatibility.woff2 was added
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/font-awesome.css was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/css/font-awesome.min.css was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/fonts was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/fonts/FontAwesome.otf was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/fonts/fontawesome-webfont.eot was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/fonts/fontawesome-webfont.svg was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/fonts/fontawesome-webfont.ttf was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/fonts/fontawesome-webfont.woff was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/fonts/fontawesome-webfont.woff2 was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/animated.less was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/bordered-pulled.less was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/core.less was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/fixed-width.less was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/font-awesome.less was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/icons.less was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/larger.less was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/list.less was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/mixins.less was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/path.less was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/rotated-flipped.less was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/screen-reader.less was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/stacked.less was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/less/variables.less was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/font-awesome.scss was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/_larger.scss was removed
  /usr/lib/python3.11/site-packages/xstatic/pkg/font_awesome/data/scss/_path.scss was removed

--===============8577133817063291918==--

