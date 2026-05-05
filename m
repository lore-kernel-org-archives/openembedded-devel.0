Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF0ACD3427
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 18:54:36 +0000 (UTC)
Received: from mailrelay-egress16.pub.mailoutpod3-cph3.one.com (mailrelay-egress16.pub.mailoutpod3-cph3.one.com [46.30.212.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.390.1777997136904770819
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 May 2026 09:05:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup rsa2._domainkey.embetrix.com on 127.0.0.53:53: no such host" header.i=@embetrix.com header.s=rsa2 header.b=FLgmoiag;
 dkim=fail reason="dkim: no key for signature: lookup ed2._domainkey.embetrix.com on 127.0.0.53:53: no such host" header.i=@embetrix.com header.s=ed2 header.b=bk48Axjy;
 spf=none, err=permanent DNS error (domain: embetrix.com, ip: 46.30.212.3, mailfrom: ayoub.zaki@embetrix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1777997134; x=1778601934;
	d=embetrix.com; s=rsa2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=zSjSCnOqWTQ6Cv8eDsnOMKKloyb1n5QPaoJB/fWNbmg=;
	b=FLgmoiagkKUgy8bffM7T0Q/rf2Y+23silGhr9ajKKRpCJl6xYwWYfdNc5gzgDzRaGblCm5767H40z
	 jHPPCuCy3nDHHAH9+EfcK2zMmmuDYjY/XwFZLseiUY2G2U0OqT3a7bBWaagsu1lxBdFtBsVBkOSxre
	 JdtgXN+RRuis10KDVKZvYPk4C6GpaLy+MCFwK7ExvEKj16TiKsA7BW/SC2E5/QxmHrk7AWw7WfUJqU
	 A+0vVOuKjTZIikTFYsfXiWWZOd9C5n4qeyP4gThT6++TI8IqHAzjuVPpWLUYR01y4o2lXM22/zNE3b
	 RcXxW+huAxXTHD6ftxVPHXyztoVL6Og==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1777997134; x=1778601934;
	d=embetrix.com; s=ed2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=zSjSCnOqWTQ6Cv8eDsnOMKKloyb1n5QPaoJB/fWNbmg=;
	b=bk48Axjy2QIujrTLTcM6MWul/W9I4VR/CaQnIKg+iyn0xP2QIh5O3pN8wkVMh0jiv1CgHMz6ZhQlF
	 +ToAQEICQ==
X-HalOne-ID: 3e4bc646-489c-11f1-a2aa-f3c0f7fef5ee
Received: from xps-13.fritz.box (dynamic-2a02-3102-8c10-1ae0-7cfc-6453-61f1-3d61.310.pool.telefonica.de [2a02:3102:8c10:1ae0:7cfc:6453:61f1:3d61])
	by mailrelay4.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 3e4bc646-489c-11f1-a2aa-f3c0f7fef5ee;
	Tue, 05 May 2026 16:05:34 +0000 (UTC)
From: "Ayoub Zaki" <ayoub.zaki@embetrix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ayoub Zaki <ayoub.zaki@embetrix.com>
Subject: [meta-networking][PATCH] open62541: upgrade 1.4.16 -> 1.5.4
Date: Tue,  5 May 2026 18:05:31 +0200
Message-ID: <20260505160531.39846-1-ayoub.zaki@embetrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 May 2026 18:54:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126795

* upgrade to version 1.5.4
* fix buildpaths QA error in pkgconfig file

Signed-off-by: Ayoub Zaki <ayoub.zaki@embetrix.com>
---
 .../opcua/{open62541_1.4.16.bb => open62541_1.5.4.bb}      | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-protocols/opcua/{open62541_1.4.16.bb => open62541_1.5.4.bb} (93%)

diff --git a/meta-networking/recipes-protocols/opcua/open62541_1.4.16.bb b/meta-networking/recipes-protocols/opcua/open62541_1.5.4.bb
similarity index 93%
rename from meta-networking/recipes-protocols/opcua/open62541_1.4.16.bb
rename to meta-networking/recipes-protocols/opcua/open62541_1.5.4.bb
index 32f7148f4b..9a39bb0e4f 100644
--- a/meta-networking/recipes-protocols/opcua/open62541_1.4.16.bb
+++ b/meta-networking/recipes-protocols/opcua/open62541_1.5.4.bb
@@ -8,13 +8,13 @@ LIC_FILES_CHKSUM = "\
 "
 
 SRCREV_FORMAT = "opcua_mdnsd_ua-nodeset_mqtt-c"
-SRCREV_opcua = "f63e2a819aff6e468242dc2e54ccbd5b75d63654"
+SRCREV_opcua = "dfd44a234645ed29cc6d190048bc8ae80c5454cd"
 SRCREV_mdnsd = "488d24fb9d427aec77df180268f0291eeee7fb8b"
-SRCREV_ua-nodeset = "d1bb6a22125bd7cd986272b1ee98a18a91d76fff"
+SRCREV_ua-nodeset = "257db9ad98ee7ba4b67d3500b54bfc9d744a36af"
 SRCREV_mqtt-c = "0f4c34c8cc00b16cfee094745d68b8cdbaecd8e0"
 
 SRC_URI = " \
-    git://github.com/open62541/open62541.git;name=opcua;branch=1.4;protocol=https \
+    git://github.com/open62541/open62541.git;name=opcua;branch=1.5;protocol=https \
     git://github.com/Pro/mdnsd.git;name=mdnsd;protocol=https;branch=master;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/deps/mdnsd \
     git://github.com/OPCFoundation/UA-Nodeset;name=ua-nodeset;protocol=https;branch=latest;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/deps/ua-nodeset \
     git://github.com/LiamBindle/MQTT-C.git;name=mqtt-c;protocol=https;branch=master;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/deps/mqtt-c \
@@ -59,4 +59,5 @@ do_configure:prepend:toolchain-clang:riscv32() {
 
 do_install:append(){
     sed -i 's|${RECIPE_SYSROOT}|\$\{CMAKE_SYSROOT\}|g' ${D}${libdir}/cmake/open62541/open62541Targets.cmake
+    sed -i -e 's|-l[^ ]*/lib\([^ /]*\)\.so|-l\1|g' ${D}${libdir}/pkgconfig/open62541.pc
 }
-- 
2.43.0


