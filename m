Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB009C27C61
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:53:07 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.62991.1699041170566810194
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=anPnE13S;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=i2kHbR4g;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018b96bee694-712a06b3-8fac-49e6-b33f-c222d46901e0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041175;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uXLMEDqz0CgqV1RMvOQIbK2XCiImB7RE0R50oTzpFNE=;
	b=anPnE13S7isygVRWFXgCKkJLOysz62FTwl6Ytkn0nZoJEHRGsmiL/msnWZ9m1Fcy
	khhTqgEkjIsvUwv/6TxINH3qveYuEGrXqxKZV363/PuzBMSXT8N6BWwri/AkOX+O96E
	LV6AugMNZXVJ9xDYg+YtCluJzMtKyDFilQBVFHIU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041175;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uXLMEDqz0CgqV1RMvOQIbK2XCiImB7RE0R50oTzpFNE=;
	b=i2kHbR4gwE0JR81hR3Mukl52vVcb2KcgxqQhcqMkSNqCkQxnKpZ+Pj4oewja59Vt
	cZB5voafTtS4GxcEPW5IlEkERH39Bp6Nlp2joZSPbRqhtDi5rnNs5MzXaKq4bKGRqHM
	OomrCWoXtTIAmPMDmPgxKrDQ5fuqS/aEiy0/4N+E=
Content-Type: multipart/mixed; boundary="===============5836999007481190298=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] thingsboard-gateway: upgrading to 3.4.2 SUCCEEDED
Message-ID: <0101018b96bee694-712a06b3-8fac-49e6-b33f-c222d46901e0-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:53:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106021

--===============5836999007481190298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *thingsboard-gateway* to *3.4.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-thingsboard-gateway-upgrade-3.4.1-3.4.2.patch
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
From f799304c1b5e5447eab88c05d6dd6f62b134c38b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 18:44:01 +0000
Subject: [PATCH] thingsboard-gateway: upgrade 3.4.1 -> 3.4.2

