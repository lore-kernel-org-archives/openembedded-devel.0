Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B45FC433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 06:57:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.8186.1635404223786645680
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 23:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=c8bhZ9OC;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5935eca672=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19S6v2EX009957
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Oct 2021 06:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=XmlK6Xhh/9CwM9NhJLLZ6oOGBtWuWNr5FIx0S5h8zNU=;
 b=c8bhZ9OCA5dq1iY2wsdGowc97FXyrmqBXcn9CCL/nYnq8E0vtm61GD4UDBAPoCtFE0/M
 aIpTyKteOGKhOtH5HHw2ScknF68YtF3Stz9J8EkvOUABVU9spBH1iNw/acNBKA0MIDoG
 EaXaOhqyotkWsk3IJI9GCHEMu4rAQ8CbxMu4vrhwoV6rq/4rsjgaI0BF6xtrxuYbXW5v
 0P5KiTtxLGU9p3Y5RVrvpGeeGYTHAB/kl+US+BX9dmqGFPL58dGL9ioRWEKLm3T1I9QT
 d1WT91RUmnKLVmBjYmBMaNDrrN4m7Pk/EYQRMKcNtHE8H42alu1iLOnWnHP6SPcJIEuU Gg==
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2048.outbound.protection.outlook.com [104.47.51.48])
	by mx0a-0064b401.pphosted.com with ESMTP id 3byc2s0e41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Oct 2021 06:57:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJf3zlKG3ww/1MOUlKp0PaC9YEEhZGyClgbt/sLJA5MPEIlBFS0ShQSva7EPcP4EtGTIAcDoshCuxXnMKggB+02lOMhMKcVBVvd9qNDrABE/DAaW6+sMUN6RClHARqVq4Hb8UPub/9FaS1369cBxwxNnf4YyQIRxVAQ8q2Jq2mfkoEo/PcMghaCS8l6/uffbIalNF0Enyt5OJCjaU9F3Vfn5ZOBZuzqwAbC4Exba05D2TJFUH1tblmwJfvfPtMPOMpI+DBfLRU0MRw0KMHwCJsNqBz+n7gNeuLgHexZ42B0WF8LPdciwIX34u96SRi6kkqlv7p1cGKiXK8CDZIlCjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmlK6Xhh/9CwM9NhJLLZ6oOGBtWuWNr5FIx0S5h8zNU=;
 b=eq1ccQvH6e7cRjCMTvgkkPgIVRbSoucglmNRUF18U33H96JJHEd3ZobdeBohpHjfa9+DGuSEew15qBNmzoqmoO0XIIYKiYZVuHR0o+HREKKK4Z/n56EGbhl45qPxiVPRjzNzb4Ko766+r6vLgOoPtxFA258523q0pq4PPiZloBa7pd3t1tFh2Mf1aA9MVK0Kh736Y+Qz0ldXUpwmsmBMDIgXLsfhI5+fujNPQLEn6S5z+rWdBZMsM3Da9vOol6X8ZihfrqlYNpd1V2EyfSsUyBGHx8RWeJJsDIyidiAbJTmgmq9GLk7VpsRdTOh580gz/gf31b+uizdaP4huWQtqbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW3PR11MB4539.namprd11.prod.outlook.com (2603:10b6:303:2f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 28 Oct
 2021 06:56:59 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480%9]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 06:56:59 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] netplan: fix hardcoded path for /lib/netplan
Date: Thu, 28 Oct 2021 14:56:48 +0800
Message-Id: <20211028065648.404915-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HKAPR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:203:d0::26) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by
 HKAPR04CA0016.apcprd04.prod.outlook.com (2603:1096:203:d0::26) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20 via Frontend
 Transport; Thu, 28 Oct 2021 06:56:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fba2978b-9dc8-4d24-a84b-08d999e02368
