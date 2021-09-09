Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3810.1631214048024030024
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Sep 2021 12:00:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=sfAvmAA8;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=48867a89f6=joe.slater@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 189EM0xM023913
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Sep 2021 19:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=ZSiXY2GxAt5BL52xMf5pNUW4yYoDmwplVKH6u7Y9jD0=;
 b=sfAvmAA8d6Jtv+y/pInUph3JPHdw/SFSBjIWsA9TCnk/qSoxEXQS1AukuDxCO2n3Zgu4
 DlUM+tOuBZOQTWNXEsDxXJwbTOZvQpA9IxXS5Fo7x/VboZ9e8awxlB+YfGE1w4amieyT
 Y1g6tCz6B8oUg6YWkKlTVo9Hpei9bAVKc3aARI1Y4y0ZNVK57jEAVBIhNPXNl0Hkal7A
 EEOVE5+VqFTED+4r+rc2EhyYu1vCmxJWjNSEdGnqQ7PgT6xBCMMqsSRLYA2Jkb3kvtAD
 XdjeZ5K/DYSBP+9IXUZWILs1V4mxY67FryAhO/VOKt5tZ3/46ZWKUPjpQqGE7NvU16pJ Ow== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ayaf2rkut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 09 Sep 2021 19:00:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TgncuHzN83Xtp3+RZTwMzdVN0v6f6CW0VADksQ2BZcOc0QijkGiwuTKH6JipHlOKN2nInfCnh6bu2FVzNX/oG5yOOvvhZccrDCxaf69LMY1+sAJvdH+VuHfoQ2SxxJ1yvUGEzgvmx13SnMyAqnonfeCLAyb2/sLKz20+1HvsfLJ1PFAUhfVwfcrIXYV7wWaa9oFZ0jm9+9ZviVcTWHHPF43AoxjUxKLPCGzYLczef1B88WCK2hso8B8oHqT1+0bIrJGnfiq6GbabZ+PYDt6JyOsG/jy5CExVyFBemcqfQrioC28IwStZDJ0l11ceHkk67Wy3mHxnr/CJYm9qUVgvqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ZSiXY2GxAt5BL52xMf5pNUW4yYoDmwplVKH6u7Y9jD0=;
 b=Jbo1nCt2Z3VWwb0bx3tRPmyyVv05bylSZg5o6X/VDPpD1LazyAEAJx7cYInEz1XcYpz0bELDoo4lPfILpt/c0o4NO2Vdoq5fQQi8YCMaV9y5SvxEVVlP0snTaQHrA3xuHUYtNI0h2RcniHRQeKGWzVp+0y8jGmAEPI1MJOnVnX7ekFDYCjbgOMhtQQSzre+xsaFg39QgBgn82xhV/cqKeFyR0HlWftx9u4OZnlNn2/8xzd954qKmpFI5N+gm+LyxvdDTBvjvAUtk2+QZxCjFr38XyV8hRCK1CU0YlDF/iUPjeNdjeLZ0QR9lFshEHuVZDWCRDVmBjyJd9f3eJ50eqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BYAPR11MB2790.namprd11.prod.outlook.com (2603:10b6:a02:c4::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Thu, 9 Sep
 2021 19:00:45 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::8136:f22:7050:c089]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::8136:f22:7050:c089%3]) with mapi id 15.20.4478.019; Thu, 9 Sep 2021
 19:00:44 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [meta-oe][PATCH 1/1] redis: advance to version 6.2.5
