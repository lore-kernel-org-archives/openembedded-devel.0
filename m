Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.54])
 by mx.groups.io with SMTP id smtpd.web12.5281.1615271991592299722
 for <Openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 22:39:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=BTPsHRc0;
 spf=pass (domain: kpit.com, ip: 40.107.139.54, mailfrom: sana.kazi@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lNTKocNZkSTV6/i96Nqz/OyGJ4NWkf3NtOL1xOQd8xibNr0r6rlCQbge/rDiMwIM4M+zsP1A25RnNcr5hhDJvwX5oTHTJz9xGu/Ux71SaBOFxe5RSAdJah1ANMUYLAXdDPb2JBcCn4d4t3J/sIYJJ9w1R4QBf2eq2Zhy7Z0hLY6VjhxHRYZ18x1qvUgbDF6kcfOD4hoAWy0sG8iBjyVHjsxGYQupmc1iXBybKVENjAAiecif2OexzUySLZDRbZrfJu96DQTGCJ5w181XxxLwvh0Dpqxp+x2IZ/Umqmf9ZMz6iLhY1V9geP5ERkIeRmPQsAhVXJpYd4mYDAKJlrT4nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OaUqhvItRT4sHMD+NvJapIxrSoZnEl3KLQQMK6aOz8=;
 b=IJqg5sKeyGuYwommjjULpUQFYhsoTTWHj4YDc69q5SC2ul9Mn+70TKV1K6XbE6phg+uwOq5D72xwf8Is8isPojv72/+1w+hl2spB7tjXh8siz6SykUyF8lxkpNTpmLIDUIdihUVtuO2JAKFmF11A3lDrWtBHEQj1LaSQtIT0Z/WMdNtehYoWi9qpgxsAkUt3xYkgl4lnDLuCFWqR833o5acnkofG5AcnzgwGCMrIvq5NeBmhve59aU6fHNEEu4yjRMwcTJ/amsRzo5vvSvP9oWHmWSAZ6ghaIQvraq1gB9g7Qltvyx8MFnFPsGoF5DX6M66l0v3nr5LIHL85DMo36g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OaUqhvItRT4sHMD+NvJapIxrSoZnEl3KLQQMK6aOz8=;
 b=BTPsHRc0JF3lVct6ylUF8elIEpvs0qC9+2HOrzH+vkUG0z4f/npyM8lZZuamevA0PKfO+YgwyMc9au9aIInwgeg/wrO1Rz2cCmn30PwguQ0PMMnnY7p1ZJwMsSN38eX4GWNGE9zlJwLIfwHey4bNpba9xrMWsZLar2FbpWrGhjQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:58::17)
 by BM1PR01MB2996.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:4d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.27; Tue, 9 Mar
 2021 06:39:40 +0000
Received: from BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6922:7ba0:39e9:85da]) by BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6922:7ba0:39e9:85da%7]) with mapi id 15.20.3890.038; Tue, 9 Mar 2021
 06:39:40 +0000
From: "Sana Kazi" <Sana.Kazi@kpit.com>
To: Openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Aditya.Tayade@kpit.com,
	Harpritkaur.Bhandari@kpit.com
