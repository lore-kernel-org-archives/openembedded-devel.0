Return-Path: <mkelly@xevo.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0047.outbound.protection.outlook.com
	[104.47.37.47])
	by mail.openembedded.org (Postfix) with ESMTP id BF840780AA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Feb 2018 20:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ALfo2slcsQBIMblX+uCqbpnZz0kSZYGyIEvMTRZaWM8=;
	b=jKgMKQzVqoflvLY1iZxwqP8W1oUAGulBpEM+NB3cOg42bGGStfmMKf/EP7oA1Ju2/+rgvSgaiKtJ7UTUldnV8zbuxnZ8vDbchqa1yTcO382kOWYzKyM80Q7tFkrsSCVOPkb9r5yrpxOlCWhnkKLUzZ1rxQnt4pnZ5/OeffDVPM0=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from columbia.corp.xevo.com (65.122.179.226) by
	BN6PR0101MB2932.prod.exchangelabs.com (10.174.87.141) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.464.11; Thu, 8 Feb 2018 20:16:27 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Feb 2018 12:15:52 -0800
Message-Id: <20180208201553.26484-2-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180208201553.26484-1-mkelly@xevo.com>
References: <20180208201553.26484-1-mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR20CA0004.namprd20.prod.outlook.com (10.171.151.142) To
	BN6PR0101MB2932.prod.exchangelabs.com (10.174.87.141)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6acdf9de-6f75-4617-d6d1-08d56f30d5eb
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:BN6PR0101MB2932; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2932;
	3:0S5LcPJu6bnybq9It7mQmOh4jCKQD/Z20wU7T56y3AP+HUrnVizEgbDz1Pv8xpqFV0g1deHdFmIsv6qwtaimyPHziQ2S8grQXAeag4xkgGbs0TIQtXsBZyQOgfUklTpWGAHefBkFg6EaE3GXaO1Bx3Pt8KlQ8Qd8JUCXaHssIvOcm2WNOXeX0HZI56ecY7NQBZzs3Xq9O9w8hOpTIxzOGbWoW3+2ipAcIyudyEDi66EVrtaD5RY8+xs8vpmjvPLW;
	25:DqqlmB+mWjdVvw8DEqdn9p6ppQU3+gTVNr0HWtNX0sbmBuNVJ80n/+4RvO1iLvs4rdWX719+PHKa0p5/pjTb5dVt79evyp/pf/CgdniNNPk1cz8KptMUGW/jmh5TpysOiXk6CtaPCpCvXtk16wx3dUiZ+OZ6tgCkHCYv/oQsB0aRZXXM5N2obNNB3K6Vg8F4n6OuIufzwW8V5XySyCth1kzWSfgye+95pAhyaf8SAF7JSQoz8MjLI2zWBJXH3gH17iD3ltXN3q66IuWnCJnT6UEwX9udI4QnWsaLK9jOYEmV17V7THgYG3rDDTyRodxsmaL3bDfym9DVd/MEK0glKA==;
	31:Xu5uNGA/mMuC0dh4bFX12aAlqhLZZIEgWowPctuor5wnnZHgYJuWUhj2i83Kxf4XYzUgJUR0y62bik21s8vsq9rPD8RtlakbOOMlipWpikRUF//3LRG8NA93Tm9OgZk4YbI6kn9FjqjsL1qUicmmRJTwkKAqeJMd/0W9pQOJlohzR03GRAiB/wfH+Ackh8pj/aHtUMv7zPwNSIGZl9FC+svEF6wpw3DFb0zSPwI3XMQ=
X-MS-TrafficTypeDiagnostic: BN6PR0101MB2932:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2932;
	20:QHv29ELjOfl2CSvOW4tKribmNhBgY2G8z7lBPkWV+dwMFkuDN/pnBqWbbHMM98JglVV3BQgWRbeHv8Gi2p9jNeszzR8KhLYU4+ogEmoXvYT+L6FkzSXt/9kbEW9Kx5Se69VcDcp+YOT4aX0VY7g6AJG2KGTqMzyuqXQCjtVQLEX2v9ebzBCIip6vb7ewHwBajUbh3+IalfG3LsC9+nqSbIbOj3nb5pGeHb9+47QNPzp/BJkP0a6ZM3G8oo7RX3/gyLVLhTtS07C44hEgsT9aLNeRtzCj/BN+lapeRJL+od2LrH9BQaCDhj87OHCda7KCce5e8b0tO44pr6tmhZ/sSUg7IX7j1hfDaHWazIwMSi/GSZh0fHCo81fhC5jgN/a6ShkmXRuyNw+1VT/bc9HlKWdypmx08fU+rLXxYlDUweM=;
	4:yvxjpqdD5IbN/Typuy0zXjlZ3HYM9pI2K/Qviz1Z+5liNSE6nBk50oS3IkIO5CKsCT2uoPsNHdfGyqzOM9frU9XTYHEd4x9pHXmWH+wzcji2lqb0I8ZfSvqJ0nJZGygt3ozrvTUm0eqt8wbNa2iRkVaICKdUgCiiKp7sI+p6AETZ79l3vplhXOzH5Nfig8VyM755mbm/eD8Ia6nMolHoOGlp0ZyOz+705/7KzhNegJ9LGo06VH/0Mkud/2uWHKl1YPopfWKs2a3E+19xAjKHhg==
