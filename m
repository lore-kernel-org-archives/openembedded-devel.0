Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023FFC04A68
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:49 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.63857.1699041164726183513
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QPBe8uz3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=AphX9cU2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018b96beb9b5-3b289715-7638-4717-b1e3-b7db7576848c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041163;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0zR5UxC4P6RGEdE/kOY7FTndxt6MN7/HQVhimvDG1+w=;
	b=QPBe8uz3VrgWhgj16SXujrLAidFC+3K7en1Hif4MhO3+GtC6DhfC3PjLpBMSLSUQ
	oBqvTRnqQLYApJYTZVStKKpZL5JPrwG6VU6RmlzrCzyts6G7WV3HePj6acm29Im29w2
	wzSle3iXdK0ZWeIdLLG4LGKx0nbAMixrr7Zqh/kg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041163;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0zR5UxC4P6RGEdE/kOY7FTndxt6MN7/HQVhimvDG1+w=;
	b=AphX9cU2B1SUwAOQ5AuEzvrHEtNIm5SqbhO1jULC6oFjrHo8k8rL8SEk4NERHm2g
	xxIbeZejPw168ZTcEx6hxEYPzKnUBZc6eresUz4l8PoNhjIK7SkMrtQprUA6GAqTQgB
	gWEl/VcYmYVUlX1dW0snNmjsacB+n37DLYt4huqI=
Content-Type: multipart/mixed; boundary="===============3910650350421392252=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] abseil-cpp: upgrading to 20230802.1 SUCCEEDED
Message-ID: <0101018b96beb9b5-3b289715-7638-4717-b1e3-b7db7576848c-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:43 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.45
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105874

--===============3910650350421392252==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *abseil-cpp* to *20230802.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-abseil-cpp-upgrade-20230802.0-20230802.1.patch
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
From 23044a4e9c1c0541f4523ceb59d91e785ad894b2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 11:26:07 +0000
Subject: [PATCH] abseil-cpp: upgrade 20230802.0 -> 20230802.1

---
 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index f847ebf15..5003187d0 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -7,8 +7,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
 
-PV = "20230802.0"
-SRCREV = "29bf8085f3bf17b84d30e34b3d7ff8248fda404e"
+PV = "20230802.1"
+SRCREV = "fb3621f4f897824c0dbe0615fa94543df6192f30"
 BRANCH = "lts_2023_08_02"
 SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
            file://0001-absl-always-use-asm-sgidefs.h.patch             \
-- 
2.39.2


--===============3910650350421392252==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/abseil-cpp/abseil-cpp-dbg: PV changed from "20230802.0" to "20230802.1"
packages/core2-64-poky-linux/abseil-cpp/abseil-cpp-dbg: PKGSIZE changed from 18641768 to 18641784 (+0%)
packages/core2-64-poky-linux/abseil-cpp/abseil-cpp-dbg: PKGV changed from 20230802.0 [default] to 20230802.1 [default]
packages/core2-64-poky-linux/abseil-cpp/abseil-cpp-dev: PV changed from "20230802.0" to "20230802.1"
packages/core2-64-poky-linux/abseil-cpp/abseil-cpp-dev: PKGSIZE changed from 3961291 to 3961388 (+0%)
packages/core2-64-poky-linux/abseil-cpp/abseil-cpp-dev: PKGV changed from 20230802.0 [default] to 20230802.1 [default]
packages/core2-64-poky-linux/abseil-cpp/abseil-cpp-doc: PV changed from "20230802.0" to "20230802.1"
packages/core2-64-poky-linux/abseil-cpp/abseil-cpp-doc: PKGV changed from 20230802.0 [default] to 20230802.1 [default]
packages/core2-64-poky-linux/abseil-cpp/abseil-cpp-locale: PV changed from "20230802.0" to "20230802.1"
packages/core2-64-poky-linux/abseil-cpp/abseil-cpp-locale: PKGV changed from 20230802.0 [default] to 20230802.1 [default]
packages/core2-64-poky-linux/abseil-cpp/abseil-cpp-src: PV changed from "20230802.0" to "20230802.1"
packages/core2-64-poky-linux/abseil-cpp/abseil-cpp-src: PKGSIZE changed from 3918393 to 3918742 (+0%)
packages/core2-64-poky-linux/abseil-cpp/abseil-cpp-src: PKGV changed from 20230802.0 [default] to 20230802.1 [default]
packages/core2-64-poky-linux/abseil-cpp/abseil-cpp-staticdev: PV changed from "20230802.0" to "20230802.1"
packages/core2-64-poky-linux/abseil-cpp/abseil-cpp-staticdev: PKGV changed from 20230802.0 [default] to 20230802.1 [default]
packages/core2-64-poky-linux/abseil-cpp/abseil-cpp: PV changed from "20230802.0" to "20230802.1"
packages/core2-64-poky-linux/abseil-cpp/abseil-cpp: PKGV changed from 20230802.0 [default] to 20230802.1 [default]
packages/core2-64-poky-linux/abseil-cpp: PV changed from "20230802.0" to "20230802.1"
packages/core2-64-poky-linux/abseil-cpp: PKGV changed from 20230802.0 [default] to 20230802.1 [default]