Subject: [meta-networking][meta-oe][master][dunfell][PATCHv2] mdns: Whitelisted CVE-2007-0613 for mdns
Date: Tue,  9 Mar 2021 12:08:56 +0530
Message-Id: <20210309063856.11719-1-Sana.Kazi@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2401:4900:1b37:d4e8:5473:ab72:67ef:ca3b]
X-ClientProxiedBy: PN1PR01CA0083.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:1::23) To BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:58::17)
Return-Path: Sana.Kazi@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2401:4900:1b37:d4e8:5473:ab72:67ef:ca3b) by PN1PR01CA0083.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:1::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Tue, 9 Mar 2021 06:39:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c15a46c4-ad09-4e8a-4cc2-08d8e2c61d68
X-MS-TrafficTypeDiagnostic: BM1PR01MB2996:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR01MB299620499815E2E0418F70AB99929@BM1PR01MB2996.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1zKSoino8YMnJ8AlEKSQY7YfP2WlB7e9aqK3OZvdHcWuhRLiL3jW+gkxHAY3S7uallEOq98eLZp9muHLyTnVfTLagJPDLilRIZvizTyoOfUB6U+RLyl68VPqwI5gtyAOA7lAPxFp0bYzhhTig0PCIoDLJ/8m7ZUANttHbbkywl556LXWPfibMjfuclHHk+UP82/SDXFg11sPgE9zrs2pdttg26k5XdgjuB0w66dXMdaJ7cl4GbyNFgG4lfFSFWSNKwS1oeJH95yn6BK0lbB5hFvnDY9ykB24+BvsEYJZQ6hhIpUuP+6yqXBs1xww/x/c1D+waaz0Cu6fuYmwjD/mIhDAtBZJ9XOmlKAWGChGIkHWaVzL0+nQSrROdvjHb/e1DTWFt3ELRAsqGQo7RDRP0joGkxv5tp1k/hQU8DJqGa3z57uqAuF1LNz06a03dLh8m9s4YJOEWMpPB9q0j6dZ+MwTYpUe+ynY3JDMhzNicn4FCawCXQniHQsPMg4JQI5hR/eYy02OHPeLw3aX0KNRDR79PnteCx5MWx5SkdHgweEaT7DJUBkLbN8rScfoJDCsyLGj7dnTzt7BoAAQH/S+RgELNyNhPwRLNbtM4+F/CNShpcxe3zPY8UnSc+Ob6GSCnh2qx5UcKaw6f1mKClfAwscAL8EXujCGPSwEQzMGS34=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(39850400004)(346002)(396003)(86362001)(69590400012)(8676002)(107886003)(966005)(8936002)(478600001)(4326008)(6512007)(66574015)(83380400001)(5660300002)(52116002)(6506007)(316002)(2906002)(36756003)(66556008)(6666004)(66476007)(186003)(66946007)(16526019)(6486002)(1076003)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?83Nm1IL4VO/H+jn0LMmtu0WHD4jTo8uYizsZHtpL8Ote5ErAKnMkLIiZFz5Q?=
 =?us-ascii?Q?mdvA3rRAL5vEaKBn5VrglLYL4ZtwUGxvxd0WOVjbYBZfM8p/ck2l2owIMML5?=
 =?us-ascii?Q?MyfD+Yf1jEbHce22V6wtFR7X5sFh+ErF4uaJfvIHvNtJn/DWpsbVhP1lqQxS?=
 =?us-ascii?Q?YMoHqLqIvXxxdZS2n6OsP9wqYuwVOyPDqontT0pZLatAInKk29QSyCTGJ0Ia?=
 =?us-ascii?Q?f6u3LT0AweUCzZ5lTsJ0CczskJ/QVL24brQX4vVLBylH2v+4QL2arjsPfDdR?=
 =?us-ascii?Q?/XFtvetm5fFXzCTIDdSfxpY2OzC92/y6m8kcn8sHGUN5YQJCRHdhlI7lFn5j?=
 =?us-ascii?Q?afQbTAXtlTYeU2ZxqP9uXQpqE+mBRa0AQSfM7WpJROTDfFDvcf/ozQ097YvL?=
 =?us-ascii?Q?Y1zWxWBZ+UAP29xtIr6wYoyqWpS7D9KfH2sa/0HuATOyIcifii5ziSRr4bU4?=
 =?us-ascii?Q?OKydJv5sIShwE5ZlVcTc/6NwdhDmV85cMXyLQoY+wpOAerXJr3weSjguaTnJ?=
 =?us-ascii?Q?Za0OjrTeJtQyMBMcpMXgOUZqmFu6g2yHIKPX/hPcZdXR0hdd/6qCRIAgkYqI?=
 =?us-ascii?Q?C4gi8IZsQ7HBUSMm6ankFJc93DeTV0QVDKpWIE0iaDB+5zPk1AJ+PZayRDVv?=
 =?us-ascii?Q?io5ZQhFgtLMzs/kRDc39tDaCB/Uq7IYHlHV4kNWF1Li+SPoWxZCpnN3HCu8I?=
 =?us-ascii?Q?Fca2xinzpWeRENFOl0nQubdjyO8hIaDKdAHKt5DBRk8g+emkqRd/XxtMyval?=
 =?us-ascii?Q?kyfX09IqXP+NrdNHjN/1j8csi6hDJ1+4o2tFzla9Ge9/tlcHww/V+bxpj1dZ?=
 =?us-ascii?Q?uVbFMwPEwHmmmP7x6RPpP7NTZpZe8f638+ixmUOC8GkoMd8Vx26Q6NXuwR0H?=
 =?us-ascii?Q?jO6/a0rVUEbWi8zg/jDhTKJJBiJTAUu74WxI6iKhv2ruVeGI3TEZOAf2q2C6?=
 =?us-ascii?Q?ytG72+l9hNBhvgeIMR0wa2WcZ1OnxcXT9ddEkGKgSbMpo2kZ2p9HzgvqpF68?=
 =?us-ascii?Q?feby0E8hix3s1ifmkF0b3nFEXsQgu+DvfafIfD/GMaJ3WmiflveT5S3+GZ+h?=
 =?us-ascii?Q?KY/lgwJDUbEuZBwzLVj7UrusoEqcWPdjzjC9vCXQVHKYxgL6op+CGRH2Kx7P?=
 =?us-ascii?Q?pTk2mlCxx2FIBt1cTGVTVNiw8nWfWNn26km5rvFCYdaMGGYcwavlldxm0er9?=
 =?us-ascii?Q?GeroaSVuBr+C+Y8McUgf3pqz2PbnfppRAaic7ZlctPk8nu8IGj5Po2xHiRDb?=
 =?us-ascii?Q?pbpLF4ebXIzT7ufXfH2KmUdqd47JJ9XZoCi7eoa3bzlmo6xXU4vB1eEPkWFJ?=
 =?us-ascii?Q?ViPp8hKkQ+vDc6vWNcoQFXKIR3/A6QHBQQQ8rXqp+MHXkZwCpuVrQABmlr9z?=
 =?us-ascii?Q?XTCy+MdKFyWk3FjEr/fkb9cMAo5BxlqQiQAzzpmDNHjH3pwfFA=3D=3D?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c15a46c4-ad09-4e8a-4cc2-08d8e2c61d68
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 06:39:40.1639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wxKU05QhMZQxwfmdKzgT4L2DtlMLYV1Ph0gEg1+gOGrRIZ3L5qHcLhYbrSERbMpP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB2996
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

