Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C47C001B2
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 03:13:04 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.3435.1699067576334738073
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 20:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PSlzcwX7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kgkCbGxb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b9851b9cd-f491bc13-b152-43cc-9a26-b6eea51d7739-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699067574;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/C03fJeYfBaJYh6G6uVkH1nSZwil5R2Txhod/WE1nUk=;
	b=PSlzcwX7YCvI+MKtGyZSF/yF5iakOY0vNzM8EWedLKZqgSQoL2lP119dPLNWq3o/
	kF08Cn2LDA/wGrHDE92oKL8h0HCS4NJalMrmr+eGLxJTmuwUeENhbxngtMIDu460l73
	Z0Nn50fJQrWM8Ax76sjpgkoPw3i2y+da/Lhu4S0g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699067574;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/C03fJeYfBaJYh6G6uVkH1nSZwil5R2Txhod/WE1nUk=;
	b=kgkCbGxbV5+mTVugMbahRHvKfIlG6CHI8yJjUK6sjiQtpAgj7B5XJPepSx3ECASd
	DNdPwSCloBp76onG2OmqMic2HlLhpjVHHyao0NsHQRUhbqoSpxzwk3borhhueuW00wx
	N99l8YEN3ibEFxVd7qjJNB8IxoVKa3JLriLp2B2E=
Content-Type: multipart/mixed; boundary="===============4079209012712970327=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-scapy: upgrading to
 0474c37bf1d147c969173d52ab3ac76d2404d981 SUCCEEDED
Message-ID: <0101018b9851b9cd-f491bc13-b152-43cc-9a26-b6eea51d7739-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 03:12:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 03:13:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106229

--===============4079209012712970327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-scapy* to *0474c37bf1d147c969173d52ab3ac76d2404d981* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-scapy-upgrade-to-latest-revision.patch
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
From 85217237eb81311fe08a5238e37216b01beb3ae3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 02:52:43 +0000
Subject: [PATCH] python3-scapy: upgrade to latest revision

---
 meta-networking/recipes-devtools/python/python3-scapy_2.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-devtools/python/python3-scapy_2.5.0.bb b/meta-networking/recipes-devtools/python/python3-scapy_2.5.0.bb
index cc3f2ee1d..4858e4e57 100644
--- a/meta-networking/recipes-devtools/python/python3-scapy_2.5.0.bb
+++ b/meta-networking/recipes-devtools/python/python3-scapy_2.5.0.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 # If you want ptest support, use the git repo
 # UTscapy does not exist in the pypi pkg
 #
-SRCREV = "9473f77d8b548c8e478e52838bdd4c12f5d4f4ff"
+SRCREV = "0474c37bf1d147c969173d52ab3ac76d2404d981"
 SRC_URI = "git://github.com/secdev/scapy.git;branch=master;protocol=https \
            file://run-ptest"
 
-- 
2.39.2


