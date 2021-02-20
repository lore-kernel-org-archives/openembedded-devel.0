Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.71])
 by mx.groups.io with SMTP id smtpd.web12.2557.1613791069903884440
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Feb 2021 19:17:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=cWid9CD6;
 spf=pass (domain: windriver.com, ip: 40.107.77.71, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1/pJcSnVSdcmt2BFM/fIOWTUXjIboHmEY/2yiYmGNfwOrqGG+15n8qyJ86c42l8TzN81jFQqgnYpJrQ1qO/lv9fN4MAUkhkKDckUqpQa9VbGaV3Xob6JH7xKeFT0fXIjXl/is80J9pNwDoKehoWBbPS+S4HepMwkGZk/6vcIYUv0d2yIbaO/JriXRr9ckaTgx4Rie1ZA8lYUx5CKzT0TpRevsro1bOgjJc4SWM6JgNUyTeJvxXmGy55+tm2+1iYZGiirWoEfq1RE43D8AOk5gZhNnIEYb8qa5u3a4oMXHdH7JuqzM0VOowncZcpf2sWA/TE/ljqgUPhRS6e1xzX9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yW937bflOxEIBMy1uyKbzl7bgRAGuAqIiwngbFYMVfQ=;
 b=MQZYc+Pyz2TVePciTGv9PHn3OosMZbTLuftj6LotrGEPM1WA0Qs/EUR2meUV5o9Y9JEWp3ZKj+hCANDKS2RpTcpYuJ+bVaMylRdxpS0stOVzEoff9dfwGWurS8tj//Fc6Lmq2a1+zXwS3VRfDy7iDkKGEoyE72ngRjZQGQB/rGWskuoDk5pbH1bOKiCpTegKzocpLmfniKQEHDkfOO+ICTWyyi4R+iyXhuvc8YpmQMsmS9uwtKzjyvyh1OrPoSpgK+JOkVDk59B8cct6tU5W996cQu4L2RPtpznEFeJlK4TCOQMFO1os2X1Os8DQFqK0RVP0mVpPIUdlqbfeffq39A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yW937bflOxEIBMy1uyKbzl7bgRAGuAqIiwngbFYMVfQ=;
 b=cWid9CD6UmBaDUVXOxkMuh1ohmpG5FRD38kQ/gUPLMPxf4aefMUl6R2hfA65EBV7IZ1QO1pNt36snhqGPrSrXESn4zo1tR3+TTK+W7vgJ+T7Gf83i3K1Xwwl3yahgcW632KSkYUa9FWO0l+n1ya5DrQ7Z+DVApvCZmqj7RdQHQw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SN6PR11MB3405.namprd11.prod.outlook.com (2603:10b6:805:c0::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.38; Sat, 20 Feb
 2021 03:17:47 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3%8]) with mapi id 15.20.3846.042; Sat, 20 Feb 2021
 03:17:47 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] tcpdump: update 4.9.3 -> 4.99.0
