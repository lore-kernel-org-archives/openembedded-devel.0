Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91606C11F64
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:22 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.2206.1699061895005349776
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eNM1akGl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=k6mZimKL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018b97fb0a79-c1a6d0c9-f056-4148-8562-cef2ed8bf37a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061894;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eDefs0c15qyTMVqRpN1CtfKkQ+k/csFYLuDu7nu5G0E=;
	b=eNM1akGlaK1h97ROcuRbLeg42OHHdFhc+kwWbzOSCt0Zo+2lbaWXxqSa/SvIeF65
	ETRIVxblypESxM5tJrHYKpKZpyjAwGxJny5G6mV5NinVBmA881WYSobUiLiX7+rX7Ca
	mCWOUGJM11A/M0X2fgKzdKK/xlGQuBKNSct/X1KI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061894;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eDefs0c15qyTMVqRpN1CtfKkQ+k/csFYLuDu7nu5G0E=;
	b=k6mZimKLxKbI/iHakuxewwLGhiEagGD8QwYaAoZXcD99fDHgMsVbvct17n7I6nRw
	Qv8iqgFn9IbtE4n0JTIO5+6/bDPB7Peg3VTLmkZMkP34Z/u0EbCdrHZfv9Li2kVwOHP
	DnESgUgAmcdZ1tLvjYGJtuZj7wrXEPK8KD5ZX/ys=
Content-Type: multipart/mixed; boundary="===============7420453382584609210=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-django: upgrading to 4.2.7 FAILED
Message-ID: <0101018b97fb0a79-c1a6d0c9-f056-4148-8562-cef2ed8bf37a-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106113

--===============7420453382584609210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-django* to *4.2.7* has Failed(other errors).

Detailed error information:

Failed(unknown error)
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh-meta-oe/build/build/../auto-upgrade-helper/upgrade-helper.py", line 497, in run
    step(self.devtool, self.bb, self.git, self.opts, pkg_ctx)
  File "/home/pokybuild/yocto-worker/auh-meta-oe/build/auto-upgrade-helper/modules/steps.py", line 39, in load_env
    os.mkdir(pkg_ctx['workdir'])
FileExistsError: [Errno 17] File exists: '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/upgrade-helper/meta-python/20231103194759/all/python3-django'




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 09861b7fb8685ca73d37ff3d46732abd4cc223bb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 20:44:23 +0000
Subject: [PATCH] python3-django: upgrade 4.2.3 -> 4.2.7

