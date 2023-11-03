Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 546C7C25B62
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:54 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.63872.1699041166191524446
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eW/zt8An;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=GpF5Rj6Z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018b96bedf77-99b4b719-9c53-4855-995b-12912c7036ee-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041173;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UdMq8qoz9M4ATrX9DnA0/usteoqkGFOP041t/cmRTzQ=;
	b=eW/zt8AnLWllfWAtyAd0dlDu5ZtkdF5C/cJllIYKCJm++Q8RLX0fIeAYQu5xFz51
	1sBUQ04b35qvQc2u1f4hxuC6xpV3vwgoqQiv4iKC7OC7CjN36UvNM0ojitP9YTA4oHe
	PGfnvesHuCDLWaFJ3dFcNMWSsu8w0y0K9iisOyFE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041173;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UdMq8qoz9M4ATrX9DnA0/usteoqkGFOP041t/cmRTzQ=;
	b=GpF5Rj6Zm5LPSA8O5vrin2gnfRb+UPJYu8gz4IkC4VrZrTX6j4xGrdxxm/Xt1NnZ
	kMtzttUddasz4PdaRvS27ueZnjv+TqytiTfEqvRASjXPLih6AJu71vfFF6F0bu3hrRg
	ifilykeSMxnr9fgXdUi3n09rOBGBscTBltLWzoCs=
Content-Type: multipart/mixed; boundary="===============0657401080442879867=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] redis: upgrading to 7.2.3 FAILED
Message-ID: <0101018b96bedf77-99b4b719-9c53-4855-995b-12912c7036ee-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106008

--===============0657401080442879867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *redis* to *7.2.3* has Failed(other errors).

Detailed error information:

Failed(unknown error)
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh-meta-oe/build/build/../auto-upgrade-helper/upgrade-helper.py", line 497, in run
    step(self.devtool, self.bb, self.git, self.opts, pkg_ctx)
  File "/home/pokybuild/yocto-worker/auh-meta-oe/build/auto-upgrade-helper/modules/steps.py", line 39, in load_env
    os.mkdir(pkg_ctx['workdir'])
FileExistsError: [Errno 17] File exists: '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/upgrade-helper/meta-oe/20231103111813/all/redis'




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 04c4ced90116ce7efadb339f0034a6ab18b793ea Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 18:08:53 +0000
Subject: [PATCH] redis: upgrade 7.2.2 -> 7.2.3

