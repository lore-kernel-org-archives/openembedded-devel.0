Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD53C001DB
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 03:13:04 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.3434.1699067575486869768
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 20:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hk5iYIJs;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Dxfv8PR/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b9851b9e9-92709dc5-5b99-464b-a606-9c3804b8e864-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699067574;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tX1vqz0H9J/SExomfZrh9ItQzuP+YimsHZ5d7uNNwFg=;
	b=hk5iYIJsd5LWk/FAfFXCxOvcq32+Dl9sQJ4ZJIfL6GXgLBYswkeR8/0ZAxcGPoE8
	TdhcGJ4c+RkGJek/ZVMpGkucXpAbeihPwEnteJo/SeLti9nIn80gbr8tJreg8sZZBJ+
	MSZfjGl6f0prooVrFKNnYr63ITLcgEUbLnXeUUUk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699067574;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tX1vqz0H9J/SExomfZrh9ItQzuP+YimsHZ5d7uNNwFg=;
	b=Dxfv8PR/5yqmEoT1mW989kyPH4x6hGCmq8Qxva6d+d4AEdGR/yCHxZqu5n0cwvuP
	whqgbPc1UjuBfVyJ4sSpp3hUs2FbmTJm3gwaMvSECSDbPhwDG10PEei5Pydw1wzNFs+
	jYp5XN7gZB2HI0l04GaZry8glKTNKK3ukbVACV5A=
Content-Type: multipart/mixed; boundary="===============2344925206383439294=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] openvpn: upgrading to 2.6.6 SUCCEEDED
Message-ID: <0101018b9851b9e9-92709dc5-5b99-464b-a606-9c3804b8e864-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 03:12:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 03:13:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106225

--===============2344925206383439294==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *openvpn* to *2.6.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-openvpn-upgrade-2.6.3-2.6.6.patch
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
From c108569fe2e9d2c7e341273cc6ca7a9e51944056 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 02:46:06 +0000
Subject: [PATCH] openvpn: upgrade 2.6.3 -> 2.6.6

