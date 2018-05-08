Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 4669 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 08 May 2018 21:04:07 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0066.outbound.protection.outlook.com [104.47.33.66])
	by mail.openembedded.org (Postfix) with ESMTP id 492C474E33
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 May 2018 21:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=hOxxJl3FPfOaUmhGu73AwivU7sHGvWB7GxaLOlcJiPE=;
	b=AchMw4fXLttxnxPCX+/DkZ/RQ2fmaEQVQ+PVXwXvECumlDHHj+f4T0PZ8gZShpdLhXpTG/z7Ziiw0HivzODGZFeZhHXwJwengtoNk76Kl+rgT6XaZYt8Fl67V7c0ec+kb/X/xmhC1rBdh6993+B8vHvLyeXWZgXwriV8TC+7Xmw=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from columbia.corp.xevo.com (65.122.179.226) by
	SN6PR0102MB3424.prod.exchangelabs.com (2603:10b6:805:3::13) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.735.17;
	Tue, 8 May 2018 19:31:58 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 May 2018 12:31:41 -0700
Message-Id: <20180508193141.14077-3-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180508193141.14077-1-mkelly@xevo.com>
References: <20180508193141.14077-1-mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: DM5PR19CA0019.namprd19.prod.outlook.com
	(2603:10b6:3:151::29) To SN6PR0102MB3424.prod.exchangelabs.com
	(2603:10b6:805:3::13)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:SN6PR0102MB3424; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR0102MB3424;
	3:uAsRYC+eNE9XHG9TOp3WqeSI39DQ9e3diH1mT8lMPLHZ6Pctou2heHwsd5p0ugQcYdYAaW676z/Fj6KsFttFSLbNS/mHE7gG8rYa8A84V4d0MIvsOnk+UjJYFE5l9HY6AB+2QCDaq+/dOrmlwniRJSWrPqV6sioDHd2KoB8K430IN0uRvM7jzaVW6FLsjuvM7GlsvwS62J4jdMHyB7nN7nCayEG7cNjEoQ7QI2DOlEbYGY1+6wwoGvDnmfJzJ15I;
	25:sqoawGV6x0uOTokbKbAnKI4yV1UpqXx5mFrZUMYGlRiX+J0AAVojudgQ5g12c3nli4MbmzS5JAADRasZwXbDowy/Shef10pHtnTZMzD7xikXRC+fXBRYC6Wga5NZZoYgXW/FIBd9LU3rpp/hF7HbkyY8MSZSoJlfr32jsgCKos9PVIYTPVKdctfAspnINmLtLf93pvazk8V6JnBq4pmuLAfxUKv6ZU44xT8jEbDtDtuP2rUyXrXzc5CAfGIwK42KSWvTluNH8Hm43uMv42gbmB/SIpyrpa8vKVSvF95NmqOc02oYt6DIUS9qQLbnncPcdz3I9GIlVFiOOQatt1tRJg==;
	31:Spg3OYdK5rN2xF+MxgbCy5PcHfjYKX+EISrHs4yaf9wl2HyEMcRbXm3wBW6rHf1PiDMvki1NW0ZtxXeOmRSVRdkG6TtGzm5xIeSrMbQbpy3tmd1w8lKQjE/f4B04iVYR66o2ttj1QC5Gmpvwd5/bktAqpfS6e6BxrTV10zAqqkumtIH/kDZAlvL+BaSlMI9B+m0xDbOmh2ttm+PsRFaniwK0ljIh+ubcu0swEYm0vvo=
X-MS-TrafficTypeDiagnostic: SN6PR0102MB3424:
X-Microsoft-Exchange-Diagnostics: 1; SN6PR0102MB3424;
	20:AQ7GWPrGr7Fw7PJy28rpSdYyUgXy5mI3d+QbWct49+LpSkZ4yyPesP/t13XpW4BFaHU/+YMmxcHiAV6qEh7PiK7Hv6EepYZC4HPvdAL7STEQt6NIR+wceDT9tHKM2wqrkCV2U+pdlkl05Sugd0eQW8YxXOUESUL5gpGqUSNo390WsMQi1UC/1ZUNc1mk+cYIw//vSpd3mQCZroanhKiZTVDs7dGdfSHAJvGqwLiHgC4897D00EYrdT9uE1rLjKF3txzYHpHxcS/bNWFiHfUeQCX5i7MeOWU6/Ih/k2cfCcYMXvQqwu7n8EthgdaBf8sccubyNAB+xaCAjIQ5ssRptiIR9xfRsGtwCyZiLqSwC2oHTJwAN5HJS0ZsAj1zJXGobtoh1I8ckL5uB7RY+SI7VmXI/SRHTojiQwoslSK31C4apADQG3HGDZvbLjzR7HET2n+Ic/XUtw0m/qq2Bd5395HTXExWguVoKaV456e9EXxtCvNCz1rnptPKS8bE/qqM;
	4:obsD+VHATwICkPbiV82JkFyctAvdoBoIh+kCxBLvh3qRhEUFe5K/7xG/kFgL+3wiu9CIZvjFgBA30LbJ2vshQ2T4CUqYFlur+p3GfZ1xoaTWOrmb9bxMmYQUablVcsRskUEsl15KlWZP4gtHdOdrNsEhop8VI49ZeVbCvqwq/5UUF6tW8KiOx+zUcperkDVdHsW5MFevelGBOjzLN34pAZHz0WCSBx5q8D/du0pA5x38FZ/tFYtxwN2+/woIcwK5o6Q59RQf08Qu/EMIIUNY7g==
