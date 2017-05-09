Return-Path: <martin.sjobeck@multiq.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0138.outbound.protection.outlook.com [104.47.2.138])
	by mail.openembedded.org (Postfix) with ESMTP id BD7BD6FFEF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 May 2017 16:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=multiqse.onmicrosoft.com; s=selector1-multiq-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=YgTWu2Gcf2abeRIgtoncSYRzDDR+o7kYYDz+1h+Bo4c=;
	b=lmPUyp3UXlAtK7w61bJDu5aWJUIqpFVlrHyB/T507V33i7gwZrQOkoediuihraGdkrswW0CjdBN6IjZrwhrveqWjCVXRgdmN8en3IZWaH1Vf3gI5LzswJMrsQtP4qQ/Z9ha0S/sut1d+APXiKnL3A5MJsa40NacWOVBKciSgoKw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=multiq.com;
Received: from localhost.localdomain (81.234.194.205) by
	HE1PR0501MB2011.eurprd05.prod.outlook.com (10.167.245.141) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1075.11;
	Tue, 9 May 2017 16:38:06 +0000
From: =?UTF-8?q?Martin=20Sj=C3=B6beck?= <martin.sjobeck@multiq.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 9 May 2017 18:37:55 +0200
Message-ID: <20170509163755.13614-1-martin.sjobeck@multiq.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [81.234.194.205]
X-ClientProxiedBy: AM4PR07CA0036.eurprd07.prod.outlook.com (10.171.185.49) To
	HE1PR0501MB2011.eurprd05.prod.outlook.com (10.167.245.141)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d236ed1c-b2b7-4122-f452-08d496f9c573
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:HE1PR0501MB2011; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0501MB2011;
	3:vyDmf7u9A4/N/QNv/7TAsYtVvnQi7pDr8Vs02Fr3Qt4Xkuj6e/r0THds6H3jnB0l7rgY/1mMbPkZdg4NawnlPBuwRGrGYnlh8ZNZbCk7J3FI7k5oOGR29LONyyX2urvhopg5Kkzu5y0aH3M8/KuTGvZ9wPHVhwMxekNLLem42bWKeQkylMlKWWkovXPFEOC1Aos/k48IoYndE45wuZUViDPYoHb4rneSj95t4GB3OAHtZzTluM05Ik+b2U/GRHHJ3t/IYbFt6FkijW78RYQ/Pi80Q1gYPBATSbL0AXop3OHP+rGURKn4Jk6Hd7F5IUaLgsJkiJzMQpID62NG9gwu3w==;
	25:54r2wtgwaKYKgaUHdF0VqG28M+ROS9oCiYXXjp+8N+W9GRO3Nvh+A88QMLnvsIxVOdsdoHZWV3+4WSfEpwBV5Jm44UEKTSpR+zBLivws0hw4gNxqflXg8QSqocwFS1WLxyitKdNEAGArYCeczk5Ur5YxTiVYYIn3+9eM+fUFg5RLsV6CdaSKLBKNW00QwNrLIIUHqXnoN/2Dr4zmaKqO4fnSF8NLggDbSIXBxA8Hut4GMJ0+yaMhoFXkoTpaY940c0p9TZEwsiNkibAIL+WbOTXlg9AAEHfeUePLdUi4inrchJO/GnkWr/dqrN3DdQaVxZSsRzEWumOzBasRSEwiUyDlC2HLM/6QczXdtqv06LOjsVGe2DM0Ag3lQY9xw3vUvk5PU6kag1WLNzgbz0uj2/kDFTyvhxRre8VisT30wj78F9iIDbbWBu5yTmWZvcusz/b1wu0KJ98+L1el6I344zhKu1/PWzx8cphUWHsaSMc=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0501MB2011;
	31:AlYiDjjfDENhdA76ODFt3E2eo4D8eidO5bTuAmxHGPkcFXcFjQRh9sPRGA2Ms2GaeKJcv8SahtlLpKZHzK72ad5y5H2Ud4XvqFGlUJaL7b7WWnDxGD/aPRabqti73Bt9whRokHMkH1i1FIiuPT2rh2BayhifDyrvfxnt8f6tkYoi8NUAQsqac4WhL4PXC/ieh/A0nj7doClBG0mFWWPWQDxp1Pm4tckPI9GdB6ibr+kO4gny0rHMoBrOiLMthP/s;
	20:3PPIzeQADWYBc6df9fTOLDwRcVYLrQ1keOkw2L7n5RhIuFRye2DvW15Mgk7yvNr+BypSiSkGR5WOK7zV6VGtUX9d46bU6coTz9UcKcaT5TUJUr6QCLcthPBWTA0gbYRwNCPUoWgH2ssApTQD/zCy0AFG/EE9uTrB8F/20Vuho0IZedEB3NAYDN6IoSamVM0hX2pG6DA9ntkfxFq3rMsxWEnenvlw4TuTqKFdiNxl9cq+fcLr3cdEKLMJhpbW+TsvhO6N1onmkCe5J0/d/GZ9yBIxP9D3W/GgkxxS2vbG+yzrIKISHP4W3XBs/3WOLG4w/UlT35Ae/lPz9O5AWmtoyQ==
