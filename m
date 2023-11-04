Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F9E3C4167D
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 02:05:13 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.2729.1699063504722265887
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 19:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cu6Q3XHE;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=rjl61jiS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b98139c24-e8644cc6-83a9-4b02-ac95-90905a76bb00-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699063504;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lY5Fy8QWrQe4VlyPkNbGTHfMJ7d/D7vKU74Um2a57Dc=;
	b=cu6Q3XHENLPvgTJqvHRGzmhCLeAQhcPekzftAG7ccExjZSMHcbu5J7VGM4OYTobZ
	qXni7ugJYFPSmGacsrjMlyz/mI6VrCbO1NXWQziTtiR3mq0IfuUHjmUDNe0Ih1YeYXc
	AB0G8iMvGTYSUA4pBv+ovhOCiwPUO8HcgNhc6JwY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699063504;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lY5Fy8QWrQe4VlyPkNbGTHfMJ7d/D7vKU74Um2a57Dc=;
	b=rjl61jiSXMvFXeVp76/Zbulk8NOJLDRGvIS/BCPzrFQ7f2HRIfe5nPaSNheb57Fh
	N22BEIbYy2wlimehQPYOaSIDiszQel0l8XOuGGFl/tOv7BUlliKeblBGx7l8cPd6X2c
	BujXgVY6ZufZAbzxatE8rOTHBT2uTJyyfBSXq+Zg=
Content-Type: multipart/mixed; boundary="===============0795091557814544213=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libdbd-sqlite-perl: upgrading to 1.74 SUCCEEDED
Message-ID: <0101018b98139c24-e8644cc6-83a9-4b02-ac95-90905a76bb00-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 02:05:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 02:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106189

--===============0795091557814544213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libdbd-sqlite-perl* to *1.74* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libdbd-sqlite-perl-upgrade-1.72-1.74.patch
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
From 0d18c628537fd72e458eefc3d823608ff77fad62 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 01:49:17 +0000
Subject: [PATCH] libdbd-sqlite-perl: upgrade 1.72 -> 1.74

