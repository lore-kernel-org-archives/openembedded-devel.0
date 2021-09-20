Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.52])
 by mx.groups.io with SMTP id smtpd.web11.11185.1632142414521198022
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Sep 2021 05:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=GwGjOx7T;
 spf=pass (domain: kpit.com, ip: 40.107.139.52, mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AfhlLKaxk+TcFRyWDoDgR+sdwwaFdgxNkTvqF+z8dEHupGpAMKW07KRamyeY09lWrc+T5GTsRzR0OsPsY8qjCVG+HJeR/maR7s8hMAHPCrkraI/3qio38f+OiUQ/72yqbI9SEGBksrhB4kLKy/3oP0vL9TxZwi0rNKfGCKHKWOMDaqFjCiTTEUPXx5wD7xf/M9o/tAJlrv6bmc0E/NggQr/XEK5tw2N8pBxxIgzZ38WKC88WmQST2Rm3NKjwYu+j51YHZwoBkLfTKvW8koiMGCTIB6g4naqHLjQQxRmo1m9uGTMiRtBA2qDlmrH1R148PfLkShxqHZg55y/jgL3zyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=WvQpwp1qnS1GteiFLKXFM7AkxR7/dItT5gfZ2Yh7VPc=;
 b=h4NrZg23h4buWO+J7Wk1a49E4oAAcp7+R8IzN6J0Mf8Xlp9fF9oYsqg4LlYcxEJ1ki0pLJJOHObaHwep5fnPVCUP/JEaoDrUx5gBzFGtkPVnMVCfZLNVdfvCPVTMe7OaYS2Hn7OjZgLY7/fEH3p2yNDLB/Jdfn9GAQUIr6H2R11KpyVDw46escROlfL8gD2DIJwNtua0Wu2cthgILodxs6fj9xOC5jy1g5ZB8LUk/k3O0yVy+ZCTZ0C2Fs9coKUF6gJoVPb1E05krUibfk3/6U8vxNMaXH9w132m5XVopTO1419BLA0TPXZUlBCkOErjbpJ4rmUU0T4ycQ/QimqNqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvQpwp1qnS1GteiFLKXFM7AkxR7/dItT5gfZ2Yh7VPc=;
 b=GwGjOx7T9qzKVQJegmF05yM043XbQdKtHZt6ThtmBZ5CXbha6nJx3H1a5ifxF7cuS24KvZxAv4aI4Z/7ZDOon5DFp5Nem6Wd19N7s7BtlXSBmUP9AgBLU2ZV17CDaiPAqgTv/CZg6LxabIdlNa6nhDWdDuRomEbaIzxmvlQsGPM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BM1PR01MB0834.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:3::14)
 by BMXPR01MB3222.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:66::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Mon, 20 Sep
 2021 12:53:24 +0000
Received: from BM1PR01MB0834.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5542:6538:6c96:9121]) by BM1PR01MB0834.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5542:6538:6c96:9121%12]) with mapi id 15.20.4523.018; Mon, 20 Sep
 2021 12:53:24 +0000
From: "akash hadke" <akash.hadke@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: nisha.parrakat@kpit.com,
	ranjitsinh.rathod@kpit.com,
	Neetika Singh <Neetika.Singh@kpit.com>,
	akash hadke <Akash.Hadke@kpit.com>
Subject: [meta-oe][dunfell][PATCH] c-ares: Add fix for CVE-2021-3672
Date: Mon, 20 Sep 2021 18:22:40 +0530
Message-Id: <1632142360-13560-1-git-send-email-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: AM0PR03CA0042.eurprd03.prod.outlook.com (2603:10a6:208::19)
 To BM1PR01MB0834.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:3::14)
