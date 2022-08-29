Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE8F5C0502C
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 15:24:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.71978.1661786675544568458
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 08:24:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=b9VQP1+S;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=6240c2564e=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27TDx4g0016961
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 08:24:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=xpr/t3nKqGxQTx1klmM/0wurPVIBGLrfa0uxwudEghM=;
 b=b9VQP1+SAMfxGEng1qKb+3fIuLic4QgxEkqVGctl9m0ywNr7+D4yCVsKDsc4/vEwyTh8
 Q0t9y3gonM76aQihU/VaKh5zJX8cDMRyHqJmG7Bd/YdH7pyxAHHA8rzNyuWgIX2Lz1tw
 dT9OXbI3Pd42yDgaMhzKTiNQ6wmWRBhpYIj1PcNe6r0of/4SX8gi5o0mqEiddZWSJqca
 KosOP/2bUB/f6L9PCqJTa2vGpbZ8DMxFEES3ZwsKvWPnVtL8zeiFGcAZ9VnNai2CxQmy
 fsg09WVETCG9LZiZs1tnEIsZ69F8bivPh+lcoaS8v1P0J9lWriXSFTky7TjFv25gNpax DQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j7jsk9ftg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 08:24:34 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27TFOYxr001018
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 08:24:34 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j7jsk9ftd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 08:24:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=knRgOJYSzdktmMTufYN4DcPM2B+I0W/yRmmYS+AB6IFLJmG01O+YOf8Ip2hwZ60QBv7ZrMBT2WSNbzSkql0TRz6n/+kAuzcT8ihrvORBqjLcHFmAoD37u3R41pOG/99esVroF3YdLvGewLA35AEH5VGC38o7j99wQo17nREPa9odMCRZZjl7LzWxIIkSJGk2lytBSgxW9lQp6dL93Bmit6ngRSZ3hD+RoXvjtaXnAUQo6dZw8hgtXuMMm9CxFlab5JCa0Nxr3+WQG4tUxCUZ9FV6ZgV6d0MUL0P1mLhmasfthzZom3nUtp1Sxoisj3SV2lYrMIuqwuiifUmUT8F2/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpr/t3nKqGxQTx1klmM/0wurPVIBGLrfa0uxwudEghM=;
 b=UkDQHa21QTt+4GlaZ4uSQCH8lvnY1okB8UDqZP7lcBYKNkUFucFSgzZmQ9A8btsdTDevo/Aj8Alt3l2N7BOA/O4IJPIAaCUFzDqXwL1U/debOGbpfta+drg7NBECYIw3+f8x2siHpUJ2pQMH+2/1/YwyTARBPQprcDyV5kU/8pw2RHOKgZ3cP+6jKvDL2dDr+hq6n5G6So/Lvz1QV1HttRULmU6Q48oY+uj0KdgIFF+B6tUzbU3+7lnLFUyxM2+pLCfrtgWENuLMakATpMPkumBr+CV6IQlKJjBw29uPAZlgUqxIHr5R9TFy6aj19tUnb/7j4v6PL+ntIKPZ3kQwaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11)
 by BL0PR11MB2914.namprd11.prod.outlook.com (2603:10b6:208:77::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 15:24:32 +0000
Received: from PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::d5f6:1024:58f3:d356]) by PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::d5f6:1024:58f3:d356%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 15:24:32 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [kirkstone][oe][meta-perl 06/10] libauthen-sasl-perl: Fix LICENSE
 string
