Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2456AC433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 02:22:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.30956.1634523732141906082
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Oct 2021 19:22:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=JbgzgK7U;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5925bc224c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19I2MBDS016097
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 02:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=g3obAdQoYHxe1lTmlr13cDZG5Ly+ZJH+Zx00M7kCIDg=;
 b=JbgzgK7UdcOAc4P9MzNY5MrQ7oRINUTmxTtjRdO0J5VF7SaCaWG/u597BUfmtT6qog4Q
 oWrte6v7FHiDcsAkfYvMh1ujPjMHs61mqnmL3EpkUsiHK2iGarETY1xRYcaBRyfOARM1
 hR/ORlallX950VKWygJpCD7xgvGeNiMKD0e4xN0yUpg1rD15Iri6+HQN1baQvgCp9Gce
 oQqj/oTaQMCrdHHRAbvXE69wC6PRJspEhd6wBIfqXhcyYrnWOiMa0bzvRzrjpEobiBlV
 NGH6+Q/PS2r/A+Emo62j/bAfJKhg4v1IR2xsVeZP8lke64fgPHZk4ENoTIDSlyyBchTq QA==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by mx0a-0064b401.pphosted.com with ESMTP id 3brg038dhm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 02:22:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RMd43ASZm00HYrTi2LI1xj3boXrTBcHJnmvMmlFC9ZOTj/P+QTM36RCY4uG08BqMmBOLfS/VrDTi0Ei3zbfzyMXEdvVwRpOLNP1pBDU4p6hk8PXOzwTAO8NXauv5M/Demy8CERwm/nL29+/3B5WU38GaU1lSHvHxtzo7p5mnyG/EcikNVshs+lVPxnIovuYd0nsAx9zenOsBMn7PAeGrijXL7Tscz5gWrfuRrsQwanPXQImwyZbVcWTlOwI8KAzfDg06SCfwfbBaaDGBMsAh1LpDrA7RiXAgLVRDB1iUNcVBU0tH9U0XPixnUknHRPM0vAsakCDC+lfTWlD2PE7GXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g3obAdQoYHxe1lTmlr13cDZG5Ly+ZJH+Zx00M7kCIDg=;
 b=Z6byi37JFU3U0zyPiJuJro18X6qIpijFuTJCfxrfyowgQ1PuKXIdOFQgqaYiALLB9WKzKW0T7lF1+Rpveac1OIUqnNfv0WroVGBcdmsQS3jvrC8olyhgsy6z/42nunXrWDGhLR8rMQ+WLa+xxYDZjXBEHmP8lE1NsUtMo2qG1qDOMcUESuqBnuz/Trnc23ywfivUa8OPjsDaar2UPvRQ/8V7WQ45HmP6yjRYaVcefj9dju4NO2DTpGP+HSh5+VyAVzOIhhvf9NpPk174tWzjAa9L3l8BjmiS8aoCXxH7fuRzmfVuS1MwM10c6I/qwWJCUzrT9wwh7AYn1ESN+XnYvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4771.namprd11.prod.outlook.com (2603:10b6:303:9f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 02:22:09 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480%9]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 02:22:09 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] audit: upgrade 3.0.5 -> 3.0.6
Date: Mon, 18 Oct 2021 10:21:56 +0800
Message-Id: <20211018022156.8587-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0221.apcprd02.prod.outlook.com
 (2603:1096:201:20::33) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by
 HK2PR02CA0221.apcprd02.prod.outlook.com (2603:1096:201:20::33) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Mon, 18 Oct 2021 02:22:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a9da3c8-f928-4a81-186e-08d991de1639
