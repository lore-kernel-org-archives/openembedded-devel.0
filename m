Return-Path: <ann.thornton@nxp.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0099.outbound.protection.outlook.com [207.46.100.99])
	by mail.openembedded.org (Postfix) with ESMTP id EB05C62136
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jun 2016 21:30:17 +0000 (UTC)
Received: from BN3PR0301CA0028.namprd03.prod.outlook.com (10.160.180.166) by
	BLUPR0301MB1619.namprd03.prod.outlook.com (10.162.214.29) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.517.8; Tue, 14 Jun 2016 21:30:17 +0000
Received: from BL2FFO11FD018.protection.gbl (2a01:111:f400:7c09::189) by
	BN3PR0301CA0028.outlook.office365.com (2a01:111:e400:4000::38) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.517.8 via
	Frontend Transport; Tue, 14 Jun 2016 21:30:16 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; lists.openembedded.org;
	dkim=none (message not signed)
	header.d=none;lists.openembedded.org; dmarc=none action=none
	header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD018.mail.protection.outlook.com (10.173.161.36) with
	Microsoft SMTP Server (TLS) id 15.1.511.7 via Frontend Transport;
	Tue, 14 Jun 2016 21:30:16 +0000
Received: from [10.81.17.26] (RA43240-03.am.freescale.net [10.81.17.26])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u5ELUFZC002589; Tue, 14 Jun 2016 14:30:15 -0700
From: Ann Thornton <ann.thornton@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <564b94d2-1e21-ed78-469d-9a347cfffffe@nxp.com>
Date: Tue, 14 Jun 2016 16:30:15 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131104134167565763;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1109001)(1110001)(339900001)(199003)(189002)(4326007)(8936002)(586003)(230700001)(68736007)(5008740100001)(104016004)(2906002)(6806005)(11100500001)(356003)(81156014)(8676002)(81166006)(31686004)(189998001)(97736004)(4001350100001)(110136002)(33646002)(229853001)(2351001)(105606002)(106466001)(31696002)(65956001)(47776003)(65806001)(87936001)(92566002)(19580405001)(86362001)(77096005)(19580395003)(54356999)(50466002)(64126003)(36756003)(23746002)(85426001)(50986999)(83506001)(230783001)(8666005)(65826006)(7059030);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR0301MB1619;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; CAT:NONE; LANG:en;
	CAT:NONE; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD018;
	1:LqIpX+Ho+9KEzcPcOGNfBLgIIPn6LCPZZGYpWzi9ChjD3GxHeZPdeNXFYdcrtbbUwDDQ8pcFh9YSJb+TfYb2hrFV7UIiGyM1tk1fDrlMrQjn0UKCnsGaEBUl8AH4RR5dQk5IeGKMGnaTz6YckEA4HAsCVMIgtX5EdzpJTAs/tGxGQZmyD/gv2NmPkF1lmmA3DxwrffK6gaB5oI+hpVjhXPZ5ZaZgVYLLsC4QM1tjE05U0O8m483cL/fBMlTKNvcYrIEOYJi+MJZFiRQgC23B/E8eApUXugQQuLbVGgQGFnjRLHrUG4Jum5AJjYZ37qpKqzgN9vx/UmS+8+DVvjIaoBN+SKH5ha8IgRFd1TOy7IzQr3oLTunTW0e7tblORoyyS4/XRvCpeJhw6DxYBk7UwUYAcw2Fu9RGdLaH9Uota4mUtJDZwX/E5idnrWmi5VWsEgRIvFicisVeHGtvs0mcJ9lwlcb39mvyQSREXl97a1QTy2UwCZm/kArhj8go03RAu3eLmmlMT1vMECVws+lCx50rKqfqG1C5ixXWMe9SVm/5uEolmT8E+Ouqhspy16CM
X-MS-Office365-Filtering-Correlation-Id: 05802e3c-943d-4097-3462-08d3949b1419
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB1619;
	2:n06juBBXQgsh2cKNLmpfkSImPxaLXMA7bL20DA8djMINrAeMfUzT4Xzg48viu9mQ2S05GOpZfqtFt03KkJhlrUHeaTPFL/7xtb41qXrDIF24t9nploT6xXOpzbzJhLM8VauHApMwyQGZSjUQrZusr9G1Qi+bhqgdPtn/5/uSALsE0+uJbB6JnLMR7CYbuD9X;
	3:xwskqwprwaT46bk1r9QjQD0QmxDTxo3XVpUD8VuWXhJpqT49CazbuFLS2zCiSb1XOsDvNC6PgmHdWgcy7ixlCP5EZC1iG/jnGvEEH8NwD1qkZlgQa1IUN6LfkmwLta537BgfLNoMbziaL7bzP16yRyEQbCU2gAPL6HNy+f6Tz1nPPgSiNWxMOu6Vo7ls9ZYaI1vqnuORwgQ6wDXn2dXXUQgsdl6lvRqRpD3Sb4wXtiE=;
	25:Cr+sczRimqiCUYN+Y+FuQ7V7gDhXqMPNZpCGoqpjMDNBrn78LU5Z0x5R0GNMExmEcrcWkolJ8Bp/LaVUjq2oolQvJySYasLKzfkPzymaYoUVhL+QqT98NO1HLsYkvkSY+1wyHlVbos+a0ldgoLQFzLWLN217H2oPOmQstClm2BSrmDeSeFf7/cbqgew5cky0Ly+MeM2z8aYT+c75IMd2RSRXv/i+Gwy+dE9CQnlKhLhx06vU26E0j5lPVG6HcK7unsm2y+YzDfx3RCbs3dldFNGz8VyQr2rHYF7w68DmVPYt6wgicxH49PjtR9DLknoEGVhsNisaF28PVJenGLbFYvdTl7O0wnj/cKfSVWuuRK9bI5ngrwa3slQSzMCAifq8fWT60opGAnS98qfsMFOa6zY3lTuXQBF7i9s8vc/0X34=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB1619;