---
 .../python/{python3-django_4.2.3.bb => python3-django_4.2.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.3.bb => python3-django_4.2.7.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.3.bb b/meta-python/recipes-devtools/python/python3-django_4.2.7.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-django_4.2.3.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.7.bb
index 4e3192744..100db9bd7 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.7.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "45a747e1c5b3d6df1b141b1481e193b033fd1fdbda3ff52677dc81afdaacbaed"
+SRC_URI[sha256sum] = "8e0f1c2c2786b5c0e39fe1afce24c926040fad47c8ea8ad30aaf1188df29fc41"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.39.2


--===============7420453382584609210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-django: SRC_URI changed from "https://files.pythonhosted.org/packages/source/D/Django/Django-4.2.3.tar.gz;downloadfilename=Django-4.2.3.tar.gz" to "https://files.pythonhosted.org/packages/source/D/Django/Django-4.2.7.tar.gz;downloadfilename=Django-4.2.7.tar.gz"
packages/core2-64-poky-linux/python3-django: PV changed from "4.2.3" to "4.2.7"
packages/core2-64-poky-linux/python3-django: PKGV changed from 4.2.3 [default] to 4.2.7 [default]
packages/core2-64-poky-linux/python3-django/python3-django-dbg: PKGV changed from 4.2.3 [default] to 4.2.7 [default]
packages/core2-64-poky-linux/python3-django/python3-django-dbg: PV changed from "4.2.3" to "4.2.7"
packages/core2-64-poky-linux/python3-django/python3-django-dev: PKGV changed from 4.2.3 [default] to 4.2.7 [default]
packages/core2-64-poky-linux/python3-django/python3-django-dev: PV changed from "4.2.3" to "4.2.7"
packages/core2-64-poky-linux/python3-django/python3-django-doc: PKGV changed from 4.2.3 [default] to 4.2.7 [default]
packages/core2-64-poky-linux/python3-django/python3-django-doc: PV changed from "4.2.3" to "4.2.7"
packages/core2-64-poky-linux/python3-django/python3-django-locale: PKGV changed from 4.2.3 [default] to 4.2.7 [default]
packages/core2-64-poky-linux/python3-django/python3-django-locale: PV changed from "4.2.3" to "4.2.7"
packages/core2-64-poky-linux/python3-django/python3-django-src: PKGV changed from 4.2.3 [default] to 4.2.7 [default]
packages/core2-64-poky-linux/python3-django/python3-django-src: PV changed from "4.2.3" to "4.2.7"
packages/core2-64-poky-linux/python3-django/python3-django-staticdev: PKGV changed from 4.2.3 [default] to 4.2.7 [default]
packages/core2-64-poky-linux/python3-django/python3-django-staticdev: PV changed from "4.2.3" to "4.2.7"
packages/core2-64-poky-linux/python3-django/python3-django: PKGSIZE changed from 29433429 to 29443276 (+0%)
packages/core2-64-poky-linux/python3-django/python3-django: PKGV changed from 4.2.3 [default] to 4.2.7 [default]
packages/core2-64-poky-linux/python3-django/python3-django: PV changed from "4.2.3" to "4.2.7"
Changes to packages/core2-64-poky-linux/python3-django (sysroot):
  /usr/lib/python3.11/site-packages/Django-4.2.3.dist-info moved to /usr/lib/python3.11/site-packages/Django-4.2.7.dist-info

--===============7420453382584609210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-django (sysroot):
  /usr/lib/python3.11/site-packages/Django-4.2.3.dist-info moved to /usr/lib/python3.11/site-packages/Django-4.2.7.dist-info

--===============7420453382584609210==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-django-upgrade-4.2.3-4.2.7.patch"

RnJvbSAwOTg2MWI3ZmI4Njg1Y2E3M2QzN2ZmM2Q0NjczMmFiZDRjYzIyM2JiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMDo0NDoyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZGphbmdvOiB1cGdyYWRlIDQuMi4zIC0+IDQuMi43CgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtZGphbmdvXzQuMi4zLmJiID0+IHB5dGhvbjMtZGphbmdvXzQuMi43LmJifSB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWRqYW5nb180LjIuMy5i
YiA9PiBweXRob24zLWRqYW5nb180LjIuNy5iYn0gKDU4JSkKCmRpZmYgLS1naXQgYS9tZXRhLXB5
dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWRqYW5nb180LjIuMy5iYiBiL21l
dGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZGphbmdvXzQuMi43LmJi
CnNpbWlsYXJpdHkgaW5kZXggNTglCnJlbmFtZSBmcm9tIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtZGphbmdvXzQuMi4zLmJiCnJlbmFtZSB0byBtZXRhLXB5dGhv
bi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWRqYW5nb180LjIuNy5iYgppbmRleCA0
ZTMxOTI3NDQuLjEwMGRiOWJkNyAxMDA2NDQKLS0tIGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1kamFuZ29fNC4yLjMuYmIKKysrIGIvbWV0YS1weXRob24vcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kamFuZ29fNC4yLjcuYmIKQEAgLTEsNyArMSw3
IEBACiByZXF1aXJlIHB5dGhvbi1kamFuZ28uaW5jCiBpbmhlcml0IHNldHVwdG9vbHMzCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICI0NWE3NDdlMWM1YjNkNmRmMWIxNDFiMTQ4MWUxOTNiMDMzZmQx
ZmRiZGEzZmY1MjY3N2RjODFhZmRhYWNiYWVkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjhlMGYx
YzJjMjc4NmI1YzBlMzlmZTFhZmNlMjRjOTI2MDQwZmFkNDdjOGVhOGFkMzBhYWYxMTg4ZGYyOWZj
NDEiCiAKIFJERVBFTkRTOiR7UE59ICs9ICJcCiAgICAgJHtQWVRIT05fUE59LXNxbHBhcnNlIFwK
LS0gCjIuMzkuMgoK

--===============7420453382584609210==--

