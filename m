Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6154.1631599343898764220
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Sep 2021 23:02:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ocMuoH0s;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4891c338f9=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18E5MchH005654
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Sep 2021 23:02:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=YhvD7baBkCXiJM+05J4s57uA+HznJtjXi6rkHfvLx68=;
 b=ocMuoH0sa6YBM9IOT7jv9dflueyO2NEkZockzyf5ZnZrF2uiBvnf5sqCXDWWixY0zOv6
 A5hAsaJSh3p7NNJz+zr4dcCArGjTyDqq1ViaYkcIzXYGjAI06aXSFfVslLJWF3lslTFb
 GA9pPJaHrG1HyiGYqVOjge4Uxz5K0rSeIx+KOIpxCCUtq7+dWs/4MYhPXHbvwZfUzapR
 nY40kCLb4CnM5OW6YmMYVHQycKBbIqzLOzYM4ozjIVveVkWgOKdjGsIRBx47eGdA5bVn
 8Gr21Zmx1NnM2e+hRxa/f4znfb5t8K25l9lf/8utdJKgXvpNFOe4HWBDmPlrIQQ5N8xj /g== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by mx0a-0064b401.pphosted.com with ESMTP id 3b2jswr7un-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Sep 2021 23:02:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WYJ4vlsn+vtp80lbyLQuQOyPxdWo/Vvx/5ioyvQjbeiCEosQb8MDMV/ES3wcOMcWHChzg0WimKhAz1IrSUlo+eM7wsr6qux6F/ao92YUY/fIOefwJ8grgxbDLJqmkNFre9xEv7P01TRH52MgZ2DhkeU50Gv5lCUULWMalqoW82T+/a3Px3mhSgdS8aDhM/r2jnzBS5URSGML/rdSPTkX6LpJC2bhIFQmXWtHRHTmgVsS4bhSPl/O8cRqFdNZly1405uUcEM5xyrzaKwwvHPBmb7AvJVCWHKDfWUxDEMfCm2xLlfkllwr3+f662NrNluCm+WKGKVFWTntyJdTmk1k2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=YhvD7baBkCXiJM+05J4s57uA+HznJtjXi6rkHfvLx68=;
 b=UHqHl4CnWJiiUWBVw+8MfXfCn8fo6PQ9cA1AC4sU1GZPm53faYKAlZ9fjwB2QoVwsPsOWY4wsWPQqdli332hznf0wZd5qBju9PFOApRlZI21Qh6oFuksOyP7o7hfyyWSg5URukKwlctj+oo+3irKZ6bXMpw3KUw9PpWsVRWAF70RCXffMOH8/o5OpFoxrHMXz/j2NVpMAZsRXUddMz2/zLGlkOEQl01ZjAi5szP2O9Uaoj8BQVV2o8/DtodxV/uBZcmJklFjFozuQlf2vAlslaOjiBewmQZ2MlMWrHtQVKn7FLxE9NJVggwZjFkKHsk/68yOnfdkXUIdBVfLznzMlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4945.namprd11.prod.outlook.com (2603:10b6:303:9c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 06:02:20 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3975:1563:a18e:2017]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3975:1563:a18e:2017%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 06:02:20 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] net-snmp: make sure snmpd always exit after displaying usage
