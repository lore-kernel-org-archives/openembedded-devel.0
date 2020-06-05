Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.48])
 by mx.groups.io with SMTP id smtpd.web11.1524.1591391779713317810
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jun 2020 14:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=I4tIwR3g;
 spf=pass (domain: xevo.com, ip: 40.107.94.48, mailfrom: mkelly@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sompy1KW418/Qm0k6ctJ07V29IaA/fUFJzYLeGCtZ9rWdBGv1/wQuc3iBjbMCzbirsU8KEC39QFxmPSZdrBrQSAs1VJzOg/ap9s4veYSHXc74OZe+/kScUqLE9CfVnwzoYkYk1YrVpWuinwxUKmW0F/LQLG9hmvzg7Ypiw6kbh0YCpRtQOYL5ZAoTpoIQiI+gf1tSKB2ZdC/AzSZc7hvPr1Rc1S1Q0WTbip43qm/VUGEKuPPXT8cp/caGZFX3NN3OOu/vtGaY0rUJOzhBR0xEpoJb6u9V1QjEWMLtGYKQu2aVLaOJ+bizcthuVouiYncKNFmFPW0x2QRqoeRZhu4kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rfve9rgWolc21W7xHAUMExdBIbob0bU0xI3BuW6YKDE=;
 b=Z0Y3H2onLkzRrpVOXrRG1ZscumNUb/qb31qA2OHg6PPycEMsEkGJ0dqpOLz6SR67KKOJ4XY4AM5xcOCIbLsLF0hlLWmZMiU7xLp8LP2v4im1f7u4GrF5EINIw7F8/jXo2d8/ztrsSa2nLcbutWho3x+iEL7uUD0A7xCkP0n5KIhwmc8TKNOePZx1iVYPN/zr0Qvy83is+rx+N8HAPTJRbdCeJuWegOYhe+cpvTC6edFLu79IqU7sloPrZR4Md3/J3TtHMt3Hi8OceiIHObqPOC4VPELadrrczbhNsft41sfElwVSIoJekkgOy0hjXePWc5uMmTSeQkesskzHpeOERg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rfve9rgWolc21W7xHAUMExdBIbob0bU0xI3BuW6YKDE=;
 b=I4tIwR3gKSsw1+3xZU0JSBZ69B2yDaNeZRThhvfMLZ8QjjZywb2DSLW7q024xWDFp18H+yPKwBhMM+6RSX9IzpilN9wVakBHCSD1KIK7wCifhQbkpuF4134xUgDym2e2MmTcbi/N0oQdy/QQgyzd7dCOZt/r+vmYBHHbbFQN4NE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=xevo.com;
Received: from MWHPR18MB1183.namprd18.prod.outlook.com (2603:10b6:320:26::22)
 by MWHPR18MB1373.namprd18.prod.outlook.com (2603:10b6:300:d1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Fri, 5 Jun
 2020 21:16:18 +0000
Received: from MWHPR18MB1183.namprd18.prod.outlook.com
 ([fe80::f183:20e6:b346:a1ca]) by MWHPR18MB1183.namprd18.prod.outlook.com
 ([fe80::f183:20e6:b346:a1ca%8]) with mapi id 15.20.3066.019; Fri, 5 Jun 2020
 21:16:18 +0000
From: "Martin Kelly" <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
CC: Martin Kelly <mkelly@xevo.com>
Subject: [meta-networking][PATCH 1/3] mosquitto: add native, nativesdk support
Date: Fri,  5 Jun 2020 14:15:58 -0700
Message-ID: <20200605211600.575432-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.26.2
X-ClientProxiedBy: MWHPR21CA0050.namprd21.prod.outlook.com
 (2603:10b6:300:db::12) To MWHPR18MB1183.namprd18.prod.outlook.com
 (2603:10b6:320:26::22)
Return-Path: mkelly@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from columbia.corp.xevo.com (50.35.86.191) by MWHPR21CA0050.namprd21.prod.outlook.com (2603:10b6:300:db::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.0 via Frontend Transport; Fri, 5 Jun 2020 21:16:17 +0000
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [50.35.86.191]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d1766fe-ff57-4e1b-294d-08d80995b00f
X-MS-TrafficTypeDiagnostic: MWHPR18MB1373:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR18MB1373907D8DDB6C1181C2D730AB860@MWHPR18MB1373.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 0425A67DEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jAKUPVeSn84wD0PeNciBnX75snf+iJW7kcXmOl9HbZuW3jJ0gBj6HAj05OD10gsKtNKxJf9tijBGU6fPOq+zYfOkikJHJ5bV7jmBjdZjOEa7Ehm7DO8wrS6MiXhZ/YbLC4DcHGlgguOf6C8/9SKYThVbpF7d7Kcga8pCA0VnyoI956FrtRUNDSrPZzhoW49mf4RQG/aiCuJGWCr6wXUpVEvX5tkQ8rDgKjjeiw58YIsMBp2bp9PJCmkplDadX8uBF2iJ4zpZwuGJB8JEja3rEaaXSSlOriSy52U4Yt+dSGFOHDcIzB40Tkjwfc48CHLScagyDjiY2kKigXKDolXF2w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR18MB1183.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39840400004)(376002)(346002)(136003)(396003)(366004)(86362001)(6486002)(107886003)(52116002)(1076003)(6916009)(5660300002)(4744005)(7696005)(36756003)(16526019)(2906002)(478600001)(26005)(4326008)(956004)(316002)(8676002)(6666004)(66476007)(66556008)(2616005)(66946007)(8936002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	JK6VAS8/vqFDlu6M55lvXGkXhrsuxFIEOnYDTl0C9AQljgKUdq3lZzpwDbDZG6saL5kUbzfeBhWa1VRV+iwE4oKhI8EuBmM082/cZUcsIPGaVOhgVB4NePq57pNQM41URIKz9eBu06lsXepuODSd2IQedL1K4ghE9G4k2PSLkLDwcBgWabEDz4yrqeyyMVn5Zd/dOG8Vgd09hbPlT/NNaEN4ZK9bRflvJoxbnGpvm/yX/qAzvGL9/BtXt4BZ0ZgQKHshQ74rGKs0A0swlWLbdrFn7o/V5Ce6uwHAPZIr829F+1aUqwtsJG+oDlWmy95bmLiXNLH7Hi5hHx3T/b9KOgGHw+iB5L5IraptZBt4DkBjR5YFDcW2cBHOf4Lshts7E38YIqyN2x13hU8xQY9JaopngzT7X6rhfymhcPNGdoHc868wbqG0gcEDMoPyu0eafo9hGosIswmmPNU5BKZdjPC2xTS924DeunlhMuz+tzA=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d1766fe-ff57-4e1b-294d-08d80995b00f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2020 21:16:18.4724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bgKvXw4E4OtGT/44QhNr9/jf3qkyHx8xbiyNbRGvHenLBZ7PDlwxYDfjIAZF2v20
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR18MB1373
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 .../recipes-connectivity/mosquitto/mosquitto_1.6.10.bb          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.1=
0.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.10.bb
index 31b5f678d..3961866da 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.10.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.10.bb
@@ -85,3 +85,5 @@ INITSCRIPT_PARAMS =3D "defaults 30"
 USERADD_PACKAGES =3D "${PN}"
 USERADD_PARAM_${PN} =3D "--system --no-create-home --shell /bin/false \
                        --user-group mosquitto"
+
+BBCLASSEXTEND +=3D "native nativesdk"
--=20
2.26.2