---
 .../{openvpn_2.6.3.bb => openvpn_2.6.6.bb}    | 71 ++++++++++++++++++-
 1 file changed, 69 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.6.3.bb => openvpn_2.6.6.bb} (47%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.6.3.bb b/meta-networking/recipes-support/openvpn/openvpn_2.6.6.bb
similarity index 47%
rename from meta-networking/recipes-support/openvpn/openvpn_2.6.3.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.6.6.bb
index a5fc15874..bfa419235 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.6.3.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.6.6.bb
@@ -1,8 +1,75 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -30,6 +30,53 @@
+#    this file, you may extend this exception to your version of the
+#    file, but you are not obligated to do so.  If you do not wish to
+#    do so, delete this exception statement from your version.
+# +
+# +Apache2 linking exception:
+# +---------------------------
+# +OpenVPN is currently undergoing a license change to add an exception for
+# +Apache 2 linking. The following exception is only valid for new contributions
+# +after 2023-05-03 and past contribution where the authors have already agreed
+# +to the exception.
+# +
+# +  In addition, as a special exception, OpenVPN Inc and the
+# +  contributors give permission to link the code of this program to
+# +  libraries (the "Libraries") licensed under the Apache License
+# +  version 2.0 (this work and any linked library the "Combined Work")
+# +  and copy and distribute the Combined Work without an obligation to
+# +  license the Libraries under the GNU General Public License v2
+# +  (GPL-2.0) as required by Section 2 of the GPL-2.0, and without an
+# +  obligation to refrain from imposing any additional restrictions in
+# +  the Apache License version 2 that are not in the GPL-2.0, as
+# +  required by Section 6 of the GPL-2.0.  You must comply with the
+# +  GPL-2.0 in all other respects for the Combined Work, including
+# +  the obligation to provide source code.  If you modify this file, you
+# +  may extend this exception to your version of the file, but you are
+# +  not obligated to do so.  If you do not wish to do so, delete this
+# +  exception statement from your version.
+# +
+# +For better understanding, in plain non-legalese English this basically says:
+# +
+# + * The intention for this license exception is to allow OpenVPN to be
+# +   linked against APL-2 licensed libraries, even where the GPL-2.0 and
+# +   APL-2 licenses conflict from a legal perspective.
+# +
+# + * OpenVPN itself will stay GPL-2.0 and the code belonging to the
+# +   OpenVPN project must comply to the GPL-2.0 license.  This is NOT
+# +   dual-licensing of the OpenVPN code base.
+# +
+# + * This license exception DOES NOT require NOR expect a license change
+# +   of the APL-2 based library.  This exception allows using the APL-2
+# +   library as-is.  However, when distributing a compiled OpenVPN binary
+# +   linking against APL-2 libraries ("Combined Work"), the REQUIREMENT is
+# +   that the APL-2 library MUST also be available on similar terms as in
+# +   GPL-2.0, like providing the source code of the library upon request,
+# +   except in the two specific ways mentioned.
+# +
+# + * If the APL-2 based library forbids such linking and distribution,
+# +   this license exception DOES NOT overrule the restriction of the APL-2
+# +   based library.  If the APL-2 library cannot satisfy the requirements
+# +   in this license exception, you CANNOT distribute an OpenVPN binary
+# +   linked with this library.
+#  
+#  LZO license:
+#  ------------
+# 
+#
+
 SUMMARY = "A full-featured SSL VPN solution via tun device."
 HOMEPAGE = "https://openvpn.net/"
 SECTION = "net"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3170e982baae61dbb8de963317d1ac94"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d8d34ce6390552676e4ce8279f13c48a"
 DEPENDS = "lzo lz4 openssl iproute2 libcap-ng ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 inherit autotools systemd update-rc.d pkgconfig
@@ -14,7 +81,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "13b207a376d8880507c74ff78aabc3778a9da47c89f1e247dcee3c7237138ff6"
+SRC_URI[sha256sum] = "3b074f392818b31aa529b84f76e8b5e4ad03fca764924f46d906bceaaf421034"
 
 CVE_STATUS[CVE-2020-27569] = "not-applicable-config: Applies only Aviatrix OpenVPN client, not openvpn"
 
-- 
2.39.2


--===============2344925206383439294==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/openvpn: PV changed from "2.6.3" to "2.6.6"
packages/core2-64-poky-linux/openvpn: SRC_URI changed from "http://swupdate.openvpn.org/community/releases/openvpn-2.6.3.tar.gz file://0001-configure.ac-eliminate-build-path-from-openvpn-versi.patch file://openvpn" to "http://swupdate.openvpn.org/community/releases/openvpn-2.6.6.tar.gz file://0001-configure.ac-eliminate-build-path-from-openvpn-versi.patch file://openvpn"
packages/core2-64-poky-linux/openvpn: PKGV changed from 2.6.3 [default] to 2.6.6 [default]
packages/core2-64-poky-linux/openvpn/openvpn-dbg: PV changed from "2.6.3" to "2.6.6"
packages/core2-64-poky-linux/openvpn/openvpn-dbg: PKGSIZE changed from 2847256 to 2847880 (+0%)
packages/core2-64-poky-linux/openvpn/openvpn-dbg: PKGV changed from 2.6.3 [default] to 2.6.6 [default]
packages/core2-64-poky-linux/openvpn/openvpn-dev: PV changed from "2.6.3" to "2.6.6"
packages/core2-64-poky-linux/openvpn/openvpn-dev: PKGSIZE changed from 31184 to 31402 (+1%)
packages/core2-64-poky-linux/openvpn/openvpn-dev: PKGV changed from 2.6.3 [default] to 2.6.6 [default]
packages/core2-64-poky-linux/openvpn/openvpn-doc: PV changed from "2.6.3" to "2.6.6"
packages/core2-64-poky-linux/openvpn/openvpn-doc: PKGSIZE changed from 448438 to 454808 (+1%)
packages/core2-64-poky-linux/openvpn/openvpn-doc: PKGV changed from 2.6.3 [default] to 2.6.6 [default]
packages/core2-64-poky-linux/openvpn/openvpn-locale: PV changed from "2.6.3" to "2.6.6"
packages/core2-64-poky-linux/openvpn/openvpn-locale: PKGV changed from 2.6.3 [default] to 2.6.6 [default]
packages/core2-64-poky-linux/openvpn/openvpn-sample: PV changed from "2.6.3" to "2.6.6"
packages/core2-64-poky-linux/openvpn/openvpn-sample: PKGV changed from 2.6.3 [default] to 2.6.6 [default]
packages/core2-64-poky-linux/openvpn/openvpn-src: PV changed from "2.6.3" to "2.6.6"
packages/core2-64-poky-linux/openvpn/openvpn-src: PKGSIZE changed from 3159019 to 3162720 (+0%)
packages/core2-64-poky-linux/openvpn/openvpn-src: PKGV changed from 2.6.3 [default] to 2.6.6 [default]
packages/core2-64-poky-linux/openvpn/openvpn-staticdev: PV changed from "2.6.3" to "2.6.6"
packages/core2-64-poky-linux/openvpn/openvpn-staticdev: PKGV changed from 2.6.3 [default] to 2.6.6 [default]
packages/core2-64-poky-linux/openvpn/openvpn: PV changed from "2.6.3" to "2.6.6"
packages/core2-64-poky-linux/openvpn/openvpn: PKGV changed from 2.6.3 [default] to 2.6.6 [default]

--===============2344925206383439294==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-openvpn-upgrade-2.6.3-2.6.6.patch"

RnJvbSBjMTA4NTY5ZmUyZTlkMmM3ZTM0MTI3M2NjNmNhN2E5ZTUxOTQ0MDU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMjo0NjowNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG9w
ZW52cG46IHVwZ3JhZGUgMi42LjMgLT4gMi42LjYKCi0tLQogLi4uL3tvcGVudnBuXzIuNi4zLmJi
ID0+IG9wZW52cG5fMi42LjYuYmJ9ICAgIHwgNzEgKysrKysrKysrKysrKysrKysrLQogMSBmaWxl
IGNoYW5nZWQsIDY5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS1u
ZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC9vcGVudnBuL3tvcGVudnBuXzIuNi4zLmJiID0+IG9w
ZW52cG5fMi42LjYuYmJ9ICg0NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS1uZXR3b3JraW5nL3JlY2lw
ZXMtc3VwcG9ydC9vcGVudnBuL29wZW52cG5fMi42LjMuYmIgYi9tZXRhLW5ldHdvcmtpbmcvcmVj
aXBlcy1zdXBwb3J0L29wZW52cG4vb3BlbnZwbl8yLjYuNi5iYgpzaW1pbGFyaXR5IGluZGV4IDQ3
JQpyZW5hbWUgZnJvbSBtZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1zdXBwb3J0L29wZW52cG4vb3Bl
bnZwbl8yLjYuMy5iYgpyZW5hbWUgdG8gbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC9v
cGVudnBuL29wZW52cG5fMi42LjYuYmIKaW5kZXggYTVmYzE1ODc0Li5iZmE0MTkyMzUgMTAwNjQ0
Ci0tLSBhL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1cHBvcnQvb3BlbnZwbi9vcGVudnBuXzIu
Ni4zLmJiCisrKyBiL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1cHBvcnQvb3BlbnZwbi9vcGVu
dnBuXzIuNi42LmJiCkBAIC0xLDggKzEsNzUgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hL
U1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhl
IGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcg
bGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRl
ZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2Ugdmlh
ICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29w
eXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBDT1BZ
SU5HCisjICsrKyBDT1BZSU5HCisjIEBAIC0zMCw2ICszMCw1MyBAQAorIyAgICB0aGlzIGZpbGUs
IHlvdSBtYXkgZXh0ZW5kIHRoaXMgZXhjZXB0aW9uIHRvIHlvdXIgdmVyc2lvbiBvZiB0aGUKKyMg
ICAgZmlsZSwgYnV0IHlvdSBhcmUgbm90IG9ibGlnYXRlZCB0byBkbyBzby4gIElmIHlvdSBkbyBu
b3Qgd2lzaCB0bworIyAgICBkbyBzbywgZGVsZXRlIHRoaXMgZXhjZXB0aW9uIHN0YXRlbWVudCBm
cm9tIHlvdXIgdmVyc2lvbi4KKyMgKworIyArQXBhY2hlMiBsaW5raW5nIGV4Y2VwdGlvbjoKKyMg
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyArT3BlblZQTiBpcyBjdXJyZW50bHkgdW5k
ZXJnb2luZyBhIGxpY2Vuc2UgY2hhbmdlIHRvIGFkZCBhbiBleGNlcHRpb24gZm9yCisjICtBcGFj
aGUgMiBsaW5raW5nLiBUaGUgZm9sbG93aW5nIGV4Y2VwdGlvbiBpcyBvbmx5IHZhbGlkIGZvciBu
ZXcgY29udHJpYnV0aW9ucworIyArYWZ0ZXIgMjAyMy0wNS0wMyBhbmQgcGFzdCBjb250cmlidXRp
b24gd2hlcmUgdGhlIGF1dGhvcnMgaGF2ZSBhbHJlYWR5IGFncmVlZAorIyArdG8gdGhlIGV4Y2Vw
dGlvbi4KKyMgKworIyArICBJbiBhZGRpdGlvbiwgYXMgYSBzcGVjaWFsIGV4Y2VwdGlvbiwgT3Bl
blZQTiBJbmMgYW5kIHRoZQorIyArICBjb250cmlidXRvcnMgZ2l2ZSBwZXJtaXNzaW9uIHRvIGxp
bmsgdGhlIGNvZGUgb2YgdGhpcyBwcm9ncmFtIHRvCisjICsgIGxpYnJhcmllcyAodGhlICJMaWJy
YXJpZXMiKSBsaWNlbnNlZCB1bmRlciB0aGUgQXBhY2hlIExpY2Vuc2UKKyMgKyAgdmVyc2lvbiAy
LjAgKHRoaXMgd29yayBhbmQgYW55IGxpbmtlZCBsaWJyYXJ5IHRoZSAiQ29tYmluZWQgV29yayIp
CisjICsgIGFuZCBjb3B5IGFuZCBkaXN0cmlidXRlIHRoZSBDb21iaW5lZCBXb3JrIHdpdGhvdXQg
YW4gb2JsaWdhdGlvbiB0bworIyArICBsaWNlbnNlIHRoZSBMaWJyYXJpZXMgdW5kZXIgdGhlIEdO
VSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIHYyCisjICsgIChHUEwtMi4wKSBhcyByZXF1aXJlZCBi
eSBTZWN0aW9uIDIgb2YgdGhlIEdQTC0yLjAsIGFuZCB3aXRob3V0IGFuCisjICsgIG9ibGlnYXRp
b24gdG8gcmVmcmFpbiBmcm9tIGltcG9zaW5nIGFueSBhZGRpdGlvbmFsIHJlc3RyaWN0aW9ucyBp
bgorIyArICB0aGUgQXBhY2hlIExpY2Vuc2UgdmVyc2lvbiAyIHRoYXQgYXJlIG5vdCBpbiB0aGUg
R1BMLTIuMCwgYXMKKyMgKyAgcmVxdWlyZWQgYnkgU2VjdGlvbiA2IG9mIHRoZSBHUEwtMi4wLiAg
WW91IG11c3QgY29tcGx5IHdpdGggdGhlCisjICsgIEdQTC0yLjAgaW4gYWxsIG90aGVyIHJlc3Bl
Y3RzIGZvciB0aGUgQ29tYmluZWQgV29yaywgaW5jbHVkaW5nCisjICsgIHRoZSBvYmxpZ2F0aW9u
IHRvIHByb3ZpZGUgc291cmNlIGNvZGUuICBJZiB5b3UgbW9kaWZ5IHRoaXMgZmlsZSwgeW91Cisj
ICsgIG1heSBleHRlbmQgdGhpcyBleGNlcHRpb24gdG8geW91ciB2ZXJzaW9uIG9mIHRoZSBmaWxl
LCBidXQgeW91IGFyZQorIyArICBub3Qgb2JsaWdhdGVkIHRvIGRvIHNvLiAgSWYgeW91IGRvIG5v
dCB3aXNoIHRvIGRvIHNvLCBkZWxldGUgdGhpcworIyArICBleGNlcHRpb24gc3RhdGVtZW50IGZy
b20geW91ciB2ZXJzaW9uLgorIyArCisjICtGb3IgYmV0dGVyIHVuZGVyc3RhbmRpbmcsIGluIHBs
YWluIG5vbi1sZWdhbGVzZSBFbmdsaXNoIHRoaXMgYmFzaWNhbGx5IHNheXM6CisjICsKKyMgKyAq
IFRoZSBpbnRlbnRpb24gZm9yIHRoaXMgbGljZW5zZSBleGNlcHRpb24gaXMgdG8gYWxsb3cgT3Bl
blZQTiB0byBiZQorIyArICAgbGlua2VkIGFnYWluc3QgQVBMLTIgbGljZW5zZWQgbGlicmFyaWVz
LCBldmVuIHdoZXJlIHRoZSBHUEwtMi4wIGFuZAorIyArICAgQVBMLTIgbGljZW5zZXMgY29uZmxp
Y3QgZnJvbSBhIGxlZ2FsIHBlcnNwZWN0aXZlLgorIyArCisjICsgKiBPcGVuVlBOIGl0c2VsZiB3
aWxsIHN0YXkgR1BMLTIuMCBhbmQgdGhlIGNvZGUgYmVsb25naW5nIHRvIHRoZQorIyArICAgT3Bl
blZQTiBwcm9qZWN0IG11c3QgY29tcGx5IHRvIHRoZSBHUEwtMi4wIGxpY2Vuc2UuICBUaGlzIGlz
IE5PVAorIyArICAgZHVhbC1saWNlbnNpbmcgb2YgdGhlIE9wZW5WUE4gY29kZSBiYXNlLgorIyAr
CisjICsgKiBUaGlzIGxpY2Vuc2UgZXhjZXB0aW9uIERPRVMgTk9UIHJlcXVpcmUgTk9SIGV4cGVj
dCBhIGxpY2Vuc2UgY2hhbmdlCisjICsgICBvZiB0aGUgQVBMLTIgYmFzZWQgbGlicmFyeS4gIFRo
aXMgZXhjZXB0aW9uIGFsbG93cyB1c2luZyB0aGUgQVBMLTIKKyMgKyAgIGxpYnJhcnkgYXMtaXMu
ICBIb3dldmVyLCB3aGVuIGRpc3RyaWJ1dGluZyBhIGNvbXBpbGVkIE9wZW5WUE4gYmluYXJ5Cisj
ICsgICBsaW5raW5nIGFnYWluc3QgQVBMLTIgbGlicmFyaWVzICgiQ29tYmluZWQgV29yayIpLCB0
aGUgUkVRVUlSRU1FTlQgaXMKKyMgKyAgIHRoYXQgdGhlIEFQTC0yIGxpYnJhcnkgTVVTVCBhbHNv
IGJlIGF2YWlsYWJsZSBvbiBzaW1pbGFyIHRlcm1zIGFzIGluCisjICsgICBHUEwtMi4wLCBsaWtl
IHByb3ZpZGluZyB0aGUgc291cmNlIGNvZGUgb2YgdGhlIGxpYnJhcnkgdXBvbiByZXF1ZXN0LAor
IyArICAgZXhjZXB0IGluIHRoZSB0d28gc3BlY2lmaWMgd2F5cyBtZW50aW9uZWQuCisjICsKKyMg
KyAqIElmIHRoZSBBUEwtMiBiYXNlZCBsaWJyYXJ5IGZvcmJpZHMgc3VjaCBsaW5raW5nIGFuZCBk
aXN0cmlidXRpb24sCisjICsgICB0aGlzIGxpY2Vuc2UgZXhjZXB0aW9uIERPRVMgTk9UIG92ZXJy
dWxlIHRoZSByZXN0cmljdGlvbiBvZiB0aGUgQVBMLTIKKyMgKyAgIGJhc2VkIGxpYnJhcnkuICBJ
ZiB0aGUgQVBMLTIgbGlicmFyeSBjYW5ub3Qgc2F0aXNmeSB0aGUgcmVxdWlyZW1lbnRzCisjICsg
ICBpbiB0aGlzIGxpY2Vuc2UgZXhjZXB0aW9uLCB5b3UgQ0FOTk9UIGRpc3RyaWJ1dGUgYW4gT3Bl
blZQTiBiaW5hcnkKKyMgKyAgIGxpbmtlZCB3aXRoIHRoaXMgbGlicmFyeS4KKyMgIAorIyAgTFpP
IGxpY2Vuc2U6CisjICAtLS0tLS0tLS0tLS0KKyMgCisjCisKIFNVTU1BUlkgPSAiQSBmdWxsLWZl
YXR1cmVkIFNTTCBWUE4gc29sdXRpb24gdmlhIHR1biBkZXZpY2UuIgogSE9NRVBBR0UgPSAiaHR0
cHM6Ly9vcGVudnBuLm5ldC8iCiBTRUNUSU9OID0gIm5ldCIKIExJQ0VOU0UgPSAiR1BMLTIuMC1v
bmx5IgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9MzE3MGU5ODJiYWFl
NjFkYmI4ZGU5NjMzMTdkMWFjOTQiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5H
O21kNT1kOGQzNGNlNjM5MDU1MjY3NmU0Y2U4Mjc5ZjEzYzQ4YSIKIERFUEVORFMgPSAibHpvIGx6
NCBvcGVuc3NsIGlwcm91dGUyIGxpYmNhcC1uZyAke0BiYi51dGlscy5jb250YWlucygnRElTVFJP
X0ZFQVRVUkVTJywgJ3BhbScsICdsaWJwYW0nLCAnJywgZCl9IgogCiBpbmhlcml0IGF1dG90b29s
cyBzeXN0ZW1kIHVwZGF0ZS1yYy5kIHBrZ2NvbmZpZwpAQCAtMTQsNyArODEsNyBAQCBTUkNfVVJJ
ID0gImh0dHA6Ly9zd3VwZGF0ZS5vcGVudnBuLm9yZy9jb21tdW5pdHkvcmVsZWFzZXMvJHtCUH0u
dGFyLmd6IFwKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vb3BlbnZwbi5uZXQvY29t
bXVuaXR5LWRvd25sb2FkcyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjEzYjIwN2EzNzZkODg4
MDUwN2M3NGZmNzhhYWJjMzc3OGE5ZGE0N2M4OWYxZTI0N2RjZWUzYzcyMzcxMzhmZjYiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiM2IwNzRmMzkyODE4YjMxYWE1MjliODRmNzZlOGI1ZTRhZDAzZmNh
NzY0OTI0ZjQ2ZDkwNmJjZWFhZjQyMTAzNCIKIAogQ1ZFX1NUQVRVU1tDVkUtMjAyMC0yNzU2OV0g
PSAibm90LWFwcGxpY2FibGUtY29uZmlnOiBBcHBsaWVzIG9ubHkgQXZpYXRyaXggT3BlblZQTiBj
bGllbnQsIG5vdCBvcGVudnBuIgogCi0tIAoyLjM5LjIKCg==

--===============2344925206383439294==--

