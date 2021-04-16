Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.70])
 by mx.groups.io with SMTP id smtpd.web10.10832.1618587428547036761
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Apr 2021 08:37:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hJULLJr/;
 spf=pass (domain: windriver.com, ip: 40.107.243.70, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eod3+jqMT2jMv6co7ZRdZjTKrDvzuHQFu/oL6cCQDt96ws2QMLGpqmZQofooRceQ9IhaEwoakSvGP+dt85yK7i8mFymHLsNgTgPhFU4A8Z8ZqJGyc8e7J+y2HDHjZ4kBlI606u0SPLCcZo57x1G7ARULohthX6yK+Ccs86rGgwXSqAz90ejKziLEMa6jpPNlALNNIAdhZbu/0bf6cGMexx3RtLqrg9+OKASUuI8Ku/jEX4dDhezcW7ac258M6v+bCMRqreOnSIPmwptV6b0Npih4/fv341YdKmjO/hW7zdVO9KTTD8KTra5u+6Yn9vjt7nuPFuxnJebGSXPpH85tLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BDAUeuSkaWR+uwlNdbJoH4hcfHMmcBj1ByCy8qUWSE=;
 b=BpiYfoA5yFyBKCWymX91CMhJ6hbyOVXpHeEPS4mtWSa80Rn/toZDuugPAjaKpbEyI4MMIXhwRuLzhGlkiuuUomXhSRjI2CpX4CIt6pCgi0iQaHxyoCQi4jhkJjvEokVvQm7MhTwsmqT2OFn6bdHpgrDY1ySjJzooT4boJMrEyUeNoNdeM99+f0/mr73TrS3JbkqM4ozAXamxAVe0zTnVVd5dWq9rFGeUxVpYhJqu6NtDITlRP/EFcAhG/NCmUXTRx09JdDUjlHBD1BqJxm8iRijtEVwsrJFfmmHIWIhPeuEuMEBvZliC1X81x83gjpsDWe1o6yQk10qgWURydQEA/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BDAUeuSkaWR+uwlNdbJoH4hcfHMmcBj1ByCy8qUWSE=;
 b=hJULLJr/z886ZXzf+1M9BfwQZ6+yQP94UIdvok70b1eXVoDAyZKcrixPJ/C5ZgtX+nLbv8qSxiKMv6oRKew15ERhx3tzTwDgWYzP8yPW6FY96BAQ6vITf2DFdJz7C/1zaiFf3AS/znhKaJLzTRWBF8VN3J5QsPbL1p5LMjDAKlg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SA0PR11MB4640.namprd11.prod.outlook.com (2603:10b6:806:9b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Fri, 16 Apr
 2021 15:37:06 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%9]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 15:37:06 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] syslog-ng: upgrade 3.24.1 -> 3.31.2
