Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.80])
 by mx.groups.io with SMTP id smtpd.web11.4518.1626431690736703353
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jul 2021 03:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=lxqMG4GN;
 spf=pass (domain: arm.com, ip: 40.107.1.80, mailfrom: ben.horgan@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHx9Eg631oXV7EEj3YyhJYkbxPxZMrEMtX24U4jacxg=;
 b=lxqMG4GNipvljVjC5+dS+BenVoz7wxPEmZvXZdlBVIgN/7T6egayHoAcw3r8ivOuLz+y4LNzy/1WaQSkTNrSfAmTrnZM0QHBEgN76Z+N9C9I2hOi1KPgaLMjgOGECOW5zjvaneZKYmj8getRQaTrOjqK+PqorrAu2nvFnHb7jgw=
Received: from AM5PR0601CA0043.eurprd06.prod.outlook.com
 (2603:10a6:203:68::29) by AM0PR08MB3825.eurprd08.prod.outlook.com
 (2603:10a6:208:10c::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 10:34:47 +0000
Received: from VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::6b) by AM5PR0601CA0043.outlook.office365.com
 (2603:10a6:203:68::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24 via Frontend
 Transport; Fri, 16 Jul 2021 10:34:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT015.mail.protection.outlook.com (10.152.18.176) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 10:34:45 +0000
Received: ("Tessian outbound 664b93226e0b:v99"); Fri, 16 Jul 2021 10:34:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 543907c160dfdbba
X-CR-MTA-TID: 64aa7808
Received: from 15152f71e56f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9D710722-D075-448C-906F-368DC444F577.1;
	Fri, 16 Jul 2021 10:34:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 15152f71e56f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 16 Jul 2021 10:34:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qmpop622rhC9ZMCYCKgaMu9xG3f7vckGWYyrTdbmJEKUsJ+ASncPjg7+DmOJRbG3TGTI8LOqzMHQKkzOVxYfHxpWFESJdvv7GLmOgdacuiY3iH25fJqpuFI9sBrzGOrjuRRoItllWuQr6HHaz0cZHvf45gtvwpCm+ai9sm95JqihkfWA1ENA+8F520QlCJplqGAJcf/kaev7Wiq0DlSb/8I4by5S+X/VwUICtlZwD+LgyqtbvfqtfDGiDL3ngEYpr7flSPtFo5vIh89DjHPQ+SAozbm52v2Aw3RYmjUyj0QHnYPZeADhE/gqxYakC8uNei+eDAE8Fo6Ie3rkwL97Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHx9Eg631oXV7EEj3YyhJYkbxPxZMrEMtX24U4jacxg=;
 b=cugSo2157eDzdlTLw74V7jl7/PLlrRDGGQpXRx8L8xuiUCairOpwu7tf3EUmE+yA5RolsJphbgu/o9CXz2XjYaQxkxDelEi/O+YEa83+4wpXqbOe2c+vkpc+ZO1kEpn+eOvZkoRknMZnaQtE71oansYmnR8MZ0eUJRiqKzJoZcfcPDzAksV5xnw+/d9+O0X28MbL+im9EDKribsTFbiHyH1IrlkSlZ1Y6+MY/5x8qkS4Felwzhdj8JYjtAGDGOuq5C3bNNmRrjnNGX1zbuh/b1gLMrFfRZ3qvYajrTwwCIwxpK2mmgCD/GR7pPCR1Ga9wqaseVb9QDUxWvR/r/3VVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=arm.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=arm.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHx9Eg631oXV7EEj3YyhJYkbxPxZMrEMtX24U4jacxg=;
 b=lxqMG4GNipvljVjC5+dS+BenVoz7wxPEmZvXZdlBVIgN/7T6egayHoAcw3r8ivOuLz+y4LNzy/1WaQSkTNrSfAmTrnZM0QHBEgN76Z+N9C9I2hOi1KPgaLMjgOGECOW5zjvaneZKYmj8getRQaTrOjqK+PqorrAu2nvFnHb7jgw=
Received: from DB6PR0202CA0018.eurprd02.prod.outlook.com (2603:10a6:4:29::28)
 by VE1PR08MB5088.eurprd08.prod.outlook.com (2603:10a6:803:110::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Fri, 16 Jul
 2021 10:34:04 +0000
Received: from DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:29:cafe::a4) by DB6PR0202CA0018.outlook.office365.com
 (2603:10a6:4:29::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Fri, 16 Jul 2021 10:34:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT004.mail.protection.outlook.com (10.152.20.128) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 10:34:03 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Fri, 16 Jul
 2021 10:34:02 +0000
Received: from e125437.arm.com (10.57.33.185) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server id 15.1.2176.14 via Frontend Transport; Fri, 16
 Jul 2021 10:34:02 +0000
From: "Ben Horgan" <ben.horgan@arm.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Ben Horgan <ben.horgan@arm.com>
Subject: [meta-oe][PATCH] cpputest: Add initial recipe. Version 4.0.
Date: Fri, 16 Jul 2021 11:33:53 +0100
Message-ID: <20210716103353.4318-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a5d3e8c-5c23-4e7c-27e1-08d9484554b7
X-MS-TrafficTypeDiagnostic: VE1PR08MB5088:|AM0PR08MB3825:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB382544A44126E9421FAE7BAD91119@AM0PR08MB3825.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:327;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 F+Hs9hUi0x7Y+ZGGAUO69tyiJqyI7D/5KTA6mwdS5y4eN8KSpEKXXO8HDn/sw7Uos3VEqzM2Qphf9ywW/Z9OVdyGylzxpwnAqb0vDrhdBNTuF30Nhkp4bmwRKe3j9UqM0+QOccEzlC7lBd4T3j0FlQvxYvyHEvUL/TxmzUxSOpshT79Q72GHvyOs0Qm05Eia5gaxigkeZhc12XLLrpYxo83xuN8lszFLlYUtX8Gg5eWUp3ckS8SIjy0b0xV3zIj+Kvz4yzKqKUldKRVEv1MGcmYz9GqeOA8ouFfT9nbFZgLzKv3CtNHJrOfmxL+Q0LEbtQ2Smzh7dll5gCPlFQSeYiIBEPUvFsTPGNbDL20tKdO5DYNBGXucN7unRt21UuEAVQNh2VW4PWyHkflX+/seBxcX18Nv+rHxFcEeGCckXhqMVfYEQwuX64ZjS+S6fm6aak5IF/WF42RCFqbDdx02U3lPNv+drwrGui9y+SFBW9fVseDcQlGJxwQn1EA8mVgpT3kUVjqHuhrPXbEklJ0cwiTPlxURH2cD+6CW5o5U84M+EKWw9A/FxInxp4cyPb5OLU8F9kFEeMdnYIuJyEH4Gbt2aNBE6xpN5G9CJCoVike7Vxr3Eu7m7tXEX0XV/83FLlTvfPlFPahhkp3nW4UEYZwnVp0y/CKZ6EcMz1JoDqmzIqwxor3HzjsMTxFelZ83P6u5ijyazpfQpyJWFE0WjfwaTH1bsMMCbEKgvSnp1bqbwyXKBeCvgJpBNx5uCzVLgaeeI5J3xRZiRWRi/MizCaauBykOiyIh+WlwHPFRW1l08a3+LyHiUYl5p39/JrwD
X-Forefront-Antispam-Report-Untrusted: 
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(46966006)(36840700001)(83380400001)(426003)(186003)(47076005)(26005)(1076003)(81166007)(316002)(7696005)(2906002)(356005)(82740400003)(6916009)(86362001)(36860700001)(336012)(8936002)(6666004)(478600001)(8676002)(70586007)(36756003)(82310400003)(4326008)(5660300002)(44832011)(70206006)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5088
Return-Path: Ben.Horgan@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9b3d5de0-44df-4699-8b03-08d948453ba0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Rc3YGKJD50Xlyhh52RzWGlKh44pM40hhY72oha3/6EXUftZ6ZiPOp+jRVQA0mCkpfYZekXLWhLIyM8rzoOJ5Mx7md2Dd7UQ1jX+vS/+FmSacNB5jHnuDw/m8OvWZa0sa5Vpe/w1TuD00Zg8ZtTI0hcwV/P/JX+hBV+tVQJKVgT3e2zdof5KHy/zCDCcQ+m8w0KWLSDvIPDbZ9VcTyRVD+FLBCvgv0WYIJB+lnlAqrrTdB6EMJ146s6zViJUqD6eZivRoxAOBZ+kg9a9Ojs/gXccTcZSiT0Xirisv6DQ3xxzpuweFj++rS9Vd1ERhR+rpGVv9VRCo2Y5m+T0wi3gutaidqIu0FZ3v6csUnuTAfBOje+ZcNAgWr9BvXB2wwwFhQojcJc75B6vu5UYA2nxv58gg6XNM5CenE1iEig5JeYiYs1auS3shNeVkiOlMLlslPwel7NKn7SwTnjtb5aEl4LctLfZRbW4wu6Eug1j4P7dPTXMamONTv+UrSECQvyQqI30wrqhv7c1jouJx9DtB9/Dl/UqmE69Kz/zY+fCvOrnvg4Xg6Jm1sHDBJrTEdrH3GXkgSp3i0Ss8KmZ9YBwiDM+cY8GX5Vj5IWLS6tcwbZXz5+ASXX3NMu8MuiC1XPn8uNFHCX8pZvHhegPr3QP9aRbRn4cgeO2Jymj0ZdCLN/09PvDMFeBRkRM+ByyXl9WJhXyQgfUFeBBIAJiYQ30bMCow+f7AV/I5OSe09dZ/1VwEdaXWb8q2/soprAf5+2vuMkW5Dmo776dtF1oBtODAXxDa1B6n8Oqpxs+fZlia+2A=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(81166007)(36756003)(426003)(7696005)(2906002)(8676002)(4326008)(8936002)(47076005)(186003)(6916009)(26005)(1076003)(478600001)(336012)(6666004)(5660300002)(82310400003)(316002)(86362001)(70586007)(36860700001)(70206006)(83380400001)(2616005)(44832011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 10:34:45.9689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a5d3e8c-5c23-4e7c-27e1-08d9484554b7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3825
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 meta-oe/recipes-test/cpputest/cpputest_4.0.bb | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-test/cpputest/cpputest_4.0.bb

diff --git a/meta-oe/recipes-test/cpputest/cpputest_4.0.bb b/meta-oe/recipe=
s-test/cpputest/cpputest_4.0.bb
new file mode 100644
index 000000000..057a6a618
--- /dev/null
+++ b/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
@@ -0,0 +1,25 @@
+SUMMARY =3D "CppUTest unit testing and mocking framework for C/C++"
+HOMEPAGE =3D "http://cpputest.github.io/"
+SECTIONS =3D "libs"
+
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dce5d5f1fe02bcd1343ced64a06fd417=
7"
+
+SRC_URI =3D "git://github.com/cpputest/cpputest.git;protocol=3Dhttps"
+SRCREV =3D "67d2dfd41e13f09ff218aa08e2d35f1c32f032a1"
+
+PV =3D "4.0+git${SRCPV}"
+
+S =3D "${WORKDIR}/git"
+
+inherit cmake
+
+OECMAKE_GENERATOR =3D "Unix Makefiles"
+EXTRA_OECMAKE =3D "-DLONGLONG=3DON \
+                 -DC++11=3DON \
+                 -DTESTS=3DOFF \
+                 -DEXTENSIONS=3DOFF \
+                 "
+
+FILES_${PN} +=3D "${libdir}/CppUTest/*"
+FILES_${PN}-dev +=3D "${libdir}/CppUTest/cmake/*"
--
2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
