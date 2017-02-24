Return-Path: <aaron.zinghini@seeingmachines.com>
Received: from AUS01-SY3-obe.outbound.protection.outlook.com
	(mail-sy3aus01on0120.outbound.protection.outlook.com
	[104.47.117.120])
	by mail.openembedded.org (Postfix) with ESMTP id D8C18774FD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 22:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seeingmachines.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=ChUqt0F4ryz2OnTiRSP34lFOlZnNwS9XYEW+Auvryjc=;
	b=Z6spzYc8tzqhj6LW00AyZbInTyM8w+iYG+rHlMs/157Urck1RNI7OZm738ByRwlRfwxU7A5NSOAIdo7+8NVvJ1bHZ20Mg1Zdug22EeRQpylYDJy7ZvHGbyHFAtegfmX4pjlEt0JLnmnXiztVMxSGEGuPmQV9h9Z9cs1TPd8WEuM=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=aaron.zinghini@seeingmachines.com; 
Received: from aaron-desktop.sm.local (173.10.236.117) by
	ME1PR01MB0609.ausprd01.prod.outlook.com (10.169.163.143) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.919.13; Fri, 24 Feb 2017 22:40:32 +0000
From: Aaron Zinghini <aaron.zinghini@seeingmachines.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 24 Feb 2017 15:39:55 -0700
Message-ID: <1487975995-30398-1-git-send-email-aaron.zinghini@seeingmachines.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [173.10.236.117]
X-ClientProxiedBy: BL2PR19CA0034.namprd19.prod.outlook.com (10.167.113.44) To
	ME1PR01MB0609.ausprd01.prod.outlook.com (10.169.163.143)
X-MS-Office365-Filtering-Correlation-Id: bae33d17-cb1f-46b0-e760-08d45d0624b5
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:ME1PR01MB0609;
X-Microsoft-Exchange-Diagnostics: 1; ME1PR01MB0609;
	3:msyWVyZMBgoUErEdCamW41RNevjlZ+S94THNDGh5YegtUl6Dvrq6MLlIextFi09FXQeEyxUAOj6CUUbCwWZUMrP7eGzhJGxX0p36CkeswZqu1cCX7G1VghZMUiMlnNGHpoCrSspLEpQ1df8uLF8gquUKFFXkaxPibwrQbs+jIF8hvg66LdnY3FACUe0zEyvgys/RQnqkB1qBoRdcQsark+JNtcphS3d5cYuhD5YrUqUcczukHdJRuGBwZbk0+Vf9gCm4PPQyTNloowTcb3jt/w==;
	25:6noChAPqnP+DTJNlFt9Yc8BjI9AdTZhDZUOCl69CDHXcHFrgq6wjUslvZreWiNrhoKlLVX0klxWJWuGBR+aW/f6U9zzmlZ7MnJ8rMB4EmISIDP1MBWVGOsC7U3vNC6Mmteiy7UfVHNggnW2BHP6cRAXFrRBivBtOXNF9o6xZnnVRvxUH8097kMM0Bt9Sd5AFwQBdxNyEoCK8aCKpS9JHfa4dZU//N9MVsUive70fUOhIYoZz61rp/BX0UkpZWhtmOfV6an9RGU5jubMb+RGr5Js2XXYuR9BKkcYB53834VFF6QG+S9Smt9Kwe+Z8kLN6Ompse2gwYyZUuM4jnaXkUXp+du+qsqPu+J+4mRY91us5LVEcDS63tBDpQ7iv5o+seA2yWn/R4nvF8U7cpM02nydJIcSmp3Z4hDAiV84D3E537vpid9GmJomt3U+t7elxgnEJJbcdQiHTZQBdAdgLTQ==