X-MS-TrafficTypeDiagnostic: CO1PR11MB4771:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB47712EAF1DA15B7B2FAED0B0F9BC9@CO1PR11MB4771.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7kaw44Dm9xi6DWgvU0kzni3n4x82EHyhT+WKEv8dq4FeIMN+Y0Sh4ijNebIyv27Pd8BzTfGz6cNYnLjoTli0mLFZUMZj8oYOLX4IRDRwS+AppH4VRQNcpVR/vrgcf9ItKYKOCPDV57FcCKwHZDQKHYajcXUxkjwPeM80RW9QKGR/0/h306MojFb0/Y6oh6x/eao/7a4gDMP0Xvavdx+P3VjK1ZyaNBEy+aY1kNW1e7P2ZRk92q/yKgcUcmmvqPweSZqPlbYcIoWEJz6u1Xn3/tD5h3/arx+3oczNUBkd8JL8SOAwlrNBrWPBQdH/JqrarTPk50vbO9c22S+FZxh44IB5hnEaHp5BD0iPnssj+JIjnzrQsZ9WhHgTmlNvQKUlVj2DaXB/jESyr3/CkdBD5pikNHkNHBxrzsGEf7xYAHWG2uqKZJX7RQnxNXLoMdS/RPbcvAUJns7LYTLSpTtWd8zOGK6wes9knTr3+n4ZNfd3DQOQddOg3ZD4vyBbhsvJP4WVyyrqbjGJMWHg8HTslWZlKwaMIMkq6JIiy6ABvDrAdDdwQZDapSdOoEZ3WnD1pLCUz4CrxYCuaW6IJWSS0qng1zrjxlm9VDHz28FKpSD0UXNv2ngou3wwOgaLkJr7OSv0UA6XI69iBGXXLD6htgDaYWSlYkkOjhvizBLkA+wn1E70oA3tiy8329EPiFtvllwb1+rpVoQGXkDgwgYONw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(38100700002)(36756003)(316002)(38350700002)(8676002)(2616005)(26005)(2906002)(6666004)(66946007)(6486002)(8936002)(6512007)(5660300002)(4744005)(1076003)(44832011)(66476007)(186003)(66556008)(6506007)(83380400001)(956004)(52116002)(6916009)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wbPQCqFAgC8aE77aivVAA1V2uKRAsUBHoKTXezsR04KYHaxtVm/oBx5eZLeO?=
 =?us-ascii?Q?y/Dj9iKFopHOS5Ab3R+SFz/YgejP2Nn/Y+W1fO5cJPKiGLMY4LeMcdBDsMic?=
 =?us-ascii?Q?B1lKh8RmiqQfOj6mIVyMSAt+aobD2g9Y9H43dXXvFGzGlbzsEJ/Y+vVguvcE?=
 =?us-ascii?Q?Z2awnNXaqn2oYhfvELkiHqKwECk1AFPZdj1qaP6lzvR8v5ldKtwAGYEQTBGa?=
 =?us-ascii?Q?R4tK45KUm0QSei2WPc0b9ZVtunFdhWaROo5os8e+IYs/3Cr8IC487BeN+cZ7?=
 =?us-ascii?Q?yw4tUBHOI+j73m2U5v4XTSF/KEH8RMWTu7f/qs3zDDXR9V4hK1NN4KrcdBHa?=
 =?us-ascii?Q?txSBDjAe4HW0XO8o6MdshrwowOsyh30Mp5CcRYMJ5tDBNZN7pXPBaX1Wj9zw?=
 =?us-ascii?Q?RbdwYJXWYot4l1tdseh6PCSTZfAeAVITtsLujKLu9/QnMN58c52sh7Bkt7uZ?=
 =?us-ascii?Q?LfSL5jgwhdFsXGch2PXMkSufQ8xPTKXam1BRJHB1hAvXSkvd7fVhy45/mih0?=
 =?us-ascii?Q?jJeenkTgp/IgC4wzk17U1yPEtF9gV1/P/sfxSw1MsY8uLHRE/kd3kOkpUviB?=
 =?us-ascii?Q?zubqNwpHRxQQGqSUsnIsqVXUFajBSLCKzITDJyBNulxpNVAEbV8SfdsA5+f8?=
 =?us-ascii?Q?D0mqRRPjTu7sBeDpjb7KRqbPNCMOcg6axvSv/EIL+t7PgpQ2pxizxgGLHpTj?=
 =?us-ascii?Q?qGjyI+dY8FzGPDblwZJ428PantuhPConyFH+DfonOS+F7yXnH9lLl4dAGq5w?=
 =?us-ascii?Q?Yq/4uDMQucwStRAe30gZnjwT/kQ/Kd42Vtm5ahGC5z2wClGWo0RNHxs2iLWb?=
 =?us-ascii?Q?Xho8HQgg1UDZ1QiG5HBAfOCs25P3w4MQ2P5RDLmBxBFV19ms7rMMOxciAZn+?=
 =?us-ascii?Q?mb+tiPGboYaKiIFpvAuHi3dF/AaKFtlvqyrM1Ghd7xmF8I8RfxlFHoW91Nbw?=
 =?us-ascii?Q?xlEHc3whppPNwMtfcuLsKDMbQ4jAi91ho96I1iqplggfdQczm2/2ty9alhKh?=
 =?us-ascii?Q?61dMa/OP0xnNlfwH6bm2irOuiRdiWnajQgbxM4Iku82AsK/TdA0SwXUgjWvi?=
 =?us-ascii?Q?08xrTzoSpPejWa52VoztrZwfS83KvF69SOG8ort6pzSaKOo49fZiFHCRuhIC?=
 =?us-ascii?Q?uci0BLs5f3TzMCmRhfKbqoMioN3mHfylQ4UpO2iJsTRTq58Kecl9TtBl4guj?=
 =?us-ascii?Q?6jEcwOSCDLfaRyPh9uVFEMtwbuntY+WLtBhxeIApJRVTi38dCfRgq5lFC1di?=
 =?us-ascii?Q?2PeR26lIsc5lPgv88OHGt587AfzmgZm3nRaWaVHOYjxpDpfM3BIF9DCMUVcE?=
 =?us-ascii?Q?xzkQwJ08sBj5VvoSfwC0j283?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0a9da3c8-f928-4a81-186e-08d991de1639
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 02:22:09.3852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Jph2Yvl49sqLnUX554pQU6jMCq4vPvA7xplQ70yT7IBl8a6fWYqFVDZpSWlanX7wx0i0yVo1wfMPYWccovLONg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4771
X-Proofpoint-ORIG-GUID: 1CDW0WlbzncabAcUXXo2YjXt24mdoZas
X-Proofpoint-GUID: 1CDW0WlbzncabAcUXXo2YjXt24mdoZas
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-17_07,2021-10-14_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1011
 mlxlogscore=878 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110180012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Oct 2021 02:22:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93417

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-security/audit/{audit_3.0.5.bb => audit_3.0.6.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-security/audit/{audit_3.0.5.bb => audit_3.0.6.bb} (98%)

diff --git a/meta-oe/recipes-security/audit/audit_3.0.5.bb b/meta-oe/recipes-security/audit/audit_3.0.6.bb
similarity index 98%
rename from meta-oe/recipes-security/audit/audit_3.0.5.bb
rename to meta-oe/recipes-security/audit/audit_3.0.6.bb
index 173c2cab1..2d75232b8 100644
--- a/meta-oe/recipes-security/audit/audit_3.0.5.bb
+++ b/meta-oe/recipes-security/audit/audit_3.0.6.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master \
 "
 
 S = "${WORKDIR}/git"
-SRCREV = "c382a4925a7d0d1b332a2f4e689c71d71b0005a5"
+SRCREV = "b1b2728ccd83eeb0dffe29c01a5c97e14e6a0d8a"
 
 inherit autotools python3native update-rc.d systemd
 
-- 
2.25.1