Return-Path: akash.hadke@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from L-12026.bmw-carit.intra (2402:8100:22cc:5a5e:44a9:cc0d:c1d7:5236) by AM0PR03CA0042.eurprd03.prod.outlook.com (2603:10a6:208::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4523.16 via Frontend Transport; Mon, 20 Sep 2021 12:53:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e611b51-7cad-4df5-f4a8-08d97c35a0aa
X-MS-TrafficTypeDiagnostic: BMXPR01MB3222:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BMXPR01MB3222CE9E7A4CF677DB62A70E8EA09@BMXPR01MB3222.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	khml0XPPxuCOqaVD6G0qRRxD+IECbo/5qDgFgDQ/EU9+oFN4sJ7A3OwYbDN4gTrhXiTE2FEM1YuJuRusAod26n0RIPzI346EHvSrhFmk6c13W3HXU0Hb8wMOWBZvlcCfR0WfwJbzgBkiEB39f/30kydrXpkNZis9Dwb7lqeV/Pmo4Mdo+XvJSx8UkdbSt5/ohHgGP8a1w1bphPX0Y1g7SxttQSS9RQjpQllCC4fs+3z9RykyjY/tu7/ImN74H5giJDBkciHbeU+yHrjZYvqcb55q2J6eDOQbHdqAu9Cg11RK+g6uU89bXV/vAYn/rH/Pbs4HkAiOTkznfUwTIXfyMWyRUBwZ/8a+pePW25sIuMV8EGjULeUhe5stBl72TX0KYDdDSKB17nqOx+DIGCEoNF7y7kOqHS3KcyTb4saAf2ubMcUBW64vykxxob71DTY2IQSJGTaErqfTvJwxOxN0osek5P6sRP5Fq68InYrhcMyExiQbuVISCsD4iYRhS37ick/z/0LpSf0E4yvNgNsnPeKi6blQLk6PMOvZQyUsngZV80rDzKW1x9RIdKK8gk+QFHp9szDSPkoKuHRvvZ0INCzN+exKRZNzmqhpqZ4pTujGxTuacWg9VQYqSJGW/E7WqPrUe6/Bv8yRa7IKDfqRZ7H3SKfbcoRDNXjgTK0oRks0QwryEsGYMzdcjo/35hEtUGQmnnEMsj+EJkmqJo1zNdFQLhSDWJM1RXdEeJXlvtKUU8TEEMWteXlkRm+Qcs2eWuXclC/PD5DCWRy7sYhjlA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB0834.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39850400004)(366004)(396003)(6916009)(6486002)(52116002)(66476007)(66946007)(2616005)(966005)(83380400001)(6506007)(66556008)(86362001)(107886003)(6512007)(8936002)(6666004)(36756003)(186003)(8676002)(38100700002)(2906002)(316002)(5660300002)(54906003)(4326008)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Mv7snBGKvG4ocYKBvcVvgo2slwH4Dma37/d7aDTI3M/TntYZPh3E+TlLYT8G?=
 =?us-ascii?Q?fZyd6C0iFX9zAluDbJsTalNfVSWBV699+/HLw9sqEyGhi8j6mp8NUUeG05Au?=
 =?us-ascii?Q?Kxm87NbnC+kyiqklYqcQCassQEAMqgeZOuD9eQR+Pn/b3uLr5uoP2Vp913yy?=
 =?us-ascii?Q?mdl4An1F41Gjd69NBXJ124UttcEVPvILHAN7ztRqXnxZUiJXWDse2G/BVkRu?=
 =?us-ascii?Q?EgtISNvaYnTswJsZog39Try7EW/V6a5oyV/PXE4RhWvrh0B5jbX6EidKNuPU?=
 =?us-ascii?Q?fzwY1ejrYEezpZ0VwYB79OmXbqufzIMinisHmAbs8v/+34mxEYOLX2moR8zt?=
 =?us-ascii?Q?Jy4YwtZYoVd8+oxkXv/W5JQu60LIREhlxRxZQs7jl11cASNReXBWg5xCFsCt?=
 =?us-ascii?Q?YvsxB3zZJuVKGoqqt+LKnSFMIkPNht/66eWvsmveFbOmu+QH7JnD0hpdZbMr?=
 =?us-ascii?Q?XcpyPaZUcDt06HcwIvtIpKrt9sTZhr2LbwgdNMQfFRtXxFNKuXgN3J4ebWjh?=
 =?us-ascii?Q?KbPD8vyRNoM9AUlXfSM1v4xeQnq5Mru0fokey1IFYprAhdf286TyeWaZAjU6?=
 =?us-ascii?Q?cWFql92mQS95owi4BqQM40hwh3tJUWRaZm+x4gIIO+UMwN32UARChxNcPVX0?=
 =?us-ascii?Q?ppNGM1uwtB1RbSU1Z22qV7gaX6RorZZACFKMcqyu9hjmYQEZmLF6TNMpcQgE?=
 =?us-ascii?Q?liwwt4siE/OHrMlffJ7/qg6Yv0R5pCJo8ueK79bMQJhXHCK4jLeWmSwyJpYN?=
 =?us-ascii?Q?VvhKWNeKgfYwP0AYlzWGPpjgtGB3KLYZO4412TTMSt6nZbFlu+ctjwSsUhii?=
 =?us-ascii?Q?gkTdAyOdjZuBpKSMBcAshqa/1pBdPvGLA9oSNdNj8+52Y67aRCmcVrulfty7?=
 =?us-ascii?Q?rKIlnPIqL4ZS1QizZJJJsO9tc0A+LvlfN8OhEKN4mETAlSIiayEFNlgb3Cig?=
 =?us-ascii?Q?2l8qSZRBox68NZv1gGgELeJuP9U7W66vWaMXOY9MmMXcRCOwagNU14WzETvo?=
 =?us-ascii?Q?FPpVrGCOgsmthzNbsHYm+WURy/OPD2AQ+Ud8HmOd7vI2Q4aHigEUsb9tOJ98?=
 =?us-ascii?Q?ifRrgeJipnRwfJ2jsrS5g3xIMDIZcLdZQUD/BFnNkxKpEZMy65LohSoRyC+A?=
 =?us-ascii?Q?U7117YyowG93nlg0ilwEOSC4RbCGoX1lInsZxdcnnf3GFa7Jd0FD5egRxKTc?=
 =?us-ascii?Q?8uta1hv4OUOWMAdZHhMumAVUf1VnduYFXDpapjd+gSk6MYij3xOQT+Pcqvef?=
 =?us-ascii?Q?SXK/TCwfoIECz9kBhclBe9s6S9ie0Sdq75a0Sk+N1HzziRYQ9gvY/5yxwiTu?=
 =?us-ascii?Q?YrBgYHTfgrY8yGVeZ1ZAw+/cSI1uBOW3QJRc9DP8nOAUuljJUG0rU4YnjupH?=
 =?us-ascii?Q?N2gacsGk3EvHxa/Hn16tAFhls57G?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e611b51-7cad-4df5-f4a8-08d97c35a0aa
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB0834.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 12:53:23.0820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iHI1fZ05y8YOyq1zkW11kJWtD4S/Rit1yMzBBk1NYeKT9tfVC1dqEliJbgDEMsB3HiYITM3Eu+/KHay3I4Qvqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB3222
Content-Type: text/plain

