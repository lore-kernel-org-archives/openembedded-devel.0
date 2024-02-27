Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B76DC54798
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 11:37:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10304.1709033838449593808
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Feb 2024 03:37:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rtpvDPEX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=27871ec9df=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41R5LJKi026017
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Feb 2024 03:37:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=fuwJiaRl7VvKS4KKvN
	633E+LVw7gUAumdmnmCRPNYSM=; b=rtpvDPEXicZ/hn7cpgj2N8w7Jpv3kECROA
	oMWZMk2qBrYbF0DHUj33P61GRuPByhl+Hz0pwKxYB66/mY3UEe/zN7PIrvZ6KKRT
	oiQuyn946A+nphBj10jgPiEWppS2xQE3kozDg11e2/kKoqg9t0O3+L8a1h4lskwV
	H/LBzhWFK7rhYbYIJLFbTydh6PynjVsUxqMOZZv9f6tJpfn5u9CqV3wyxAmQtPAQ
	CcHwIOoc8PYz1rXaEZp+6IdE8hlpXD1pGtqnDrJbF2h85a9GYwKpON2bmmKYtULn
	MhGF2E/yr6nz0gKczvEjIqFPMIczGItiX+VCqgfvc47PRCnZyw/w==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wfgumjpby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Feb 2024 03:37:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONYyuzcUMHmYGYTf2Ny/CMY/t8VXzgx8NzMKooXcUwddQZb2fofoIu6qAXL971jaITDpXoU3Yz/zSRMlqa65jajirCJ+Zg5P2MeOBeckjDQ5NJ0YZOg3crD9wsNCEisF4awDkRxwXyGPEmkzTed3uP0uz/Y8cXBXQYbeEi52LZKcqhrftrwu4MIm8JYROQqMYrPsESn9QOH2L3xTOFxihSfR3hiMYg6f5dSY2eMJYK7/lhhP7yEilyJTbdxP2A3T7fdzfwIL06wOAPK59UkyLQr2mcRcGLYraTLlH9bW4BYbfUPXcsQ/cCkMy4TZv70qgZexVB83n76vDPnDXKWwrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fuwJiaRl7VvKS4KKvN633E+LVw7gUAumdmnmCRPNYSM=;
 b=SqpuHK7eoFZm0OSVM7IC/C/T2FXERboT9pKJ9XLASN3Cbd9+tY966AAoSxkPcAZDjGNlnC8GsZRzOvuuV4b2wgZ1SV4WUCK6DA8rDvzYK8UXwSPJOEDm/oPcyT4SrW/s+bAD9VHhkjhuPxiLAUiEglMjSaWO91d7E/5uBfmFqGgFqGgg7j0sYTEHotd558Dx1jXYQjWKFF8bMfgzBmCOsNIWLp45lv2GlhTwpqllOIxOnYtNAFsBCFuDPDad3chvEui5l3iuXfEGDOiAYywYlfB2wmuiR4t8P0M/ELEh1q36WUjiARc2/6naE4ZgcuQuQK2aMKuLJPoQOFNDNBUAEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5816.namprd11.prod.outlook.com (2603:10b6:a03:427::18)
 by LV3PR11MB8529.namprd11.prod.outlook.com (2603:10b6:408:1b3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Tue, 27 Feb
 2024 11:37:13 +0000
Received: from SJ0PR11MB5816.namprd11.prod.outlook.com
 ([fe80::42de:e807:5a4a:a4a9]) by SJ0PR11MB5816.namprd11.prod.outlook.com
 ([fe80::42de:e807:5a4a:a4a9%3]) with mapi id 15.20.7339.022; Tue, 27 Feb 2024
 11:37:13 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>
Subject: Re: [oe][meta-oe][kirkstone][PATCH 2/4] nodejs: fix CVE-2024-21892
Thread-Topic: [oe][meta-oe][kirkstone][PATCH 2/4] nodejs: fix CVE-2024-21892
Thread-Index: AQHaZjOh0mw97jD5PEaY3W+JKOm7S7EeEG4+
Date: Tue, 27 Feb 2024 11:37:13 +0000
Message-ID: 
 <SJ0PR11MB5816D62994233C64DB982B3484592@SJ0PR11MB5816.namprd11.prod.outlook.com>
References: <20240223083620.182565-1-archana.polampalli@windriver.com>
 <17B67113C7A30745.29888@lists.openembedded.org>
In-Reply-To: <17B67113C7A30745.29888@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5816:EE_|LV3PR11MB8529:EE_
x-ms-office365-filtering-correlation-id: 02f66ad9-bfeb-433b-9bfb-08dc37887131
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kMhTIOhAfPOaT1glRiZNpFJ2NFhqL+4sFTYzRAwZ9dCX0nIrnPlNJE8GJiKNDeXdvPHidz7TljY1PSBYFUMVZuu+MuMqPPWygivqxBygwUdBhB0yzwlTg7cus85xkYptL+9jCnJ5h4/6T6iJGrYf26Bkt693LR26n0698oygwVisgSbbdFwWA6vBkf8Lcl/4YBsclchNqmZXookVMHd1PfqvHavpBfZD0ciTRHodAsQMYJtJtBUm6/gqCVkKbe+qz0bBjIGVUQiTqVXtMjqrFbxlTbtYgBbJYEE6cpVTIYVB5AvpEpCoPzr/SyPPlJzUPCOUUPHsElmzOafXBrt50KhbFtMZs5peTAEG2Eo8Qeski9iRB1de69dz7q5hMtJOA8YvQ0x1RjvBPyKLE93R6i6VErV/xZ4fFuNRDsTK0746604LVsSiiJRhNli87HFSZC9KHnlW97lzqaLfe9N+ldiQ8f3MOpP/jBkXSnRY6m80wKdwKvRSNdo5sObyOMIlc547UioBKxBNir0Gk90eVLBaHZw1rpRhIloVFTaQlFEONrRns+VZO95G/QJ3rjdZR0agHh1YNwljHx5WB1nDCO2pS2eF5bpbUefDAj2lgnytQ0ZYkg0F1Om1lKE1sYyxQTxwL22543dumH3wlFLZZbsH+OEOnnnH/0PX7QChnDhwYVcLLJG4i89m1bnK4gkG+YpQTGoj0mTNOmBhGzDBkw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5816.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?qRWEqznIR/vyRZ1IjESSOnNNWCg1l5QMTWm8+44+IHbDa7JNXWBpw7x/uQJB?=
 =?us-ascii?Q?sX2rNaBjLhejBf1Ai3SNBTuCRJzQyrjkO8p7uhd9aRRb1NS4UmvskI1G5mMq?=
 =?us-ascii?Q?hv3PYIEceOvK6veHvu7vTqBZSYkxQx5Y8faRIZXEGWDBeMCDfQsLvWq9NfMG?=
 =?us-ascii?Q?lGIXq9NIctZE8E2HUeBZNL7OM81g5hILuZHtWerYrXydgDgtctJkUEJWPdHd?=
 =?us-ascii?Q?oLVCqGgQeDw5A9iCDIcYzp+pq+Pb86sxU4HYIJNQ2ag0XWkO6apfQxn5wnaH?=
 =?us-ascii?Q?hFR/CCFrcKnucFJ85kfl31/mGXDZkbLWHII9CCHC4tuLTq9ZlbUGcFT5i//T?=
 =?us-ascii?Q?tbYkhYVIXZQnkZGkdbnZjsxwRH9gQlBKVSuVZV2FE3fRXKmks8SE9ySJ8GNh?=
 =?us-ascii?Q?xzSAJeibzgw06gVW8YF4N/lQcSUz//LrSr6ZBN/LOMidjmBNXgFV3PGF43NR?=
 =?us-ascii?Q?DdKhkwYJX83H9d1wy8YU7qlbnoXLpFo2jKnZKElNlMbpFxfQDViw64PpU0N7?=
 =?us-ascii?Q?uN6v691Fm7dILNcvLQVQ2il6sTUj805jPN80KtW8TJ9YZyUXF2TpOYWwzW4F?=
 =?us-ascii?Q?k5npE85f6UHclf158BEr6JqULi7Z/BSv2tshkM2NIVPwrenSV3xHqdLkXsdW?=
 =?us-ascii?Q?RSopmWLi5uylngP1FbNBNKFg2qzrV0lc5Wh/Rq0/woXG8uXzXPSJ1lyJanxi?=
 =?us-ascii?Q?2htr0EjYN+J7P0ugY/75rJuV6sHk3HLK0oy+LCfOlnqHeCIc1dHn57x9oSGV?=
 =?us-ascii?Q?TJ8sjyKe/h7C7NRzwZvEwI0iAfIec8PvKjVuHeTDO/BPM6Nan/ENVPXe0JF9?=
 =?us-ascii?Q?DGJPQR6ju9ZMe5g/bMkkXQN3dZbrMiUKiRyC8Z9IXuQPPcNLEqnEvCkME7KZ?=
 =?us-ascii?Q?EVYEK2VJH47+qfhSikw9FZ3Sf+sN9HOZXM+lGA0IJ2/hG7mY7sDmNzR/L/Y8?=
 =?us-ascii?Q?aJEsR51khUMqTb3Irpvk+w0ftu6NWqKmzoltpsLiEgKuErf+wNL3hwQzzj1C?=
 =?us-ascii?Q?7tyaQ8kS9f+ZfgsYNNOsKLwpr/+BlOTLP7V49unnqVRXRgghYk4OBr/GdGuh?=
 =?us-ascii?Q?rxp4lIOIRpK4DYz8scfUkab/alA4W2afaKPWMBQ6Za/t7/aRQE4jfZDI6Epj?=
 =?us-ascii?Q?k+Ig5TRcfnMb2EMIfSeqB5H055Q6NqHeQtTYwue7s6FOxW3YcPg8h/k+vcWX?=
 =?us-ascii?Q?xIeg+qNMZelC+kqiW6nTEoLnizUF5OUzCEPsjcjkF5Dbe5MGh3/+4CmiJpaD?=
 =?us-ascii?Q?5E67CntWv7mXCso82LlaYz6s/maS4HJEveqSk3IoyXr93wB5cKwgJkjjEEo6?=
 =?us-ascii?Q?UtQdbA9rCoG1P/wfJtucJR9SRnG5HugBuejy6jW6DJDnPAed8ktjX0bNNpjM?=
 =?us-ascii?Q?DcJdD9TFWYj4x7G7vafbyQSApBhEiV/WGNFBvBYYUQKki2vuKUYvdCUoqs3z?=
 =?us-ascii?Q?pYxGGJBeHl4ALtgU9/8RRM7RWa3dOFLZQC4JFE6pXT5OFK907ccF9DjeVpWC?=
 =?us-ascii?Q?pnhzKTL0vY2tQCz4AkL0qmZLdMMPUHa9oX3mDwA94W4mfgICyuI4TcKzsSJN?=
 =?us-ascii?Q?MROhsbjTq9a6q10WTBT+Jd7sU9463yluDQmwUCz8/qOaLhRvLGcr703/EJSw?=
 =?us-ascii?Q?Jw=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR11MB5816D62994233C64DB982B3484592SJ0PR11MB5816namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5816.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f66ad9-bfeb-433b-9bfb-08dc37887131
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2024 11:37:13.3813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k1usoRrNf/4EAMPk082hkbsUjpmIdUqcwpJsyJbGe6t6Y/9MGiviDlUZ5XjlfTiVsk7OSbszn9NvdpHMb8Y0VX2f7EEr7UDuKuCwQstJyCY3Lud3q2UBMcYAcsDNERGb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8529
X-Proofpoint-ORIG-GUID: -_n5xY4ZIAxZJqLl9bfXuEmq3TnkdgHd
X-Proofpoint-GUID: -_n5xY4ZIAxZJqLl9bfXuEmq3TnkdgHd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 mlxscore=0 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2402270090
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Feb 2024 11:37:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109039

--_000_SJ0PR11MB5816D62994233C64DB982B3484592SJ0PR11MB5816namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Kindly ignore this patch.

Regards,
Archana
________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Polampalli, Archana via lists.openembedded.or=
g <archana.polampalli=3Dwindriver.com@lists.openembedded.org>
Sent: Friday, February 23, 2024 14:06
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 2/4] nodejs: fix CVE-2024-21892

