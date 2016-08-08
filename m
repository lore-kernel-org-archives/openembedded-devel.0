Return-Path: <tom.hochstein@nxp.com>
X-Greylist: delayed 7190 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 08 Aug 2016 21:16:53 UTC
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-ve1eur01on0074.outbound.protection.outlook.com [104.47.1.74])
	by mail.openembedded.org (Postfix) with ESMTP id E5709771A9
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Aug 2016 21:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=0sRIPzN4WQEiZNVAnB4Y61fH12VHOGHNTITkwGK+MIc=;
	b=WYzjnJz+sskqbouCuSfqtL0M+dv7gPAOxh4akqp3+SARgc955WcgoVYnFqEcd90iUYy7Cf6XP/PYzPBOfoejHUbJ6aEWUx9NKwT6wCrTvokVyayfq0sTzsKNBaS5V0JFene1iQYeJDDmfvIWceTxZDpbIAu9oebxsU48sJOgEic=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from tx30imx-01.am.freescale.net (192.88.168.49) by
	DBXPR04MB317.eurprd04.prod.outlook.com (10.141.232.12) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
	15.1.557.8; Mon, 8 Aug 2016 16:44:19 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Aug 2016 11:39:55 -0500
Message-ID: <1470674395-3076-2-git-send-email-tom.hochstein@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1470674395-3076-1-git-send-email-tom.hochstein@nxp.com>
References: <1470674395-3076-1-git-send-email-tom.hochstein@nxp.com>
MIME-Version: 1.0
X-Originating-IP: [192.88.168.49]
X-ClientProxiedBy: CY1PR13CA0002.namprd13.prod.outlook.com (10.162.30.140) To
	DBXPR04MB317.eurprd04.prod.outlook.com (10.141.232.12)
X-MS-Office365-Filtering-Correlation-Id: 12a22121-9bcd-4374-1f98-08d3bfab3e70
X-Microsoft-Exchange-Diagnostics: 1; DBXPR04MB317;
	2:Ctu4UNZreGihBDQfNGGp8L9GoyUwjgvRFox8+/3ItMsTHfRkT5J7vGcOgWBoPpMI9la+kjNUGobeenON5mmbCVAvkLpC+43u1fDWguhdONq0w9Y//VIJXx5ul3/bKqFFVVoxXOSSkE9J74Mks/istpeiiLfrWjNXDd+7DfMazWugfpgTtvEQlYG/uZ8CMqyq;
	3:Kem4kEYeTEa8RZ04jmDwgMRxsR72UQ9TxfAspR5R1A5QwiCh4TgKoFS03FMflpnc/BI+GDsLfRnjbnLJy6pAw2y1/MibHayfbFir7mUkfKd3M+Td64fJCDMmLSNSIrEx;
	25:TdFGtZG6hug4W3BFnXNGbNRzQprH7TCMP0xHExErIKBY6nGiv6wzohlAd7MpJIuw7aX810q41l1TyT3RrEWcLINASfGk3dkt3kT9nsjx4mPsaVOFF8RQLJ9alqEyQGPUb+3zxDltNad5TYxNiFQHwrYLruSujqzQ1SWVmqU8/8Vu4QbjoH0PoPeQIMSahvisAuKCP9TlhlXg0WAMy0vzS774uP6CRc/jPl4NTaTMaKe6MslUipLd6sCY/mtnkjR+lf89IutMhF7YHO1EePOK693ORmtIwOV0ZPXcM9KGT6dgV9+9xgylCjBPvaBuwY15KdM9v3cKMhp0dT2gY4ZL7zKt/nj8S5fCPJUvL1j/5+vRu+Y8Ff1D9mCN1bFmtmWV53m9Y5bw9MRmwsgB3UDWszZYenzgGAijLQqZOZdyUaM=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DBXPR04MB317;
