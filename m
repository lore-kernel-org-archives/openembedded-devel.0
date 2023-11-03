Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06FE6C07EBE
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:51 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.63861.1699041165506993949
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Ltg0CRGv;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=lATKeSc5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018b96bebd9c-8bdfa75f-9f0f-43f4-af77-2d7ad5829669-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041164;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nHCGJ8pQApC3+aSN/jx6fBfokwhozCSTn4CJpZ7oDag=;
	b=Ltg0CRGvZnv0YicqbEgvAZ+iMhl6K+x3rZiQypPcfX8TFXKK7lcUhocMlO+d/diF
	NLQg3CBqtj2dFpdRhQpprFizbg8rerTFZhw5DdRa7Ebetia5xL+QLB6/oDr/ef7Yohd
	fnzt8A686V7zvlbb+qCr+W9fsALhTzu6Y1wluyiI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041164;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nHCGJ8pQApC3+aSN/jx6fBfokwhozCSTn4CJpZ7oDag=;
	b=lATKeSc5+8i4bCN/yYzXCa+tt079vYwxWnRwBXzpWzcSMhWAgrpraFfbW2l1vQ2/
	As7uXE0OxSSPBXvUeaOBOc3E9w4tLK/rKrgz6ORtQpXJ5Pfde4OAEwm4Qx7j0eUTwG1
	4WilRTEBZNug0VroNt7+G4VvnPTDHna5GqIB+ziE=
Content-Type: multipart/mixed; boundary="===============3186323747426852803=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] c-ares: upgrading to 1.21.0 SUCCEEDED
Message-ID: <0101018b96bebd9c-8bdfa75f-9f0f-43f4-af77-2d7ad5829669-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:44 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105884

--===============3186323747426852803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *c-ares* to *1.21.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-c-ares-upgrade-1.20.1-1.21.0.patch
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
From 428448fd383940ccf26ec1743303809b45a173f8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 11:42:56 +0000
Subject: [PATCH] c-ares: upgrade 1.20.1 -> 1.21.0

