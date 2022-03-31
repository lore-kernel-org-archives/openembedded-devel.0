Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9EDFC433EF
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 01:20:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1929.1648689654705167951
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Mar 2022 18:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=DG8xftOi;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=10897438a4=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22V1J394019732
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Mar 2022 18:20:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=jGpaclm1XeJO9q4X5/ZipWAQv4cCwGl3UsKE6X2hR88=;
 b=DG8xftOiXjPOlPq3kQdXmElMc3h/eqZrRZDxRyzL5LEjXYTT8MASr4U5gdJFdSZ76Kq8
 Pu0hdYSykGTz9AaOcTy35dVwdt8g1YXdwExbc5sVaDBDlpkhczNpzXLns/jcjTzxW/8q
 jWeFv6y9fJ40xbuwals/RR22kvGbn/Iym9tL3KbXGJWjDa6eLDh9VnCByYQ6anouxrLd
 84HsBib6wPQa5pJHHbeASAgdlmtuQiEw25c5hus06UBdNfQVttCasbxG5KDSqYfF53LQ
 8uIFMg/hWax91uDmM6w/aNYhxMtqPHPcVj9d0/283F65+kKRJNKv9rgvSsaZ42cx/VQD wQ==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f1x42kuns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Mar 2022 18:20:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ndNh5r8UMt5/JD2Zz80c5g34kHS2PiA6V8iTQF0bKj1eRO/caGYMGHty7GlLevHAo6l2utspoiyRU28kZOlQk314Ty6apPRZY6DerbfzVNXQP0wbE2MIAzWZqamD68Xpew0UA6UOMn2FwyaFIvcznSy7r+hRBFu5/RcOxoFeaqkR/4cQwCF4xf/V9IggeeNWKweM3CjFiGcD9YJjTR5+Fo1ZokRh8sWBo/AqoW51PeH8M2Fyd0p37oECkFFminFSD9z+DdxX43XB+BA0BbQvXo11i55J8Fsy9BA19b9TE6T4G6qarKalq6iR8F6MZoSHHkjzMDq0g6jKmXZK3llCLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jGpaclm1XeJO9q4X5/ZipWAQv4cCwGl3UsKE6X2hR88=;
 b=Ng78J3ca9VwCHO5dZpzwfis+xYHhwCkd9RgoFjwF7p4kFUT78G8HdQZACfD7rF5W0X5RW496stDMuMILf3DWcqpqtklfM3IUtGW83N5MHfFoFkLxYWpxm/8ReMPhYjXX43UmMBBqLWWZ6AvvmlZFTkAuG2rpN6qjkpptpNMtG0aAKGnWvJMZa8Sl1bQGDQUp+yzXOHbh/8franUrJj600kSEkX6tsOu0jzwDFbyrObor2wF7G5E1hs9K6mJ6Sh+mGU7KQlkcgF40oq9gU0ZvqM353x1NuenWZ9oQFVJ/XPWcVsIESqcJZQakEaD+moiMpTU7CbssdRye0osB4Kb6xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SJ0PR11MB5662.namprd11.prod.outlook.com (2603:10b6:a03:3af::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Thu, 31 Mar
 2022 01:20:48 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8ec:d095:e49b:d875]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8ec:d095:e49b:d875%9]) with mapi id 15.20.5123.019; Thu, 31 Mar 2022
 01:20:48 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] strongswan: 5.9.4 -> 5.9.5
