Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D585BC04FFF
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 10:45:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17094.1713264322554306089
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 03:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XaipJxF9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=483622ef1f=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43G4P19Z027625
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 10:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=tjW4EgxN2GmmPrzsQVWBuCVg++90Uvsizt0H2AwOYAg=; b=
	XaipJxF9kgY3OFhTwihsp+958lRGBkGEggVVRE9uWimD7gVICWUugnap9qM14cti
	CBd1MsOUur5exUaqMvsjsz2RGelTupyU5uNRhC3oRmfOKYgoOZGobzWMIzW2Wn/e
	5IEJmT4DrET7zfdQXu7WscbMRwhUfKOGl3fq0gQMcyF8hdPdggvsgxMcucq2M7wJ
	YLIA3aOkRtgobNZKLGWONb841G4nL+dDU+th7Phicb81tyzzdOQ0+Kcz4O+KsWqd
	yERsU6kR0PIPYdKsw/OMunYouLVq/szCigwta/dyVTCsyzaPNyqf1N3rAbtbyJKy
	D03paq1AeVMvE/WPEnRvJw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xff8yaqts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 10:45:20 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 43GAjJqY029695
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 10:45:19 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xff8yaqtq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 10:45:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FgRMcUBYRD+s061WRW6wrdvxMXSdc/VEDdJmkosdNsUsJhh4MVySMsUuToCABd1AxhpxdWPLUGl9qRZq/r+/AAgVKDQM3nPnI4rbGnGXilXTClxog/59Hu6Qde2WgLrFOJDUz2EGbXHO4PgoxwhOa6aOp0IceWyNAReDhEXnzoIAeWu/VK5Q0Bl9E6svEMLtA825kbacA+wCi7Fjrtp2EZePNFoari9F2/73cps9ZR1sio6XH8ypqdDLhvktunxKZlpWOL8McIFPTh2uySswMVmsMKqybItZX/AXT+lUuReOVkK4wx67tg5pLqS8ceZuEp9pmZhq2PSxSFoAU7xWwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjW4EgxN2GmmPrzsQVWBuCVg++90Uvsizt0H2AwOYAg=;
 b=KKoch7BbHlZO1YPyo5OoL7KmbejnJxlQAvql3O8qeHUqsxITuOyNldz1OkhYqlHvYQm87hGT5zEV2hpIU/ANjCcEWgBMvvgNtNZZ8boTvKPX6sCh0it4bVf3drbZiIUp41W6u31fvvGO/eA/k/PJIOGJJCTd0/sbVX4mphgWdfVsInxroZm60RnyhoPPgIBxYQaSzmY1QocPyxDBh5GptXjmezgJ5gtOW9/Y2UrQvnG/IkwsIU5g5NnGMpw9uG2iJ9FhsgkkzSRN4AYM2ilZ05Ukc6X2XEDgYDY9LLX9qKihmTrE2KwIjKQ511uYaf6Ln+wkLlamQSX3p27OLNn38w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 10:45:15 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558%6]) with mapi id 15.20.7452.041; Tue, 16 Apr 2024
 10:45:15 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: behzadshaheryar@gmail.com
Subject: [meta-networking][PATCH 2/2] snort3: update to latest stable version 3.1.84.0
Date: Tue, 16 Apr 2024 18:45:02 +0800
Message-Id: <20240416104502.2401209-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240416104502.2401209-1-yi.zhao@windriver.com>
References: <20240416104502.2401209-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0054.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::23)
 To DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|PH7PR11MB6771:EE_
