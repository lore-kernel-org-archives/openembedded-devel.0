Return-Path: <dzagorui@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E3ACA0FE6
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 12:56:58 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.web10.5452.1693573015129478559
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Sep 2023 05:56:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=gxm0oinE;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: dzagorui@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1386; q=dns/txt; s=iport;
  t=1693573015; x=1694782615;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IoWuhVjGRBNQMsW57eEsJVDOP9XRaMXG5vlxfWSJsyk=;
  b=gxm0oinEIkR/znQ2iVPnA4IP5HG7kAydVL0WFKNBgITtb41epQrwDq0r
   /ks4XiexdCdPIIygAsLJvo6GO9smKZWvMqbx+a1pSsa7JpD8mH4dBHi1m
   QHg14xeUtlFYNQ1ZPelcjHP2DREra+ThBtgjykwB3r2URbVlbQ6RUkt/j
   o=;
X-IPAS-Result: =?us-ascii?q?A0A3AQCu3vFkmJFdJa1agliDLVVAR5QOgiOdf4ElA1YPA?=
 =?us-ascii?q?QEBDQEBMRMEAQGLcwIlNAkOAQIEAQEBAQMCAwEBAQEBAQMBAQUBAQECAQcEF?=
 =?us-ascii?q?AEBAQEBAQEBHhkFDhAnhWgNhj0BgVNEgn4Bgl4DqDGCLIEBhHauMYFogUSMN?=
 =?us-ascii?q?4VRJxuBSUSBFYE8gi2FEYV1BIlfhUUHgluDXokWKoEICF6Baj0CDVQLC2OBF?=
 =?us-ascii?q?YJHAgIROhNKWhcbAwcDWioQKwcELyIGCRctJQZRBBcWJAkTEj4Eg0QKgQM/E?=
 =?us-ascii?q?Q4RgkdhNhlLgmYJFUFOdhArBBQYgRRwHxUeNxESGQ0DCHYdAjI8AwUDBDYKF?=
 =?us-ascii?q?Q0LIQUUQwNIBkwLAwIcBQMDBIE2BQ8fAhAuLwMJAwcFSUADCxgNSBEsNRQbB?=
 =?us-ascii?q?kFzB6BSglJ7EwFLAnmBIqQ0oDuEFYt/lQUaM4VXpAiYLKNshDACBAYFAhaBY?=
 =?us-ascii?q?zqBWzMaCBsVgyIJSRkPjjmCOZE+JDI7AgcLAQEDCYtIAQE?=
IronPort-Data: A9a23:Olz2/qui44+3k6X+5F6v6JMgbufnVCpeMUV32f8akzHdYApBsoF/q
 tZmKW3Ta6uMNmGnftEgO46y90NVuZSHyoUySgtpri9jFS8TgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUIYoAQgvA1c+IMsdoUg7wbVh09Yx2YLR7z6l4
 LseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3ecldG0DFrrx8RYZWc
 QpsIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbhVq/kQPPqgH2PU0MxtKrhODxchN6
 thRqoWJGRUUIKHtsbFIO/VYO3kW0axu4rTLJz20ttaeihyAeHr3yPIoB0YzVWEa0r8oWicVq
 rpJc3ZUMk3ra+GemNpXTsFglM0sK9P2PasUu2prynfSCvNOrZXrGvmauIEEgG5t7ixINdTnR
 fNCRSFhVhHZWRBkC1QJLYw4wt790xETdBUB+A7K+sLb+VP7yxR81rXoOtfZdtGGAMlYgEucj
 mbH5HjiRBYCOdqSzDCI/n6hiqnIhyyTZW4JPKez+vgvi1qJyylCThYXTlC85/K+jyZSRu6zN
 WROpjcLi6Jo7HCJQ8XiRiToskOasj81Do84//IB1CmBza/d4gC8D2cCTyJcZNFOiCPQbWF2v
 rNut463bQGDoIF5WlrGqejJ9WLa1Tw9aD5dNXVdHGPp9vG6+Nlr5i8jWOqPB0JcszEYMSv7z
 zbPpy8kivBCy8UKzK68u1vAhlpAR6QlrCZrvW07vUr8vmuVgbJJgaTztDA3Ct4cdO6koqGp5
 iRspiRnxLlm4WuxvCKMWv4RO7qi+uyINjbR6XY2Qch6qmzzpSL/IN0MiN2bGKuPGphcEdMOS
 BGL0T69GLcPVJdXRfYtOtnoW5hCIVbITIi8DZg4keaikrAoJFPYo0mClGab3nvmlwA3gLojN
 JKAGftA/l5EYZmLOAGeHr9HuZdyn3hW7TqKGfjTkU/9uZLAPyH9dFvwGAbUBgzPxPna8Fy9H
 hc2H5bi9iizp8WkPXCGq9BPdglbRZX5bLivw/Fqmie4ClIOMAkc5zX5mNvNp6QNc3xpq9r1