Date: Thu, 31 Mar 2022 09:20:37 +0800
Message-Id: <20220331012037.1407916-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR03CA0062.apcprd03.prod.outlook.com
 (2603:1096:202:17::32) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b698dcc8-f663-46a0-aac1-08da12b4afd1
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5662:EE_
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5662CDA429E848A79BC056C8F9E19@SJ0PR11MB5662.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OW6rLhHHsnTrBPsQUaLKDQvCjFU2MHYoTf5I2bpJy6sQC418mbxqGCIBUsl6d94YDtgqY80ixaD96qBM+a4EY5W0QZP1jQ75EjpvmFQQmN+tGkFWRPrmxnvc8UlngnKQbyKom61MEyqa/+Lx3LrtiGME8Ds/MZ5OspnrBcBAHWy9/QLIS8EQR2KcRQftMIgjnW24Fgvdn1OXGgvnFvYp45jklIweQS7G6vux7PndDWvypxLPLScIGYUaVpWsYVt0eerE3RCMuNHWvoOjhuKOdjF0nwWv8aOZwk5UV4UjjtKll2zzhzuAmv0QSQzwTzMjoucu7qdlM7FhuTJ8rC8oTLGe+K+ilUberqAVFOV8IWEY9I/V3ymiAc4D31pl2X+6bqshEfQIUznd9X0Q/LfsS1abtg5iHDSY8B0M6DzmxQkj4HMn+8uSz3vfSsYLxnPC1zshUFyztCmXruNx+LFHn4HggXJfNXrlJDFpr26U7W3loQ0P2aMi3wSCBlhmo4a7mpvEDTOBp+xFh55Rs7xdvuHrWWh5/haZ/52fjA3d5OorelaaWovexzewE/Ra5jBNdawhVc46rAZMlIoc6uXKaQy72JuI8GdFftBCHIdmSJd//OZU0HVSQug1mWnfLjRAu7XqgiVS973cv5ZiBgADQsQD1F2q3gS2aionRtnQIzosqKl7Cp4Rrugf8oVGopRgzBLSvuG7wXiN9kp22S3lGqtoPCTaNEPsNpuVMUtqu1CRNJ5z9oB35h2fvCyLsSUyuL4HSSUxN7NJkIylZh7Ne6dM10vvQ827E1C1t2A9zAF5T9aHhzwSnt4cJDiyzm8N
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(1076003)(6506007)(86362001)(26005)(186003)(2906002)(8936002)(6486002)(66556008)(508600001)(6512007)(52116002)(8676002)(66476007)(2616005)(66946007)(38350700002)(38100700002)(36756003)(83380400001)(5660300002)(316002)(30864003)(6916009)(6666004)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ESI2659meJSqAInL6nsLb8dOpctqbdQAQSO78dR6wbUXCtGun37rsHOVN2OO?=
 =?us-ascii?Q?Dzh7LzX+qjCiHYpKbNnneO/L8W10CohUUC6q5LBq31VVa7DxUO9HLI3m94EP?=
 =?us-ascii?Q?aNBtzMRclW84k5pr831/nQoBr2mxNc7CrS42oUSbrPhIAR8O+ls4A9zcFdzL?=
 =?us-ascii?Q?z1PZGnnDwcbSQw5wyL0h6f/SRwQSi/2tTjhBYvtuskU+bMBsN9DJO4pldmPV?=
 =?us-ascii?Q?rGQjZVk3QQ5uuKQJL7s7oYtnBLPaaZQmmS2HJafiYyWsJ06yXEqc1RgKc9Jx?=
 =?us-ascii?Q?cDRKCRBrImcti+7n1kPpfhdRpbPLxPmMkEJJf5yn5Hh5C4XxjUsKgJZb+I4a?=
 =?us-ascii?Q?Qks7poYL4U/El2uOcA40Z28ak6gAg7X0im+vagrfr48vaUiehx1HuCxW5YkJ?=
 =?us-ascii?Q?JHKYdOMj9srfngTkUlPbaV5qzJ8R8mKC+LO0UfcH3jqaEWNppWkW3YgB8uPh?=
 =?us-ascii?Q?hilYlkCfI4AvNCYQEDiUjZxVB511ZfjxcZjMk11YQYxR0MulNMV7/Crmrt72?=
 =?us-ascii?Q?IMULnPFI93CMyf6jK8IV5v2q8NLveWAre+5QYBKu3dSNh32wQo16RnfpBijJ?=
 =?us-ascii?Q?WQXkTXq8BCXVYkuPC9dZeNisTOt5KD79Pq5oODGz9Ql1njI5E2o+HT95gQi+?=
 =?us-ascii?Q?VQVCfVvKwiEBNJUFH502/jA5ir3XRvmlZc0CiKn5tVINMvjOeJmcV1egMPMV?=
 =?us-ascii?Q?2VljnulosrQklk4xFhfvu21qPd06r/oqg+LEMAW0Z4RZfP04xvwvQdd2+Hgc?=
 =?us-ascii?Q?f0WmOtWbze45iM+/Jx+BcY95vOiFn7aCUGkId9+23buvVebtNg77Sh8bcFZS?=
 =?us-ascii?Q?ZdSKqrWdfKHimdQPXqt7u+NHWL/BhzwypV5qQccafw6fvwCTZjDNfUk++LGB?=
 =?us-ascii?Q?7gX+0EGjJkks47JY1ifg/xGXbujO1R31OQWmI8/NlAkKQDq3/0V412Y08huk?=
 =?us-ascii?Q?gsaQ99lH2HFoDzM5RFJ03N6exbkKuvmg77Yo5E1PNA2ffKsGVYRLO1v59QYu?=
 =?us-ascii?Q?lbBinIJ7Tj30c5Aic2gFQANoehGBT/groTVGvBjKsF+XXDMMWAfd18mAaZy1?=
 =?us-ascii?Q?IC/r5iA0DHRPV+TERVBpB0lGxHYmvAuNrbA1F3Te9Co7Hy0fiWcnRpsAJyA8?=
 =?us-ascii?Q?q0mQJKPN7xsN5i7AlewbhSXWtnDDMg24HGcjWCt6YjFKNf9yPsdQgFrOVgyh?=
 =?us-ascii?Q?omVAWPS4K6Rqs+VbKbYao1Xw1nPH2P7oIignTRP/2eV++4p/9MK7UYq58CUw?=
 =?us-ascii?Q?AQJRlI9rRkHB8NvEjqJpGf+W3yxJHv3zrACiU1Oc8pSfbg5tczu21UPBGS+o?=
 =?us-ascii?Q?0OqrmFPtGQhBW5sXDGbU/QRyqV9n637iojNo0UnvE1hASQ0t7cDRosKNCS3U?=
 =?us-ascii?Q?UWIO8PeJXicXBk8FEGmf8UISp0dcUKhLu4BOc0Yywn63DNvmpqoqVg/PbM/J?=
 =?us-ascii?Q?iGhQEyU/hpfHI2LXRi0WByvuhV8+Qw61SEe5jnAgJxaow01F8cQnHx3aBoHW?=
 =?us-ascii?Q?X5QTQ8vTp9ZDnMTctM0HS+B0ChpCGRZIuAu56oBFx6ghnbxsYn3MaMdW/zjD?=
 =?us-ascii?Q?n3GCj0OBdUuEDkP+IVNit1k/5zLt+/S3cCXOD/W02P7FcLhBOmMbXyqdd65i?=
 =?us-ascii?Q?QbB9iYyE8lLTt8gQHjXinhrZuBYZ6234lfpi4Z06k+kcnxUJK3cTrwL1lIZm?=
 =?us-ascii?Q?/dRq3yJo9kSoQ/6l8LDqN2HOKTDGOJ3AoQ46JlpeHA1nf42TOR+mVktv6NH9?=
 =?us-ascii?Q?MzgcKyM3lQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b698dcc8-f663-46a0-aac1-08da12b4afd1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 01:20:48.1838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 AOhome3GG/tNIgwZIK2H2JCBJ1vvtXcFMnll8YB+ygtupIiXLydLrVXMFQpgJyqL97Z9mvCB8nPJMwIbFaN22w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5662
