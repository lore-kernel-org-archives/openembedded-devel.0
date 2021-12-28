Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3110C4332F
	for <webhook@archiver.kernel.org>; Tue, 28 Dec 2021 07:38:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.36235.1640677108887709706
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=mbDyfBE8;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=7996075b3e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BS7WuaH006339
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=/ZCmjDryZRplyVMT8c8PuWtYlp0AT3G13Gg1GJIfl0I=;
 b=mbDyfBE8xXYAoV+Fzwqap7PwWstldyh9WsRlhkxWWb9ao23SZnOJlu7w2P9utTs7N1t2
 wkcWbFSt9bdCu1i4VJI7z6tE+VbXW4kzFRCr6HHhAkdbPuiaz5bVrflKGiYjxn3/nqDb
 ESF10sk3LSPkF62aqDh4rILxXGxecjycoINrsvy73yrgEzky7lqKR5UqLfWQQWNy0xay
 SA2mQxo34fAKL9L50p+KCfvpLp6dOMZqq4lt76JncV+B7hkoWavMlEVk/nMJio6jK4N+
 Q+P3fnzGpm/iscAKszTclfppFIEezf0vI7hSm69Ik/E+Q6R385YPNCaNWrnhmYH1BIYj nw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7m0c08au-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:28 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BS7cSJd015340
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:28 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7m0c08ar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Dec 2021 23:38:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EEHUeDDomDWcejpi/MORYsLp/qYshlT2ZXPnM07LCkrwC8w9CMq/l2gjbk5zIoQD1blyzjsL3zOj3XjYHMnw01wVC9Rbpu/Zt/V8KGsGRd1sWIlkd/ycd6zwqa7vC2tdEbp8Yi/4h5/0BlgVuIU4rkiJIO84rn/vZmHfwt5TZsvIrVyWvctzztXBRywp6BdVCZpz4xRS486FKCIobhLaVJGaq5ZMll34DvpFTwEOUxaSJDWsXYB2waIixLHccqfrtd5bRu9KlFh/Co0Ks2fa8VEbVt86w/thqUP+sv4UkHo+dtD57PidM4NWOzBDQa6YRu8KkJsdYcohnJ4R9g6BWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ZCmjDryZRplyVMT8c8PuWtYlp0AT3G13Gg1GJIfl0I=;
 b=XhQ/voiZ22hU+BioD53rzTCsyCTdID04uaSCAOnQqg2O5tXsrWW4+JBbKZcTtGHzruBvopkwzjAvSmnIuRXLqiH9sQcqtTJ2KA2slPdjDmZkY4vzygTGtIMv1CuN07O5M/KhKG29lxP4kgw6y/KOFTcd1lZFoCl98t6dwY/6kq3EpCpOQagyZ7rX4vxvWNr7dnNZ027OGx7AFzhAYo+ecTPvn3Y94EpDTxObvT+3sNQsTmOWa6z3SHAE68EFbBNp4FtXNMfLmcnqQpLp6q1JYjlTDK3UeObsAK0/HOb4DcUGIXB446JCAcDeR1UXTgF4+wv8vLY8TCL79XhwmVPnFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1584.namprd11.prod.outlook.com (2603:10b6:301:e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Tue, 28 Dec
 2021 07:38:26 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%6]) with mapi id 15.20.4823.023; Tue, 28 Dec 2021
 07:38:26 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Subject: [meta-networking][hardknott][PATCH 06/19] samba: upgrade 4.14.4 ->
 4.14.5
Date: Tue, 28 Dec 2021 15:37:53 +0800
Message-Id: <20211228073806.868759-7-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228073806.868759-1-yi.zhao@windriver.com>
References: <20211228073806.868759-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0057.apcprd04.prod.outlook.com
 (2603:1096:202:14::25) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77db5450-65f2-43eb-8398-08d9c9d508e1