X-Microsoft-Antispam-PRVS: <BN6PR0101MB29323055243FD3584EE7EE6EABF30@BN6PR0101MB2932.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(3231101)(2400082)(944501161)(6041288)(20161123560045)(20161123558120)(20161123564045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:BN6PR0101MB2932; BCL:0; PCL:0; RULEID:;
	SRVR:BN6PR0101MB2932; 
X-Forefront-PRVS: 0577AD41D6
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(396003)(376002)(39850400004)(366004)(39380400002)(346002)(199004)(189003)(36756003)(2906002)(26005)(2351001)(50226002)(106356001)(1076002)(3846002)(6116002)(2950100002)(50466002)(105586002)(6916009)(48376002)(2361001)(6666003)(81156014)(81166006)(4326008)(66066001)(97736004)(386003)(186003)(8676002)(1857600001)(7736002)(316002)(39060400002)(16526019)(16586007)(8936002)(5660300001)(6486002)(107886003)(54906003)(53936002)(478600001)(47776003)(25786009)(59450400001)(76176011)(52116002)(51416003)(305945005)(68736007)(7696005)(86362001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR0101MB2932;
	H:columbia.corp.xevo.com; FPR:; SPF:None; PTR:InfoNoRecords; A:1;
	MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR0101MB2932;
	23:ynnkG/0yZo8jCq09kneqT3z3rWnENqiDVI27HeV?=
	=?us-ascii?Q?5yUrrBzfJEsRG0vZthtT5aKYjdGqQl6cdImCAUwsWnd/BAb62BFVDElusA4l?=
	=?us-ascii?Q?ZngD9rWtgRwyq2zea9m9IYMc4bgIGBmY7b05++IU2Km9BsHloNtBFVHmvF0R?=
	=?us-ascii?Q?J+kAymjuWLSnZyM8hGsXrHqwrCRmhxTn0nYK6FhPMOY4EpFiRXME5YR9mBnt?=
	=?us-ascii?Q?ZkBW2HHdkCtiKepbjxcR6sTqk219NOemK1AQGHvbwMaWMTP17KooqCIUs7+w?=
	=?us-ascii?Q?kjXRt/ULdR8LOZ7UhJWMv6qS23qj/VbWitHDZqbQ5heEA5K/yAkUmTZkzg1x?=
	=?us-ascii?Q?bh0QuFRSnehz+Sb+ywONoCNugw8/t6YOAwktwCFjrBiideLFHiDhnca0XZiy?=
	=?us-ascii?Q?fqScDdoZvBIXPCAluyh+DHdx7m1c4RMIJ//A57+6oRns9Wka2itA3Dkyu8fx?=
	=?us-ascii?Q?eXHFkedFOXwGqMyFAmsWxd81CieAW6dGZqO5Gj2/GIRblBjBNtAAUkNHhqhJ?=
	=?us-ascii?Q?5Vk4jMZFuYhd/hsnh5ESXBxJJd5gKS8bFo5qq8sp/huqQdxCrvmIay01xJkF?=
	=?us-ascii?Q?1v9AQyvj73+AZdEYWEJiX9Ynnp0uKpWZSsCfk8199WCdMSkMX7JUp9g8Uzmi?=
	=?us-ascii?Q?vF4ble1V1nrIcKnnbVuKobwLI1B3o9ByfjMR2N1v38KRcz2ZCQ0Yz6huEujJ?=
	=?us-ascii?Q?CSp92X0D6v+q04fQ82JjRc5+Swdf2Dz4T/YAfRCQcg9T4dr1c2tjDUwGOV4q?=
	=?us-ascii?Q?uvkj3unynE0t1Z9Hme8leYh5ta3UQ+Rhn/4ufThbGePUwj3xqbMkvUYrO59f?=
	=?us-ascii?Q?KyZGkATKbXQm+SGfmuFGtD3QqQk7JloWgRxIsXLXCkO7Ufcm89IRDVTJtFrg?=
	=?us-ascii?Q?iUQ/khQnPeXcjOGg6g3U8vXfkHpMeeO/pyHrAGwVCi5h4Hnyf6tfCWhc6wbY?=
	=?us-ascii?Q?vLpGBVOT18ceky7c0v9c2FKTP0B5tKsVaV26jmb91/0kAVzJGY6UnRyc5LtJ?=
	=?us-ascii?Q?fAQdFmXQbvpFS+oseVYToE2kudOBg2wZm+6KWsxzr7lYaQ2BIybGSRkENgiH?=
	=?us-ascii?Q?npMa4ebtkI46NXa3v0Zn7N8sw+CVsg3m/noSlzRRq5j2jY28W5eTm/nvnQJt?=
	=?us-ascii?Q?w14j7ED46TC5c1eEvJaf451dc1Nb8qHvTr7D0i7Cz/XnyXps7KpiqEFx0HvK?=
	=?us-ascii?Q?uVZXG+XCdiN3lgZtJP9Us9UFxSNDmk/BE7OJYADMrgc/wDTuQhJqnQk0+j1H?=
	=?us-ascii?Q?dPaE0hj3fMVK4s82ySd0=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2932;
	6:35+DpYLNJRPjSCMZy1GSbjmUlJp8hRgxPtDmlX97E9v+z2z7hOa0ZeSdOF1SDqLAd1P+Qwnt+E4B3CA/VungeZ+Vro0s4asojSQc7ixBUzAIrlYgu7uXRsdOCQ/+2EPIcb2ggPBMSX8cZ5a/H7qi+67tc9IjWbPuSR8F/ljkh8pJvvzMglqeAA21QDRo6ozlRAjn7rtTTA8jqYVVHxuDEFLIzcft8F2PoQtdBCoWSHJwftR3BBeao4sPa1AamyGNcNg+/yatsSV4Ufl8ryGB3Byer+BIyxVyYXzJ/D/tUsQ5JUTBKOPBN3quI+UuBDGf7hxMvwuNzd6wLJrZCIhhqK0KFWI5ezJWTlBI6R/5Y0E=;
	5:dzrwVeQfKtu3A676VysukvhMVvPhJO0iGsFrhjiKAoXDOCq3dC6acohGPY0zuK7HxIh8ISCdsSZRQmuJRTloGPTaFSaoDc1cYa9nDXM8GGS7eRrD9yvVBza4YFKCdjenNFXh8mLFskTZP6jQrcWDK8YwJoPqkDESShc5qy3MNNU=;
	24:rBMxBvwtLo8gSHJF0Mxn8uhysGAg6qrps/WBStYfWktKdGnaeEu+QhCjTcXp1E5iZqk4Ux/tYKH5oOANC8B0Mh8KNOUYrTQ8fpq8S/TPDJU=;
	7:uDSH0splfAju06XbCtGquNbo/Es5i+qPr6HH9eKiAKD3DQVWl9ZJhkS86xA85I0VdHWy3umum+eRShiuJxNourMoivTNaVSD9vzYuskpLQOTRcNTtU5nKdbJByot06YUr2cjoH6CgUmrJGU5/TuYs1EzrdhvInkcmuKTXgHoVWX5NHUqB3Ru2lx7eT+2J92guD9bzfZ2JmKM42wuBRElJz6oUjCxD2ebLwT4YRMO8bDCKGhPptjX6RA6S39NYYUV
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2018 20:16:27.6065 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6acdf9de-6f75-4617-d6d1-08d56f30d5eb
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR0101MB2932
Subject: [meta-python][PATCH 2/3] python-pyparsing: add nativesdk support
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
X-List-Received-Date: Thu, 08 Feb 2018 20:31:58 -0000
Content-Type: text/plain

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-python/recipes-devtools/python/python-pyparsing.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pyparsing.inc b/meta-python/recipes-devtools/python/python-pyparsing.inc
index 19f6d55f9..e30839f87 100644
--- a/meta-python/recipes-devtools/python/python-pyparsing.inc
+++ b/meta-python/recipes-devtools/python/python-pyparsing.inc
@@ -18,4 +18,4 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-threading \
 "
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


