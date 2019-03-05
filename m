Return-Path: <Aditya.Tayade@kpit.com>
X-Greylist: delayed 19149 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 05 Mar 2019 09:42:00 UTC
Received: from IND01-BO1-obe.outbound.protection.outlook.com
	(mail-eopbgr1390059.outbound.protection.outlook.com [40.107.139.59])
	by mail.openembedded.org (Postfix) with ESMTP id 5BD227C629
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Mar 2019 09:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=X5bVnkmf+sN0BjYYReKo40iQplfx3ogz+wvolDnV47w=;
	b=NCihnXx5VcXdk8V977DArAwGSQHj6U6hpDz32K3DNw5uTTC52IVPkjpWZmdWR8StNFuu/99LUyLdFYTH4nu7gv+gBKLcFNtQGGyJTOevteU48uPv0UuXf1YWFzZEFVxgjNBww8T0G7ZrZBYLIrz8niFNNkEgpH0VE7TSyWZm8pU=
Received: from BMXPR01MB0854.INDPRD01.PROD.OUTLOOK.COM (10.174.216.146) by
	BMXPR01MB3928.INDPRD01.PROD.OUTLOOK.COM (20.179.240.144) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1665.16; Tue, 5 Mar 2019 04:08:06 +0000
Received: from BMXPR01MB0854.INDPRD01.PROD.OUTLOOK.COM
	([fe80::fd31:8a8e:b35e:2c6]) by BMXPR01MB0854.INDPRD01.PROD.OUTLOOK.COM
	([fe80::fd31:8a8e:b35e:2c6%6]) with mapi id 15.20.1665.019;
	Tue, 5 Mar 2019 04:08:06 +0000
From: Aditya Tayade <Aditya.Tayade@kpit.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [OE-core][meta-oe][sumo][PATCH] run-ptest: supplied user inputs
	to add_person_cpp