X-Proofpoint-GUID: kz2sS4SPk9clYqRMX3iAkkUEJ3AUgmJm
X-Proofpoint-ORIG-GUID: kz2sS4SPk9clYqRMX3iAkkUEJ3AUgmJm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-30_06,2022-03-30_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203310006
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Mar 2022 01:20:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96274

* Backport a patch to fix the segfault with swanctl:

  $ /usr/sbin/charon-systemd &
  $ /usr/sbin/swanctl --load-all --noprompt
  no files found matching '/etc/swanctl/conf.d/*.conf'
  no authorities found, 0 unloaded
  no pools found, 0 unloaded
  no connections found, 0 unloaded
  Segmentation fault

* Drop fix-funtion-parameter.patch and
  0001-memory.h-Include-stdint.h-for-uintptr_t.patch as the issues have
  been fixed upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...ory.h-Include-stdint.h-for-uintptr_t.patch | 22 -----
 .../0001-openssl-Don-t-unload-providers.patch | 92 +++++++++++++++++
 .../files/fix-funtion-parameter.patch         | 99 -------------------
 ...trongswan_5.9.4.bb => strongswan_5.9.5.bb} |  5 +-
 4 files changed, 94 insertions(+), 124 deletions(-)
 delete mode 100644 meta-networking/recipes-support/strongswan/files/0001-memory.h-Include-stdint.h-for-uintptr_t.patch
 create mode 100644 meta-networking/recipes-support/strongswan/files/0001-openssl-Don-t-unload-providers.patch
 delete mode 100644 meta-networking/recipes-support/strongswan/files/fix-funtion-parameter.patch
 rename meta-networking/recipes-support/strongswan/{strongswan_5.9.4.bb => strongswan_5.9.5.bb} (97%)