IronPort-HdrOrdr: A9a23:DhdFJK7kln3aLDpQjQPXwN3XdLJyesId70hD6qkXc202TiX2ra
 6TdZgguCMc6wxhO03I5+rgBEDoexq1nvRICOIqUotKMjOLhILRFuFfBU+I+UyFJ8U4ndQtsJ
 tdTw==
X-Talos-CUID: 9a23:1JYZw2296vCaARi74llOiLxfQJw4V1vXlm/sAUKkFn9QGK+oV1Ox0fYx
X-Talos-MUID: =?us-ascii?q?9a23=3A0cKORg1dkyBNgoYwOUsAr2+LFDUjwZ2MMRships?=
 =?us-ascii?q?8vtC+OAdBOCm4kjLpe9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.02,219,1688428800"; 
   d="scan'208";a="148564415"
Received: from rcdn-core-9.cisco.com ([173.37.93.145])
  by alln-iport-5.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 12:56:54 +0000
Received: from sjc-ads-9103.cisco.com (sjc-ads-9103.cisco.com [10.30.208.113])
	by rcdn-core-9.cisco.com (8.15.2/8.15.2) with ESMTPS id 381CurOm015398
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>; Fri, 1 Sep 2023 12:56:53 GMT
Received: by sjc-ads-9103.cisco.com (Postfix, from userid 487941)
	id 1AEB3CC1293; Fri,  1 Sep 2023 05:56:53 -0700 (PDT)
From: Denys Zagorui <dzagorui@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] bpftool: add native and nativesdk support
Date: Fri,  1 Sep 2023 05:56:53 -0700
Message-Id: <20230901125653.1143552-1-dzagorui@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.208.113, sjc-ads-9103.cisco.com
X-Outbound-Node: rcdn-core-9.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Sep 2023 12:56:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104690

There are issues with nativesdk variant
...
ERROR: nativesdk-bpftool-1.0-r0 do_package: QA Issue:
nativesdk-bpftool: Files/directories were installed but not shipped in any package:
  /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-xesdk-linux/usr/sbin/bpftool
  /usr/share/bash-completion/completions/bpftool
...

nativesdk.bbclass sets sbindir = "${bindir}" but bpftool is installed under sbin
to fix that add sbin to FILES

for bpftool completions {prefix} is not used but it seems that bitbake expects that
installed files should be perfixed with "${SDKPATHNATIVE}${prefix_nativesdk}"
to fix that override bash_compdir

Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
---
 meta-oe/recipes-kernel/bpftool/bpftool.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool.bb
index bbfab47aa..317ec1926 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
@@ -18,6 +18,7 @@ EXTRA_OEMAKE = "\
     LD="${LD}" \
     AR=${AR} \
     ARCH=${ARCH} \
+    bash_compdir=${prefix}/share/bash-completion \
 "
 
 SECURITY_CFLAGS = ""
@@ -42,3 +43,7 @@ python do_package:prepend() {
 }
 
 B = "${WORKDIR}/${BPN}-${PV}"
+
+FILES:${PN} += "${exec_prefix}/sbin/*"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6