Date: Fri, 19 Feb 2021 22:17:25 -0500
Message-ID: <20210220031725.10051-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: MN2PR16CA0057.namprd16.prod.outlook.com
 (2603:10b6:208:234::26) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by MN2PR16CA0057.namprd16.prod.outlook.com (2603:10b6:208:234::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend Transport; Sat, 20 Feb 2021 03:17:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1aba6511-ea01-49c1-7e1a-08d8d54e1868
X-MS-TrafficTypeDiagnostic: SN6PR11MB3405:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB34057FFA56E54E16569C786780839@SN6PR11MB3405.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:177;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tgeVVEGYa1RK5AFuA+hfyZQYZStl72OtSgKH/fF4CLnkjP162xOgP3hV1jgA90nV5K5WZIYmS2W2KUgYbYcZMC2wLTjxjcJGxoIZ91OKe36vL1/Ptl/0G291X/43187v+xGukE+jVu7mynVTOa+FBYhUMSp1iAA8e/+yMuvcgqCQtIclHnw8IZG5xnBqjSM4Srmgkj0IN041ytnc3s/hgJslZPN9elkblvyvFChNScPSo5x+b1HzgBuyodbTrMHJxVtP/hHWrwDfs4lAPqvsWKhWm7l7UpCOZt1uJLBBiybKfk5bQqIqWS9uTaiOzrKU0grdUqBoFB0JEYwHDs20Dw/iwHf18vdOcYqgMbX+88OVjOxVwhXI+hhkC6hBSfDI2+yz017/dLLAQqULsVi1X//0HLlexdzylBINfh/DDI3vsP7uJn2FnxHC6vZQK2VyZTcXEU25N+WPCFvkkEyw+Jf4ednI9C75kximfcc2KOeieeJrIwCHBwCh9CLX44eEIkrADIQdSHvQNUil3eCxG2EfTFubDzsIKheiWduIvcrww7GkL1HYmFBNwEYN2WXlfuaCirWmffZDXDQRVK3YK2rT1sCk/FAlB4CzLil5+qQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(346002)(396003)(366004)(136003)(66946007)(83380400001)(66476007)(478600001)(6916009)(52116002)(36756003)(6486002)(6666004)(66556008)(26005)(1076003)(8936002)(2616005)(2906002)(86362001)(16526019)(6512007)(966005)(6506007)(30864003)(956004)(5660300002)(186003)(316002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?WtY51nyg30mXDtRX3yb10WKiLnmtZT0YAYU839/uto03Nib8e7JHiqTv3ONA?=
 =?us-ascii?Q?yAB7U8sYRm1pBMUCoJ9gwWJRqio5RzZ9ig7Bo9m/RVdRnD9/l6Lgxa4OknFK?=
 =?us-ascii?Q?5High9rr81/eW/A4UHR6Zfm9T8jvHYf2Qft25CfOQTz5ezyet60/ZOXYvDq0?=
 =?us-ascii?Q?Qm8744qTNuU3l8h9W9kBYt0og0eGizuSY3Mqs4TacaCVt4ModLoY+gCuL5/G?=
 =?us-ascii?Q?9g8Gh896+DbFY1Bx4DNMrz+3oqEJchKuG+f4C9MOJZGEWA2eFzqYMbXqBrk2?=
 =?us-ascii?Q?4IJKd5Uj/9v0oxgklf8neOho2a1hBCFCNdhwqXivYk8P3IuX7j8K2H3IWHKG?=
 =?us-ascii?Q?t5EJKee8OwcdgpvRsFwXNi9poXsqrcFd3jmeImeQGtNW+9EsqLqKJUzu0igz?=
 =?us-ascii?Q?tKRjmNEVe9Fdl+ZgVHjGEWZGGBV7Hm/cNFvx5pGOwTNhv0EoOk+UpMyPVJLT?=
 =?us-ascii?Q?Z9oDTWdtCK/fioVaB2Hb/G26Af8s4BxE1JKPgc/RKUU6Qm+2aKgEQesqXmNl?=
 =?us-ascii?Q?EuK0KwTjMD5+puSUoct83+JV4B2JhVbC2T/wxQvKc/+NUNqLjejniaG/wZ+F?=
 =?us-ascii?Q?fI/ncb4baGMLfK+c0t/+PpLk6swQSYDvzuzu2BTkweULQx/TMGSRpaLmSgse?=
 =?us-ascii?Q?xiod/xtIMeRyy968rOcIE5PxnHr7zm6qzUMFIy/wpnLNlXSc2uAOo44V8pgK?=
 =?us-ascii?Q?dB3bikwmmmoWxLp4dIgtbcku8YGMSNzUAkmklf6v2GLuoNZne40KtdEXfFht?=
 =?us-ascii?Q?dSjDHlMjgo5Oom0xjjcp0hfXmsa1fP+uhniPN4NlsZQT5JAcUh19Mkeyhl7x?=
 =?us-ascii?Q?GMBft8qizwgp3Dg9fQNL9broqwuZzOT1H4bWaoTOkRTjZ6fqXWirjy1l8G25?=
 =?us-ascii?Q?F9pzkVa2XHhY6wikaJNBTOk9riUaLaVAoyUhL1ZRNkTdzCFItqkhC9805hG6?=
 =?us-ascii?Q?47hlO1/Blji0rx4VPZGROFOFcPTY+ksbWRoUa+WoVL5KlyRXZDWQE4OidLrm?=
 =?us-ascii?Q?xlhgEJaGaERxLsUJcvL1+TQCuQJEfyuBTOrTsvhREZdcseeRho2tarH3iiqk?=
 =?us-ascii?Q?2F/imE5hTG22/nYouEN22h/cwuBqaAF3PKfVmyjBjAfUEfm+fKOs1FEJC3dZ?=
 =?us-ascii?Q?OVhpFRDyOmb1TNpVRyD+v0nC73q+cHxueoL9HHrU29NK+uDZxj2AOdE96q0N?=
 =?us-ascii?Q?gIyepzVe1j4Rrp1Kv53/W6+WCLzPe9C/ImZ1I+vvzCiBIbWCxmdXB7jG0teO?=
 =?us-ascii?Q?o8IfUzlQyppK/jRdX8RRYbxDN0ZbqM3AgsXjWVTlBWhxr16kPCTQcDbjpsOK?=
 =?us-ascii?Q?vpSiejBPgTEmqe5d0pVOAkwE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aba6511-ea01-49c1-7e1a-08d8d54e1868
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2021 03:17:46.8931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: afxWkMyT6FIQNLRG4MGpNQUay+oYECkESArC5jjCCUuahGZmTLa1x/3SsqawHTgoDlcUbLaQixo9LFZ31xOiGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3405
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Removed patches:
    * avoid-absolute-path-when-searching-for-libdlpi.patch
    reason: this is a solaris specific patch,
            It no longer generates QA error.

    * unnecessary-to-check-libpcap.patch
    reason: upstream changed the logic, a new patch was needed.

New patch:
    * 0001-aclocal.m4-Skip-checking-for-pcap-config.patch
    reason: configure shouldn't look for pcap-config.
    upstream reference: cfc4c750a

Modified patch:
    * add-ptest.patch
    reason: Makefile had slight change.
            new unrelated perl script was introduced,
            removed to make package QA happy.

License:
    upstream removed some whitespace

Ptest:
    binaries are now present in /usr/bin not /usr/sbin
        upstream commit: 95096be4f
    add perl libraries dependencies

    tests passed: 571 (qemux86-64)
    tests failed: 0

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 ...ping-don-t-allocate-a-too-large-buff.patch | 70 -------------------
 ...cal.m4-Skip-checking-for-pcap-config.patch | 33 +++++++++
 .../tcpdump/tcpdump/add-ptest.patch           | 28 +++++---
 ...lute-path-when-searching-for-libdlpi.patch | 31 --------
 .../unnecessary-to-check-libpcap.patch        | 40 -----------
 .../{tcpdump_4.9.3.bb =3D> tcpdump_4.99.0.bb}   | 23 +++---
 6 files changed, 67 insertions(+), 158 deletions(-)
 delete mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/0001-PP=
P-When-un-escaping-don-t-allocate-a-too-large-buff.patch
 create mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/0001-ac=
local.m4-Skip-checking-for-pcap-config.patch
 delete mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/avoid-a=
bsolute-path-when-searching-for-libdlpi.patch
 delete mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/unneces=
sary-to-check-libpcap.patch
 rename meta-networking/recipes-support/tcpdump/{tcpdump_4.9.3.bb =3D> tcpd=
ump_4.99.0.bb} (67%)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/0001-PPP-When-=
un-escaping-don-t-allocate-a-too-large-buff.patch b/meta-networking/recipes=
-support/tcpdump/tcpdump/0001-PPP-When-un-escaping-don-t-allocate-a-too-lar=
ge-buff.patch
deleted file mode 100644
index 9b74e00c5..000000000
--- a/meta-networking/recipes-support/tcpdump/tcpdump/0001-PPP-When-un-esca=
ping-don-t-allocate-a-too-large-buff.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 32027e199368dad9508965aae8cd8de5b6ab5231 Mon Sep 17 00:00:00 2001
-From: Guy Harris <guy@alum.mit.edu>
-Date: Sat, 18 Apr 2020 14:04:59 -0700
-Subject: [PATCH] PPP: When un-escaping, don't allocate a too-large buffer.
-
-The buffer should be big enough to hold the captured data, but it
-doesn't need to be big enough to hold the entire on-the-network packet,
-if we haven't captured all of it.
-
-(backported from commit e4add0b010ed6f2180dcb05a13026242ed935334)
-
-Upstream-Status: Backport
-Signed-off-by: Stacy Gaikovaia <stacy.gaikovaia@windriver.com>
-
----
- print-ppp.c | 18 ++++++++++++++----
- 1 file changed, 14 insertions(+), 4 deletions(-)
-
-diff --git a/print-ppp.c b/print-ppp.c
-index 89176172..33fb0341 100644
---- a/print-ppp.c
-+++ b/print-ppp.c
-@@ -1367,19 +1367,29 @@ trunc:
- 	return 0;
- }
-=20
-+/*
-+ * Un-escape RFC 1662 PPP in HDLC-like framing, with octet escapes.
-+ * The length argument is the on-the-wire length, not the captured
-+ * length; we can only un-escape the captured part.
-+ */
- static void
- ppp_hdlc(netdissect_options *ndo,
-          const u_char *p, int length)
- {
-+	u_int caplen =3D ndo->ndo_snapend - p;
- 	u_char *b, *t, c;
- 	const u_char *s;
--	int i, proto;
-+	u_int i;
-+	int proto;
- 	const void *se;
-=20
-+	if (caplen =3D=3D 0)
-+		return;
-+
-         if (length <=3D 0)
-                 return;
-=20
--	b =3D (u_char *)malloc(length);
-+	b =3D (u_char *)malloc(caplen);
- 	if (b =3D=3D NULL)
- 		return;
-=20
-@@ -1388,10 +1398,10 @@ ppp_hdlc(netdissect_options *ndo,
- 	 * Do this so that we dont overwrite the original packet
- 	 * contents.
- 	 */
--	for (s =3D p, t =3D b, i =3D length; i > 0 && ND_TTEST(*s); i--) {
-+	for (s =3D p, t =3D b, i =3D caplen; i !=3D 0; i--) {
- 		c =3D *s++;
- 		if (c =3D=3D 0x7d) {
--			if (i <=3D 1 || !ND_TTEST(*s))
-+			if (i <=3D 1)
- 				break;
- 			i--;
- 			c =3D *s++ ^ 0x20;
---=20
-2.17.1
-
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/0001-aclocal.m=
4-Skip-checking-for-pcap-config.patch b/meta-networking/recipes-support/tcp=
dump/tcpdump/0001-aclocal.m4-Skip-checking-for-pcap-config.patch
new file mode 100644
index 000000000..bb56c4d4c
--- /dev/null
+++ b/meta-networking/recipes-support/tcpdump/tcpdump/0001-aclocal.m4-Skip-=
checking-for-pcap-config.patch
@@ -0,0 +1,33 @@
+From 867bf5c9d0fb64e1b4e64cb13b983674c270a6bf Mon Sep 17 00:00:00 2001
+From: Yi Fan Yu <yifan.yu@windriver.com>
+Date: Fri, 19 Feb 2021 00:52:35 -0500
+Subject: [PATCH] aclocal.m4: Skip checking for pcap-config
+
+Bitbake triggers an configure error
+saying we should look for pkg-config instead.
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+---
+ aclocal.m4 | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/aclocal.m4 b/aclocal.m4
+index bd4e27a5..136cb8ca 100644
+--- a/aclocal.m4
++++ b/aclocal.m4
+@@ -584,8 +584,8 @@ AC_DEFUN(AC_LBL_LIBPCAP,
+             # No pkg-config
+             # Look for an installed pcap-config.
+             #
+-            AC_PATH_TOOL(PCAP_CONFIG, pcap-config)
+-            if test -n "$PCAP_CONFIG" ; then
++            # AC_PATH_TOOL(PCAP_CONFIG, pcap-config)
++            if false; then
+                 #
+                 # Found - use it to get the include flags for
+                 # libpcap and the flags to link with libpcap.
+--=20
+2.29.2
+
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patc=
h b/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch
index f8ff354fe..c46de4b96 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch
+++ b/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch
@@ -1,6 +1,6 @@
-From 8c9c728757f89ebe6c4019114b83a63c63596f69 Mon Sep 17 00:00:00 2001
-From: "Hongjun.Yang" <hongjun.yang@windriver.com>
-Date: Wed, 2 Oct 2019 16:57:06 -0400
+From 5f0f70192b0e20336e642b02ca9662ba2fef66cf Mon Sep 17 00:00:00 2001
+From: Yi Fan Yu <yifan.yu@windriver.com>
+Date: Fri, 19 Feb 2021 15:21:18 -0500
 Subject: [PATCH] Add ptest for tcpdump
=20
 Upstream-Status: Pending
@@ -8,15 +8,21 @@ Upstream-Status: Pending
 Signed-off-by: Hongjun.Yang <hongjun.yang@windriver.com>
 Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
=20
+remove perl script not required by ptest causing QA problems
+
+reference upstream issue/commit:
+https://github.com/the-tcpdump-group/tcpdump/issues/26
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
 ---
- Makefile.in | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
+ Makefile.in | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
=20
 diff --git a/Makefile.in b/Makefile.in
-index 3b589184..7b10e38c 100644
+index ea1ef1d0..e7987bd8 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -437,9 +437,17 @@ distclean:
+@@ -445,9 +445,18 @@ distclean:
  	    tests/failure-outputs.txt
  	rm -rf autom4te.cache tests/DIFF tests/NEW
 =20
@@ -24,14 +30,18 @@ index 3b589184..7b10e38c 100644
 +buildtest-TESTS: tcpdump
 +
 +runtest-PTEST:
-	(mkdir -p tests && SRCDIR=3D`cd ${srcdir}; pwd` && export SRCDIR && $$SRC=
DIR/tests/TESTrun.sh )
+ 	$(srcdir)/tests/TESTrun
 =20
 +install-ptest:
 +	cp -r tests                     $(DESTDIR)
++	rm $(DESTDIR)/tests/setkey2esp-secrets.pl
 +	cp -r config.h                  $(DESTDIR)
 +	install -m 0755 Makefile        $(DESTDIR)
-+	ln -sf /usr/sbin/tcpdump        $(DESTDIR)/tcpdump
++	ln -s /usr/bin/tcpdump          $(DESTDIR)/tcpdump
 +
  extags: $(TAGFILES)
  	ctags $(TAGFILES)
 =20
+--=20
+2.29.2
+
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/avoid-absolute=
-path-when-searching-for-libdlpi.patch b/meta-networking/recipes-support/tc=
pdump/tcpdump/avoid-absolute-path-when-searching-for-libdlpi.patch
deleted file mode 100644
index 977ab95b7..000000000
--- a/meta-networking/recipes-support/tcpdump/tcpdump/avoid-absolute-path-w=
hen-searching-for-libdlpi.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 02085028cdaf075943c27ebc02bb6de0289ec1d3 Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Wed, 2 Oct 2019 16:43:48 -0400
-Subject: [PATCH] avoid absolute path when searching for libdlpi
-
-Let the build environment control library search paths.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
-Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 3401a7a3..6a52485a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -528,7 +528,7 @@ don't.])
- fi
-=20
- # libdlpi is needed for Solaris 11 and later.
--AC_CHECK_LIB(dlpi, dlpi_walk, LIBS=3D"$LIBS -ldlpi" LDFLAGS=3D"-L/lib $LD=
FLAGS", ,-L/lib)
-+AC_CHECK_LIB(dlpi, dlpi_walk, LIBS=3D"$LIBS -ldlpi")
-=20
- dnl
- dnl Check for "pcap_list_datalinks()", "pcap_set_datalink()",
---=20
-2.17.1
-
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to=
-check-libpcap.patch b/meta-networking/recipes-support/tcpdump/tcpdump/unne=
cessary-to-check-libpcap.patch
deleted file mode 100644
index 8793bf7a3..000000000
--- a/meta-networking/recipes-support/tcpdump/tcpdump/unnecessary-to-check-=
libpcap.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From dd023c133980fcc0cff5896e85377675e0571894 Mon Sep 17 00:00:00 2001
-From: Roy Li <rongqing.li@windriver.com>
-Date: Tue, 8 Jul 2014 13:20:47 +0800
-Subject: [PATCH] unnecessary to check libpcap
-
-since the check of libpcap did not consider the cross-compile, lead to the
-below error:
-	This autoconf log indicates errors, it looked at host include and/or
-	library paths while determining system capabilities.
-
-In fact, the libpcap has been added into the tcpdump's DEPENDS, not need t=
o
-check if libpcap existed.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
-Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
----
- configure.ac | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 56e2a624..3401a7a3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -404,7 +404,9 @@ dnl Some platforms may need -lnsl for getrpcbynumber.
- AC_SEARCH_LIBS(getrpcbynumber, nsl,
-     AC_DEFINE(HAVE_GETRPCBYNUMBER, 1, [define if you have getrpcbynumber(=
)]))
-=20
--AC_LBL_LIBPCAP(V_PCAPDEP, V_INCLS)
-+# Simplified (more cross compile friendly) check for libpcap. All we real=
ly
-+# need is to sanity check that libpcap is available and add -lpcap to LIB=
S.
-+AC_CHECK_LIB(pcap, pcap_compile, LIBS=3D"$LIBS -lpcap")
-=20
- #
- # Check for these after AC_LBL_LIBPCAP, so we link with the appropriate
---=20
-2.17.1
-
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb b/met=
a-networking/recipes-support/tcpdump/tcpdump_4.99.0.bb
similarity index 67%
rename from meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
rename to meta-networking/recipes-support/tcpdump/tcpdump_4.99.0.bb
index afcb4d508..66510b7fd 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.0.bb
@@ -2,26 +2,33 @@ SUMMARY =3D "A sophisticated network protocol analyzer"
 HOMEPAGE =3D "http://www.tcpdump.org/"
 SECTION =3D "net"
 LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1d4b0366557951c84a94fabe3529f86=
7"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5eb289217c160e2920d2e35bddc3645=
3"
=20
 DEPENDS =3D "libpcap"
=20
 RDEPENDS_${PN}-ptest +=3D " make perl \
 	perl-module-file-basename \
+	perl-module-file-spec \
+	perl-module-file-spec-unix \
+	perl-module-file-path \
+	perl-module-file-glob \
+	perl-module-data-dumper \
+	perl-module-bytes \
 	perl-module-posix \
-	perl-module-carp"
+	perl-module-carp \
+	perl-module-cwd \
+    perl-module-constant \
+"
=20
 SRC_URI =3D " \
     http://www.tcpdump.org/release/${BP}.tar.gz \
-    file://unnecessary-to-check-libpcap.patch \
-    file://avoid-absolute-path-when-searching-for-libdlpi.patch \
     file://add-ptest.patch \
     file://run-ptest \
-    file://0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buff.patch=
 \
+    file://0001-aclocal.m4-Skip-checking-for-pcap-config.patch \
 "
=20
-SRC_URI[md5sum] =3D "a4ead41d371f91aa0a2287f589958bae"
-SRC_URI[sha256sum] =3D "2cd47cb3d460b6ff75f4a9940f594317ad456cfbf2bd2c8e51=
51e16559db6410"
+SRC_URI[md5sum] =3D "b10aa2f497def7283bc060f626879ce5"
+SRC_URI[sha256sum] =3D "8cf2f17a9528774a7b41060323be8b73f76024f7778f59c34e=
fa65d49d80b842"
=20
 UPSTREAM_CHECK_REGEX =3D "tcpdump-(?P<pver>\d+(\.(?!99)\d+)+)\.tar"
=20
@@ -46,7 +53,7 @@ do_configure_prepend() {
=20
 do_install_append() {
     # make install installs an unneeded extra copy of the tcpdump binary
-    rm -f ${D}${sbindir}/tcpdump.${PV}
+    rm ${D}${bindir}/tcpdump.${PV}
 }
=20
 do_compile_ptest() {
--=20
2.29.2