---
 .../0001-src-Do-not-reset-FINAL_LIBS.patch                      | 0
 .../0006-Define-correct-gregs-for-RISCV32.patch                 | 0
 .../redis/{redis-7.2.2 => redis-7.2.3}/GNU_SOURCE-7.patch       | 0
 .../hiredis-use-default-CC-if-it-is-set.patch                   | 0
 .../redis/{redis-7.2.2 => redis-7.2.3}/init-redis-server        | 0
 .../lua-update-Makefile-to-use-environment-build-setting.patch  | 0
 .../redis/{redis-7.2.2 => redis-7.2.3}/oe-use-libc-malloc.patch | 0
 .../redis/{redis-7.2.2 => redis-7.2.3}/redis.conf               | 0
 .../redis/{redis-7.2.2 => redis-7.2.3}/redis.service            | 0
 .../recipes-extended/redis/{redis_7.2.2.bb => redis_7.2.3.bb}   | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis-7.2.2 => redis-7.2.3}/0001-src-Do-not-reset-FINAL_LIBS.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.2 => redis-7.2.3}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.2 => redis-7.2.3}/GNU_SOURCE-7.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.2 => redis-7.2.3}/hiredis-use-default-CC-if-it-is-set.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.2 => redis-7.2.3}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.2 => redis-7.2.3}/lua-update-Makefile-to-use-environment-build-setting.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.2 => redis-7.2.3}/oe-use-libc-malloc.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.2 => redis-7.2.3}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.2 => redis-7.2.3}/redis.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_7.2.2.bb => redis_7.2.3.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis-7.2.2/0001-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis-7.2.3/0001-src-Do-not-reset-FINAL_LIBS.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.2/0001-src-Do-not-reset-FINAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.3/0001-src-Do-not-reset-FINAL_LIBS.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.2/0006-Define-correct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis-7.2.3/0006-Define-correct-gregs-for-RISCV32.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.2/0006-Define-correct-gregs-for-RISCV32.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.3/0006-Define-correct-gregs-for-RISCV32.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.2/GNU_SOURCE-7.patch b/meta-oe/recipes-extended/redis/redis-7.2.3/GNU_SOURCE-7.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.2/GNU_SOURCE-7.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.3/GNU_SOURCE-7.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.2/hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-7.2.3/hiredis-use-default-CC-if-it-is-set.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.2/hiredis-use-default-CC-if-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.3/hiredis-use-default-CC-if-it-is-set.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.2/init-redis-server b/meta-oe/recipes-extended/redis/redis-7.2.3/init-redis-server
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.2/init-redis-server
rename to meta-oe/recipes-extended/redis/redis-7.2.3/init-redis-server
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.2/lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis-7.2.3/lua-update-Makefile-to-use-environment-build-setting.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.2/lua-update-Makefile-to-use-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.3/lua-update-Makefile-to-use-environment-build-setting.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.2/oe-use-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis-7.2.3/oe-use-libc-malloc.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.2/oe-use-libc-malloc.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.3/oe-use-libc-malloc.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.2/redis.conf b/meta-oe/recipes-extended/redis/redis-7.2.3/redis.conf
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.2/redis.conf
rename to meta-oe/recipes-extended/redis/redis-7.2.3/redis.conf
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.2/redis.service b/meta-oe/recipes-extended/redis/redis-7.2.3/redis.service
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.2/redis.service
rename to meta-oe/recipes-extended/redis/redis-7.2.3/redis.service
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.2.bb b/meta-oe/recipes-extended/redis/redis_7.2.3.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.2.2.bb
rename to meta-oe/recipes-extended/redis/redis_7.2.3.bb
index 44fb01bc8..cef979768 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.2.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.3.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE-7.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "ca999be08800edc6d265379c4c7aafad92f0ee400692e4e2d69829ab4b4c3d08"
+SRC_URI[sha256sum] = "3e2b196d6eb4ddb9e743088bfc2915ccbb42d40f5a8a3edd8cb69c716ec34be7"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.39.2


--===============0657401080442879867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/redis: SRC_URI changed from "http://download.redis.io/releases/redis-7.2.2.tar.gz file://redis.conf file://init-redis-server file://redis.service file://hiredis-use-default-CC-if-it-is-set.patch file://lua-update-Makefile-to-use-environment-build-setting.patch file://oe-use-libc-malloc.patch file://0001-src-Do-not-reset-FINAL_LIBS.patch file://GNU_SOURCE-7.patch file://0006-Define-correct-gregs-for-RISCV32.patch" to "http://download.redis.io/releases/redis-7.2.3.tar.gz file://redis.conf file://init-redis-server file://redis.service file://hiredis-use-default-CC-if-it-is-set.patch file://lua-update-Makefile-to-use-environment-build-setting.patch file://oe-use-libc-malloc.patch file://0001-src-Do-not-reset-FINAL_LIBS.patch file://GNU_SOURCE-7.patch file://0006-Define-correct-gregs-for-RISCV32.patch"
packages/core2-64-poky-linux/redis: PKGV changed from 7.2.2 [default] to 7.2.3 [default]
packages/core2-64-poky-linux/redis: PV changed from "7.2.2" to "7.2.3"
packages/core2-64-poky-linux/redis/redis-dbg: PKGSIZE changed from 9549400 to 9549816 (+0%)
packages/core2-64-poky-linux/redis/redis-dbg: PKGV changed from 7.2.2 [default] to 7.2.3 [default]
packages/core2-64-poky-linux/redis/redis-dbg: PV changed from "7.2.2" to "7.2.3"
packages/core2-64-poky-linux/redis/redis-dev: PKGV changed from 7.2.2 [default] to 7.2.3 [default]
packages/core2-64-poky-linux/redis/redis-dev: PV changed from "7.2.2" to "7.2.3"
packages/core2-64-poky-linux/redis/redis-doc: PKGV changed from 7.2.2 [default] to 7.2.3 [default]
packages/core2-64-poky-linux/redis/redis-doc: PV changed from "7.2.2" to "7.2.3"
packages/core2-64-poky-linux/redis/redis-locale: PKGV changed from 7.2.2 [default] to 7.2.3 [default]
packages/core2-64-poky-linux/redis/redis-locale: PV changed from "7.2.2" to "7.2.3"
packages/core2-64-poky-linux/redis/redis-src: PKGSIZE changed from 7068012 to 7068100 (+0%)
packages/core2-64-poky-linux/redis/redis-src: PKGV changed from 7.2.2 [default] to 7.2.3 [default]
packages/core2-64-poky-linux/redis/redis-src: PV changed from "7.2.2" to "7.2.3"
packages/core2-64-poky-linux/redis/redis-staticdev: PKGV changed from 7.2.2 [default] to 7.2.3 [default]
packages/core2-64-poky-linux/redis/redis-staticdev: PV changed from "7.2.2" to "7.2.3"
packages/core2-64-poky-linux/redis/redis: PKGV changed from 7.2.2 [default] to 7.2.3 [default]
packages/core2-64-poky-linux/redis/redis: PV changed from "7.2.2" to "7.2.3"