X-Microsoft-Exchange-Diagnostics: 1; DBXPR04MB317;
	31:YeKC9FjkHL3c+NmLqQ8a4pBDU3sN1wuyRIbrrVEkP36iukTza4njgOo+BRRj0LVybD9P67/J3shjHOeJ80O4zKUC+9zz/O2+b32mVfqWevREX6U31vuhaePxeVkpltFFTKlKS29llZ7dJKXUs9dEYT0wIWy51bbzCmHjsYkxutiH1Ue4EfqOq90GoCvKqmrPdO/omX6rVk4f3VQND/iLZFTZaukC8RSZqRvuppfQ+8U=;
	20:2UMWRupv9kCT4btIG8Kx1pKmrO7uuk7RfBy4lX29AhaVyxF/rKCVJufcDd0t/7YFlKB7N/bVkTQV4+ql3lK0f1HbAQHyQm3XsYVEzF1t3gkiFiR6rrLr8p3dlVmg0GvjofKiKJ4heVMaY4D4BBDmg83NIpYHtD+HW3v6iFk9ZpcgUGZErtJAH6gGCgu9XYjOqv2Iotys+lxgTvckjE7ulzrt0usfSXVqgHdzKQjMVQtU07ehp2be+50CWLeicjIeTq/pSKO8PpZ9hHUPoCW8t2euyWljMPMwbq3lYPtqtO1dneFyMuM3Ow2wi/57cHuEVlBLrHAh3c4zwsN2BWVNqtSbeeamLL5DO30rNDA4a1cFkOCpsQiH/BrUzXYwBJ7+oI7PuV4EkX4sJrhT4VP6GTBZxtCDRuwzUh8SXwfWlylytHmho7csvIDjJ/W6I27LvgQQc515cQr/4Vo0p7dvV0v+a78m/1NOZ/N9FE2A46+Tm/+2rYUQZ+kEG53i7SZBF9E6JQty60HZu6k1JFPJeh5x0yb3c8eu+CTihoGNsuR3EL5zkjfA8JgHkTKpYLvZgyE+TXKoJLUGcLaH/YK8gqyCItu9FKeFFoaYduOtl5c=
X-NIPS-smtp-INBOUND: xFSL-EDGE
X-Microsoft-Antispam-PRVS: <DBXPR04MB317A1328347559477709661E21B0@DBXPR04MB317.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(185117386973197)(788757137089); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6055026);
	SRVR:DBXPR04MB317; BCL:0; PCL:0; RULEID:; SRVR:DBXPR04MB317; 
X-Microsoft-Exchange-Diagnostics: 1; DBXPR04MB317;
	4:Mc96HFvhGN9x3XhCb2PlDAHN0NDdd//IL4W+W7jbsCqy8H/IFifYIZbFdG5z+6u3lLQuWLZ15Z0OPSJR6u+St4As+ajah4z5jezGxa5sW1uJWMhh6/mPiH5fhsmiUCg9A7ZDZvOLsfiyrIOdkSBx0EUvrJGGZcfHOx+SlP8UVijJca/z1QQsv9UNjIkibro51bJAE80pTJeHnwU310NPlDYkHdOFerXYFHyQqB4+rSBmsepuMxMFnl9+OCemdciI8Ls8nXvaMD1gUIsMT2Oqyl1LApxyJ+ew3MlDsrj3V/y3rL0LhRTgCaiC/Pb5X+HMjelUOxilpZQ8DDCTP58a+gTeRIMwRxtFKs+256b9lcxdy7BQ3/yu+ztPPpv9UKaWTrmkkbuxlQdEGit7sAl0GmWNrYiXjVVUiYY1PgmoCFCf0B7YHDiO3vaB3/EOfm+WI2NNJoUyflLmneJ8z2rnRBPyjovyKhXIfbYgLV/29M162/miRvMjpOumJVG8vVEb
