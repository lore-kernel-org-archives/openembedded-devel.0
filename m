Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A1FC00A5A
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:19 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.2207.1699061895191307959
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=B6YrMvwc;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Z/MgQ8+k;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018b97fb1a07-b6f4938c-3f42-4149-8f4a-bf6faa329a7b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061897;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=p0WJbIl+QXDGhiLdRZFBDUJvxnjEwO2pJzvvniXDJ/Q=;
	b=B6YrMvwcJlmmXJ2P0x6iIpEZdqWD+yuuU2JvO+5gBAjmGkusV9vblg50aF4yhxIZ
	QF/iXDjHSnghGhvGvCy8LIFl1bP9/CC4roG04WlLr5Q6CX7N+Qu2Gb/UVo5x/DSTyiq
	FY6myyhzSdBRxoB1gSf264lm2w6+gXCEvVuTtcjU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061897;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=p0WJbIl+QXDGhiLdRZFBDUJvxnjEwO2pJzvvniXDJ/Q=;
	b=Z/MgQ8+kigSDKldSdfz+PjiqiZ+uMJ2GIUw2GJe6AdI7cES3xrclE1WXlgtY4Z96
	E3b5XjzNOemZ8+ppM4oG/R14mCtGvxGu/XRTwjc0lZRzkq44yWKD2vnB7ADBUXmjwy1
	M3NCR7kNhneADDTJCDSikvs9D+Hokw8VhSfSwAoY=
Content-Type: multipart/mixed; boundary="===============8632905337350292449=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-sqlalchemy: upgrading to 2.0.23 SUCCEEDED
Message-ID: <0101018b97fb1a07-b6f4938c-3f42-4149-8f4a-bf6faa329a7b-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:17 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106167

--===============8632905337350292449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sqlalchemy* to *2.0.23* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sqlalchemy-upgrade-2.0.22-2.0.23.patch
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
From 46e2db0ea5dc0f514f98f443f468844c5876550a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 00:43:06 +0000
Subject: [PATCH] python3-sqlalchemy: upgrade 2.0.22 -> 2.0.23

---
 ...ython3-sqlalchemy_2.0.22.bb => python3-sqlalchemy_2.0.23.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.22.bb => python3-sqlalchemy_2.0.23.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.22.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.23.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.22.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.23.bb
index 59ac0ecc7..ce216b016 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.22.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.23.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b707d50badb798e1d897f2c8f649382d"
 
-SRC_URI[sha256sum] = "5434cc601aa17570d79e5377f5fd45ff92f9379e2abed0be5e8c2fba8d353d2b"
+SRC_URI[sha256sum] = "c1bda93cbbe4aa2aa0aa8655c5aeda505cd219ff3e8da91d1d329e143e4aff69"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.39.2


