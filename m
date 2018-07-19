Return-Path: <Sean.Nyekjaer@prevas.dk>
X-Greylist: delayed 14514 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 20 Jul 2018 10:48:30 UTC
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
	(mail-eopbgr60106.outbound.protection.outlook.com [40.107.6.106])
	by mail.openembedded.org (Postfix) with ESMTP id 106DE6FFED
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jul 2018 10:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-dk;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=5MH+7TG7QQnnbBbVyc2Q28xwJZjqkVFR/84UYZBtR8E=;
	b=GwbvT+E1SNgp3IFxZZj0206vNaEetDZ15+l8zbFTwNUuPFYeYXsU9Ogw4GxIZU3YAMG2fTW9rgnH+b1Ds+KKNaz9kloYtwm1OfqvOwbaDY5WG3NYRNzYY+IWzFhuUJBoznJxFpD2SKWI03HnvdgW60omIpXC2wddwQ7L4du9cqI=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Sean.Nyekjaer@prevas.dk; 
Received: from skn.prevas.se (81.216.59.226) by
	AM4PR1001MB1393.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:200:99::18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.973.16;
	Thu, 19 Jul 2018 14:09:25 +0000
From: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 19 Jul 2018 16:09:06 +0200
Message-Id: <20180719140906.16385-1-sean.nyekjaer@prevas.dk>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-Originating-IP: [81.216.59.226]
X-ClientProxiedBy: VI1PR0601CA0017.eurprd06.prod.outlook.com
	(2603:10a6:800:1e::27) To AM4PR1001MB1393.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:200:99::18)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fdacd91-3887-4866-8d3e-08d5ed813c5f
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600067)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(7193020);
	SRVR:AM4PR1001MB1393; 
X-Microsoft-Exchange-Diagnostics: 1; AM4PR1001MB1393;
	3:maDRETMXAo2OgULfkQ8c+f+b6Hp2cr9WtL4sml7yDYZbAHCVOrMNAqXiscgZh8Et/eQtSEZLUexDmAMyUMSU4hvNkREH0nw4jhXGMEOLa0MGrJUe0ELui/CJnMgLUvjneEW1yRQ1ajcVParWHdQLZRH2ucun3uHfFIeJIeR4sy/XPO6ddlqGom+XphfjbzBprIHjJV03zYuzTYe4vfQOLenHAMPxKP2/E2SVs1aQPxXJXRBo2THxmHJEsDLIevGd;
	25:SZcvs/RNx1EZqjQo88Txy9+tK5DjWr34EtDOSyt46gkvfEnCg6sHY6niozhH/POhqhAJA/iLu5YlL8d1GNQ7cWX38X4pzCp2750PCYz+CvmlEbxPh6RfEdPZc8hczA6Hf8fnBZrUtzcekRLXYVNJdmRCivuraYufQ8ckhgwQagxYwc3iEh+lyvE6B9C0ehVyY7lydSABtoKBt60DxAvxnwHniGxwqNjsN/48pPOoM8o0h9xkxdD6b/+bPOpUKbJ6QjVAo9tfTxd0e1gj+TSORxUKOMkcX75sDHLo8CJLAG0zIo4aCsIKdlVK4wd/w26a5CCrcJNDBpzsk8DnczDuSw==;
	31:tfyv2pRytGbqFcUma8BFt90nYxYRdArWpM1CejUtn4cKwmINWECwTS7YLFtpe+RIdEbVRRcp/F1mrJDUTncGHEQSb4dAbeXVmtEgEoHl/Sx2vhdqMOS0lDm5TUPteygVxWzUrDBpIqxygshI3w+fksnp6B2uveOcEqJLwfIA93grDFyEWLzI08MmpcJDPNrFBPLiBT0dtKivhbUN+oCZZCGebCt7K2gM5Y6EQfL6D6g=
X-MS-TrafficTypeDiagnostic: AM4PR1001MB1393:|AM4PR1001MB1393:
X-Microsoft-Antispam-PRVS: <AM4PR1001MB13934920E10A418B0A2039D5EA520@AM4PR1001MB1393.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3231311)(944501410)(52105095)(3002001)(93006095)(93001095)(10201501046)(149027)(150027)(6041310)(20161123564045)(20161123558120)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:AM4PR1001MB1393; BCL:0; PCL:0; RULEID:;
	SRVR:AM4PR1001MB1393; 
X-Microsoft-Exchange-Diagnostics: 1; AM4PR1001MB1393;
	4:BeCh0nd+7KZ6D8thf9IRPllQUP25BzJXN57mAGJrdH/WX2j5g8H/4cKc5ksl0ZVxvgNd1sAlkVGROs8oaThopGW+9Jw3z8vMVOveY7ddZ3hqv8gnx7wDqis/sWp+UhJoaNu6ZyXWBDArnCUCcPfh5Zt9jcKJT7564rjJg8Exk+hRjyiSLBapjo8mSAwbG1CuhqlbQxn8FyWXyHpTGPJODqm89E7OGwtdc31S09Pwx99sM1PSQFGaTh7BQuIo3eQzdDP5gVoXaFJEyVNztQvZNg==
