Return-Path: <Rasmus.Villemoes@prevas.se>
X-Greylist: delayed 11794 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 17 Jul 2018 07:12:30 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0106.outbound.protection.outlook.com [104.47.2.106])
	by mail.openembedded.org (Postfix) with ESMTP id 754E271C42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2018 07:12:30 +0000 (UTC)
Received: from VI1PR1001MB1343.EURPRD10.PROD.OUTLOOK.COM (10.171.107.12) by
	VI1PR1001MB1344.EURPRD10.PROD.OUTLOOK.COM (10.171.107.13) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.952.18; Tue, 17 Jul 2018 03:41:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=egaC2jCX6taPF/8+QMpGkfWVdz31mO2OwYRw95QeVqA=;
	b=KmTJyBHK+aVBWL/Nk45Brz8708RC0IWmx1qOfLoi5MOxNjDQ9630NP2Js9F3pzxb3MKazsPVmqgb9CKqkGq5oPT5BnUYoZLMjQas6kMXFZ6/C+8Pm0ax5/w/Mcj5jb35uSJu8z+HF5mqse/xef9RLyXZZ+bf2YUJZgh6/Xv+yXM=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
Received: from prevas-ravi.prevas.se (81.216.59.226) by
	VI1PR1001MB1343.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:e5::12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.952.17;
	Mon, 16 Jul 2018 09:22:33 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Jul 2018 11:22:21 +0200
Message-Id: <20180716092221.32243-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
X-Originating-IP: [81.216.59.226]
X-ClientProxiedBy: MRXP264CA0017.FRAP264.PROD.OUTLOOK.COM
	(2603:10a6:500:15::29) To VI1PR1001MB1343.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:800:e5::12)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3db8ea74-aca5-4744-198d-08d5eafda9d8
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600053)(711020)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR1001MB1343; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR1001MB1343;
	3:5ijxT5FUxEmg+FnqMzmjZy5uGpYw+zmR31U4RYT5EN5S5eTv67N9n5BCxwr7mNLrhQO4ul7//CQpQDln9zl5UmazDAvkV23nojvvJUDl5GyyIx58tpECUd9pZ962LAOi9pQ0pxnu3gxE98d1RGD4zUHvIwsj33ahUzK5YMF+jggFVKwsYTmEzCq4h3KJKGFsV6EUl798Gv3smwncAw76GYZ0v0PW2ymmVlCodkkieXm9g708kwTPf1KoX+dQyADU;
	25:Emkyp/qLXdyJFGEnm94Ie+RrhrslftP1G05ym6tw9SvEtzBxD0yc5R09jhIRq15a7+MAepqDnf3P/DJ52UC1JGTxMvl31RMV8Nhvcz5LNu2dHsl0rOHrY7GfAcFNL8KJBisrUVumDSG07jsQ8Ziinayjfx+OfMG/08uMmeJgGZy8YXCwOgS6XaZE7kutVewKTeara2V30OlrWDfBfsqR7Q4IddiPdCKhOnZ7iIc157YCJXyFQXDZwRBmhepTI5tbXV3o/DJWpQZuzYW6PaN80PqVHaqjt+swv7xQymwgkbR4mvEGrfEMaDptUDar7uVe3z82MUIcY9op6UBKWZGtLg==;
	31:PAlmjbL59tyj0Q7znYFTtm2Q0vDwRyNrLEkKIsmtvgHDdqVb1e2LnFb/oF40PBQuTJltvNmHIigyuFO4zVya5dbAPt/N0vOUd/pTeiH6XiXvINII5w6GyqFQD27rDmlJDKha2hEE0Un1iiYIYpORfhEL+9fqVKcB1YQTaR0L8CHz+1gTz7NKB751YCQTSxTvPU26CKHxcAlZLbSkV2wGixCQXh3WaOeFsD3TDDvuYy8=
