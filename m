Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83EB3C15500
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:22 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.2283.1699061894758132512
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=F4nDDZT4;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CAsYwDa+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018b97fb0e34-79ba8507-4630-4d17-b4b7-33e7005ec555-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061894;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FkF/1yVbI6X5keN+T/powFs8sqxOnUZlj/O/k35VTc0=;
	b=F4nDDZT42JZD3g2kfJHX2tiZ5U112x6rpuUR9HOQdmZki4nUQZajeq0Xz9l2JwQj
	rtZaXSes9DddSZKFLeRgcrPDLBZTIV6zCvCaLvG5xtUQP+j+jc2ap7yAiKf7eZCTvkZ
	m3Vu0HHOPedGSegLbYBOAZDDxedg+0xSq4WehTFI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061894;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FkF/1yVbI6X5keN+T/powFs8sqxOnUZlj/O/k35VTc0=;
	b=CAsYwDa+qGaAmq514ObxumJjnhgqA27DSMEtlcM9vZxV6wx3sQpy1D/00cSoRmrL
	dCswBqsmTqbf12DMz0633zd8eohMmsnwVZSDJUaA0kz4ccr6qgrVF+WuGCR0lF67CSR
	kpUMPcs5lRXJ5/v18VeftQmMC0agnEZerhyz5EzY=
Content-Type: multipart/mixed; boundary="===============7573563462163736197=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-flask-user: upgrading to 1.0.2.2 FAILED
Message-ID: <0101018b97fb0e34-79ba8507-4630-4d17-b4b7-33e7005ec555-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.33
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106116

--===============7573563462163736197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-flask-user* to *1.0.2.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-flask-user-upgrade-0.6.19-1.0.2.2.patch
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
From 3ef3e14bc4c91ae5ee89deb195af64b6def9eb2f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 21:14:55 +0000
Subject: [PATCH] python3-flask-user: upgrade 0.6.19 -> 1.0.2.2

