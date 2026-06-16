Return-Path: <li.zhou@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023E2CD98DA
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 02:35:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.145496.1781577298047948830
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2026 19:34:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aMYAbwIo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0627e9f081=li.zhou@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G2IYYe1866452
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 02:34:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=56FWPERkP
	a6cni7T7NF42mK1XeV17RtjjM8auVfmKLc=; b=aMYAbwIoJHX4JVsR97BSOp80H
	a+mAISv7Apc1JZKXVgZisb4X7ZSdAwl9ynNcip93mnqV1WDP9H8JKT6ds8oxKJ4s
	fO/r7IWqlXghUFJgi9ZxK/wYuL+xFDkm5HyNSU7ZmCwG/fCIkBsKY8WefYYO8/HS
	/lNlvWE+JxfEdcLtyNXnJtholl0R2N9vLwAREQzZHFJcbt6T51mSV7zQzynnBqKP
	nJ824SJdscjpA9YTkSgXi9pHDWZQoWpqOM89SO/soo43hNV+GGNUHSD/oVeA+Ihp
	6BAcs8SdaKR363K48DjFhy0JnHPDCzKIhwJt/y4bcy48TR5E5sOEdSZMB2aJw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011013.outbound.protection.outlook.com [40.107.208.13])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4erx63v15f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 02:34:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gxY6ZMY0NTp/byGysXk6UP+8PKV1y1TG0HzsHNCyHX2xKDSuRfX2tcXBGqemcgEDANFMbbvDfQ6kEahAJAvGoLKYgTn+CYQr5F/ChWOInQBWt+TyWh0THDohLrn1NKY+uB/bllYR4aIGzCRecNL55+yznIfFPwH4/BP0Ri+dMH2VkvYHTxNDZwi4t9/+jvNMG34xYjaZXV/As/NM5BIvgYzP8wS+Ul/AYwm4S8kcYBddj8DqVtN+hEM15QP5oMaDPCYZnpgm4kDvfj8lMIQRfp4BEI18+gbkDIX+9YkgnlEBkFnqAuGDs0sxV4kmCfzsXYR4oNVG5k8zXVULE2mIdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56FWPERkPa6cni7T7NF42mK1XeV17RtjjM8auVfmKLc=;
 b=BMEUFIc/jo8SBalBGMCFOHSEt3r+kk1ESWWIbsE20SMrv5b5PSblmotLqUx2ORgveeK4FEac7tsyFP0mn1hg6Y/vt6YOBxPESlPFJuMEoUWCrzrTaVGgtMl1j1eXn1roL/sQECFiemhZrfz9UJUKGJ2wDkbtQyPNRhllspoRvjdhrcRNIfigGIFd42Dqg0DbEnEzsvrfkeqEPrAhP7tMS5usGIImlts6QveCoxFtzozMU2eibq6uVcvcGWUp0n1HF5WdimPI+7U3+slJTBnP3Qig0koyuk3O3fippJOFGjU6zcZ7kUugC0b+tNl4akie+n2FhkiRWwKSqOsy/73sMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ2PR11MB7453.namprd11.prod.outlook.com (2603:10b6:a03:4cb::19)
 by DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.18; Tue, 16 Jun 2026 02:34:53 +0000