--===============8632905337350292449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-sqlalchemy: PV changed from "2.0.22" to "2.0.23"
packages/core2-64-poky-linux/python3-sqlalchemy: SRC_URI changed from "https://files.pythonhosted.org/packages/source/S/SQLAlchemy/SQLAlchemy-2.0.22.tar.gz;downloadfilename=SQLAlchemy-2.0.22.tar.gz" to "https://files.pythonhosted.org/packages/source/S/SQLAlchemy/SQLAlchemy-2.0.23.tar.gz;downloadfilename=SQLAlchemy-2.0.23.tar.gz"
packages/core2-64-poky-linux/python3-sqlalchemy: PKGV changed from 2.0.22 [default] to 2.0.23 [default]
packages/core2-64-poky-linux/python3-sqlalchemy/python3-sqlalchemy-dbg: PV changed from "2.0.22" to "2.0.23"
packages/core2-64-poky-linux/python3-sqlalchemy/python3-sqlalchemy-dbg: PKGV changed from 2.0.22 [default] to 2.0.23 [default]
packages/core2-64-poky-linux/python3-sqlalchemy/python3-sqlalchemy-dev: PV changed from "2.0.22" to "2.0.23"
packages/core2-64-poky-linux/python3-sqlalchemy/python3-sqlalchemy-dev: PKGV changed from 2.0.22 [default] to 2.0.23 [default]
packages/core2-64-poky-linux/python3-sqlalchemy/python3-sqlalchemy-doc: PV changed from "2.0.22" to "2.0.23"
packages/core2-64-poky-linux/python3-sqlalchemy/python3-sqlalchemy-doc: PKGV changed from 2.0.22 [default] to 2.0.23 [default]
packages/core2-64-poky-linux/python3-sqlalchemy/python3-sqlalchemy-locale: PV changed from "2.0.22" to "2.0.23"
packages/core2-64-poky-linux/python3-sqlalchemy/python3-sqlalchemy-locale: PKGV changed from 2.0.22 [default] to 2.0.23 [default]
packages/core2-64-poky-linux/python3-sqlalchemy/python3-sqlalchemy-src: PV changed from "2.0.22" to "2.0.23"
packages/core2-64-poky-linux/python3-sqlalchemy/python3-sqlalchemy-src: PKGV changed from 2.0.22 [default] to 2.0.23 [default]
packages/core2-64-poky-linux/python3-sqlalchemy/python3-sqlalchemy-staticdev: PV changed from "2.0.22" to "2.0.23"
packages/core2-64-poky-linux/python3-sqlalchemy/python3-sqlalchemy-staticdev: PKGV changed from 2.0.22 [default] to 2.0.23 [default]
packages/core2-64-poky-linux/python3-sqlalchemy/python3-sqlalchemy: PKGSIZE changed from 17063984 to 17135756 (+0%)
packages/core2-64-poky-linux/python3-sqlalchemy/python3-sqlalchemy: PV changed from "2.0.22" to "2.0.23"
packages/core2-64-poky-linux/python3-sqlalchemy/python3-sqlalchemy: PKGV changed from 2.0.22 [default] to 2.0.23 [default]
packages/core2-64-poky-linux/python3-sqlalchemy/python3-sqlalchemy: FILELIST: directory renamed /usr/lib/python3.11/site-packages/SQLAlchemy-2.0.22.dist-info -> /usr/lib/python3.11/site-packages/SQLAlchemy-2.0.23.dist-info, added "/usr/lib/python3.11/site-packages/sqlalchemy/connectors/__pycache__/aioodbc.cpython-311.pyc /usr/lib/python3.11/site-packages/sqlalchemy/connectors/asyncio.py /usr/lib/python3.11/site-packages/sqlalchemy/connectors/aioodbc.py /usr/lib/python3.11/site-packages/sqlalchemy/dialects/mssql/__pycache__/aioodbc.cpython-311.pyc /usr/lib/python3.11/site-packages/sqlalchemy/dialects/mssql/aioodbc.py /usr/lib/python3.11/site-packages/sqlalchemy/connectors/__pycache__/asyncio.cpython-311.pyc"
Changes to packages/core2-64-poky-linux/python3-sqlalchemy (sysroot):
  /usr/lib/python3.11/site-packages/SQLAlchemy-2.0.22.dist-info moved to /usr/lib/python3.11/site-packages/SQLAlchemy-2.0.23.dist-info
  /usr/lib/python3.11/site-packages/sqlalchemy/connectors/aioodbc.py was added
  /usr/lib/python3.11/site-packages/sqlalchemy/connectors/asyncio.py was added
  /usr/lib/python3.11/site-packages/sqlalchemy/connectors/__pycache__/aioodbc.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/sqlalchemy/connectors/__pycache__/asyncio.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/sqlalchemy/dialects/mssql/aioodbc.py was added
  /usr/lib/python3.11/site-packages/sqlalchemy/dialects/mssql/__pycache__/aioodbc.cpython-311.pyc was added

--===============8632905337350292449==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sqlalchemy-upgrade-2.0.22-2.0.23.patch"