X-Microsoft-Exchange-Diagnostics: 1; ME1PR01MB0609;
	31:GcTr5F5yfBz8v/b8YoGek38+QvZ2Lpz0th3j7rNbFr1TCEwPDfKhd67jgO+Qwj2PUaxQ0i9CCLNOJO1/71l2Ritlg3CYHzi0PupxnS5U3KYkowplpE8sSPEVlNweAwU4LT07ePYaBmaYaX82OJjExyv+AD2gMIgcaq/5HkOJ/Nl3nl9l/BQRC8C7/Il1f5jagCiP8p9/wThfDxhI05eLf8kVCIJxEB6MpFRkNfIThRY=;
	20:yUl3OUtibRpn/1ZWpeMEaNHOf9HbYqvgP77qeizSZm89UwwfaGHEMYOQSFx2OOHmdfybGU0pgXpyVI/0pg1b1ykPMxXm3dZ0pFeVfLQzHnhqhqK1dpqx0EkSqLPnNmf1o5L5IZhtGVTpOccnfaH6/a5XQfAdMd32IURqZU8dcQTAOWU+t+fKzpOZ3Pfa1wtlWPinzoFDZd3r833AetMsrX0r6kVpFzccqvSImIhMRz0KMZsGO2NK6m+LMoBSIyw9o2KqblN91/jlQNd/zFtc/UutjG5jpl/pbLZsqo0Fd9cAkWlkDyX2MA2U7A2cshJxBFvsD2U1cfs1U+W2qEkoow==
X-Microsoft-Antispam-PRVS: <ME1PR01MB06092000143DE5DDDD328DC4F1520@ME1PR01MB0609.ausprd01.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6041248)(20161123560025)(20161123558025)(20161123564025)(20161123562025)(20161123555025)(6072148)(6042181);
	SRVR:ME1PR01MB0609; BCL:0; PCL:0; RULEID:; SRVR:ME1PR01MB0609; 
X-Microsoft-Exchange-Diagnostics: 1; ME1PR01MB0609;
	4:f4S0Jr6pXSeH0l7qyivJCKYuoVpWSxlFYwfZgQ9bBT5jWiZ8PYqsDQtQpas/zacm51pkfGS6rJhAzqflhtwL9xUTZo+/5bJgZLgcvL50jwPHLvlNv4+vhp5IxkxM4yFm4llI3M04TaRl6PLvuytb/O9umFoWlDAufltFPZQOawONoYJYSv7ZkKgwV24iYOZD3qECPXiMNRkBEmd5lWJ6eq0NxYr0EvDrtzHBOBD5y18lg2cTaNogs3LCHQXVxcpc3CZ+lEQyoXDGExZ/oFdOtbL78DnNUbgjKWlDLr0zLIIiVoYvioCjgtogV3yFWg8cP8Rf2N+p5zvoQJ5fx8QxvM+9qceLndIjM/GXLRNAK23rYNgBuIFbdYdHUUwsAwWyWAD7zgwpj80HUkr0Eilqdi222Y2sqaRqE9Bww03E3o+2I3cE7TtylZ18HkclxjmTrT75yH4R1yLLrmMj7J0ubzfheOxZg0IMo81HKdrpAb1grc89V+VU9vEwesrEMfk5oPVCeIFxA7sJoMF9GcsbPQMqXl5h379S/2hXuY+dJWiVfhpkclK7iU7YnJ+1EY2SiS7c0Gxk36B3G1KYvjLgOo8bySbH8pPmkFhbfoF2b8w=
