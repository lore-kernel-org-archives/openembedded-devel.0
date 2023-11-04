Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 797B3C001B0
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 02:05:13 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.2730.1699063504763694677
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 19:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HulPi45Y;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NtlQfCZW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018b98139c65-67cba931-1bf1-4272-8236-4c80eddf5d40-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699063504;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=j/rY/A6C0pQNjp2awmq/vU8FozKe3c7VdIxE4QLYvB4=;
	b=HulPi45YOPhNviEUmv0PXjjBPScCbcCV1S7fsedOxjstnC7q6fJIB6QEqH+Sk+bo
	Ihn1PHtx7T8FVURnFQnWJCNpVlC72iLhQIzsyB0WyIbvf+lNnWVv2Rtvf1q601C1XXM
	T5lO6JESWpb1HsQqfdkr9FwDTFcydBvCfe127ECs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699063504;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=j/rY/A6C0pQNjp2awmq/vU8FozKe3c7VdIxE4QLYvB4=;
	b=NtlQfCZWPvJB+SXQIB37EiisljzyD5YadPI1bLy5OuYE4riQPZI7PaD+RvDnC+dT
	y0AluZzpZ1tOXvCXqfG5S0CKSpaBTVGDWdeeoC/XaCov7GdWeeA5WlbGE/5qr8z/VcO
	Li2bZOeVKDgpq2P6Q3/jONjc0Rm/XEZ5lfnHNEJw=
Content-Type: multipart/mixed; boundary="===============5182058933356236724=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libtest-harness-perl: upgrading to 3.48 SUCCEEDED
Message-ID: <0101018b98139c65-67cba931-1bf1-4272-8236-4c80eddf5d40-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 02:05:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 02:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106190

--===============5182058933356236724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libtest-harness-perl* to *3.48* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libtest-harness-perl-upgrade-3.47-3.48.patch
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
From de56778f71de1f6632a05f03def4e84d89d7e14a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 01:57:13 +0000
Subject: [PATCH] libtest-harness-perl: upgrade 3.47 -> 3.48

---
 ...ibtest-harness-perl_3.47.bb => libtest-harness-perl_3.48.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libtest/{libtest-harness-perl_3.47.bb => libtest-harness-perl_3.48.bb} (98%)

diff --git a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.47.bb b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.48.bb
similarity index 98%
rename from meta-perl/recipes-perl/libtest/libtest-harness-perl_3.47.bb
rename to meta-perl/recipes-perl/libtest/libtest-harness-perl_3.48.bb
index 836c9662b..b14fc95f1 100644
--- a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.47.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.48.bb
@@ -26,7 +26,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=29;endline=30;md5=d41d8cd98f00b204e9800998ecf8427e"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Test-Harness-${PV}.tar.gz"
-SRC_URI[sha256sum] = "bb31cd4aa90ad4e15f32b08476fb5123b4f19ed0cd28a3291242e8858bf986b5"
+SRC_URI[sha256sum] = "e73ff89c81c1a53f6baeef6816841b89d3384403ad97422a7da9d1eeb20ef9c5"
 
 UPSTREAM_CHECK_REGEX = "Test\-Harness\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.39.2


--===============5182058933356236724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libtest-harness-perl: PV changed from "3.47" to "3.48"
packages/core2-64-poky-linux/libtest-harness-perl: PKGV changed from 3.47 [default] to 3.48 [default]
packages/core2-64-poky-linux/libtest-harness-perl: SRC_URI changed from "https://search.cpan.org/CPAN/authors/id/L/LE/LEONT/Test-Harness-3.47.tar.gz file://ptest-perl/run-ptest" to "https://search.cpan.org/CPAN/authors/id/L/LE/LEONT/Test-Harness-3.48.tar.gz file://ptest-perl/run-ptest"
packages/core2-64-poky-linux/libtest-harness-perl/libtest-harness-perl-dbg: PV changed from "3.47" to "3.48"
packages/core2-64-poky-linux/libtest-harness-perl/libtest-harness-perl-dbg: PKGV changed from 3.47 [default] to 3.48 [default]
packages/core2-64-poky-linux/libtest-harness-perl/libtest-harness-perl-dev: PV changed from "3.47" to "3.48"
packages/core2-64-poky-linux/libtest-harness-perl/libtest-harness-perl-dev: PKGV changed from 3.47 [default] to 3.48 [default]
packages/core2-64-poky-linux/libtest-harness-perl/libtest-harness-perl-doc: PV changed from "3.47" to "3.48"
packages/core2-64-poky-linux/libtest-harness-perl/libtest-harness-perl-doc: PKGV changed from 3.47 [default] to 3.48 [default]
packages/core2-64-poky-linux/libtest-harness-perl/libtest-harness-perl-locale: PV changed from "3.47" to "3.48"
packages/core2-64-poky-linux/libtest-harness-perl/libtest-harness-perl-locale: PKGV changed from 3.47 [default] to 3.48 [default]
packages/core2-64-poky-linux/libtest-harness-perl/libtest-harness-perl-ptest: PV changed from "3.47" to "3.48"
packages/core2-64-poky-linux/libtest-harness-perl/libtest-harness-perl-ptest: PKGV changed from 3.47 [default] to 3.48 [default]
packages/core2-64-poky-linux/libtest-harness-perl/libtest-harness-perl-src: PV changed from "3.47" to "3.48"
packages/core2-64-poky-linux/libtest-harness-perl/libtest-harness-perl-src: PKGV changed from 3.47 [default] to 3.48 [default]
packages/core2-64-poky-linux/libtest-harness-perl/libtest-harness-perl-staticdev: PV changed from "3.47" to "3.48"
packages/core2-64-poky-linux/libtest-harness-perl/libtest-harness-perl-staticdev: PKGV changed from 3.47 [default] to 3.48 [default]
packages/core2-64-poky-linux/libtest-harness-perl/libtest-harness-perl: PV changed from "3.47" to "3.48"
packages/core2-64-poky-linux/libtest-harness-perl/libtest-harness-perl: PKGSIZE changed from 360428 to 360580 (+0%)
packages/core2-64-poky-linux/libtest-harness-perl/libtest-harness-perl: PKGV changed from 3.47 [default] to 3.48 [default]