---
 .../{libdbd-sqlite-perl_1.72.bb => libdbd-sqlite-perl_1.74.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libdb/{libdbd-sqlite-perl_1.72.bb => libdbd-sqlite-perl_1.74.bb} (94%)

diff --git a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.72.bb b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.74.bb
similarity index 94%
rename from meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.72.bb
rename to meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.74.bb
index 975034a07..7e38da883 100644
--- a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.72.bb
+++ b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.74.bb
@@ -14,7 +14,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/I/IS/ISHIGAKI/DBD-SQLite-${PV}.tar.gz \
            file://sqlite-perl-test.pl \
 "
 
-SRC_URI[sha256sum] = "5ca41e61eb52b52bd862a3088b912a75fe70910ac789b9a9983e0a449e94f551"
+SRC_URI[sha256sum] = "8994997d84b9feb4547795f78746c661fb72e3cb6a25dbdd789b731f5688a4dd"
 
 UPSTREAM_CHECK_REGEX = "DBD\-SQLite\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.39.2


--===============0795091557814544213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libdbd-sqlite-perl: PKGV changed from 1.72 [default] to 1.74 [default]
packages/core2-64-poky-linux/libdbd-sqlite-perl: PV changed from "1.72" to "1.74"
packages/core2-64-poky-linux/libdbd-sqlite-perl: SRC_URI changed from "https://search.cpan.org/CPAN/authors/id/I/IS/ISHIGAKI/DBD-SQLite-1.72.tar.gz file://sqlite-perl-test.pl file://ptest-perl/run-ptest" to "https://search.cpan.org/CPAN/authors/id/I/IS/ISHIGAKI/DBD-SQLite-1.74.tar.gz file://sqlite-perl-test.pl file://ptest-perl/run-ptest"
packages/core2-64-poky-linux/libdbd-sqlite-perl/libdbd-sqlite-perl-dbg: PKGV changed from 1.72 [default] to 1.74 [default]
packages/core2-64-poky-linux/libdbd-sqlite-perl/libdbd-sqlite-perl-dbg: PV changed from "1.72" to "1.74"
packages/core2-64-poky-linux/libdbd-sqlite-perl/libdbd-sqlite-perl-dbg: PKGSIZE changed from 5381272 to 5496856 (+2%)
packages/core2-64-poky-linux/libdbd-sqlite-perl/libdbd-sqlite-perl-dev: PKGV changed from 1.72 [default] to 1.74 [default]
packages/core2-64-poky-linux/libdbd-sqlite-perl/libdbd-sqlite-perl-dev: PV changed from "1.72" to "1.74"
packages/core2-64-poky-linux/libdbd-sqlite-perl/libdbd-sqlite-perl-doc: PKGV changed from 1.72 [default] to 1.74 [default]
packages/core2-64-poky-linux/libdbd-sqlite-perl/libdbd-sqlite-perl-doc: PV changed from "1.72" to "1.74"
packages/core2-64-poky-linux/libdbd-sqlite-perl/libdbd-sqlite-perl-doc: PKGSIZE changed from 156693 to 156952 (+0%)
packages/core2-64-poky-linux/libdbd-sqlite-perl/libdbd-sqlite-perl-locale: PKGV changed from 1.72 [default] to 1.74 [default]
packages/core2-64-poky-linux/libdbd-sqlite-perl/libdbd-sqlite-perl-locale: PV changed from "1.72" to "1.74"
packages/core2-64-poky-linux/libdbd-sqlite-perl/libdbd-sqlite-perl-ptest: PKGV changed from 1.72 [default] to 1.74 [default]
packages/core2-64-poky-linux/libdbd-sqlite-perl/libdbd-sqlite-perl-ptest: PV changed from "1.72" to "1.74"
packages/core2-64-poky-linux/libdbd-sqlite-perl/libdbd-sqlite-perl-src: PKGV changed from 1.72 [default] to 1.74 [default]
packages/core2-64-poky-linux/libdbd-sqlite-perl/libdbd-sqlite-perl-src: PV changed from "1.72" to "1.74"
packages/core2-64-poky-linux/libdbd-sqlite-perl/libdbd-sqlite-perl-src: PKGSIZE changed from 9617669 to 9830266 (+2%)
packages/core2-64-poky-linux/libdbd-sqlite-perl/libdbd-sqlite-perl-staticdev: PKGV changed from 1.72 [default] to 1.74 [default]
packages/core2-64-poky-linux/libdbd-sqlite-perl/libdbd-sqlite-perl-staticdev: PV changed from "1.72" to "1.74"
packages/core2-64-poky-linux/libdbd-sqlite-perl/libdbd-sqlite-perl: PKGV changed from 1.72 [default] to 1.74 [default]
packages/core2-64-poky-linux/libdbd-sqlite-perl/libdbd-sqlite-perl: PV changed from "1.72" to "1.74"
packages/core2-64-poky-linux/libdbd-sqlite-perl/libdbd-sqlite-perl: PKGSIZE changed from 10884755 to 11125774 (+2%)

--===============0795091557814544213==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libdbd-sqlite-perl-upgrade-1.72-1.74.patch"

RnJvbSAwZDE4YzYyODUzN2ZkNzJlNDU4ZWVmYzNkODIzNjA4ZmY3N2ZhZDYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMTo0OToxNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmRiZC1zcWxpdGUtcGVybDogdXBncmFkZSAxLjcyIC0+IDEuNzQKCi0tLQogLi4uL3tsaWJkYmQt
c3FsaXRlLXBlcmxfMS43Mi5iYiA9PiBsaWJkYmQtc3FsaXRlLXBlcmxfMS43NC5iYn0gIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS1wZXJsL3JlY2lwZXMtcGVybC9saWJkYi97bGliZGJkLXNxbGl0ZS1wZXJsXzEuNzIuYmIg
PT4gbGliZGJkLXNxbGl0ZS1wZXJsXzEuNzQuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS1w
ZXJsL3JlY2lwZXMtcGVybC9saWJkYi9saWJkYmQtc3FsaXRlLXBlcmxfMS43Mi5iYiBiL21ldGEt
cGVybC9yZWNpcGVzLXBlcmwvbGliZGIvbGliZGJkLXNxbGl0ZS1wZXJsXzEuNzQuYmIKc2ltaWxh
cml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS1wZXJsL3JlY2lwZXMtcGVybC9saWJkYi9s
aWJkYmQtc3FsaXRlLXBlcmxfMS43Mi5iYgpyZW5hbWUgdG8gbWV0YS1wZXJsL3JlY2lwZXMtcGVy
bC9saWJkYi9saWJkYmQtc3FsaXRlLXBlcmxfMS43NC5iYgppbmRleCA5NzUwMzRhMDcuLjdlMzhk
YTg4MyAxMDA2NDQKLS0tIGEvbWV0YS1wZXJsL3JlY2lwZXMtcGVybC9saWJkYi9saWJkYmQtc3Fs
aXRlLXBlcmxfMS43Mi5iYgorKysgYi9tZXRhLXBlcmwvcmVjaXBlcy1wZXJsL2xpYmRiL2xpYmRi
ZC1zcWxpdGUtcGVybF8xLjc0LmJiCkBAIC0xNCw3ICsxNCw3IEBAIFNSQ19VUkkgPSAiJHtDUEFO
X01JUlJPUn0vYXV0aG9ycy9pZC9JL0lTL0lTSElHQUtJL0RCRC1TUUxpdGUtJHtQVn0udGFyLmd6
IFwKICAgICAgICAgICAgZmlsZTovL3NxbGl0ZS1wZXJsLXRlc3QucGwgXAogIgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiNWNhNDFlNjFlYjUyYjUyYmQ4NjJhMzA4OGI5MTJhNzVmZTcwOTEwYWM3
ODliOWE5OTgzZTBhNDQ5ZTk0ZjU1MSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4OTk0OTk3ZDg0
YjlmZWI0NTQ3Nzk1Zjc4NzQ2YzY2MWZiNzJlM2NiNmEyNWRiZGQ3ODliNzMxZjU2ODhhNGRkIgog
CiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJEQkRcLVNRTGl0ZVwtKD9QPHB2ZXI+KFxkK1wuXGQr
KSkoPyFfXGQrKS50YXIiCiAKLS0gCjIuMzkuMgoK

--===============0795091557814544213==--