--===============0657401080442879867==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-redis-upgrade-7.2.2-7.2.3.patch"

RnJvbSAwNGM0Y2VkOTAxMTZjZTdlZmFkYjMzOWYwMDM0YTZhYjE4Yjc5M2VhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxODowODo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
ZGlzOiB1cGdyYWRlIDcuMi4yIC0+IDcuMi4zCgotLS0KIC4uLi8wMDAxLXNyYy1Eby1ub3QtcmVz
ZXQtRklOQUxfTElCUy5wYXRjaCAgICAgICAgICAgICAgICAgICAgICB8IDAKIC4uLi8wMDA2LURl
ZmluZS1jb3JyZWN0LWdyZWdzLWZvci1SSVNDVjMyLnBhdGNoICAgICAgICAgICAgICAgICB8IDAK
IC4uLi9yZWRpcy97cmVkaXMtNy4yLjIgPT4gcmVkaXMtNy4yLjN9L0dOVV9TT1VSQ0UtNy5wYXRj
aCAgICAgICB8IDAKIC4uLi9oaXJlZGlzLXVzZS1kZWZhdWx0LUNDLWlmLWl0LWlzLXNldC5wYXRj
aCAgICAgICAgICAgICAgICAgICB8IDAKIC4uLi9yZWRpcy97cmVkaXMtNy4yLjIgPT4gcmVkaXMt
Ny4yLjN9L2luaXQtcmVkaXMtc2VydmVyICAgICAgICB8IDAKIC4uLi9sdWEtdXBkYXRlLU1ha2Vm
aWxlLXRvLXVzZS1lbnZpcm9ubWVudC1idWlsZC1zZXR0aW5nLnBhdGNoICB8IDAKIC4uLi9yZWRp
cy97cmVkaXMtNy4yLjIgPT4gcmVkaXMtNy4yLjN9L29lLXVzZS1saWJjLW1hbGxvYy5wYXRjaCB8
IDAKIC4uLi9yZWRpcy97cmVkaXMtNy4yLjIgPT4gcmVkaXMtNy4yLjN9L3JlZGlzLmNvbmYgICAg
ICAgICAgICAgICB8IDAKIC4uLi9yZWRpcy97cmVkaXMtNy4yLjIgPT4gcmVkaXMtNy4yLjN9L3Jl
ZGlzLnNlcnZpY2UgICAgICAgICAgICB8IDAKIC4uLi9yZWNpcGVzLWV4dGVuZGVkL3JlZGlzL3ty
ZWRpc183LjIuMi5iYiA9PiByZWRpc183LjIuMy5iYn0gICB8IDIgKy0KIDEwIGZpbGVzIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS1vZS9yZWNpcGVz
LWV4dGVuZGVkL3JlZGlzL3tyZWRpcy03LjIuMiA9PiByZWRpcy03LjIuM30vMDAwMS1zcmMtRG8t
bm90LXJlc2V0LUZJTkFMX0xJQlMucGF0Y2ggKDEwMCUpCiByZW5hbWUgbWV0YS1vZS9yZWNpcGVz
LWV4dGVuZGVkL3JlZGlzL3tyZWRpcy03LjIuMiA9PiByZWRpcy03LjIuM30vMDAwNi1EZWZpbmUt
Y29ycmVjdC1ncmVncy1mb3ItUklTQ1YzMi5wYXRjaCAoMTAwJSkKIHJlbmFtZSBtZXRhLW9lL3Jl
Y2lwZXMtZXh0ZW5kZWQvcmVkaXMve3JlZGlzLTcuMi4yID0+IHJlZGlzLTcuMi4zfS9HTlVfU09V
UkNFLTcucGF0Y2ggKDEwMCUpCiByZW5hbWUgbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3JlZGlz
L3tyZWRpcy03LjIuMiA9PiByZWRpcy03LjIuM30vaGlyZWRpcy11c2UtZGVmYXVsdC1DQy1pZi1p
dC1pcy1zZXQucGF0Y2ggKDEwMCUpCiByZW5hbWUgbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3Jl
ZGlzL3tyZWRpcy03LjIuMiA9PiByZWRpcy03LjIuM30vaW5pdC1yZWRpcy1zZXJ2ZXIgKDEwMCUp
CiByZW5hbWUgbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3JlZGlzL3tyZWRpcy03LjIuMiA9PiBy
ZWRpcy03LjIuM30vbHVhLXVwZGF0ZS1NYWtlZmlsZS10by11c2UtZW52aXJvbm1lbnQtYnVpbGQt
c2V0dGluZy5wYXRjaCAoMTAwJSkKIHJlbmFtZSBtZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvcmVk
aXMve3JlZGlzLTcuMi4yID0+IHJlZGlzLTcuMi4zfS9vZS11c2UtbGliYy1tYWxsb2MucGF0Y2gg
KDEwMCUpCiByZW5hbWUgbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3JlZGlzL3tyZWRpcy03LjIu
MiA9PiByZWRpcy03LjIuM30vcmVkaXMuY29uZiAoMTAwJSkKIHJlbmFtZSBtZXRhLW9lL3JlY2lw
ZXMtZXh0ZW5kZWQvcmVkaXMve3JlZGlzLTcuMi4yID0+IHJlZGlzLTcuMi4zfS9yZWRpcy5zZXJ2
aWNlICgxMDAlKQogcmVuYW1lIG1ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9yZWRpcy97cmVkaXNf
Ny4yLjIuYmIgPT4gcmVkaXNfNy4yLjMuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS1vZS9y
ZWNpcGVzLWV4dGVuZGVkL3JlZGlzL3JlZGlzLTcuMi4yLzAwMDEtc3JjLURvLW5vdC1yZXNldC1G
SU5BTF9MSUJTLnBhdGNoIGIvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3JlZGlzL3JlZGlzLTcu
Mi4zLzAwMDEtc3JjLURvLW5vdC1yZXNldC1GSU5BTF9MSUJTLnBhdGNoCnNpbWlsYXJpdHkgaW5k
ZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvcmVkaXMvcmVkaXMt
Ny4yLjIvMDAwMS1zcmMtRG8tbm90LXJlc2V0LUZJTkFMX0xJQlMucGF0Y2gKcmVuYW1lIHRvIG1l
dGEtb2UvcmVjaXBlcy1leHRlbmRlZC9yZWRpcy9yZWRpcy03LjIuMy8wMDAxLXNyYy1Eby1ub3Qt
cmVzZXQtRklOQUxfTElCUy5wYXRjaApkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWV4dGVu
ZGVkL3JlZGlzL3JlZGlzLTcuMi4yLzAwMDYtRGVmaW5lLWNvcnJlY3QtZ3JlZ3MtZm9yLVJJU0NW
MzIucGF0Y2ggYi9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvcmVkaXMvcmVkaXMtNy4yLjMvMDAw
Ni1EZWZpbmUtY29ycmVjdC1ncmVncy1mb3ItUklTQ1YzMi5wYXRjaApzaW1pbGFyaXR5IGluZGV4
IDEwMCUKcmVuYW1lIGZyb20gbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3JlZGlzL3JlZGlzLTcu
Mi4yLzAwMDYtRGVmaW5lLWNvcnJlY3QtZ3JlZ3MtZm9yLVJJU0NWMzIucGF0Y2gKcmVuYW1lIHRv
IG1ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9yZWRpcy9yZWRpcy03LjIuMy8wMDA2LURlZmluZS1j
b3JyZWN0LWdyZWdzLWZvci1SSVNDVjMyLnBhdGNoCmRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lw
ZXMtZXh0ZW5kZWQvcmVkaXMvcmVkaXMtNy4yLjIvR05VX1NPVVJDRS03LnBhdGNoIGIvbWV0YS1v
ZS9yZWNpcGVzLWV4dGVuZGVkL3JlZGlzL3JlZGlzLTcuMi4zL0dOVV9TT1VSQ0UtNy5wYXRjaApz
aW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVk
L3JlZGlzL3JlZGlzLTcuMi4yL0dOVV9TT1VSQ0UtNy5wYXRjaApyZW5hbWUgdG8gbWV0YS1vZS9y
ZWNpcGVzLWV4dGVuZGVkL3JlZGlzL3JlZGlzLTcuMi4zL0dOVV9TT1VSQ0UtNy5wYXRjaApkaWZm
IC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3JlZGlzL3JlZGlzLTcuMi4yL2hpcmVk
aXMtdXNlLWRlZmF1bHQtQ0MtaWYtaXQtaXMtc2V0LnBhdGNoIGIvbWV0YS1vZS9yZWNpcGVzLWV4
dGVuZGVkL3JlZGlzL3JlZGlzLTcuMi4zL2hpcmVkaXMtdXNlLWRlZmF1bHQtQ0MtaWYtaXQtaXMt
c2V0LnBhdGNoCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhLW9lL3JlY2lw
ZXMtZXh0ZW5kZWQvcmVkaXMvcmVkaXMtNy4yLjIvaGlyZWRpcy11c2UtZGVmYXVsdC1DQy1pZi1p
dC1pcy1zZXQucGF0Y2gKcmVuYW1lIHRvIG1ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9yZWRpcy9y
ZWRpcy03LjIuMy9oaXJlZGlzLXVzZS1kZWZhdWx0LUNDLWlmLWl0LWlzLXNldC5wYXRjaApkaWZm
IC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3JlZGlzL3JlZGlzLTcuMi4yL2luaXQt
cmVkaXMtc2VydmVyIGIvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3JlZGlzL3JlZGlzLTcuMi4z
L2luaXQtcmVkaXMtc2VydmVyCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRh
LW9lL3JlY2lwZXMtZXh0ZW5kZWQvcmVkaXMvcmVkaXMtNy4yLjIvaW5pdC1yZWRpcy1zZXJ2ZXIK
cmVuYW1lIHRvIG1ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9yZWRpcy9yZWRpcy03LjIuMy9pbml0
LXJlZGlzLXNlcnZlcgpkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3JlZGlz
L3JlZGlzLTcuMi4yL2x1YS11cGRhdGUtTWFrZWZpbGUtdG8tdXNlLWVudmlyb25tZW50LWJ1aWxk
LXNldHRpbmcucGF0Y2ggYi9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvcmVkaXMvcmVkaXMtNy4y
LjMvbHVhLXVwZGF0ZS1NYWtlZmlsZS10by11c2UtZW52aXJvbm1lbnQtYnVpbGQtc2V0dGluZy5w
YXRjaApzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS1vZS9yZWNpcGVzLWV4
dGVuZGVkL3JlZGlzL3JlZGlzLTcuMi4yL2x1YS11cGRhdGUtTWFrZWZpbGUtdG8tdXNlLWVudmly
b25tZW50LWJ1aWxkLXNldHRpbmcucGF0Y2gKcmVuYW1lIHRvIG1ldGEtb2UvcmVjaXBlcy1leHRl
bmRlZC9yZWRpcy9yZWRpcy03LjIuMy9sdWEtdXBkYXRlLU1ha2VmaWxlLXRvLXVzZS1lbnZpcm9u
bWVudC1idWlsZC1zZXR0aW5nLnBhdGNoCmRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtZXh0
ZW5kZWQvcmVkaXMvcmVkaXMtNy4yLjIvb2UtdXNlLWxpYmMtbWFsbG9jLnBhdGNoIGIvbWV0YS1v
ZS9yZWNpcGVzLWV4dGVuZGVkL3JlZGlzL3JlZGlzLTcuMi4zL29lLXVzZS1saWJjLW1hbGxvYy5w
YXRjaApzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS1vZS9yZWNpcGVzLWV4
dGVuZGVkL3JlZGlzL3JlZGlzLTcuMi4yL29lLXVzZS1saWJjLW1hbGxvYy5wYXRjaApyZW5hbWUg
dG8gbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3JlZGlzL3JlZGlzLTcuMi4zL29lLXVzZS1saWJj
LW1hbGxvYy5wYXRjaApkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3JlZGlz
L3JlZGlzLTcuMi4yL3JlZGlzLmNvbmYgYi9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvcmVkaXMv
cmVkaXMtNy4yLjMvcmVkaXMuY29uZgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20g
bWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3JlZGlzL3JlZGlzLTcuMi4yL3JlZGlzLmNvbmYKcmVu
YW1lIHRvIG1ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9yZWRpcy9yZWRpcy03LjIuMy9yZWRpcy5j
b25mCmRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvcmVkaXMvcmVkaXMtNy4y
LjIvcmVkaXMuc2VydmljZSBiL21ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9yZWRpcy9yZWRpcy03
LjIuMy9yZWRpcy5zZXJ2aWNlCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRh
LW9lL3JlY2lwZXMtZXh0ZW5kZWQvcmVkaXMvcmVkaXMtNy4yLjIvcmVkaXMuc2VydmljZQpyZW5h
bWUgdG8gbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3JlZGlzL3JlZGlzLTcuMi4zL3JlZGlzLnNl
cnZpY2UKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9yZWRpcy9yZWRpc183
LjIuMi5iYiBiL21ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9yZWRpcy9yZWRpc183LjIuMy5iYgpz
aW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQv
cmVkaXMvcmVkaXNfNy4yLjIuYmIKcmVuYW1lIHRvIG1ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9y
ZWRpcy9yZWRpc183LjIuMy5iYgppbmRleCA0NGZiMDFiYzguLmNlZjk3OTc2OCAxMDA2NDQKLS0t
IGEvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3JlZGlzL3JlZGlzXzcuMi4yLmJiCisrKyBiL21l
dGEtb2UvcmVjaXBlcy1leHRlbmRlZC9yZWRpcy9yZWRpc183LjIuMy5iYgpAQCAtMTcsNyArMTcs
NyBAQCBTUkNfVVJJID0gImh0dHA6Ly9kb3dubG9hZC5yZWRpcy5pby9yZWxlYXNlcy8ke0JQfS50
YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vR05VX1NPVVJDRS03LnBhdGNoIFwKICAgICAgICAg
ICAgZmlsZTovLzAwMDYtRGVmaW5lLWNvcnJlY3QtZ3JlZ3MtZm9yLVJJU0NWMzIucGF0Y2ggXAog
ICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2E5OTliZTA4ODAwZWRjNmQyNjUz
NzljNGM3YWFmYWQ5MmYwZWU0MDA2OTJlNGUyZDY5ODI5YWI0YjRjM2QwOCIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICIzZTJiMTk2ZDZlYjRkZGI5ZTc0MzA4OGJmYzI5MTVjY2JiNDJkNDBmNWE4YTNl
ZGQ4Y2I2OWM3MTZlYzM0YmU3IgogCiBpbmhlcml0IGF1dG90b29scy1icm9rZW5zZXAgdXBkYXRl
LXJjLmQgc3lzdGVtZCB1c2VyYWRkCiAKLS0gCjIuMzkuMgoK

--===============0657401080442879867==--