Received: from SJ2PR11MB7453.namprd11.prod.outlook.com
 ([fe80::3198:3bc6:ec3e:b2ae]) by SJ2PR11MB7453.namprd11.prod.outlook.com
 ([fe80::3198:3bc6:ec3e:b2ae%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 02:34:53 +0000
From: Li Zhou <li.zhou@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Li Zhou <li.zhou@windriver.com>
Subject: [oe][meta-oe][PATCH] minifi-cpp: revert all the paths' changes in do_install
Date: Tue, 16 Jun 2026 10:34:36 +0800
Message-Id: <20260616023436.2639818-1-li.zhou@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0080.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c6::14) To SJ2PR11MB7453.namprd11.prod.outlook.com
 (2603:10b6:a03:4cb::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7453:EE_|DM4PR11MB5971:EE_
X-MS-Office365-Filtering-Correlation-Id: 480374ac-7c33-486c-41b2-08decb4fd89f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|23010399003|6133799003|56012099006|11063799006|38350700014|18002099003;
X-Microsoft-Antispam-Message-Info: 
	NqS7ZN1+CrVodLOOfbI4Lqob3Cn545cN+6SNgszUX/R1ODD9A288lDSHs9VC3sOg7l0DjnBoVaPaTKp0Z3/1dNT67ZhDwlfNttTXDYuCN90yD5d7APcsX5TKUnsed4AWXlwfRQSKJDFoGM1tHEV4icG6aHQmDpB83lTAqzcDxBtjQmSMxlVaazYKJJ0RTDetidcrZYKAFc5sBWBLexLSIawmt5WzDwv7vCLOgsRHRKihC3MW9YWDAHTM/M07nou2b81p5eUvs11Z6sqIqxIrUk1keBtf9mdb3QCA9B33L2uMhWUg/+w3vbd1DRoYxD1B85K3B3FDWr5GogbgFWzmuIMTj+GdyIBaNWDtvTVMi0JTDB1axcmr1fJJOYiWnWXoNPqbxItdRAxxAgppGmmHguvGzqf8KeqhDm6HcmONmCALYFmySt6F+cZL4cCykfTH1J8CQYEqSe6y8GO0kjYJwq496qzQ/gleh0hgQHTpksZW6PRUS9+uVPqdUPHkpMvVTaubd6AYIgr7I4tFpY1fwn9Wj1Kt4Fd1uxd9g0NK7LyToustyMTZ0XqTrqUNKB1QfvqvCRatoKxhFnUJR0r3gpGFxFvIlcCc6zcozHIsn9TP52C1DOUd78uVk51tvJsg8swq0GrGZanqSvijmxmLnL02DN03jTyiYWA1VsBJlINa2oSSBkW9eoIxFvnaQ/2n8Q3u9Oe4upicGMeHFqB1qYOcSozQU1wz26IilOl5qqyjdcLbeTkR1CCIqtSVuRxv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7453.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(23010399003)(6133799003)(56012099006)(11063799006)(38350700014)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eZczdqCIuKBkH9WYztUyR59UKXFcsn6FgHfb78FAfdKnT8i3w58pcLL9tlm7?=
 =?us-ascii?Q?POkvkwpgm1+SxcD+nHB74XpazgeKbymMV4e6WCDbdlC8XnccFR9EtM+os4Ig?=
 =?us-ascii?Q?l1Bvqe9a5c5+hHfyK0IdQ96SrEWeOIAsoAZr/sZmeuJp86uaU03u9FUN/eFz?=
 =?us-ascii?Q?iRFuENTe5CHmXvfrv00cK95gyqdbejyAAGUTHFu/BcZMoqcdjC3k6FJ4eAHB?=
 =?us-ascii?Q?2/s7sX59t5LxgqAbKoVW6umZ3CWHAqQGEYyCNvDHUpOKCVZkEROqWTZab74W?=
 =?us-ascii?Q?zDeztOK8uE/rZk2eMwj/42ZPkDRbn+RmkX26VhpJ1a+oGOOHi5TOEztao7iY?=
 =?us-ascii?Q?SLtJVEZZBdQsabrAHGuOTD4mFbhi742ZJGTVfgzUjZV+OIkS0zKuSLrx/SSf?=
 =?us-ascii?Q?XCs18ZmEESbVCem9NPLvYstn4F63tSOVlSEAHt0vzk9rFnHIerZxDnxrRY1P?=
 =?us-ascii?Q?FWw57pR9Oz0v7sLKw2CEVix4UOdH4N/wvAtXVY53MwzJQoUE2KZMwMv57V2u?=
 =?us-ascii?Q?MOfdwF9a063xmGME+E2jL41hcpoaV33UrSx7YFr6ateIToRuTGkW+hhpKKOw?=
 =?us-ascii?Q?NGpGXTyKTb1+IbRTUJef8EYy6CpwULucyP1X4CnHnabnqENz+xdbqmxwfQ2T?=
 =?us-ascii?Q?aY5TYJC2MCNVfmzN6fez1WIOsfpVA37ArQn1ST/cTzZVietnz/HppF0dzIzu?=
 =?us-ascii?Q?1CSuVOiJxNMFVCb7zvrjp6XpOH7NDgZsQNsIvvaicO/uw3tKV4cJT3scCEmg?=
 =?us-ascii?Q?E18A5VetCdQmy2L9ABFpWd2lvX47v9NR9XzUw2438L3j+gTUaOmRFS/ptHDL?=
 =?us-ascii?Q?MWAnkCZF2gFMlxRfzRkJ11JmJx0bEyRgSFP2m/tGq91lzkwkVa64ea7fybP0?=
 =?us-ascii?Q?7M7vrbH/v3r119u/0e4xjVKikZjZ3X3GpkoIjqAyzM6cCLJ2H99CiWdzuJj4?=
 =?us-ascii?Q?+tN8oQLEuXxUQCye9BUlmN+W4FCYKlduJOM+1nQUlCjieM0VW2acpBGDP1AL?=
 =?us-ascii?Q?MWuSm5Rn6jK4SWq7wgzmzywA/GPS9qIW6ygSe238ZGjRM3wAI4twnnTFc4kL?=
 =?us-ascii?Q?EWfMQcXcymbfUDwN/rs7jrqgxC5yFNScPEw1VHeFzSrnDgZAB4zEM7x4aIWW?=
 =?us-ascii?Q?sEYmyAVwxvnSYx88PKFmvHvyB2CJOs03aPy+/oH6uTWf3xqbga7Huj3NBdRd?=
 =?us-ascii?Q?46FZgEnaHZOERDt2+TCFVXp2A+q05OpPGld41CYlJhjbQyziZCDGtqrnEtLZ?=
 =?us-ascii?Q?WDHHEwOhqz6yRr4+37fhKXeY2/CDz5OIYd2emd6JClyQgOoJMLEbWw++GUCb?=
 =?us-ascii?Q?o/YQYIC9hMKMj7QmaEry4zXxbCKzh6apzYxtNbBHO98SudDncb8uKne24hTN?=
 =?us-ascii?Q?VMjMBmlKQerNCHnRmkUhC+/fvPeMDXOnKp8RtgjT7Op+hCqGvmSXXK+omOfA?=
 =?us-ascii?Q?Jv6q1SCy+fc+fcua6jREHdxO4ygVjwMI+Uxs2VQM2e0M+ign1k9uwiP8vCKV?=
 =?us-ascii?Q?oMr5m5UxtKS4CLCADXrk1vpxKcPh/TfwZl2C2copktb31Us3yy7sunkuk1pj?=
 =?us-ascii?Q?fkCZGfIJ4azRtutG3guVhyGVSF8Xe+E5nvZWpaw4pT070kNANK1iFl5PyPXH?=
 =?us-ascii?Q?7qKHupK7RX9D+ko8+vm51oVr3QT+UX8xPj7dLSMVZOGOPj0Vnkw3PG6KRkaq?=
 =?us-ascii?Q?DdY/aSxEip1AQGdcHXb3xDjj/fSDoa1aqqkdloIL69AchvCKx5ovaBdfXbkd?=
 =?us-ascii?Q?ZwcFk46Y9A=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	QNVjUMr9AHrEY+QLv/dy682+esDU3EgVX2wccXYPDbkUAPklwsDQ1AQEy74EDNrFNAFK/z5VYtGRasDr1i0U2kpR6+piUu6vdiFpzT9YEGYBzkjZy2xrPgKTiecjNYPLILYerAwENacVuyfyYx1Q7BQ1Z+j4tNh/KowccralUSaQnLkSs5qpf+H2v3uZJyQPK1p3OiXWdS0/gP3d6SaoMrIIcIBI/lVrr/CHXbz/W2vYgg4gMPID/np4brTj3JoJXy+p/TfYgZ2XCDHIWJ4pmGONozKw3JhUb2a+uH3X77FmYDdRIvTjbJSZzvma+gRWEkt0fMNabR7Tk301mAKgWQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 480374ac-7c33-486c-41b2-08decb4fd89f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7453.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 02:34:53.2337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ubnmciRb5cgMY/pCL7kbDORsxiEHSJ/tcW5wk1sfW9t5KTXi09PvnpXSE9IlNslYoEy46YIQM6ovDAfTFzZiDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5971
X-Authority-Analysis: v=2.4 cv=SvmgLvO0 c=1 sm=1 tr=0 ts=6a30b650 cx=c_pps
 a=ERW18fiFji9WgYXv9zI75g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=QaP1vgwVQo2SbY4IoeYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: KTRyjBI-ZBlF_tzfGpZRGgCk8TflcpxM
X-Proofpoint-ORIG-GUID: KTRyjBI-ZBlF_tzfGpZRGgCk8TflcpxM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAyMyBTYWx0ZWRfX5iFywlOZrkNH
 +aCuYVDBvrChfhH0IBh1XBnGJwU3kO7ucevuFph0BR96y3rkZTTEqEV6Kbhf8pgIAgkkeL5HexV
 UnUybAhBEIUWevloU/5caRa2/CE0NudqjMNCIKybkx1DL9zEu/5KKBZ3ZcUJXD2GX4z04BA11He
 8uKb7fhaA2K45DHYYOrqI/BoO4seotJxJ/1JBgwL+H7a37tiPWoD/rV9FB6DTBbzJDUvewlZ1gj
 GRZLgZ2PZj/1YxIz33gprwppfGNjY3JweSPIDDsueLH4y/zIfpa2kda1rOT+D/AJoAca1La7R4z
 8aZ7PCsP03+Y9eOojGXfCe6Rg9mWDUU2DeX7dICGAxVYQRp4tLe/yIx/lBK/OEZx26M6+IAvIEs
 6HC85/NwaM/ORdLlH+GDOx9GThNPEkfEbT7U2IK7ZoY/2AGorZiMj9vhi1GgCBqu/S3pDodmTC3
 abn1MLQwVdJR3QGAGcw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAyMyBTYWx0ZWRfX2AyoEEU/tNud
 x+jDyxEoLcN3HtqbpnMy8aPjm+wLUa8uO+VLOKVmj2VDnNzITTdoXeSDhQps7lW2ub1uEh2Agfq
 c7CFLaxydixWQJ7o/h4mb0xpzEaemCZ2MEYnFonBmzkM+SsLMCVV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 02:35:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127600

Removed all the paths' changes in do_install because of the old test
by using "/usr/bin/minifi &" instead of "minifi.sh run &", which
doesn't define MINIFI_HOME as an environment var.
This causes minifi-cpp thinks MINIFI_PACKAGING_TYPE is RPM, and tries to
find files in different paths from TGZ, while yotco uses
MINIFI_PACKAGING_TYPE TGZ by default.
Correct test case and those changes aren't needed any more.

Fixes c0e52930a902 ("minifi-cpp: upgrade 0.99.1 -> 0.99.2")

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 .../minifi-cpp/minifi-cpp_0.99.2.bb           | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb
index 6c64046161..3d202911bc 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb
@@ -154,19 +154,19 @@ do_compile:prepend() {
 do_install() {
     DESTDIR='${WORKDIR}/minifi-install' cmake_runcmake_build --target ${OECMAKE_TARGET_INSTALL}
     MINIFI_BIN=${bindir}
-    MINIFI_HOME=${sysconfdir}/nifi-minifi-cpp
-    MINIFI_RUN=${localstatedir}/lib/nifi-minifi-cpp
-    MINIFI_LOG=${localstatedir}/log/nifi-minifi-cpp
+    MINIFI_HOME=${sysconfdir}/minifi
+    MINIFI_RUN=${localstatedir}/lib/minifi
+    MINIFI_LOG=${localstatedir}/log/minifi
 
     install -m 755 -d ${D}${MINIFI_BIN}
-    install -m 755 -d ${D}${MINIFI_HOME}
-    install -m 755 -d ${D}${MINIFI_RUN}
+    install -m 755 -d ${D}${MINIFI_HOME}/conf
+    install -m 755 -d ${D}${localstatedir}/lib/minifi
 
     for i in minifi-encrypt-config minifi minifi.sh minifi-controller; do
         install -m 755 ${WORKDIR}/minifi-install/usr/bin/${i} ${D}${MINIFI_BIN}
     done
     for i in config.yml minifi-log.properties minifi.properties minifi-uid.properties; do
-        install -m 644 ${WORKDIR}/minifi-install/usr/conf/${i} ${D}${MINIFI_HOME}
+        install -m 644 ${WORKDIR}/minifi-install/usr/conf/${i} ${D}${MINIFI_HOME}/conf
     done
 
     install -m 755 -d ${D}${libdir}/minifi-extensions
@@ -182,19 +182,19 @@ do_install() {
     sed -i "s|bin_dir=.*|bin_dir=${MINIFI_BIN}|g" ${D}${MINIFI_BIN}/minifi.sh
 
     sed -i "s|#appender.rolling.directory=.*|appender.rolling.directory=${MINIFI_LOG}|g" \
-        ${D}${MINIFI_HOME}/minifi-log.properties
+        ${D}${MINIFI_HOME}/conf/minifi-log.properties
     sed -i "s|nifi.provenance.repository.directory.default=.*|nifi.provenance.repository.directory.default=${MINIFI_RUN}/provenance_repository|g" \
-        ${D}${MINIFI_HOME}/minifi.properties
+        ${D}${MINIFI_HOME}/conf/minifi.properties
     sed -i "s|nifi.flowfile.repository.directory.default=.*|nifi.flowfile.repository.directory.default=${MINIFI_RUN}/flowfile_repository|g" \
-        ${D}${MINIFI_HOME}/minifi.properties
+        ${D}${MINIFI_HOME}/conf/minifi.properties
     sed -i "s|nifi.database.content.repository.directory.default=.*|nifi.database.content.repository.directory.default=${MINIFI_RUN}/content_repository|g" \
-        ${D}${MINIFI_HOME}/minifi.properties
-    sed -i "s|nifi.flow.configuration.file=.*|nifi.flow.configuration.file=${MINIFI_HOME}/config.yml|g" \
-        ${D}${MINIFI_HOME}/minifi.properties
+        ${D}${MINIFI_HOME}/conf/minifi.properties
+    sed -i "s|nifi.flow.configuration.file=.*|nifi.flow.configuration.file=${MINIFI_HOME}/conf/config.yml|g" \
+        ${D}${MINIFI_HOME}/conf/minifi.properties
     sed -i "s|nifi.python.processor.dir=.*|nifi.python.processor.dir=${libexecdir}/minifi-python|g" \
-        ${D}${MINIFI_HOME}/minifi.properties
+        ${D}${MINIFI_HOME}/conf/minifi.properties
     sed -i "s|nifi.extension.path=.*|nifi.extension.path=${libdir}/minifi-extensions/*|g" \
-        ${D}${MINIFI_HOME}/minifi.properties
+        ${D}${MINIFI_HOME}/conf/minifi.properties
 
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -m 755 -d ${D}${sysconfdir}/tmpfiles.d
-- 
2.34.1