--===============4079209012712970327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-scapy/python3-scapy-doc: PKGSIZE changed from 5270 to 0 (-100%)
packages/core2-64-poky-linux/python3-scapy/python3-scapy-doc: FILELIST: removed all items "/usr/share/man/man1/scapy.1"
packages/core2-64-poky-linux/python3-scapy/python3-scapy-ptest: PKGSIZE changed from 198610 to 208015 (+5%)
packages/core2-64-poky-linux/python3-scapy/python3-scapy: PKGSIZE changed from 15271381 to 15399929 (+1%)
packages/core2-64-poky-linux/python3-scapy/python3-scapy: FILELIST: directory renamed /usr/lib/python3.11/site-packages/scapy-2.5.0.dist-info -> /usr/lib/python3.11/site-packages/scapy-2.5.0.dev183.dist-info, removed "/usr/lib/python3.11/site-packages/scapy/contrib/ubberlogger.py /usr/lib/python3.11/site-packages/test/tls/example_client.py /usr/lib/python3.11/site-packages/test/testsocket.py /usr/lib/python3.11/site-packages/test/tls/example_server.py /usr/lib/python3.11/site-packages/scapy/contrib/wpa_eapol.py /usr/lib/python3.11/site-packages/scapy/contrib/__pycache__/ubberlogger.cpython-311.pyc /usr/lib/python3.11/site-packages/test/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/test/tls/__pycache__/example_client.cpython-311.pyc /usr/lib/python3.11/site-packages/scapy/contrib/__pycache__/spbm.cpython-311.pyc /usr/lib/python3.11/site-packages/scapy/libs/__pycache__/six.cpython-311.pyc /usr/lib/python3.11/site-packages/test/__pycache__/testsocket.cpython-311
 .pyc /usr/lib/python3.11/site-packages/test/__init__.py /usr/lib/python3.11/site-packages/scapy/contrib/spbm.py /usr/lib/python3.11/site-packages/test/tls/__pycache__/example_server.cpython-311.pyc /usr/lib/python3.11/site-packages/scapy/libs/six.py /usr/lib/python3.11/site-packages/test/tls/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/test/tls/__init__.py /usr/lib/python3.11/site-packages/scapy/contrib/__pycache__/wpa_eapol.cpython-311.pyc", added "/usr/lib/python3.11/site-packages/scapy/contrib/__pycache__/nrf_sniffer.cpython-311.pyc /usr/lib/python3.11/site-packages/scapy/contrib/automotive/autosar/__pycache__/pdu.cpython-311.pyc /usr/lib/python3.11/site-packages/scapy/contrib/__pycache__/hicp.cpython-311.pyc /usr/lib/python3.11/site-packages/scapy/contrib/automotive/autosar/__init__.py /usr/lib/python3.11/site-packages/scapy/libs/__pycache__/extcap.cpython-311.pyc /usr/lib/python3.11/site-packages/scapy/contrib/nrf_sniffer.py /usr/lib/python3.11/site-pa
 ckages/scapy/libs/extcap.py /usr/lib/python3.11/site-packages/scapy/contrib/hicp.py /usr/lib/python3.11/site-packages/scapy/contrib/automotive/autosar/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/scapy/contrib/automotive/autosar/pdu.py"
Changes to packages/core2-64-poky-linux/python3-scapy (sysroot):
  /usr/lib/python3.11/site-packages/scapy-2.5.0.dev183.dist-info was added
  /usr/lib/python3.11/site-packages/scapy-2.5.0.dev183.dist-info/entry_points.txt was added
  /usr/lib/python3.11/site-packages/scapy-2.5.0.dev183.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/scapy-2.5.0.dev183.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/scapy-2.5.0.dev183.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/scapy-2.5.0.dev183.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/scapy-2.5.0.dev183.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/scapy/contrib/automotive/autosar was added
  /usr/lib/python3.11/site-packages/scapy/contrib/automotive/autosar/__init__.py was added
  /usr/lib/python3.11/site-packages/scapy/contrib/automotive/autosar/pdu.py was added
  /usr/lib/python3.11/site-packages/scapy/contrib/automotive/autosar/__pycache__ was added
  /usr/lib/python3.11/site-packages/scapy/contrib/automotive/autosar/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/scapy/contrib/automotive/autosar/__pycache__/pdu.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/scapy/contrib/hicp.py was added
  /usr/lib/python3.11/site-packages/scapy/contrib/nrf_sniffer.py was added
  /usr/lib/python3.11/site-packages/scapy/contrib/__pycache__/hicp.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/scapy/contrib/__pycache__/nrf_sniffer.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/scapy/libs/extcap.py was added
  /usr/lib/python3.11/site-packages/scapy/libs/__pycache__/extcap.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/scapy-2.5.0.dist-info was removed
  /usr/lib/python3.11/site-packages/scapy-2.5.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.11/site-packages/scapy-2.5.0.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/scapy-2.5.0.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/scapy-2.5.0.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/scapy-2.5.0.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/scapy-2.5.0.dist-info/WHEEL was removed
  /usr/lib/python3.11/site-packages/scapy/contrib/__pycache__/spbm.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/scapy/contrib/__pycache__/ubberlogger.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/scapy/contrib/__pycache__/wpa_eapol.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/scapy/contrib/spbm.py was removed
  /usr/lib/python3.11/site-packages/scapy/contrib/ubberlogger.py was removed
  /usr/lib/python3.11/site-packages/scapy/contrib/wpa_eapol.py was removed
  /usr/lib/python3.11/site-packages/scapy/libs/__pycache__/six.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/scapy/libs/six.py was removed
  /usr/lib/python3.11/site-packages/test was removed
  /usr/lib/python3.11/site-packages/test/__init__.py was removed
  /usr/lib/python3.11/site-packages/test/__pycache__ was removed
  /usr/lib/python3.11/site-packages/test/__pycache__/__init__.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/test/__pycache__/testsocket.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/test/testsocket.py was removed
  /usr/lib/python3.11/site-packages/test/tls was removed
  /usr/lib/python3.11/site-packages/test/tls/example_client.py was removed
  /usr/lib/python3.11/site-packages/test/tls/example_server.py was removed
  /usr/lib/python3.11/site-packages/test/tls/__init__.py was removed
  /usr/lib/python3.11/site-packages/test/tls/__pycache__ was removed
  /usr/lib/python3.11/site-packages/test/tls/__pycache__/example_client.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/test/tls/__pycache__/example_server.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/test/tls/__pycache__/__init__.cpython-311.pyc was removed
  /usr/share was removed