X-Microsoft-Antispam-PRVS: <SN6PR0102MB342419A327C720049D859232AB9A0@SN6PR0102MB3424.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3231254)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(149027)(150027)(6041310)(20161123564045)(20161123558120)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:SN6PR0102MB3424; BCL:0; PCL:0; RULEID:;
	SRVR:SN6PR0102MB3424; 
X-Forefront-PRVS: 0666E15D35
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39380400002)(366004)(346002)(396003)(39840400004)(376002)(199004)(189003)(2906002)(53936002)(47776003)(50466002)(2361001)(7696005)(51416003)(6486002)(52116002)(105586002)(2351001)(107886003)(5660300001)(106356001)(36756003)(76176011)(305945005)(4326008)(6666003)(6916009)(97736004)(446003)(39060400002)(48376002)(316002)(486006)(54906003)(11346002)(16586007)(956004)(2616005)(476003)(1076002)(59450400001)(3846002)(81166006)(1857600001)(6116002)(186003)(8936002)(26005)(86362001)(66066001)(68736007)(8676002)(7736002)(386003)(81156014)(478600001)(16526019)(50226002)(25786009);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR0102MB3424;
	H:columbia.corp.xevo.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN6PR0102MB3424;
	23:Juuosz8qZHrZIwmGBYRxWv5nVv1iFPbtyQ2gX0V?=
	=?us-ascii?Q?t4kPe1lZ/XjLucnBxt0sFEP3Ps0XyRYQ+xMdriQTh7cCaCirRNoLF+vlhqa2?=
	=?us-ascii?Q?/eCBfbb29tZEz3ktrH3PVN76IUgjmLIXEX+Z45SgqezGT0lMQSffReybeEMv?=
	=?us-ascii?Q?XnenxcHjLpQEGT7l72YYd4BOAcrq//nuXe+DEOzll9I2dld8o+62htuXmRRs?=
	=?us-ascii?Q?TJnega7lUuh6q5LD+Yz00+i5FevF+o52ojGLOTpRJQDYHYHEpNX9ZGUV88w5?=
	=?us-ascii?Q?2ncek+tE/U5oWjct1CrEdVvYYg0aQPzzNgbSEs+VGjzIJ1BltW319sD4j+cB?=
	=?us-ascii?Q?N4v/3PEFbGZNIBc6e0ha3ddES0wr/zHvMBWxEKCxQG2gCiCOpOsHi8f9X3su?=
	=?us-ascii?Q?D3z+TbyiQ4Of1DZkjI0S/7n+chiSja2hCIcJJ7fZtyn1RLWoQK/juwUKAFqN?=
	=?us-ascii?Q?PeXzVEFsLGKJRQ3PCoH/7LKS/cuOx93jGbIULsb9yWoL3JTj962ka7jK8HGv?=
	=?us-ascii?Q?+Mk7aHO3XfXEhonc6r//mz4fPL7WEqSBDGcpljNoBpgaKTD0BvWJJ9cqG4kZ?=
	=?us-ascii?Q?+fAKqdD7IL3+8DGBsUK+6rWnFl09rUOlyYJqhQMDYCDh2x3iEzHNnzaoIqJ9?=
	=?us-ascii?Q?fnf2tr5h68jfbnR6sw+y659nrZzX+gxbqEuqe0w7hjSzVXiXFQp6sIXcOwKO?=
	=?us-ascii?Q?JqsGbbyXQwHewFjNie40Yya8PW8F03TABxk+Pa918WeTQGSEF3DGDOoQh6vA?=
	=?us-ascii?Q?ZnFj5O/XPmcujjmt3Wpl+aukXBwR2aLmHSYYr06NSO2C3KRdzwoe7lnG/Nl4?=
	=?us-ascii?Q?cb3PFvA2bavfrxP+xWhAmp6FKgOUiUdHk+afCws3mdsMe2A/M5KWrNw8BKO0?=
	=?us-ascii?Q?Ic4kX672THLjCNOL3ltuGYwSWHYuT6FbIU7lLUNZtqT+W8Vdn4XSD6OPbzug?=
	=?us-ascii?Q?2V+UAw5T39YnzLszV6Je1/BMmBo7egD0RYY0zL+XJSWixXkUgjm0okG+dfNj?=
	=?us-ascii?Q?uAO/+LlZqccNpDj57Z8LGuA3OTU/8u7e+a7r5qaQbf0iWBqKe3ikaU7vEenu?=
	=?us-ascii?Q?q8vSzYSg7aVpKMUdPpNfxQE3rDBtLJiDjxKaR9keOVhBdGsQZxeaj4gitWj5?=
	=?us-ascii?Q?OxZnUV+pFIZifK2X7F2sY/Tm1REv12w2pfgIr17iN91QFunhpUuhFwfkk05X?=
	=?us-ascii?Q?hMpj8Q7Lca8PDU4tsPfnZdqcRojJwUIG3cVOPhMBYY6unsAlulIVg/5FEN52?=
	=?us-ascii?Q?c8VAl7eQTkOILEXUMSmWRiGKn4shvhQCTnj+7bQ02nST4WGs+sNnN3+RD10O?=
	=?us-ascii?Q?4NOprach95L7PNGZTs9W6s0gQToih3HGNJTDOhF65j5JW?=