Date: Fri, 16 Apr 2021 11:36:47 -0400
Message-ID: <20210416153648.25192-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: MN2PR17CA0009.namprd17.prod.outlook.com
 (2603:10b6:208:15e::22) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by MN2PR17CA0009.namprd17.prod.outlook.com (2603:10b6:208:15e::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 15:37:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa59b740-2c25-4926-1118-08d900ed7d38
X-MS-TrafficTypeDiagnostic: SA0PR11MB4640:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB4640C07FA12E6E10070E57D7804C9@SA0PR11MB4640.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	f18set8/LER2mj2pfxRgJVFA0kza4HBK7ZgYH2KIsA5QbYrGe7vuWF9hq5IxScCyPThTI3fm+RyrjQZ8mTnHZ8mbXi3qG+kmoOTJ2nW6b0yLZyRMerxR0Sbrbv5CYIXJVJ+EcteySEq5aEg2Hff9+aMKLLG339y2TBiISwgdvZN0Wf/H59oEZZJdv1wDZN6vnvxW27PEHY8fbZBv1iBWzlGQP9Fs5Fk//5xHgdLnEnuSc6PGtZoQxFaC1YIcQrZZj+5aPEFc2NcxB+IXseZSMSR6tY5XYiXQ2/kr/+yF9Ue7kAW5zblPTzyZnlF61DXK02H8iAg2IHm/zvAi2gM86Ve6oFMOBO87p3dWMw4Je0r3slwPvdXU6njTtHxVzvV0dMPT+Y/fw4bfYuWS0dCe/jakwTPxTFcwZpTELUP0ECufu1fiUFkQvUghSaBzAeKLrnMIwAl5XGQ4DvZyrY+BF43SIHT5MlsUZ0STdOsZMixDJnLDgJ3wQnszs0+uQicsh6OZpG4NpTh2Q3MTx/vlhOut83miPl3c54OS1vt+MrMPPoii+/RU7s6jGMIuL3UYectR1e4dq/aBuy3x9+68zkfDPlyCidzYHYtvkAdenoOIx+XWAxuhELj2RWJN3u4guykXC0gc+0loOUTBaqqBCTw90t/TysGUqDfiDEF/DTVYV6Kg76IBSUBduTrV4WIVHvCFyXNLlDZcIzeg6ixKEEG99Ti7VJXsLGH2Hk0+/yM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(346002)(366004)(136003)(396003)(66556008)(16526019)(52116002)(8936002)(66476007)(38350700002)(36756003)(30864003)(6506007)(86362001)(5660300002)(956004)(66946007)(2906002)(6512007)(6666004)(316002)(83380400001)(2616005)(186003)(478600001)(26005)(1076003)(6916009)(6486002)(8676002)(38100700002)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?1iOh3rs5agS74qsdF56qSOCH6cTgyzxfe4fmD56u91GnJoyzWeUI8jYLhykX?=
 =?us-ascii?Q?XBVZVukmy5dnwisHZaoCeJUcVDCvLjrPKfOmD0+sWd9+KMWbOi6gceg1sBwV?=
 =?us-ascii?Q?3Ubdh3Ql5slaYyUcYY5KRrOERJU/ogGMZnXUr7xkP7+5oRsuqtgq6QUKuGlx?=
 =?us-ascii?Q?kABeGNSlVczkPiDvCs2l6hxahm7fDcKdMzZGUzU5wy33fwHugepFAYmuX66i?=
 =?us-ascii?Q?G8vBRtcuIUdhDKlPSFtSUac6SHiEM2SRANPQnNgkcgnBFfzZC85uhQkIqaOs?=
 =?us-ascii?Q?Y65W13TwijnoA43yqDc/goWRiBfozdtfydMhosbVGP1KpLLdD7RjpXVCtfpJ?=
 =?us-ascii?Q?kItT++JQNvRPsEHWKgZSFTU8Dw2Z0x9Psdc5QaPvl7IZCJbKvdYeD56v+xKV?=
 =?us-ascii?Q?8Pfw3xI3XrFCOiCoVmsIVD0Ua6qpuoGeHsaHfLpxm2vcUhBfJTSTJnlzOYuv?=
 =?us-ascii?Q?jqyqu7oRDd83n2qIQpvx8G1GeAfDuB7aS/7UPIhr+TMK/FATYlrN9knu4VxA?=
 =?us-ascii?Q?YKk78pSDtun1ljAdpXmN5fWWzOwaJo+5wWA5tk7U8J8BjzRxNjtI78klRQ5E?=
 =?us-ascii?Q?WggqbJ/CE+hZP1xmqu0xyj1chHmJJQfosnPtsJueFCwzVCVxSzqIzpSIivBY?=
 =?us-ascii?Q?bFN7Lnt/Cr4iHTLKDWL2uwRDYQM3v8zyZ+Du0Int83GggykikTXuNuWI4D7B?=
 =?us-ascii?Q?ZT7shfvJV5eZdAMQemofz/7RbV/ykJhWHXWYeow+8YaG7KzIH/9wfE6LyOyk?=
 =?us-ascii?Q?z0VQQ1T7eiF9ltRMlmKGmM4nS6aLSJ+xC5awv0hLzJe25wjuOXyyrd+Amw+4?=
 =?us-ascii?Q?K3TZ+eh+Low8/MrBhNhGqn5o89GpjXRP+/DHjUCxHNqq9xnjJmq3Ojub0q1A?=
 =?us-ascii?Q?nKSq7hlUEuDLxtl7b74R+sskbIbqr/NYKExJhQtpUfFnOEGv5MibWi0gQgpF?=
 =?us-ascii?Q?n1tNHi3QGUFa+EQlybeZcVjsApNzAM1a5fdATandMbLnAZikKFhXdcUNDWDt?=
 =?us-ascii?Q?9zxk6hLW9cON+QaqKcHc8vO7/nJZU0aeoZwoHAKY9pcjx1MtEXjzt4A8lH6Q?=
 =?us-ascii?Q?DHjT9jFh4y1OPhEpJvpgh/4mYM6XiImrUj6eZ2JAhsgOTc4JEC4PfcT5xarp?=
 =?us-ascii?Q?EBNa4Ewk617p0dn+zN6seJmzzwNnyK/rOLQdd1MqlzT3Rtizkus6JDG0XLvI?=
 =?us-ascii?Q?V6PATk8rDOVQPq6Oyz950/5Pj+j36QU/SXfMuz/f76NwEaxcbn9kDA3ZdujX?=
 =?us-ascii?Q?YGB4WXXOiOyJTdGSFqUuFWlPeUOQrncpuUfx1vMirEWWHXs/36ECLE3R6rzs?=
 =?us-ascii?Q?v0/lbI3egcBHvlm3uJaXJrFm?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa59b740-2c25-4926-1118-08d900ed7d38
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 15:37:06.0061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mbro2eXXAsyWYS9nR+9x5uXHyKGssGXzuj9jbW8GojDO8iQceU29kpdlO7d2xtDPNPMrDYh5sdqLUAORuvCPLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4640
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

License-Update:
Reword and clarify which subdir is LGPLv.1 and GPLv2.

Patch-Removal:
* 0001-syslog-ng-fix-segment-fault-during-service-start.patch
https://github.com/buytenh/ivykis/commit/a5e9caddbdb4d9d85133a440edec6aa7c1=
f018ac

Submit pending patches upstream.

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 ...x-segment-fault-during-service-start.patch | 74 ------------------
 ...-wrong-ownership-during-installation.patch | 30 ++++++++
 ...onfigure.ac-add-libnet-enable-option.patch | 77 +++++++++++++++++++
 ...5-.py-s-python-python3-exclude-tests.patch | 53 +++++++++++++
 ...-option-enable-thread-tls-to-manage-.patch | 52 ++++++++-----
 .../syslog-ng/files/fix-config-libnet.patch   | 65 ----------------
 .../files/fix-invalid-ownership.patch         | 25 ------
 .../syslog-ng/files/shebang.patch             | 18 -----
 .../syslog-ng/files/syslog-ng.conf.systemd    |  2 +-
 .../syslog-ng/files/syslog-ng.conf.sysvinit   |  2 +-
 .../recipes-support/syslog-ng/syslog-ng.inc   |  2 +-
 .../syslog-ng/syslog-ng_3.24.1.bb             | 15 ----
 .../syslog-ng/syslog-ng_3.31.2.bb             | 17 ++++
 13 files changed, 214 insertions(+), 218 deletions(-)
 delete mode 100644 meta-oe/recipes-support/syslog-ng/files/0001-syslog-ng-=
fix-segment-fault-during-service-start.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/0002-scl-fix-wr=
ong-ownership-during-installation.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/0004-configure.=
ac-add-libnet-enable-option.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/0005-.py-s-pyth=
on-python3-exclude-tests.patch
 delete mode 100644 meta-oe/recipes-support/syslog-ng/files/fix-config-libn=
et.patch
 delete mode 100644 meta-oe/recipes-support/syslog-ng/files/fix-invalid-own=
ership.patch
 delete mode 100644 meta-oe/recipes-support/syslog-ng/files/shebang.patch
 delete mode 100644 meta-oe/recipes-support/syslog-ng/syslog-ng_3.24.1.bb
 create mode 100644 meta-oe/recipes-support/syslog-ng/syslog-ng_3.31.2.bb

diff --git a/meta-oe/recipes-support/syslog-ng/files/0001-syslog-ng-fix-seg=
ment-fault-during-service-start.patch b/meta-oe/recipes-support/syslog-ng/f=
iles/0001-syslog-ng-fix-segment-fault-during-service-start.patch
deleted file mode 100644
index b5bfcd025..000000000
--- a/meta-oe/recipes-support/syslog-ng/files/0001-syslog-ng-fix-segment-fa=
ult-during-service-start.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-Subject: [PATCH] syslog-ng: fix segment fault during service start on arm6=
4
-
-service start failed since segment fault on arch arm64,
-syslog-ng have a submodule ivykis, from ivykis V0.42,
-it use pthread_atfork, but for arm64, this symbol is
-not included by libpthread, so cause segment fault.
-
-refer systemd, replace pthread_atfork with __register_atfork
-to fix this problem.
-
-I have create an issue, and this proposal to upstream.
-https://github.com/buytenh/ivykis/issues/15
-
-Upstream-Status: Pending
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
-Update for 3.24.1.
-Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
----
- lib/ivykis/src/pthr.h | 23 ++++++++++++-----------
- 1 file changed, 12 insertions(+), 11 deletions(-)
-
-diff --git a/lib/ivykis/src/pthr.h b/lib/ivykis/src/pthr.h
-index 29e4be7..5d29096 100644
---- a/lib/ivykis/src/pthr.h
-+++ b/lib/ivykis/src/pthr.h
-@@ -24,6 +24,16 @@
- #include <pthread.h>
- #include <signal.h>
-=20
-+#ifdef __GLIBC__
-+/* We use glibc __register_atfork() + __dso_handle directly here, as they=
 are not included in the glibc
-+ * headers. __register_atfork() is mostly equivalent to pthread_atfork(),=
 but doesn't require us to link against
-+ * libpthread, as it is part of glibc anyway. */
-+extern int __register_atfork(void (*prepare) (void), void (*parent) (void=
), void (*child) (void), void * __dso_handle);
-+extern void* __dso_handle __attribute__ ((__weak__));
-+#else
-+#define __register_atfork(prepare,parent,child,dso) pthread_atfork(prepar=
e,parent,child)
-+#endif
-+
- #ifdef HAVE_PRAGMA_WEAK
- #pragma weak pthread_create
- #endif
-@@ -36,16 +46,7 @@ static inline int pthreads_available(void)
-=20
- #ifdef HAVE_PRAGMA_WEAK
-=20
--/*
-- * On Linux, pthread_atfork() is defined in libc_nonshared.a (for
-- * glibc >=3D 2.28) or libpthread_nonshared.a (for glibc <=3D 2.27), and
-- * we want to avoid "#pragma weak" for that symbol because that causes
-- * it to be undefined even if you link lib*_nonshared.a in explicitly.
-- */
--#if !defined(HAVE_LIBC_NONSHARED) && !defined(HAVE_LIBPTHREAD_NONSHARED)
--#pragma weak pthread_atfork
--#endif
--
-+#pragma weak __register_atfork
- #pragma weak pthread_create
- #pragma weak pthread_detach
- #pragma weak pthread_getspecific
-@@ -73,7 +74,7 @@ static inline int
- pthr_atfork(void (*prepare)(void), void (*parent)(void), void (*child)(vo=
id))
- {
- 	if (pthreads_available())
--		return pthread_atfork(prepare, parent, child);
-+		return __register_atfork(prepare, parent, child, __dso_handle);
-=20
- 	return ENOSYS;
- }
---=20
-2.7.4
-
diff --git a/meta-oe/recipes-support/syslog-ng/files/0002-scl-fix-wrong-own=
ership-during-installation.patch b/meta-oe/recipes-support/syslog-ng/files/=
0002-scl-fix-wrong-ownership-during-installation.patch
new file mode 100644
index 000000000..b2683350b
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/0002-scl-fix-wrong-ownership-=
during-installation.patch
@@ -0,0 +1,30 @@
+From 7a8c458b7acf4732af74317f8a535077eb451b1e Mon Sep 17 00:00:00 2001
+From: Ming Liu <ming.liu@windriver.com>
+Date: Thu, 17 Jul 2014 05:37:08 -0400
+Subject: [PATCH] scl: fix wrong ownership during installation
+
+The ownership of build user is preserved for some target files, fixed it b=
y
+adding --no-same-owner option to tar when extracting files.
+
+Signed-off-by: Ming Liu <ming.liu@windriver.com>
+
+Upstream-Status: Backport [9045908]
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+---
+ scl/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scl/Makefile.am b/scl/Makefile.am
+index 940a467..3c19e50 100644
+--- a/scl/Makefile.am
++++ b/scl/Makefile.am
+@@ -51,7 +51,7 @@ scl-install-data-local:
+ 		fi; \
+ 	done
+ 	$(mkinstalldirs) $(DESTDIR)/$(scldir)
+-	(cd $(srcdir)/scl; tar cf - $(SCL_SUBDIRS)) | (cd $(DESTDIR)/$(scldir) &=
& tar xf -)
++	(cd $(srcdir)/scl; tar cf - $(SCL_SUBDIRS)) | (cd $(DESTDIR)/$(scldir) &=
& tar xf - --no-same-owner)
+ 	chmod -R u+rwX $(DESTDIR)/$(scldir)
+=20
+ scl-uninstall-local:
diff --git a/meta-oe/recipes-support/syslog-ng/files/0004-configure.ac-add-=
libnet-enable-option.patch b/meta-oe/recipes-support/syslog-ng/files/0004-c=
onfigure.ac-add-libnet-enable-option.patch
new file mode 100644
index 000000000..c9eec65e8
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/0004-configure.ac-add-libnet-=
enable-option.patch
@@ -0,0 +1,77 @@
+From 57b509adfb7c62bbf55ea1709aac3383cab660fa Mon Sep 17 00:00:00 2001
+From: Ming Liu <ming.liu@windriver.com>
+Date: Thu, 17 Jul 2014 05:37:08 -0400
+Subject: [PATCH] configure.ac: add libnet enable option
+
+This would avoid a implicit auto-detecting result
+
+Signed-off-by: Ming Liu <ming.liu@windriver.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
+Update for 3.24.1.
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+
+Set it to default yes
+
+Upstream-Status: Submitted [https://github.com/syslog-ng/syslog-ng/pull/36=
50]
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+---
+ configure.ac | 35 ++++++++++++++++++++---------------
+ 1 file changed, 20 insertions(+), 15 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7aad75f..d575cba 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -144,6 +144,9 @@ AC_CONFIG_HEADERS(config.h)
+ dnl *********************************************************************=
******
+ dnl Arguments
+=20
++AC_ARG_ENABLE(libnet,
++              [  --enable-libnet      Enable libnet support (default: yes=
)],, enable_libnet=3D"yes")
++
+ AC_ARG_WITH(libnet,
+    [  --with-libnet=3Dpath      use path to libnet-config script],
+    ,
+@@ -1073,23 +1076,25 @@ dnl **********************************************=
*****************************
+ dnl libnet headers/libraries
+ dnl *********************************************************************=
******
+ AC_MSG_CHECKING(for LIBNET)
+-if test "x$with_libnet" =3D "x"; then
+-        LIBNET_CONFIG=3D"`which libnet-config`"
+-else
+-        LIBNET_CONFIG=3D"$with_libnet/libnet-config"
+-fi
++if test "x$enable_libnet" =3D xyes; then
++    if test "x$with_libnet" =3D "x"; then
++            LIBNET_CONFIG=3D"`which libnet-config`"
++    else
++            LIBNET_CONFIG=3D"$with_libnet/libnet-config"
++    fi
+=20
+-if test -n "$LIBNET_CONFIG" -a -x "$LIBNET_CONFIG"; then
+-        LIBNET_CFLAGS=3D"`$LIBNET_CONFIG --defines`"
+-        LIBNET_LIBS=3D"`$LIBNET_CONFIG --libs`"
+-        AC_MSG_RESULT(yes)
+-dnl libnet-config does not provide the _DEFAULT_SOURCE define, that can c=
ause warning during build
+-dnl as upstream libnet-config does uses _DEFAULT_SOURCE this is just a fi=
x till
+-        LIBNET_CFLAGS=3D"$LIBNET_CFLAGS -D_DEFAULT_SOURCE"
++    if test -n "$LIBNET_CONFIG" -a -x "$LIBNET_CONFIG"; then
++            LIBNET_CFLAGS=3D"`$LIBNET_CONFIG --defines`"
++            LIBNET_LIBS=3D"`$LIBNET_CONFIG --libs`"
++            AC_MSG_RESULT(yes)
++    dnl libnet-config does not provide the _DEFAULT_SOURCE define, that c=
an cause warning during build
++    dnl as upstream libnet-config does uses _DEFAULT_SOURCE this is just =
a fix till
++            LIBNET_CFLAGS=3D"$LIBNET_CFLAGS -D_DEFAULT_SOURCE"
+=20
+-else
+-        LIBNET_LIBS=3D
+-        AC_MSG_RESULT(no)
++    else
++            LIBNET_LIBS=3D
++            AC_MSG_RESULT(no)
++    fi
+ fi
+=20
+=20
diff --git a/meta-oe/recipes-support/syslog-ng/files/0005-.py-s-python-pyth=
on3-exclude-tests.patch b/meta-oe/recipes-support/syslog-ng/files/0005-.py-=
s-python-python3-exclude-tests.patch
new file mode 100644
index 000000000..a8be7d81d
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/0005-.py-s-python-python3-exc=
lude-tests.patch
@@ -0,0 +1,53 @@
+From b64fcc414316592968f181c85447cfd01d1e461e Mon Sep 17 00:00:00 2001
+From: Yi Fan Yu <yifan.yu@windriver.com>
+Date: Thu, 15 Apr 2021 13:48:19 -0400
+Subject: [PATCH] *.py: s/python/python3/ (exclude tests)
+
+As stated by https://github.com/syslog-ng/syslog-ng/pull/3603
+python2 is EOL.
+
+Fix all shebangs calling python instead of python3
+except the tests.
+
+(correcting lib/merge-grammar.py)
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+(adding the rest)
+Upstream-Status: Submitted [https://github.com/syslog-ng/syslog-ng/pull/36=
47]
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+---
+ contrib/scripts/config-graph-json-to-dot.py | 2 +-
+ lib/merge-grammar.py                        | 2 +-
+ modules/python/pylib/setup.py               | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/contrib/scripts/config-graph-json-to-dot.py b/contrib/scripts=
/config-graph-json-to-dot.py
+index 4955c81..0351a9a 100755
+--- a/contrib/scripts/config-graph-json-to-dot.py
++++ b/contrib/scripts/config-graph-json-to-dot.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ import json, sys
+=20
+ j =3D None
+diff --git a/lib/merge-grammar.py b/lib/merge-grammar.py
+index 7313ff5..459712d 100755
+--- a/lib/merge-grammar.py
++++ b/lib/merge-grammar.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ #########################################################################=
####
+ # Copyright (c) 2010-2017 Balabit
+ #
+diff --git a/modules/python/pylib/setup.py b/modules/python/pylib/setup.py
+index 23bb5cc..a2fa05e 100755
+--- a/modules/python/pylib/setup.py
++++ b/modules/python/pylib/setup.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ #########################################################################=
####
+ # Copyright (c) 2015-2016 Balabit
+ #
diff --git a/meta-oe/recipes-support/syslog-ng/files/configure.ac-add-optio=
n-enable-thread-tls-to-manage-.patch b/meta-oe/recipes-support/syslog-ng/fi=
les/configure.ac-add-option-enable-thread-tls-to-manage-.patch
index 4f8a3d077..ff35fb157 100644
--- a/meta-oe/recipes-support/syslog-ng/files/configure.ac-add-option-enabl=
e-thread-tls-to-manage-.patch
+++ b/meta-oe/recipes-support/syslog-ng/files/configure.ac-add-option-enabl=
e-thread-tls-to-manage-.patch
@@ -1,30 +1,46 @@
-configure.ac: add option --enable-thread-tls to manage thread ssl support
+From 15a90fd9ac1396015340e599e26d7cd193898fb8 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 12 Aug 2014 14:26:13 +0800
+Subject: [PATCH] configure.ac: add option --enable-thread-tls to manage th=
read
+ ssl support
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
=20
+The thread local storage caused arm-gcc broken while compiling            =
              =E2=94=82
+syslog-ng with option '-g -O'.                                            =
              =E2=94=82
+...                                                                       =
              =E2=94=82
+dnscache.s: Assembler messages:                                           =
              =E2=94=82
+dnscache.s:100: Error: invalid operands (.text and *UND* sections) for `-'=
              =E2=94=82
+...                                                                       =
              =E2=94=82
+                                                                          =
              =E2=94=82
 Add option --enable-thread-tls to manage the including of thread
 local storage, so we could explicitly disable it.
=20
-Upstream-Status: Pending
-
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+change default to 'yes'
+Upstream-Status: Submitted [https://github.com/syslog-ng/syslog-ng/pull/36=
49]
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
 ---
- configure.ac | 17 +++++++++++------
- 1 file changed, 11 insertions(+), 6 deletions(-)
+ configure.ac | 16 ++++++++++------
+ 1 file changed, 10 insertions(+), 6 deletions(-)
=20
-Index: syslog-ng-3.15.1/configure.ac
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- syslog-ng-3.15.1.orig/configure.ac
-+++ syslog-ng-3.15.1/configure.ac
-@@ -190,6 +190,9 @@ AC_ARG_ENABLE(gprof,
- AC_ARG_ENABLE(memtrace,
-               [  --enable-memtrace   Enable alternative leak debugging co=
de.])
-=20
+diff --git a/configure.ac b/configure.ac
+index 1d67e81..7aad75f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -210,6 +210,8 @@ AC_ARG_WITH(sanitizer,
+               [  --with-sanitizer=3D[address/undefined/etc...]
+                                          Enables compiler sanitizer suppo=
rts (default: no)]
+               ,,with_sanitizer=3D"no")
 +AC_ARG_ENABLE(thread-tls,
-+              [  --enable-thread-tls        Enable Thread Local Storage s=
upport.],,enable_thread_tls=3D"no")
-+
++              [  --enable-thread-tls        Enable Thread Local Storage s=
upport (default: yes)],,enable_thread_tls=3D"yes")
+=20
  AC_ARG_ENABLE(dynamic-linking,
                [  --enable-dynamic-linking        Link everything dynamica=
lly.],,enable_dynamic_linking=3D"auto")
-=20
-@@ -591,12 +594,14 @@ dnl ************************************************=
***************************
+@@ -628,12 +630,14 @@ dnl ************************************************=
***************************
  dnl Is the __thread keyword available?
  dnl *********************************************************************=
******
 =20
@@ -34,7 +50,7 @@ Index: syslog-ng-3.15.1/configure.ac
 -]],
 -[a=3D0;])],
 -[ac_cv_have_tls=3Dyes; AC_DEFINE_UNQUOTED(HAVE_THREAD_KEYWORD, 1, "Whethe=
r Thread Local Storage is supported by the system")])
-+if test "x$enable_thread_tls" !=3D "xno"; then
++if test "x$enable_thread_tls" =3D "xyes"; then
 +    AC_LINK_IFELSE([AC_LANG_PROGRAM(
 +    [[#include <pthread.h>
 +    __thread int a;
diff --git a/meta-oe/recipes-support/syslog-ng/files/fix-config-libnet.patc=
h b/meta-oe/recipes-support/syslog-ng/files/fix-config-libnet.patch
deleted file mode 100644
index 4ad0afa95..000000000
--- a/meta-oe/recipes-support/syslog-ng/files/fix-config-libnet.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-Subject: [PATCH] add libnet enable option
-
-Upstream-Status: Pending
-
-This would avoid a implicit auto-detecting result.
-
-Signed-off-by: Ming Liu <ming.liu@windriver.com>
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
-
-Update for 3.24.1.
-Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
----
- configure.ac | 28 ++++++++++++++++------------
- 1 file changed, 16 insertions(+), 12 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 00eb566..e7d5ac1 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -143,6 +143,9 @@ AC_CONFIG_HEADERS(config.h)
- dnl *********************************************************************=
******
- dnl Arguments
-=20
-+AC_ARG_ENABLE(libnet,
-+              [  --enable-libnet      Enable libnet support.],, enable_li=
bnet=3D"no")
-+
- AC_ARG_WITH(libnet,
-    [  --with-libnet=3Dpath      use path to libnet-config script],
-    ,
-@@ -1047,19 +1050,20 @@ dnl **********************************************=
*****************************
- dnl libnet headers/libraries
- dnl *********************************************************************=
******
- AC_MSG_CHECKING(for LIBNET)
--if test "x$with_libnet" =3D "x"; then
--        LIBNET_CONFIG=3D"`which libnet-config`"
--else
--        LIBNET_CONFIG=3D"$with_libnet/libnet-config"
--fi
-+if test "x$enable_libnet" =3D xyes; then
-+        if test "x$with_libnet" =3D "x"; then
-+                LIBNET_CONFIG=3D"`which libnet-config`"
-+        else
-+                LIBNET_CONFIG=3D"$with_libnet/libnet-config"
-+        fi
-=20
--if test -n "$LIBNET_CONFIG" -a -x "$LIBNET_CONFIG"; then
--        LIBNET_CFLAGS=3D"`$LIBNET_CONFIG --defines`"
--        LIBNET_LIBS=3D"`$LIBNET_CONFIG --libs`"
--        AC_MSG_RESULT(yes)
--dnl libnet-config does not provide the _DEFAULT_SOURCE define, that can c=
ause warning during build
--dnl as upstream libnet-config does uses _DEFAULT_SOURCE this is just a fi=
x till=20
--        LIBNET_CFLAGS=3D"$LIBNET_CFLAGS -D_DEFAULT_SOURCE"
-+        if test -n "$LIBNET_CONFIG" -a -x "$LIBNET_CONFIG"; then
-+                LIBNET_CFLAGS=3D"`$LIBNET_CONFIG --defines`"
-+                LIBNET_LIBS=3D"`$LIBNET_CONFIG --libs`"
-+                AC_MSG_RESULT(yes)
-+        else
-+                AC_MSG_ERROR([Could not find libnet, and libnet support w=
as explicitly enabled.])
-+        fi
-=20
- else
-         LIBNET_LIBS=3D
---=20
-2.7.4
-
diff --git a/meta-oe/recipes-support/syslog-ng/files/fix-invalid-ownership.=
patch b/meta-oe/recipes-support/syslog-ng/files/fix-invalid-ownership.patch
deleted file mode 100644
index 54ecce57e..000000000
--- a/meta-oe/recipes-support/syslog-ng/files/fix-invalid-ownership.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-syslog-ng: fix wrong ownership issue
-
-Upstream-Status: Pending
-
-The ownership of build user is preserved for some target files, fixed it b=
y
-adding --no-same-owner option to tar when extracting files.=20
-
-Signed-off-by: Ming Liu <ming.liu@windriver.com>
----
- scl/Makefile.am |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-Index: syslog-ng-3.8.1/scl/Makefile.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- syslog-ng-3.8.1.orig/scl/Makefile.am
-+++ syslog-ng-3.8.1/scl/Makefile.am
-@@ -27,7 +27,7 @@ scl-install-data-local:
- 		fi; \
- 	done
- 	$(mkinstalldirs) $(DESTDIR)/$(scldir)
--	(cd $(srcdir)/scl; tar cf - $(SCL_SUBDIRS)) | (cd $(DESTDIR)/$(scldir) &=
& tar xf -)
-+	(cd $(srcdir)/scl; tar cf - $(SCL_SUBDIRS)) | (cd $(DESTDIR)/$(scldir) &=
& tar xf - --no-same-owner)
- 	chmod -R u+rwX $(DESTDIR)/$(scldir)
-=20
- scl-uninstall-local:
diff --git a/meta-oe/recipes-support/syslog-ng/files/shebang.patch b/meta-o=
e/recipes-support/syslog-ng/files/shebang.patch
deleted file mode 100644
index 35d967753..000000000
--- a/meta-oe/recipes-support/syslog-ng/files/shebang.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-syslog-ng: change shebang to use python3
-
-Correct shebang for python3.  This is far from the only python file with a=
n out of date shebang,
-but it is the only one that winds up on a target.
-
-Upstream-Status: Pending
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-
---- a/lib/merge-grammar.py
-+++ b/lib/merge-grammar.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- #########################################################################=
####
- # Copyright (c) 2010-2017 Balabit
- #
diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.systemd=
 b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.systemd
index 6a8627672..b63f46ddc 100644
--- a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.systemd
+++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.systemd
@@ -1,4 +1,4 @@
-@version: 3.24
+@version: 3.31
 #
 # Syslog-ng configuration file, compatible with default Debian syslogd
 # installation. Originally written by anonymous (I can't find his name)
diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.sysvini=
t b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.sysvinit
index 32b98610d..07cd3b086 100644
--- a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.sysvinit
+++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.sysvinit
@@ -1,4 +1,4 @@
-@version: 3.24
+@version: 3.31
 #
 # Syslog-ng configuration file, compatible with default Debian syslogd
 # installation. Originally written by anonymous (I can't find his name)
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/reci=
pes-support/syslog-ng/syslog-ng.inc
index 818cad5bc..ebb3eaf0f 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -10,7 +10,7 @@ ideal for firewalled environments. \
 HOMEPAGE =3D "http://www.balabit.com/network-security/syslog-ng/opensource=
-logging-system"
=20
 LICENSE =3D "GPLv2 & LGPLv2.1"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D24c0c5cb2c83d9f2ab725481e4df524=
0"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D189c3826d32deaf83ad8d0d538a1002=
3"
=20
 # util-linux added to get libuuid
 DEPENDS =3D "libpcre flex glib-2.0 openssl util-linux bison-native"
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.24.1.bb b/meta-o=
e/recipes-support/syslog-ng/syslog-ng_3.24.1.bb
deleted file mode 100644
index 10bf00fdc..000000000
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.24.1.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require syslog-ng.inc
-
-# We only want to add stuff we need to the defaults provided in syslog-ng.=
inc.
-#
-SRC_URI +=3D " \
-           file://fix-config-libnet.patch \
-           file://fix-invalid-ownership.patch \
-           file://syslog-ng.service-the-syslog-ng-service.patch \
-           file://0001-syslog-ng-fix-segment-fault-during-service-start.pa=
tch \
-           file://shebang.patch \
-           file://syslog-ng-tmp.conf \
-           "
-
-SRC_URI[md5sum] =3D "ef9de066793f7358af7312b964ac0450"
-SRC_URI[sha256sum] =3D "d4d0a0357b452be96b69d6f741129275530d8f0451e35adc40=
8ad5635059fa3d"
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.31.2.bb b/meta-o=
e/recipes-support/syslog-ng/syslog-ng_3.31.2.bb
new file mode 100644
index 000000000..cbd218c95
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.31.2.bb
@@ -0,0 +1,17 @@
+require syslog-ng.inc
+
+# We only want to add stuff we need to the defaults provided in syslog-ng.=
inc.
+#
+SRC_URI +=3D "https://github.com/balabit/syslog-ng/releases/download/${BP}=
/${BP}.tar.gz \
+           file://syslog-ng.conf.systemd \
+           file://syslog-ng.conf.sysvinit \
+           file://initscript \
+           file://volatiles.03_syslog-ng \
+           file://syslog-ng-tmp.conf \
+           file://syslog-ng.service-the-syslog-ng-service.patch \
+           file://0002-scl-fix-wrong-ownership-during-installation.patch \
+           file://0004-configure.ac-add-libnet-enable-option.patch \
+           file://0005-.py-s-python-python3-exclude-tests.patch \
+           "
+SRC_URI[md5sum] =3D "69ef4dc5628d5e603e9e4a1b937592f8"
+SRC_URI[sha256sum] =3D "2eeb8e0dbbcb556fdd4e50bc9f29bc8c66c9b153026f87caa7=
567bd3139c186a"
--=20
2.29.2