---
 ...hingsboard-gateway_3.4.1.bb => thingsboard-gateway_3.4.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/{thingsboard-gateway_3.4.1.bb => thingsboard-gateway_3.4.2.bb} (95%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.4.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.4.2.bb
similarity index 95%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.4.1.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.4.2.bb
index 79b263d9b..52bcffe71 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.4.1.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.4.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://thingsboard.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRC_URI[sha256sum] = "680211741de1f8de20e91022a89d3c206737559e97b729fcf88b215237e7d85d"
+SRC_URI[sha256sum] = "a54953c53c0ee72a1aa270bc018db7cc853f56ca29e2c98938ff4138109fd41a"
 
 inherit pypi setuptools3
 
-- 
2.39.2


--===============5836999007481190298==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-thingsboard-gateway-upgrade-3.4.1-3.4.2.patch"

RnJvbSBmNzk5MzA0YzFiNWU1NDQ3ZWFiODhjMDVkNmRkNmY2MmIxMzRjMzhiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxODo0NDowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHRo
aW5nc2JvYXJkLWdhdGV3YXk6IHVwZ3JhZGUgMy40LjEgLT4gMy40LjIKCi0tLQogLi4uaGluZ3Ni
b2FyZC1nYXRld2F5XzMuNC4xLmJiID0+IHRoaW5nc2JvYXJkLWdhdGV3YXlfMy40LjIuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS1vZS9keW5hbWljLWxheWVycy9tZXRhLXB5dGhvbi9yZWNpcGVzLWNvbm5lY3Rpdml0
eS90aGluZ3Nib2FyZC1nYXRld2F5L3t0aGluZ3Nib2FyZC1nYXRld2F5XzMuNC4xLmJiID0+IHRo
aW5nc2JvYXJkLWdhdGV3YXlfMy40LjIuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS1vZS9k
eW5hbWljLWxheWVycy9tZXRhLXB5dGhvbi9yZWNpcGVzLWNvbm5lY3Rpdml0eS90aGluZ3Nib2Fy
ZC1nYXRld2F5L3RoaW5nc2JvYXJkLWdhdGV3YXlfMy40LjEuYmIgYi9tZXRhLW9lL2R5bmFtaWMt
bGF5ZXJzL21ldGEtcHl0aG9uL3JlY2lwZXMtY29ubmVjdGl2aXR5L3RoaW5nc2JvYXJkLWdhdGV3
YXkvdGhpbmdzYm9hcmQtZ2F0ZXdheV8zLjQuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5h
bWUgZnJvbSBtZXRhLW9lL2R5bmFtaWMtbGF5ZXJzL21ldGEtcHl0aG9uL3JlY2lwZXMtY29ubmVj
dGl2aXR5L3RoaW5nc2JvYXJkLWdhdGV3YXkvdGhpbmdzYm9hcmQtZ2F0ZXdheV8zLjQuMS5iYgpy
ZW5hbWUgdG8gbWV0YS1vZS9keW5hbWljLWxheWVycy9tZXRhLXB5dGhvbi9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS90aGluZ3Nib2FyZC1nYXRld2F5L3RoaW5nc2JvYXJkLWdhdGV3YXlfMy40LjIuYmIK
aW5kZXggNzliMjYzZDliLi41MmJjZmZlNzEgMTAwNjQ0Ci0tLSBhL21ldGEtb2UvZHluYW1pYy1s
YXllcnMvbWV0YS1weXRob24vcmVjaXBlcy1jb25uZWN0aXZpdHkvdGhpbmdzYm9hcmQtZ2F0ZXdh
eS90aGluZ3Nib2FyZC1nYXRld2F5XzMuNC4xLmJiCisrKyBiL21ldGEtb2UvZHluYW1pYy1sYXll
cnMvbWV0YS1weXRob24vcmVjaXBlcy1jb25uZWN0aXZpdHkvdGhpbmdzYm9hcmQtZ2F0ZXdheS90
aGluZ3Nib2FyZC1nYXRld2F5XzMuNC4yLmJiCkBAIC03LDcgKzcsNyBAQCBIT01FUEFHRSA9ICJo
dHRwczovL3RoaW5nc2JvYXJkLmlvLyIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovLyR7Q09NTU9OX0xJQ0VOU0VfRElSfS9BcGFjaGUtMi4wO21kNT04
OWFlYTRlMTdkOTlhN2NhY2RiZWVkNDZhMDA5NmIxMCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjY4MDIxMTc0MWRlMWY4ZGUyMGU5MTAyMmE4OWQzYzIwNjczNzU1OWU5N2I3MjlmY2Y4OGIyMTUy
MzdlN2Q4NWQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTU0OTUzYzUzYzBlZTcyYTFhYTI3MGJj
MDE4ZGI3Y2M4NTNmNTZjYTI5ZTJjOTg5MzhmZjQxMzgxMDlmZDQxYSIKIAogaW5oZXJpdCBweXBp
IHNldHVwdG9vbHMzCiAKLS0gCjIuMzkuMgoK

--===============5836999007481190298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/thingsboard-gateway: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/thingsboard-gateway/thingsboard-gateway-3.4.1.tar.gz;downloadfilename=thingsboard-gateway-3.4.1.tar.gz file://bacnet.json file://ble.json file://can.json file://custom_serial.json file://modbus.json file://modbus_serial.json file://mqtt.json file://opcua.json file://odbc.json file://request.json file://rest.json file://snmp.json file://tb_gateway.yaml file://logs.conf file://thingsboard-gateway.service" to "https://files.pythonhosted.org/packages/source/t/thingsboard-gateway/thingsboard-gateway-3.4.2.tar.gz;downloadfilename=thingsboard-gateway-3.4.2.tar.gz file://bacnet.json file://ble.json file://can.json file://custom_serial.json file://modbus.json file://modbus_serial.json file://mqtt.json file://opcua.json file://odbc.json file://request.json file://rest.json file://snmp.json file://tb_gateway.yaml file://logs.conf file://thingsboard-gateway.service"
packages/core2-64-poky-linux/thingsboard-gateway: PV changed from "3.4.1" to "3.4.2"
packages/core2-64-poky-linux/thingsboard-gateway: PKGV changed from 3.4.1 [default] to 3.4.2 [default]
Changes to packages/core2-64-poky-linux/thingsboard-gateway (sysroot):
  /usr/lib/python3.11/site-packages/thingsboard_gateway-3.4.1.dist-info moved to /usr/lib/python3.11/site-packages/thingsboard_gateway-3.4.2.dist-info
  /usr/lib/python3.11/site-packages/thingsboard_gateway/config/backup was added
  /usr/lib/python3.11/site-packages/thingsboard_gateway/config/backup/tb_gateway.json_backup_1697700413 was added
packages/core2-64-poky-linux/thingsboard-gateway/thingsboard-gateway-dbg: PV changed from "3.4.1" to "3.4.2"
packages/core2-64-poky-linux/thingsboard-gateway/thingsboard-gateway-dbg: PKGV changed from 3.4.1 [default] to 3.4.2 [default]
packages/core2-64-poky-linux/thingsboard-gateway/thingsboard-gateway-dev: PV changed from "3.4.1" to "3.4.2"
packages/core2-64-poky-linux/thingsboard-gateway/thingsboard-gateway-dev: PKGV changed from 3.4.1 [default] to 3.4.2 [default]
packages/core2-64-poky-linux/thingsboard-gateway/thingsboard-gateway-doc: PV changed from "3.4.1" to "3.4.2"
packages/core2-64-poky-linux/thingsboard-gateway/thingsboard-gateway-doc: PKGV changed from 3.4.1 [default] to 3.4.2 [default]
packages/core2-64-poky-linux/thingsboard-gateway/thingsboard-gateway-locale: PV changed from "3.4.1" to "3.4.2"
packages/core2-64-poky-linux/thingsboard-gateway/thingsboard-gateway-locale: PKGV changed from 3.4.1 [default] to 3.4.2 [default]
packages/core2-64-poky-linux/thingsboard-gateway/thingsboard-gateway-src: PV changed from "3.4.1" to "3.4.2"
packages/core2-64-poky-linux/thingsboard-gateway/thingsboard-gateway-src: PKGV changed from 3.4.1 [default] to 3.4.2 [default]
packages/core2-64-poky-linux/thingsboard-gateway/thingsboard-gateway-staticdev: PV changed from "3.4.1" to "3.4.2"
packages/core2-64-poky-linux/thingsboard-gateway/thingsboard-gateway-staticdev: PKGV changed from 3.4.1 [default] to 3.4.2 [default]
packages/core2-64-poky-linux/thingsboard-gateway/thingsboard-gateway: FILELIST: directory renamed /usr/lib/python3.11/site-packages/thingsboard_gateway-3.4.1.dist-info -> /usr/lib/python3.11/site-packages/thingsboard_gateway-3.4.2.dist-info, added "/usr/lib/python3.11/site-packages/thingsboard_gateway/config/backup/tb_gateway.json_backup_1697700413"
packages/core2-64-poky-linux/thingsboard-gateway/thingsboard-gateway: PV changed from "3.4.1" to "3.4.2"
packages/core2-64-poky-linux/thingsboard-gateway/thingsboard-gateway: PKGV changed from 3.4.1 [default] to 3.4.2 [default]
packages/core2-64-poky-linux/thingsboard-gateway/thingsboard-gateway: PKGSIZE changed from 2214879 to 2219304 (+0%)

--===============5836999007481190298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/thingsboard-gateway (sysroot):
  /usr/lib/python3.11/site-packages/thingsboard_gateway-3.4.1.dist-info moved to /usr/lib/python3.11/site-packages/thingsboard_gateway-3.4.2.dist-info
  /usr/lib/python3.11/site-packages/thingsboard_gateway/config/backup was added
  /usr/lib/python3.11/site-packages/thingsboard_gateway/config/backup/tb_gateway.json_backup_1697700413 was added
packages/core2-64-poky-linux/thingsboard-gateway/thingsboard-gateway: FILELIST: directory renamed /usr/lib/python3.11/site-packages/thingsboard_gateway-3.4.1.dist-info -> /usr/lib/python3.11/site-packages/thingsboard_gateway-3.4.2.dist-info, added "/usr/lib/python3.11/site-packages/thingsboard_gateway/config/backup/tb_gateway.json_backup_1697700413"

--===============5836999007481190298==--

