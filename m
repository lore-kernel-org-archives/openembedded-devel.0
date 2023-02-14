Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A20ADC61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 18:08:47 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.1385.1676398118447345949
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Feb 2023 10:08:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SFyDIzpF;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id f47-20020a05600c492f00b003dc584a7b7eso14292228wmp.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Feb 2023 10:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h71AXL848t3brrTk7Tjn8MpB/0FDmb8smOp8IA6m1T0=;
        b=SFyDIzpFsZ/+X5+P8AUup/WVcfX8I4GBuHVHt5S2utnOKK6AlAnKHJMa+XfzZEk+pI
         L6PJN9inD2EqK54tOYvn9f7T5SvbQ1fIN2MkbB/NOGzkJ46OWj9kE11+j27HNpByhJxy
         FBBwWnv3EjNjFMJFXLeeaL4tDve7BlGbB7gCV6pkSPsjvT4swQJductHG2H1aEw77BzA
         djz1OF00yYqqj0ZE8bkPH9nqiyIZYy5Xaw5S63nGXPV+4LitQb6URiVhbnM2NkuSlcIy
         8aaBmCFpj/gAul1DJ4MBK75R/88wTwEaL3c2tuSYGIGV1rRNR7C6sAUf7m63pCMGDGBE
         JgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h71AXL848t3brrTk7Tjn8MpB/0FDmb8smOp8IA6m1T0=;
        b=nvHzq2zpMYiKWX5hf9XxBzhF99qrwvJWoWr83Ze1il5eG9+OAyVBGrb33PS2bknBvH
         luZAxCv1a2t7L4wNYhOUOf9sTCyWO/SUQUEXgEHSxqITvfdrLXnybtONYsfM3HauSvw9
         RdkAIuVII6minXw7ruCoha4E29mRHWfsrjf47j2VEWxeKDVLI/W1kJIhoP4HtQmjB5Y/
         FasmBl4MMdTyGn81A+5H4pU7Q+HRRGx2bKGWFd5pDxUIOf6sIk0pQO58IGG7Ts6fG0Fy
         CgpGj4ogtnYanG+yR/nbyvKR0Z7QtMdx541TbzNpBkxcqCYncn0oArWEg4wis/PMux7q
         yuLw==
X-Gm-Message-State: AO0yUKVECr8wUvr4YccDrhVgqNmWBJkmHEZ4O6c+uoeZRqqeYXVXni+4
	PT0gk/Z1PmBwcqFjXSptcrfeZrO4dBs=
X-Google-Smtp-Source: AK7set8dF0SprT/KDuMMxlUjgTR5RR03Ih9zRFvnsFebuMtl073f2yP+/YSj3yTS8oNqWZjUCy+poA==
X-Received: by 2002:a05:600c:4a98:b0:3dc:5240:53b6 with SMTP id b24-20020a05600c4a9800b003dc524053b6mr2848836wmp.6.1676398116808;
        Tue, 14 Feb 2023 10:08:36 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id be7-20020a05600c1e8700b003dff2b493c8sm22651548wmb.36.2023.02.14.10.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 10:08:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][kirkstone][langdale][PATCH] mdns: use git fetcher
Date: Tue, 14 Feb 2023 19:08:33 +0100
Message-Id: <20230214180833.332064-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Feb 2023 18:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101078

* https://opensource.apple.com/tarballs/mDNSResponder/mDNSResponder-${PV}.tar.gz
  is just redirect to unsafe github archives which are regenerated from time to
  time.

* We do have src-uri-bad QA check which prevents to use github archives in SRC_URI
  since 2019:
  https://github.com/openembedded/openembedded-core/commit/21f84fcdd659544437fe393285c407e1e9432043
  but this cannot catch such redirects, see:

$ wget https://opensource.apple.com/tarballs/mDNSResponder/mDNSResponder-878.30.4.tar.gz
--2023-01-31 10:06:02--  https://opensource.apple.com/tarballs/mDNSResponder/mDNSResponder-878.30.4.tar.gz
Resolving opensource.apple.com (opensource.apple.com)... 17.253.73.203, 17.253.73.206, 2a01:b740:a26:f000::5, ...
Connecting to opensource.apple.com (opensource.apple.com)|17.253.73.203|:443... connected.
HTTP request sent, awaiting response... 302 Redirect
Location: https://github.com/apple-oss-distributions/mDNSResponder/archive/refs/tags/mDNSResponder-878.30.4.tar.gz [following]
--2023-01-31 10:06:02--  https://github.com/apple-oss-distributions/mDNSResponder/archive/refs/tags/mDNSResponder-878.30.4.tar.gz
Resolving github.com (github.com)... 140.82.121.3
Connecting to github.com (github.com)|140.82.121.3|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://codeload.github.com/apple-oss-distributions/mDNSResponder/tar.gz/refs/tags/mDNSResponder-878.30.4 [following]
--2023-01-31 10:06:02--  https://codeload.github.com/apple-oss-distributions/mDNSResponder/tar.gz/refs/tags/mDNSResponder-878.30.4
Resolving codeload.github.com (codeload.github.com)... 140.82.121.10
Connecting to codeload.github.com (codeload.github.com)|140.82.121.10|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [application/x-gzip]
Saving to: ?mDNSResponder-878.30.4.tar.gz?