--===============4079209012712970327==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-scapy-upgrade-to-latest-revision.patch"

RnJvbSA4NTIxNzIzN2ViODEzMTFmZTA4YTUyMzhlMzcyMTZiMDFiZWIzYWUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMjo1Mjo0MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2NhcHk6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEtbmV0d29y
a2luZy9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNjYXB5XzIuNS4wLmJiIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2Nh
cHlfMi41LjAuYmIgYi9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1zY2FweV8yLjUuMC5iYgppbmRleCBjYzNmMmVlMWQuLjQ4NThlNGU1NyAxMDA2NDQKLS0t
IGEvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2NhcHlf
Mi41LjAuYmIKKysrIGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtc2NhcHlfMi41LjAuYmIKQEAgLTE2LDcgKzE2LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vTElDRU5TRTttZDU9YjIzNGVlNGQ2OWY1ZmNlNDQ4NmE4MGZkYWY0YTQyNjMiCiAj
IElmIHlvdSB3YW50IHB0ZXN0IHN1cHBvcnQsIHVzZSB0aGUgZ2l0IHJlcG8KICMgVVRzY2FweSBk
b2VzIG5vdCBleGlzdCBpbiB0aGUgcHlwaSBwa2cKICMKLVNSQ1JFViA9ICI5NDczZjc3ZDhiNTQ4
YzhlNDc4ZTUyODM4YmRkNGMxMmY1ZDRmNGZmIgorU1JDUkVWID0gIjA0NzRjMzdiZjFkMTQ3Yzk2
OTE3M2Q1MmFiM2FjNzZkMjQwNGQ5ODEiCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vc2Vj
ZGV2L3NjYXB5LmdpdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwKICAgICAgICAgICAg
ZmlsZTovL3J1bi1wdGVzdCIKIAotLSAKMi4zOS4yCgo=

--===============4079209012712970327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-scapy/python3-scapy-doc: PKGSIZE changed from 5270 to 0 (-100%)
packages/core2-64-poky-linux/python3-scapy/python3-scapy-doc: FILELIST: removed all items "/usr/share/man/man1/scapy.1"
packages/core2-64-poky-linux/python3-scapy/python3-scapy: FILELIST: directory renamed /usr/lib/python3.11/site-packages/scapy-2.5.0.dist-info -> /usr/lib/python3.11/site-packages/scapy-2.5.0.dev183.dist-info, removed "/usr/lib/python3.11/site-packages/scapy/contrib/__pycache__/ubberlogger.cpython-311.pyc /usr/lib/python3.11/site-packages/test/tls/__pycache__/example_client.cpython-311.pyc /usr/lib/python3.11/site-packages/test/tls/__pycache__/example_server.cpython-311.pyc /usr/lib/python3.11/site-packages/test/tls/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/scapy/contrib/ubberlogger.py /usr/lib/python3.11/site-packages/test/testsocket.py /usr/lib/python3.11/site-packages/scapy/contrib/__pycache__/spbm.cpython-311.pyc /usr/lib/python3.11/site-packages/test/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/test/tls/example_client.py /usr/lib/python3.11/site-packages/scapy/libs/six.py /usr/lib/python3.11/site-packages/test/tls/example_ser
 ver.py /usr/lib/python3.11/site-packages/scapy/contrib/__pycache__/wpa_eapol.cpython-311.pyc /usr/lib/python3.11/site-packages/test/tls/__init__.py /usr/lib/python3.11/site-packages/scapy/contrib/wpa_eapol.py /usr/lib/python3.11/site-packages/scapy/contrib/spbm.py /usr/lib/python3.11/site-packages/scapy/libs/__pycache__/six.cpython-311.pyc /usr/lib/python3.11/site-packages/test/__init__.py /usr/lib/python3.11/site-packages/test/__pycache__/testsocket.cpython-311.pyc", added "/usr/lib/python3.11/site-packages/scapy/contrib/__pycache__/nrf_sniffer.cpython-311.pyc /usr/lib/python3.11/site-packages/scapy/contrib/automotive/autosar/__pycache__/pdu.cpython-311.pyc /usr/lib/python3.11/site-packages/scapy/contrib/hicp.py /usr/lib/python3.11/site-packages/scapy/contrib/__pycache__/hicp.cpython-311.pyc /usr/lib/python3.11/site-packages/scapy/contrib/automotive/autosar/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/scapy/contrib/nrf_sniffer.py /usr/lib/python3.11/site-p
 ackages/scapy/libs/__pycache__/extcap.cpython-311.pyc /usr/lib/python3.11/site-packages/scapy/libs/extcap.py /usr/lib/python3.11/site-packages/scapy/contrib/automotive/autosar/__init__.py /usr/lib/python3.11/site-packages/scapy/contrib/automotive/autosar/pdu.py"