CVE-2007-0613 is not applicable as it only affects Apple products
i.e. ichat,mdnsresponder, instant message framework and MacOS.
Also, https://www.exploit-db.com/exploits/3230 shows the part of code
affected by CVE-2007-0613 which is not preset in upstream source code.
Hence, CVE-2007-0613 does not affect other Yocto implementations and
is not reported for other distros can be marked whitelisted.
Links:
https://vulmon.com/vulnerabilitydetails?qid=3DCVE-2007-0613
https://www.incibe-cert.es/en/early-warning/vulnerabilities/cve-2007-0613
https://security-tracker.debian.org/tracker/CVE-2007-0613
https://ubuntu.com/security/CVE-2007-0613
https://vulmon.com/vulnerabilitydetails?qid=3DCVE-2007-0613

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
---
 .../recipes-protocols/mdns/mdns_1310.40.42.bb       | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb b/me=
ta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb
index 445ed87e4..60bc26bf1 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb
@@ -27,6 +27,19 @@ SRC_URI[sha256sum] =3D "bea29e1616cd56ccb8f88c0fad2bcdc4=
031f4deb2d899c793e2f27a838

 CVE_PRODUCT =3D "apple:mdnsresponder"

+# CVE-2007-0613 is not applicable as it only affects Apple products
+# i.e. ichat,mdnsresponder, instant message framework and MacOS.
+# Also, https://www.exploit-db.com/exploits/3230 shows the part of code
+# affected by CVE-2007-0613 which is not preset in upstream source code.
+# Hence, CVE-2007-0613 does not affect other Yocto implementations and
+# is not reported for other distros can be marked whitelisted.
+# Links:
+# https://vulmon.com/vulnerabilitydetails?qid=3DCVE-2007-0613
+# https://www.incibe-cert.es/en/early-warning/vulnerabilities/cve-2007-061=
3
+# https://security-tracker.debian.org/tracker/CVE-2007-0613
+# https://vulmon.com/vulnerabilitydetails?qid=3DCVE-2007-0613
+CVE_CHECK_WHITELIST +=3D "CVE-2007-0613"
+
 PARALLEL_MAKE =3D ""

 S =3D "${WORKDIR}/mDNSResponder-${PV}/mDNSPosix"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
