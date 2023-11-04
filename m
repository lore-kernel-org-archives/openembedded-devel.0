Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48C6DC0018A
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 08:02:03 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.5647.1699084915361143837
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 01:01:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EbouRyfH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=oZavwb2k;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018b995a4f1f-21fd4fb6-e820-403d-ba7f-14c1cd336602-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699084914;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Em95aw2+9l8fxgLWIyqA3QewHs/zt/jPpyBcNSUdUvc=;
	b=EbouRyfH1VhdUXmWEdUMpPdMcm0mJeu2zPiqOxonaexuFq9A4pzQfU8rjUsuGxe8
	JQzhXvZP1FgEZ8/6ZxbD7B4ae/cFHMJNmSffrAm2EuzTwowm3wOd4BYLTJHNf7u3mt8
	PeiEBiS7YeJ7vDwUEtUtEMt7ERwsLfzlGqMkVpns=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699084914;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Em95aw2+9l8fxgLWIyqA3QewHs/zt/jPpyBcNSUdUvc=;
	b=oZavwb2kATF+GjPE53fKTn+Kh3fN/7uNbFF4YpsuofB7x/3s9Cne1kmM7ToA+1To
	GNK8TVVpIFU+D5pSIL21F5opVRIiIX9Z2FhxyRte0czEUZ03zRQA5qT8c8QPeGmSlwm
	r8K4iN1WAHXhrGAFthub95lHajby2RpBdufpmbcA=
Content-Type: multipart/mixed; boundary="===============8719520393894035876=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] nginx: upgrading to 1.25.3 FAILED
Message-ID: <0101018b995a4f1f-21fd4fb6-e820-403d-ba7f-14c1cd336602-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 08:01:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 08:02:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106369

--===============8719520393894035876==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *nginx* to *1.25.3* has Failed(other errors).

Detailed error information:

Failed(unknown error)
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh-meta-oe/build/build/../auto-upgrade-helper/upgrade-helper.py", line 497, in run
    step(self.devtool, self.bb, self.git, self.opts, pkg_ctx)
  File "/home/pokybuild/yocto-worker/auh-meta-oe/build/auto-upgrade-helper/modules/steps.py", line 39, in load_env
    os.mkdir(pkg_ctx['workdir'])
FileExistsError: [Errno 17] File exists: '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/upgrade-helper/meta-webserver/20231104074835/all/nginx'




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 13880814a7e0d1daac1b6ecd8c2fa5ced3792c34 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 07:56:22 +0000
Subject: [PATCH] nginx: upgrade 1.25.2 -> 1.25.3

