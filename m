Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB310C04A95
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:19 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.2194.1699061893058992672
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=axchbaTB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=XPWXNK4P;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b97fb1931-b4998496-9671-4926-8fe1-45b867c7b487-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061897;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6AD/tfogOOsLT+qMFOzT3wIEXs9ORjRBD8GWq8AeG/c=;
	b=axchbaTBAsplncFrqOj4L7DZOs5/n3+tJife17lkTNYSB1B5AOj1bFitTa6Al6xM
	2fFq4tosPC8Hv1foIVcL/sODwVjZRuIqbtTVTuV4wGBMXrh7m7r5LeDkIZRg03OaVdz
	vc6kewEV5ewfTR2ZmnJbdG0lar3zBzM+eU7jd2Ao=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061897;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6AD/tfogOOsLT+qMFOzT3wIEXs9ORjRBD8GWq8AeG/c=;
	b=XPWXNK4PyJa98XB+Q5CY6plzW4TXPU3iuZqmxGvy7ezVkyQ1I/AN1yP0aRCbprig
	nkUEmuO90byUcj2YbLQMofL7G8zGJ210mIBwXjZKf1dSKKMcleDqTiOKH8yXP1WMi73
	Fer9U83A/u2DnNvEGMsMecngBADd5dr1EsNuOyNw=
Content-Type: multipart/mixed; boundary="===============7756411944762264635=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-shellingham: upgrading to 1.5.4 SUCCEEDED
Message-ID: <0101018b97fb1931-b4998496-9671-4926-8fe1-45b867c7b487-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:17 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106165

--===============7756411944762264635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-shellingham* to *1.5.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-shellingham-upgrade-1.5.3-1.5.4.patch
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
From a08cfb5573f88d4d984eabfc52c438a64018434e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 00:38:44 +0000
Subject: [PATCH] python3-shellingham: upgrade 1.5.3 -> 1.5.4

---
 ...ython3-shellingham_1.5.3.bb => python3-shellingham_1.5.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-shellingham_1.5.3.bb => python3-shellingham_1.5.4.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-shellingham_1.5.3.bb b/meta-python/recipes-devtools/python/python3-shellingham_1.5.4.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-shellingham_1.5.3.bb
rename to meta-python/recipes-devtools/python/python3-shellingham_1.5.4.bb
index aff5f24a6..e519e8e22 100644
--- a/meta-python/recipes-devtools/python/python3-shellingham_1.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-shellingham_1.5.4.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=78e1c0248051c32a38a7f820c30bd7a5"
 
-SRC_URI[sha256sum] = "cb4a6fec583535bc6da17b647dd2330cf7ef30239e05d547d99ae3705fd0f7f8"
+SRC_URI[sha256sum] = "8dbca0739d487e5bd35ab3ca4b36e11c4078f3a234bfce294b0a0291363404de"
 
 inherit pypi setuptools3
 
-- 
2.39.2