Date: Tue, 14 Sep 2021 14:02:08 +0800
Message-Id: <20210914060208.39200-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914060208.39200-1-yi.zhao@windriver.com>
References: <20210914060208.39200-1-yi.zhao@windriver.com>
X-ClientProxiedBy: HK2PR03CA0064.apcprd03.prod.outlook.com
 (2603:1096:202:17::34) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR03CA0064.apcprd03.prod.outlook.com (2603:1096:202:17::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.9 via Frontend Transport; Tue, 14 Sep 2021 06:02:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d80a7763-9fa5-4888-bed2-08d9774536ac
X-MS-TrafficTypeDiagnostic: CO1PR11MB4945:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB494572116E98DA5FA7EBC77EF9DA9@CO1PR11MB4945.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:773;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3OAHDa7UeTJmI5hP0ObtTTCpm1a3CBunQldl5a/04VYxhxeUtLTImk+p54yZbfaPVtv1dsOZEpgz45hrNdR5t2ZCeegHp/LqIoTUZz8Lf+H6A4N8hS29z0XzZbVFq7Sclxc5FuImvY+Qj6A3+sYflRWq+1ps67JDi+vem8w9FIc67qW9HSiJrd6eM67kDFSmCvkq65MCKJccq7XhrCy+SQus8k1lGafGUEzwA9GQBheuxsaDZGb7akaYzMt5+xHSW74ceM6v58EtQyxnAIFrEYadMWsgeMVcwebpQ7pnLSjEsmUBiUtnn+5NadAtNp6HxskCzVvATRDudzqffEO9v3EjME+eNMPPTsoh+YvU7LgmYQ4uV6iiIdda+tYXemLqY6WXs8OMEXUTbdLt27aB0mymk4njvcuEDigtU49EchdsJmGYsIbW4yVm167DevEw9BtlDPSXxClKzf2Zjv3k8FX40UnuCrkDHNoxPZfZFXmxg7V9K6tnK/Hx9uS4FdmsMeyNqz2nA+9e2EguX0MoJoy1+/FIcyJMXVCdE2fDXTIJlJ4fwelt8BLhd0asARV4wLPgF30N6kEvjcoZmkQjPyfDrhOuHhHaj850TxQkMM3AwRpUXs2b2huEILWi/IgKPA2j7drAX2rAiRhEHVkMrPI3cWwjFEk27d12ynlVz4fcB6LJIG8vP04AOdLbXrdNKaUd7fioo7bQD6qUzq8bRaK1rQAGFwfnHJuZHEQQ8yD7zn+QcxauV98emL4cLKzKzne8aHyjKgDzmjXZYHLsYQEM4jJcOvhOVJdPel+EUr8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(39850400004)(136003)(366004)(44832011)(2616005)(66476007)(66556008)(26005)(956004)(6486002)(38100700002)(38350700002)(66946007)(316002)(6512007)(6916009)(86362001)(36756003)(2906002)(186003)(478600001)(6506007)(6666004)(83380400001)(8936002)(8676002)(52116002)(1076003)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Af7C1XpTzsuZJuBKMdZaFtdKtv4VBcuZVaNPwYBfaa/aC5WB/JJmvGIbJXK4?=
 =?us-ascii?Q?qtDwBUtT4lN1JVvLgB1FzZG3m1lcFoznY3TLrm9Gjw7g83w1anAELqm3ZgQW?=
 =?us-ascii?Q?z1OMHLGdrs17pheu71SX+/YufQSGP9PqA2IGpi5BHVetEEYIfaidHu7EZZ3m?=
 =?us-ascii?Q?7wPFFmYZERPerkSwizRnffRxx68ixaI8BJcFBcMN2m8qLfsknhFZsTXKyHFG?=
 =?us-ascii?Q?5fWUOSEgjgSwBQvaDAK+zXle9dzzTnYLY0W4WSqIXgPLS0E8Z9UJNDZAzuAm?=
 =?us-ascii?Q?h6qZ7+W2C7mYrC/hRXXYHwlIVqmLTUkW/hg/lJneItwb7NU9IIBgInyq0kwI?=
 =?us-ascii?Q?2dIaeLABTeaoFKcGUojBBDlbzQw6n/B8skGCMyjrez3ecdulPIko9SD9upgb?=
 =?us-ascii?Q?IQw2CZXZSTPH4NPJmNsVOEWaOgZNzr9F0llMJFvxPvyyuabwMEPIGtE+cXTU?=
 =?us-ascii?Q?YONb4MBfiO6u+T8WpdbsZD7CCw7avIhYzv1l5nCInwMlbEgnCugor3rzqzy8?=
 =?us-ascii?Q?D+51M6/UvyHya5exJLxWELaf0RTfkYn8SdQn3tTl9laYIymWA5AS4ucERT4z?=
 =?us-ascii?Q?YYaZKlBbUb2K7tTTzEo7/3KgOQ1MgMyEgoyiMAb1hk/WynxD+OTc+Ez0Fm3x?=
 =?us-ascii?Q?ogsHHwHlpeUx+CDLMORGOLFVOGGJSIhlPQoxONHvEUrLJLErfpzFi81OmGyl?=
 =?us-ascii?Q?MQrRcOkT3EIqJsL9KhXqWvL6N8/PqkIDW+INRmsfCzLVyTFCy3u9lVyGGucp?=
 =?us-ascii?Q?Jo0qasqnKfw4GtKOT8qhw8sqtNV5/O6YcgZIpiJctWxNape2IJ+gQgqzEWie?=
 =?us-ascii?Q?/BXJz+1bbsIyqP8r/PIpqGMOmT7037qDo7olJLiBAHQQsKEo07eF4acKbwjx?=
 =?us-ascii?Q?A0nNEN1h3c2CkfgqYi/zF1FiDuvqOzTOzXGtIlQC5dVn6A37n1enjklG6p39?=
 =?us-ascii?Q?UVVwbBlDQXi5fAqPyc5hUKGlnLQGvQHYnlyo1tPQRrTmznbhiYIIzVfOSV/8?=
 =?us-ascii?Q?Cyy0o8Oabs6azY3DpakcaenxqgCOGe5ATrPli0YNCd76gWRY4ueLSb6YaZUk?=
 =?us-ascii?Q?M3b3EdgK0K244K+2qP3CFtbohRY9vvm2XDZr09T1PwVgyUnEfayN+RSmkf77?=
 =?us-ascii?Q?okA94QuAwbKecrucUPZe4UHGwrMR3dQK3LosfDvRyItjWzEqOWlPLAGA2vIH?=
 =?us-ascii?Q?QnWJx1dNFLnEn/3JuRiCbTQZzZ6EBiJszqnj4I2826mor2B+jColHl55wraB?=
 =?us-ascii?Q?e5s2TjvlE/GkMo89ZASwSwmyuFJSf/0WhfTlzja0J+wgnXmAXy/SiC81hTlg?=
 =?us-ascii?Q?DHC3iq6SppmfBqTn96a/WlFB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d80a7763-9fa5-4888-bed2-08d9774536ac
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 06:02:20.4490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2WR32rYrd8z7uYxmy6f/BI8GhBpMEFEfXtgfAHUsPbKJhTbkER17U/LwEUOnFkt3bTl9J8aLYOnsqdwyPRzjrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4945
X-Proofpoint-ORIG-GUID: _LjtSNHgypFFbYfVYwRm5tngc8EWb7EW
X-Proofpoint-GUID: _LjtSNHgypFFbYfVYwRm5tngc8EWb7EW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-13_09,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 impostorscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109140034
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Currently, viewing the help text with snmpd -h results in snmpd being
started in the background.

$ snmpd -h
Usage:  snmpd [OPTIONS] [LISTENING ADDRESSES]
[snip]
$ ps -ef | grep snmpd
root    1477    1  0 05:46 ?    00:00:00 snmpd -h

Backport a patch to fix this issue.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...d-always-exit-after-displaying-usage.patch | 55 +++++++++++++++++++
 .../net-snmp/net-snmp_5.9.1.bb                |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmpd-always-exit-after-displaying-usage.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmpd-always-exit-after-displaying-usage.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmpd-always-exit-after-displaying-usage.patch
new file mode 100644
index 000000000..4fc9e54b4
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmpd-always-exit-after-displaying-usage.patch
@@ -0,0 +1,55 @@
+From 94ca941e06bef157bf0e13251f8ca1471daa9393 Mon Sep 17 00:00:00 2001
+From: Kaarle Ritvanen <kaarle.ritvanen@datakunkku.fi>
+Date: Fri, 27 Aug 2021 14:21:45 +0300
+Subject: [PATCH] snmpd: always exit after displaying usage
+
+Currently, viewing the help text with -h results in snmpd being started
+in the background, whereas this does not happen with --help. Similarly,
+when an error is detected in command line syntax, the help text is
+displayed but sometimes snmpd gets started anyway, depending on the
+execution path.
+
+This patch makes snmpd consistently terminate whenever the usage
+function gets called. It also removes the goto statements no longer
+needed.
+
+Upstream-Status: Backport
+[https://github.com/net-snmp/net-snmp/commit/94ca941e06bef157bf0e13251f8ca1471daa9393]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ agent/snmpd.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/agent/snmpd.c b/agent/snmpd.c
+index f5aab0af8..90de12d99 100644
+--- a/agent/snmpd.c
++++ b/agent/snmpd.c
+@@ -289,6 +289,8 @@ usage(char *prog)
+            "  -S d|i|0-7\t\tuse -Ls <facility> instead\n"
+            "\n"
+            );
++    SOCK_CLEANUP;
++    exit(1);
+ }
+ 
+ static void
+@@ -494,7 +496,6 @@ main(int argc, char *argv[])
+         case '-':
+             if (strcasecmp(optarg, "help") == 0) {
+                 usage(argv[0]);
+-                goto out;
+             }
+             if (strcasecmp(optarg, "version") == 0) {
+                 version();
+@@ -783,7 +784,6 @@ main(int argc, char *argv[])
+             fprintf(stderr, "%s: Illegal argument -X:"
+ 		            "AgentX support not compiled in.\n", argv[0]);
+             usage(argv[0]);
+-            goto out;
+ #endif
+             break;
+ 
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
index 5fa617094..e6ea2ddae 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
@@ -27,6 +27,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://net-snmp-fix-for-disable-des.patch \
            file://reproducibility-have-printcap.patch \
            file://0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch \
+           file://0001-snmpd-always-exit-after-displaying-usage.patch \
            "
 SRC_URI[sha256sum] = "eb7fd4a44de6cddbffd9a92a85ad1309e5c1054fb9d5a7dd93079c8953f48c3f"
 
-- 
2.25.1

