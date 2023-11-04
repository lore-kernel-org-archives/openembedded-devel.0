Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 507D5C41535
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 02:05:13 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.2618.1699063504258641812
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 19:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OarmtkZR;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=rpe3N6k+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018b981399d2-51e4d57d-be0d-444a-8222-f49109e55226-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699063503;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Yz9s8iqO6QFQQAYgMOGwiz5mHx+E2EgUPMlzgasECto=;
	b=OarmtkZRjAV4LR46H5by8+CDROJ2TF9BaGUgAT14A3jyMU+3X9nlq9UNoTlf1gTY
	er2cizz9hNHvTG7lC3qKshPpgpLjuJHT+7FQLH8AjktGFemROzYvTFYGDmh6KJgxleQ
	b5Z2qQtQeZa3V0Hv2TEuvMGMcKjmblnYiEknAet8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699063503;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Yz9s8iqO6QFQQAYgMOGwiz5mHx+E2EgUPMlzgasECto=;
	b=rpe3N6k+LV7RxOwDrluELlA27Z++TrVxBSPAVgmZPAAKyMo75Sr/FFJVB/xKUVuw
	qifAETihXTTWfvxQnSiSvjeGPRSg/MONwSgLN57E7mndnnNjxTHL5wa4cS8Ti0SJQ3P
	W3luYKN9oG0Twd8VASXXCWx63yAAHAL5icrsrzhI=
Content-Type: multipart/mixed; boundary="===============4620716981462249970=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libconfig-tiny-perl: upgrading to 2.30 SUCCEEDED
Message-ID: <0101018b981399d2-51e4d57d-be0d-444a-8222-f49109e55226-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 02:05:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 02:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106187

--===============4620716981462249970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libconfig-tiny-perl* to *2.30* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libconfig-tiny-perl-upgrade-2.29-2.30.patch
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
From 04b8c41f2921873464bdc46f09ed856ed86b20eb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 01:43:02 +0000
Subject: [PATCH] libconfig-tiny-perl: upgrade 2.29 -> 2.30

