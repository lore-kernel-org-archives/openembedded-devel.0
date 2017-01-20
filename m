Return-Path: <tom.hochstein@nxp.com>
X-Greylist: delayed 349 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 20 Jan 2017 23:47:56 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0041.outbound.protection.outlook.com [104.47.2.41])
	by mail.openembedded.org (Postfix) with ESMTP id 663F6771EA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2017 23:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=UqKoCmkfCMMiI404ac9TJfPZlHUPFImnK7pqnXG/K4Y=;
	b=TyE2t9s3rtK5v+yM26431d/rmg9+j5nbvxTgVbJ146qw4HyjLBBtrXXIbfs2d+p9H7WKppvRV1tAK8mYiNm3+6JlbO/nq7uZB9kEebQVVx5d5BSvxm2/i98XWPniVdvHvlHDOKBvseptIQO+pucfwHfb866TJMRmF5sbuUAkC+8=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from tx30imx-01.am.freescale.net (192.88.168.49) by
	DB4PR04MB314.eurprd04.prod.outlook.com (10.141.239.147) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.845.12; Fri, 20 Jan 2017 23:47:55 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 20 Jan 2017 17:41:22 -0600
Message-ID: <1484955682-24495-1-git-send-email-tom.hochstein@nxp.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.88.168.49]
X-ClientProxiedBy: BN6PR1301CA0025.namprd13.prod.outlook.com (10.174.84.166)
	To DB4PR04MB314.eurprd04.prod.outlook.com (10.141.239.147)
X-MS-Office365-Filtering-Correlation-Id: da5b1f87-0e97-4df0-efd1-08d4418ec1c2
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:DB4PR04MB314;
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB314;
	3:ocyRnP9CiaPMYccHRtn29AQwlOFOZkyTxYAjlmZSkroN/As+fpziObLbBuwgJ7QedATQRf9ndPDwB9nZlvKXIVz1bHeQknuYKw3+PGMb9XxaV7N9N4WlJZDaOrkAIuuJPR7gw95IrdButFOOmcUNX1nBg25dTfROsI1ku1Qfo8hj39MylFSo0p+BhGICUfUOUaXZvhEGh/RArE5AIQtu37oARWDnpZaiEKK1GN6m6m8TPpRAZ7koclYSO1G2dZ39l70q+gjUF+NR62ZGuHHYgA==
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB314;
	25:1fEo9HHSYvA9AFC1NWbj5332s4ajbxQoIgUQAfVP7q0cwjRCxdZh35+sAnvn32NT3rdLm1QVUChtk1AB3eyDkrQrasyxv1z3xpbS2YmcGPSC/1TC+ZL8zcsuNEoZl1Tm6m0OqsYoNcYmUa8S6XhJltzGESn9h2z6gvSEOs7jl7Hod8MmnMFs4e6LSdzREpAZ9r8aMFzI8cyYZ4acmYQcFVNJXLdRd+P4617cSD4TSZGLJ8exXdR/KYExqsrrUPrh6g0cvY9yLQHgr1cN7aXAc3Fbzu78CKpKC14ljoRyI6cRRB/MGQ5cCGnI1RcdV3KlXPXBPzabzN7rIjqe5rsapROQ7XvsrqiIdqSX2usho6BUz6GkNew6AFjhy1UQiqEAi1EuZObRQYyn3pQt5aLxFnAZX87TLcvTON4elLr6y+N9JDql5WV1ddr3T2atr+jNv/w+0sPdLZeK4w72jBMH6wPRB2CY7A8+X4EdR5MIFJ7jARbbJ3WUSp8NkT8wlFleOc7KZVPH/8BEdvjsLQpsJ5CEBl/PzIAHtPRLKb4fE8s16qEuwBB0uCFOrvC6tJ4gJF5SN1+chj+htuL9U6F5CCe725sWp1vJrenhxrOZ1gYhmNxdXAGdTSIZyBVHCGEEfUYJHPerI/WqDcA0dFKTDO/LUxqcu6nHAYWrkPuiHm86CSJe5TlvJymlYr6I9qXaxmuM6vd82RHQY6S1UNlyn0NogtPobINfoeZ4gWZC6vOZDpqFrAi7MsWWY8qoMf2B
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB314;
	31:Oma50fgHWkQf0ZeNw2H8FNBiqUUBSLacmrH/dZcZsBWkikwK81n5l7SSnmSOZAYqj6baYUwO/JP1EXSh6gD0rBKs8I8/yh1rtfQXSBlY7h2VIraekAZtG7t2Lq55aVEwv5CYesxJrAbasjFPqXytP6xjmmZacrAGLydRZJhsT5XhnmOZlF26FHcM+fVFKMefBfz0M82c/Fqu3xl0j/uu8dHEpJL0TeiiUMPCZlP+Snk+aTlaNtSY+G+skU0cwZY3EH3va5N2tFCECBA/37g2Mw==;
	20:C28QK45r1a4+uCq65917QEBgzvIOWlxWRajXRJuwvjeR4KAJ1hxYuZ0RFdiiPJHEZlm/Cs0BHpCcw2tJQr2ZTslsZfQ/6BngGTTqR9Qu+VU89ut3HWtS3ZaSzI1NmvHIFKH+sO4PceJj1xQ1JIfdl6DD6MIMU/flbdBPaUhws/ss64spCZnZbfnO9cog9rsiSXyMBtdROL2naOsgBNbr6kR/qJhEQ8xDmFz898K/kCS5Vxa+SrENFpM2tp2fpLAhGJxyCD1wHAPL5uz++bgv9HPL5VQQJSY3/FfUT4OgHhfqcaZYnxyZKwGpUTm+6dora6nIozp+pCooQKP/MLjxh26IkQ6dLYv05exN9mGNSJthRhPStd62fDtgStz+MAdMqwSMtK4mxAuZRt5BCDw71TrYrv1NfBDqqXompA4kQjEbBXCeYa2ObhYYZLNW+lMwoGojILRrBG+rQOWaXhq45beqZkPy4W41SdXim+uWAt2nKDkSbOssvcvImemVdvUV