X-MS-Office365-Filtering-Correlation-Id: 6280a20f-9862-4a08-e745-08dc5e024cb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CrVphjzSYSHQZpBtVBgkfDcHgIl+T0RgjQC60gtjViPIWYbOd081wpJCJiJWPU7C6uM71/m5wl5POBrqfbjz1BD0q77k3pXwapX6kznkxYkNLIenvwtqbpUB58LEGpSCLsFuT/VJpVznMR2Ro59+PgptZSNOftWW5kGhMLkfg8TNnL84ic0ga63ZN91BAAsfQuLKfZENsXCnFvKlflz9bS/DaeEzTOUViYz3dXkRgwAdHG/K8sDaKXLtYpzaCUmFEevYMkGbe9UerA+4etgIeCYKIHwFWOt+ahO1IiL234IKwWbux0eYOVeVjbi0y6Ca6BulW9jCVpw2FMKS1lcIiVr7Qu8/tofaPl4gF1kU9KJuQoUIWharSnfkTIJtkrtmeOQTkkwdSx+B+BbWSFiTl4zPzIEGlRMbdvQXY2NqyauajxYXy7CsDo3XiT8Hg6RLBlzlJg3mtmwEvu8RWGIYXZkOSRJdXOXroybd3e2Xk2/u5U2xTCKib2JH87Zc45JVcNWmz/MOcOfKiDD68KKHhGSCMD/K/+LH5E6TaJtEhXTpGPpyWMqOnPVWpOEKAfRGWlc+5BhTE+zLMpymWwMPQdoJN4D/mET2eC7wDb1c9N1oo0gS9KmkJkq1jB5KARq/sYU9tAewiSj0IAxQoH6E+kKm8j9r3eM5aFiE1DD1tFx8Cd1CoqfTdirNU6mBgBoDz2GWQK0Lk5aeYlNhmyUXy5QIlYI24JEeIRkDGyJkDf0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(52116005)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cPHn1umliKe14rjSOhCTAADZ17s44iH6OJoY6KFXCg4yCzhZYCsvP6RSiVTg?=
 =?us-ascii?Q?goSEaCBYli1/B8Kd0MJ40m3oOBegBUjt5hz8FJFT4Ao2YGQP07wlqMZjROn9?=
 =?us-ascii?Q?P6dqtI9Q7PaluDu7DsIlNYXL2o0LYA0CcUB2fbaS2NgeSIWK4U+LYIyyPTfy?=
 =?us-ascii?Q?AKu0RJc9y8jv1h93KINKuS11TDcffQMzz3oQi0y3QyW7UD5qezJU64i5mAzJ?=
 =?us-ascii?Q?0ENNimEaYKS4yOT36HuyjBiWVE0pn3v5LlRucLvhV2qBNG1jwhJU2+f4jWKk?=
 =?us-ascii?Q?POXhFLqFB8UO0gho3oOZ26Xki2eidtA4Mc/mJm/metnFh6b4I3Q29Dcjd2nc?=
 =?us-ascii?Q?lydKl6A8uCYX6p9UCN/LxCsri7WfRtx2LxS2ittmBWZsNb/NIwBJ109DisM0?=
 =?us-ascii?Q?dr86XQ7xsmR4KZcpuJl550oSViGCF6avLw2Ng2ff8m8UMMzBeQ10ZhtgYbPW?=
 =?us-ascii?Q?smhN19hDcogG1Q4/mDVaOGfiM+mS3oCnd/oA/wWQ8fvG7VVBm7ukx0Q29PG1?=
 =?us-ascii?Q?wH2OVkkOLU5YzhhzY9lpXniGori1D4otFHe7pVDpp02kH1Z4bVAkYjWpxwXu?=
 =?us-ascii?Q?y27YWl8qqYoKrFpT1ApjCudGLOc8gQpfV3lLNPiaLRR84QqQqzMi1FeIgSff?=
 =?us-ascii?Q?/e7QKs5w4Oa5Iu/Zv+VGsz0ok1Rios5UoKw0lve1C8CRkp56R+f68uw3MkVS?=
 =?us-ascii?Q?pAdNeAxbpCo2V6x/GnVvAObzwR4baObP0POBmS+uT9oeiBzcuoM2T+ajjRAN?=
 =?us-ascii?Q?uYnxp8j/li9IrLgB47TNEUgvBelbG1SRPNsk4hOm8EyfX7QyxZYlVgLklZIh?=
 =?us-ascii?Q?JqoCAk2oRUU63LO/GyTVMocnWAf392Y/1RWo0xcQkazPQ0tFql8aN9lM7uwv?=
 =?us-ascii?Q?x29ehZmknQNMRYvzz7kUTstGPMXvKL1KOY1ggkK61TIIYkyKJbN5vGAodgeF?=
 =?us-ascii?Q?A54R3SbPWSoJjade5lJQJr4vQgBoGIaHFPUH3+EO8RJ7kdRMzRH5eYyB2vJe?=
 =?us-ascii?Q?nnwrYDiccRxDdopMp7YXz8kd6QRhYlGc3oLitseozddU48j/zTLFyFNUk877?=
 =?us-ascii?Q?6J5ECTqswCfRxvau5pqLQzDXSiSttK4KempecroBUmoFb7NjQ+YaFQsWF8nn?=
 =?us-ascii?Q?Xu7QY2O1RmeQdr0PuYHTgW3GaW4xxeIa7NhIEq7VtrI2GnOVSsDLii93yiVD?=
 =?us-ascii?Q?MaNcoqCTSq3i6UHH7i9STQ8eQEAjpDCJSmVce2/cKYVJ0BvWnxI0uT8OFh10?=
 =?us-ascii?Q?ej1NyTTu7B8imwXDNysdIvbI1dQWEAIkUYqZytqoz/woG3O6mkZjIfLUkwYr?=
 =?us-ascii?Q?l4ytacw1UPXpyhLqIqd3latZvDET2jwAKjfKRmfacweAv+Ij6ct9tGSFffCn?=
 =?us-ascii?Q?yGfsx2QEW7PHMEGVRoVovaBibqMEitA2f4wNNOcxa7YCQ1LyrIBiO9bvz/PB?=
 =?us-ascii?Q?BszjusuiCQYxYdTpSlAX5v4fPDIH08zovx3Qb5a4kuC/pd1KtJWMJa5ku6+O?=
 =?us-ascii?Q?mrH905FgfT3u5lu4EWrTMqqHN5iKmc2Yp/FBNgXfPXWly+Gr/MdLmOqZbBtN?=
 =?us-ascii?Q?8tfi0V/ns1i6MgKtAoByjfUaJb5HgjK+4ZzW3bmF?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6280a20f-9862-4a08-e745-08dc5e024cb0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 10:45:15.0650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cxp83hpwtVtDczfoQt1z08jJjrTKWeCRHPzNTW+6yFBrpQ+6pptVnM2Ft5ydVPYKjeybDsP/0jUTLWN4vDQTEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6771
