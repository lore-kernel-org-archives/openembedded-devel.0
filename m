Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web10.3401.1618537378163861423
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Apr 2021 18:42:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wfyhZFSQ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1618537375; i=@fujitsu.com;
	bh=yr7Pev7dHbCbSA5npZvvTQXgsC0PQn+t+3i5xaNdk6E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=wfyhZFSQUQvIg41rJ8ycksgV3BullgNess6VBJuWm5bsVUT5bL49kUmgHBVqPESnf
	 R5yYvwTFoNDCFTLVwzg4E2Z/lTiyxNs7Po5nCv2AY1EIRjMc5r9BRwOyAp+USqR+XD
	 sQV6y2unZMFMPrSHehY1ezHExffN6tMbks+LxiH9sAuDZtYSdB4ZnHmx7OuDJkpbop
	 Eg9Mys/1dD2D5odKrhekEc+eV2P1bMkkejvUBVPN6xRuA9oJRqsV9efDFfYLoEQvDy
	 l/lj6dvD1tIhpmJ2qCHdCz+V2eMgz/EF3II2uSyE6F94EEnS/QOFnolfSeLyUKyzS1
	 JG/FsJ6/Ln0Wg==
Received: from [100.113.6.49] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id 4D/CA-44603-F9BE8706; Fri, 16 Apr 2021 01:42:55 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+GYqjv/dUW
  CQcNncYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePM62tMBTc4KvafW8bUwNjC0cXIySEkMJtJ
  4thxli5GLiD7OKPE5H+rWEASbAI6Eh0vusFsEQF9iaWz9zCD2MICHhLNbb/YQWwWAVWJ/tt3W
  UFsXgE3iR0X14PVSAgoSEx5+J4ZIi4ocXLmE7A5zAISEgdfvICqUZTYvvMMC4RdKbF92lnGCY
  w8s5C0zELSsoCRaRWjZVJRZnpGSW5iZo6uoYGBrqGhsa65rpGpkV5ilW6SXmqpbnJqXklRIlB
  WL7G8WK+4Mjc5J0UvL7VkEyMwkFIK2f/sYLz++oPeIUZJDiYlUd5DK8oShPiS8lMqMxKLM+KL
  SnNSiw8xynBwKEnwOr+oSBASLEpNT61Iy8wBBjVMWoKDR0mE98NLoDRvcUFibnFmOkTqFKOil
  DjvApCEAEgiozQPrg0WSZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfM2gkzhycwrgZv+Cm
  gxE9DiilWlIItLEhFSUg1MEsox02VsYjxL+RVm7lif4rn7ycOfkX9r8iY0a5/lS90U12S+v9j
  0QMc3vxmfM7cb29odvzd344rAxlNPJvF6sAjo8P2v4Ys+Zt5+zWTmo8aZ11h3V679trhoQWph
  0kphvRflF3/5snMcnhDGLWxqwvXggEb8/y/zn1UWvWLWWON5/fU5EV++Xd5THcyOfODn2/cxb
  sHSzCOdx8WKFsy+pNnZdm0j2/l59+OYbH3M5FZu2q11YmPq1aJ1avLRPedl/k475PHhqdippb
  ZXciKD98zecD6xZP6jubI/jv1j27ViVfXXB5w7eA70NQbt+XwgRfPf9kkx/5lvZ3dHfPO4uTT
  RdNpz1+S9DNIbJ8z7banEUpyRaKjFXFScCAD35N3iHwMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-245.messagelabs.com!1618537374!1497653!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31271 invoked from network); 16 Apr 2021 01:42:55 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-3.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Apr 2021 01:42:55 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13G1gslJ014360
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Apr 2021 02:42:54 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 16 Apr 2021 02:42:53 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-filesystems] [PATCH] fuse3: upgrade 3.10.2 -> 3.10.3
Date: Fri, 16 Apr 2021 09:42:46 +0800
Message-ID: <1618537366-7313-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../recipes-support/fuse/{fuse3_3.10.2.bb => fuse3_3.10.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-support/fuse/{fuse3_3.10.2.bb => fuse3_3.10.3.bb} (95%)

diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.10.2.bb b/meta-filesystems/recipes-support/fuse/fuse3_3.10.3.bb
similarity index 95%
rename from meta-filesystems/recipes-support/fuse/fuse3_3.10.2.bb
rename to meta-filesystems/recipes-support/fuse/fuse3_3.10.3.bb
index 91d0e373b..72d0cd3e4 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.10.2.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.10.3.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://GPL2.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://github.com/libfuse/libfuse/releases/download/fuse-${PV}/fuse-${PV}.tar.xz \
 "
-SRC_URI[sha256sum] = "736e8d1ce65c09cb435fbbb500d53dc75f4d6e93bd325d22adc890951cf56337"
+SRC_URI[sha256sum] = "eb8373f208b05a39702f9f437f6e49caf4b1ace26a9acb68110b49912078560f"
 
 S = "${WORKDIR}/fuse-${PV}"
 
-- 
2.25.1