---
 .../recipes-httpd/nginx/{nginx_1.25.2.bb => nginx_1.25.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.25.2.bb => nginx_1.25.3.bb} (51%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.25.2.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb
similarity index 51%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.25.2.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb
index 66eef2389..8aa9fa026 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.25.2.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb
@@ -2,5 +2,5 @@ require nginx.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=79ad2eb837299421c4435dedc8897b3d"
 
-SRC_URI[sha256sum] = "05dd6d9356d66a74e61035f2a42162f8c754c97cf1ba64e7a801ba158d6c0711"
+SRC_URI[sha256sum] = "64c5b975ca287939e828303fa857d22f142b251f17808dfe41733512d9cded86"
 
-- 
2.39.2


--===============8719520393894035876==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/nginx: SRC_URI changed from "http://nginx.org/download/nginx-1.25.2.tar.gz file://nginx-cross.patch file://0001-Allow-the-overriding-of-the-endianness-via-the-confi.patch file://nginx.conf file://default_server.site file://proxy_params file://nginx.init file://nginx-volatile.conf file://nginx.service file://nginx-fix-pidfile.patch file://0001-configure-libxslt-conf.patch" to "http://nginx.org/download/nginx-1.25.3.tar.gz file://nginx-cross.patch file://0001-Allow-the-overriding-of-the-endianness-via-the-confi.patch file://nginx.conf file://default_server.site file://proxy_params file://nginx.init file://nginx-volatile.conf file://nginx.service file://nginx-fix-pidfile.patch file://0001-configure-libxslt-conf.patch"
packages/core2-64-poky-linux/nginx: PKGV changed from 1.25.2 [default] to 1.25.3 [default]
packages/core2-64-poky-linux/nginx: PV changed from "1.25.2" to "1.25.3"
packages/core2-64-poky-linux/nginx/nginx-dbg: PKGSIZE changed from 3832984 to 3834072 (+0%)
packages/core2-64-poky-linux/nginx/nginx-dbg: PKGV changed from 1.25.2 [default] to 1.25.3 [default]
packages/core2-64-poky-linux/nginx/nginx-dbg: PV changed from "1.25.2" to "1.25.3"
packages/core2-64-poky-linux/nginx/nginx-dev: PKGV changed from 1.25.2 [default] to 1.25.3 [default]
packages/core2-64-poky-linux/nginx/nginx-dev: PV changed from "1.25.2" to "1.25.3"
packages/core2-64-poky-linux/nginx/nginx-doc: PKGV changed from 1.25.2 [default] to 1.25.3 [default]
packages/core2-64-poky-linux/nginx/nginx-doc: PV changed from "1.25.2" to "1.25.3"
packages/core2-64-poky-linux/nginx/nginx-locale: PKGV changed from 1.25.2 [default] to 1.25.3 [default]
packages/core2-64-poky-linux/nginx/nginx-locale: PV changed from "1.25.2" to "1.25.3"
packages/core2-64-poky-linux/nginx/nginx-src: PKGSIZE changed from 3380993 to 3381800 (+0%)
packages/core2-64-poky-linux/nginx/nginx-src: PKGV changed from 1.25.2 [default] to 1.25.3 [default]
packages/core2-64-poky-linux/nginx/nginx-src: PV changed from "1.25.2" to "1.25.3"
packages/core2-64-poky-linux/nginx/nginx-staticdev: PKGV changed from 1.25.2 [default] to 1.25.3 [default]
packages/core2-64-poky-linux/nginx/nginx-staticdev: PV changed from "1.25.2" to "1.25.3"
packages/core2-64-poky-linux/nginx/nginx: PKGV changed from 1.25.2 [default] to 1.25.3 [default]
packages/core2-64-poky-linux/nginx/nginx: PV changed from "1.25.2" to "1.25.3"

--===============8719520393894035876==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-nginx-upgrade-1.25.2-1.25.3.patch"

RnJvbSAxMzg4MDgxNGE3ZTBkMWRhYWMxYjZlY2Q4YzJmYTVjZWQzNzkyYzM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNzo1NjoyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG5n
aW54OiB1cGdyYWRlIDEuMjUuMiAtPiAxLjI1LjMKCi0tLQogLi4uL3JlY2lwZXMtaHR0cGQvbmdp
bngve25naW54XzEuMjUuMi5iYiA9PiBuZ2lueF8xLjI1LjMuYmJ9ICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS13ZWJz
ZXJ2ZXIvcmVjaXBlcy1odHRwZC9uZ2lueC97bmdpbnhfMS4yNS4yLmJiID0+IG5naW54XzEuMjUu
My5iYn0gKDUxJSkKCmRpZmYgLS1naXQgYS9tZXRhLXdlYnNlcnZlci9yZWNpcGVzLWh0dHBkL25n
aW54L25naW54XzEuMjUuMi5iYiBiL21ldGEtd2Vic2VydmVyL3JlY2lwZXMtaHR0cGQvbmdpbngv
bmdpbnhfMS4yNS4zLmJiCnNpbWlsYXJpdHkgaW5kZXggNTElCnJlbmFtZSBmcm9tIG1ldGEtd2Vi
c2VydmVyL3JlY2lwZXMtaHR0cGQvbmdpbngvbmdpbnhfMS4yNS4yLmJiCnJlbmFtZSB0byBtZXRh
LXdlYnNlcnZlci9yZWNpcGVzLWh0dHBkL25naW54L25naW54XzEuMjUuMy5iYgppbmRleCA2NmVl
ZjIzODkuLjhhYTlmYTAyNiAxMDA2NDQKLS0tIGEvbWV0YS13ZWJzZXJ2ZXIvcmVjaXBlcy1odHRw
ZC9uZ2lueC9uZ2lueF8xLjI1LjIuYmIKKysrIGIvbWV0YS13ZWJzZXJ2ZXIvcmVjaXBlcy1odHRw
ZC9uZ2lueC9uZ2lueF8xLjI1LjMuYmIKQEAgLTIsNSArMiw1IEBAIHJlcXVpcmUgbmdpbnguaW5j
CiAKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTc5YWQyZWI4MzcyOTk0
MjFjNDQzNWRlZGM4ODk3YjNkIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDVkZDZkOTM1NmQ2
NmE3NGU2MTAzNWYyYTQyMTYyZjhjNzU0Yzk3Y2YxYmE2NGU3YTgwMWJhMTU4ZDZjMDcxMSIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICI2NGM1Yjk3NWNhMjg3OTM5ZTgyODMwM2ZhODU3ZDIyZjE0MmIy
NTFmMTc4MDhkZmU0MTczMzUxMmQ5Y2RlZDg2IgogCi0tIAoyLjM5LjIKCg==

--===============8719520393894035876==--