Thread-Index: AQHU0wkI6s3ZPxPyREeMR0VXwB3JIQ==
Date: Tue, 5 Mar 2019 04:08:06 +0000
Message-ID: <1551758877-6519-1-git-send-email-Aditya.Tayade@kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PN1PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:c00:1::32) To BMXPR01MB0854.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:b00:11::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Aditya.Tayade@kpit.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [43.241.126.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b0e70fe-c793-47f3-ed9f-08d6a1202b1f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BMXPR01MB3928; 
x-ms-traffictypediagnostic: BMXPR01MB3928:
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; BMXPR01MB3928;
	23:owZsfqLLeuEtwRhJ18s62FWaZHoRVMtfhZZrW90?=
	=?iso-8859-1?Q?3PPPIJwy19JHsPL8/mKhrdmhu1m0W8ankxkuRjOduqgmJ/KWQkl5xn7jb7?=
	=?iso-8859-1?Q?wS3OUDu2o3z0aAM7yb4HYU+3wGV1vgdq1HZY1QOqfUyjvdkOPZA2YEIGwl?=
	=?iso-8859-1?Q?uJIVJQkzeoCABeA8bqmeZ66Ox7TZYh3qqLGzU61ZcnYIa/ddQNOwJMP/jm?=
	=?iso-8859-1?Q?qLlo0n5I6pZ7vOKTjxSsEWH8jIjaG2trTiKBPp4D57MT3zXVTMoIU0EYM0?=
	=?iso-8859-1?Q?tO6WmC3eT3pb0vl998Wl9zlj4T8KHK2bMBjf26jPYpwpwI/uC5DBX83Q0j?=
	=?iso-8859-1?Q?BJNwZFqiYwLhCW/87v0/4v4oWTy5nyrsqx9ghP9Su3QBKlw+anIG+qkFjD?=
	=?iso-8859-1?Q?4AOECIEdphKv/356LCeTqPpY0CPX4jEgsgLcFWwC6QOuLuVs/JLoFB64dq?=
	=?iso-8859-1?Q?SjOLSdrWn97ro9NcJXX/HxWdWpNfb2C0NQlHJj5YAdfPZqhxSX5wtYXXk4?=
	=?iso-8859-1?Q?phmDFAcm9dh1ApclQc/egVy25OG6GO/CtYviC+tRqJqq9Jao19edifxgA2?=
	=?iso-8859-1?Q?58AkyxMUhYIVPhWHE5Qg1j6fADIjKL5LuUZaNCuBG27eTc6MxXaXjbKnKs?=
	=?iso-8859-1?Q?jeZd8q8VWDnEcb96dhW6XTPt9o3YkSY+GlTLD3ZrUenobYS6FFqoTXshER?=
	=?iso-8859-1?Q?jneUJGlnaCJNc1z5FFi2hLNFYaBx4KN3OFQ393mcPHiGb9Fo9P2kNmuQcv?=
	=?iso-8859-1?Q?rpksps6zyTZFYNcT0Eqq68iuccLIbdSN/r4ATGivwKMmVpr914OmRdxT8d?=
	=?iso-8859-1?Q?TzgIMiJbT+yuI5NdkG2Ohid9L6xtenAvIkNesGzpkbyw05i6upB9C4YMBO?=
	=?iso-8859-1?Q?lSGiZSfwcCMs+dnmtz+WuIMpDFxyl8mQ6hWdHIMeXLQ6a91H9rd6Wntr2x?=
	=?iso-8859-1?Q?6rc/ptnpDMilgdI51H+/5pZWgqkgi+AYYqJlgwtUdOuJ/P6h8RnD9JaYZj?=
	=?iso-8859-1?Q?IZKogKW027CKUMvXLR1GXU02g8Tc5JQBQ++h57DOl3QQrv8SxzbzbE/Ak/?=
	=?iso-8859-1?Q?jdgVjf9a1uKLU2UueKUZHgGZn5uWSlP+G+Q91NqiMmSi4pN7uL5rGt6B7T?=
	=?iso-8859-1?Q?v0SZss20ZAfs8YguSqb3ycfZKT7tddRdBI/ArLhd+3u2boJp/0UoaDZZIF?=
	=?iso-8859-1?Q?NomYF5cAFoNIYQa2Vc6+QLuuRNGYLNXc67r1aqcENWwosXfZb5G2S2jFtn?=
	=?iso-8859-1?Q?00gNhqq4EaXdL8pqlgkCM209gHlDHsC+HywMHHuMaCjfXl39cOc3yJ6DiF?=
	=?iso-8859-1?Q?Cs=3D?=
x-microsoft-antispam-prvs: <BMXPR01MB392861A3066B0C24C4EF7F7591720@BMXPR01MB3928.INDPRD01.PROD.OUTLOOK.COM>
x-forefront-prvs: 0967749BC1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(136003)(366004)(376002)(346002)(396003)(39860400002)(199004)(189003)(107886003)(6486002)(99286004)(72206003)(97736004)(316002)(3846002)(256004)(14444005)(71190400001)(71200400001)(478600001)(2501003)(2906002)(68736007)(105586002)(102836004)(86362001)(6506007)(6436002)(52116002)(386003)(5640700003)(486006)(66066001)(81156014)(8676002)(7736002)(2616005)(305945005)(476003)(81166006)(6512007)(6116002)(26005)(5660300002)(106356001)(50226002)(186003)(4326008)(2351001)(36756003)(53936002)(8936002)(6916009)(25786009)(66574012)(14454004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BMXPR01MB3928;
	H:BMXPR01MB0854.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: kpit.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7VWLahruCk6QAvbnA7pGf1rfWRdYc6nT7W2ZkyoZwbKtKX9EHpV/2Wvplx2Yr8Ou1lsXR/jelsNwBT5G3SRkRK6Dkq8H5e8sGlCtq/vXrcAQSvQ0eKIzihbjsFb+XW5FMbYRjnNjbJFZD4EGQZlPSD7ssCBfpY/c86zqD0ZsQJbmD5YlqA2H8hpPBQPkXdx3RIPtR90HozwnpqkUkNFv9ZmGqD7246s+hPGclwLTDTtSNKtJKL9/9mXmL+Gcv/MJuLC4tkKUzZbMgIYVXPly3/0RcixpjfYHAEYgP4ir3vkLrcAx7D+Vilo95gF5U5clxqt+OZQNUzMczRqOfSkqRIVtPqpn/CbNj/yvPB2BWeR2ANZAUEmP3Cm/huGx78ZyNfBWUGKmBGorBwr+Rn8xx07s2mQLkviEb/7pQhOh+Nw=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0e70fe-c793-47f3-ed9f-08d6a1202b1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2019 04:08:06.0737 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB3928
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>
Subject: [OE-core][meta-oe][sumo][PATCH] run-ptest: supplied user inputs to add_person_cpp
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Mar 2019 09:42:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

During protobuf-ptest execution, add_person_cpp waits for user
inputs to write data into test.data file. Fixed this by supplying
dummy data through standard input.

Upstream-Status: Pending

Signed-off-by: Aditya Tayade <Aditya.Tayade@kpit.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/run-ptest b/meta-oe=
/recipes-devtools/protobuf/protobuf/run-ptest
index 7c3a8d1..dc6c83d 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf/run-ptest
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/run-ptest
@@ -8,7 +8,7 @@ for write_exe_full_path in ${DIR}/add_person_*; do
 if [ -x "${write_exe_full_path}" ]; then
 write_exe=3D`basename ${write_exe_full_path}`
 echo "Generating new test file using ${write_exe}..."
-${write_exe_full_path} "${TEST_FILE}"
+printf "1234\nname\nname@example.com\n" | ${write_exe_full_path} "${TEST_F=
ILE}"
 RETVAL=3D$?
 [ $RETVAL -eq 0 ] || exit $RETVAL

--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

