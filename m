Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.53])
 by mx.groups.io with SMTP id smtpd.web10.55679.1606713663269388408
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Nov 2020 21:21:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Ds3IhD77;
 spf=pass (domain: windriver.com, ip: 40.107.223.53, mailfrom: li.zhou@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yv8eDNNkr5bhzyerpUs96uMAKR/iehehwMD0mx4QBRrDCowqSscIOX3EvPOoYqtAWTbuLdqz4T1nFe7qcsVI8AhhrRfPsFaGrLfgOvNYw5eSq+2rcPpklnrtUReX3J8/dpJ8dlje7nkJ+wH1/5FBXzgu+/7gbv1tgzcC2QI3yOmdDb/6iDGUUIs6wCaf4B5PaejRyizAhcEsfUWwvWo7yTyGp98wz3xZOrdNYMgUEoCZ1YhNxsIEHBNd2n9fxY1qilNzexU0TRagUhoVmYwAvb5aO/dSVDkSjSpmrJLdmmOwEIflVNEPLKcJSGcOlSsytRcAm48vWZGDYMw3/YW22A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OiwMuYD4lVLXXUvliXEyFHtQUSMFTjDDHzHZBKpqWNg=;
 b=DZCx1VZPQM7yRNFj/hgTUGFa6jzmahAXVXEDzAysOZu8SPx3rU6+5ok0zH3R3+80PaElse8SHbiQRSyAzQgBsRL3G9EEEkVoS1He/QGRG/s+dib/5kmWpj8zo9HipkmTIZk8fKAO7xzqPZpMw4Pl0c/kJpMiOUW+/08UP6StauB7HBSetQtobirEH1nxKMuZLSLcoFiqmn/dZBj7cQNeUiwjVPFPoq/MwPehW93a9P+duKGnls2VlRt1yjChuHilXfO0axAGMx5QBpY1WmxnBW72RUrPfbCjewEdo0JiZa0fVOaPe9W/8mzaGbbatVf8pA8YmymxT7prYH6WNvSQfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OiwMuYD4lVLXXUvliXEyFHtQUSMFTjDDHzHZBKpqWNg=;
 b=Ds3IhD77AHLJzYXhaiSKqx9uyiDFpENcGU4SqRcIu3+FrsIn9U2rIKbef0Xi2F1LuemKWt4xbqczhDorWuc9LgeK4S07dCsvm16xydpwq4gmVsRFI124y9Iz6Tk/N5NrXusjzX3T1lLRbhVEIfpkaiwSMibsLjMSxqY6JjFSDqM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MWHPR11MB1520.namprd11.prod.outlook.com (2603:10b6:301:b::7) by
 MWHPR1101MB2366.namprd11.prod.outlook.com (2603:10b6:300:7b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 05:21:01 +0000
Received: from MWHPR11MB1520.namprd11.prod.outlook.com
 ([fe80::41ca:4473:31d7:7d94]) by MWHPR11MB1520.namprd11.prod.outlook.com
 ([fe80::41ca:4473:31d7:7d94%4]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 05:21:01 +0000
From: "Li Zhou" <li.zhou@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH] ptpd: Solve memory leak for function NTPDCrequest
Date: Mon, 30 Nov 2020 13:19:59 +0800
Message-Id: <1606713599-129296-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0020.apcprd03.prod.outlook.com
 (2603:1096:203:c9::7) To MWHPR11MB1520.namprd11.prod.outlook.com
 (2603:10b6:301:b::7)
Return-Path: li.zhou@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp2.wrs.com (60.247.85.82) by HKAPR03CA0020.apcprd03.prod.outlook.com (2603:1096:203:c9::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3632.6 via Frontend Transport; Mon, 30 Nov 2020 05:21:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 148b4ec7-5d9b-49d5-a9b1-08d894efba04
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2366:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB2366B40608FDE30155D58E1FF8F50@MWHPR1101MB2366.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	f+wa8cQS6hu7fKcuy9Io+1MZXLqUBGZb4FYv1M0Mv7LHquo3hP/etHvABZAi2K++FAmUVjfNw2iiRg3P5PZBq7Niub3OH8KQgHQX7QODi3cocpjzkeHRTcxcYO2G902ib30r4J7Kht7XyZXrAtPU0n671GDSjJbbmIV8nVnlWdMvs2JYe17d5gz90F3sDoRmGb/exXoXH+d5xdrYwe7AZC87SD4XaBMiLOSefz3AHu3SNyvZBwg1fzlVc0h+XTKLYuFP4TO8CseDDnLtV48zWXVjxoP41ZXO0fLxgfItE58Xp+SvercvRcWLMfWV3sjCLnc+LKkyEJitIYWQBGG4a3WWOk8AtSGki5NGfgFLwnrFg6oscBYAsLL4UJ8r6OVsxLFuCuftVZdB8NXl2l4cZQgD3TTV34Wyu5HIVCG7TDA8RZtMTev/YJ4++CbLe2n3r5GKck+n1Q4DrCpnP/GhuQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1520.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(39840400004)(396003)(346002)(8936002)(8676002)(52116002)(2906002)(316002)(6916009)(66946007)(36756003)(66476007)(478600001)(86362001)(6486002)(16526019)(5660300002)(26005)(6506007)(186003)(83380400001)(6512007)(66556008)(44832011)(956004)(2616005)(156123004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?DVUJsKUIh8zEoUL2bNfFJ9EcxQl/PvF28J7i+xlqorqqNUCUT0LJlIulMMd5?=
 =?us-ascii?Q?7Y8S3ABtEl7HIZEs13+cZoVlCh4tezdpbVfqS+4wv4FQZTMBSUXq7wcNQ70b?=
 =?us-ascii?Q?bM87DVvmnzErYOFHWo3wC6Ee318CQpIwuzfkuiqRWr9uyg/ym1mPh0T8maJJ?=
 =?us-ascii?Q?TFBt6XUCsSUbjF1zB8C316TbrZzt6Zxj2OojBzPeU2VLYqYxCfLOqXrufU8h?=
 =?us-ascii?Q?DihWehyeHlOFahHEQOzCO41RM4qVgtdoHTUGK6UEDHnUI2hSmn0P/zmkGwIS?=
 =?us-ascii?Q?PdTiWcxaZQbQx3wKnC99aX9iWvfdDl0KHJvlt8+mqSS/OvWUbeBowbLf/pa1?=
 =?us-ascii?Q?uoj+mmR/s7pHd2S5xR9+9FbZBhrjS3O2v764GfVZu9180/O0hYJwXFhgCLVb?=
 =?us-ascii?Q?KYMHpQgxVdySNhvkAFwSnUP+hqcBE2YNrGMv7HTYavRPZ09E+YERXLERW7Ei?=
 =?us-ascii?Q?uS7B/69gZ33YSHhwcnSC4ftFWkeDfgMNEOO3qfoXyVsfljdrUzuv0dYiDNsn?=
 =?us-ascii?Q?Pa1by5Bif8iQyRtYhDGTcYOOWIdGdB2gL4Gw8gkiesJAJtFf4fpeG2IwKuvL?=
 =?us-ascii?Q?yHHtelHGX1VJ1cUnPI/rjRIhWYxOWgyg6iTDXevSvh6M3fQ4KWD7L1Bly426?=
 =?us-ascii?Q?W3+etdDc2HglXpJRykLdYtZFdV9QN8YhfG9bZ0CQPNZ5c5RPmoLqAvkJDjs0?=
 =?us-ascii?Q?/RqOIWOtzvyFs1i09r2w1UDhA9fN5Ev5yD9DAYjDIGvsyC2JhBipuZXaFWtK?=
 =?us-ascii?Q?wLKdY02Dib/PMEUOegeRMs8Tl7lOwoNMCAZZ6fFYWnNZMSxRRLByNEYLkx/0?=
 =?us-ascii?Q?hafxSBaCibx45T5hdFmmxfbZ1jEL8JcnzPJEYWJffFJtwClXfsbsyRVfauTe?=
 =?us-ascii?Q?0gy9kQYSOPO29UHcJtgWS+N52BuFQMUbSI8f389lCvFh/ym/zbOuKGWW99sL?=
 =?us-ascii?Q?H6vM35gk2h9pN9VuQFvkQ5Vd23NM1KQMEJXJnLVt0hQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 148b4ec7-5d9b-49d5-a9b1-08d894efba04
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1520.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 05:21:01.5116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iRe52fzOZ8OtVS8MrzYErVuZjtz2UQasxAji2T0YI9qad0loybsznceQHLTuyR6NDLVA+z1acvv8bHYPVNb3EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2366
Content-Type: text/plain

Solve the memory leak in function NTPDCrequest detected by valgrind tool.

Memory leak log example:
==619== 21 bytes in 1 blocks are still reachable in loss record 1 of 3
==619==    at 0x4A09DB0: calloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==619==    by 0x43512E: NTPDCrequest (ntpdcontrol.c:255)
==619==    by 0x43512E: NTPDCquery.isra.1 (ntpdcontrol.c:683)
==619==    by 0x4359EE: ntpdInControl (ntpdcontrol.c:807)
==619==    by 0x4364F5: ntpServiceUpdate (timingdomain.c:622)
==619==    by 0x436935: timingDomainUpdate (timingdomain.c:756)
==619==    by 0x4334A7: protocol (protocol.c:263)
==619==    by 0x402BAE: main (ptpd.c:131)

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 ...lve-memory-leak-for-function-NTPDCrequest.patch | 40 ++++++++++++++++++++++
 meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/ptpd/ptpd/0001-ptpd-Solve-memory-leak-for-function-NTPDCrequest.patch

diff --git a/meta-networking/recipes-daemons/ptpd/ptpd/0001-ptpd-Solve-memory-leak-for-function-NTPDCrequest.patch b/meta-networking/recipes-daemons/ptpd/ptpd/0001-ptpd-Solve-memory-leak-for-function-NTPDCrequest.patch
new file mode 100644
index 0000000..b2caeba
--- /dev/null
+++ b/meta-networking/recipes-daemons/ptpd/ptpd/0001-ptpd-Solve-memory-leak-for-function-NTPDCrequest.patch
@@ -0,0 +1,40 @@
+From 3886219c5c1fdca114dd480b46ce211762e30742 Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Tue, 30 Jun 2020 13:50:11 +0800
+Subject: [PATCH] ptpd: Solve memory leak for function NTPDCrequest
+
+Solve the memory leak in function NTPDCrequest detected by valgrind tool.
+
+Memory leak log example:
+==619== 21 bytes in 1 blocks are still reachable in loss record 1 of 3
+==619==    at 0x4A09DB0: calloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
+==619==    by 0x43512E: NTPDCrequest (ntpdcontrol.c:255)
+==619==    by 0x43512E: NTPDCquery.isra.1 (ntpdcontrol.c:683)
+==619==    by 0x4359EE: ntpdInControl (ntpdcontrol.c:807)
+==619==    by 0x4364F5: ntpServiceUpdate (timingdomain.c:622)
+==619==    by 0x436935: timingDomainUpdate (timingdomain.c:756)
+==619==    by 0x4334A7: protocol (protocol.c:263)
+==619==    by 0x402BAE: main (ptpd.c:131)
+
+Upstream-Status: Pending
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ src/dep/ntpengine/ntpdcontrol.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/dep/ntpengine/ntpdcontrol.c b/src/dep/ntpengine/ntpdcontrol.c
+index bfe0b5e..b1973cb 100644
+--- a/src/dep/ntpengine/ntpdcontrol.c
++++ b/src/dep/ntpengine/ntpdcontrol.c
+@@ -271,6 +271,7 @@ NTPDCrequest(
+ 
+ 	if (!auth) {
+ 		qpkt.auth_seq = AUTH_SEQ(0, 0);
++		free(key);
+ 		return ntpSend(control, (Octet *)&qpkt, req_pkt_size);
+ 	}
+ 
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb
index cab0d94..227c9f9 100644
--- a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb
+++ b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb
@@ -24,6 +24,7 @@ def get_sub(d):
 SRC_URI = "http://downloads.sourceforge.net/project/ptpd/ptpd/${@get_sub(d)}/ptpd-${PV}.tar.gz \
            file://ptpd-use-pkgconfig.patch \
            file://Fixed-100-CPU-using-issue-by-adding-minimum-POSIX-ti.patch \
+           file://0001-ptpd-Solve-memory-leak-for-function-NTPDCrequest.patch \
            file://ptpd.service \
            file://ptpd.conf \
 "
-- 
1.9.1