--===============5182058933356236724==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libtest-harness-perl-upgrade-3.47-3.48.patch"

RnJvbSBkZTU2Nzc4ZjcxZGUxZjY2MzJhMDVmMDNkZWY0ZTg0ZDg5ZDdlMTRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMTo1NzoxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnRlc3QtaGFybmVzcy1wZXJsOiB1cGdyYWRlIDMuNDcgLT4gMy40OAoKLS0tCiAuLi5pYnRlc3Qt
aGFybmVzcy1wZXJsXzMuNDcuYmIgPT4gbGlidGVzdC1oYXJuZXNzLXBlcmxfMy40OC5iYn0gfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhLXBlcmwvcmVjaXBlcy1wZXJsL2xpYnRlc3Qve2xpYnRlc3QtaGFybmVzcy1wZXJsXzMu
NDcuYmIgPT4gbGlidGVzdC1oYXJuZXNzLXBlcmxfMy40OC5iYn0gKDk4JSkKCmRpZmYgLS1naXQg
YS9tZXRhLXBlcmwvcmVjaXBlcy1wZXJsL2xpYnRlc3QvbGlidGVzdC1oYXJuZXNzLXBlcmxfMy40
Ny5iYiBiL21ldGEtcGVybC9yZWNpcGVzLXBlcmwvbGlidGVzdC9saWJ0ZXN0LWhhcm5lc3MtcGVy
bF8zLjQ4LmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEtcGVybC9yZWNp
cGVzLXBlcmwvbGlidGVzdC9saWJ0ZXN0LWhhcm5lc3MtcGVybF8zLjQ3LmJiCnJlbmFtZSB0byBt
ZXRhLXBlcmwvcmVjaXBlcy1wZXJsL2xpYnRlc3QvbGlidGVzdC1oYXJuZXNzLXBlcmxfMy40OC5i
YgppbmRleCA4MzZjOTY2MmIuLmIxNGZjOTVmMSAxMDA2NDQKLS0tIGEvbWV0YS1wZXJsL3JlY2lw
ZXMtcGVybC9saWJ0ZXN0L2xpYnRlc3QtaGFybmVzcy1wZXJsXzMuNDcuYmIKKysrIGIvbWV0YS1w
ZXJsL3JlY2lwZXMtcGVybC9saWJ0ZXN0L2xpYnRlc3QtaGFybmVzcy1wZXJsXzMuNDguYmIKQEAg
LTI2LDcgKzI2LDcgQEAgTElDRU5TRSA9ICJBcnRpc3RpYy0xLjAgfCBHUEwtMS4wLW9yLWxhdGVy
IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vUkVBRE1FO2JlZ2lubGluZT0yOTtlbmRsaW5l
PTMwO21kNT1kNDFkOGNkOThmMDBiMjA0ZTk4MDA5OThlY2Y4NDI3ZSIKIAogU1JDX1VSSSA9ICIk
e0NQQU5fTUlSUk9SfS9hdXRob3JzL2lkL0wvTEUvTEVPTlQvVGVzdC1IYXJuZXNzLSR7UFZ9LnRh
ci5neiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiYjMxY2Q0YWE5MGFkNGUxNWYzMmIwODQ3NmZi
NTEyM2I0ZjE5ZWQwY2QyOGEzMjkxMjQyZTg4NThiZjk4NmI1IgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImU3M2ZmODljODFjMWE1M2Y2YmFlZWY2ODE2ODQxYjg5ZDMzODQ0MDNhZDk3NDIyYTdkYTlk
MWVlYjIwZWY5YzUiCiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gIlRlc3RcLUhhcm5lc3NcLSg/
UDxwdmVyPihcZCtcLlxkKykpKD8hX1xkKykudGFyIgogCi0tIAoyLjM5LjIKCg==

--===============5182058933356236724==--