RnJvbSA0NmUyZGIwZWE1ZGMwZjUxNGY5OGY0NDNmNDY4ODQ0YzU4NzY1NTBhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMDo0MzowNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc3FsYWxjaGVteTogdXBncmFkZSAyLjAuMjIgLT4gMi4wLjIzCgotLS0KIC4uLnl0aG9u
My1zcWxhbGNoZW15XzIuMC4yMi5iYiA9PiBweXRob24zLXNxbGFsY2hlbXlfMi4wLjIzLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXNxbGFsY2hl
bXlfMi4wLjIyLmJiID0+IHB5dGhvbjMtc3FsYWxjaGVteV8yLjAuMjMuYmJ9ICg4NyUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcWxh
bGNoZW15XzIuMC4yMi5iYiBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtc3FsYWxjaGVteV8yLjAuMjMuYmIKc2ltaWxhcml0eSBpbmRleCA4NyUKcmVuYW1lIGZy
b20gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcWxhbGNoZW15
XzIuMC4yMi5iYgpyZW5hbWUgdG8gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1zcWxhbGNoZW15XzIuMC4yMy5iYgppbmRleCA1OWFjMGVjYzcuLmNlMjE2YjAxNiAx
MDA2NDQKLS0tIGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1z
cWxhbGNoZW15XzIuMC4yMi5iYgorKysgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXNxbGFsY2hlbXlfMi4wLjIzLmJiCkBAIC00LDcgKzQsNyBAQCBIT01FUEFH
RSA9ICJodHRwOi8vd3d3LnNxbGFsY2hlbXkub3JnLyIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YjcwN2Q1MGJhZGI3OThlMWQ4OTdmMmM4
ZjY0OTM4MmQiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1NDM0Y2M2MDFhYTE3NTcwZDc5ZTUz
NzdmNWZkNDVmZjkyZjkzNzllMmFiZWQwYmU1ZThjMmZiYThkMzUzZDJiIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gImMxYmRhOTNjYmJlNGFhMmFhMGFhODY1NWM1YWVkYTUwNWNkMjE5ZmYzZThkYTkx
ZDFkMzI5ZTE0M2U0YWZmNjkiCiAKIFBZUElfUEFDS0FHRSA9ICJTUUxBbGNoZW15IgogaW5oZXJp
dCBweXBpIHNldHVwdG9vbHMzCi0tIAoyLjM5LjIKCg==

--===============8632905337350292449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-sqlalchemy/python3-sqlalchemy: FILELIST: directory renamed /usr/lib/python3.11/site-packages/SQLAlchemy-2.0.22.dist-info -> /usr/lib/python3.11/site-packages/SQLAlchemy-2.0.23.dist-info, added "/usr/lib/python3.11/site-packages/sqlalchemy/dialects/mssql/aioodbc.py /usr/lib/python3.11/site-packages/sqlalchemy/dialects/mssql/__pycache__/aioodbc.cpython-311.pyc /usr/lib/python3.11/site-packages/sqlalchemy/connectors/asyncio.py /usr/lib/python3.11/site-packages/sqlalchemy/connectors/aioodbc.py /usr/lib/python3.11/site-packages/sqlalchemy/connectors/__pycache__/asyncio.cpython-311.pyc /usr/lib/python3.11/site-packages/sqlalchemy/connectors/__pycache__/aioodbc.cpython-311.pyc"
Changes to packages/core2-64-poky-linux/python3-sqlalchemy (sysroot):
  /usr/lib/python3.11/site-packages/SQLAlchemy-2.0.22.dist-info moved to /usr/lib/python3.11/site-packages/SQLAlchemy-2.0.23.dist-info
  /usr/lib/python3.11/site-packages/sqlalchemy/connectors/aioodbc.py was added
  /usr/lib/python3.11/site-packages/sqlalchemy/connectors/asyncio.py was added
  /usr/lib/python3.11/site-packages/sqlalchemy/connectors/__pycache__/aioodbc.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/sqlalchemy/connectors/__pycache__/asyncio.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/sqlalchemy/dialects/mssql/aioodbc.py was added
  /usr/lib/python3.11/site-packages/sqlalchemy/dialects/mssql/__pycache__/aioodbc.cpython-311.pyc was added

--===============8632905337350292449==--