X-MS-TrafficTypeDiagnostic: VI1PR1001MB1343:|VI1PR1001MB1343:|VI1PR1001MB1344:
X-Microsoft-Antispam-PRVS: <VI1PR1001MB1343798B51536A7A456B944B8A5D0@VI1PR1001MB1343.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:(278428928389397)(166708455590820)(17755550239193); 
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(93006095)(3002001)(10201501046)(3231311)(944501410)(52105095)(149027)(150027)(6041310)(20161123560045)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(6072148)(201708071742011)(7699016);
	SRVR:VI1PR1001MB1343; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR1001MB1343; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR1001MB1343;
	4:9WtXlyS+USVQZaKBORExg6AlaN7Y/iZSd2fzAKo/rSizbHCUkKznxj/6DevJlLb/uXxIS429Qwr3YyOkRSFQ2zyN4BEjTInRLXsEAyBETAr2SmvHH0MjGU5JEi4tpYpvKH5JA4vr5zZdxQqw9LI8ad9a1WUQY4CYA/1udBGKiOUoGJpKkIp+IJ5vt4VEZMj46Qx5/Nw/HmxSp0KCR2Uli79UyIVhLChYshRo/pPObh4zeUoqAouf/yQwcSHWXuCwmbCpqWEp1OPIuSjTBHQFeINQL2NgAUS5X7zlCNuD66nZSZmegj5AEN+LzXAxcZWdFrAYv/l9wXnjN8scwYfPfsUZnKslAMfqniVlgHl8tA+eooSwJ4eTg/lf4Opf5+X8