X-Forefront-PRVS: 00286C0CA6
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(7916002)(189002)(199003)(377424004)(19580405001)(76176999)(105586002)(50466002)(4326007)(66066001)(7736002)(81166006)(92566002)(110136002)(189998001)(42186005)(48376002)(50226002)(47776003)(50986999)(19580395003)(5003940100001)(2351001)(68736007)(3846002)(6116002)(450100001)(86362001)(101416001)(36756003)(2906002)(97736004)(33646002)(8676002)(77096005)(586003)(229853001)(106356001)(2950100001)(81156014)(7846002)(305945005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DBXPR04MB317;
	H:tx30imx-01.am.freescale.net; FPR:; SPF:None; PTR:InfoNoRecords;
	MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DBXPR04MB317;
	23:qBpa4PADxe9IyVluoiCiJYEQ4001aLfCzwoWHlSeVM?=
	=?us-ascii?Q?2Ooc1exGPbPQM4qcAKZVP/chxvPT9mLBkvnnbYcnMD4P7bu9cUx9ubTM7fBq?=
	=?us-ascii?Q?eD0+I+SMRHXd6uHQZRToDl8cvxwvrVyl8RqJdf+Vsz8tBCdg40suQGdSR5zT?=
	=?us-ascii?Q?zWtuvIpk7EQ38c27yrt7MZUAR56Cnl29uP7n2ZrWgiB+5IvAjae7W8n5mGje?=
	=?us-ascii?Q?ik4StJvllexzxICdv9RpkuDomNTFLkr2k1+8dfnysC+qWWwWHfOqPHf6/aCt?=
	=?us-ascii?Q?Hx0G9PQVltyVYuf3tGkPN8R4tl5M+/40hT8Q+Ikjmlz+cdVHeFpf4YhdhbLV?=
	=?us-ascii?Q?5pVLeEg0sw6IK42N4OhjG2z3eadoVCSPnxNy2cdu/d/Yu1W7aLcL/b3Ir4ki?=
	=?us-ascii?Q?BzlvzqTFLw8VrTU4ow9qViVunwfoxEnBj0yBU8bFTy7Y6HP85LdhC3TFn6nX?=
	=?us-ascii?Q?t+ofESLW05KPG5WYmCvB7xm/eTH4zOiaruEFMgS8WLH2hX8SZJ52pOjaOhWr?=
	=?us-ascii?Q?WJdoGhoqoMwcqa6BO2Etlmgc/GEEjx6iuWUC71qs3gSfxrrb43Occiv768hF?=
	=?us-ascii?Q?IUsCGz9hSKl3QpUAYZJmbmhdj40pCCfk23dAZKJfsnGAFlHOKUzbP/s9C3oH?=
	=?us-ascii?Q?zz1+YnQ//SlagzgZbaWKCjX666AiT4TZMxiLihzqCFG/0T/jv8O6BfoF0YX3?=
	=?us-ascii?Q?1gOVVTdRvFrf03aYFR1I4yZl2XauZGSBsS49zhaD9Jlhfg6EjIbgoBNWmEBJ?=
	=?us-ascii?Q?XgQxaq5DBjdYWrjXGzAEDepjlApWz+G2J66qtm7bAsIi6dYzOAV74oPrlTrN?=
	=?us-ascii?Q?PgV0cSWJ8TACW2F/5i8S8exLAQ3dNJEMBHT1XDT4TThkC0lkVodP9ZaazEnQ?=
	=?us-ascii?Q?RZwzLOG5ZKQ0i2GB67bDSB5bB6xW9z8O2vTIx6LK5fIdYvcRWi+jGlRmSO8l?=
	=?us-ascii?Q?GxSCrnZJC0zHsbuXP0ulnpiq8U2RF6cJudW6BKavy/YtCpnsNHSAn+53vf+O?=
	=?us-ascii?Q?B5deKo56heQ92/ish6GbmXat+rApfiyDfbf4GtqTN35+LiM3K07Pm65b9hRN?=
	=?us-ascii?Q?nGEEbnwRzBgZjD+prkUBzPS6ZRLyFzd0tTWkb+jDU+g/49YUawrt6vfAfgIk?=
	=?us-ascii?Q?Hs1A/FmEA=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DBXPR04MB317;
	6:/vU4lbKSraEcBBi50OFTGd2KN9/KcFsCgiFV1gaPdJ0q52AxOUT4md2xhqGBfPME8n9nYiRBIke6O2Q0Lb5d9B12ME1FVDjsqSB7XpF5CuP8+awvxoNVGxpecCSV4lEoEgYruQ/RXjGdFdciV27V0l/26dK6HvbFL1Wu+0oIMMzRf1gWevR+dkrtvxGiUYoKJ82eKPES4FSOPJcNLPJUHKEgJZbNwBW1M2VoKjyrFY1VezZfoQvWuHrb2VuINEIhV3tHMavA5IvKThPPPKEQ3cHNTA/bAPINSBuP51CB/8JWUiIVuOAIuhRNxkDLLig0fAgSlz7bZs7qP7/Xz6SYjA==;
	5:x7DUJGNft5hy9MQFrbC9w2qEYJP6II1SAw25wvSPoVBM3ocIUxg+AMKkCbAd8safwujBMF8Eq9Kh6FiBS1IxpT5gfy1W1pYc/ByUYnEANMcM3yqWn6pSghK4ZSqB5pcNBzC6mI21liTQbi5PibLbMQ==;
	24:11agLjeWaqCzYd9tPHqyrdt2l9XgfeoukMtS9OnCAdbAOlc2KUWt58GR65SuUtQSIL1nQcMId3jAexZQ9ptcLz9s46wPPMIsjXRm69Lotto=;
	7:itPomSgCz209lMfJ0yVc5z7CkGH0h4s3cAQXSVbbB2b3c90XgLbERyEegb/zEvMqXvf5ItB9+RgiEpugtHDY93WMU6aZBb/nzeskEGLcJLegR9aYuiElPt0U4Fx2EMmmCgMLQn9CghJxm7F3HiDrJlCUhtXneGV8BLLL4muNMOPYcH2VjZpKN2Ov5+nxL0PZo66Ak4nbmKJEm1goCAyhQ7hOKmTAlURgV7NsswBV2AAQIUiikwWWFqurbERheb27
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2016 16:44:19.1326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBXPR04MB317
Subject: [meta-oe][PATCH 2/2] glmark2: Fix gcc 6 deprecated declaration error
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
X-List-Received-Date: Mon, 08 Aug 2016 21:16:56 -0000
Content-Type: text/plain

Replace auto_ptr with unique_ptr.

Upstream-Status: Pending

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 .../files/Fix-deprecated-declarations.patch        | 61 ++++++++++++++++++++++
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb   |  3 +-
 2 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-benchmark/glmark2/files/Fix-deprecated-declarations.patch

diff --git a/meta-oe/recipes-benchmark/glmark2/files/Fix-deprecated-declarations.patch b/meta-oe/recipes-benchmark/glmark2/files/Fix-deprecated-declarations.patch
new file mode 100644
index 0000000..7a25de7
--- /dev/null
+++ b/meta-oe/recipes-benchmark/glmark2/files/Fix-deprecated-declarations.patch
@@ -0,0 +1,61 @@
+Index: git/src/image-reader.cpp
+===================================================================
+--- git.orig/src/image-reader.cpp	2016-07-29 16:17:51.000000000 -0500
++++ git/src/image-reader.cpp	2016-07-29 16:18:43.000000000 -0500
+@@ -120,7 +120,7 @@
+ 
+     Log::debug("Reading PNG file %s\n", filename.c_str());
+ 
+-    const std::auto_ptr<std::istream> is_ptr(Util::get_resource(filename));
++    const std::unique_ptr<std::istream> is_ptr(Util::get_resource(filename));
+     if (!(*is_ptr)) {
+         Log::error("Cannot open file %s!\n", filename.c_str());
+         return false;
+Index: git/src/libmatrix/shader-source.cc
+===================================================================
+--- git.orig/src/libmatrix/shader-source.cc	2016-07-29 16:18:14.000000000 -0500
++++ git/src/libmatrix/shader-source.cc	2016-07-29 16:18:43.000000000 -0500
+@@ -34,7 +34,7 @@
+ bool
+ ShaderSource::load_file(const std::string& filename, std::string& str)
+ {
+-    std::auto_ptr<std::istream> is_ptr(Util::get_resource(filename));
++    std::unique_ptr<std::istream> is_ptr(Util::get_resource(filename));
+     std::istream& inputFile(*is_ptr);
+ 
+     if (!inputFile)
+Index: git/src/model.cpp
+===================================================================
+--- git.orig/src/model.cpp	2016-07-29 16:18:00.000000000 -0500
++++ git/src/model.cpp	2016-07-29 16:18:43.000000000 -0500
+@@ -361,7 +361,7 @@
+ 
+     Log::debug("Loading model from 3ds file '%s'\n", filename.c_str());
+ 
+-    const std::auto_ptr<std::istream> input_file_ptr(Util::get_resource(filename));
++    const std::unique_ptr<std::istream> input_file_ptr(Util::get_resource(filename));
+     std::istream& input_file(*input_file_ptr);
+ 
+     if (!input_file) {
+@@ -681,7 +681,7 @@
+ {
+     Log::debug("Loading model from obj file '%s'\n", filename.c_str());
+ 
+-    const std::auto_ptr<std::istream> input_file_ptr(Util::get_resource(filename));
++    const std::unique_ptr<std::istream> input_file_ptr(Util::get_resource(filename));
+     std::istream& inputFile(*input_file_ptr);
+     if (!inputFile)
+     {
+Index: git/src/scene-jellyfish.cpp
+===================================================================
+--- git.orig/src/scene-jellyfish.cpp	2016-07-29 16:18:08.000000000 -0500
++++ git/src/scene-jellyfish.cpp	2016-07-29 16:18:43.000000000 -0500
+@@ -272,7 +272,7 @@
+ {
+     Log::debug("Loading model from file '%s'\n", filename.c_str());
+ 
+-    const std::auto_ptr<std::istream> input_file_ptr(Util::get_resource(filename));
++    const std::unique_ptr<std::istream> input_file_ptr(Util::get_resource(filename));
+     std::istream& inputFile(*input_file_ptr);
+     if (!inputFile)
+     {
diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index 18267e9..3a1c2e2 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -15,7 +15,8 @@ PV = "2014.03+${SRCPV}"
 SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https \
            file://build-Check-packages-to-be-used-by-the-enabled-flavo.patch \
            file://0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch \
-           file://Fix-configure-for-sqrt-check.patch"
+           file://Fix-configure-for-sqrt-check.patch \
+           file://Fix-deprecated-declarations.patch"
 SRCREV = "fa71af2dfab711fac87b9504b6fc9862f44bf72a"
 
 S = "${WORKDIR}/git"
-- 
1.9.1