From: Neetika Singh <Neetika.Singh@kpit.com>

Added below patches to fix CVE-2021-3672

1. ares_expand_name-should-escape-more-characters.patch
2. ares_expand_name-fix-formatting-and-handling-of-root.patch

Link: http://snapshot.debian.org/archive/debian-security/20210810T064453Z/pool/updates/main/c/c-ares/c-ares_1.17.1-1%2Bdeb11u1.debian.tar.xz

Signed-off-by: akash hadke <Akash.Hadke@kpit.com>
Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
---
 ..._name-fix-formatting-and-handling-of-root.patch | 115 +++++++++++++++++++++
 ...expand_name-should-escape-more-characters.patch |  90 ++++++++++++++++
 meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb    |   2 +
 3 files changed, 207 insertions(+)
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/ares_expand_name-fix-formatting-and-handling-of-root.patch
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/ares_expand_name-should-escape-more-characters.patch

diff --git a/meta-oe/recipes-support/c-ares/c-ares/ares_expand_name-fix-formatting-and-handling-of-root.patch b/meta-oe/recipes-support/c-ares/c-ares/ares_expand_name-fix-formatting-and-handling-of-root.patch
new file mode 100644
index 0000000..d1cb54a
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/ares_expand_name-fix-formatting-and-handling-of-root.patch
@@ -0,0 +1,115 @@
+From: bradh352 <brad@brad-house.com>
+Date: Fri, 11 Jun 2021 12:39:24 -0400
+Subject: [2/2] ares_expand_name(): fix formatting and handling of root name
+ response
+Origin: https://github.com/c-ares/c-ares/commit/44c009b8e62ea1929de68e3f438181bea469ec14
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2021-3672
+
+Fixes issue introduced in prior commit with formatting and handling
+of parsing a root name response which should not be escaped.
+
+Fix By: Brad House
+CVE: CVE-2021-3672
+Upstream-Status: Backport [http://snapshot.debian.org/archive/debian-security/20210810T064453Z/pool/updates/main/c/c-ares/c-ares_1.17.1-1%2Bdeb11u1.debian.tar.xz]
+Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
+---
+ ares_expand_name.c | 62 ++++++++++++++++++++++++--------------
+ 1 file changed, 40 insertions(+), 22 deletions(-)
+
+diff --git a/ares_expand_name.c b/ares_expand_name.c
+index f1c874a97cfc..eb9268c1ff0a 100644
+--- a/ares_expand_name.c
++++ b/ares_expand_name.c
+@@ -127,27 +127,37 @@ int ares_expand_name(const unsigned char *encoded, const unsigned char *abuf,
+         }
+       else
+         {
+-          len = *p;
++          int name_len = *p;
++          len = name_len;
+           p++;
++
+           while (len--)
+             {
+-              if (!isprint(*p)) {
+-                /* Output as \DDD for consistency with RFC1035 5.1 */
+-                *q++ = '\\';
+-                *q++ = '0' + *p / 100;
+-                *q++ = '0' + (*p % 100) / 10;
+-                *q++ = '0' + (*p % 10);
+-              } else if (is_reservedch(*p)) {
+-                *q++ = '\\';
+-                *q++ = *p;
+-              } else {
+-                *q++ = *p;
+-              }
++              /* Output as \DDD for consistency with RFC1035 5.1, except
++               * for the special case of a root name response  */
++              if (!isprint(*p) && !(name_len == 1 && *p == 0))
++                {
++
++                  *q++ = '\\';
++                  *q++ = '0' + *p / 100;
++                  *q++ = '0' + (*p % 100) / 10;
++                  *q++ = '0' + (*p % 10);
++                }
++              else if (is_reservedch(*p))
++                {
++                  *q++ = '\\';
++                  *q++ = *p;
++                }
++              else
++                {
++                  *q++ = *p;
++                }
+               p++;
+             }
+           *q++ = '.';
+         }
+-    }
++     }
++
+   if (!indir)
+     *enclen = aresx_uztosl(p + 1U - encoded);
+ 
+@@ -194,21 +204,29 @@ static int name_length(const unsigned char *encoded, const unsigned char *abuf,
+         }
+       else if (top == 0x00)
+         {
+-          offset = *encoded;
++          int name_len = *encoded;
++          offset = name_len;
+           if (encoded + offset + 1 >= abuf + alen)
+             return -1;
+           encoded++;
++
+           while (offset--)
+             {
+-              if (!isprint(*encoded)) {
+-                n += 4;
+-              } else if (is_reservedch(*encoded)) {
+-                n += 2;
+-              } else {
+-                n += 1;
+-              }
++              if (!isprint(*encoded) && !(name_len == 1 && *encoded == 0))
++                {
++                  n += 4;
++                }
++              else if (is_reservedch(*encoded))
++                {
++                  n += 2;
++                }
++              else
++                {
++                  n += 1;
++                }
+               encoded++;
+             }
++
+           n++;
+         }
+       else
+-- 
+2.32.0
+
diff --git a/meta-oe/recipes-support/c-ares/c-ares/ares_expand_name-should-escape-more-characters.patch b/meta-oe/recipes-support/c-ares/c-ares/ares_expand_name-should-escape-more-characters.patch
new file mode 100644
index 0000000..3603ef1
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/ares_expand_name-should-escape-more-characters.patch
@@ -0,0 +1,90 @@
+From: bradh352 <brad@brad-house.com>
+Date: Fri, 11 Jun 2021 11:27:45 -0400
+Subject: [1/2] ares_expand_name() should escape more characters
+Origin: https://github.com/c-ares/c-ares/commit/362f91d807d293791008cdb7616d40f7784ece83
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2021-3672
+
+RFC1035 5.1 specifies some reserved characters and escaping sequences
+that are allowed to be specified.  Expand the list of reserved characters
+and also escape non-printable characters using the \DDD format as
+specified in the RFC.
+
+Bug Reported By: philipp.jeitner@sit.fraunhofer.de
+Fix By: Brad House (@bradh352)
+CVE: CVE-2021-3672
+Upstream-Status: Backport [http://snapshot.debian.org/archive/debian-security/20210810T064453Z/pool/updates/main/c/c-ares/c-ares_1.17.1-1%2Bdeb11u1.debian.tar.xz]
+Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
+---
+ ares_expand_name.c | 41 +++++++++++++++++++++++++++++++++++---
+ 1 file changed, 38 insertions(+), 3 deletions(-)
+
+diff --git a/ares_expand_name.c b/ares_expand_name.c
+index 407200ef5b4b..f1c874a97cfc 100644
+--- a/ares_expand_name.c
++++ b/ares_expand_name.c
+@@ -32,6 +32,26 @@
+ static int name_length(const unsigned char *encoded, const unsigned char *abuf,
+                        int alen);
+ 
++/* Reserved characters for names that need to be escaped */
++static int is_reservedch(int ch)
++{
++  switch (ch) {
++    case '"':
++    case '.':
++    case ';':
++    case '\\':
++    case '(':
++    case ')':
++    case '@':
++    case '$':
++      return 1;
++    default:
++      break;
++  }
++
++  return 0;
++}
++
+ /* Expand an RFC1035-encoded domain name given by encoded.  The
+  * containing message is given by abuf and alen.  The result given by
+  * *s, which is set to a NUL-terminated allocated buffer.  *enclen is
+@@ -111,9 +131,18 @@ int ares_expand_name(const unsigned char *encoded, const unsigned char *abuf,
+           p++;
+           while (len--)
+             {
+-              if (*p == '.' || *p == '\\')
++              if (!isprint(*p)) {
++                /* Output as \DDD for consistency with RFC1035 5.1 */
++                *q++ = '\\';
++                *q++ = '0' + *p / 100;
++                *q++ = '0' + (*p % 100) / 10;
++                *q++ = '0' + (*p % 10);
++              } else if (is_reservedch(*p)) {
+                 *q++ = '\\';
+-              *q++ = *p;
++                *q++ = *p;
++              } else {
++                *q++ = *p;
++              }
+               p++;
+             }
+           *q++ = '.';
+@@ -171,7 +200,13 @@ static int name_length(const unsigned char *encoded, const unsigned char *abuf,
+           encoded++;
+           while (offset--)
+             {
+-              n += (*encoded == '.' || *encoded == '\\') ? 2 : 1;
++              if (!isprint(*encoded)) {
++                n += 4;
++              } else if (is_reservedch(*encoded)) {
++                n += 2;
++              } else {
++                n += 1;
++              }
+               encoded++;
+             }
+           n++;
+-- 
+2.32.0
+
diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb b/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
index 67dd701..36bb9be 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
@@ -11,6 +11,8 @@ SRC_URI = "\
     git://github.com/c-ares/c-ares.git \
     file://cmake-install-libcares.pc.patch \
     file://0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch \
+    file://ares_expand_name-should-escape-more-characters.patch \
+    file://ares_expand_name-fix-formatting-and-handling-of-root.patch \
 "
 SRCREV = "74a1426ba60e2cd7977e53a22ef839c87415066e"
 
-- 
2.7.4