X-Forefront-PRVS: 0738AF4208
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(396003)(366004)(136003)(376002)(346002)(39850400004)(199004)(189003)(24433001)(107886003)(74482002)(575784001)(305945005)(53936002)(25786009)(50226002)(86362001)(16586007)(186003)(4326008)(16526019)(26005)(316002)(7736002)(53416004)(39060400002)(6512007)(51416003)(1857600001)(6506007)(52116002)(386003)(72206003)(105586002)(106356001)(50466002)(48376002)(2906002)(478600001)(6666003)(66066001)(97736004)(8936002)(69596002)(6486002)(8976002)(81156014)(81166006)(47776003)(5660300001)(8676002)(68736007)(1076002)(2616005)(956004)(486006)(3846002)(476003)(6116002)(36756003)(44832011);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM4PR1001MB1393; H:skn.prevas.se;
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: prevas.dk does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM4PR1001MB1393;
	23:JRlDLcv13sX6v5A2sUMRYi4LFoMe0OLuc6hJvvh?=
	=?us-ascii?Q?VutOqNxOC0zq91jPepu4ssGsgR6+dSZqin7D/PsHoarOU/rU8wDy+Xl907qz?=
	=?us-ascii?Q?p/bjYd6t8fDQFhmU3HaTY0CTpTEEadPRtsL1x0mqA8KSfpdAlcTcPrIf/JyL?=
	=?us-ascii?Q?egw85iv/SqPd4WTY8O9BlzgCBhICm+XWLmKM5CqU5HylG3AM9wqEn3tw91YH?=
	=?us-ascii?Q?20nZK3yjlJlZ0ppBSxgCo46rjdccE9z8QnLvgNknA37W43krVE6i0Wg9E9yX?=
	=?us-ascii?Q?PuUVPLF04bZjqN97AqwxAS2kdxABptcKd2C8GG5fGOzGFIb4EKuNrIchl4lA?=
	=?us-ascii?Q?u2iZ47YZ9wMw6v7NYUpcZDpaBqpZUVHt6b6C6Z16nXXps4AixAxy42AfTHUz?=
	=?us-ascii?Q?QwjKk3PqQntwRS2BXCQrl2OJE+uZtbZiWp7XmsSKcFc9nrVOoT8oYMV/nNsK?=
	=?us-ascii?Q?/vT8gLECaZ4eoCxOUq8We33/Snjc98wqr7n+proCFpvEwIuJTnIHD2fU+wJe?=
	=?us-ascii?Q?3yqpbWTaU64Dj9I6kq895DE6SCrM1GVuKmKdRCL+IjocQpR0AJyn+INLvWPX?=
	=?us-ascii?Q?XifYrhhOtoULNQ51V3vrWczylGosfpkfsvUtagi4PKYbX1vWyClj2hydb7do?=
	=?us-ascii?Q?yrbiwViBWwTZkFomPjeuX4RwP96Bmccn5VsM/3oxzq9xesoJgfsGMqkfXQCX?=
	=?us-ascii?Q?CIZ4zAEPdub3xiVXk884iByzJWV/pyxKmoLh99RVscwdJ8qOWKL/CVrMq2Tb?=
	=?us-ascii?Q?MmSu6P/dE+szo+jJnyOa4z4CRuKY+A/Qs8Nm4Qx5rUhFS9TbLJ4u5eNDZGpO?=
	=?us-ascii?Q?mD3iP49yJkPWSN7BzGzPPFpevFqjJWne7PkuJ6YRWL74DrmbnbJdhz6cLMWR?=
	=?us-ascii?Q?m0tEW2MOq2JlDPod2IA8OMEIbutq2kQ86HGEgPvf0na6YlxpBtDPRRAuf27V?=
	=?us-ascii?Q?kIZGBrCoDCYIjxiQN1E3jmSB+w7V4s7Y9Fclk/1nr7D6/8Kg9AwU4qpcDUIH?=
	=?us-ascii?Q?gBeEYqQqAz1kM4g04vjCRbDmLjqcSMmAJlEg6F61uhIYjV83DZThbnAQPtdz?=
	=?us-ascii?Q?BacOvCMQ+vGtz80/4934qWjBdjK8JwpQFxnZFagNq+6kAIds6kho76hYP8Tx?=
	=?us-ascii?Q?/qauZmmgFgBWb3Y1iodE/CTqASr7q/tTGfTmQ9ukjrDEtqnlm/HMAzsKVVRH?=
	=?us-ascii?Q?9I9MrLgf91DXdwKPaqzGnfzOAY0UFONfqUi88NHYkwonsnUieHZy4tIkQFO3?=
	=?us-ascii?Q?esTH/itbe8Bda5FmV5rz19C2gAxOwrlZa01v42W5NUoIXICuBgH/akrAh/YF?=
	=?us-ascii?Q?y+VglDlizWm48DdHyRzoEz+qRgduleeXjBvSr7tt/8dOA7h65O//Vsdbn2Pk?=
	=?us-ascii?Q?3VNrI6w=3D=3D?=