Changes to packages/core2-64-poky-linux/python3-scapy (sysroot):
  /usr/lib/python3.11/site-packages/scapy-2.5.0.dev183.dist-info was added
  /usr/lib/python3.11/site-packages/scapy-2.5.0.dev183.dist-info/entry_points.txt was added
  /usr/lib/python3.11/site-packages/scapy-2.5.0.dev183.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/scapy-2.5.0.dev183.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/scapy-2.5.0.dev183.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/scapy-2.5.0.dev183.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/scapy-2.5.0.dev183.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/scapy/contrib/automotive/autosar was added
  /usr/lib/python3.11/site-packages/scapy/contrib/automotive/autosar/__init__.py was added
  /usr/lib/python3.11/site-packages/scapy/contrib/automotive/autosar/pdu.py was added
  /usr/lib/python3.11/site-packages/scapy/contrib/automotive/autosar/__pycache__ was added
  /usr/lib/python3.11/site-packages/scapy/contrib/automotive/autosar/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/scapy/contrib/automotive/autosar/__pycache__/pdu.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/scapy/contrib/hicp.py was added
  /usr/lib/python3.11/site-packages/scapy/contrib/nrf_sniffer.py was added
  /usr/lib/python3.11/site-packages/scapy/contrib/__pycache__/hicp.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/scapy/contrib/__pycache__/nrf_sniffer.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/scapy/libs/extcap.py was added
  /usr/lib/python3.11/site-packages/scapy/libs/__pycache__/extcap.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/scapy-2.5.0.dist-info was removed
  /usr/lib/python3.11/site-packages/scapy-2.5.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.11/site-packages/scapy-2.5.0.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/scapy-2.5.0.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/scapy-2.5.0.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/scapy-2.5.0.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/scapy-2.5.0.dist-info/WHEEL was removed
  /usr/lib/python3.11/site-packages/scapy/contrib/__pycache__/spbm.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/scapy/contrib/__pycache__/ubberlogger.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/scapy/contrib/__pycache__/wpa_eapol.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/scapy/contrib/spbm.py was removed
  /usr/lib/python3.11/site-packages/scapy/contrib/ubberlogger.py was removed
  /usr/lib/python3.11/site-packages/scapy/contrib/wpa_eapol.py was removed
  /usr/lib/python3.11/site-packages/scapy/libs/__pycache__/six.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/scapy/libs/six.py was removed
  /usr/lib/python3.11/site-packages/test was removed
  /usr/lib/python3.11/site-packages/test/__init__.py was removed
  /usr/lib/python3.11/site-packages/test/__pycache__ was removed
  /usr/lib/python3.11/site-packages/test/__pycache__/__init__.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/test/__pycache__/testsocket.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/test/testsocket.py was removed
  /usr/lib/python3.11/site-packages/test/tls was removed
  /usr/lib/python3.11/site-packages/test/tls/example_client.py was removed
  /usr/lib/python3.11/site-packages/test/tls/example_server.py was removed
  /usr/lib/python3.11/site-packages/test/tls/__init__.py was removed
  /usr/lib/python3.11/site-packages/test/tls/__pycache__ was removed
  /usr/lib/python3.11/site-packages/test/tls/__pycache__/example_client.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/test/tls/__pycache__/example_server.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/test/tls/__pycache__/__init__.cpython-311.pyc was removed
  /usr/share was removed

--===============4079209012712970327==--