---
 ....6.19.bb => python3-flask-user_1.0.2.2.bb} | 59 ++++++++++++++++++-
 1 file changed, 56 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-user_0.6.19.bb => python3-flask-user_1.0.2.2.bb} (14%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb b/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb
similarity index 14%
rename from meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
rename to meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb
index ac449361a..f7e87ce2b 100644
--- a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb
@@ -1,13 +1,66 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.txt
+# +++ LICENSE.txt
+# @@ -1,22 +1,22 @@
+# -Copyright (c) 2013, Ling Thio and contributors.
+# +Copyright (c) 2013 Ling Thio
+#  
+# -Redistribution and use in source and binary forms, with or without
+# -modification, are permitted provided that the following conditions are met:
+# +Permission is hereby granted, free of charge, to any person
+# +obtaining a copy of this software and associated documentation
+# +files (the "Software"), to deal in the Software without
+# +restriction, including without limitation the rights to use,
+# +copy, modify, merge, publish, distribute, sublicense, and/or sell
+# +copies of the Software, and to permit persons to whom the
+# +Software is furnished to do so, subject to the following
+# +conditions:
+#  
+# -1. Redistributions of source code must retain the above copyright notice, this
+# -   list of conditions and the following disclaimer.
+# +The above copyright notice and this permission notice shall be
+# +included in all copies or substantial portions of the Software.
+#  
+# -2. Redistributions in binary form must reproduce the above copyright notice,
+# -   this list of conditions and the following disclaimer in the documentation
+# -   and/or other materials provided with the distribution.
+# -
+# -THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+# -ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+# -WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
+# -DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
+# -ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
+# -(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
+# -LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
+# -ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+# -(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+# -SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+# +THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+# +EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+# +OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+# +NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+# +HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+# +WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+# +FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+# +OTHER DEALINGS IN THE SOFTWARE.
+#
+
 SUMMARY = "Customizable user account management for Flask"
 DESCRIPTION = "Customizable User Account Management for Flask; Register \
 Confirm email, Login, Change username, Change password, Forgot Password \
 and more."
 HOMEPAGE = " https://github.com/lingthio/Flask-User"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=97de97cd9d6e23c88129d884588ce71a"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5aabce758ead32427c145173bc555403"
 
-SRC_URI[md5sum] = "f7965e66ca139c8436896da07e66c21f"
-SRC_URI[sha256sum] = "601abcc0343dfbae0c56273d98362d5cdc266ac84d20b3f65a212e4a2c83b302"
+SRC_URI[sha256sum] = "c9785febc2fc7ca15c69cfff1c8dabc2788f25043b54a33f73a6c2a9daf7fbe4"
 
 PYPI_PACKAGE = "Flask-User"
 
-- 
2.39.2


--===============7573563462163736197==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-flask-user-upgrade-0.6.19-1.0.2.2.patch"

RnJvbSAzZWYzZTE0YmM0YzkxYWU1ZWU4OWRlYjE5NWFmNjRiNmRlZjllYjJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMToxNDo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZmxhc2stdXNlcjogdXBncmFkZSAwLjYuMTkgLT4gMS4wLjIuMgoKLS0tCiAuLi4uNi4x
OS5iYiA9PiBweXRob24zLWZsYXNrLXVzZXJfMS4wLjIuMi5iYn0gfCA1OSArKysrKysrKysrKysr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1mbGFz
ay11c2VyXzAuNi4xOS5iYiA9PiBweXRob24zLWZsYXNrLXVzZXJfMS4wLjIuMi5iYn0gKDE0JSkK
CmRpZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LWZsYXNrLXVzZXJfMC42LjE5LmJiIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1mbGFzay11c2VyXzEuMC4yLjIuYmIKc2ltaWxhcml0eSBpbmRleCAxNCUKcmVu
YW1lIGZyb20gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1mbGFz
ay11c2VyXzAuNi4xOS5iYgpyZW5hbWUgdG8gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1mbGFzay11c2VyXzEuMC4yLjIuYmIKaW5kZXggYWM0NDkzNjFhLi5mN2U4
N2NlMmIgMTAwNjQ0Ci0tLSBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtZmxhc2stdXNlcl8wLjYuMTkuYmIKKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1mbGFzay11c2VyXzEuMC4yLjIuYmIKQEAgLTEsMTMgKzEsNjYg
QEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRl
ZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5j
ZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBk
YXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdl
cyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMg
KGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMK
KyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNFLnR4dAorIyArKysgTElDRU5TRS50eHQK
KyMgQEAgLTEsMjIgKzEsMjIgQEAKKyMgLUNvcHlyaWdodCAoYykgMjAxMywgTGluZyBUaGlvIGFu
ZCBjb250cmlidXRvcnMuCisjICtDb3B5cmlnaHQgKGMpIDIwMTMgTGluZyBUaGlvCisjICAKKyMg
LVJlZGlzdHJpYnV0aW9uIGFuZCB1c2UgaW4gc291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdpdGgg
b3Igd2l0aG91dAorIyAtbW9kaWZpY2F0aW9uLCBhcmUgcGVybWl0dGVkIHByb3ZpZGVkIHRoYXQg
dGhlIGZvbGxvd2luZyBjb25kaXRpb25zIGFyZSBtZXQ6CisjICtQZXJtaXNzaW9uIGlzIGhlcmVi
eSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbgorIyArb2J0YWluaW5nIGEg
Y29weSBvZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRpb24KKyMgK2Zp
bGVzICh0aGUgIlNvZnR3YXJlIiksIHRvIGRlYWwgaW4gdGhlIFNvZnR3YXJlIHdpdGhvdXQKKyMg
K3Jlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dCBsaW1pdGF0aW9uIHRoZSByaWdodHMgdG8g
dXNlLAorIyArY29weSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwgc3VibGlj
ZW5zZSwgYW5kL29yIHNlbGwKKyMgK2NvcGllcyBvZiB0aGUgU29mdHdhcmUsIGFuZCB0byBwZXJt
aXQgcGVyc29ucyB0byB3aG9tIHRoZQorIyArU29mdHdhcmUgaXMgZnVybmlzaGVkIHRvIGRvIHNv
LCBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcKKyMgK2NvbmRpdGlvbnM6CisjICAKKyMgLTEuIFJl
ZGlzdHJpYnV0aW9ucyBvZiBzb3VyY2UgY29kZSBtdXN0IHJldGFpbiB0aGUgYWJvdmUgY29weXJp
Z2h0IG5vdGljZSwgdGhpcworIyAtICAgbGlzdCBvZiBjb25kaXRpb25zIGFuZCB0aGUgZm9sbG93
aW5nIGRpc2NsYWltZXIuCisjICtUaGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBw
ZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZQorIyAraW5jbHVkZWQgaW4gYWxsIGNvcGllcyBvciBz
dWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0aGUgU29mdHdhcmUuCisjICAKKyMgLTIuIFJlZGlzdHJp
YnV0aW9ucyBpbiBiaW5hcnkgZm9ybSBtdXN0IHJlcHJvZHVjZSB0aGUgYWJvdmUgY29weXJpZ2h0
IG5vdGljZSwKKyMgLSAgIHRoaXMgbGlzdCBvZiBjb25kaXRpb25zIGFuZCB0aGUgZm9sbG93aW5n
IGRpc2NsYWltZXIgaW4gdGhlIGRvY3VtZW50YXRpb24KKyMgLSAgIGFuZC9vciBvdGhlciBtYXRl
cmlhbHMgcHJvdmlkZWQgd2l0aCB0aGUgZGlzdHJpYnV0aW9uLgorIyAtCisjIC1USElTIFNPRlRX
QVJFIElTIFBST1ZJREVEIEJZIFRIRSBDT1BZUklHSFQgSE9MREVSUyBBTkQgQ09OVFJJQlVUT1JT
ICJBUyBJUyIgQU5ECisjIC1BTlkgRVhQUkVTUyBPUiBJTVBMSUVEIFdBUlJBTlRJRVMsIElOQ0xV
RElORywgQlVUIE5PVCBMSU1JVEVEIFRPLCBUSEUgSU1QTElFRAorIyAtV0FSUkFOVElFUyBPRiBN
RVJDSEFOVEFCSUxJVFkgQU5EIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFSRQor
IyAtRElTQ0xBSU1FRC4gSU4gTk8gRVZFTlQgU0hBTEwgVEhFIENPUFlSSUdIVCBPV05FUiBPUiBD
T05UUklCVVRPUlMgQkUgTElBQkxFIEZPUgorIyAtQU5ZIERJUkVDVCwgSU5ESVJFQ1QsIElOQ0lE
RU5UQUwsIFNQRUNJQUwsIEVYRU1QTEFSWSwgT1IgQ09OU0VRVUVOVElBTCBEQU1BR0VTCisjIC0o
SU5DTFVESU5HLCBCVVQgTk9UIExJTUlURUQgVE8sIFBST0NVUkVNRU5UIE9GIFNVQlNUSVRVVEUg
R09PRFMgT1IgU0VSVklDRVM7CisjIC1MT1NTIE9GIFVTRSwgREFUQSwgT1IgUFJPRklUUzsgT1Ig
QlVTSU5FU1MgSU5URVJSVVBUSU9OKSBIT1dFVkVSIENBVVNFRCBBTkQKKyMgLU9OIEFOWSBUSEVP
UlkgT0YgTElBQklMSVRZLCBXSEVUSEVSIElOIENPTlRSQUNULCBTVFJJQ1QgTElBQklMSVRZLCBP
UiBUT1JUCisjIC0oSU5DTFVESU5HIE5FR0xJR0VOQ0UgT1IgT1RIRVJXSVNFKSBBUklTSU5HIElO
IEFOWSBXQVkgT1VUIE9GIFRIRSBVU0UgT0YgVEhJUworIyAtU09GVFdBUkUsIEVWRU4gSUYgQURW
SVNFRCBPRiBUSEUgUE9TU0lCSUxJVFkgT0YgU1VDSCBEQU1BR0UuCisjICtUSEUgU09GVFdBUkUg
SVMgUFJPVklERUQgIkFTIElTIiwgV0lUSE9VVCBXQVJSQU5UWSBPRiBBTlkgS0lORCwKKyMgK0VY
UFJFU1MgT1IgSU1QTElFRCwgSU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBUSEUgV0FSUkFO
VElFUworIyArT0YgTUVSQ0hBTlRBQklMSVRZLCBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVS
UE9TRSBBTkQKKyMgK05PTklORlJJTkdFTUVOVC4gSU4gTk8gRVZFTlQgU0hBTEwgVEhFIEFVVEhP
UlMgT1IgQ09QWVJJR0hUCisjICtIT0xERVJTIEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1B
R0VTIE9SIE9USEVSIExJQUJJTElUWSwKKyMgK1dIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENPTlRS
QUNULCBUT1JUIE9SIE9USEVSV0lTRSwgQVJJU0lORworIyArRlJPTSwgT1VUIE9GIE9SIElOIENP
Tk5FQ1RJT04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFIFVTRSBPUgorIyArT1RIRVIgREVBTElO
R1MgSU4gVEhFIFNPRlRXQVJFLgorIworCiBTVU1NQVJZID0gIkN1c3RvbWl6YWJsZSB1c2VyIGFj
Y291bnQgbWFuYWdlbWVudCBmb3IgRmxhc2siCiBERVNDUklQVElPTiA9ICJDdXN0b21pemFibGUg
VXNlciBBY2NvdW50IE1hbmFnZW1lbnQgZm9yIEZsYXNrOyBSZWdpc3RlciBcCiBDb25maXJtIGVt
YWlsLCBMb2dpbiwgQ2hhbmdlIHVzZXJuYW1lLCBDaGFuZ2UgcGFzc3dvcmQsIEZvcmdvdCBQYXNz
d29yZCBcCiBhbmQgbW9yZS4iCiBIT01FUEFHRSA9ICIgaHR0cHM6Ly9naXRodWIuY29tL2xpbmd0
aGlvL0ZsYXNrLVVzZXIiCiBMSUNFTlNFID0gIkJTRC0yLUNsYXVzZSIKLUxJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT05N2RlOTdjZDlkNmUyM2M4ODEyOWQ4ODQ1ODhj
ZTcxYSIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT01YWFiY2U3
NThlYWQzMjQyN2MxNDUxNzNiYzU1NTQwMyIKIAotU1JDX1VSSVttZDVzdW1dID0gImY3OTY1ZTY2
Y2ExMzljODQzNjg5NmRhMDdlNjZjMjFmIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjYwMWFiY2Mw
MzQzZGZiYWUwYzU2MjczZDk4MzYyZDVjZGMyNjZhYzg0ZDIwYjNmNjVhMjEyZTRhMmM4M2IzMDIi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzk3ODVmZWJjMmZjN2NhMTVjNjljZmZmMWM4ZGFiYzI3
ODhmMjUwNDNiNTRhMzNmNzNhNmMyYTlkYWY3ZmJlNCIKIAogUFlQSV9QQUNLQUdFID0gIkZsYXNr
LVVzZXIiCiAKLS0gCjIuMzkuMgoK

--===============7573563462163736197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4965 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3054 cached, 1 parsed). 4886 targets, 92 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-e575f59b82eae78fb1ac8df7198eaa4a7a963259"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"
meta-oe              
meta-python          
meta-perl            
meta-networking      
meta-multimedia      
meta-gnome           
meta-xfce            
meta-filesystems     
meta-initramfs       
meta-webserver       = "tmp-auh-upgrades:d2e6e045cc119dce865b077f7a68b8f8d2111ec8"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 415 Local 406 Mirrors 0 Missed 9 Current 314 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 317 of 729 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-blinker_1.6.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 318 of 729 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-login_0.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 319 of 729 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 327 of 729 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 329 of 729 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 330 of 729 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-wtf_1.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 331 of 729 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-flask_2.3.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 335 of 729 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-passlib_1.7.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 370 of 729 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-babel_2.13.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-flask-login-0.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-flask-mail-0.9.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-flask-wtf-1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-flask-2.3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-babel-2.13.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-passlib-1.7.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-blinker-1.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-flask-login-0.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-blinker-1.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-flask-wtf-1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 602 of 729 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-babel-2.13.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-passlib-1.7.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-flask-mail-0.9.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-flask-2.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 618 of 729 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 539 of 2040 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb:do_fetch)
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_fetch: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 665 of 729 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 581 of 2040 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb:do_unpack)
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_unpack: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 678 of 729 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 685 of 729 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 687 of 729 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1207 of 2040 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb:do_patch)
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_patch: Started
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 721 of 729 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 723 of 729 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 726 of 729 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1772 of 2040 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1989 of 2040 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2028 of 2040 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb:do_configure)
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_configure: Started
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2029 of 2040 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb:do_compile)
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/__init__.py:80: _DeprecatedInstaller: setuptools.installer and fetch_build_eggs are deprecated.
| !!
| 
|         ********************************************************************************
|         Requirements should be satisfied by a PEP 517 installer.
|         If you are using pip, you can try `pip install --use-pep517`.
|         ********************************************************************************
| 
| !!
|   dist.fetch_build_eggs(dist.setup_requires)
| /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2/recipe-sysroot-native/usr/bin/python3-native/python3: No module named pip
| Traceback (most recent call last):
|   File "/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/installer.py", line 101, in _fetch_build_egg_no_warn
|     subprocess.check_call(cmd)
|   File "/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2/recipe-sysroot-native/usr/lib/python3.11/subprocess.py", line 413, in check_call
|     raise CalledProcessError(retcode, cmd)
| subprocess.CalledProcessError: Command '['/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2/recipe-sysroot-native/usr/bin/python3-native/python3', '-m', 'pip', '--disable-pip-version-check', 'wheel', '--no-deps', '-w', '/tmp/tmp63iwuvo1', '--quiet', 'Flask-Login']' returned non-zero exit status 1.
| 
| The above exception was the direct cause of the following exception:
| 
| Traceback (most recent call last):
|   File "/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2/Flask-User-1.0.2.2/setup.py", line 26, in <module>
|     setup(
|   File "/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/__init__.py", line 102, in setup
|     _install_setup_requires(attrs)
|   File "/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/__init__.py", line 75, in _install_setup_requires
|     _fetch_build_eggs(dist)
|   File "/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/__init__.py", line 80, in _fetch_build_eggs
|     dist.fetch_build_eggs(dist.setup_requires)
|   File "/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/dist.py", line 662, in fetch_build_eggs
|     return _fetch_build_eggs(self, requires)
|            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/installer.py", line 38, in _fetch_build_eggs
|     resolved_dists = pkg_resources.working_set.resolve(
|                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2/recipe-sysroot-native/usr/lib/python3.11/site-packages/pkg_resources/__init__.py", line 829, in resolve
|     dist = self._resolve_dist(
|            ^^^^^^^^^^^^^^^^^^^
|   File "/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2/recipe-sysroot-native/usr/lib/python3.11/site-packages/pkg_resources/__init__.py", line 865, in _resolve_dist
|     dist = best[req.key] = env.best_match(
|                            ^^^^^^^^^^^^^^^
|   File "/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2/recipe-sysroot-native/usr/lib/python3.11/site-packages/pkg_resources/__init__.py", line 1135, in best_match
|     return self.obtain(req, installer)
|            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2/recipe-sysroot-native/usr/lib/python3.11/site-packages/pkg_resources/__init__.py", line 1147, in obtain
|     return installer(requirement)
|            ^^^^^^^^^^^^^^^^^^^^^^
|   File "/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/installer.py", line 103, in _fetch_build_egg_no_warn
|     raise DistutilsError(str(e)) from e
| distutils.errors.DistutilsError: Command '['/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2/recipe-sysroot-native/usr/bin/python3-native/python3', '-m', 'pip', '--disable-pip-version-check', 'wheel', '--no-deps', '-w', '/tmp/tmp63iwuvo1', '--quiet', 'Flask-Login']' returned non-zero exit status 1.
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2/temp/run.do_compile.3097366:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2/temp/run.do_compile.3097366, line 180
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2/temp/run.do_compile.3097366, line 170
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2/temp/run.do_compile.3097366, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2/temp/run.do_compile.3097366, line 184
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2029 tasks of which 2022 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 7 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103211423.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103211423.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-flask-user-1.0.2.2-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-flask-user-1.0.2.2-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2/temp/run.do_compile.3097366', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2/temp/log.do_compile.3097366
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb:do_compile) failed with exit code '1'

--===============7573563462163736197==--