X-Microsoft-Antispam-PRVS: <BLUPR0301MB16190DD7A6977C06F683206286540@BLUPR0301MB1619.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(13018025)(13023025)(13017025)(13024025)(13015025)(3002001)(10201501046)(6055026);
	SRVR:BLUPR0301MB1619; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BLUPR0301MB1619; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB1619;
	4:kbwem01zG0PXUkq5iu6sZ1OAJqGTcm5S23QyXv6OmLyNniTx2/OZlyR+0hTcrvnGb6GlEvvLWVb9EqLhFg2IXPo7rEtlpsKA2wfA+EXJ++M/vaIltza7k7LYcjgillVPTZPy+KeUkKnOVzDq7hgRSTH2RjN4RvQ2C7F4B36yca+qM+N1ZS0T0bRZ9rjwep0jGHWUxgpEYcD6O8nXHxpOl6b6LtaLjqLoZP/AdUI7r/lI7XoswisIwdbo5GOy4iUWcTBoK6OZlMwRTXIKKIvX5K41V9+wU62BPhdLvk/Pf+p77t7BT64RR+h90M5bauSedqU0n0gn7zuFk/JyNlctw0d+fFjLu9TVS4bItnvUlbfQQhNErKaGBfzuPdjHn0fpgbvz6LKYy7mwW9tXbSSGEN9mJbipETovj0k7sI1NlbETfo228JTuHrshfxwI5nTS3thSvPEV9zYV8nW5eIRty9JT3UePK4+1EjGbvn6pV6IbWKedJzotLh/0EkctiuupPaSEiYRoDPTxqDe5yznApQ==
