Return-Path: <jhofstee@victronenergy.com>
X-Greylist: delayed 57550 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 26 Sep 2018 08:30:16 UTC
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr30105.outbound.protection.outlook.com [40.107.3.105])
	by mail.openembedded.org (Postfix) with ESMTP id 5C77A748F1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 08:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=VICTRONENERGY.onmicrosoft.com; s=selector1-victronenergy-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=fBAdpRErjJ1WBnhARy1AGdaIZORQFtj9mTHpBSL5pBs=;
	b=HK512QWkPtCxA0QjdCiw2pssnMqKmGfw1iQB/5WWBD1KQ8vyYYAh+fvhHZzfc5/pwJxrCLb5wUJKNWb0PSxHGPMDePFffG8IFSME39yXC05pM4sN+w3OI71hNglQtnkuTSMBjqAtIKQRPjG+2lS5i6VGx5YLhhcHAkC1Mr/6usU=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=jhofstee@victronenergy.com; 
Received: from localhost (2001:1c01:3b04:4900:8da0:c385:7971:a200) by
	AM6PR0702MB3640.eurprd07.prod.outlook.com (2603:10a6:209:10::30) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1185.16;
	Mon, 24 Sep 2018 19:00:45 +0000
From: Jeroen Hofstee <jhofstee@victronenergy.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Sep 2018 21:00:29 +0200
Message-Id: <1537815629-21796-1-git-send-email-jhofstee@victronenergy.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [2001:1c01:3b04:4900:8da0:c385:7971:a200]
X-ClientProxiedBy: AM0PR05CA0021.eurprd05.prod.outlook.com
	(2603:10a6:208:55::34) To AM6PR0702MB3640.eurprd07.prod.outlook.com
	(2603:10a6:209:10::30)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1bf8949-6d72-4b8a-fcd1-08d6225008c2
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:AM6PR0702MB3640; 
X-Microsoft-Exchange-Diagnostics: 1; AM6PR0702MB3640;
	3:WTX1K0+f/nRaIDcKJ/BKfBPY423FBnpQb8BWD74GVicxbAEu3/ixtO5Qj0wpnn0asPQAthV/WYxr4DXA1HSAcM0i04NIKuOfhOU2BBq+uO+jDIRgqEVR22vJu3dHn4SCkHWLo0tWhO7KwWyxSvL3DQ6WwZyS/O9yCMTOVTdcQxQ8oqDOtwc9b6sOsbYo5M7lwf03xZK9gOA8+SpSAxa/LvpDAGOMLAZ6Va/si9K/0rgtZPT6gKmlSc96ys9xhe5a;
	25:tFht2ORUc0PH1tpvoGSQVRt7VDKvFO42yVSB0Rx+aRK4vwK+tN4ORHuNCY8d8ZZj5AsQCf40hJ9UTMvorsG8qY95d7THxibWGo2ASjryYvMvOfQfYCxRZp2+ZehzQ7n9IFIonRm+eAxsz1D0VHFY05WHUxUZEDGczSB0wt+M1G3mG/ZaB09wIAStOEVBW67tO4KT01+l2NSfDmNG+pICFm9UpGHUK1d6vdspV8mC2bEeXNwS0bo4nbnxO/KJEWsH9SQMwIykAAkciofoGA3KmrmwKAaNxzqcQwWeTCRnir6Gm1f8mhzFGLz4pK+m724FH9g5J7PemyFSYhhoYe5Zdw==;
	31:IED8cHWeA0/44e2lXpJykyQ4jbz7U7AWH3A2BrRF6CuOhv5E92zhD0HuLfgSrb/dWL2O4YKLCc7yUljVGo8vroOdSqlwxZVKN8n9hHdkCPgw/XmASGdAr7LJ0Vima6fsIqJn9YuYSi0YTkjM4RdmqX4U14hDsWGt4A/bPaft5BjtVV50yGmzwY+RusDD/kXykhNwkdAiwtqfj1XKPGlj5kh8GoN3x0NXtUcu2oZGvLM=
X-MS-TrafficTypeDiagnostic: AM6PR0702MB3640:
X-Microsoft-Exchange-Diagnostics: 1; AM6PR0702MB3640;
	20:GmNQj3tzK2AthsADIfWX7imBghS/fNcWHd0sVvZp1fzPaidSNJHHXMP/mp35faPxyTJxotX7VIqQZQB+OOMwc5X6OSLS/t5spbQd8TMmr5jIY7akxE/740x3ttaBsMhRzdDVVKpMgvi3lzcDc4Qitx1TtGCaNqQQtDhrCvqdR1RhoCktpKEJfS1VDMcKAcUpRqVXHxabq7SGQL0JQIwcA4ordeNSv/SfrLq3QT9dtpAfZcHbIXSFPuIhf2YMpo+a;
	4:U+moGZ8mUC3dIIosuhVXUNR9SGTuWzckgX8GI3aAo5TT7QONgmDjtfxD9DGIBhSyOhJraX/wqe+plvedteePhqC5ANkrAEWHqCnSPZiS0W9GSmRmPyKZQxpVFLNvNVxZxlhXUdP3IswND/1x0pMGKw5oQcqJ4T5QEDtXUYh/3TvvsPXl9P+rdDkHB4WMz39klc3/pudc4J7/3roD+QJHkgp71hcVMjv1QSYNTw8eXD3iL758ITa3okyXnlXDVMyFumJ+q3/U2fqbMXpmozps3w==