X-Microsoft-Antispam-PRVS: <DB4PR04MB314C4EB65CB933D4EF0E4FFE2710@DB4PR04MB314.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6055026)(6041248)(20161123562025)(20161123555025)(20161123560025)(20161123564025)(6072148)(6047074);
	SRVR:DB4PR04MB314; BCL:0; PCL:0; RULEID:; SRVR:DB4PR04MB314; 
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB314;
	4:c4wt0xjluz7dvTxs9s1i+WOq0Ri6FherDEM50HSqEu8uHjI35h3FwG4OXvNwu6FOVzVaEqZGuKjKraK+pg4jtbn7watjwGX+k9qYpv58WAL308/QkuWjbpqG2gHVe3F1ci6qFipFIDnvUJHJaEphVb8iemokRFV1XIypVlIweCXu2geCOaydyUcV2A0ijOY3lbtX6TSj3DMgtcGdaw3V8ZMtAKQ7Hx+uFWhTYRNiy4GgJ2nM6PodT0PNxWggzJidlnf9cbhjEUkIo15Rv3OtDisDH409Y6O6zZf5DKoxAoGXQ5vrn5cmnDT6VLM2ovsk16dWAWZsq6UpmcnIsA1p3O/YXKfjS7LEXDnWJ2koKlxTuwbVi1U+9cPVJR3gmJuF8TBD2ygl+JG2JCpMfL0veJnoj6Uj9CFmGSiWc4q3ljbINlsBGOjIUE6+xZO9KHeyJVVzS2oQZwX3gkWltEoB0At3ij/cidk9FUPjbBk6eJiQfO/uYZvhi1r+9rHYUsvbOt0bkPX2hqGe9AFx3kB+fttjmuLsIb/I6HwxS5eGHtzKhmZo7YKkBJAfGEKXtKm8aBwKQSfcfzn0ZdmV/j0sN66h2puPSqH5fmmgmbzkbSQNRlTxfdokRw00krIrEDoPGsFun4SjmK5YmPrEVh3Cnw==