diff --git a/meta-networking/recipes-support/strongswan/files/0001-memory.h-Include-stdint.h-for-uintptr_t.patch b/meta-networking/recipes-support/strongswan/files/0001-memory.h-Include-stdint.h-for-uintptr_t.patch
deleted file mode 100644
index 2d17507b1..000000000
--- a/meta-networking/recipes-support/strongswan/files/0001-memory.h-Include-stdint.h-for-uintptr_t.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From 33a53dc13fd924949a582109b45fedd8d0bed59b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 27 Jun 2017 07:42:11 -0700
-Subject: [PATCH] memory.h: Include stdint.h for uintptr_t
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/libstrongswan/utils/utils/memory.h | 2 ++
- 1 file changed, 2 insertions(+)
-
---- a/src/libstrongswan/utils/utils/memory.h
-+++ b/src/libstrongswan/utils/utils/memory.h
-@@ -26,6 +26,8 @@
- #include <string.h>
- #endif
- 
-+#include <stdint.h>
-+
- /**
-  * Helper function that compares two binary blobs for equality
-  */
diff --git a/meta-networking/recipes-support/strongswan/files/0001-openssl-Don-t-unload-providers.patch b/meta-networking/recipes-support/strongswan/files/0001-openssl-Don-t-unload-providers.patch
new file mode 100644
index 000000000..7da48cd2c
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/files/0001-openssl-Don-t-unload-providers.patch
@@ -0,0 +1,92 @@
+From 3eecd40cec6415fc033f8d9141ab652047e71524 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Wed, 23 Feb 2022 17:29:02 +0100
+Subject: [PATCH] openssl: Don't unload providers
+
+There is a conflict between atexit() handlers registered by OpenSSL and
+some executables (e.g. swanctl or pki) to deinitialize libstrongswan.
+Because plugins are usually loaded after atexit() has been called, the
+handler registered by OpenSSL will run before our handler.  So when the
+latter destroys the plugins it's a bad idea to try to access any OpenSSL
+objects as they might already be invalid.
+
+Fixes: f556fce16b60 ("openssl: Load "legacy" provider in OpenSSL 3 for algorithms like MD4, DES etc.")
+Closes strongswan/strongswan#921
+
+Upstream-Status: Backport
+[https://github.com/strongswan/strongswan/commit/3eecd40cec6415fc033f8d9141ab652047e71524]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ .../plugins/openssl/openssl_plugin.c          | 27 +++----------------
+ 1 file changed, 3 insertions(+), 24 deletions(-)
+
+diff --git a/src/libstrongswan/plugins/openssl/openssl_plugin.c b/src/libstrongswan/plugins/openssl/openssl_plugin.c
+index 6b4923649..1491d5cf8 100644
+--- a/src/libstrongswan/plugins/openssl/openssl_plugin.c
++++ b/src/libstrongswan/plugins/openssl/openssl_plugin.c
+@@ -16,7 +16,6 @@
+ 
+ #include <library.h>
+ #include <utils/debug.h>
+-#include <collections/array.h>
+ #include <threading/thread.h>
+ #include <threading/mutex.h>
+ #include <threading/thread_value.h>
+@@ -74,13 +73,6 @@ struct private_openssl_plugin_t {
+ 	 * public functions
+ 	 */
+ 	openssl_plugin_t public;
+-
+-#if OPENSSL_VERSION_NUMBER >= 0x30000000L
+-	/**
+-	 * Loaded providers
+-	 */
+-	array_t *providers;
+-#endif
+ };
+ 
+ /**
+@@ -887,15 +879,6 @@ METHOD(plugin_t, get_features, int,
+ METHOD(plugin_t, destroy, void,
+ 	private_openssl_plugin_t *this)
+ {
+-#if OPENSSL_VERSION_NUMBER >= 0x30000000L
+-	OSSL_PROVIDER *provider;
+-	while (array_remove(this->providers, ARRAY_TAIL, &provider))
+-	{
+-		OSSL_PROVIDER_unload(provider);
+-	}
+-	array_destroy(this->providers);
+-#endif /* OPENSSL_VERSION_NUMBER */
+-
+ /* OpenSSL 1.1.0 cleans up itself at exit and while OPENSSL_cleanup() exists we
+  * can't call it as we couldn't re-initialize the library (as required by the
+  * unit tests and the Android app) */
+@@ -1009,20 +992,16 @@ plugin_t *openssl_plugin_create()
+ 			DBG1(DBG_LIB, "unable to load OpenSSL FIPS provider");
+ 			return NULL;
+ 		}
+-		array_insert_create(&this->providers, ARRAY_TAIL, fips);
+ 		/* explicitly load the base provider containing encoding functions */
+-		array_insert_create(&this->providers, ARRAY_TAIL,
+-							OSSL_PROVIDER_load(NULL, "base"));
++		OSSL_PROVIDER_load(NULL, "base");
+ 	}
+ 	else if (lib->settings->get_bool(lib->settings, "%s.plugins.openssl.load_legacy",
+ 									 TRUE, lib->ns))
+ 	{
+ 		/* load the legacy provider for algorithms like MD4, DES, BF etc. */
+-		array_insert_create(&this->providers, ARRAY_TAIL,
+-							OSSL_PROVIDER_load(NULL, "legacy"));
++		OSSL_PROVIDER_load(NULL, "legacy");
+ 		/* explicitly load the default provider, as mentioned by crypto(7) */
+-		array_insert_create(&this->providers, ARRAY_TAIL,
+-							OSSL_PROVIDER_load(NULL, "default"));
++		OSSL_PROVIDER_load(NULL, "default");
+ 	}
+ 	ossl_provider_names_t data = {};
+ 	OSSL_PROVIDER_do_all(NULL, concat_ossl_providers, &data);
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/strongswan/files/fix-funtion-parameter.patch b/meta-networking/recipes-support/strongswan/files/fix-funtion-parameter.patch
deleted file mode 100644
index 5945507bf..000000000
--- a/meta-networking/recipes-support/strongswan/files/fix-funtion-parameter.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From 9f97479373f3fceedc471074b81486d77a49618d Mon Sep 17 00:00:00 2001
-From: "Roy.Li" <rongqing.li@windriver.com>
-Date: Tue, 4 Mar 2014 14:38:42 +0800
-Subject: [PATCH] fix the function parameter
-
-Upstream-Status: Pending
-
-Original openssl_diffie_hellman_create has three parameters, but
-it is reassigned a function pointer which has one parameter, and
-is called with one parameter, which will lead to segment fault
-on PPC, Now we simply correct the number of parameters.
-
-    #0  0x484d4aa0 in __GI_raise (sig=6)
-         at ../nptl/sysdeps/unix/sysv/linux/raise.c:64
-    #1  0x484d9930 in __GI_abort () at abort.c:91
-    #2  0x10002064 in segv_handler (signal=11) at charon.c:224
-    #3  <signal handler called>
-    #4  0x48d89630 in openssl_diffie_hellman_create (group=MODP_1024_BIT, g=...,
-         p=<error reading variable: Cannot access memory at address 0x0>)
-         at openssl_diffie_hellman.c:143
-    #5  0x482c54f8 in create_dh (this=0x11ac6e68, group=MODP_1024_BIT)
-         at crypto/crypto_factory.c:358
-    #6  0x48375884 in create_dh (this=<optimized out>, group=<optimized out>)
-         at sa/keymat.c:132
-    #7  0x483843b8 in process_payloads (this=0x51400a78, message=<optimized
-    out>)
-         at sa/tasks/ike_init.c:200
-    #8  0x483844d0 in process_r (this=0x51400a78, message=0x51500778)
-         at sa/tasks/ike_init.c:319
-    #9  0x48374c9c in process_request (message=0x51500778, this=0x51400d20)
-         at sa/task_manager.c:870
-    #10 process_message (this=0x51400d20, msg=0x51500778) at
-    sa/task_manager.c:925
-    #11 0x4836c378 in process_message (this=0x514005f0, message=0x51500778)
-         at sa/ike_sa.c:1317
-    #12 0x48362270 in execute (this=0x515008d0)
-         at processing/jobs/process_message_job.c:74
-
-Signed-off-by: Roy.Li <rongqing.li@windriver.com>
-
----
- src/libstrongswan/plugins/openssl/openssl_diffie_hellman.c | 8 +++++++-
- src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h | 4 +++-
- src/libstrongswan/plugins/openssl/openssl_plugin.c         | 1 +
- 3 files changed, 11 insertions(+), 2 deletions(-)
-
-diff --git a/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.c b/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.c
-index 8e9c118..a73b038 100644
---- a/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.c
-+++ b/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.c
-@@ -192,7 +192,7 @@ METHOD(diffie_hellman_t, destroy, void,
- /*
-  * Described in header.
-  */
--openssl_diffie_hellman_t *openssl_diffie_hellman_create(
-+openssl_diffie_hellman_t *openssl_diffie_hellman_create_custom(
- 											diffie_hellman_group_t group, ...)
- {
- 	private_openssl_diffie_hellman_t *this;
-@@ -255,5 +255,11 @@ openssl_diffie_hellman_t *openssl_diffie_hellman_create(
- 	DBG2(DBG_LIB, "size of DH secret exponent: %d bits", BN_num_bits(privkey));
- 	return &this->public;
- }
-+openssl_diffie_hellman_t *openssl_diffie_hellman_create( diffie_hellman_group_t group)
-+{
-+	chunk_t g;
-+	chunk_t p;
-+	openssl_diffie_hellman_create_custom(group, g, p);
-+}
- 
- #endif /* OPENSSL_NO_DH */
-diff --git a/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h b/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h
-index 5de5520..22586e0 100644
---- a/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h
-+++ b/src/libstrongswan/plugins/openssl/openssl_diffie_hellman.h
-@@ -43,8 +43,10 @@ struct openssl_diffie_hellman_t {
-  * @param ...			expects generator and prime as chunk_t if MODP_CUSTOM
-  * @return				openssl_diffie_hellman_t object, NULL if not supported
-  */
--openssl_diffie_hellman_t *openssl_diffie_hellman_create(
-+openssl_diffie_hellman_t *openssl_diffie_hellman_create_custom(
- 											diffie_hellman_group_t group, ...);
-+openssl_diffie_hellman_t *openssl_diffie_hellman_create(
-+							diffie_hellman_group_t group);
- 
- #endif /** OPENSSL_DIFFIE_HELLMAN_H_ @}*/
- 
-diff --git a/src/libstrongswan/plugins/openssl/openssl_plugin.c b/src/libstrongswan/plugins/openssl/openssl_plugin.c
-index 8b0a7c5..114d575 100644
---- a/src/libstrongswan/plugins/openssl/openssl_plugin.c
-+++ b/src/libstrongswan/plugins/openssl/openssl_plugin.c
-@@ -609,6 +609,7 @@ METHOD(plugin_t, get_features, int,
- 			PLUGIN_PROVIDE(DH, MODP_1024_BIT),
- 			PLUGIN_PROVIDE(DH, MODP_1024_160),
- 			PLUGIN_PROVIDE(DH, MODP_768_BIT),
-+		PLUGIN_REGISTER(DH, openssl_diffie_hellman_create_custom),
- 			PLUGIN_PROVIDE(DH, MODP_CUSTOM),
- #endif
- #ifndef OPENSSL_NO_RSA
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.5.bb
similarity index 97%
rename from meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.9.5.bb
index babfe17d2..cfb7b41fa 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.5.bb
@@ -9,11 +9,10 @@ DEPENDS = "flex-native flex bison-native"
 DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss', '', d)}"
 
 SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
-           file://fix-funtion-parameter.patch \
-           file://0001-memory.h-Include-stdint.h-for-uintptr_t.patch \
+           file://0001-openssl-Don-t-unload-providers.patch \
            "
 
-SRC_URI[sha256sum] = "45fdf1a4c2af086d8ff5b76fd7b21d3b6f0890f365f83bf4c9a75dda26887518"
+SRC_URI[sha256sum] = "983e4ef4a4c6c9d69f5fe6707c7fe0b2b9a9291943bbf4e008faab6bf91c0bdd"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1