X-Forefront-PRVS: 073515755F
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(136003)(396003)(346002)(39850400004)(376002)(366004)(189003)(199004)(68736007)(74482002)(51416003)(52116002)(42882007)(53936002)(6506007)(50226002)(2361001)(2616005)(2906002)(956004)(14444005)(305945005)(26005)(69596002)(7736002)(476003)(486006)(386003)(16526019)(186003)(50466002)(1857600001)(48376002)(44832011)(107886003)(36756003)(16586007)(25786009)(6916009)(6306002)(316002)(6512007)(2351001)(97736004)(1076002)(6666003)(478600001)(53416004)(47776003)(4326008)(5660300001)(6486002)(72206003)(8676002)(81156014)(81166006)(106356001)(66066001)(8936002)(105586002)(8976002)(6116002)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR1001MB1343;
	H:prevas-ravi.prevas.se; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR1001MB1343;
	23:yriRBW6JsEqZxTWIw+rfLU+HXJtoO77j0GdkGdy?=
	=?us-ascii?Q?PQq+ngPQaKQ4acOUYTiYtcufpqJsCYM6oBeg+VrGd0pMLZIE3fimwZe/eBQn?=
	=?us-ascii?Q?CyN+cJ6Z6rLvXkvHhh8Vb6K+OAOHbxz6NujWtv2Uq91j09kDe262ZVOeMWIW?=
	=?us-ascii?Q?ZzbbGn1iUDs6fwAnoYTvfkaaLFPD39e87spv88fqp8Evi0/7kBx2msu+zu3/?=
	=?us-ascii?Q?FNWYFKolcYl1iSXSQnn1gptEirdoyLVDptIeji3OZa4iyWaq1NbeH9oclC6p?=
	=?us-ascii?Q?Qy+EGce4PYsAD4eeMjf8rmj/wyVSoMeZXKBGMwpYrtTWN//cxweOlFJpgQZA?=
	=?us-ascii?Q?K2qN2vwLN7H2JfZ6MOB2W0RUKbe982DHl7ABPeHEFzx70d476Cqx0BFEPDEf?=
	=?us-ascii?Q?BBwxaumnxXtJwWk5J2ewhW0jPjcGolMyzGGGBKQOwEo5G9pkP7TTn+/GrEB8?=
	=?us-ascii?Q?DDasr7IwmOzKsgW01KrKWzSZ0LciLs0i3ionTzWPlgRn29VHPBgaCnZjaGks?=
	=?us-ascii?Q?gc/AtyEq6Jyl45MT6kb+k7q5A/vFYxSWvECX4//9gvez5YRkNRUhrqmeaf/b?=
	=?us-ascii?Q?pDnAuEkNixp/te+IK8mRwxe6z3zRK7XpqCnKKa1KBbaYDCJ8Q3RXu2uc9fSz?=
	=?us-ascii?Q?3uuqQy2/KCiYb9k+V2wMdSoDul37LT10OlOxfUMrT43ach4a+Gpvz3QpZN50?=
	=?us-ascii?Q?PVUBLyPHZfEcmNI8EnhSG3qsqWxD7npA1uCScaJhiiXBz4Y/S65vQU4TxLpU?=
	=?us-ascii?Q?0KQqzIiDEvY8zGeYYRaO9KPw4UMhD5X3F3tydNBHC+76Il/bgSZjKBsu8bcX?=
	=?us-ascii?Q?T5O2e3zqZddf8hOSFyCbm2hc9KAk4TTVi4dBHXrRahu1gnhegzC3040se1pb?=
	=?us-ascii?Q?vLU7up9zQGo0JnUNYJTpiWFTmMOgPAhZOWvQjIOlAKtvzn1P+hwfWAgh72TQ?=
	=?us-ascii?Q?sd1GQ9u2kWWZHSgrf2EL/iq7rCK0NyAJPr30CJKgXlAi9aLYoO3mfkAyZ8yr?=
	=?us-ascii?Q?nfjIc1SnWfKhoVLHvobL95O/kgJs2GLWj0MhIP0HO69SOghDFJqdCXJrhgPN?=
	=?us-ascii?Q?uMtwylvVUy3avUW6Z9rzj60OXxXOukrJcjNal7fA+VDBsEPfq/7R5GSQpssC?=
	=?us-ascii?Q?dGpcswLNBHYcGKj62ErUfYLUwRJnFS7GCjIYuu8feSlW00hw6F0n1xaQZxzh?=
	=?us-ascii?Q?ehD3qLGzraCkaPpC1OEP+v1o2LgdKW+EqBM/G532YtTP22KgG3UzMNyvHNfc?=
	=?us-ascii?Q?/NyWW7bX4V3vsJA0cGGRvW/bB7WyR45PwjFC88Cbr16U7Rx/Zt40qqTEuYQO?=
	=?us-ascii?Q?njLX1tX+KV2s91Xrpjrg5z94hgpM7oFkYaVkeiDcJKjLOfI/Op9iEUdVnmFK?=
	=?us-ascii?Q?G8pw/03/PVBENqLMiFHkjSNlb5Cw=3D?=
