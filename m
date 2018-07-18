Return-Path: <Rasmus.Villemoes@prevas.se>
X-Greylist: delayed 138827 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 18 Jul 2018 08:29:15 UTC
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr00099.outbound.protection.outlook.com [40.107.0.99])
	by mail.openembedded.org (Postfix) with ESMTP id 311B97885C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2018 08:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=XuPpKXve0hqF2DvXRNuJ6lxa0oMKhIOtusmTILNn63g=;
	b=AJEYLXposM/i/0jqPy3BpY/ya0JgvpamGuVTY2UgL3bbVv6US4YUQw2rvymkuOdedBA8FIxGt3Iwv/uJe9CekSYG5FASsS/YFwvbH1xzHTwk5NuKrfSEvqEiqVIaIg5lRgNAKAVtUWIpzkdoBSs18PziKO9avOl3JBul66OUXNw=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
Received: from prevas-ravi.prevas.se (81.216.59.226) by
	DB6PR1001MB1333.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b4::20) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.973.16; Wed, 18 Jul 2018 08:15:01 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Jul 2018 10:14:51 +0200
Message-Id: <20180718081451.20238-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
X-Originating-IP: [81.216.59.226]
X-ClientProxiedBy: AM0PR07CA0026.eurprd07.prod.outlook.com
	(2603:10a6:208:ac::39) To DB6PR1001MB1333.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:4:b4::20)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db79d617-6646-4580-dd1d-08d5ec868f1f
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(7193020);
	SRVR:DB6PR1001MB1333; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR1001MB1333;
	3:yize6+q/9X8eSpQL/QvFs2QuXGSxqVyDwq2Lr2YjvaiVy9Htnwute4YJQMTgJySqeHVXb+kkh/oNzTmJ3fkzAdJQcuju/vWszOTc/5Ubzr+H3Ft3O0sGmn2US++78amCkmdqiiWsdNssVzl2S+ZBoAsWM/9Z8wtM2YIvnGP85iI371y0yHr6bA8EUacvt9z6RtKuhQp90gDukQObv6H6miQRqtrH5Q/j2aDv0/dOeG7s3Rf+Ol1EzoPN/P2ZufVZ;
	25:H0JxG35joWXT4kL39PN/CIAtQMo+Wso9/q5O8OeOlalgqS9WqQXhsmiQtIS28w6qx8DBPqc5bNymFcu9bP/mAuw6UnltqryIyz2S4TzAlrT7mXm7fyn2Let2zr3MQ5l3ALc1mO/fM3T8xSs2SqiCmqZRP327vRCX6mK/RjQdd7o0ISxrQhgeMFqei0hMvtUXP4U032yAqMo3dtZN/9+cxRGuH/hbA+GY6+PsZz46+169q2sFetQzBctrcbhvwaC0Ux4FuDNIN+Xzte/PZ7Xc9feasy745kpaWShlhJUh6XbOH7wwuTRwnc0v78XCCPRzpv384wcC1Re1zVe+jqnYXw==;
	31:yNTuzkg0oiqhnOCTLYA8o7OXSqWvjCE0o/xrHM7E1O22eX1OqybCN7FPKq1wmQ/qhY9aMmuuM/df+aqFcXRO2XNX+yXBIcqH1RWvPiaI3sT4V9qeIkW7UW9Vum3kK2e2MGM5Od+kLGdPYqQ9fpwKtAZrOwZuJsBo1sj1C7S/MOLOrojuG1UOSKa+go+ncM7whHggOAgkpRC9ywfhET2sz+oBU1O+OYFDURlqmVF8eII=
X-MS-TrafficTypeDiagnostic: DB6PR1001MB1333:
X-Microsoft-Antispam-PRVS: <DB6PR1001MB1333CC81727A2384BF0BF1DF8A530@DB6PR1001MB1333.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(10201501046)(93006095)(3231311)(944501410)(52105095)(3002001)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(20161123562045)(20161123564045)(6072148)(201708071742011)(7699016);
	SRVR:DB6PR1001MB1333; BCL:0; PCL:0; RULEID:;
	SRVR:DB6PR1001MB1333; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR1001MB1333;
	4:guYsYfab6rM1E1bAhygJ3wxuC6LjCL+SFnYVrhhzjJc9cD/GuBdOYvXoTQmoepP4wNsNlxgEC/brSioMTgBbsaLiLwdEzpiBRAhFfmKW53e7/SBGfVio4JL+h6vrEvTl1ifaTgUl0XlWGBDWSFP3ReHQ99ABy4CAbT2c5X1lRIbN3W876DHQHR7ElfVOcDvaHxkMeuuKnzqGAmde8fk/3BSvnJbd2z4INDIUIh1VHNK/n0YAetcBVAv31dZfOOkJCJF8D1EUplt/T84V0jegmQ==
