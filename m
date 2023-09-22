Return-Path: <SANJAY.CHITRODA@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF63CD4F5B
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 11:17:41 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.web11.19276.1695381457451942088
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 04:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: vivelmur@cisco.com)
X-CSE-ConnectionGUID: UEJrRAlzR1myx12SvRLzMQ==
X-CSE-MsgGUID: KWvpWXjfR2WoZjHnEEHL3A==
X-IPAS-Result: =?us-ascii?q?A0ATAAA6dw1lmJRdJa1aHQEBAQEJARIBBQUBgXsIAQsBg?=
 =?us-ascii?q?y9VQEcDjGyJQp1+gSUDZQEBAQ0BAT0HBAEBjAsCJjQJDgECBAEBAQEDAgMBA?=
 =?us-ascii?q?QEBAQEBAgEBBQEBAQIBBwQUAQEBAQEBAQEeGQUOECeFaA2GRwE4AUYsAwECW?=
 =?us-ascii?q?yMhgn4Bgl4DEQaxEYIsgQGDVgMLAkOvFIFSgUgBjD2DI4IvJ4IoglGCLYEFg?=
 =?us-ascii?q?UYXAQEBARiICQSJQYItgxIHMoIlgy8qilQqgQgIXIFqPQINVAsLXYERgkQCA?=
 =?us-ascii?q?hE5DwVHWhYbAwcDWioQKwcEMiIGCRYsJQZRBBcWJAkTEj4EgzgKgQY/EQ4Rg?=
 =?us-ascii?q?kUiAj02GUuCWwkVQU52ECsEFBhsKG4fFR42ERIZDQMIdh0CESM8AwUDBDYKF?=
 =?us-ascii?q?Q0LIQVXA0cGTAsDAhwFAwMEgTYFDx4CEC4pAwMZTgIQFAM+AwMGAwsyAzA7A?=
 =?us-ascii?q?wkDBwVJQAMLGA1IESw1FBsGQXMHoR8DbYFYgQiBDgEKHwIggXQBF5J5kU6gO?=
 =?us-ascii?q?weQDpUGTalfC5gijWGWDIQwAgQGBQIWgWM6gUkLB3CDNwlJGQ+OLAsLhVVlg?=
 =?us-ascii?q?jCLBSQyAgsuAgcLAQEDCYtJAQE?=
IronPort-Data: A9a23:DgnddaJTDuRbCV7fFE+RFZUlxSXFcZb7ZxGr2PjKsXjdYENShmYBy
 GtOWDvVP/jfZGSgfdFxYIux8U8FvMfQzYA3HFYd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcYZsCCea/0/xWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVvW0
 T/Oi5eHYgT9imQuajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKmWDNrfnL
 wpr5OjRElLxp3/BOPv8+lrIWhFirorpAOS7oiE+t55OLfR1jndaPq4TbJLwYKrM4tmDt4gZJ
 N5l7fRcReq1V0HBsLx1bvVWL81xFZBr2qX9CHyti5WW3l2fKUDy+dF8KXhjaOX0+s4vaY1P3
 eYTJDZIZReZiqfvmvSwS/JngYIoK8yD0IE34y47i2qGS6d9B8mfE80m5vcAtNs0rt5PA/vaY
 tcDQTFudx/HJRZIPz/7Dbpnxbf13yCvIm0wRFS9hpUp+1fjzgJLiofqAtj1fPGnZeEOtxPNz
 o7B1z2pXk5FXDCF8hKC6n+qi+rFkC/3VY5XGLCm+/pChFyI2ndVDwUbU1a+q/S1hkOyHdVFJ
 CQ84SMor6EjskerT8XnWBGxiHOFuBAbUNpRC/Z84waIopc4+C6DDWQCCzVGctFj7ZVwTj0x3
 VjPlNTsbdByjFGLYU+w1K2uhDegA3EQPH9bPxQady8XxuC29enfkSnzZtpkFae0iPj8Fjfx3
 y2GoUACa1M70JBjO0KToA2vvt68mnTaZlVquViPDwpJ+is8NdH1PdX5gbTOxa8YdN7xc7WXg
 JQTdyGjAA0mF5qBkmmGR/8AWejzof2EKzbbx1VoGvHNFghBGVb9Iei8AxkndC+F1/ronxeyM
 Sc/XisKtfdu0IOCN/MfXm5II51CIVLcPdrkTOvISdFFf4J8cgSKlAk3Ox/NhDq0yBRwwfllU
 Xt+TSpKJShDYUiA5GTuL9rxLZd3rszD7TqJHMuin0jPPUS2PSDIGd/pz2dinshgvP/b/205A
 v5UNtCBzF1EQfbibyzMmbP/3nhURUXX8ave8pQNHsbae1IOMDh4V5f5n+h7E6Q7xPs9qws91
 iznMqOu4ACh1SSvxMTjQi0LVY4Dqr4i/ShjZnR1ZAzANrpKSd/H0ZrzvqAfJdEPnNGPB9YtJ
 xXZU61s2shydwk=
IronPort-HdrOrdr: A9a23:tjs70K9aThaNlEdoA+duk+DTI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WKb+UyCJ8U7ndQtsp
 uJtMNFebnNMWQ=
