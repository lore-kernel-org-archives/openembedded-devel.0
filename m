Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.73])
 by mx.groups.io with SMTP id smtpd.web08.2718.1627499768102552643
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Jul 2021 12:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=0OVD42Yg;
 spf=pass (domain: arm.com, ip: 40.107.0.73, mailfrom: anastasios.kavoukis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lR/4pRwHYiInBLA2HVHFjCx2PPguddc3uwMMCoC0tA=;
 b=0OVD42Ygw9gW7OZltloOyxGx4EeR9AnHyyQBevVSjETLYzGXYKCjxP73vw19JnYIFsX8ko+KTIUSLKN+r0JHIKyu/ZWRXVDhaST05Hc605BifkrMllwGiFYSq1Y6EFEnCpTJeCnBFgfG3q/K/a70uA/3gYo4ex9VBf8zh8ttgtw=
Received: from AM6P192CA0002.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::15)
 by HE1PR0801MB1898.eurprd08.prod.outlook.com (2603:10a6:3:49::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Wed, 28 Jul
 2021 19:16:05 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::ab) by AM6P192CA0002.outlook.office365.com
 (2603:10a6:209:83::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Wed, 28 Jul 2021 19:16:05 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass
 (signature was verified)
 header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=temperror
 action=none header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Wed, 28 Jul 2021 19:16:03 +0000
Received: ("Tessian outbound 1942ea606101:v100"); Wed, 28 Jul 2021 19:16:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 56f091cf22232aa3
X-CR-MTA-TID: 64aa7808
Received: from 9c7114e7d365.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1D2559BF-47F3-49F4-A561-06B08712755D.1;
	Wed, 28 Jul 2021 19:15:56 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9c7114e7d365.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 28 Jul 2021 19:15:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ntgArOhwOI6uxD51wVIIU3wad/2wW5Zij6a8UIxQYd7NSrQSUxH49zMKHzEmwZrpFlErG/z30u36u1BBZaAQ8iu2yB77rJKAtaBDtooKH59/OHmxzARnTEre1kN9tGpA+ISsm8L+bp2flUa+6HZROFQGD0NyAxWdFpZli5Mhxqxzl0f6ATBlspbH15wPKmWcmPGpC2gVTElDI1yn09EGB6ASpOZeYlcLxhNrl6ABsR4M5AGptY+V89iaSsDem49glB46BzAF4BAu7ocIhsZ7nAouhU/4XHmkLs+PriapTTs3QoCJaCH8yJ7W4l/0c5iM0u1J5fhU8xBcEzMdwAj6yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lR/4pRwHYiInBLA2HVHFjCx2PPguddc3uwMMCoC0tA=;
 b=Wi+XkeMJsDFrpyfT2wzz8MZhH1YZzFK3viI6+VR8z6r2mRUHb+jqqfC1UDQ0oiXRtLN2R+X7dxGnWWND4KX5plzqDY0hxTBcT7BHK0kOw4ajjgweJ54B8Q+W7nhYGxAiSzlqcE279Yjk/fAlscMWlbDbP7Jtk6JvPiiZMQ/r1XsAFD5RUf0QPIlvwfFJ3ivgBfDValsAr51teipdnIPa6Asp1mF6BufyPZdgZ5GAa7RpSAI0zj76BU1Z7GhMlbDfKmdP8cGVhM7I9oDKkcv1y2NxmI00l9gqNr0FS8/xpcSGyfDzVPhhoR91qJm2xfbEP4kUWWRMThoW4CEKtFDIjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lR/4pRwHYiInBLA2HVHFjCx2PPguddc3uwMMCoC0tA=;
 b=0OVD42Ygw9gW7OZltloOyxGx4EeR9AnHyyQBevVSjETLYzGXYKCjxP73vw19JnYIFsX8ko+KTIUSLKN+r0JHIKyu/ZWRXVDhaST05Hc605BifkrMllwGiFYSq1Y6EFEnCpTJeCnBFgfG3q/K/a70uA/3gYo4ex9VBf8zh8ttgtw=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3082.eurprd08.prod.outlook.com (2603:10a6:5:1d::24) by
 DBAPR08MB5654.eurprd08.prod.outlook.com (2603:10a6:10:1a6::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.28; Wed, 28 Jul 2021 19:15:55 +0000
Received: from DB7PR08MB3082.eurprd08.prod.outlook.com
 ([fe80::1974:4217:8e30:94a9]) by DB7PR08MB3082.eurprd08.prod.outlook.com
 ([fe80::1974:4217:8e30:94a9%5]) with mapi id 15.20.4352.031; Wed, 28 Jul 2021
 19:15:54 +0000
From: "Anastasios Kavoukis" <anastasios.kavoukis@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com,
	Anastasios Kavoukis <anastasios.kavoukis@arm.com>
Subject: [PATCH] [meta-oe] pm-qa: fix paths for shell scripts
Date: Wed, 28 Jul 2021 20:15:47 +0100
Message-Id: <20210728191547.13307-1-anastasios.kavoukis@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0200.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::20) To DB7PR08MB3082.eurprd08.prod.outlook.com
 (2603:10a6:5:1d::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e124468.arm.com (217.140.106.13) by LO2P265CA0200.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9e::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend Transport; Wed, 28 Jul 2021 19:15:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1420ba3f-efe1-447c-cb6c-08d951fc2434
X-MS-TrafficTypeDiagnostic: DBAPR08MB5654:|HE1PR0801MB1898:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0801MB1898CC65F78258AF5837ECF2FCEA9@HE1PR0801MB1898.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:167;OLM:167;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 b+A0wEvbJja5qVk5tzdMrQPT1IQWxh5I1uWr2k6QCcH0LJaCGuQ/4p4vfzppu7gEHmx7BzwhcepuuZ/SEVcmJXA+fPWBdsP0+Y1uy0zNznbImDd3SeSwyMOnDvlb/XYedDt5craxevmS9gZz1KUP+UQc+swGtLB2nhJfInpKYUvqtJHOmeJKocjjmCRl34+fKIcIXc1gwaGfYzv2mVWfmP05tBVPQWh5aKvaeacGrL6vAyKA3TPGJg7+bkthjDitUZvx8Oe1Ult0g4rvLUGOxlNkrPqlhWwEhN3PxkCvlwZMD8scIL6Ven2mq2USUXEztUwEu3vNQK8k1k5V7LFyPbgY1yXLa2nfepGFkM0tLjPjDCqA4EYYQd+F+XilJCbhxWFByOLzsohNwy+OB07jtERutWjK1cj5LpZRr13HbAe8VVuSf629AwNCUO+cuSMLEsI1/N354SPN/J14cOwrCNZMeo+5ihQR8KpXNgInSZI2R5DwQnSv880NO5OrpUYNAHzqwUz9KFRX0jtkd9Drx58A+RFuWGFa6idRxl/ZMH81AWiERIvcCpXfX7xP67fkUsf/Jh3CldGb3GCix32mgwgMT1kA4iEVxsbSfsziXjvpyKnEjdMrRkk77QltO5Q7bxEWqd2yZSSkNenXCfL4D9sCbVLWspu/WWH3QY7+hb8yIVp0MAkmPYLv3uuJm+Li3+aCmfPT0RVq0GVfUw+8fg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3082.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(2616005)(7696005)(956004)(38100700002)(1076003)(26005)(38350700002)(6486002)(316002)(508600001)(86362001)(44832011)(2906002)(8936002)(66556008)(186003)(66946007)(66476007)(4326008)(6666004)(5660300002)(6916009)(36756003)(83380400001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?/A5DQOsM+eEES4Eo7dT/yF+aT+WuL3IRQZPtMVZogaGAGYAfmvNKGhVCAC4C?=
 =?us-ascii?Q?XOp5xqFiP7Xua+SJHDG8YypmGEvxlIEY0E4HZjFmWLpB5VCu9sU3n1yr+Y7v?=
 =?us-ascii?Q?/QPxqyMwYfHrYL+8085icfnEXWP7GblSnbXlG+m8EWlP5UWGYoEgAEE0kpDC?=
 =?us-ascii?Q?AW11yicfgbHhj2XVh7AmovvnCjqp1rkKzHs9e4wVd0G91dKhOF/Z01ZtaAxl?=
 =?us-ascii?Q?L+O8oNbZg+u9yUYZS9kDm5Blp9+tTkXCUA39ClBFvyX1CTWd8CYL78aqyb3G?=
 =?us-ascii?Q?vHIyzzX/M2pcMEEiKYX2K+Vov8Xcz+jq8MasqVarfLzJK3zda6/1sVqghndc?=
 =?us-ascii?Q?AuGxk5NoeQicjhq7o1hg1bDeqsKxQAmmAXidEKH5kUESsAt73DB3SGP/5Dwh?=
 =?us-ascii?Q?jJODOcHS69BuzeUg5CKYxlasX4tt82QTT+NM5T2Ih6Qlp/qJ8HJ6xWdAGbc4?=
 =?us-ascii?Q?NWH4omyfoqN7s04LyKraMsyTmy6bsUuXnW3OMEg58Evf5PmvPwfnzGIIOb6q?=
 =?us-ascii?Q?Y3SfuMwloUkQoe/H7MBL7zcfPruUJjqGLOuCVNS9lSgjqONge5JsDN+b0jCi?=
 =?us-ascii?Q?Y5McKB6CxCC0nz6kr+zgQ0YGvwd+2ZBcSTTU3I9qymM6DvXaXNZ7yWCrETvL?=
 =?us-ascii?Q?2X31KH+Rh1Oc3r0ZGjhkV5qcyCyOhlo5pClwO2FQJSWitXtW87zjHmBioh2t?=
 =?us-ascii?Q?Qx83LP/54C2LcPRPJsy6MPQ7hqN1J7PesZbrmv/ZChjiVxOJ1kVhIdDuvgqa?=
 =?us-ascii?Q?gKJWFF3EmDnFF2qG0+UIXIAfz3FBinSMdMKawgZRQ1ZvFIu3c+0GNxY38ljX?=
 =?us-ascii?Q?bHCkQFAPB+8mif3l8o1vcMPMFFZqE61V1Lb6OYRN+XnGHUCK2MaCmwawxuYZ?=
 =?us-ascii?Q?NVHlolHss5U1F1d+bswDhkvRMJHwoi2Q8m7Mw/zLL71lnxd1q/A8f1IrFVxp?=
 =?us-ascii?Q?RV0o6gOhyF8FaICdgbjVHsJnpkkqJT0m0HIkfPYJq4gwbSKcREuJjgY82Wr2?=
 =?us-ascii?Q?heG3ce9aSOUqnL2gt2W0w8V/d4EMcHKqxnt8DLlqrJ7sdtobrGWeItUqihWD?=
 =?us-ascii?Q?oich/9D7n9wwUB49TSRD/0U9hs7VOdv+uwGR0SJa16RRHXP5GBCPytmEATlu?=
 =?us-ascii?Q?UqZvKvSylq92c0KYxdYtskOWG1aVXf/EbtjB+T+EtNrelBdf4dfOTP7yYeLG?=
 =?us-ascii?Q?8N9nUwdp9YXwXAoIP9Li+oAUGCKX3YREqQa6cdtdUzfkXpj15z59kziAPdxD?=
 =?us-ascii?Q?sneUk9aH54H1G+LgXZNzrFSgD01q1Pph6NnbPItL1jHaF0J0YNJUS7Dmwvid?=
 =?us-ascii?Q?dMDYTQ9Ypm3JbSAIWYQwL7gS?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5654
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Anastasios.Kavoukis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	de2fe280-0522-4f29-69cb-08d951fc1f47
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+eYv9wi/g7BWF8O3W87xPc3mE8KcrsGxxq/AH33Dyt6phC62aDrBSpfd/0Vfzy+zlvmARkLR8UaLRc3WjZC5zAercsVPmtMis0cBmaEqJDAnszjma61iIiRso4I5fannxaxPoRcPGBQpjAl4B19n+vC+UskIJXxDN14vbouvKp13jYivwNoGoWyTXxtvPrNVgwXQVVz0Uq+39fxyiD3iuIr+9q1xrMWgqitw896y6aL+v7QOd758JgQ6BrLLiaFOdX0HOb9E2b6xLSnEH+kE/4zvMHoNHGnQDr4u3ZNY0byftrEdcTmqLl6bSdRwvw+PcuMSySRS4q9IsxXlJ4+e/Z+3rYP0sCk+82Db8zNnU3ihQCe9ldgZyDrNCqScqdOC673n7OkwH9Q43F0VMYmad990aA4ysaHjpMwh7wI1+tZoi1pRiqB/+FSczqqvRDT+ekuVV8zE9lIjvvTLRWjsSK4vf8B4V8hOXDh0nf43tD96bg1K/3lVSp9PY55lwG8ZsI7/vi5oeo8loqHqhuMN5gYhFYCBXkE1yhWDK8OTIE9M8lu+2DHG77ta5r/hUj1zWnE1E8vQuRrgSUMduBHRNE7hkVbWj8zrdr1X08gWU8OSO1CX6LQsgwtqAF4Cp9RDe1pbaqVbhEtrnRviiuj4BrWi2AIqqYc7zWBZwdC88WIneHVZaJPeCt5C1TZjdd7x2wCl/H5r9PQCNfIEEURsYw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39850400004)(46966006)(36840700001)(336012)(4326008)(6666004)(6486002)(63350400001)(63370400001)(82740400003)(8936002)(36756003)(1076003)(44832011)(2906002)(86362001)(478600001)(186003)(7696005)(26005)(82310400003)(47076005)(36860700001)(81166007)(83380400001)(2616005)(8676002)(5660300002)(356005)(316002)(70206006)(6916009)(956004)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 19:16:03.0094
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1420ba3f-efe1-447c-cb6c-08d951fc2434
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1898
Content-Type: text/plain

A commit in the repo of pm-qa:

"adf9df9 Fix path to library files and change shebang line"

Changed the text that sed was using to replace relative to
absolute paths.

As a result sed was not effectively finding the text
"source ../include" to replace it, as the sed should be now
searching for ". ../include".

Similarly for "../Switches"

Signed-off-by: Anastasios Kavoukis <anastasios.kavoukis@arm.com>
---
 meta-oe/recipes-test/pm-qa/pm-qa_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
index 7e9971ea4..9a60caa6d 100644
--- a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
+++ b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
@@ -42,6 +42,7 @@ do_install () {
     do
         # Remove hardcoded relative paths
         sed -i -e 's#..\/utils\/##' ${script}
+        sed -i -e 's#. ..\/Switches#${bindir}#g" ${script}
 
         script_basename=`basename ${script}`
         install -m 0755 $script ${D}${libdir}/${BPN}/${script_basename}
@@ -54,7 +55,7 @@ do_install () {
         # if the script includes any helper scripts from the $libdir
         # directory then change the source path to the absolute path
         # to reflect the install location of the helper scripts.
-        sed -i -e "s#source ../include#source ${libdir}/${BPN}#g" ${script}
+        sed -i -e "s#. ../include#. ${libdir}/${BPN}#g" ${script}
         # Remove hardcoded relative paths
         sed -i -e 's#..\/utils\/##' ${script}
 
-- 
2.17.1