X-Forefront-PRVS: 09730BD177
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; BLUPR0301MB1619;
	23:QMKduixBDle00y6ZoEAsb6YTeLI38wtVp9P?=
	=?Windows-1252?Q?XPmgM2SXQH7REBQuk1lQKtJ3wHe0BOsKh/oIWgaynVLM4gSJGT7Z+wm/?=
	=?Windows-1252?Q?DjbLNuFPNsalS9Zdix4acV8IZVYHocN4/HhixbCAvwUNQcQ513r04+rG?=
	=?Windows-1252?Q?/SUDLOI4989IKDTKFQ8HrrG4FfYiKSLoPFJEtOr0f8XTmB/xzKurEYJz?=
	=?Windows-1252?Q?0cUBSabK2I0pBB7gHjuoiSudG6U1IulM4PYt+Kfd/ECDrwGEREZTeKw1?=
	=?Windows-1252?Q?/lZAxBKShnsQQuk4tnY/aD7aoA70/x9PQUiP3FhRSSQor7l2qsCzFNlG?=
	=?Windows-1252?Q?8cA8mUfC6zTb4/6qz9jFUBzcFG6gcSuB7KGBwRhc/jFA0lPHYD+y/cSu?=
	=?Windows-1252?Q?wlymuoRb01CdIZ+UjIK8PaWUO6VQ05PKt59nxBJshlsDLSAiQossM0an?=
	=?Windows-1252?Q?IDVXoZsUzoVFd+Um0DmuoADKRu3f1+vMxx011WBY9CBB4wTPLstr9yoM?=
	=?Windows-1252?Q?etbrFPkif9as/w+EoDFLZKW4f/r9xwvtM7iTED95X4dv8O7tsssoEg4v?=
	=?Windows-1252?Q?Gl3SXngtE+xwNGOTnooxdrOj3nteVtedRcWPU5MH0QgEayoYE36cgpU6?=
	=?Windows-1252?Q?SOa4XaWRPiM0JYWQLo/PMg1aaODPk1fXGag1PZ6bm+wGbzIP9VqaC3of?=
	=?Windows-1252?Q?OtfWxMnKzfsYYvTQiiEEYU0Z/koasCoOyIIZejHdei7nhcB98FQ8pHCD?=
	=?Windows-1252?Q?yefQhzKO6koHaWa/6xq9/KiJprLTSJGCmR+kR8lnWPHq9maQ8ruVuhs5?=
	=?Windows-1252?Q?34XTzOUalfmiEpAcaTzf/Nq4h7dduMLb6+4z8x+2Fkax7yX5gfOmsLpG?=
	=?Windows-1252?Q?fUzR09X1+ZrVfaqtAqGiCp+oALTQtbnIP0/K8P8k1bgE5yHO9MNsz1Be?=
	=?Windows-1252?Q?tUHy7B3JjxAmoJgiTILHxeSdl8wSUBmk0qQb/WEna9Zj23BIHm9Y948v?=
	=?Windows-1252?Q?9yX1zp0XWqb1Psygh8c3jj76FCS8O8Hl+PkJDModAi9QyGOpjaaK8EHN?=
	=?Windows-1252?Q?REof56laR9gPbSz7Lijp00CH0Oe6bZmB+5ABFTsomhz7Ot8nc/6Lw9V8?=
	=?Windows-1252?Q?ms8Pu8/N6WYXzLWNSrspBCFjzUvEyk4WP3F7Dw/E9Sigii2B/1ZJLWFk?=
	=?Windows-1252?Q?WycOGJKUBph3CHHOoae12vY/XeGbnhMGtMFfteXaY/21pr7OgQyNrFGr?=
	=?Windows-1252?Q?IQ1Q0uY8uzz1ybxN1aZK+P/j2FPVBxEs7+NUaA5DXkVdJ2IrYjedqQjS?=
	=?Windows-1252?Q?T+nltF+fV/jOn8VCzEB78Bv1rQr1W8h63GNgr3kB7rh7o4AeP+OCPzRg?=
	=?Windows-1252?Q?qNm8GCuExTK7mccep6hPyuDMOUPqAzOlWYvuZ0UnG+Nhsgu4gDPdTVG4?=
	=?Windows-1252?Q?Z/xRAQ/UO8gIUE6dosBdV?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB1619;
	6:Fxn+sJSGRLsoc+D0ZCnt0JzPnZfifpPo5CJtRyw9u2BcS77lHGHBok/OuTEDoLdf7O77UN3gkX3NEfjGw0yxLKNMXd6LT9qjvLoGojYw6KX1/SGuI9zCPm061K42O+yRd2o9C2c14I7CuYb3hdnlc+uakdh6cJPDUJA82bzas6CXwAKyEy9WBIU8t7qmfJg/EseXo0e+4He9Z4SYNupE4Wh+0+CiDDanMGbWi6UUwzYrBfOwrPUJA+LFmSYbKlexst/nW5j+0Fo9MU9jHm2XrQ==;
	5:Xjs5jCnG2C+qr5HfBnRiaACEE1JLcxIx8zwIuUIMwnU6Y55PumlzR+E+hj+9/JsZ5REg0C1QrGZ9TojbMv3R5rffUkfUCSCVKyStpIpfK3X014Qp7d+6irEGbcFbBpOlMZiFTq9zNJd8Gwt/NAS0vPiDWTDieC1kZxDTAUOz1o0=;
	24:KBWII3kRAOtuQGVjdR//z/fpfHC40fjIiFGI05J1UZDuv9FXZOYe+OrvGOBa7/vi9eqAyn4YmDdxhTLB0xeVDY6jIGf075SK6tT7c4wbfdM=;
	7:nGwE4FHJByg4WCx7MspRWrJlWXIF7ePMxDZWzwSO4BdkaDTi6fuMEhbMR1MzSC5DXTa9r5AgYyM4WVg2MrRHjNgKsfZdTic0iY31azLvDcCJ8Qo1X7dX0lkR5CeWvC+6b3GuGV9wu09CpX7CyIxRkWnRnC9Xy2QSsmGmJ7QcEyP4E2j0wV1q/A9stz8RSPDbzA2JeB3RgDIJkONg6Mg3ag==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2016 21:30:16.5693 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB1619
Subject: [meta-qt5][PATCH] packagegroup-qt5-webengine.bb: Includes qtwebengine, plugins and examples in one convenient packagegroup.
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
X-List-Received-Date: Tue, 14 Jun 2016 21:30:18 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Signed-off-by: Ann Thornton <ann.thornton@nxp.com>
---
  recipes-qt/packagegroups/packagegroup-qt5-webengine.bb | 14 ++++++++++++++
  1 file changed, 14 insertions(+)
  create mode 100644 recipes-qt/packagegroups/packagegroup-qt5-webengine.bb

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-webengine.bb 
b/recipes-qt/packagegroups/packagegroup-qt5-webengine.bb
new file mode 100644
index 0000000..5d09efe
--- /dev/null
+++ b/recipes-qt/packagegroups/packagegroup-qt5-webengine.bb
@@ -0,0 +1,14 @@
+# Copyright (C) 2015 Freescale Semiconductor
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "Package group for Qt5 webengine and examples"
+LICENSE = "MIT"
+
+inherit packagegroup
+
+RDEPENDS_${PN} += " \
+    qtwebengine \
+    qtwebengine-qmlplugins \
+    qtquickcontrols-qmlplugins \
+    qtwebengine-examples \
+"
-- 
1.9.1