X-Proofpoint-GUID: WE0j8v2pmGMJX95pTk2pP2H4bwSgm2iO
X-Proofpoint-ORIG-GUID: lZA74vWVQBSgbWNZ9HIgwy9WrL32-GC-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_08,2024-04-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404160065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 10:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109974

ChangeLog:
https://github.com/snort3/snort3/releases/tag/3.1.84.0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../snort/{snort3_git.bb => snort3_3.1.84.0.bb}               | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/snort/{snort3_git.bb => snort3_3.1.84.0.bb} (94%)

diff --git a/meta-networking/recipes-connectivity/snort/snort3_git.bb b/meta-networking/recipes-connectivity/snort/snort3_3.1.84.0.bb
similarity index 94%
rename from meta-networking/recipes-connectivity/snort/snort3_git.bb
rename to meta-networking/recipes-connectivity/snort/snort3_3.1.84.0.bb
index b8826b068..ee84aa17e 100644
--- a/meta-networking/recipes-connectivity/snort/snort3_git.bb
+++ b/meta-networking/recipes-connectivity/snort/snort3_3.1.84.0.bb
@@ -5,14 +5,12 @@ SECTION = "net"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=78fa8ef966b48fbf9095e13cc92377c5"
 
-PV = "3+git"
-
 DEPENDS = "flex-native hwloc libdaq libdnet libpcap libpcre libtirpc libunwind luajit zlib"
 
 SRC_URI = "git://github.com/snort3/snort3.git;protocol=https;branch=master \
            file://0001-cmake-Check-for-HP-libunwind.patch \
            file://0001-cmake-Pass-noline-flag-to-flex.patch"
-SRCREV = "e1760a8dbb829bb3fcf1a340ab6cc4bb80a47ecd"
+SRCREV = "e7312efd840d66a52a2019abe1db7cc89ca0f39a"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