X-MS-TrafficTypeDiagnostic: MW3PR11MB4539:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4539F7A6CEEAFD3D0F7567EDF9869@MW3PR11MB4539.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:71;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bRJ+SVLcOiIr03n8gu/+Xe09LEw7BqhQo8SWXb1364cunTF5bgNeJaAx8IH+YHBV7+rs6yR/rYbQd/YSXMJHg6upusX4U0o5RtXu82b7uzIpyC/fu9KvP/yHH0KNryarJcc35o5lRgX8J40jG+XMfog0Hcjul4NvWUwWu0dZQsjPvk5h108AahOf4bMNlk+qExQp5Ip5al1sRpMJ2XtPEEQ7h+yZGrOJcwzeossMPGKDCo7OZBoILxAWe8voZ46/k5uDhGmYD+HoTOVlPVAn9UdaCpd+9za01h71VoMmVaP2fRbBuY+6HddRnRHmzJ9bx6QiAmfTx2SJXBaL7IQ3/itq6EMSmAwj6KlKlOi5FI0rqnr/BrBvpYiUuFqlPNUiyMxFXW5uqdOe1VAqxzrxETuUswxTDHlaRGF0ZBwBP20bYneqYgdePd9Hg3h07Wk7WhHlnQISnoMpXXdxSiqG9njR16fe19tfnMcGeliPqUJAlLMp8m8R5Ui72Q7hAfH1DC02K1ca4H5TyGlvlWoXptMaxhsj75+n4pU3rgp8a+TwLlYAZg9HFSbAd5/B3LzE6XAh28ZeJvGvC9k4mS3oruJWL7RuFk9U9ayysDJ9hjmEhC+WWosx43iotoO4IwF3TM1llcUUNjsr+8ZEf6IF2cmwYbDWWBhMOtjFlKw6v0jeGE/86mlgYJehgqAfyE3NHhQyJbCQB8iHkOKZU47XRA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(44832011)(2906002)(6916009)(316002)(66476007)(1076003)(6506007)(38100700002)(26005)(38350700002)(6512007)(5660300002)(508600001)(186003)(956004)(86362001)(8936002)(6486002)(8676002)(6666004)(36756003)(2616005)(66946007)(52116002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?y2d94k7WxcLghqOCtzf0U0jk7159mx2a8ubEygIr1eyM127KMiBD/Fvy5NYh?=
 =?us-ascii?Q?Pi+FC+eDW3l2T+GIh1MVIvZ+oxC7xOX7mxt++CMfDKCjNvjtsbCFYCnT2Jav?=
 =?us-ascii?Q?aGSB1CruC8MriPqiDg1kEho/2uxHQatevNltCqWOFrhhSLgsbvjIqiBgf1SU?=
 =?us-ascii?Q?oVMcFSQU4jL6yvoFpQH/LBdR00eqPSVeWTOM+6GcQMKcNW76PvHcZQBgmz0O?=
 =?us-ascii?Q?b4FsnWBBjz01HZe2nnZ9/vrmvdgF2o3KrSIAP29FBF6462miqdWdl1x7xPvt?=
 =?us-ascii?Q?tU/7FzsHUIj4zCeNCylL9MFjAT3Wkyr9O7C6YewMKD9udim62fVtLLT3yS3K?=
 =?us-ascii?Q?AeIqohTZqCR5qgeBA4ErloevsRQgW8gKdJqHDhZRVQIZeSEQ33fUue0rNhaE?=
 =?us-ascii?Q?1IfIGVhLcZC8v3MQXjZGvcwhfk64jIsH1e9hiW/Dcm7sibYqvIoNeaRGsNRV?=
 =?us-ascii?Q?IyqOKyizA0j7+vg09G9oYRBx3T8oNiKtCaa5NwtiC6v66amOTztLYO92ol0q?=
 =?us-ascii?Q?ety335Y6haWY2Dmm3XG8Vy8aHhNphWOqsnihyXfLcOiFkp+H9Tem0rIaKE11?=
 =?us-ascii?Q?sjFQ+Y5EMRX/PQ3tyDql6VrN/R45P+m5OH9XPvFX+0OkbNMzbv29MgqOtFDK?=
 =?us-ascii?Q?5zan2MjVGmM8vNRgxTfEeqKkrXy5fRQJWJg8fm2xL5BqiY7dRr8zA+kI0XC9?=
 =?us-ascii?Q?DYwCHq7FRG1Cngan/xOlHEs5v8sRJdRpLa500+5JoTZ7ADCEqK5XwOLXKUwk?=
 =?us-ascii?Q?ia/W084dU/vkQZMvocerf18CN6Up6p652gksOxZwhRC8FzpfnLDwQscPbTW5?=
 =?us-ascii?Q?/9S3DUleHjEAh646F22I1hNwW+wREAm73LWgDXFcO9YYLaNWG2d7m4EX7d2c?=
 =?us-ascii?Q?FGooini7vH3dMn7qXuj9U83lRKuFyM26oKNNf4M3ZoM8GDqvIrvGtnulI9/p?=
 =?us-ascii?Q?sb2tOFb5TSIgxbxHnVVFiY8JG1tbOwPFF7jH1G7OylIGYwCuCf/E6lEjy5C7?=
 =?us-ascii?Q?i6uhJCA2Cky6AFPw9T2dk4MCarWm5ZJKvAvH4Lv4juS9glZCrHvaIdcqzkYb?=
 =?us-ascii?Q?o6M2BaMp8zX+1em/ZhGp+rmEtBzX9OqW9U+o8jx+E9JwSnU140gMvN1+SMqR?=
 =?us-ascii?Q?QUmevbLYgV/ULfAjZMJqVHyHtTEWdsBEVvRm4HNtyeba9yJp9ydHc/ZTqeoZ?=
 =?us-ascii?Q?kGJKc6My78ffOG0OM0SmBIzW0PqTwHt2Qmzv3AW917gvp1tdW1mrjtG8kP2e?=
 =?us-ascii?Q?lJwWr5OzMht1QsuS8bjDQl6Hnvrb+BfKINlb9LhhrHITy2Xtgtb3ytmEUldm?=
 =?us-ascii?Q?Q/y5mxE1pFmdobiLlIZqhlALNMLiKGhjwipnPOQqVafxkPTq6+8+gJCfIOLz?=
 =?us-ascii?Q?KLy+BkWPXhe/uF99iiZ6nE/lRAalF+inWldJtu21wYt9Jpiwyb+eTwimLXmR?=
 =?us-ascii?Q?lP6JJiQM+imeU2RBHUv+UWg1+Zj6rCY9O5KdQuNpNAiDzoPyorK6TdULvQ+h?=
 =?us-ascii?Q?SDTJbh0rNiYLEAgLo+Ul5U5uf2AwS37QOJ/3E1bljaG7e9tyhWFGnQg0nTAu?=
 =?us-ascii?Q?rytSXcIHk0+sWFokUAOBDq2S2EGV6y05vqmn22xj/azm9lIOb2r2EtdUyVh5?=
 =?us-ascii?Q?21vU0kX1bINb6gRvKozZe8U=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fba2978b-9dc8-4d24-a84b-08d999e02368
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 06:56:59.6606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GYIZ7AgHm3UHH5KMlkHXwUww7zLgISskoPIu3PN/DcqkK4BqJ1RltEvsOBDJVEH8zWghfZAOXYgN4BCTIcGPtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4539
X-Proofpoint-GUID: izeXlXClWdlrPP6ldfus-o_MTiDgfIEU
X-Proofpoint-ORIG-GUID: izeXlXClWdlrPP6ldfus-o_MTiDgfIEU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-28_01,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 bulkscore=0 phishscore=0 malwarescore=0 mlxlogscore=609 priorityscore=1501
 impostorscore=0 mlxscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110280034
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Oct 2021 06:57:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93637

The hardcoded path /lib/netplan causes a runtime error on multilib
image:
$ netplan try
An error occurred: [Errno 2] No such file or directory: '/lib/netplan/generate'

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-connectivity/netplan/netplan_0.103.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/netplan/netplan_0.103.bb b/meta-networking/recipes-connectivity/netplan/netplan_0.103.bb
index 3527bceeb..1de739eeb 100644
--- a/meta-networking/recipes-connectivity/netplan/netplan_0.103.bb
+++ b/meta-networking/recipes-connectivity/netplan/netplan_0.103.bb
@@ -40,6 +40,7 @@ do_install() {
 	install -m 644 ${S}/netplan/cli/commands/*.py ${D}${datadir}/netplan/netplan/cli/commands
 	install -m 755 ${S}/src/netplan.script ${D}${datadir}/netplan/
 	ln -srf ${D}${datadir}/netplan/netplan.script ${D}${sbindir}/netplan
+	sed -i -e "s#/lib/netplan/generate#${base_libdir}/netplan/generate#" ${D}${datadir}/netplan/netplan/cli/utils.py
 
 	install -d ${D}/${systemd_unitdir}/system ${D}${systemd_unitdir}/system-generators
 	ln -srf ${D}/${base_libdir}/netplan/generate ${D}${systemd_unitdir}/system-generators
@@ -49,6 +50,7 @@ do_install() {
 		install -m 755 ${S}/netplan-dbus ${D}${base_libdir}/netplan
 		install -m 644 ${S}/dbus/io.netplan.Netplan.conf ${D}${datadir}/dbus-1/system.d
 		install -m 644 ${S}/dbus/io.netplan.Netplan.service ${D}${datadir}/dbus-1/system-services
+		sed -i -e "s#^Exec=/lib/#Exec=${base_libdir}/#" ${D}${datadir}/dbus-1/system-services/io.netplan.Netplan.service
 	fi
 
 	install -m 755 ${S}/libnetplan.so.0.0 ${D}${libdir}
-- 
2.25.1