Date: Mon, 29 Aug 2022 08:24:10 -0700
Message-Id: <20220829152414.1757540-7-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829152414.1757540-1-saul.wold@windriver.com>
References: <20220829152414.1757540-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW3PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:303:2b::35) To PH7PR11MB5818.namprd11.prod.outlook.com
 (2603:10b6:510:132::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 020af952-be5d-4986-fe79-08da89d292ad
X-MS-TrafficTypeDiagnostic: BL0PR11MB2914:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eg5008KhGi2mBFN82iXQb9B+XuikzAxdwvoNtrmOiv/GUZDBfejuM0LTbDdQ8cWBh44KvJHBzx669KWWIZ4+PW8hK29E+SlfL6xhXpfMCICrfywlQ+qpedMqPURE9zxnVIr5MSY3kmBZAlO02HUH57RS+1p+Nq19F2Mhf08EUWvhr+ZYh2/DaL/koz9vxWmBj6E+DesXd/NrPWUhfuxZcBZrT4EpzAqpqGBZE8pDLhW6/ptUDHO7Cr/LXoWvzB55Q2ZuUmUx4y0bdgqFa4su948LiI2TnNvXCkBiRR2agvtmlVr6tyRy+EYT037ZNkllsTHDqGfKmxmkAIeGpEa0LdF+I0VTxI6QnzjxeWezkepG4NlbPijRh1AnNCAKInkFvqj150nUTwoKe6v+asNcPF8U4e+Yu+kf6l7IQd6P8oaF/tueEK8NMyOaq7OsHrinUCQbYXNme3MfKlmDBW0uPEiP0DPWbZylHTuRMOfn44rz48JL/5kk+ctXc4GTBS24nYKhp0jqeMtAwjuretg5xjMoK513b8Hg56SNiWHvsQ+RnSm6E3jSP6J4WtTvQ29z1J97cFTfIAVFQ1kD3gJ/fUZvHi+vOefGbkRvH9KlQ3q13dapTz9oIaAWyISdc3HyjpURTfb7ridBe9OuHclNWnXN4+cCInfwQXTFptfMuIrt4/yzpGijCphdn2U6m+bIDsGbx9Y2mjJCLaNdNi9mydJ8ZDqDlpCHEa4MQxq1hcXodLxSwUhKBOVuQrRKmKH9bXNW9R/LPYg/ocO0Ibwf7g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5818.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39840400004)(396003)(346002)(376002)(136003)(366004)(86362001)(38350700002)(6486002)(66476007)(66946007)(66556008)(8676002)(5660300002)(478600001)(38100700002)(41300700001)(8936002)(316002)(186003)(1076003)(2616005)(26005)(52116002)(83380400001)(2906002)(6512007)(6666004)(6506007)(4744005)(44832011)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MjeRtQaB5l6dWLxl4SgQDORT/6wjWGe55WVEvcU5HMG+2GEOLDI7FRkp/nDq?=
 =?us-ascii?Q?Tq1TcON3eCn4kOSakV/Lwg7hL54OsQVN6WHVvQvOJc55wfr79adAvzEFpsbl?=
 =?us-ascii?Q?gQ9kYvvXrCwesL3yOSXNQa4U4lC8UrUIOeCTcf/xd24dRv4fvoGwVZJZ34gT?=
 =?us-ascii?Q?mK031UmR7/KjBRfXporkOOuTdaGX0jxnI7ekcMvHF5PKyzRk+OIuHPhzkrv+?=
 =?us-ascii?Q?My3fs9NYGuba+jVPV+WySRhq29QzYaeLBaIa/WnofKzGbK0gtYy8ehOqqA+r?=
 =?us-ascii?Q?on8EluXSnrnYpAI/JXD4kM+kRtujFdMvSmJgLTW4FjFFpmz0sxfFFmV1NZTE?=
 =?us-ascii?Q?IXpEPwFVFzfGx1RlkmYDcsfKbju7/onoBQIHAC4/q8SbmIlWBl4KXFYlu9pG?=
 =?us-ascii?Q?UsJXUPn/WZ/Sg/CiPGi1mCYNoEaCz1dsO+8TMBvqBmNI/sHjdp0WhamQrA0u?=
 =?us-ascii?Q?Ra++u2FY39FETOrOxkLQgcHMSNwxHSGGydBx4vwljubqg7+MeWo1p1kNLpBb?=
 =?us-ascii?Q?pvU0kFxeQbCNIFLEk5pgYDMoCf1vfCsRZSDv7W1IQ/rUh7/VpD/3kpoINffl?=
 =?us-ascii?Q?mpYAY9MLh9ihe1OMPGxOivX+u9KA1hqYxdDKilDLsAliVwKXppsL4y2JnjAk?=
 =?us-ascii?Q?QRaDXI5UWY7GTY46eQS2f0BGd1R4AXvusJXWE5qH0f7G8FS4Rn0oHYV476Z4?=
 =?us-ascii?Q?x51y52X/wDuo8N3TTvyNKKyoHFa5ICPVBdJq+54lMo1Gkkp0Ic+PK8VDRPq/?=
 =?us-ascii?Q?pL8bzRUhFqeSJ7HAomrWRdbs2g7qXi9dXGjV8PLdatE+rD0fcTRchRqmVNf6?=
 =?us-ascii?Q?l8wP0JHqq327MUVBEr7rgPYm293JSuopd8K5PtksAmUlLgtb43eM47FU2JNY?=
 =?us-ascii?Q?XJDqNhiTMpTDXgomfVVtnSkNr9nxvwEK7tMacNKGE/W82QvOpBsPeVGDSQ7U?=
 =?us-ascii?Q?z+8zlJD8ENMRIvI4Y5PqtleQyvECuNehlc3t7Rtuj35TIIfoVRQrlTw5JqIO?=
 =?us-ascii?Q?5P8oxlCY7mg/sznQ7qiQq6UnTHan3PZq0uPyjwhPwIiWBuPL9vGXDQT292az?=
 =?us-ascii?Q?+CI8eRvkIJOj0CKtoYjeF0Bgfceb+z+qdteQu1qTQiwRne9pnCU7SEj2Gno6?=
 =?us-ascii?Q?WnFYw+MSzbBajvlxy7FxT+gV39Qov0IY2eM2F4Cx36UYDCqPXnCbKU4+OkIX?=
 =?us-ascii?Q?84OijBImrLtskS97dGDnpfH1njm7nLbmByCSEEbXIRpnJ4FYlOn3JZocK/NL?=
 =?us-ascii?Q?byRFtZj8uiEKrVW/kDWkPvIRenoMECZAdfRoPSRDXwY5dQ2xvM7HXadsJ7Bk?=
 =?us-ascii?Q?jtwZmuB8co81yztwQpKYADMz1OjfeK3HLOqMUwOoJrF3ze6vG/FUBn/Y8dCf?=
 =?us-ascii?Q?3YUoofdSS6HELdK9ZmJZRlgi0IWDr/X9tWYrOVJijP1Jd7t0AIJXv6erc6Xv?=
 =?us-ascii?Q?doiunzyYFwDMR9I+wsqpynqr5NvsBRLRBZ7ReRDP1gmesnnhVTqKAXlpp/9y?=
 =?us-ascii?Q?zr+vLG/bF1qfZg59JPbQ8KuTRLZZNb2BT9RQ2ThgPOOQ22sE06Z/yGho6T/b?=
 =?us-ascii?Q?0hjswqaYlN2Exxj617PvXj3NLB5qgMLXH6pfc1v3jtt8wrArKITz4uo+NdrQ?=
 =?us-ascii?Q?HA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 020af952-be5d-4986-fe79-08da89d292ad
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5818.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 15:24:32.5546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 tpW3vq0Uz4vtHtSz94k7XU2KB0W+zAVWST15JSB1088nh/JIPncA8A5hk4Faj69xQUC1y4EsXDmWCrmg53POwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB2914
X-Proofpoint-GUID: sLj5YgyY2057SjfV88_MDpd4KuSqzM3L
X-Proofpoint-ORIG-GUID: vzFr706VkA3CJvwrWS3r8-tdJ4jHjTbK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_07,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208290072
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 15:24:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98530

The create_spdx bbclass does not currently handle the lack of
spaces around the op (| or &). For now fix the LICENSE string.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
index 8545eb50f..a9eec6950 100644
--- a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
+++ b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
@@ -5,7 +5,7 @@ protocols should be able to share."
 HOMEPAGE = "http://search.cpan.org/dist/Authen-SASL/"
 SECTION = "libs"
 
-LICENSE = "Artistic-1.0|GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://lib/Authen/SASL/Perl.pm;beginline=1;endline=3;md5=17123315bbcda19f484c07227594a609"
 
 DEPENDS = "perl"
-- 
2.32.0