X-Microsoft-Antispam-PRVS: <HE1PR0501MB201115F8402103895EA4CF4FF7EF0@HE1PR0501MB2011.eurprd05.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93001095)(6041248)(20161123560025)(20161123564025)(20161123555025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(6072148);
	SRVR:HE1PR0501MB2011; BCL:0; PCL:0; RULEID:;
	SRVR:HE1PR0501MB2011; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0501MB2011;
	4:ba7Ur8PNNanvZlKnU42hT426Hph3TfCSpt/4h8rDNPMNYzvGsziftdaiFUb4aWq+UNx0GDR/6K+nXwUHxLfKTSYGlJeS6W62a5fO4ZBAbBJ2GoM3+k4WpgN7zW+CkbI6x7IYPd2j0W9xZzU7Ltuyv9z+KZmsXSRXFULNEt4rkCLb9PPbO7zph6ON7yxEQGoT8F/mS9kuYyM5rDyDiXJjq2TD1SJjhWG3+Zm/v9j1WqBu8G3tYw8+7d8qv/qjre1OPRUlhajMzURsof9mSPeS+pOoMFKv6aih+GFxOzg7L0iV01EHW6tFMWcC+4sEw00JYwq2KsPmf2D4TMdZFgFxj5tn0fMouijJpHwv+ova9XbxZjTDlURSZ9zpokNMI4L6y6W+o5FgyiB8/biYRti6dAO7YXKh06tMCftff8NQMwCZ+XRSDbc0tpmGnukrfX0CXc0zTeI3aWBrQdv8p4Cdqfle6VmAjIBWFNq7UGEbdIXYBp5zv66IANM/W7TwIRoZmZsvrFsZ8PnSI1giU0js+/mWSzD0/Sm5m1vn6ukkltfNCv0uZjZdIebOZKg9xZr+pQ4ED/J+QgP828VaWB8cjiaxfYIq3Xop7fSKEIeB7Gp0CFAmmnsSYzp/pm718SkYr6rTxA5tVjgEFGEjTBLkpGPFd1K5tSjAqyyo95SXcwGJDPRRTXpzeZ7uI7nqhCNgXJdNswk3irOirbJAQiXaaLedzbJWGBuqyzkltjzUQy/gh9hRgOXZP6UXd3ziJll04p/3uWVpPMiWd5cE9M5thTT0UK9zrA6wF24xURTiGrs=
X-Forefront-PRVS: 0302D4F392
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6069001)(6009001)(39410400002)(39400400002)(39450400003)(39830400002)(377424004)(6666003)(5003940100001)(86362001)(5660300001)(6306002)(2906002)(53936002)(25786009)(6506006)(36756003)(38730400002)(2351001)(6512007)(50466002)(48376002)(33646002)(42186005)(305945005)(7736002)(50986999)(189998001)(6486002)(107886003)(575784001)(6116002)(4326008)(3846002)(66066001)(1076002)(6916009)(478600001)(47776003)(8676002)(81166006)(966004)(50226002)(110136004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0501MB2011;
	H:localhost.localdomain; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; HE1PR0501MB2011;
	23:wvcmx6IiufHkLJ06SEjmb3oYAUZ6oN7iOCAD0tz?=
	=?us-ascii?Q?q6OSUQswwzxpRqOMN8qnLOkaQ4AL6EkPjC84Y8CA5SAb6ADns0N219yBTv6V?=
	=?us-ascii?Q?oP3uMgM8AhAVEi7hePLF189hlC+XTZLwCOIgPWzFaLaf6fPXSZTAxTlTDADK?=
	=?us-ascii?Q?ca7uXVRQRP3gzFo0f6g48YmujIx3JvaGyRiDBVGMYgPodMha73kJD9rOOvko?=
	=?us-ascii?Q?piZfPXPjyN4L6KfwNhUwkqKU3wzO3I8yqJclVkdX6CWa1Zem241NnyGdUTS4?=
	=?us-ascii?Q?RebCPXv82X0zPJMUHR1+uXe/LaSVfPg+kKoW/8c9pE4A5AMqSsJ5GPUkf3UY?=
	=?us-ascii?Q?FJPJKD3NzwDEjr7fl35jvUsruycwTo8t+8IMSpCMjX23L4YSJbLoQBa2VpYI?=
	=?us-ascii?Q?Vm0SCliysxnfZb7JXPKcTRJa4vwM/wGZx+ZE17qyBjMTTl7PSI7ljIOTWRqk?=
	=?us-ascii?Q?sorb3nKAScNoqz1dZJyaquNSeZkp4ryfgrQRBl4TnQhyfgD/p/DUFRZUtWON?=
	=?us-ascii?Q?fGlLSqlD9BX57phEJQp6DGQ2qUe4YXjgCdev049pH4IH5kgKIla4sxBCvUh/?=
	=?us-ascii?Q?5GFKOCxRF5zBX9oEVXT3ctsEJ1JuB78BA8YyJcxmTJ0ezKQkRVoihqQDWaKW?=
	=?us-ascii?Q?FUVpMNkkGIXssgA1zbQTROqjVwBEbwihdsVcW1EQXKjItMQJlLe7NUqP1UAx?=
	=?us-ascii?Q?fAGheBn2ZOv/gCwU9q8OzljIJ/xJx80AxB/AF5sZOJ00z0lafsVL4+Ni/edj?=
	=?us-ascii?Q?GZ6+nxSxPjfpwyD/iekj0s4sFho1nQqmYtKXhjrbTyFtvLGQ+1vBQv6DamT8?=
	=?us-ascii?Q?724mxtSXQQ/Wo/lJUyRbQlS9DhzA3DumUlYpjL1rcu6zEVZoW/uWMNGKpQAu?=
	=?us-ascii?Q?iJrByLm3nGHWO4rScn7A9RDebOmx72P7t4kp5sSaNSxjKAlOQWf+KhIk7/c8?=
	=?us-ascii?Q?AzvX3qqQET7cSHthEsEQsqNpX91HZRQv5GJxuEn2b4MLA70b5l2EkbMG5ied?=
	=?us-ascii?Q?GwCOyajToaDCDTCWu39PMslItNoKAUoABNOKKk0TZVMjpsAJxWM4tsZ9TgoS?=
	=?us-ascii?Q?rT3Ui+9NljUzmbn6WT8KFUmGEVmVmNwlojvKFh3Z9ZL4k4VTOkmKbvwlSyWd?=
	=?us-ascii?Q?JkmMBQrLcwz0=3D?=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0501MB2011;
	6:4vLWLDP65swnlWRZTBeiNWN3dlQFBOCdGUMDuc/KpIVb6wfiUFGIsZUDeauOsouTwFMtgfpzuR/T45DGIo4qUW88/cUOrS3QOwZk42el5BRxIqehNbTv7kWK+R726htX7TRJHPwhE7qWN6y2Qt3ppqjyradxKOeEE2QnUFvi/RXGMonHpWlt+SJohLrLwhcUMZW+MMu2aQ6Xw0atlSpNEdUi1UG0+X0zd9MJmYwUUv5V4P13RHE7sDYm3L6RiNGYcqRrtKgdNrK9MJDl3O3t4o5L00+rfLLYLqWoFha14pZk7n+fqWhyfhB1swLCuz0nq225G3EvgMw2qfr9hIIQV7r+6EQeHmft39nfUxYH/+DGwai1KvPJZnRylixYdr5s7NTNFY+a209dIQCr49h3GCBvULyeDxfXsgqapbRv/Iey+tdNEj6Xl4SHFfZlLaxAOM3M9W7tW7fiVsnn4ivM3DdIcHpHmoOdDDPFFvMaBD8z9JptXe3MY4tlw6l2wLxZ16tBEWq7GrTrfz7So70RXg==;
	5:xBvOUKujHnL1eru9kRbxKX6s+PvIilbJsIwteG7S410iYQOGdKTPj/aUl20MnHsjZrZd6uGFOhM5R6YWqzxpE2NMV1SE7HketKoHqv+mr5G+ZuOMuS/+RqJf2/x2iGaC/Vysha+/b7JV8hsFVFBpYVGnYXRyY6IWltXt5nwiTAQ=;
	24:tdfIYgiCRb4IDx8fRYFIH3xtcuiUXvBJTrWvLudGN4QcmK/TGm5CPdnGZL67EmqYBZbqIV5rQHTv2Zt5Jo5dunZ0dj1ltNGE/bvBAKu9huk=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0501MB2011;
	7:LFmbrWz2BGTmr5TP5AsxdxATRMc1evuX3dZAWwwZOjgiPuwIy+VUvyq9G0juPJ6KF13f9LK6HsHs2SNqtWKYuGPLxcvTcieDbu7aW8KYSpovQl6Nzv4hH8RedR9cIfZ+I0E+qgggYDAKBj6aKdN0B1Wrj6GiFp1zOBerPuoMRWvKTwEJlZ5t+8OLY3KVkCrWw1mlNASLNhNcnWNpDpN7VCciErU499ln2sRoQeSEc2v8l9zd9C87KUs2gIOFiG/Yhj6N9jC86aPA/oifDrVVxZpxQXnTXL/Dil+KzP9yzu6t5bg32BcEh2bPbLSDzCa957FrBWlVEDFm3V9cFQvbWg==
X-OriginatorOrg: multiq.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2017 16:38:06.7584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0501MB2011
Subject: [meta-oe][morty][PATCH] Removed blacklist for wvstream.
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
X-List-Received-Date: Tue, 09 May 2017 16:38:09 -0000
Content-Type: text/plain

Added patch to make wvstream compile with gcc6.
---
 meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb               | 1 -
 .../recipes-connectivity/wvdial/wvstreams/gcc6-compilefix.patch  | 9 +++++++++
 meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb           | 3 +--
 3 files changed, 10 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/gcc6-compilefix.patch

diff --git a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
index 65617fa3b..47fbf0ac8 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
@@ -29,4 +29,3 @@ do_install() {
     oe_runmake prefix=${D}/usr PPPDIR=${D}/etc/ppp/peers install
 }
 
-PNBLACKLIST[wvdial] ?= "Depends on broken wvstreams"
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/gcc6-compilefix.patch b/meta-oe/recipes-connectivity/wvdial/wvstreams/gcc6-compilefix.patch
new file mode 100644
index 000000000..87dca49c5
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/gcc6-compilefix.patch
@@ -0,0 +1,9 @@
+--- a/wvrules.mk 2017-01-11 09:53:36.764897285 +0100
++++ b/wvrules.mk 2017-01-11 09:56:24.227454405 +0100
+@@ -83,7 +83,7 @@
+ INCFLAGS=$(addprefix -I,$(WVSTREAMS_INC) $(XPATH))
+ CPPFLAGS+=$(INCFLAGS) \
+-	-D_BSD_SOURCE -D_GNU_SOURCE $(OSDEFINE) \
++	-D_BSD_SOURCE -D_DEFAULT_SOURCE -D_GNU_SOURCE -std=gnu++98 $(OSDEFINE) \
+ 	-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 \
+ 	-DUNSTABLE
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
index 8d864484a..cc0023a7b 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.gz \
            file://05_gcc.diff \
            file://06_gcc-4.7.diff \
            file://07_buildflags.diff \
+           file://gcc6-compilefix.patch \
           "
 
 SRC_URI[md5sum] = "2760dac31a43d452a19a3147bfde571c"
@@ -47,5 +48,3 @@ FILES_libwvstreams-extras-dbg = "${libdir}/.debug/libwvbase.so.* ${libdir}/.debu
 FILES_${PN}-valgrind = "${libdir}/valgrind/wvstreams.supp"
 RDEPENDS_${PN} += "perl"
 
-# http://errors.yoctoproject.org/Errors/Details/68614/
-PNBLACKLIST[wvstreams] ?= "BROKEN: fails to build with gcc-6"
-- 
2.11.0