From: Archana Polampalli <archana.polampalli@windriver.com>

On Linux, Node.js ignores certain environment variables if those may have b=
een
set by an unprivileged user while the process is running with elevated priv=
ileges
with the only exception of CAP_NET_BIND_SERVICE. Due to a bug in the
implementation of this exception, Node.js incorrectly applies this exceptio=
n
even when certain other capabilities have been set. This allows unprivilege=
d
users to inject code that inherits the process's elevated privileges.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../nodejs/nodejs/CVE-2024-21892-0001.patch   | 97 +++++++++++++++++++
 .../nodejs/nodejs/CVE-2024-21892-0002.patch   | 58 +++++++++++
 .../recipes-devtools/nodejs/nodejs_16.20.2.bb |  2 +
 3 files changed, 157 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-21892-0=
001.patch
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-21892-0=
002.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-21892-0001.pat=
ch b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-21892-0001.patch
new file mode 100644
index 000000000..0eb988fac
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-21892-0001.patch
@@ -0,0 +1,97 @@
+From 3f619407fe1e597657b598383d0b5003a064311b Mon Sep 17 00:00:00 2001
+From: Daniel Bevenius <daniel.bevenius@gmail.com>
+Date: Wed, 17 Mar 2021 13:48:51 +0100
+Subject: [PATCH 2/5] src: allow CAP_NET_BIND_SERVICE in SafeGetenv
+
+This commit updates SafeGetenv to check if the current process has the
+effective capability cap_net_bind_service set, and if so allows
+environment variables to be read.
+
+The motivation for this change is a use-case where Node is run in a
+container, and the is a requirement to be able to listen to ports
+below 1024. This is done by setting the capability of
+cap_net_bind_service. In addition there is a need to set the
+environment variable `NODE_EXTRA_CA_CERTS`. But currently this
+environment variable will not be read when the capability has been set
+on the executable.
+
+PR-URL: https://github.com/nodejs/node/pull/37727
+Reviewed-By: Anna Henningsen <anna@addaleax.net>
+Reviewed-By: Richard Lau <rlau@redhat.com>
+Reviewed-By: James M Snell <jasnell@gmail.com>
+Reviewed-By: Michael Dawson <midawson@redhat.com>
+
+CVE: CVE-2024-21892
+
+Upstream-Status: Backport [https://github.com/nodejs/node/commit/3f619407f=
e1e5976]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/node_credentials.cc | 38 +++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 37 insertions(+), 1 deletion(-)
+
+diff --git a/src/node_credentials.cc b/src/node_credentials.cc
+index 4c098c9..7688af8 100644
+--- a/src/node_credentials.cc
++++ b/src/node_credentials.cc
+@@ -12,6 +12,11 @@
+ #include <unistd.h>  // setuid, getuid
+ #endif
+
++#ifdef __linux__
++#include <linux/capability.h>
++#include <sys/syscall.h>
++#endif  // __linux__
++
+ namespace node {
+
+ using v8::Array;
+@@ -33,14 +38,45 @@ bool linux_at_secure =3D false;
+
+ namespace credentials {
+
+-// Look up environment variable unless running as setuid root.
++#if defined(__linux__)
++// Returns true if the current process only has the passed-in capability.
++bool HasOnly(int capability) {
++  DCHECK(cap_valid(capability));
++
++  struct __user_cap_data_struct cap_data[2];
++  struct __user_cap_header_struct cap_header_data =3D {
++    _LINUX_CAPABILITY_VERSION_3,
++    getpid()};
++
++
++  if (syscall(SYS_capget, &cap_header_data, &cap_data) !=3D 0) {
++    return false;
++  }
++  if (capability < 32) {
++    return cap_data[0].permitted =3D=3D
++        static_cast<unsigned int>(CAP_TO_MASK(capability));
++  }
++  return cap_data[1].permitted =3D=3D
++      static_cast<unsigned int>(CAP_TO_MASK(capability));
++}
++#endif
++
++// Look up the environment variable and allow the lookup if the current
++// process only has the capability CAP_NET_BIND_SERVICE set. If the curre=
nt
++// process does not have any capabilities set and the process is running =
as
++// setuid root then lookup will not be allowed.
+ bool SafeGetenv(const char* key,
+                 std::string* text,
+                 std::shared_ptr<KVStore> env_vars,
+                 v8::Isolate* isolate) {
+ #if !defined(__CloudABI__) && !defined(_WIN32)
++#if defined(__linux__)
++  if ((!HasOnly(CAP_NET_BIND_SERVICE) && per_process::linux_at_secure) ||
++      getuid() !=3D geteuid() || getgid() !=3D getegid())
++#else
+   if (per_process::linux_at_secure || getuid() !=3D geteuid() ||
+       getgid() !=3D getegid())
++#endif
+     goto fail;
+ #endif
+
+--
+2.40.0
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-21892-0002.pat=
ch b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-21892-0002.patch
new file mode 100644
index 000000000..efb64db7d
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-21892-0002.patch
@@ -0,0 +1,58 @@
+From 10ecf400679e04eddab940721cad3f6c1d603b61 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Tobias=3D20Nie=3DC3=3D9Fen?=3D <tniessen@tnie.de>
+Date: Sat, 4 Nov 2023 00:39:57 +0000
+Subject: [PATCH 3/5] src: fix HasOnly(capability) in node::credentials
+
+SYS_capget with _LINUX_CAPABILITY_VERSION_3 returns the process's
+permitted capabilities as two 32-bit values. To determine if the only
+permitted capability is indeed CAP_NET_BIND_SERVICE, it is necessary to
+check both of those values.
+
+Not doing so creates a vulnerability that potentially allows
+unprivileged users to inject code into a privileged Node.js process
+through environment variables such as NODE_OPTIONS.
+
+PR-URL: https://github.com/nodejs-private/node-private/pull/505
+Reviewed-By: Rafael Gonzaga <rafael.nunu@hotmail.com>
+
+CVE-ID: CVE-2024-21892
+
+Upstream-Status: Backport [https://github.com/nodejs/node/commit/10ecf4006=
79e04ed]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/node_credentials.cc | 12 +++++-------
+ 1 file changed, 5 insertions(+), 7 deletions(-)
+
+diff --git a/src/node_credentials.cc b/src/node_credentials.cc
+index 7688af8..3dcbc8a 100644
+--- a/src/node_credentials.cc
++++ b/src/node_credentials.cc
+@@ -43,7 +43,7 @@ namespace credentials {
+ bool HasOnly(int capability) {
+   DCHECK(cap_valid(capability));
+
+-  struct __user_cap_data_struct cap_data[2];
++  struct __user_cap_data_struct cap_data[_LINUX_CAPABILITY_U32S_3];
+   struct __user_cap_header_struct cap_header_data =3D {
+     _LINUX_CAPABILITY_VERSION_3,
+     getpid()};
+@@ -52,12 +52,10 @@ bool HasOnly(int capability) {
+   if (syscall(SYS_capget, &cap_header_data, &cap_data) !=3D 0) {
+     return false;
+   }
+-  if (capability < 32) {
+-    return cap_data[0].permitted =3D=3D
+-        static_cast<unsigned int>(CAP_TO_MASK(capability));
+-  }
+-  return cap_data[1].permitted =3D=3D
+-      static_cast<unsigned int>(CAP_TO_MASK(capability));
++  static_assert(arraysize(cap_data) =3D=3D 2);
++  return cap_data[CAP_TO_INDEX(capability)].permitted =3D=3D
++             static_cast<unsigned int>(CAP_TO_MASK(capability)) &&
++         cap_data[1 - CAP_TO_INDEX(capability)].permitted =3D=3D 0;
+ }
+ #endif
+
+--
+2.40.0
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb b/meta-oe/re=
cipes-devtools/nodejs/nodejs_16.20.2.bb
index b786c0273..9540ed44e 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
@@ -28,6 +28,8 @@ SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.ta=
r.xz \
            file://0001-Nodejs-Fixed-pipes-DeprecationWarning.patch \
            file://CVE-2022-25883.patch \
            file://CVE-2024-22019.patch \
+           file://CVE-2024-21892-0001.patch \
+           file://CVE-2024-21892-0002.patch \
            "
 SRC_URI:append:class-target =3D " \
            file://0001-Using-native-binaries.patch \
--
2.40.0


--_000_SJ0PR11MB5816D62994233C64DB982B3484592SJ0PR11MB5816namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Kindly ignore this patch.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Archana</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of Polampalli, Archana via lists.openembedded.org
 &lt;archana.polampalli=3Dwindriver.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Friday, February 23, 2024 14:06<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Subject:</b> [oe][meta-oe][kirkstone][PATCH 2/4] nodejs: fix CVE-2024-21=
892</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Archana Polampalli &lt;archana.polampalli@wi=
ndriver.com&gt;<br>
<br>
On Linux, Node.js ignores certain environment variables if those may have b=
een<br>
set by an unprivileged user while the process is running with elevated priv=
ileges<br>
with the only exception of CAP_NET_BIND_SERVICE. Due to a bug in the<br>
implementation of this exception, Node.js incorrectly applies this exceptio=
n<br>
even when certain other capabilities have been set. This allows unprivilege=
d<br>
users to inject code that inherits the process's elevated privileges.<br>
<br>
Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;<=
br>
---<br>
&nbsp;.../nodejs/nodejs/CVE-2024-21892-0001.patch&nbsp;&nbsp; | 97 ++++++++=
+++++++++++<br>
&nbsp;.../nodejs/nodejs/CVE-2024-21892-0002.patch&nbsp;&nbsp; | 58 ++++++++=
+++<br>
&nbsp;.../recipes-devtools/nodejs/nodejs_16.20.2.bb |&nbsp; 2 +<br>
&nbsp;3 files changed, 157 insertions(+)<br>
&nbsp;create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-21=
892-0001.patch<br>
&nbsp;create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-21=
892-0002.patch<br>
<br>
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-21892-0001.pat=
ch b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-21892-0001.patch<br>
new file mode 100644<br>
index 000000000..0eb988fac<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-21892-0001.patch<br>
@@ -0,0 +1,97 @@<br>
+From 3f619407fe1e597657b598383d0b5003a064311b Mon Sep 17 00:00:00 2001<br>
+From: Daniel Bevenius &lt;daniel.bevenius@gmail.com&gt;<br>
+Date: Wed, 17 Mar 2021 13:48:51 +0100<br>
+Subject: [PATCH 2/5] src: allow CAP_NET_BIND_SERVICE in SafeGetenv<br>
+<br>
+This commit updates SafeGetenv to check if the current process has the<br>
+effective capability cap_net_bind_service set, and if so allows<br>
+environment variables to be read.<br>
+<br>
+The motivation for this change is a use-case where Node is run in a<br>
+container, and the is a requirement to be able to listen to ports<br>
+below 1024. This is done by setting the capability of<br>
+cap_net_bind_service. In addition there is a need to set the<br>
+environment variable `NODE_EXTRA_CA_CERTS`. But currently this<br>
+environment variable will not be read when the capability has been set<br>
+on the executable.<br>
+<br>
+PR-URL: <a href=3D"https://github.com/nodejs/node/pull/37727">https://gith=
ub.com/nodejs/node/pull/37727</a><br>
+Reviewed-By: Anna Henningsen &lt;anna@addaleax.net&gt;<br>
+Reviewed-By: Richard Lau &lt;rlau@redhat.com&gt;<br>
+Reviewed-By: James M Snell &lt;jasnell@gmail.com&gt;<br>
+Reviewed-By: Michael Dawson &lt;midawson@redhat.com&gt;<br>
+<br>
+CVE: CVE-2024-21892<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/nodejs/node/commi=
t/3f619407fe1e5976">https://github.com/nodejs/node/commit/3f619407fe1e5976<=
/a>]<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ src/node_credentials.cc | 38 +++++++++++++++++++++++++++++++++++++-<br>
+ 1 file changed, 37 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/node_credentials.cc b/src/node_credentials.cc<br>
+index 4c098c9..7688af8 100644<br>
+--- a/src/node_credentials.cc<br>
++++ b/src/node_credentials.cc<br>
+@@ -12,6 +12,11 @@<br>
+ #include &lt;unistd.h&gt;&nbsp; // setuid, getuid<br>
+ #endif<br>
+<br>
++#ifdef __linux__<br>
++#include &lt;linux/capability.h&gt;<br>
++#include &lt;sys/syscall.h&gt;<br>
++#endif&nbsp; // __linux__<br>
++<br>
+ namespace node {<br>
+<br>
+ using v8::Array;<br>
+@@ -33,14 +38,45 @@ bool linux_at_secure =3D false;<br>
+<br>
+ namespace credentials {<br>
+<br>
+-// Look up environment variable unless running as setuid root.<br>
++#if defined(__linux__)<br>
++// Returns true if the current process only has the passed-in capability.=
<br>
++bool HasOnly(int capability) {<br>
++&nbsp; DCHECK(cap_valid(capability));<br>
++<br>
++&nbsp; struct __user_cap_data_struct cap_data[2];<br>
++&nbsp; struct __user_cap_header_struct cap_header_data =3D {<br>
++&nbsp;&nbsp;&nbsp; _LINUX_CAPABILITY_VERSION_3,<br>
++&nbsp;&nbsp;&nbsp; getpid()};<br>
++<br>
++<br>
++&nbsp; if (syscall(SYS_capget, &amp;cap_header_data, &amp;cap_data) !=3D =
0) {<br>
++&nbsp;&nbsp;&nbsp; return false;<br>
++&nbsp; }<br>
++&nbsp; if (capability &lt; 32) {<br>
++&nbsp;&nbsp;&nbsp; return cap_data[0].permitted =3D=3D<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static_cast&lt;unsigned int&gt=
;(CAP_TO_MASK(capability));<br>
++&nbsp; }<br>
++&nbsp; return cap_data[1].permitted =3D=3D<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static_cast&lt;unsigned int&gt;(CAP_TO_MAS=
K(capability));<br>
++}<br>
++#endif<br>
++<br>
++// Look up the environment variable and allow the lookup if the current<b=
r>
++// process only has the capability CAP_NET_BIND_SERVICE set. If the curre=
nt<br>
++// process does not have any capabilities set and the process is running =
as<br>
++// setuid root then lookup will not be allowed.<br>
+ bool SafeGetenv(const char* key,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; std::string* text,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; std::shared_ptr&lt;KVStore&gt; env_vars,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; v8::Isolate* isolate) {<br>
+ #if !defined(__CloudABI__) &amp;&amp; !defined(_WIN32)<br>
++#if defined(__linux__)<br>
++&nbsp; if ((!HasOnly(CAP_NET_BIND_SERVICE) &amp;&amp; per_process::linux_=
at_secure) ||<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; getuid() !=3D geteuid() || getgid() !=3D g=
etegid())<br>
++#else<br>
+&nbsp;&nbsp; if (per_process::linux_at_secure || getuid() !=3D geteuid() |=
|<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; getgid() !=3D getegid())<br>
++#endif<br>
+&nbsp;&nbsp;&nbsp;&nbsp; goto fail;<br>
+ #endif<br>
+<br>
+--<br>
+2.40.0<br>
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-21892-0002.pat=
ch b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-21892-0002.patch<br>
new file mode 100644<br>
index 000000000..efb64db7d<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-21892-0002.patch<br>
@@ -0,0 +1,58 @@<br>
+From 10ecf400679e04eddab940721cad3f6c1d603b61 Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?Tobias=3D20Nie=3DC3=3D9Fen?=3D &lt;tniessen@tnie.de&gt;<=
br>
+Date: Sat, 4 Nov 2023 00:39:57 +0000<br>
+Subject: [PATCH 3/5] src: fix HasOnly(capability) in node::credentials<br>
+<br>
+SYS_capget with _LINUX_CAPABILITY_VERSION_3 returns the process's<br>
+permitted capabilities as two 32-bit values. To determine if the only<br>
+permitted capability is indeed CAP_NET_BIND_SERVICE, it is necessary to<br=
>
+check both of those values.<br>
+<br>
+Not doing so creates a vulnerability that potentially allows<br>
+unprivileged users to inject code into a privileged Node.js process<br>
+through environment variables such as NODE_OPTIONS.<br>
+<br>
+PR-URL: <a href=3D"https://github.com/nodejs-private/node-private/pull/505=
">https://github.com/nodejs-private/node-private/pull/505</a><br>
+Reviewed-By: Rafael Gonzaga &lt;rafael.nunu@hotmail.com&gt;<br>
+<br>
+CVE-ID: CVE-2024-21892<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/nodejs/node/commi=
t/10ecf400679e04ed">https://github.com/nodejs/node/commit/10ecf400679e04ed<=
/a>]<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ src/node_credentials.cc | 12 +++++-------<br>
+ 1 file changed, 5 insertions(+), 7 deletions(-)<br>
+<br>
+diff --git a/src/node_credentials.cc b/src/node_credentials.cc<br>
+index 7688af8..3dcbc8a 100644<br>
+--- a/src/node_credentials.cc<br>
++++ b/src/node_credentials.cc<br>
+@@ -43,7 +43,7 @@ namespace credentials {<br>
+ bool HasOnly(int capability) {<br>
+&nbsp;&nbsp; DCHECK(cap_valid(capability));<br>
+<br>
+-&nbsp; struct __user_cap_data_struct cap_data[2];<br>
++&nbsp; struct __user_cap_data_struct cap_data[_LINUX_CAPABILITY_U32S_3];<=
br>
+&nbsp;&nbsp; struct __user_cap_header_struct cap_header_data =3D {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; _LINUX_CAPABILITY_VERSION_3,<br>
+&nbsp;&nbsp;&nbsp;&nbsp; getpid()};<br>
+@@ -52,12 +52,10 @@ bool HasOnly(int capability) {<br>
+&nbsp;&nbsp; if (syscall(SYS_capget, &amp;cap_header_data, &amp;cap_data) =
!=3D 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
+&nbsp;&nbsp; }<br>
+-&nbsp; if (capability &lt; 32) {<br>
+-&nbsp;&nbsp;&nbsp; return cap_data[0].permitted =3D=3D<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static_cast&lt;unsigned int&gt=
;(CAP_TO_MASK(capability));<br>
+-&nbsp; }<br>
+-&nbsp; return cap_data[1].permitted =3D=3D<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static_cast&lt;unsigned int&gt;(CAP_TO_MAS=
K(capability));<br>
++&nbsp; static_assert(arraysize(cap_data) =3D=3D 2);<br>
++&nbsp; return cap_data[CAP_TO_INDEX(capability)].permitted =3D=3D<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
static_cast&lt;unsigned int&gt;(CAP_TO_MASK(capability)) &amp;&amp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cap_data[1 - CAP_TO_INDE=
X(capability)].permitted =3D=3D 0;<br>
+ }<br>
+ #endif<br>
+<br>
+--<br>
+2.40.0<br>
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb b/meta-oe/re=
cipes-devtools/nodejs/nodejs_16.20.2.bb<br>
index b786c0273..9540ed44e 100644<br>
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb<br>
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb<br>
@@ -28,6 +28,8 @@ SRC_URI =3D &quot;<a href=3D""></a>http://nodejs.org/dist=
/v${PV}/node-v${PV}.tar.xz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-Nodejs-Fixed-pipes-DeprecationWarning.patch">file://0001-No=
dejs-Fixed-pipes-DeprecationWarning.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-25883.patch">file://CVE-2022-25883.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2024-22019.patch">file://CVE-2024-22019.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2024-21892-0001.patch">file://CVE-2024-21892-0001.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2024-21892-0002.patch">file://CVE-2024-21892-0002.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;SRC_URI:append:class-target =3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-Using-native-binaries.patch">file://0001-Using-native-binar=
ies.patch</a> \<br>
-- <br>
2.40.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_SJ0PR11MB5816D62994233C64DB982B3484592SJ0PR11MB5816namp_--