--===============3910650350421392252==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-abseil-cpp-upgrade-20230802.0-20230802.1.patch"

RnJvbSAyMzA0NGE0ZTljMWMwNTQxZjQ1MjNjZWI1OWQ5MWU3ODVhZDg5NGIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxMToyNjowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGFi
c2VpbC1jcHA6IHVwZ3JhZGUgMjAyMzA4MDIuMCAtPiAyMDIzMDgwMi4xCgotLS0KIG1ldGEtb2Uv
cmVjaXBlcy1kZXZ0b29scy9hYnNlaWwtY3BwL2Fic2VpbC1jcHBfZ2l0LmJiIHwgNCArKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9hYnNlaWwtY3BwL2Fic2VpbC1jcHBfZ2l0LmJi
IGIvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2Fic2VpbC1jcHAvYWJzZWlsLWNwcF9naXQuYmIK
aW5kZXggZjg0N2ViZjE1Li41MDAzMTg3ZDAgMTAwNjQ0Ci0tLSBhL21ldGEtb2UvcmVjaXBlcy1k
ZXZ0b29scy9hYnNlaWwtY3BwL2Fic2VpbC1jcHBfZ2l0LmJiCisrKyBiL21ldGEtb2UvcmVjaXBl
cy1kZXZ0b29scy9hYnNlaWwtY3BwL2Fic2VpbC1jcHBfZ2l0LmJiCkBAIC03LDggKzcsOCBAQCBT
RUNUSU9OID0gImxpYnMiCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT1kZjUyYzZlZGI3YWRjMjJlNTMzYjJiYWNjM2JkMzkxNSIK
IAotUFYgPSAiMjAyMzA4MDIuMCIKLVNSQ1JFViA9ICIyOWJmODA4NWYzYmYxN2I4NGQzMGUzNGIz
ZDdmZjgyNDhmZGE0MDRlIgorUFYgPSAiMjAyMzA4MDIuMSIKK1NSQ1JFViA9ICJmYjM2MjFmNGY4
OTc4MjRjMGRiZTA2MTVmYTk0NTQzZGY2MTkyZjMwIgogQlJBTkNIID0gImx0c18yMDIzXzA4XzAy
IgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2Fic2VpbC9hYnNlaWwtY3BwO2JyYW5jaD0k
e0JSQU5DSH07cHJvdG9jb2w9aHR0cHMgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1hYnNsLWFs
d2F5cy11c2UtYXNtLXNnaWRlZnMuaC5wYXRjaCAgICAgICAgICAgICBcCi0tIAoyLjM5LjIKCg==

--===============3910650350421392252==--

