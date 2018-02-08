Return-Path: <mkelly@xevo.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0069.outbound.protection.outlook.com
	[104.47.37.69])
	by mail.openembedded.org (Postfix) with ESMTP id 92AC5784DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Feb 2018 20:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=hr0ihwm9/W2byzmzFecKeE0vGm5uuXaKQsdox0dU4oU=;
	b=PRqgKzwFsvGLkQtHqOMP0l2ArjmxaDXp90we0SCq78AZdYrbxgwqTSgIpiM7A9c3EF53WFxfxw+pgfEDkXu5C7SGL+oSlzIkf/UaBaSi9NsEPv8ldF5Oj6e/f+LV5THaCwFgu6oHvFvY5xeBBV4PaoJ7XSoTpHdiK6b4Hy0r1M0=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from columbia.corp.xevo.com (65.122.179.226) by
	BN6PR0101MB2932.prod.exchangelabs.com (10.174.87.141) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.464.11; Thu, 8 Feb 2018 20:16:29 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Feb 2018 12:15:53 -0800
Message-Id: <20180208201553.26484-3-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180208201553.26484-1-mkelly@xevo.com>
References: <20180208201553.26484-1-mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR20CA0004.namprd20.prod.outlook.com (10.171.151.142) To
	BN6PR0101MB2932.prod.exchangelabs.com (10.174.87.141)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 190e38c8-d6fb-4de9-a3f6-08d56f30d6fb
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:BN6PR0101MB2932; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2932;
	3:cPu7XkQ0WsBgzv4IlXMBCr7WJ2KUWtSqaNGht77ULrOHuhjDtzTYeINIIPqEv2PXgQp1xVOKek0EMq5211SijECqOKEIpeN7JT32kripNtBRQErNXVys98Vvcj+Vyz+4gQOtmVl4mcWZcMVJsH+aOJ/guF+T/zN0g08A6ua5KCAnltOXpbFvb0iYjEorP0n3yqOw+eh/YZyBZpxZzypz8OMIDJqtkdT4TbBTt9E9RwMB3klJJqmht47p1WVdREt8;
	25:OAMVtxFheXuFnVOFXEZZ1eO4dGGX4HPCUz4e3+YE1f+G2nKufI6qYRDDP57XnL0GvMqxqds4HXHq3Lx20FlNl1q0ku8nPTFRUvIEYmB6+ZgJDACZ4klRuQQXNzpCn2cHWbCHcL/r/pDzG7aeUBWfih41qCwToq6hPTCj/gtpt0KJv4YD/EuVkdvhKw69tHqjtQdAqXyXnnybQvequUAoNDtEPu5gE45ewKnhVWLeOlBu/usTvaLraY37VPQ74wpmt3A49E36HcXydL5wq89qbZUMRjXnrGnUkwqcItC09ANcBjdMiPI1xfRd/q+zo+/r42+ZlNO3Rp4mMlZzRZqQ3w==;
	31:Yg+lPBQji6ZSWEjwCo+zYJ7nBZz/hj2vuU0vpA3OA8KLcf9fEFaGfIKNAebTAFYDAVli8qZtii24xweG3xQmc78uK9DfEdvxBEBZjSM/U/qPYGCI1yfBWUR2/U/3QLxhu8sclXWyJcUG43gJDUfnTk4yljch+CWvodlgfA+fgJ/8r9HaWeDL7KPpGjqBtCzqY2RicGlQkILVTeKFBaTY8VvPo3vvGKMblIBZjlVRyNc=
X-MS-TrafficTypeDiagnostic: BN6PR0101MB2932:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2932;
	20:LBWeww0Y4ojOf8EeEcGgyTu+YDoS7zRdeWM6oXGAZqVHP1SJmNIXgyBdT4DsLDLKwiCuPKTodWUSXqPRR/EzKzEq4c8sAQ36Z9yfVQ8KXUcVD2BBXVFecXc+25I5MdEEt8QUkF7UTOjR6hyl7ucuLol1sUv6s7Hd0AP1LOTkbI6xagCcetRsm/3XmSIn8t6mM8za066nE3e6ZJc/i8vQaAvOj9JZ33stRcZ54qiSc5l8cC/Hw0QdR6xEP03OVClmTzrf89f1ZxbNc297UvDQcHWw+GIg0594iJKPesxGrshOsCt8IB8094nKfv/SPemuPS6qcSbEBJCwLK0ZvHGBN7zbEgS4RGUNkKPWqp7bx5clotLLjOHTkQv4Sjcnife1fzFysN1/k23Rlth5F6rio8AykIbBnR97roIaugjEVJ8=;
	4:hW9fqBP3QyzXE48IyWndi6dShEdNnCO524jKMi3PjVZe/T1f6UuhEc8dvLWQbSRY39U+Rwv/Jz/H2zbRW75Lh3CYjVfuiv32xfhvvYc1fn3WDww40Hlul2cpe02tjaD8Qrr9P7IMPPb+XsFIdoV52dME2S191Qa065Htz3UB0IpoATioV4eEYcBtX9djLmPFfIZYHGfV6rjpvsZ8gXguwDMk2OaYa86HpEveVafUuthJ18xs6G8YufiKQzx82HadmDwJ18L0CblNhQ8gO9W2Kw==
