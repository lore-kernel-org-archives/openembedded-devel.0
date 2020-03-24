Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.73])
 by mx.groups.io with SMTP id smtpd.web10.293.1585090151533401776
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2020 15:49:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=LfASVAkT;
 spf=pass (domain: xevo.com, ip: 40.107.236.73, mailfrom: mkelly@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f1vi+LXn6pFazf8+bvK3EazNt0FoxSAmZ5jd56H+hG8HcMK3kP6PkZx4giNAOfwtuMST7qtnwE5XfdUYBBU8bEl8CtESlognHQ4jJ80r/Mb8Qwckxipk8o2KYLRrLTFJtSSi4ssfK1zIGZAQTn8Jgrb3cp834Wsqc+LCGXW9jXnC7gapmNblUDuNuOhJKynYWCiuF0hbi7uTPXKFsWH7CP7IKc8sIVTVru4rfFZb0VB35gOAV5QCbAuVQ4LIoqZx5UgUztcPyuLPPYrGM2yi5B+JQKngdxWE7hJxwAL9qyYX7M/SyJpjEBiSEuXHomnNT1B80sOMHY/aPFGf8oDOug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsDXEFw2Y7bAK/jUTAHdRi0WQMCl0QDhlrIQw+c48wI=;
 b=j7TIP9tx/Ppbw08LIRq5sTCmwIhvhtAmzpCEERs9xfXMKQ3WcUaVLOCWoMygd6UEosIVENkbDiuKre0DKhgwEZDYX7wpfNsKLxfMXHjZG5NgxUh0CiRsX9IfkurwgYjgldGDJziiizZ3Md7UpjqACnlohu34tBpyfbtWd1y507SLuBpLN+ykxAk9GgC361fW9bfDrESlYZ6gvxRq4Ah8WOWrBCpqTcevp89XUm9MhcB7WdtSHaNfX7OV0IOGlSBOLyKdjgoJcUMsj7ZXZDWXG0k/c9lCB2mKFnYVPWdI42z8uPJRc1kNUtu2hlpzt2swN/yNN9vPVBkZeBbNHgPhkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsDXEFw2Y7bAK/jUTAHdRi0WQMCl0QDhlrIQw+c48wI=;
 b=LfASVAkT04saiOt9qMSF+q/AcKBHzQNjklhlrTuGt8ze5cmfXmRhhnzmY/tQgEjBjbG7pdRal7og+XUhzz1ngSTltmWcWGDOVM0KSFdNAh48fc7kW1VZzrgIXuHp62W/XOWpeSXfgdQWOQXPvzvC2ZdfxeL95nDUUH719Cq0Vqc=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mkelly@xevo.com; 
Received: from MW2PR18MB2236.namprd18.prod.outlook.com (2603:10b6:907:7::14)
 by MW2PR18MB2169.namprd18.prod.outlook.com (2603:10b6:907:5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Tue, 24 Mar
 2020 22:49:10 +0000
Received: from MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0]) by MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0%7]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 22:49:09 +0000
From: "Martin Kelly" <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
CC: Martin Kelly <mkelly@xevo.com>
Subject: [meta-python][PATCH 07/17] python3-simpleeval: add recipe for 0.9.10
Date: Tue, 24 Mar 2020 15:48:33 -0700
Message-ID: <20200324224843.752394-8-mkelly@xevo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324224843.752394-1-mkelly@xevo.com>
References: <20200324224843.752394-1-mkelly@xevo.com>
X-ClientProxiedBy: MWHPR22CA0068.namprd22.prod.outlook.com
 (2603:10b6:300:12a::30) To MW2PR18MB2236.namprd18.prod.outlook.com
 (2603:10b6:907:7::14)
Return-Path: mkelly@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from columbia.frontierlocal.net (50.35.85.47) by MWHPR22CA0068.namprd22.prod.outlook.com (2603:10b6:300:12a::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19 via Frontend Transport; Tue, 24 Mar 2020 22:49:09 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [50.35.85.47]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d9b2636-23bd-4e8d-cfcd-08d7d04590a8
X-MS-TrafficTypeDiagnostic: MW2PR18MB2169:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MW2PR18MB21694C659E50EAEF79294ECFABF10@MW2PR18MB2169.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:184;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(39840400004)(396003)(366004)(136003)(346002)(376002)(6512007)(66476007)(66556008)(8936002)(6486002)(52116002)(4326008)(36756003)(316002)(107886003)(66946007)(6506007)(2906002)(8676002)(81166006)(5660300002)(81156014)(2616005)(6666004)(6916009)(186003)(16526019)(1076003)(478600001)(26005)(4744005)(86362001)(956004);DIR:OUT;SFP:1101;SCL:1;SRVR:MW2PR18MB2169;H:MW2PR18MB2236.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: xevo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	i+t0TooBxzCBgP972ioq0W2vvbNZN2MqXStm7bhULI9/j0DSdntrW8quZscfs52fOXVLcB8i2dxe0OeV89uGGmWxpaTtR95Rt22Xv9botXI9OI2BCU8n1cZ+kT/HWobdYcrATa8DP9mddX/E37GM548LgkYZ1UVcQIvfVfDqKJlGj8l+obH9L8b2hu2NOwNM2kt6IPVeufGkzJTY5W5oaIFYly1ZPuukaWPut59z24tOkgKGG1AhN22z0kvNw+xF+9xwI3Om3Ue2eoQ+GyRQNS1lGLWvTJxlccDBtxizMmdWG6pC1idNJdJNVNsGfl3/KMaczj8AgJ7COb207uvRYIWsvT7eIiZQyDwTeXvLmUGfDqI8GTQZRylGpoA/j68CxORKY+0t9BiToXgc0mSeLbJNxQyYP3geM7+b1GC6LjCrjShZgq3Mr4AVCNhcM106bdVSViUvDj30gqodPAzEI07uEDOHWNovoKYMQpNCf/SR/MXsDXRzleZOImfiTpJJR/8+oK9+UbDCjViLRsBJtw==
X-MS-Exchange-AntiSpam-MessageData: 
	tVJcAy0MF0qM9cBq3lEzEiOQdYKZb31lCOJxKv/2Fs+4pfvdqCRT/yptJfup6h1fpiQEdVC7S7V53BAN3YnFUHaUEVvFTMmhX46eEJkkqJUpvhjuTJBwPYGhOpfeAXVa3UKvm0514SMzEP3oBuvTVg==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d9b2636-23bd-4e8d-cfcd-08d7d04590a8
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 22:49:09.8595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P3innIuidoIRXvgy6Nb2qyn2BFmp9SudCeh+zt+hqnPpcYl01MoJcWDyjZO9Cd+T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2169
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 .../python/python3-simpleeval_0.9.10.bb               | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-simpleeval_=
0.9.10.bb

diff --git a/meta-python/recipes-devtools/python/python3-simpleeval_0.9.10.=
bb b/meta-python/recipes-devtools/python/python3-simpleeval_0.9.10.bb
new file mode 100644
index 000000000..633347a93
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-simpleeval_0.9.10.bb
@@ -0,0 +1,11 @@
+SUMMARY =3D "A simple, safe single expression evaluator library"
+HOMEPAGE =3D "https://pypi.org/project/simpleeval/"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3Ddc9277482effe59b734b004cbcc1fee=
7"
+
+SRC_URI[md5sum] =3D "f175fc12d408487ca26fa3905e0a6691"
+SRC_URI[sha256sum] =3D "692055488c2864637f6c2edb5fa48175978a2a07318009e7cf=
03c9790ca17bea"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1