X-Microsoft-Antispam-PRVS: <AM6PR0702MB3640046B5566A93E75DBD380C0170@AM6PR0702MB3640.eurprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93001095)(3231355)(944501410)(52105095)(3002001)(149066)(150027)(6041310)(20161123558120)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051);
	SRVR:AM6PR0702MB3640; BCL:0; PCL:0; RULEID:;
	SRVR:AM6PR0702MB3640; 
X-Forefront-PRVS: 0805EC9467
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6069001)(136003)(376002)(346002)(39850400004)(366004)(396003)(199004)(189003)(52116002)(51416003)(305945005)(7736002)(2361001)(316002)(486006)(25786009)(52396003)(4326008)(36756003)(106356001)(81156014)(8936002)(46003)(105586002)(97736004)(2616005)(186003)(48376002)(16526019)(68736007)(50466002)(50226002)(476003)(2351001)(81166006)(8676002)(76506005)(107886003)(386003)(86362001)(6486002)(53936002)(6116002)(6666003)(6916009)(16586007)(2906002)(47776003)(5660300001)(6496006)(478600001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR0702MB3640; H:localhost;
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: victronenergy.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM6PR0702MB3640;
	23:P5hGDRdJ6A36v5Gd4F1Xwf7Qe2Yw4x4OPCCOS9p?=
	=?us-ascii?Q?6zPcwcWH0CujzEDPUmtDQZufdbkaQOLJqRizAJ29V7JvZC0QO1GyU3LR2jo2?=
	=?us-ascii?Q?m2SLNXgDHZnm9V9yrfu4KufQtQIus/HNOiQrJngdrognC4OIUSIee6vQ9C7s?=
	=?us-ascii?Q?ztfidIKYef8v6+JcteLRP+TXnVOBLXycJUySJb2/CK8nkEq1L5c7NM93J2h2?=
	=?us-ascii?Q?/EqwUyJRsc2TdUPndAuYAFPKaQoTYrjmazWEfpsmJ3dIc2cg3SZglHosNJyc?=
	=?us-ascii?Q?AwAC6ChCq0be0I1zktofUIfjFxFynU1NFxuDE6XTv5fYRfgD49+q4Yyt1S9k?=
	=?us-ascii?Q?sfRsu3Mj4rCBr1H40Q8nWPFg40J8SOU6/H30Xb66vHdZff7GeBtWWpkIxn2G?=
	=?us-ascii?Q?DOPnitHW3RQzmAei5o3u8QmqXkvzVUwnrxFOusQWyIaRy2G95xrDb0JNVVv4?=
	=?us-ascii?Q?d673dCMNY+ad9xbMPwnQJbik5Tsb1sX/ErrngBtsmlR9INvlmbTGsCyiezUP?=
	=?us-ascii?Q?Lumm57VwP8TWYD6E7oVBa/8PGfovA/QLTDPDFF5l+zshSs3Ue8O8nll15Y6c?=
	=?us-ascii?Q?3Ye2dqk/QqlhccApigwMtecXhRke45u+0NtsYKbF/3HZma3nh7VWklU3tC3n?=
	=?us-ascii?Q?Uc2w/7d+p/sEUO2JzkCBdKxRdXNtPOmWGelMgK1nxo+X4uWXoA+GZQX+QwK3?=
	=?us-ascii?Q?Hj9bFBuhy3r8F1Xr2hc65nfoqmVOIEB6jRzWL90VjzxbkPUOt62qZTURP1Q5?=
	=?us-ascii?Q?6smiNgr2WdIDyAxmUZOwnJfKA/IXSjCscfK0tbiBpsX5jh+wRTvu1nL+TIHn?=
	=?us-ascii?Q?1t8zCwrsIHw8Lo+y5EqOu5eC+qR7V1dGHHCzjYgeR0jVQ+ReVQXOV+BbNVAA?=
	=?us-ascii?Q?b8duU11bnUlL0aiRHv5C2aIlD3cHf9gckTEQc30ER6Rs/uHqZO0D5KAyD9fU?=
	=?us-ascii?Q?6qDsfzh0doqLnyFxZB+ohH3gA6owwo0ozGNwOD1iiiMsCMzuRVtQE0LNgaAE?=
	=?us-ascii?Q?1q3hZUsN1CYEqpGaBEmonfEeLK2YFq6dbHqfv791NFR9tjIlsdORb353XVmP?=
	=?us-ascii?Q?gVQwKs7bDFJcdjtDU0/pS8IKPqebfbMDf8R4JuFCNQ6oQ5NRn1sugVNrtqUu?=
	=?us-ascii?Q?NiYUOPPK02gRgCUSKY4xRACXNMtY/rE70DyRNERuBcU44Bmc9VHharg=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Antispam-Message-Info: ixd6dGTLSxvvvpE2g54MFjZBV1YmYgmFF1shHYAZSmhc1n7GjyM+CQDmFo1LifNxyxZP68GOQcTfWavxDJgrcIc7tSHk0RbZxTmKsv7wj0f/ocKASFCf4oO8tepf/alY5QheBrvxuRnzUTtDhfzyGpXODAxdnsW3BHxM9IeNGYEdsqe7UXq0Tsre1U5O4Hjj+lsOoNE/A+SISGl6I4BhzeR4XWlMiGI4f7KZ914BlAxh1VGIghBzweNA973BNQw+Fnci+Zzbrao8V0Ag0dPwjHHLKNbgDt1KG9VvJSWVRSARUEV5I+5WK499gQF35AQwL6dKiycoNnNdgRIOssiQg4Y2oguxMVESotI05NuNHUY=
X-Microsoft-Exchange-Diagnostics: 1; AM6PR0702MB3640;
	6:ab3Hijhh++6AVi20VySMjdc9pxo7zzkRm6Q6oEV2FMT7kxHm2uQOoQbwtN2j9GvXY68cPk8MswfDxeGkOTwBpQGx75CU4Xqvpq22E07ENz0fNZPF1pX2lcu/jfe1VY9CTpmY+NoLBOoELonZ+WOAqyYa+ao+OKjQjwtqYXEW28qXrgUlhiOmfQ9rx0XtBLy5Hu4BMHlTiOhsTyFzBRnr8kiClIdN2Ic1OKAxC9Ja/ltwCb+MovxkDA6SDcY/5RuaTUiMOHWU2Kga93gIXhSb8HTUCKF9xpfuVmJ0myxJ0NKNok8aEnIWtEEdgJZ7s89jWJ1MHQyX+R/bxyc8GfBM7iajZIL/Scfh2KzXRuQeT2sVk4/F2juV85ubiasFvbbnUzY0EL3YxlLZYGZQEhKUj9xrVXL+J3mp6LIwNaULsufqz9q8+roaDyNqWySNzo7QzrjKojvYMSQ6JC8XOAl/hA==;
	5:C4NIuc3XLLieaPEX3YTedLVR+ay56y9zMS6lLgO6reKs5aH3yII7ZSh23pVRbnnwgcTBxomQxFtJcJxVGqvYXVkVMePx5E2V222ws2VLbieba3s+I3ky8h7Uk6/aq11aWZrd4MBLAlyldbnA2itzGpEV3npAeYe3pxK6bKszeGg=;
	7:NZ8HmiyZS7owQopizB9cKKK1uMXxatSLJXFgUHpsgX0cP0tNYjXFCHIck1IgUTkexxloWrRBeGQeMJx+CqwF+0M2k3VcQro2XQKxd5mv29A4gd4VUe7YZb7Y8nsxTQvgwFx4APfpYxoUwFtydY9/yFRQupsyDydAHx114aZ3tHjq7jJulBchF9sM/NkCs1dFi9x7gEqHEw0x4IQM9bpSASsm8wnsr+wylWgHoSSQbO0oo/iSw7YgSusmyZRusGxV
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2018 19:00:45.8367 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1bf8949-6d72-4b8a-fcd1-08d6225008c2
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0702MB3640
Subject: [meta-networking][PATCH] mosquitto: make websockets a PACKAGECONFIG option
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
X-List-Received-Date: Wed, 26 Sep 2018 08:30:16 -0000
Content-Type: text/plain

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
---
 meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.1.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.1.bb
index ae493e7..b4adfda 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.1.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.1.bb
@@ -28,6 +28,7 @@ PACKAGECONFIG[dns-srv] = ",,c-ares"
 PACKAGECONFIG[ssl] = ",,openssl"
 PACKAGECONFIG[uuid] = ",,util-linux"
 PACKAGECONFIG[systemd] = "WITH_SYSTEMD=yes,WITH_SYSTEMD=no,systemd"
+PACKAGECONFIG[websockets] = ",,libwebsockets"
 
 EXTRA_OEMAKE = " \
     prefix=${prefix} \
@@ -36,6 +37,7 @@ EXTRA_OEMAKE = " \
     ${@bb.utils.contains('PACKAGECONFIG', 'dns-srv', 'WITH_SRV=yes', 'WITH_SRV=no', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'ssl', 'WITH_TLS=yes WITH_TLS_PSK=yes', 'WITH_TLS=no WITH_TLS_PSK=no', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'uuid', 'WITH_UUID=yes', 'WITH_UUID=no', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'websockets', 'WITH_WEBSOCKETS=yes', 'WITH_WEBSOCKETS=no', d)} \
     STRIP=/bin/true \
     WITH_DOCS=no \
 "
-- 
2.7.4


