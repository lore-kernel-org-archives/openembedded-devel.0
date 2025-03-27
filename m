Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA6CFC3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 20:49:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.41.1743108573081872487
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Mar 2025 13:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5181772000=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RKX5su000596
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Mar 2025 13:49:32 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45n7v7gfk9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Mar 2025 13:49:32 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 27 Mar 2025 13:49:32 -0700
Received: from pop-os.wrs.com (172.25.44.6) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2507.43 via Frontend
 Transport; Thu, 27 Mar 2025 13:49:31 -0700
From: <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 2/2] syslog-ng: upgrade 4.7.0 -> 4.8.1
Date: Thu, 27 Mar 2025 16:49:30 -0400
Message-ID: <20250327204930.577785-2-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250327204930.577785-1-Randy.MacLeod@windriver.com>
References: <20250327204930.577785-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=bsdMBFai c=1 sm=1 tr=0 ts=67e5b9dc cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=xNf9USuDAAAA:8 a=FukcCYBRz3A0tJJZNuMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: o2NHttNxnRfGVONo0YgMDKM9bcgWVSGq
X-Proofpoint-GUID: o2NHttNxnRfGVONo0YgMDKM9bcgWVSGq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503270140
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52RKX5su000596
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Mar 2025 20:49:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116331

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Release notes:
   https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.8.1
   https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.8.0

Update the syslog-ng.conf.[systemd|sysvinit] files to align with
upstream's 4.8 version. This involved changing from stats_freq(0)
to stats(freq(0)) to avoid:
   > WARNING: Your configuration file uses an obsoleted keyword, ...
as was done in:
   2d3a8c783 packaging: Update the sample Debian config to not throw warn=
ing
The comments and the greater authentication/encryption defaults kept.
Note that the latter are comment lines.
Also kept a line from the 'Sources' section:
   file("/proc/kmsg" program_override("kernel"));
but it's not clear if that's needed. It was in the original meta-oe versi=
on of
the file from 2018, version 3.15 but not the upstream syslog-ng-3.15.1.

With systemd enabled using poky-altcfg, there's a warning:
   /etc/tmpfiles.d/syslog-ng.conf:1:
      Line references path below legacy directory /var/run/,
      updating /var/run/syslog-ng =E2=86=92 /run/syslog-ng;
      please update the tmpfiles.d/ drop-in file accordingly.
but that was present in the previous version and I won't take time
to fix it right now since systemd + syslog-ng isn't a common combination.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../syslog-ng/files/syslog-ng.conf.systemd            | 11 ++++++-----
 .../syslog-ng/files/syslog-ng.conf.sysvinit           |  8 ++++----
 .../{syslog-ng_4.7.0.bb =3D> syslog-ng_4.8.1.bb}        |  2 +-
 3 files changed, 11 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-support/syslog-ng/{syslog-ng_4.7.0.bb =3D> syslog=
-ng_4.8.1.bb} (98%)

diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.syste=
md b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.systemd
index 851bf252b7..d3f3730105 100644
--- a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.systemd
+++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.systemd
@@ -1,5 +1,6 @@
-@version: 3.36
-#
+@version: 4.8
+@include "scl.conf"
+
 # Syslog-ng configuration file, compatible with default Debian syslogd
 # installation. Originally written by anonymous (I can't find his name)
 # Revised, and rewrited by me (SZALAY Attila <sasa@debian.org>)
@@ -10,9 +11,9 @@
 #     Joe Slater <joe.slater@windriver.com>
=20
 # First, set some global options.
-options { chain_hostnames(off); flush_lines(0); use_dns(no); dns_cache(n=
o); use_fqdn(no);
-	  owner("root"); group("adm"); perm(0640); stats_freq(0);
-	  bad_hostname("^gconfd$");
+options { chain_hostnames(off); flush_lines(0); use_dns(no); use_fqdn(no=
);
+	  dns_cache(no); owner("root"); group("adm"); perm(0640);
+	  stats(freq(0)); bad_hostname("^gconfd$");
 };
=20
 ########################
diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.sysvi=
nit b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.sysvinit
index 70afd0da84..2b18dce89c 100644
--- a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.sysvinit
+++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.sysvinit
@@ -1,4 +1,4 @@
-@version: 3.36
+@version: 4.8
 #
 # Syslog-ng configuration file, compatible with default Debian syslogd
 # installation. Originally written by anonymous (I can't find his name)
@@ -10,9 +10,9 @@
 #     Joe Slater <joe.slater@windriver.com>
=20
 # First, set some global options.
-options { chain_hostnames(off); flush_lines(0); use_dns(no); dns_cache(n=
o); use_fqdn(no);
-	  owner("root"); group("adm"); perm(0640); stats_freq(0);
-	  bad_hostname("^gconfd$");
+options { chain_hostnames(off); flush_lines(0); use_dns(no); use_fqdn(no=
);
+	  dns_cache(no); owner("root"); group("adm"); perm(0640);
+	  stats(freq(0)); bad_hostname("^gconfd$");
 };
=20
 ########################
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.7.0.bb b/meta-=
oe/recipes-support/syslog-ng/syslog-ng_4.8.1.bb
similarity index 98%
rename from meta-oe/recipes-support/syslog-ng/syslog-ng_4.7.0.bb
rename to meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.1.bb
index e489287c5a..94f74d1eef 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.7.0.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.1.bb
@@ -26,7 +26,7 @@ SRC_URI =3D "https://github.com/balabit/syslog-ng/relea=
ses/download/${BP}/${BP}.ta
 "
 SRC_URI:append:powerpc64le =3D " file://0001-plugin.c-workaround-powerpc=
64le-segfaults-error.patch"
=20
-SRC_URI[sha256sum] =3D "b601265362c633a25f26c497a7e57592739d5a583b7963b7=
22ff58f01b853506"
+SRC_URI[sha256sum] =3D "e8b8b98c60a5b68b25e3462c4104c35d05b975e6778d38d8=
a81b8ff7c0e64c5b"
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/balabit/syslog-ng/releases"
=20
--=20
2.34.1