X-Forefront-PRVS: 0737B96801
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(346002)(366004)(376002)(136003)(396003)(39850400004)(199004)(189003)(16526019)(486006)(26005)(186003)(44832011)(36756003)(1076002)(476003)(3846002)(6116002)(74482002)(50466002)(1857600001)(2616005)(956004)(53936002)(25786009)(4326008)(48376002)(107886003)(66066001)(50226002)(305945005)(51416003)(52116002)(69596002)(47776003)(7736002)(53416004)(386003)(106356001)(105586002)(6506007)(2351001)(42882007)(16586007)(54906003)(2906002)(316002)(5660300001)(6486002)(68736007)(97736004)(6512007)(81166006)(81156014)(8676002)(8936002)(8976002)(2361001)(6666003)(6916009)(478600001)(72206003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR1001MB1333;
	H:prevas-ravi.prevas.se; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB6PR1001MB1333;
	23:SO06Du8jth8iHdFB9gf/gzRImOr4B7g6hyFEZ76?=
	=?us-ascii?Q?kYhk9aVpsf/N3HwIWi1lNRrkgiF0KWUZimM/HO4HDmIY39GUv7JixIxIb+OA?=
	=?us-ascii?Q?NwVz+y8JBmLwkigFvniOabUoNIxskgiKjVfn23pLAXQhJuPS0sOv0NnxfxYk?=
	=?us-ascii?Q?j+Ooa/OymtriXeBHRDM3RNQMfuE+NeIZSyReQzepkuHVuwkQn/Z+VfW12H/E?=
	=?us-ascii?Q?1VQ/ZBHzOPYXi2EzxQa4l6ln39gxf0pK0GVTd5vAfVz+wTRw9bOhpWsLR/vK?=
	=?us-ascii?Q?uKGVg4bdY0aTLayBhPCSFwUmikZdhy0fkLXFo2o8TzqHXS/BFSqFArlC3Q43?=
	=?us-ascii?Q?LVWYnzNo8QiLNSHI5Z7mJ4o2ltLmoZGe0RGAIBIvAUlUp7WdFA3BGJL7Iw2p?=
	=?us-ascii?Q?DCVdTIz+zvaeod9OOTVzdnyqXiNTICLLr1gdJWVBDz3YHJow2t6uB54leWpm?=
	=?us-ascii?Q?DUDqXj0fSXMsKSr354qsXeOBulu2Zn1ji219lJ/V8ah9r4k9pM4zrMjxTRCt?=
	=?us-ascii?Q?uC/XANxO1XWhkV+YNdSziQX2ZuHF18F78u+a1sCJJRt+o8vUX2I4MYNxjVGX?=
	=?us-ascii?Q?kh/7LjydHOclqTvi8z9bIeO4UnODYFOYYzHImHKoD+5KlHDcY8iLvv957nOQ?=
	=?us-ascii?Q?ZoM/l/uUc7FNUIrG0Q3OuW9M45gyKSsmnBkG9N2vR9m+Dga05L+Fd4qJeZjv?=
	=?us-ascii?Q?JTruTFQGcAiDJwkR3eWbTYjnVFaSzk1P10xf4QLKtBA9wWQLAfAAa4m98ZCl?=
	=?us-ascii?Q?o6a8na5Nzd4jGlKa1u9cdLMKk2VYtaxuUq4N6Rs1936C7gdhxeyOs46RmEt7?=
	=?us-ascii?Q?xA8XGtObJI08x5O/SPQUwHLqXmt1T6jPbw5KLm0I+AjblNDnO4llocqWqxxX?=
	=?us-ascii?Q?oMJbS1Ujt5NPfnNkayCvUnONVB/RcqB6piJqUEKtXoReK8DamuHppGkc6r4L?=
	=?us-ascii?Q?NhTX7PC9UgHpXZryX5LITrYuzG5cqaRkr8xIyGD2y1zWbckZwFfPcxrfQ1N5?=
	=?us-ascii?Q?9TPB5VCMjmJdiynVAE3DPydzaGKQMmTTpI/5MCcNMQTGLJ+SDZ6wb/hg9h3j?=
	=?us-ascii?Q?/s7s9aEIlTEEDg7LFSDv7L/18py79lnkZRwRqR4ot0pWcv16H4XUJOje7fmt?=
	=?us-ascii?Q?DvNmEbdmRexBc4rax+KfWEQXqePOR8Ksrd/0zlO+HAj4pLof4jj/LunoOMBD?=
	=?us-ascii?Q?1g6QYQo7PBvGpEETE3xQfVoox7i+WQFeZfj7/Y4r+YnhRZMfOEqUWT6GRIDX?=
	=?us-ascii?Q?uTCCL+8v7xVuxxWRJ2S3+yG9UzWTrcAmmtz6TRoxLtdNeiy1qZt5FW/RC6au?=
	=?us-ascii?Q?XrH1fNdX56KrHz8k9HsvvIDv2SV5/fKep+VGDsK1Lu1JRNA0AAgd6rU7mIHO?=
	=?us-ascii?Q?5ILe8dg=3D=3D?=
X-Microsoft-Antispam-Message-Info: Aoc8l3qlKXTw4iyZ2oXq0YyEy6FPFB3qXU9QEwJXsj3r9Q+vD5RGNpSKuGWTvTAA6RUzo2zBWOTAWkK0y5BS/NLIEzv3nAKVWtNuZ+Jp6JZMF9HAJt/YLEWgFUiVTbssznvJzLP1o3ahx2/aBVbzmAmkWL/m+ktHgxXRMa4OKNaRcmEMyUW5o8v/pitlXN1ziqoqvCVnT3sDxjJ0fBdUNtiHaXWf3TyUf5etbML1MSWzigtLOnCEK7GLyUxLi3u8kfIQRd9P552lkL7McIMUu7uHcSY+lUSwUqIp78nJX12uV+1dmBqyQmCuTnVtkTJJe+CN36+gpcQwcjeifXgbA3UXouVfww5vAYGgXr2WpJc=
X-Microsoft-Exchange-Diagnostics: 1; DB6PR1001MB1333;
	6:rMwXu13x4VWZ6S8+RwrNFo2NxZV+F8DShc2YEyBL4RAu8RJ2CPyulDIqVgir1IMLPrOy14ElkCnDdTN6b1wsz2/Vm+dI4kTSda9OVLY5Q29UzVTl56NWIvJ2oL/GThEvmdxTcMCC6hHXMJzV3cWoC5JjPEPFQslr7l4lvgd8BxX9m8O09YoGxYSshhGv+YLeR/phUAb2VuR+f2N3UmFP4jVlwfreQdTeLLEOSagQz9cZ+RU//KYNaThmnXyKzUZ6v5Ugps+vppQUcappmlVlxdzx/Q70Tcrn8K4Zm/LmDNM21aezsLFOmhiPx0fouTgDo3G8e/ljH+GvsgpfrNVtO7RRKfkPj4D8IVGIDCR2cONFgYMQqTlllno1E46yIp1BhNzrV7Gy5b4FUyUhgztv9ArJRwOPg65JtfhulmoHo3Ur3hRlftJcqAO4QfEsDLmu5BSXoEpATfbncd0lS/mN1A==;
	5:cxCUjI5fBZ0m91rOYfb4uI6ajlqoMs2gI4eEKy7I0d43mpVA0xhq1DfvPNacKqC98gOvjawVJH9/a3fOeR/kbHnJCAbXj+tJUUekIc4C3Od+6Nxx4WqqGXjWrLvSvRBeoWifTTUbyG8z3RLAQ1v0EGPSVzpvzd9RNOzZ29wtUe8=;
	7:3Mo9/7UNTwP/cuz+bhftTZewNb2LDt1CvC7lzFP68irtkcweb+HfS9pKtaWCR1zJUaefVyYXC7opN6LyPBmJbESTdzjkM6keEow8q/7pzUCCDEP+4yP9XLT5/uUPJa795CG36NPil1W/04ylga7ifiRO9PlPNGUbT5rZcQ1oIrJmu4z/5slBtI8iqt/mXLCeN6bm+I584MKJjpO7jZpKycQImU7S2lhWRIgd5B+SI94KZyhzgEX1/Ul4dUmH09SL
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2018 08:15:01.0783 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db79d617-6646-4580-dd1d-08d5ec868f1f
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR1001MB1333
Subject: [meta-oe][PATCH] vim: provide xxd
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
X-List-Received-Date: Wed, 18 Jul 2018 08:29:15 -0000
Content-Type: text/plain

The xxd tool is quite useful by itself. For example, building U-boot
using the CONFIG_USE_DEFAULT_ENV_FILE option requires that the host
provides xxd, and it's nicer to be able to put xxd-native rather than
vim-native in that recipe's dependencies.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 meta-oe/recipes-support/vim/vim_8.1.0172.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/vim/vim_8.1.0172.bb b/meta-oe/recipes-support/vim/vim_8.1.0172.bb
index 8e99919bd..b188c15c3 100644
--- a/meta-oe/recipes-support/vim/vim_8.1.0172.bb
+++ b/meta-oe/recipes-support/vim/vim_8.1.0172.bb
@@ -111,3 +111,5 @@ ALTERNATIVE_LINK_NAME[vim] = "${bindir}/vim"
 ALTERNATIVE_PRIORITY = "100"
 
 BBCLASSEXTEND = "native"
+
+PROVIDES += "xxd"
-- 
2.16.4


