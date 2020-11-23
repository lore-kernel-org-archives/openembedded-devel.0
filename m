Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com [205.220.165.212])
 by mx.groups.io with SMTP id smtpd.web11.35950.1606141063152947278
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 06:17:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=BVAujoKR;
 spf=permerror, err=parse error for token &{10 18 _spf4.garmin.com}: limit exceeded (domain: garmin.com, ip: 205.220.165.212, mailfrom: joshua.watt@garmin.com)
Received: from pps.filterd (m0220296.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0ANE9srE030967
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2020 08:17:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=pps1; bh=53tqQ1zT723D3hlb1XQZhyiNhs951ZxNGWV0ycCpmBo=;
 b=BVAujoKRNZQ3xZ3sWcWA6ARPLUxzZpuwRCqct/+CKCs3JGz6e9TAtoISArRYVP15jvnW
 WzaQX8xCpXJGk/px0IRqxAiDhFR8s+07qYMCTVFVAC3IYXYhAM0IIEMEhXP7ZPOetcQf
 B25My2u2PRajrsXz5KPHav+Iag9kxvIgCxQ6Ctq+RKhqb/BO2lgjSMf8eAUT7o5+guha
 LV1Fp8YzA3SHXnUvr31iiIZtZp1xk+bsA5URuhOWE66VxRA8/xb25aIyF39/AsguIl0U
 esa2fEyX+eM/G6h3RdbQA/HbDub0Zipr3jlUBVIP4laW94s7TGEZEonScTz61f+mugXy 4g== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by mx0a-000eb902.pphosted.com with ESMTP id 34y159j8be-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2020 08:17:42 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EOczbJ6V2GW7pw+EHqTqG9wrjo8INaYn97XN7ZaR+TbrpywNnebMM6SWrgDaow2M+g77HbsoDvEmnwoUbxpigUIzXXvAqsRWBHJFSUnSYyaKSNHfoZJ/e9AQ8OTcYIxfcEQWrJNy/m3EyUlEcm8464H0580u+JooXHI/U4RBzdo65IvOf81BvNgpsBauwdc38q1kAeoBlFwckcSe/eP1EjvUYpU9ufKGJ0WHh10Z/JZkxhugYmyoNKL8Q+7D2XmINZOlFN3x3tui4YCtnSocH69M6pPz/aJ8y+5J5QuPLaX+xd4DiVyka2MPIbccuGhepcHAppCO4RqinYyMVl85Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53tqQ1zT723D3hlb1XQZhyiNhs951ZxNGWV0ycCpmBo=;
 b=dmkdump0Fo+ve4RiQaNqodZRX6fqNtAF9LklknwJn9f2g6ZDPDVOs5BtzN9mQ/yr1e6vgzUji0HTGv3MnqNS9q/qS4ftTxPgECP8EIjKkoE3s7jNSn9r2XWkN3BJ8NpoqNnWQNEcKYyYXoCibOKGMt3QfYiaoPCiQPIL6zHQyz46MCNZwARRHp/myLwFonyYbGusykVMugetOCx29H7xWaH2L0g7fZdZnepGlWSwl7/MGk+QA9O6S7oYw6Kye7+DLOxKX5eKOpZZqyG9HWwxLAw/2zMOQSC3ItfunyQDdnThDhR2YSprM3iXEGR9aqd51BG405O7eRnIdu3xxUeimA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=garmin.onmicrosoft.com; s=selector1-garmin-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53tqQ1zT723D3hlb1XQZhyiNhs951ZxNGWV0ycCpmBo=;
 b=zC1P2I5CS5/hLdjip5zmPdQOWysJLoN+fynhEl292tNjXwTAzOy47wnj6gB8j1qBJWM5Yhf8SpwE1N0jlFKVmklZZ1Is9+GBViochxSaeCIpANtRVAtcuq5QydeYQ2HJQ7MsptvtzBuAHu8GCQDMpURd1eeI93bX7a1aD3ufyOs4opLvEZ6E+LtrqTsi+YLNwNvlDv8iZJAkVeM35pxGzj/86/AIKFDA1b6luAG/3rY+5nb+yj/PqbsqAcqFH4XDk3KvB2Ab4GvMa0483Bsv943L2EA+h6Mj3ez7mGhCuN02R/Wk1qGY19AN6BqQOHTZRytEXkfRjyC+Hd96+N6cSw==
Received: from DM6PR02CA0061.namprd02.prod.outlook.com (2603:10b6:5:177::38)
 by SN6PR04MB3888.namprd04.prod.outlook.com (2603:10b6:805:50::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.28; Mon, 23 Nov
 2020 14:17:40 +0000
Received: from DM6NAM10FT016.eop-nam10.prod.protection.outlook.com
 (2603:10b6:5:177:cafe::bf) by DM6PR02CA0061.outlook.office365.com
 (2603:10b6:5:177::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21 via Frontend
 Transport; Mon, 23 Nov 2020 14:17:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
 DM6NAM10FT016.mail.protection.outlook.com (10.13.153.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.25 via Frontend Transport; Mon, 23 Nov 2020 14:17:40 +0000
Received: from OLAWPA-EXMB5.ad.garmin.com (10.5.144.13) by
 olawpa-edge5.garmin.com (10.60.4.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2106.2; Mon, 23 Nov 2020 08:15:44 -0600
Received: from OLAWPA-EXMB3.ad.garmin.com (10.5.144.15) by
 OLAWPA-EXMB5.ad.garmin.com (10.5.144.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Mon, 23 Nov 2020 08:16:13 -0600
Received: from localhost.localdomain (10.5.84.15) by smtp.garmin.com
 (10.5.144.15) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Mon, 23 Nov 2020 08:16:12 -0600
From: Joshua.Watt@garmin.com
To: <openembedded-devel@lists.openembedded.org>
CC: Senthil Selvaganesan <SenthilKumaran.Selvaganesan@garmin.com>,
        Joshua Watt
	<Joshua.Watt@garmin.com>
Subject: [oe][meta-oe][PATCH] fcgiwrap: add recipe
Date: Mon, 23 Nov 2020 08:16:11 -0600
Message-ID: <20201123141611.7329-1-Joshua.Watt@garmin.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 327dfc1a-6e7f-48a7-284f-08d88fba893e
X-MS-TrafficTypeDiagnostic: SN6PR04MB3888:
X-Microsoft-Antispam-PRVS: 
	<SN6PR04MB3888BD8FAF4F69FC685A0F0199FC0@SN6PR04MB3888.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TOrpRIo+Mn03boQBF7BcXjQa5/EX2N6mrtT2yFiHZznZPa2ydEGstXMeg+qQsetQMGX7LWTemVL2iJ3itXpCmqY3iDWXRAl1iWN5bGNKTM1JV+7lEr0Wop4fmNMQ5X6eCqClVh+q9Ynkhz/q5LmMj2KVPFQKP99XY3HZ6jj/R5+e1H+QOoNMuxhtvURh7NnPqbPIn+Njy5FdiZwX6w2H6PCXtRoAzpzvxlEdW3snNcR1GY3V3/F9xaItrG6o+06Pb71DlG/KxrkfcnQw5kY3kuShMt9FMuabsxvCHc5+U+oCWvhQ+PjBZIR6qPTDFDv5gv4uxLW/UsdWc78ldNpDQPMmBsn89H0GYCGyx2DnxF3rHyjhJITlADiC1fxji9VDm+9cuacp16gStZZ+KmeH0t+34VfbJpIIcyGSBnz4hX5gcrZ3Kru/eaC37v5AV/eTh2Y+XAxWGfn279icE5O7vos+zS+a2sdI+YyV8LC+nMA=
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(376002)(39860400002)(396003)(346002)(136003)(46966005)(186003)(5660300002)(26005)(2616005)(54906003)(356005)(82310400003)(36756003)(336012)(4326008)(1076003)(316002)(426003)(70586007)(6916009)(70206006)(966005)(2906002)(82740400003)(478600001)(47076004)(7636003)(107886003)(86362001)(8936002)(8676002);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 14:17:40.0557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 327dfc1a-6e7f-48a7-284f-08d88fba893e
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM6NAM10FT016.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB3888
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-23_11:2020-11-23,2020-11-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=863 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011230097
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Senthil Selvaganesan <SenthilKumaran.Selvaganesan@garmin.com>

fcgiwrap is a simple server for running CGI applications over FastCGI.
It hopes to provide clean CGI support to Nginx and other web servers
that may need it. Homepage: https://github.com/gnosek/fcgiwrap.

Signed-off-by: Senthil Selvaganesan <SenthilKumaran.Selvaganesan@garmin.com>
Signed-off-by: Joshua Watt <Joshua.Watt@garmin.com>
---
 .../recipes-support/fcgiwrap/fcgiwrap_git.bb  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-webserver/recipes-support/fcgiwrap/fcgiwrap_git.bb

diff --git a/meta-webserver/recipes-support/fcgiwrap/fcgiwrap_git.bb b/meta-webserver/recipes-support/fcgiwrap/fcgiwrap_git.bb
new file mode 100644
index 000000000..f33b066c0
--- /dev/null
+++ b/meta-webserver/recipes-support/fcgiwrap/fcgiwrap_git.bb
@@ -0,0 +1,22 @@
+SUMMARY = "FastCGI wrapper for CGI scripts"
+DESCRIPTION = "FcgiWrap is a simple server for running CGI applications over FastCGI. Fcgiwrap can be used together with Nginx to serve CGI or Perl scripts"
+HOMEPAGE = "https://github.com/gnosek/fcgiwrap"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a95d02d614a3a0232d4e6e51b7963c5b"
+
+SRCREV = "99c942c90063c73734e56bacaa65f947772d9186"
+SRC_URI = "git://github.com/gnosek/fcgiwrap.git;protocol=https"
+
+DEPENDS = "fcgi"
+S = "${WORKDIR}/git"
+B = "${S}/../build/"
+CFLAGS_prepend = "-I${S}/../build/"
+EXTRA_OEMAKE = "VPATH=${S}"
+
+inherit autotools pkgconfig
+
+do_install() {
+    install -d "${D}/usr/sbin/"
+    install -m 755 ${B}/fcgiwrap ${D}/usr/sbin/fcgiwrap
+}
-- 
2.29.2