--===============7756411944762264635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-shellingham: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/core2-64-poky-linux/python3-shellingham: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/shellingham/shellingham-1.5.3.tar.gz;downloadfilename=shellingham-1.5.3.tar.gz" to "https://files.pythonhosted.org/packages/source/s/shellingham/shellingham-1.5.4.tar.gz;downloadfilename=shellingham-1.5.4.tar.gz"
packages/core2-64-poky-linux/python3-shellingham: PV changed from "1.5.3" to "1.5.4"
packages/core2-64-poky-linux/python3-shellingham/python3-shellingham-dbg: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/core2-64-poky-linux/python3-shellingham/python3-shellingham-dbg: PV changed from "1.5.3" to "1.5.4"
packages/core2-64-poky-linux/python3-shellingham/python3-shellingham-dev: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/core2-64-poky-linux/python3-shellingham/python3-shellingham-dev: PV changed from "1.5.3" to "1.5.4"
packages/core2-64-poky-linux/python3-shellingham/python3-shellingham-doc: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/core2-64-poky-linux/python3-shellingham/python3-shellingham-doc: PV changed from "1.5.3" to "1.5.4"
packages/core2-64-poky-linux/python3-shellingham/python3-shellingham-locale: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/core2-64-poky-linux/python3-shellingham/python3-shellingham-locale: PV changed from "1.5.3" to "1.5.4"
packages/core2-64-poky-linux/python3-shellingham/python3-shellingham-src: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/core2-64-poky-linux/python3-shellingham/python3-shellingham-src: PV changed from "1.5.3" to "1.5.4"
packages/core2-64-poky-linux/python3-shellingham/python3-shellingham-staticdev: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/core2-64-poky-linux/python3-shellingham/python3-shellingham-staticdev: PV changed from "1.5.3" to "1.5.4"
packages/core2-64-poky-linux/python3-shellingham/python3-shellingham: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/core2-64-poky-linux/python3-shellingham/python3-shellingham: PKGSIZE changed from 39329 to 39388 (+0%)
packages/core2-64-poky-linux/python3-shellingham/python3-shellingham: PV changed from "1.5.3" to "1.5.4"
Changes to packages/core2-64-poky-linux/python3-shellingham (sysroot):
  /usr/lib/python3.11/site-packages/shellingham-1.5.3.dist-info moved to /usr/lib/python3.11/site-packages/shellingham-1.5.4.dist-info

--===============7756411944762264635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-shellingham (sysroot):
  /usr/lib/python3.11/site-packages/shellingham-1.5.3.dist-info moved to /usr/lib/python3.11/site-packages/shellingham-1.5.4.dist-info

--===============7756411944762264635==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-shellingham-upgrade-1.5.3-1.5.4.patch"

RnJvbSBhMDhjZmI1NTczZjg4ZDRkOTg0ZWFiZmM1MmM0MzhhNjQwMTg0MzRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMDozODo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2hlbGxpbmdoYW06IHVwZ3JhZGUgMS41LjMgLT4gMS41LjQKCi0tLQogLi4ueXRob24z
LXNoZWxsaW5naGFtXzEuNS4zLmJiID0+IHB5dGhvbjMtc2hlbGxpbmdoYW1fMS41LjQuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc2hlbGxpbmdo
YW1fMS41LjMuYmIgPT4gcHl0aG9uMy1zaGVsbGluZ2hhbV8xLjUuNC5iYn0gKDcxJSkKCmRpZmYg
LS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNoZWxs
aW5naGFtXzEuNS4zLmJiIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1zaGVsbGluZ2hhbV8xLjUuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDcxJQpyZW5hbWUgZnJv
bSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNoZWxsaW5naGFt
XzEuNS4zLmJiCnJlbmFtZSB0byBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXNoZWxsaW5naGFtXzEuNS40LmJiCmluZGV4IGFmZjVmMjRhNi4uZTUxOWU4ZTIyIDEw
MDY0NAotLS0gYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNo
ZWxsaW5naGFtXzEuNS4zLmJiCisrKyBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtc2hlbGxpbmdoYW1fMS41LjQuYmIKQEAgLTMsNyArMyw3IEBAIFNFQ1RJT04g
PSAiZGV2ZWwvcHl0aG9uIgogTElDRU5TRSA9ICJJU0MiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9MSUNFTlNFO21kNT03OGUxYzAyNDgwNTFjMzJhMzhhN2Y4MjBjMzBiZDdhNSIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gImNiNGE2ZmVjNTgzNTM1YmM2ZGExN2I2NDdkZDIzMzBjZjdlZjMw
MjM5ZTA1ZDU0N2Q5OWFlMzcwNWZkMGY3ZjgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGRiY2Ew
NzM5ZDQ4N2U1YmQzNWFiM2NhNGIzNmUxMWM0MDc4ZjNhMjM0YmZjZTI5NGIwYTAyOTEzNjM0MDRk
ZSIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLS0gCjIuMzkuMgoK

--===============7756411944762264635==--