X-MS-TrafficTypeDiagnostic: MWHPR11MB1584:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1584D4BA700FA2F9BE8C13E7F9439@MWHPR11MB1584.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bYOC2smFxXzQHUJh+aquhUuy4Akt37keA0t3QWjcXdhkAUFpqM+Vn0+T3/wc3c428SXlHLgdZHBNWR3nKvMsXwFikTnebqBypaa3wCB4r89EmNQFhDrgpLzkMoA7CXO97tlYN4ALHjLXNshIWQIQvZIkTsj61liVEZdQeU3OsfG4jWmBgttXsb3/fHlaxqV9A+KUkBfmfvc8eiJ5PGr0DbKSp6lsEDTkL7tGF9keTh3ENBIm9LRT/m7aZaizaBBDZFS6hWX3fHUATN3B9tWckfCobrC+al22bBvBesBmTGImilnz16WPzFx7SoqoGVzT5Kid8LjpkfcPux7ozWSy+Qgrk4jTMfZJGgfBKwq75AkTw5+bjXDibQ5bUTegJ0ruQlIEeeW3lEh7KonH4g4v9A7t6MtHoBFKONsbdFAgF1QCJcWuvcz0P62V6oEqhyQy/wJFyPbplhgBJLqiqzW/iSDvGiHgVemdIQIhaDgbNdxUyDdXR2v3n174JVEKCx2gHRpHiG2KbmZS3b5/F2vCs2YLDgtm7qkCjv/dGeckM5G708R8tHwFPvYYhfo6/w5zl+eiPvo8FpnTgtD+5boCnFN0md2TpVELpGEfewpkVh4C1qaIspGhKFQWsT4q6mJoWZE7+zZ2OSdg7ZW/kmflxC7ZViQxiMaySOCkM3I4+v0CIgp0pfn4lFQOZaxRwqBTF4foHotC6P2kheKdn+LJG4Z9T9abNR0aNFnK2IBXUO3ts7CtjKkuAIPRL2Sgo9rN0l7Ybct7vIGXGdDyQIuEu79TzCz4N7xIkRbfF5i/kT4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(66476007)(66556008)(8936002)(508600001)(83380400001)(2616005)(44832011)(36756003)(1076003)(6666004)(8676002)(5660300002)(52116002)(186003)(38350700002)(38100700002)(966005)(6506007)(6486002)(6512007)(2906002)(86362001)(316002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zkqU80En8bcwdUeo8eaScq1oKe4OUJGssKr31PF8Vsi8ZiDf4TFvHQLDYJgH?=
 =?us-ascii?Q?nXp/2AHPeVOeUVC+CVXtirwHVvr83o8nYamX38yZIHyEoIQJJ3soc7LZfyfM?=
 =?us-ascii?Q?IBSXoLsYuWRUutsFr8Ekt1ii4nCAIZGySthW3KprpTubgvwd8pn9tABGz9eu?=
 =?us-ascii?Q?PAGxapiGWksI6irK+Hd0VpkCivi6MaAPDpkPshA4T4eQkOgdxuTspsxQa61D?=
 =?us-ascii?Q?f5L34a9kjpyhJZuPOvg+9sRr0/O8gIcV71dUstHMhA9yu0ZLkfRFfg+hJdaF?=
 =?us-ascii?Q?asbLauvPQvbAa5lT3/rYVbdXkbQGvyUz2GtdauhUVY8arOMfmhJavu3hUsCX?=
 =?us-ascii?Q?oHp2MWuhEk7U2rih25QODDVCBBJDDHjOriPCFW7TYgyzN49A5T3SGWcUk/2l?=
 =?us-ascii?Q?F+gWWTcK8aWF7EgjNmA7nUmVvV5fYwLSSkYzuCnLavny/in56Zb8P4tbopdg?=
 =?us-ascii?Q?+dnSTHQvdG+vO0Y+5lttydOiCoXxi6YUWJtBkRou1Eqo0JHx06Lo2bsENgHK?=
 =?us-ascii?Q?ItWaEXEv5LgTZ7+kOyJW0XIplNHIYxaDQVU3uQdrxSjhG1RGJf6blqBMwHFJ?=
 =?us-ascii?Q?FR8rmHsjWC4/rVr0m0kJH6lvOK72TnRRP61XFLBDYZzp3/1buvIeTGMY4VU7?=
 =?us-ascii?Q?xNXJALA/DGRvruWOANp+0weWvoEga6lNS+Xiy5/RB8VMYcMfXoubg0bLF9aa?=
 =?us-ascii?Q?1AcogvgfsoObcP8/p8FC3q5cT0VDOSHBS0fATWCcGyMtXYf5sntuwYf+Oijw?=
 =?us-ascii?Q?8PxLSed9qISJg8k4ev4u/4md4Iq1Z2b/D6T5f7LKvbvFZDJ0AgX5+iNwaa6R?=
 =?us-ascii?Q?X5IE+LK7R5c+FHQWE9so5685DPeWXvaRaBLLX4dTxRwIKskUyJab0e0fYIu/?=
 =?us-ascii?Q?4iSpmpN/SvaBpVc1BoDX55DPZtmLpM00EPYS7QuQCGSjTQUWtuvFNjIo7FfZ?=
 =?us-ascii?Q?bvM3m09q1yRyFG/qdHK2PBSJkULdkS0JKl5t1Lyl0+Yvl2Zbnog35LeBbaNb?=
 =?us-ascii?Q?Euu3RSK9U3HygL1IRtnE/sxvcWUwwC7uHlLqZtZeslfLvWhluPc0LvFKxFED?=
 =?us-ascii?Q?rsOSy+PbkdemG735+18Vxd/uYtGEVHGB3ONL6ROGOVGwkO2zPDsTJJKX6Uq6?=
 =?us-ascii?Q?aSeINKvjhbTEir9SKSDugr9Ii1OrSCdDGQXqg2SPsa/VNMkuDItDyRFAfyBK?=
 =?us-ascii?Q?qedr14gfrgKkDss8Ms87bQZqgeHvub4/PhFpteDYmMbSL4ohrN+5V5yV6LnB?=
 =?us-ascii?Q?UMkYUZMJ6+JlXMfTyL+zLxtP+tHg4cucM08xk4pl88ZXiZGbmbDAHWNTsjT8?=
 =?us-ascii?Q?cgpRWgldhFfYYAKYupVfDt8faD/jJTZ/tPfOqoWN0YGFxrs8dhsIrTl9ymtZ?=
 =?us-ascii?Q?iFfOsswlHniIAfA/jjl1UPopSCdsk5FtAVBfhTQGt7Es6OIIb1GswBx+Aq9v?=
 =?us-ascii?Q?RCjOxLNO6dPVAOWKapxq80RSKNtM0jIsWz+lhjirP7x8m2AYUcwXjCeKo3MF?=
 =?us-ascii?Q?p5hlPyArmvS+6sOoxpITFHqCPD/FbnUlvsKiS2/+cgCbY2XaIp1O1X05/6pi?=
 =?us-ascii?Q?zUu50os1lLk+dNEch1wHcMPsdKj0j6qvlahQ7+QL589M1ikA+ciG/jnI3XlF?=
 =?us-ascii?Q?W0Lh11VO5Cauq92CYL7R8XY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 77db5450-65f2-43eb-8398-08d9c9d508e1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2021 07:38:26.5542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ArX3aFBJHzo+UXkTbfa11aWuXkX4U1byhkZmvr+tiOuA7krWjCjq7YyUCAijlb2hD56SSgnUVvLmh548BliNag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1584
X-Proofpoint-GUID: U9Yns0KC__uMkYydk2n1RLxeodc6Y9EB
X-Proofpoint-ORIG-GUID: bDBj4YzXJuRxY49Mby-NgeZX2GEcYyzN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-28_04,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 mlxscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112280033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Dec 2021 07:38:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94533

Changelog:
https://www.samba.org/samba/history/samba-4.14.5.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../samba/{samba_4.14.4.bb => samba_4.14.5.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.14.4.bb => samba_4.14.5.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.4.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/samba/samba_4.14.4.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
index 9b56a6280..efaf4f2a1 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.4.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
@@ -34,8 +34,8 @@ SRC_URI_append_libc-musl = " \
            file://samba-fix-musl-lib-without-innetgr.patch \
            "
 
-SRC_URI[md5sum] = "171629ad42b4b303107e8b0fff942a1f"
-SRC_URI[sha256sum] = "89af092a0b00f5354ed287f0aa37b8c2cf9ba2ce67ea6464192e2c18528f89b9"
+SRC_URI[md5sum] = "96d275e31387e6c403d6c16465d15b7e"
+SRC_URI[sha256sum] = "bb6ef5d2f16b85288d823578abc453d9a80514c42e5a2ea2c4e3c60dc42335c3"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.14(\.\d+)+).tar.gz"
 
-- 
2.25.1