X-Forefront-PRVS: 01930B2BA8
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(7916002)(39840400002)(39860400002)(39410400002)(39450400003)(39850400002)(189002)(199003)(4326007)(2906002)(7736002)(86362001)(305945005)(92566002)(97736004)(6512007)(47776003)(450100001)(101416001)(50986999)(42186005)(66066001)(50466002)(48376002)(110136003)(6666003)(6916009)(189998001)(2351001)(105586002)(5660300001)(106356001)(5003940100001)(38730400001)(25786008)(50226002)(68736007)(6506006)(33646002)(6486002)(81156014)(81166006)(8676002)(6116002)(3846002)(53936002)(36756003)(32563001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB4PR04MB314;
	H:tx30imx-01.am.freescale.net; FPR:; SPF:None; PTR:InfoNoRecords;
	MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB4PR04MB314;
	23:UFBc35Q1muDKsvzlPtKmH2PLVQ3ze8uY14AlhIXm+n?=
	=?us-ascii?Q?CA6pW9vgM+BB3Fmkeh/OtemmQcuq5X1oZJ+eSDwLIfMB028/7vRDettlqoBe?=
	=?us-ascii?Q?NCOglxCUhcNn156fCnrhtb01Kpdu8k6ICTYPACevHXdeRlE4MUXPvKXqlKyd?=
	=?us-ascii?Q?J83otNQodE7i/Mfi5yMV2BernhzgR+gOIbxNaMgEdlT4+dzfw34jKgbzKv85?=
	=?us-ascii?Q?wSRNIXWEdJV7OarkBr2XgQek3KXTXkKfuloTDwPpEGncLCuP2iozETBgGlwz?=
	=?us-ascii?Q?5ile3iNmlJhvOjivgS1yBJ97erWxDhDvIigxCiHZnitZivwVjlc/WFXGHbqe?=
	=?us-ascii?Q?1MA+04mtE702S3dMPFq7Sw/qU1tOdxhE5mSxe4vTZbSpzPEjHGgHlS/k9BjZ?=
	=?us-ascii?Q?somZ4WKItmhh6L84qZHIVCfwoK1+B+oO39+uXCe2YHh3oYrlQvd6TNhIB5jj?=
	=?us-ascii?Q?UxS/t4TrtQrw/kVQmwsdJlGoNeTHkR4wGmy3O78Vd566r8s8OqA075YEmh6o?=
	=?us-ascii?Q?nTPFr+FWf7gIwCKaIoGTjPoPIZoNGUA7l0BvYn+8YcF8pgn7URL0VYKhCJqQ?=
	=?us-ascii?Q?0UUiPRIrqp1MSAQzR3mnKwPXXLIEQmRf2iJWf7uI9JlXXzBehA/BXAEAj5Nc?=
	=?us-ascii?Q?tWNSviMWATuXAOOG2+CBK+uZDjgtaV+FBHTu8kQt2ut45FSKtg+OBMGioYx1?=
	=?us-ascii?Q?WgEHdQbSyFo8lrE9Nx+4QSNCf1SkJnwMHglCuGfcgDnDmYliybb5I1BU7tQa?=
	=?us-ascii?Q?iO+XpDrWHwpz3wcdUhWUa7gBbt2Wkx0G5+KPWdboRPPZC+/ZD7yioRcugoC0?=
	=?us-ascii?Q?lD5caltO+CR5W4XukkDwkN17xSpHeiGECNwTgn3CTpxcSKtDXUGTmzq/t6F9?=
	=?us-ascii?Q?c/fLIdSdCmrokOPiIpVTcrQR0w28Em49Z2rl93NYU27ChFq9thZfPX/pRTX6?=
	=?us-ascii?Q?SFOaTn/y3XVU0ouwyo6pd5iDmsEI+LLZsG6+QuGEK/6yqhxaBICTFFfJMlFj?=
	=?us-ascii?Q?dcY09zLXs1zkicmduZ2WbnHE3Zt3duT/EHxiWpGAHjpablwVNg85gvzrrkAx?=
	=?us-ascii?Q?zAJF0ocViWBTW06V96qHGrSZfMBpYipoQ2LO9N7wcVP5RNd4C2uY+TlVY4+7?=
	=?us-ascii?Q?f5VAjgWz5hnYkuOcsICcSvYvE1UahCqLsvt3j1E43Yy78OSiRO2K7hnPZhCR?=
	=?us-ascii?Q?Rtk5nkL1LfYoo5sdYMAqGNCSkm+qdqlJmgjMkcMbmaN9FJgtcC/fpMjw=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB314;
	6:yxrmEZVs4tivQ+zZTWmlBjbDsoTpS5r9EbVQ1yMgdC85pRQd4FLdLzrg9QMt5Itv+h9ZOJci+3Qyr7ud/mmuX3uMif6hmc9kWipbA4kpvuRKYrETWnvtDeQeZ7aAS+Nn10GNPHdcqPQACa96cRA0vnd6AUqVU2AsfQd67wlYT4m3t0Q60v3GybC61S/1hapNo5gRMk9Wlx2fslb+66CviOeTBnbduwLyY0v571EnIrRELGKl/clqgfvcdOSDf4RkIegCYS1F4XX8qFsMcGxWvARJ/BGbIrTerdC8m2ZzbTW8iH5cBLyVfvSaBONsZwCia5zF+1ZFAeH0nlmX/7QilDSuo/nU2DzHt3VCVIjQY55UMrtLb4hQWhLKnCODmzcDVIcnLroqqk7kUD5nCXz38WMI2hKcKAOTyT/fVR7CHYdHtpCE83pfXBxicdvC3jQW6NmVjlGcUsxAioKoVNMeqg==;
	5:66CIGPyFuHCA5TKy6REcVaFyZnjFam/P++/siSDAF8Q6yKUUYJ5Cgi9DRj/Qo4J34G7EIG/DuTl5ySZ6Chb6ug8HooHTxV3ulsOZj5IA/HHURinChv0g8t4Ue4AfnQR5quxgHp/Vm0vt2atoUfYjFQ==;
	24:lelMvLFN3ka/+6ilPzJVSk0Gj+NsQQL9na1vJBx4idS+DY5VqgeKvF8h7kT+Phrjsc8Q5b80pywzgTw6SPf6tXMS1E64/UdenSk+EtWa3Vg=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB314;
	7:TPC/XSIGB+R2yOAMosdR4ClJ+WbjC+8k0fl2UT/nhLgIuFDVuG/HPwIxjkqgbd1/VQfES9i/q72m91qFcsWXp5wwJ+f4ZTqaeqYNkcoQnJHBg+NEWeDm9HJlpQ6WnyYENwd+13WICmMjwRL3tacWqSQswtM9H4k8zMv8FZDc03n0s52OwhfSBGrpF3Zezt9pRuSVQ8IJrb5BvIpKI9FPYdZCyAkQSbrVPbrjctazluMXqsFJguzpnKDVcn36J0zyItQoEkY8NlSClFRjZMLcj5e2a8MgYf6Ge2Nc/Xwm2s2PBPdaqJ4YGMnu+uatUWrHz2NL3zh7/skg6a1xhWGkWLGdH+0uuZ09wMKaiCHeX/H7uBMx80C8IvPNqO9NaqQ7YICpYW8ETkecfasJajgfUKY6Lv3oMk0wJGunkaQiJaJr9TGPuERTvwRTpR4M/xH1hPAb+2TKW5EQU4P/frDKRQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2017 23:47:55.2868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR04MB314
Subject: [meta-qt5][PATCH v2] qt3d: Add assimp dependency
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
X-List-Received-Date: Fri, 20 Jan 2017 23:47:59 -0000
Content-Type: text/plain

Fix build error:

fatal error: assimp/Importer.hpp: No such file or directory

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 recipes-qt/qt5/qt3d_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index 9708ec9..d8f943f 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 DEPENDS += "qtbase"
-DEPENDS_class-target += "qtdeclarative qt3d-native"
+DEPENDS_class-target += "qtdeclarative qt3d-native assimp"
 
 SRC_URI += " \
     file://0001-Allow-a-tools-only-build.patch \
-- 
1.9.1