X-Microsoft-Antispam-Message-Info: E23hrMSrNmbPbsE53U1a1xkaNWlV2rJWNlGeWJNU05yFN8j4DgK47Rh4oX4e0PrERK8HstxpUQv145MpbRSkyBlRkRLNVsl3fowBUstMFzs6AyGUg5S3QAdLVompEQu1395ulwvW+cNHelaoiKuxk9BfGUSrtGv+HkfPfbwAUMiR1oYPdQaOZ2kLJxafsdey
X-Microsoft-Exchange-Diagnostics: 1; SN6PR0102MB3424;
	6:OuK7HbnAfulYbeXbGhSM8T/2fDOVX+8bmdJc0byYCYn5FgNVD3n/migCVgKoSa+w2+81J1JhDqDbSiEUhWCz+49JeIQXIfzZtcuuxiyUuxx2dzBiWlhTYITHOROwXERrAbqsfgKCzgXXVbk/MOZLGhAdQsqFLRGPiH0RtMZNR30f8CCxtFh1JE9yxv0p+dAwLYzxylh9Z3AZT4UzXvTRdzRyFE+RLIOm+DvCT6vPr+xPhdaf5XOv5sVZCSLV2sgm/VaT6c8JHHs7usuzNtFXeMX2pnyeNrmUHmnHrkvGtwEhSaCryGJ5fgLNPGNeUeBBGP77OP7o+bt6dIxOOz6xbXZVyTrkVoZe2Mj8QoNT5ubrVx22UMmwva7uDkZhogTQomjyML3s08V4kpJncgMoSDj85XwFobDCvLFuQT+8xky8nu13zmsm5DzSnM6GXnk9Ft7PjJ4ZjRCGaIPlEXnXOw==;
	5:YuflVzKKpjAWRrLh1lU6G1l1pEnxgRho3tjbu/obE+0lPWNsUCbp8cMOo6YM0VY4NIQqg2ENS9yFRE12K+KwP3a+Bc+lVWP9s9LMtJ0f9FDV7VM0YX3zBECFUB0HErVhMJbYxmDmxdvdZJfFzcHnNGUsvkHD9qV8WLBhw71E5CM=;
	24:DJVJYy/qYVRhvGim7jLNC4X0Ma+EDnw44Jt3amsChKNlussW7wMk4CgeU9ECaIU2PA0zVZsDhJUBu1X/PCBNrWqQPoVMegdF2X0H5zGZS3Q=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; SN6PR0102MB3424;
	7:2AgPeuxvJV+mxTseHuYvlUCS7g3Vl2Q59nU3bdEcIruiNcaTw5YxUY0X6JRiTU00fayXvtoqc++g2C/IiJaWSSxKC4K1DGPLvqHYjQzLfd15ucjZPpzCd3RJIxJgVyLHaOVbMwJ+IHYLx/AK1HOTe0ncNJ9Nehn9WlpAHoGN/Jro9VkewVndmcj9NlqzhfterCdOgcI3d+33aU2gzGEMMIDo2rarU1aotnxdyfwgHvRaXug3lvpvZsnnCjzAj3n7
X-MS-Office365-Filtering-Correlation-Id: ffea315f-59f3-4a98-4b24-08d5b51a5d8d
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2018 19:31:58.2361 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffea315f-59f3-4a98-4b24-08d5b51a5d8d
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR0102MB3424
Subject: [meta-oe][PATCH 3/3] modemmanager: fix mbim disable string
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
X-List-Received-Date: Tue, 08 May 2018 21:04:08 -0000
Content-Type: text/plain

The current string used to disable mbim is "--enable-mbim=no", which is
producing a warning. It should be "--with-mdim=no", so change it.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
index 4f9400169..b1a718dbf 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
@@ -25,7 +25,7 @@ PACKAGECONFIG ??= "mbim qmi polkit \
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,,"
 PACKAGECONFIG[polkit] = "--with-polkit=yes,--with-polkit=no,polkit"
 # Support WWAN modems and devices which speak the Mobile Interface Broadband Model (MBIM) protocol.
-PACKAGECONFIG[mbim] = "--with-mbim,--enable-mbim=no,libmbim"
+PACKAGECONFIG[mbim] = "--with-mbim,--with-mbim=no,libmbim"
 # Support WWAN modems and devices which speak the Qualcomm MSM Interface (QMI) protocol.
 PACKAGECONFIG[qmi] = "--with-qmi,--without-qmi,libqmi"
 
-- 
2.11.0