X-Talos-CUID: 9a23:uJo5uGFD3riWTBYyqmJa2WwOIOkhYEeEyWbAehWDF1xNWpisHAo=
X-Talos-MUID: 9a23:NoLjLgjvfRFr/bHtmuZZHsMpF/h2+5ueCk43y6oBicukMwFdGxPGpWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.03,167,1694736000"; 
   d="scan'208";a="118511898"
Received: from rcdn-core-12.cisco.com ([173.37.93.148])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 11:17:36 +0000
Received: from sjc-ads-6897.cisco.com (sjc-ads-6897.cisco.com [10.30.218.17])
	by rcdn-core-12.cisco.com (8.15.2/8.15.2) with ESMTPS id 38MBHaBe010723
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 22 Sep 2023 11:17:36 GMT
Received: by sjc-ads-6897.cisco.com (Postfix, from userid 1822629)
	id D7FF3CC12B5; Fri, 22 Sep 2023 04:17:35 -0700 (PDT)
From: sanjay.chitroda@einfochips.com
To: openembedded-devel@lists.openembedded.org
Cc: Sanjay Chitroda <sanjay.chitroda@einfochips.com>
Subject: [meta-oe][PATCH] netkit-telnet: Fix CVE-2022-39028
Date: Fri, 22 Sep 2023 04:17:25 -0700
Message-Id: <20230922111725.4049479-1-sanjay.chitroda@einfochips.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.218.17, sjc-ads-6897.cisco.com
X-Outbound-Node: rcdn-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 11:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105056

From: Sanjay Chitroda <sanjay.chitroda@einfochips.com>

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-39028
https://security-tracker.debian.org/tracker/CVE-2022-39028

Upstream Patch:
https://cgit.freebsd.org/src/commit/?id=6914ffef4e23

- Patch is adopted from FreeBSD, as same vulnerability of
  telnetd is applicable to FreeBSD and netkit-telnet packages.

Signed-off-by: Sanjay Chitroda <sanjay.chitroda@einfochips.com>
---
 .../netkit-telnet/files/CVE-2022-39028.patch  | 53 +++++++++++++++++++
 .../netkit-telnet/netkit-telnet_0.17.bb       |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta-networking/recipes-netkit/netkit-telnet/files/CVE-2022-39028.patch

diff --git a/meta-networking/recipes-netkit/netkit-telnet/files/CVE-2022-39028.patch b/meta-networking/recipes-netkit/netkit-telnet/files/CVE-2022-39028.patch
new file mode 100644
index 000000000..e8c3f1d84
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-telnet/files/CVE-2022-39028.patch
@@ -0,0 +1,53 @@
+From 4133a888aa256312186962ab70d4a36eed5920c1 Mon Sep 17 00:00:00 2001
+From: Brooks Davis <brooks@FreeBSD.org>
+Date: Mon, 26 Sep 2022 18:56:51 +0100
+Subject: [PATCH] telnetd: fix two-byte input crash
+
+Move initialization of the slc table earlier so it doesn't get
+accessed before that happens.
+
+For details on the issue, see:
+https://pierrekim.github.io/blog/2022-08-24-2-byte-dos-freebsd-netbsd-telnetd-netkit-telnetd-inetutils-telnetd-kerberos-telnetd.html
+
+Reviewed by:	cy
+Obtained from:	NetBSD via cy
+Differential Revision:	https://reviews.freebsd.org/D36680
+
+CVE: CVE-2022-39028
+Upstream-Status: Backport [https://cgit.freebsd.org/src/commit/?id=6914ffef4e23]
+
+(cherry picked from commit 6914ffef4e2318ca1d0ead28eafb6f06055ce0f8)
+Signed-off-by: Sanjay Chitroda <sanjay.chitroda@einfochips.com>
+
+---
+ telnetd/telnetd.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/telnetd/telnetd.c b/telnetd/telnetd.c
+index f36f505..efa0fe1 100644
+--- a/telnetd/telnetd.c
++++ b/telnetd/telnetd.c
+@@ -615,6 +615,11 @@ doit(struct sockaddr_in *who)
+ 	int level;
+ 	char user_name[256];
+ 
++	/*
++	 * Initialize the slc mapping table.
++	 */
++	get_slc_defaults();
++
+ 	/*
+ 	 * Find an available pty to use.
+ 	 */
+@@ -698,11 +703,6 @@ void telnet(int f, int p)
+     char *HE;
+     const char *IM;
+ 
+-    /*
+-     * Initialize the slc mapping table.
+-     */
+-    get_slc_defaults();
+-
+     /*
+      * Do some tests where it is desireable to wait for a response.
+      * Rather than doing them slowly, one at a time, do them all
diff --git a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
index e28eeae49..d3de038d1 100644
--- a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
@@ -16,6 +16,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/n/netkit-telnet/netkit-telnet_${PV}.orig.tar.gz
            file://0001-telnetd-utility.c-Fix-buffer-overflow-in-netoprintf.patch \
            file://0001-utility-Include-time.h-form-time-and-strftime-protot.patch \
            file://0001-Drop-using-register-keyword.patch \
+           file://CVE-2022-39028.patch \
            "
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netkit-telnet/"
-- 
2.35.6