X-Microsoft-Antispam-Message-Info: Lz6/3vT89y4a84I11HWsK6T8JhC2x/+xMFSIwJFvhUNCWn/OsQgR6bMR8UsRQSwmvcsxLE1MeQteXkLRtQCur1Zqu/OvrW0VZ6csWwAKlXeI4m+RSNBQUmQTfn5uKEqVslAKSNNk85P6xtItHyTJXV5nVdf1u90N+pPoNDnd7eZw2nfB2TmSSaxRNcD0JENRAB7bAUCSD/YmFCl8P6bWKiRqz5co9mWLA/t3LPldRuQEpINtMSYuuCtzkNVhZrbJycqPvLHbgTrnQPapm3dwOteYDMCDCELaqXrrG+zia2LBgsOGI40URqAdy8+bBfgFZRGXkMpaXf4r8k4HTw4Wf1806O3j8h/QlZLm3KXyLOU=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR1001MB1343;
	6:EGL1N125sv3ZL/MP51Qi6wIhqHntUAhfg8B/s0+T6ZwD7Ae/E+Apn6Kn1mYJcaz/y8CUBq7aVjuh7+rvmX9MAJxGlNTcsODNDVcWsw5PIDoIVenLatbtXPlvtwuexCJIfyPjGS8c6mz56/orN9/uRNIEPNccAZ/eB1PBaUeZ2WL72ADq9Lh3ADg3EvibCpDgBsxcVAx7La91MiWowdcNdPwjIzW5RRToOfJCjF9bJ7zVN0rZEZeYAFzY23b3oyvooZVXmiqLH/Re/xWARNbzpEHbWQ+iHKrlIM9uJOoDQUsMK+NsQr84yBhBZOls0KlCbOUABmkko6ZDmosHIJOieD282tf0RcYCz1xjG0bgE5FQxdao4KRwwWLSiBhX0Gi47l4aD97L9J30pPpvs5v8kYl7WqRE8HGw/3d7QXjYRhc0iHMtQVT25PlL3xaGQBf41UKrL/TE/HuQPQJLMgY9PA==;
	5:aCepLhfkRe5P/A/Ed+XWMvAxaRqSk4TbNeSg3tzgUXaQLAJ7sK9tnXN84jncOL5qJVpszQ7LA0jAdpb5gEoXeKzGU8LzqwKLAjrXSqy5m7MNupl3BijztcktrNYD/UOfQHeYIvsboap2Nij+VKgT4pBANecIH89KS5QbSQsecX0=;
	24:LKWm8FU2Nr71QtlCTMknmronUPB8N/NVVtPksp9lu3SfZDtuBlz8gfsZhfz49g3uS4unBM8WOnHrcZRZnzFjCtW0EFiCtdaDTylJ4IqhnI4=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR1001MB1343;
	7:twdaRmk1BDuwlEs6R9o+PRGZkL802Epxl+r6xJq7B+0yEgzJVkT7bI8oWkQNMjpzw4l+F26uTKPFJqMFVmE54DN9/4a18WG46do43Xs8HyFFb3AwNc0y1GF6uq1TVKlgqXkqY/l3rqhbrsHwD9eA4d44AdUI7C39IC9VRu+cGHKxIgafKr8X4mPcj1/M/JT9+9QcWhu1+xwkkZcRxErSbV4nAY2tA8yyNzsU/8r5yfNIONqBDISuCuxku1Amj69M
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2018 09:22:33.6467 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db8ea74-aca5-4744-198d-08d5eafda9d8
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR1001MB1343
X-Microsoft-Exchange-Diagnostics: 1; VI1PR1001MB1344;
	23:GK9PNtpK6LXdGXtlClG8UJ6O+cFQg9K6qrdnClYdBB5RYhVP5jjd0KpU9DEicObCpSbhzmzQhnKrr6lwV/mJy4RlFm5vUKhtB3qM0fTmVzxl2/ZaBD9YzYm6yE3Y6d/bLnm8Ulm5CWNVMPEFzyGdrg==
X-OriginatorOrg: prevas.dk
Subject: [meta-qt5][PATCH] qfilesystemengine_unix.cpp: optionally disable use of statx(2)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jul 2018 07:12:31 -0000
Content-Type: text/plain

When used inside an unprivileged docker container, statx(2) gets
rejected with -EPERM by the default seccomp profile, unless the host
runs an almost-bleeding edge version of docker (at least 18.04). That
causes most qt apps, qmake in particular, to fail.

While the qt release notes do mention this

   - Qt uses the statx(2) system call for obtaining file information on
   kernels 4.12 and later. Some older container systems install system call
   protection rules that do not include this system call. If you experience
   problems running Qt applications inside containers (such as the report of
   a file not existing when it does), ensure the statx(2) is allowed in the
   container configuration.

it's not always feasible nor reasonable to upgrade (or tell one's
customers to upgrade) the build infrastructure, especially since several
distros as of this writing don't even seem to ship such a recent version
in their official repositories.

This opt-in patch simply monkey-patches out any (the only) use of statx
and ensures that the -ENOSYS fallbacks are used. While I agree that this
is really a bug in the container system, this takes the short and
pragmatic approach to getting things to work.