X-Microsoft-Antispam-Message-Info: by9B8e4A1CLmM26/7yKj5oVDiB58zly5fnMEnYeHl6nGhfSTplhYIIuo3mdaBUBOJZ6HiBp75baFIGC21ruTSdVaJt2A6YDfGaGTKSfvUgeE+xOgDaW7qRXIAk5ODaO1bctk4eFbrHaoKiDFIe37xeLhCRISAV4PvipSa/uqoeNNYfh4d3/sIPNYog/+t5loH3ZaLgMEn9eu7My2y+5AIZr0WgM7V2ffgm5tUOjlOJ/Up1maFKswcsRIFFPotzc36iJXvWAM/tXikQ959nXZHvXEcn+NFdk+y8hUb6Du0koayXCIOXxvSmZjPOb+n8tA4aJA5gNsEA/L3OywmSBCAAddfEd0Y8qoe6an1MkPlNA=
X-Microsoft-Exchange-Diagnostics: 1; AM4PR1001MB1393;
	6:cenm34wUMXQ1yJlPdIsKKYh3wvFasLqEu4SiMfhGQlqEAbU9bwWb4fDjw5z4KIrEmQ+yD30kmMcKUtiIlcmjqnW2IdlcJCB+Z+ZVzLr5TwfyGcdRPmWJAWwloco86yIzPEwV7d5yEjkzowEZEZaadmX3T5NZhYbgQecx9lEAW98JOshcXrejAzfygqgwo/Rk6EzAJ1lJHVXNAy4EhQ99X/EisEX4bAch/61Hcy15cl0xc7DqmmdVHuvlQoNOeKd268th+1jnb1VQZlygZoNW8RqWZnmNXyCXtL98d3ThFvY7ruVvCyEaAJtHrjJP4TieN4uHfqIDgCDCfBh7UQDRvqb5F3rUpXVM6tE3rSoe/TGzHNCDwlP1gmEwp4P65vA8BZ6HVEZHFDx8egI+T+8KkWGtHgeL16P6SEZf1yz0ygzCb0iqljXkY4RoVPH6vKznsp9mnJ4smzS5QwS0mYCQRQ==;
	5:Etxn00LsSxjFC9aJMn8gA0F2/6UzCnjKkb7+0wh3A2cc2SS0EFRj0uzI8eA+XVTOpsF0iR5ob62SCOFi3d/dUD1LDRb+sbkYve3ECnNeLvx7iU47T+aBH2sTmuTo2HkSFCJ6RppffDzpE8hSwP8LVG5oaBC4pR1e9+gm7nTqKtU=;
	7:X7oxVvZ8feN7D75SpBoBVKKqBqebJLC/BRmovXUnhMoAWOGOcAAD8NH8zf2po/PFqkjsNCO+KU2j0viMUVA1TPnEV2GzZJVTaDhnDeHWvPji/P4haufeLknFCCPGJt09j8Bk77oiiFB+q6D1ZLgORswewKqzqyem504Sx1nOIbT9xRTeJhg87jQp78pxM3wgsxIZF2P+GNyf3WQqaapB+1bWZ/80OckR1vjxTD6YnYgvs6Bykgx4FrMH136eKlhI
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2018 14:09:25.8189 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fdacd91-3887-4866-8d3e-08d5ed813c5f
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR1001MB1393
X-Microsoft-Exchange-Diagnostics: 1; AM4PR1001MB1393;
	23:y0EPftqMvkMhp/EUS4buTrYhFq5KtHl1gt5FHYmak4K49FxE+iXKels8XPFbLnrSx6cuDqxEgJIOO3WZEQslNn6VEvCK7kIR1EoNCPlWGSHkDNJZH2tiDDKLah87yzsP7+uUVPkkp/aDVzt8ozZmVg==
X-OriginatorOrg: prevas.dk
Subject: [meta-oe][PATCH] ser2net: upgrade to version 3.5
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
X-List-Received-Date: Fri, 20 Jul 2018 10:48:31 -0000
Content-Type: text/plain

3.4 -> 3.5

Signed-off-by: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
---
 .../ser2net/{ser2net_3.4.bb => ser2net_3.5.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_3.4.bb => ser2net_3.5.bb} (71%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_3.4.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_3.5.bb
similarity index 71%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_3.4.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_3.5.bb
index 708650fb9..f64776c56 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_3.4.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_3.5.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=bae3019b4c6dc4138c217864bd04331f"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "562274d783534276a9feac913b7d8c4e"
-SRC_URI[sha256sum] = "d846066e27c3072565990745d030357aa0c278f96b7d1d4f59023347c1db8824"
+SRC_URI[md5sum] = "e10e7c8c97e5bade5e85ce6e89bdf1f4"
+SRC_URI[sha256sum] = "ba9e1d60a89fd7ed075553b4a2074352902203f7fbd9b65b15048c05f0e3f3be"
 
 inherit autotools pkgconfig
 
-- 
2.18.0