---
 ...{libconfig-tiny-perl_2.29.bb => libconfig-tiny-perl_2.30.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libconfig-tiny/{libconfig-tiny-perl_2.29.bb => libconfig-tiny-perl_2.30.bb} (86%)

diff --git a/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.29.bb b/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.30.bb
similarity index 86%
rename from meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.29.bb
rename to meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.30.bb
index 92d9bac0e..ccdc1e0cb 100644
--- a/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.29.bb
+++ b/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.30.bb
@@ -15,6 +15,6 @@ S = "${WORKDIR}/Config-Tiny-${PV}"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/R/RS/RSAVAGE/Config-Tiny-${PV}.tgz"
 
-SRC_URI[sha256sum] = "3de79b0ea03a8d6a93e9d9128fe845fb556222b14699a4f6f0d5ca057ae3333b"
+SRC_URI[sha256sum] = "b2f7345619b3b8e636dd39ea010731c9dc2bfb8f022bcbd86ae6ad17866e110d"
 
 inherit cpan
-- 
2.39.2


--===============4620716981462249970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libconfig-tiny-perl: PV changed from "2.29" to "2.30"
packages/core2-64-poky-linux/libconfig-tiny-perl: SRC_URI changed from "http://search.cpan.org/CPAN/authors/id/R/RS/RSAVAGE/Config-Tiny-2.29.tgz" to "http://search.cpan.org/CPAN/authors/id/R/RS/RSAVAGE/Config-Tiny-2.30.tgz"
packages/core2-64-poky-linux/libconfig-tiny-perl: PKGV changed from 2.29 [default] to 2.30 [default]
packages/core2-64-poky-linux/libconfig-tiny-perl/libconfig-tiny-perl-dbg: PV changed from "2.29" to "2.30"
packages/core2-64-poky-linux/libconfig-tiny-perl/libconfig-tiny-perl-dbg: PKGV changed from 2.29 [default] to 2.30 [default]
packages/core2-64-poky-linux/libconfig-tiny-perl/libconfig-tiny-perl-dev: PV changed from "2.29" to "2.30"
packages/core2-64-poky-linux/libconfig-tiny-perl/libconfig-tiny-perl-dev: PKGV changed from 2.29 [default] to 2.30 [default]
packages/core2-64-poky-linux/libconfig-tiny-perl/libconfig-tiny-perl-doc: PV changed from "2.29" to "2.30"
packages/core2-64-poky-linux/libconfig-tiny-perl/libconfig-tiny-perl-doc: PKGSIZE changed from 12402 to 15752 (+27%)
packages/core2-64-poky-linux/libconfig-tiny-perl/libconfig-tiny-perl-doc: PKGV changed from 2.29 [default] to 2.30 [default]
packages/core2-64-poky-linux/libconfig-tiny-perl/libconfig-tiny-perl-locale: PV changed from "2.29" to "2.30"
packages/core2-64-poky-linux/libconfig-tiny-perl/libconfig-tiny-perl-locale: PKGV changed from 2.29 [default] to 2.30 [default]
packages/core2-64-poky-linux/libconfig-tiny-perl/libconfig-tiny-perl-src: PV changed from "2.29" to "2.30"
packages/core2-64-poky-linux/libconfig-tiny-perl/libconfig-tiny-perl-src: PKGV changed from 2.29 [default] to 2.30 [default]
packages/core2-64-poky-linux/libconfig-tiny-perl/libconfig-tiny-perl-staticdev: PV changed from "2.29" to "2.30"
packages/core2-64-poky-linux/libconfig-tiny-perl/libconfig-tiny-perl-staticdev: PKGV changed from 2.29 [default] to 2.30 [default]
packages/core2-64-poky-linux/libconfig-tiny-perl/libconfig-tiny-perl: PV changed from "2.29" to "2.30"
packages/core2-64-poky-linux/libconfig-tiny-perl/libconfig-tiny-perl: PKGSIZE changed from 11900 to 15026 (+26%)
packages/core2-64-poky-linux/libconfig-tiny-perl/libconfig-tiny-perl: PKGV changed from 2.29 [default] to 2.30 [default]

--===============4620716981462249970==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libconfig-tiny-perl-upgrade-2.29-2.30.patch"

RnJvbSAwNGI4YzQxZjI5MjE4NzM0NjRiZGM0NmYwOWVkODU2ZWQ4NmIyMGViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMTo0MzowMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmNvbmZpZy10aW55LXBlcmw6IHVwZ3JhZGUgMi4yOSAtPiAyLjMwCgotLS0KIC4uLntsaWJjb25m
aWctdGlueS1wZXJsXzIuMjkuYmIgPT4gbGliY29uZmlnLXRpbnktcGVybF8yLjMwLmJifSB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEtcGVybC9yZWNpcGVzLXBlcmwvbGliY29uZmlnLXRpbnkve2xpYmNvbmZpZy10aW55LXBl
cmxfMi4yOS5iYiA9PiBsaWJjb25maWctdGlueS1wZXJsXzIuMzAuYmJ9ICg4NiUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS1wZXJsL3JlY2lwZXMtcGVybC9saWJjb25maWctdGlueS9saWJjb25maWctdGlu
eS1wZXJsXzIuMjkuYmIgYi9tZXRhLXBlcmwvcmVjaXBlcy1wZXJsL2xpYmNvbmZpZy10aW55L2xp
YmNvbmZpZy10aW55LXBlcmxfMi4zMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg2JQpyZW5hbWUgZnJv
bSBtZXRhLXBlcmwvcmVjaXBlcy1wZXJsL2xpYmNvbmZpZy10aW55L2xpYmNvbmZpZy10aW55LXBl
cmxfMi4yOS5iYgpyZW5hbWUgdG8gbWV0YS1wZXJsL3JlY2lwZXMtcGVybC9saWJjb25maWctdGlu
eS9saWJjb25maWctdGlueS1wZXJsXzIuMzAuYmIKaW5kZXggOTJkOWJhYzBlLi5jY2RjMWUwY2Ig
MTAwNjQ0Ci0tLSBhL21ldGEtcGVybC9yZWNpcGVzLXBlcmwvbGliY29uZmlnLXRpbnkvbGliY29u
ZmlnLXRpbnktcGVybF8yLjI5LmJiCisrKyBiL21ldGEtcGVybC9yZWNpcGVzLXBlcmwvbGliY29u
ZmlnLXRpbnkvbGliY29uZmlnLXRpbnktcGVybF8yLjMwLmJiCkBAIC0xNSw2ICsxNSw2IEBAIFMg
PSAiJHtXT1JLRElSfS9Db25maWctVGlueS0ke1BWfSIKIAogU1JDX1VSSSA9ICJodHRwOi8vc2Vh
cmNoLmNwYW4ub3JnL0NQQU4vYXV0aG9ycy9pZC9SL1JTL1JTQVZBR0UvQ29uZmlnLVRpbnktJHtQ
Vn0udGd6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2RlNzliMGVhMDNhOGQ2YTkzZTlkOTEy
OGZlODQ1ZmI1NTYyMjJiMTQ2OTlhNGY2ZjBkNWNhMDU3YWUzMzMzYiIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJiMmY3MzQ1NjE5YjNiOGU2MzZkZDM5ZWEwMTA3MzFjOWRjMmJmYjhmMDIyYmNiZDg2
YWU2YWQxNzg2NmUxMTBkIgogCiBpbmhlcml0IGNwYW4KLS0gCjIuMzkuMgoK

--===============4620716981462249970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libconfig-tiny-perl/libconfig-tiny-perl-doc: PKGSIZE changed from 12402 to 15752 (+27%)
packages/core2-64-poky-linux/libconfig-tiny-perl/libconfig-tiny-perl: PKGSIZE changed from 11900 to 15026 (+26%)

--===============4620716981462249970==--