To opt-in, just prepend no-xstat: to OVERRIDES in some global
configuration file, possibly restricting that to e.g. native and
nativesdk.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 ...temengine_unix.cpp-disable-use-of-statx-2.patch | 58 ++++++++++++++++++++++
 recipes-qt/qt5/qt5-git.inc                         |  2 +
 2 files changed, 60 insertions(+)
 create mode 100644 recipes-qt/qt5/files/0001-qfilesystemengine_unix.cpp-disable-use-of-statx-2.patch

diff --git a/recipes-qt/qt5/files/0001-qfilesystemengine_unix.cpp-disable-use-of-statx-2.patch b/recipes-qt/qt5/files/0001-qfilesystemengine_unix.cpp-disable-use-of-statx-2.patch
new file mode 100644
index 0000000..6efbfe4
--- /dev/null
+++ b/recipes-qt/qt5/files/0001-qfilesystemengine_unix.cpp-disable-use-of-statx-2.patch
@@ -0,0 +1,58 @@
+From dc5218c70d445a4692271add1a17091afb230095 Mon Sep 17 00:00:00 2001
+From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
+Date: Mon, 16 Jul 2018 09:50:06 +0200
+Subject: [PATCH] qfilesystemengine_unix.cpp: disable use of statx(2)
+
+When used inside an unprivileged docker container, statx(2) gets
+rejected with -EPERM by the default seccomp profile, unless the host
+runs an almost-bleeding edge version of docker (at least 18.04). That
+causes most qt apps, qmake in particular, to fail.
+
+While the qt release notes do mention this
+
+   - Qt uses the statx(2) system call for obtaining file information on
+   kernels 4.12 and later. Some older container systems install system call
+   protection rules that do not include this system call. If you experience
+   problems running Qt applications inside containers (such as the report of
+   a file not existing when it does), ensure the statx(2) is allowed in the
+   container configuration.
+
+it's not always feasible nor reasonable to upgrade (or tell one's
+customers to upgrade) the build infrastructure.
+
+This opt-in patch simply monkey-patches out any (the only) use of statx
+and ensures that the -ENOSYS fallbacks are used.
+
+https://github.com/docker/for-linux/issues/208
+https://github.com/moby/moby/pull/36417
+
+Upstream-Status: Inappropriate [workaround]
+---
+ src/corelib/io/qfilesystemengine_unix.cpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/corelib/io/qfilesystemengine_unix.cpp b/src/corelib/io/qfilesystemengine_unix.cpp
+index b974af80dc..5f574901e3 100644
+--- a/src/corelib/io/qfilesystemengine_unix.cpp
++++ b/src/corelib/io/qfilesystemengine_unix.cpp
+@@ -320,6 +320,9 @@ mtime(const T &statBuffer, int)
+ #ifdef STATX_BASIC_STATS
+ static int qt_real_statx(int fd, const char *pathname, int flags, struct statx *statxBuffer)
+ {
++#if 1
++    return -ENOSYS;
++#else
+ #ifdef Q_ATOMIC_INT8_IS_SUPPORTED
+     static QBasicAtomicInteger<qint8> statxTested  = Q_BASIC_ATOMIC_INITIALIZER(0);
+ #else
+@@ -337,6 +340,7 @@ static int qt_real_statx(int fd, const char *pathname, int flags, struct statx *
+     }
+     statxTested.store(1);
+     return ret == -1 ? -errno : 0;
++#endif
+ }
+ 
+ static int qt_statx(const char *pathname, struct statx *statxBuffer)
+-- 
+2.16.4
+
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index 09b6cc5..41f9b7a 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -15,3 +15,5 @@ CVE_PRODUCT = "qt"
 S = "${WORKDIR}/git"
 
 PV = "5.11.1+git${SRCPV}"
+
+SRC_URI_append_no-xstat = " file://0001-qfilesystemengine_unix.cpp-disable-use-of-statx-2.patch"
-- 
2.16.4