X-Microsoft-Antispam-PRVS: <BN6PR0101MB2932A3A4FA3E6E4FC9191F50ABF30@BN6PR0101MB2932.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(3231101)(2400082)(944501161)(6041288)(20161123560045)(20161123558120)(20161123564045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:BN6PR0101MB2932; BCL:0; PCL:0; RULEID:;
	SRVR:BN6PR0101MB2932; 
X-Forefront-PRVS: 0577AD41D6
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(396003)(376002)(39850400004)(366004)(39380400002)(346002)(199004)(189003)(36756003)(2906002)(26005)(2351001)(50226002)(106356001)(1076002)(3846002)(6116002)(2950100002)(50466002)(105586002)(6916009)(48376002)(2361001)(6666003)(81156014)(81166006)(4326008)(66066001)(97736004)(386003)(186003)(8676002)(1857600001)(7736002)(316002)(39060400002)(16526019)(16586007)(8936002)(5660300001)(6486002)(107886003)(54906003)(53936002)(478600001)(47776003)(25786009)(575784001)(59450400001)(76176011)(52116002)(51416003)(305945005)(68736007)(7696005)(86362001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR0101MB2932;
	H:columbia.corp.xevo.com; FPR:; SPF:None; PTR:InfoNoRecords; A:1;
	MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR0101MB2932;
	23:A4DT20zGCGT3YRYuZelYGNJ78MF4SWomqfEMINQ?=
	=?us-ascii?Q?J0cIQ5NvZPMIIKbHBmdhuq4IRqE+9XhF7HHMKP65JA5ZvzxBJ5+0quSspNjm?=
	=?us-ascii?Q?Nt9B1hoYVld825vPVGLRICkyRYTV4IHhGGG6tf8r4EBUWTq4BAchhxgUp6Wr?=
	=?us-ascii?Q?dHoin4O78Qr/SUva/752h2qSs7j2/3+ovb6uAk93m7v6/xHM/dpf3lRvRmvK?=
	=?us-ascii?Q?aWMUHDQoOBxuGnyjGddRElmZ0xCCGe5mRYmF0pz+nTqV8yLscvS4dxKbybUJ?=
	=?us-ascii?Q?WzIcPsv7KdJURnMd0Gba4xPuQl6035gQtlJVrSuc5wo1yM5CStYiaFG7jdra?=
	=?us-ascii?Q?gO4qOnwd+nf/2pzFus+vc5paVGvPMnS7FDeGLEUcbAjJQTkSumMAvyCC4q6q?=
	=?us-ascii?Q?ClR5hpDcFJ71f0WFjQPgGeHxM51p68sDNI3xyWKFPrpM0/6EorjCi4SAoe90?=
	=?us-ascii?Q?kyWXPnF5hEGKbYuhJBWk60uRoiV9nZOTsunKvSW3WER1hI8sX9xgbGU/NjTk?=
	=?us-ascii?Q?Bm2AFJ0zjhWoZ11IYSpglUGuN2je0kimypD5zrukbPXJXvGU8ck8YHsmo6HW?=
	=?us-ascii?Q?UD9IeImHU3ZEALgWVhNk2e75UMG4lGCEir7wpOCU8ws+H57E2Hbzf/t++7po?=
	=?us-ascii?Q?JayaIof1L48oi3ocUrVmVHDqlDt0khPKsPUiHfIevt2wvQeLz0uJEuoxZZMQ?=
	=?us-ascii?Q?7lgoHPUuq6/2dbG7QWkx+C5nJw8yoh2arHNl5UfwzLA01C8Zchz3037UXxkT?=
	=?us-ascii?Q?v+jtV/JndpJ+2jBq6JatiEqHqI6vBhb6wtvFe7pVypSmrO3Yncsh9yZCwGm5?=
	=?us-ascii?Q?CorftBbV7fbZkwT6V8o+HG1BN6/r2xYL6EtghezJ59kjlD/aRXjAHzIOytdG?=
	=?us-ascii?Q?9Ps2Blqb37Gi4lXSyBSKuIL6oMfJBVdaXHHGl8l9KRHSDeSCjJ8REYGv2Hw4?=
	=?us-ascii?Q?0jr270xslI3Wlr1UPCexxs1u2fo71mw1BiPxfyTGyYRU99q/fTE2Gz9veR0A?=
	=?us-ascii?Q?LezePDenP/Sa9GvLI7WCkIjiiaciKm9LeBHslyoroa1BQSxDG6DIrduu3nEp?=
	=?us-ascii?Q?SS9AwP15xVkqK2qjR3QnrjhYzaTyanONRNf7NKjQctGN1wLxk41ThJ8ZRu/x?=
	=?us-ascii?Q?23CuHoUb9OIOvI0+/sgSM5hB8+FmfhgwTe7x4SH4TZsQSmUUMTYmapZR4BZO?=
	=?us-ascii?Q?TUVB3H3FLw+NLM6a+couaYV5TlsuYAmbUw9kHxdAWfAUTenhSiRl8LGwzjyD?=
	=?us-ascii?Q?pDhHN4fxFFDRGW274AX0DBbH8ywIb1I2fx1KyLaDpShT6UZ2jhFLXi38iGnR?=
	=?us-ascii?Q?kCA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2932;
	6:61uMeZPq3katE9NbkWfEjp7GWuvc8lQzFkD4wvQI0mW/Qq1EMv8SS/dzychX1KgVtcziRqa9XBAIPa0KjtLFOmNrJexdj4u1yJ35d/8mreId8VR4glZcUpV6yEbtvDpcyG7wsk+k+V4f17//oovvcjluRAd0ikgBeNi/HS1G435o2i2hqJFiiVrUjqqwDhXaUBI/FxMdAO5bjm/Hm+789HKW2MRufuJqjbKqEeAD4gcv0tYc763zSsHxpuNsrAiQyM5972hu3jjzn6K9GpELTDHqQb2ofWbDIpeyssxMPSAI83KFb+/AQuQA2QmSQrNKNATAknUL8Lr+T83em1yhm6zG6f/p9aDmuoNGAeGxzCM=;
	5:jlG0Ob4i7rObfWSaRqcQndgySmlWlG34MT+hYpX7JobRqo/8Xg/6DVruviy74wvjaMtiYGVVCvpmVK4Cvu0tGBxb2pWZ9sqiUuYu3ylfKX15w2CnDe//OuotFcvz1lxDOtOPEfAAiymjxj+AxqBZEg4utVAz5cADbkY0wvNvlns=;
	24:5a8jIRJ/dqg85OWrlftZ3QELISMeFhPPey5eQfKNKYs1qYmSuPvFBquoewDZeD+RvdsaHKD7R+nwdfFyXf0niTdWDz7DVXhC8GqjijlZQMQ=;
	7:TV0slIxxwCv3ak2xRJDufJJwDheAYlsCpBjr7fFYSSwqDziCZF1tTpBpdOaJHKdSVtbKJSBaWxuNB6Ss1HM/H3tgitR869+RseIrFrhG7P+K41nKVdKe04te2GhxMb6O5THbvJgAKMwz9w8V0JQFVdbPq6gF3iouK78I1uSosPgi7Pd0BWF4PJLJ250eKug2r3RSzRfn4/YwX4eatvgFItBfcLFzAEs2NUDyGgQGmDLcUQ6g/Lo1jaHVVSUMbDXT
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2018 20:16:29.3878 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 190e38c8-d6fb-4de9-a3f6-08d56f30d6fb
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR0101MB2932
Subject: [meta-python][PATCH 3/3] python-cython: add nativesdk support
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
X-List-Received-Date: Thu, 08 Feb 2018 20:31:19 -0000
Content-Type: text/plain

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-python/recipes-devtools/python/python-cython.inc | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-cython.inc b/meta-python/recipes-devtools/python/python-cython.inc
index ddaed1d16..dee647ef1 100644
--- a/meta-python/recipes-devtools/python/python-cython.inc
+++ b/meta-python/recipes-devtools/python/python-cython.inc
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI[md5sum] = "6149238287d662bd5d5e572482252493"
 SRC_URI[sha256sum] = "6a00512de1f2e3ce66ba35c5420babaef1fe2d9c43a8faab4080b0dbcc26bc64"
@@ -22,6 +22,16 @@ RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-xml \
 "
 
+RDEPENDS_${PN}_class-nativesdk += "\
+    nativesdk-${PYTHON_PN}-misc \
+    nativesdk-${PYTHON_PN}-netserver \
+    nativesdk-${PYTHON_PN}-pkgutil \
+    nativesdk-${PYTHON_PN}-pyparsing \
+    nativesdk-${PYTHON_PN}-setuptools \
+    nativesdk-${PYTHON_PN}-shell \
+    nativesdk-${PYTHON_PN}-xml \
+"
+
 do_install_append() {
 	# Make sure we use /usr/bin/env python
 	for PYTHSCRIPT in `grep -rIl '^#!.*python' ${D}`; do
-- 
2.11.0