* The tarball was regenerated recently as discussed in:
  https://github.com/orgs/community/discussions/45830

* it's already included in master as part of version upgrade in:
  https://github.com/openembedded/meta-openembedded/commit/ec96eb577bd518b89e2e7834bd569ba269df458f

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-protocols/mdns/mdns_1310.140.1.bb | 32 ++++++++++---------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/meta-networking/recipes-protocols/mdns/mdns_1310.140.1.bb b/meta-networking/recipes-protocols/mdns/mdns_1310.140.1.bb
index 205dc929be..7aefc3186a 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_1310.140.1.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_1310.140.1.bb
@@ -8,22 +8,24 @@ DEPENDS:append:libc-musl = " musl-nscd"
 
 RPROVIDES:${PN} += "libdns_sd.so"
 
-SRC_URI = "https://opensource.apple.com/tarballs/mDNSResponder/mDNSResponder-${PV}.tar.gz \
+# matches annotated tag mDNSResponder-1310.140.1
+SRCREV = "1d1de95b98fba2077d34c9d78b839a96aa0e1c77"
+BRANCH = "rel/mDNSResponder-1310"
+SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https;branch=${BRANCH} \
            file://mdns.service \
-           file://0001-mdns-include-stddef.h-for-NULL.patch;patchdir=.. \
-           file://0002-mdns-cross-compilation-fixes-for-bitbake.patch;patchdir=.. \
-           file://0001-Create-subroutine-for-cleaning-recent-interfaces.patch;patchdir=.. \
-           file://0002-Create-subroutine-for-tearing-down-an-interface.patch;patchdir=.. \
-           file://0003-Track-interface-socket-family.patch;patchdir=.. \
-           file://0004-Use-list-for-changed-interfaces.patch;patchdir=.. \
-           file://0006-Remove-unneeded-function.patch;patchdir=.. \
-           file://0008-Mark-deleted-interfaces-as-being-changed.patch;patchdir=.. \
-           file://0009-Fix-possible-NULL-dereference.patch;patchdir=.. \
-           file://0010-Handle-errors-from-socket-calls.patch;patchdir=.. \
-           file://0011-Change-a-dynamic-allocation-to-file-scope-variable.patch;patchdir=.. \
-           file://0001-dns-sd-Include-missing-headers.patch;patchdir=.. \
+           file://0001-mdns-include-stddef.h-for-NULL.patch \
+           file://0002-mdns-cross-compilation-fixes-for-bitbake.patch \
+           file://0001-Create-subroutine-for-cleaning-recent-interfaces.patch \
+           file://0002-Create-subroutine-for-tearing-down-an-interface.patch \
+           file://0003-Track-interface-socket-family.patch \
+           file://0004-Use-list-for-changed-interfaces.patch \
+           file://0006-Remove-unneeded-function.patch \
+           file://0008-Mark-deleted-interfaces-as-being-changed.patch \
+           file://0009-Fix-possible-NULL-dereference.patch \
+           file://0010-Handle-errors-from-socket-calls.patch \
+           file://0011-Change-a-dynamic-allocation-to-file-scope-variable.patch \
+           file://0001-dns-sd-Include-missing-headers.patch \
            "
-SRC_URI[sha256sum] = "040f6495c18b9f0557bcf9e00cbcfc82b03405f5ba6963dc147730ca0ca90d6f"
 
 CVE_PRODUCT = "apple:mdnsresponder"
 
@@ -42,7 +44,7 @@ CVE_CHECK_IGNORE += "CVE-2007-0613"
 
 PARALLEL_MAKE = ""
 
-S = "${WORKDIR}/mDNSResponder-${PV}/mDNSPosix"
+S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE += "os=linux DEBUG=0 'CC=${CC}' 'LD=${CCLD} ${LDFLAGS}'"
 
-- 
2.39.1