Date: Thu,  9 Sep 2021 12:00:30 -0700
Message-Id: <20210909190030.74738-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: BY5PR20CA0021.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::34) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
Received: from ala-lpggp3.wrs.com (147.11.105.124) by BY5PR20CA0021.namprd20.prod.outlook.com (2603:10b6:a03:1f4::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Thu, 9 Sep 2021 19:00:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d2cee85-b534-419f-3c7b-08d973c4208a
X-MS-TrafficTypeDiagnostic: BYAPR11MB2790:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2790583B9A57142A0F2919ED88D59@BYAPR11MB2790.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	K3Aa2NhLxK7xk+1bO7A//sTKhd3EPnoFtyrA3v4zpvuRWoNSkQgu/Y/DuLtlkNXrE+PNNyTkaZ2/AcSli8u878WNgcRf2NpsqHL7KmHd4h7atGCC99jxXeREq+6Jsg8LBzZOgki0UW3CDeRtczMtoCNS8PPhmnzFQCXJ/cLansFoVwHsGDa/F4F+tUWfQ0EUd6FWg8+jw9bYYx27GqILmolyZ18RAMrsLAz1QAwtmZlALMwCc2pVmCF77ZaXDoOu/RCljFqJb9Gi5e9Vfzx9txTEKvhNtNkhkypodXm4/gH6ywsVp0X+e68rma+aBoQfrbpjeToFBbczntI7kbMfvkVeLormnGKH69Jyq0soaCsTqC+4H5yRqOw4wBkS1Q4n703NULqbmeQR5LnVwqYkuGsApPj6AZqjfZflPJzbmKOXCHPV9EsbPKUtizyDuG75E7sBbJFce531+yEsrh8DyhbkaFoD0D55veDVMku3MPXIWoG0J36YYdmYIgUVCdAEObr6sgetEfzu6GLuJvKpl8nTehVnop6DDGXxAGBdMDCm6cmH7AFWUSrbcNl5rqC6i1iFoiuAGvC73a7DL6DM7Tt3yY/tEr4htTYc892ppSyJ8aYvJmp//IlAMY+ZIQYKaR/cJOznBruWAHMYuqgmclhXaDX7094Wjgfp5U6ZGpP1g4PpyKy/HPHICuPrKvq32MVpYgbguVgGbmuvmW45Io+fWHxzMNRuTklN7VBVXbTR05ebacSb5dbh9ATUL7hysnw4iu+exZ2EWv8vlvbkBeBTgsRrRgR9t+ukJoE+/b4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(346002)(136003)(366004)(6486002)(4326008)(38350700002)(6666004)(8676002)(5660300002)(38100700002)(8936002)(186003)(36756003)(478600001)(6512007)(44832011)(956004)(2616005)(26005)(6506007)(316002)(83380400001)(66946007)(66476007)(66556008)(86362001)(52116002)(2906002)(6916009)(107886003)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?f6X1zAze0dB1RsjBIg94V4OG/rMjYHE6g/NbnYzDJY1Hwt2bPR7z6emaxIYI?=
 =?us-ascii?Q?r+N9RxCUInlwHJc84Fymf8wS4rKrNEz/mWVvv2aOaeFvWzEv6hfc4IJSYnIK?=
 =?us-ascii?Q?FYXyg/osQ2uit8ZKk6DyVsrety9zLtdpwWqDyKA5J6kGBdLaMtTq1DGi9MFL?=
 =?us-ascii?Q?njUQ5EtiK/yYm7DXy42qZwc6kLaIe4RD2pieyygQS74U90fizyB05wcq+lQ2?=
 =?us-ascii?Q?4HcTTcRLKeBTd4J9MqP2cp5UQhZmS6t0CjfDYvoBT8d+jIHXJXCko8QLJ5Y7?=
 =?us-ascii?Q?NPrP3N5LuSHCmwI2W3R5UEZnLVhlFGN5qRJ6dRkNVmXTEtwr2rHwENHLZ6ej?=
 =?us-ascii?Q?JjeaaiNBIYRM2l/a2ZFAJncoDiR1RDl8x4u0jEoS7DsUtlLPwFagJmSChMfw?=
 =?us-ascii?Q?nipm/vE81Q7e3IoEBYUgHnPH3jNYI49cpEJ+sbuNaxArGbvODwnO58srSnq+?=
 =?us-ascii?Q?qVw8MVqwBFbCF4nojcYLjbnZbOXNnln9ePkxteQvXO/xwsxAQqu79Lj7hAtt?=
 =?us-ascii?Q?0rS0593sGPOmL9jDpx6f5zlHbUL+NGyF8ygrXz67kZD6IVcTGWqtnbZuxY6G?=
 =?us-ascii?Q?1Q6DhUW7LKul5OHyEnBWERWmzE4NEm6V2rmCaHj6YV3/KkfvsVbbBA8lRcHk?=
 =?us-ascii?Q?Un82G6kdoWCtd556+yUH2S3nRh06ihBPKZ4wMwa1xKa81ugMxdFZbhYRycHz?=
 =?us-ascii?Q?r1bLBvZ2ScnEfEGZd5O9keqMrsiG74jfWh222KHrbywK9rx2PrA5CqOrVNyC?=
 =?us-ascii?Q?hY8OkQXZCYE/FYvn1ovGimStLI+T7JO081jsIznFTrQRAWUligQsMFgtXwb+?=
 =?us-ascii?Q?ytHEBGHUNyIGahuTSBsqFqd/neusgEpMDbzTt8QWvi/+70VyCGxzbNqME6za?=
 =?us-ascii?Q?3I/uLugJM2dzcN+vu4WvAja+nE4rw8i7qar5OBoSe1cvOx+PshcDHpj97+th?=
 =?us-ascii?Q?cbF4iUufD/D7enHSBcKUvUJko4BZPw9WQWUSCYd2X/PKj4ORjifcyxCy3DoM?=
 =?us-ascii?Q?EcRbHU46mSEGeg2B5IXFtviSYYcwQ7xZTZnsHMsPO89DhOFWaP0UYuLBO9VR?=
 =?us-ascii?Q?ss8rvdsV2dlPiXp221auTCnmYxLmvXUqAt7uHYxLChIuAzzu3VbFKU964Mj/?=
 =?us-ascii?Q?/t44d2PQleOvVYJJfKMKy0x/sl7v2k1Bof5xPZJYDIzMHXCR+haL8oZvsZcK?=
 =?us-ascii?Q?bsFKkW1bYrnatcg6jCMq5WoEY1XKfjqJn+UE1wW+ocq44ZLbg3/dGTervK10?=
 =?us-ascii?Q?eUzvg6PNutbAbpKm1K026YtcXdSd8WAw5c+F5TsmtJlqmg1GWk4MHq/w82zS?=
 =?us-ascii?Q?2x+K5jHqJpi9sHLcIm4ul9gm?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d2cee85-b534-419f-3c7b-08d973c4208a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 19:00:44.8499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/cKNXq2gikcCmOQmmTJsSAk6ynTka9buT8jXfR8M3jzH/uBz+unkpbWhO9LrafddJeKy+tvTpxNk5BOaIhffMAc2ewSNs09eQiiLuCD6qQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2790
X-Proofpoint-GUID: gTNzKoSwFOCeaqKlnD8Tp0joSYGwfzFk
X-Proofpoint-ORIG-GUID: gTNzKoSwFOCeaqKlnD8Tp0joSYGwfzFk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-09_07,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=673
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109090116
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Pull in fix for CVE-2021-32761.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../recipes-extended/redis/{redis_6.2.4.bb => redis_6.2.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_6.2.4.bb => redis_6.2.5.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.4.bb b/meta-oe/recipes-extended/redis/redis_6.2.5.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_6.2.4.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.5.bb
index 0db71240e..58d759b59 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.4.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.5.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "ba32c406a10fc2c09426e2be2787d74ff204eb3a2e496d87cff76a476b6ae16e"
+SRC_URI[sha256sum] = "4b9a75709a1b74b3785e20a6c158cab94cf52298aa381eea947a678a60d551ae"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1