X-Forefront-PRVS: 0228DDDDD7
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(7916002)(199003)(189002)(36756003)(81166006)(66066001)(50226002)(5660300001)(4326007)(8746002)(42186005)(8676002)(47776003)(53936002)(92566002)(105586002)(33646002)(81156014)(7736002)(3846002)(6116002)(2906002)(107886003)(110136004)(48376002)(38730400002)(50466002)(5003940100001)(97736004)(305945005)(6666003)(6506006)(6486002)(450100001)(50986999)(6916009)(86362001)(575784001)(106356001)(2351001)(68736007)(189998001)(15974865002)(101416001)(25786008)(6306002)(6512007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:ME1PR01MB0609;
	H:aaron-desktop.sm.local; FPR:; SPF:None; PTR:InfoNoRecords; A:1;
	MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: seeingmachines.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; ME1PR01MB0609;
	23:XpJSyoLOimOGqvZ7wGLCIMb5aNIgPMJxbtXEzQna7?=
	=?us-ascii?Q?tCRnDv2/JbVTey7ZoxEYnWPDCzgrnDXqo1XXi1xtHW9MUAk1wztYgS39EM+o?=
	=?us-ascii?Q?jN7jZsvmbXezqVgGEHoDbTnPPR4+9ZvaW2pi7fxtJ6QAyes4gV0dEzxhp2vO?=
	=?us-ascii?Q?svxAsf9QEtYNDeJFWLbl9vsMvYgo9NJmwRAKmTAiZQrdbL+Ko9MmK+6EIy4k?=
	=?us-ascii?Q?doNyTfMMQZgf4WNEhPRGX2WcovZCvLcOZ0Xlun0ilQobD1epH6onZs1RzArB?=
	=?us-ascii?Q?s9GnFh4PrRp3Ku7ndQRZNYDa9YXV74K+OgQSoE/0nnIbawe4mpmCShYEX9Jt?=
	=?us-ascii?Q?bwOxjE6PDb+UYh4ro7GqZkBaxliOziRK6+xTk4i9GE37hBTrRR+sYSZfThIu?=
	=?us-ascii?Q?Ubo6PDf4o/Nm2d17Afys+KFe+g3fVpjixDdkoNvlvs5rOuHaD6kclZ4r4Z53?=
	=?us-ascii?Q?x9aUUE8Z5vB8drDS1sZNzII1DaZal6ht32xjg/sT5paV4h3iQgqSzpRkt4va?=
	=?us-ascii?Q?Trh9bO9k88FfokHcLzYylarxYoJx4C/9SCGhXXBj6eH+D+iJJYo2aPJZaRZb?=
	=?us-ascii?Q?Gk6+qaz9ZsLQbOjrtJyTx6NAUU3mn11Cpjq++XgDkLJ69r7BQWe3KrD7L0Zf?=
	=?us-ascii?Q?uMPIAqkV0MUFUMErstD222SAuuQbSEu+q68NeUmvuVG8oCQIfLiNEXpIthCm?=
	=?us-ascii?Q?k0WSgK/DZEZ5aHok/x9qIAxpZlAupLKfdvXqWFJzf4foY77AEHEkInTWYrsU?=
	=?us-ascii?Q?QSfy7FHeJcZrmObODf8rUXTtyVfLCEw6ez207KHwZU8z//1zLdH3UsqoeBA0?=
	=?us-ascii?Q?cSQ5H0PzDwDfZl0OoREME0u6vaE4yYAot1a0Zk9VXMt/05USUxa9ETOyUmG1?=
	=?us-ascii?Q?spdLHm+DUwko9jY0Yg3ydruQmq+o6uCnF8PEwWYMpVMRmFNJTMVOu/tQcaP8?=
	=?us-ascii?Q?vIvr0JjDjHNUecL48KHd932j016CLiZc4OdGvgJrJxJydRBrxSmHrmadO7xw?=
	=?us-ascii?Q?uzNvnr0KzfqYKcJeFytrzsT5gaOKrh0oPas9j1cvushKb8QOb8YExXlxjtxA?=
	=?us-ascii?Q?vxRGWqfymEyp3zrv8DbsBVMwzvxJZRfaaSiEe6EuHlxvlqH2icqfjLvDxLVw?=
	=?us-ascii?Q?e2SVuHwsPv8wJHGOhrdGnqjrr3YHX7YBYYu2PsIeIqicw41smPfn84IqRy43?=
	=?us-ascii?Q?oLIQOFGvlONjMk=3D?=
X-Microsoft-Exchange-Diagnostics: 1; ME1PR01MB0609;
	6:9sQmiO5rK1q8jEEjAqkrfpSy46oPhsHipgaRTHqdDOGfrLHEzMR+7NC2J60mMpqDGhhwnwbrBKL2wmrG03+vduFXq397oRIg+Z0NEpPomDl8delaIwruWHncXIhEYpA9T/nyeeo+wSSUrB61FoDdQZz4/aGLKORZrNobpv0xipBl6pnn+jNci+0Gei2VzA3IjVe386aI4b/u/dJmrl+kKaE0AlMqaDZPq1c5zq1pmoAN0qhzy/n9R9QXG+wqNCDaKcYSV2yJdDuSwb/2/ezbU+0MIdsWJQ48byVuinD6Mx2SzWtD6kn1arF/kJSpos03Q5ZBa/OkJEdPwrXvCtNWjunBirNRa8KDDBCVm7Feg6y8f9qJnALfzVoQPrlTeQb1+fUrnYjrwTr1i4jEipDEKQ==;
	5:vNenD9JMKBbvjDbjkccE/au7CfOJTMDBBFEZL1e2Az/DfMCht41HScVOoPTFG2CWNlTfvwh2YfM/EqFMYRL5YwyDEFTnpCB8QWjAmH+bOn6Tvb6LXKFeU9IJ78+iU+g6in1GqMVQXo/HNQ7EsllvRg==;
	24:RoJPbb7ScZ0eAkwE1U7crfiK3N0rBXHGHifuMxFLhOXPfEUTTYjz0oKVKxm4UitmNnPKqgs9q0JgW1KXfYlpbYCaOvAykiImLCZHrigJmEM=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; ME1PR01MB0609;
	7:pppvn6q3UmFbaWByZJ0VicXdODcL9sTGrelcqV5H98IU++cSlN7hKv8gRDPGUCx3NJF6DldHiDQ6vHeJCJSTUvNm3TMVgV+PfMMUsyy6woGJV6p5Ij8cBlNGBRZpPh3+DRtCBpXI8cmt/mtz/Qbp1PaTS2D3D47pvnyjHGmyKrcjEL2iV9tr1tFmOd4BDYT5B8+RKP9dD7e0zppp7NQ0UjR07N6gaHEojOaqgMDTbUsH8AkGHB/wRaaqjHA/j0z3cQzCbtWouZsK9fVrun5/OkBR/rqh2z7TQY0Ro9cLsOT42Um3aYUGH7LtDwriw8Ed7LXDPfGUYUh4KjNSJw1zNQ==
X-OriginatorOrg: seeingmachines.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2017 22:40:32.0349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME1PR01MB0609
Cc: Aaron Zinghini <aaron.zinghini@seeingmachines.com>
Subject: [meta-swupd][PATCH] swupd-image.bbclass: add another missing expand arg in getVars
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
X-List-Received-Date: Fri, 24 Feb 2017 22:40:35 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Add "True" to d.getVar() to avoid forking a little while longer.

This got broken in commit c63e8c0d95604ee5 "swupd-image.bbclass: dont fail =
parsing if SWUPD_BUNDLES is undefined"

Signed-off-by: Aaron Zinghini <aaron.zinghini@seeingmachines.com>
---
 classes/swupd-image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/swupd-image.bbclass b/classes/swupd-image.bbclass
index f55b5d6..0950258 100644
--- a/classes/swupd-image.bbclass
+++ b/classes/swupd-image.bbclass
@@ -249,7 +249,7 @@ addtask stage_swupd_inputs after do_swupd_list_bundle b=
efore do_swupd_update
 do_stage_swupd_inputs[dirs] =3D "${SWUPDIMAGEDIR} ${SWUPDMANIFESTDIR} ${DE=
PLOY_DIR_SWUPD}/maps/"
 do_stage_swupd_inputs[depends] +=3D " \
     virtual/fakeroot-native:do_populate_sysroot \
-    ${@ ' '.join(['bundle-${SWUPD_IMAGE_PN}-%s:do_swupd_list_bundle' % x f=
or x in (d.getVar('SWUPD_BUNDLES') or '').split()]) } \
+    ${@ ' '.join(['bundle-${SWUPD_IMAGE_PN}-%s:do_swupd_list_bundle' % x f=
or x in (d.getVar('SWUPD_BUNDLES', True) or '').split()]) } \
 "

 python do_fetch_swupd_inputs () {
--
2.7.4


Aaron Zinghini
Senior DSS Software Engineer










T       +1 917 346 2993
M       +1 917 346 2993
E       aaron.zinghini@seeingmachines.com
W       www.seeingmachines.com<http://www.seeingmachines.com>

[Seeing Machines]<https://www.seeingmachines.com/>

This email is confidential. If you are not the intended recipient, destroy =
all copies and do not disclose or use the information within. No warranties=
 are given that this email does not contain viruses or harmful code.