---
 .../c-ares/{c-ares_1.20.1.bb => c-ares_1.21.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.20.1.bb => c-ares_1.21.0.bb} (91%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.20.1.bb b/meta-oe/recipes-support/c-ares/c-ares_1.21.0.bb
similarity index 91%
rename from meta-oe/recipes-support/c-ares/c-ares_1.20.1.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.21.0.bb
index 85379dc40..d334e111c 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.20.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.21.0.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fdbc58a6da11a9f68aa73c453818decc"
 
 SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main;protocol=https"
-SRCREV = "e8fe27eaa841ed32a4f82bef7a72c4e04e7f86a7"
+SRCREV = "71f8e16e5091952c60fb72b2d990db7724c3e8f5"
 
 UPSTREAM_CHECK_GITTAGREGEX = "cares-(?P<pver>\d+_(\d_?)+)"
 
-- 
2.39.2


--===============3186323747426852803==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-c-ares-upgrade-1.20.1-1.21.0.patch"

RnJvbSA0Mjg0NDhmZDM4Mzk0MGNjZjI2ZWMxNzQzMzAzODA5YjQ1YTE3M2Y4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxMTo0Mjo1NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGMt
YXJlczogdXBncmFkZSAxLjIwLjEgLT4gMS4yMS4wCgotLS0KIC4uLi9jLWFyZXMve2MtYXJlc18x
LjIwLjEuYmIgPT4gYy1hcmVzXzEuMjEuMC5iYn0gICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEtb2Uv
cmVjaXBlcy1zdXBwb3J0L2MtYXJlcy97Yy1hcmVzXzEuMjAuMS5iYiA9PiBjLWFyZXNfMS4yMS4w
LmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2MtYXJlcy9j
LWFyZXNfMS4yMC4xLmJiIGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvYy1hcmVzL2MtYXJlc18x
LjIxLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS1vZS9yZWNpcGVz
LXN1cHBvcnQvYy1hcmVzL2MtYXJlc18xLjIwLjEuYmIKcmVuYW1lIHRvIG1ldGEtb2UvcmVjaXBl
cy1zdXBwb3J0L2MtYXJlcy9jLWFyZXNfMS4yMS4wLmJiCmluZGV4IDg1Mzc5ZGM0MC4uZDMzNGUx
MTFjIDEwMDY0NAotLS0gYS9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9jLWFyZXMvYy1hcmVzXzEu
MjAuMS5iYgorKysgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9jLWFyZXMvYy1hcmVzXzEuMjEu
MC5iYgpAQCAtNiw3ICs2LDcgQEAgTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9MSUNFTlNFLm1kO21kNT1mZGJjNThhNmRhMTFhOWY2OGFhNzNjNDUzODE4ZGVjYyIK
IAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2MtYXJlcy9jLWFyZXMuZ2l0O2JyYW5jaD1t
YWluO3Byb3RvY29sPWh0dHBzIgotU1JDUkVWID0gImU4ZmUyN2VhYTg0MWVkMzJhNGY4MmJlZjdh
NzJjNGUwNGU3Zjg2YTciCitTUkNSRVYgPSAiNzFmOGUxNmU1MDkxOTUyYzYwZmI3MmIyZDk5MGRi
NzcyNGMzZThmNSIKIAogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAiY2FyZXMtKD9QPHB2
ZXI+XGQrXyhcZF8/KSspIgogCi0tIAoyLjM5LjIKCg==

--===============3186323747426852803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/c-ares/c-ares-dbg: PKGSIZE changed from 545752 to 627600 (+15%)
packages/core2-64-poky-linux/c-ares/c-ares-dbg: PV changed from "1.20.1" to "1.21.0"
packages/core2-64-poky-linux/c-ares/c-ares-dbg: PKGV changed from 1.20.1 [default] to 1.21.0 [default]
packages/core2-64-poky-linux/c-ares/c-ares-dbg: FILELIST: removed "/usr/lib/.debug/libcares.so.2.7.1", added "/usr/lib/.debug/libcares.so.2.7.2"
packages/core2-64-poky-linux/c-ares/c-ares-dev: PKGSIZE changed from 66259 to 62750 (-5%)
packages/core2-64-poky-linux/c-ares/c-ares-dev: PV changed from "1.20.1" to "1.21.0"
packages/core2-64-poky-linux/c-ares/c-ares-dev: PKGV changed from 1.20.1 [default] to 1.21.0 [default]
packages/core2-64-poky-linux/c-ares/c-ares-doc: PKGSIZE changed from 161598 to 161725 (+0%)
packages/core2-64-poky-linux/c-ares/c-ares-doc: PV changed from "1.20.1" to "1.21.0"
packages/core2-64-poky-linux/c-ares/c-ares-doc: PKGV changed from 1.20.1 [default] to 1.21.0 [default]
packages/core2-64-poky-linux/c-ares/c-ares-locale: PV changed from "1.20.1" to "1.21.0"
packages/core2-64-poky-linux/c-ares/c-ares-locale: PKGV changed from 1.20.1 [default] to 1.21.0 [default]
packages/core2-64-poky-linux/c-ares/c-ares-src: PKGSIZE changed from 605797 to 696960 (+15%)
packages/core2-64-poky-linux/c-ares/c-ares-src: PV changed from "1.20.1" to "1.21.0"
packages/core2-64-poky-linux/c-ares/c-ares-src: PKGV changed from 1.20.1 [default] to 1.21.0 [default]
packages/core2-64-poky-linux/c-ares/c-ares-src: FILELIST: directory renamed /usr/src/debug/c-ares/1.20.1-r0 -> /usr/src/debug/c-ares/1.21.0-r0, directory renamed /usr/src/debug/c-ares/1.20.1-r0/include -> /usr/src/debug/c-ares/1.21.0-r0/include, directory renamed /usr/src/debug/c-ares/1.20.1-r0/src/tools -> /usr/src/debug/c-ares/1.21.0-r0/src/tools, removed "/usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_mkquery.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_query.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares__buf.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_destroy.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_parse_mx_reply.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares__buf.h /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_parse_a_reply.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_parse_aaaa_reply.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_getsock.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_rand.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_send.c /usr/src/debug/c-ares/1.
 20.1-r0/src/lib/ares_cancel.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares__get_hostent.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_free_string.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_library_init.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/inet_net_pton.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_process.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares__sortaddrinfo.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_getnameinfo.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares__addrinfo_localhost.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares__close_sockets.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_options.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_expand_name.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_expand_string.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_data.h /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_free_hostent.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_getaddrinfo.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/bitncmp.c /usr/src/debug/c-ares/1.20.1-r0/
 src/lib/ares_create_query.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_data.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_ipv6.h /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_version.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/bitncmp.h /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares__htable_asvp.h /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares__htable_stvp.h /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares__addrinfo2hostent.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares__readaddrinfo.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_fds.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_init.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_gethostbyname.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares__htable_asvp.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares__htable_stvp.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares__timeval.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_parse_naptr_reply.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_strdup.h /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_timeout.c 
 /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_search.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_private.h /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_nowarn.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares__parse_into_addrinfo.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_inet_net_pton.h /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares__llist.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_gethostbyaddr.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_nowarn.h /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares__slist.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_freeaddrinfo.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_parse_caa_reply.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_parse_ptr_reply.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_parse_soa_reply.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_parse_srv_reply.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_parse_txt_reply.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares__htable.h /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares__llist.
 h /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares__slist.h /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_parse_uri_reply.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_strdup.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares__htable.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_strsplit.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_strsplit.h /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_strerror.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/inet_ntop.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares__read_line.c /usr/src/debug/c-ares/1.20.1-r0/src/lib/ares_parse_ns_reply.c", added "/usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_mkquery.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_query.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares__buf.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_destroy.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares__buf.h /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_parse_a_reply.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_parse_aaaa_reply.c /usr/src/debug/c-ares/1.21.0
 -r0/src/lib/ares_dns_mapping.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_getsock.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_rand.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_dns_parse.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_cancel.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_send.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares__get_hostent.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_free_string.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_library_init.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/inet_net_pton.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_process.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares__sortaddrinfo.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_getnameinfo.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares__addrinfo_localhost.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares__close_sockets.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_options.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_expand_name.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/are
 s_expand_string.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_data.h /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_free_hostent.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_getaddrinfo.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/bitncmp.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_create_query.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_data.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_ipv6.h /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_version.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/bitncmp.h /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_dns_record.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares__htable_asvp.h /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares__htable_stvp.h /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares__addrinfo2hostent.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares__readaddrinfo.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_fds.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_init.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_str.c /usr/src/debug/c-ares/1.21.0-r0
 /src/lib/ares_gethostbyname.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares__htable_asvp.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares__htable_stvp.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares__timeval.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_dns_record.h /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_parse_naptr_reply.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_str.h /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_search.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_private.h /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_timeout.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares__parse_into_addrinfo.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_inet_net_pton.h /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_gethostbyaddr.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_parse_ns_reply.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_math.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares__htable.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_parse_uri_reply.c /usr/src/debug/c-ares/1.21.0-r0
 /src/lib/ares_freeaddrinfo.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_parse_caa_reply.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_parse_ptr_reply.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_parse_soa_reply.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_parse_srv_reply.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_parse_txt_reply.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares__htable.h /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares__llist.h /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares__slist.h /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares__llist.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_strsplit.h /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_strsplit.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/inet_ntop.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_strerror.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares__slist.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares__read_line.c /usr/src/debug/c-ares/1.21.0-r0/src/lib/ares_parse_mx_reply.c"
packages/core2-64-poky-linux/c-ares/c-ares-staticdev: PV changed from "1.20.1" to "1.21.0"
packages/core2-64-poky-linux/c-ares/c-ares-staticdev: PKGV changed from 1.20.1 [default] to 1.21.0 [default]
packages/core2-64-poky-linux/c-ares/c-ares-utils: PKGSIZE changed from 45240 to 41144 (-9%)
packages/core2-64-poky-linux/c-ares/c-ares-utils: PV changed from "1.20.1" to "1.21.0"
packages/core2-64-poky-linux/c-ares/c-ares-utils: PKGV changed from 1.20.1 [default] to 1.21.0 [default]
packages/core2-64-poky-linux/c-ares/c-ares: PKGSIZE changed from 116873 to 137153 (+17%)
packages/core2-64-poky-linux/c-ares/c-ares: PV changed from "1.20.1" to "1.21.0"
packages/core2-64-poky-linux/c-ares/c-ares: PKGV changed from 1.20.1 [default] to 1.21.0 [default]
packages/core2-64-poky-linux/c-ares/c-ares: FILELIST: removed "/usr/lib/libcares.so.2.7.1", added "/usr/lib/libcares.so.2.7.2"
packages/core2-64-poky-linux/c-ares: PV changed from "1.20.1" to "1.21.0"
packages/core2-64-poky-linux/c-ares: PKGV changed from 1.20.1 [default] to 1.21.0 [default]
Changes to packages/core2-64-poky-linux/c-ares (sysroot):
  /usr/lib/libcares.so.2 changed symlink target from libcares.so.2.7.1 to libcares.so.2.7.2
  /usr/lib/libcares.so.2.7.1 moved to /usr/lib/libcares.so.2.7.2

--===============3186323747426852803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/c-ares/c-ares-dbg: PKGSIZE changed from 545752 to 627600 (+15%)
packages/core2-64-poky-linux/c-ares/c-ares-src: PKGSIZE changed from 605797 to 696960 (+15%)
packages/core2-64-poky-linux/c-ares/c-ares: PKGSIZE changed from 116873 to 137153 (+17%)
packages/core2-64-poky-linux/c-ares/c-ares: FILELIST: removed "/usr/lib/libcares.so.2.7.1", added "/usr/lib/libcares.so.2.7.2"
Changes to packages/core2-64-poky-linux/c-ares (sysroot):
  /usr/lib/libcares.so.2 changed symlink target from libcares.so.2.7.1 to libcares.so.2.7.2
  /usr/lib/libcares.so.2.7.1 moved to /usr/lib/libcares.so.2.7.2

--===============3186323747426852803==--

