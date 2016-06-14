Return-Path: <ann.thornton@nxp.com>
X-Greylist: delayed 853 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 14 Jun 2016 21:44:47 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0077.outbound.protection.outlook.com [157.56.111.77])
	by mail.openembedded.org (Postfix) with ESMTP id B200B62135
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jun 2016 21:44:47 +0000 (UTC)
Received: from DM2PR03CA0008.namprd03.prod.outlook.com (10.141.96.18) by
	SN1PR0301MB1632.namprd03.prod.outlook.com (10.162.130.30) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.511.8; Tue, 14 Jun 2016 21:30:34 +0000
Received: from BY2FFO11FD044.protection.gbl (2a01:111:f400:7c0c::163) by
	DM2PR03CA0008.outlook.office365.com (2a01:111:e400:2428::18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.523.12 via
	Frontend Transport; Tue, 14 Jun 2016 21:30:34 +0000
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
	BY2FFO11FD044.mail.protection.outlook.com (10.1.14.229) with Microsoft
	SMTP Server (TLS) id 15.1.511.7 via Frontend Transport;
	Tue, 14 Jun 2016 21:30:33 +0000
Received: from [10.81.17.26] (RA43240-03.am.freescale.net [10.81.17.26])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u5ELUWjV003099; Tue, 14 Jun 2016 14:30:33 -0700
From: Ann Thornton <ann.thornton@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <1c3592fa-fc90-a265-5344-d83e5efe9464@nxp.com>
Date: Tue, 14 Jun 2016 16:30:32 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131104134340737552;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(87936001)(189998001)(64126003)(36756003)(77096005)(19580405001)(104016004)(6806005)(19580395003)(23746002)(54356999)(230700001)(97736004)(50986999)(4001350100001)(68736007)(110136002)(92566002)(5008740100001)(81166006)(31696002)(65806001)(65956001)(8676002)(229853001)(81156014)(50466002)(4326007)(106466001)(105606002)(2906002)(230783001)(356003)(2351001)(47776003)(31686004)(86362001)(33646002)(85426001)(83506001)(8936002)(586003)(11100500001)(8666005)(65826006)(7059030);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR0301MB1632;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD044;
	1:w2FGhKrLzeKq5I0woH5hpI3ni6iDpdxT7w7M2w3jYJheDwb9eqrq0VyLU1NbEa0FjoXELZwjnm/0f7Sex8eQXgIOV1EB69KQVUBcwnJ1SqG6aTtLtxhFTzaEpDlQcxnTc5Yq1i/pwAOM2PcYVEps3qPW/diXnqNBqB9334mkvujiW5pRuZziW3rkL5lpjqlGcj3srxhf9aSh9a1y7HWZGiXSTh2ZMqEOxgRwh0aK5J8UFEGAuBGVNXEp5Yxv57FSqHLa5TRgn8CnYOXTlFyTxy3mzxTcJDlRLJorVZRGeoZ9/uKWU1J5vVYxRPX3W0351sT5zW+tP0aF+xUQ7YRuQUN1rVNezm4aD1Y6BKC8kmbVitJajhFygLdWEPFfyXaaOKkAwy7ULhPY3w9nK0ZxPiTuTPJcDuZqz5CzUViW0TDjvZRdxiIw/lM92R+yFnu2QPNilqqPAJ3Hb82ALzQaYGAsyMcBqBpTOudED4EvRfUS8Oqbkyu0sYp2pTSGMf/TIAuag8f/xyxuleJrUq1kxcGpWQ8uORaUe9WfrRGSIUffoo6dZvJLbH/aQNMn8ic/
X-MS-Office365-Filtering-Correlation-Id: b2a96edb-675a-471b-8da7-08d3949b1e58
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB1632;
	2:zb5MfAuxZE3kywV7momM5VzYj9cHNhpxwacUwe8iWiS7yjSNmeS0eQwWstGiL7Mfq1vKZ6gkVZJa08HM7nJJhsUJ/N93lUw4rGsVNOpCry2NtsbThZiUTq/DAUXWJYSr8A1taK8zQbzzFL3RCtWGnQrVG8qnL3LJh0Vc6RYfNQ1EHT6so81e5PQSfoe+ZUJh;
	3:9MIRwKFcMgY6ni+aJdgExf4DsTcg+xw+BSkX2AaJKrjlrX2gWNjECcgZnZ34vP406u81mfEKBtAC76OSnsYytf468KqDaukEiohMf9BjFantEdOntj3GBtpn0Qp7vGMXTwJvno7kE0MGbxlZtO5aKHVhlNTNN+/4VL7bYMKC77Ptj1LmWGZwg5DNHGfNPWb/k7fD6Odvgebux+eDBPPpRfTycgkb5/dByxzye+YKxus=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN1PR0301MB1632;
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB1632;
	25:NcqgrlmtBMIIt92dfQI1LVOTreA5dVw70t4nkG30ug6gmjuriWtJlsjZPIt3bPR9MHgi/3ochRJqBVf2j0A/8Vf8Y3ue12vk9vQT6l16NHlXP87iwSPAYr7XizMPk/MrxY87noRql+QxlupkczPO2mOeP5AoYA4orQzu3W2E0re+VfW7yyG4+nO4Caqx8NUjT6nVTiOzZWfGbRfQ2RRVRc8LGfO/jcvgNYSj4je1lprqz2exUmNYON7xRy3MITPHyqz+YQNgFvR92k8f7DqxaJVzHcdwptdFh1sEprGFwO9W8txuvZMV0M3F4GCDuHy0n1YNqB11NN3giHZvfeBKAJUOwvXZFWE5QlyTsOQ0/qhcYaMXcKCOB2mv/uR4OdSJo5egWsIucsa5/dez3cXcEnS6WxodzhOUTmpRu/0VS2E/g9tulGdPIKAm0OavSjBql+/JCX/J0BNSaXtpx832O23Q1zJsM0Tf51yZooxXlDoN4mbKG/snuM09l9hh49Qgmv/8uYfhf5qCclqjsnzLIaP9K8KeGQecWO6YePEWC2rDMRPJ6JxxGXLlLDsveQtH7+90Pr0Bon7MaGrF9laJmthmQWJiRyg0ZB/mUYAIY7vLmIRHSeSd9zZgAB2Sc0i6MgEw1RDVAD+24O5ATbpfEhTEspujkcczwgmbG04O4jzD2ygFyPXyoizxN3EUFl1TDQWBgKgIgPJwdn50zoaCWX3HqZwkrYOT+zgxQKtZFPh/+g7JD9T7n15Z5opLXuDt
X-Microsoft-Antispam-PRVS: <SN1PR0301MB1632B273B4ED7511B93815B086540@SN1PR0301MB1632.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(13015025)(13018025)(13017025)(13024025)(13023025)(10201501046)(3002001)(6055026);
	SRVR:SN1PR0301MB1632; BCL:0; PCL:0; RULEID:(400006);
	SRVR:SN1PR0301MB1632; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB1632;
	4:aGudoFK3EgsYkbOZGsQmwfQt5kHynkZtJl7m38tLk2OWlnqRqA9nSkkzWYCaOCd3rP/y5ch1kCEylVBuh2GlVCJ9PbQcykmWJUTDu4cgV82ztUMtFxYs1HlLuW5xcLowgSnLLb0txzrU3MBRPoU95MqXqBULBhy7cpkZW2jt5y+ag/wH0ErCQbzmmGqaivhyPyoBBjLUIJ5XcKNfcrEbIM/5cJaOFBOngtHlgW3BnoODwnMQFxUWTgFU8ngMCQnPtj2gFUiytlYDDhrGEcPfxQt+BxQ0stq4tneKnvYxiN5NJzNBs15fy2s7Ha2JnKrr2mogpaqmEnhXPi3HqSd09L2IeHvgB8FJE+EsLmj9XJ0SHn18NucCfCESQsVv1/uBk4Nt46VvF0Fx0eZhT+hYKB7+w1MpHpy/R9+Du7si22kE5dWtEyDBbNHahYbO5iUL58sjfnle8fWAny5L4E7hH7P1KzeHP6PBUSJoSaYpLDUHeZW1tjGfwbIrg0I+MHvrnE+dTuorKuFL9UiFU9mnow==
X-Forefront-PRVS: 09730BD177
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; SN1PR0301MB1632;
	23:214Io0ie6V1tQ0DnaxOnIEV6VZPMI3Unidt?=
	=?Windows-1252?Q?S4Hi/Qv0mwnyCA2sKZ3lrHXtnaViAbmhfQPpSpvtSBZAqYJKWawEteQW?=
	=?Windows-1252?Q?suoybiVZKpXu1wPpM9I0zOJI1qPfl1/wy7AxvrpUnCMIjGwBIGFohxjr?=
	=?Windows-1252?Q?+3WgVVQe12pyi3pTGZWoHbgIPTQAV8wog6T1CF1rp/693Grw5QqagM1d?=
	=?Windows-1252?Q?TVY1FxvogP9Vu9QVhmY9VPREDOR2vDee6auxMnI0sF9C2nxl4kH6qeLZ?=
	=?Windows-1252?Q?Dgjg/ZfiRu2SbLtgbA+U4E1Z0+7LvlEU+Bu12CnM9z4SgMKXLZA0sXZU?=
	=?Windows-1252?Q?kjtG7x2dzmDYoOPHQBJC3U+OYpoj5eQHuClN2WZZ3iyFFh1n/nFRRvvh?=
	=?Windows-1252?Q?w8epRWw+HeS42lij/0ocx6iolluRTX4cHkBgu8UKpMXO8E0kQ2Sw8vd5?=
	=?Windows-1252?Q?YAI7t8nH4DtoTqSmdxYT4qUl/uZV+C9g45HGz//5+Q+mIsVaMY/4Dc0G?=
	=?Windows-1252?Q?N1KTzGPaWbhTo3A7ULa65sIjaRoPPK0O6FgZmSqGO/VHZbfd85PNWbC5?=
	=?Windows-1252?Q?/X8cVfE85co5ObFoLkCShREpaDopPWFplhcaCkRRF9WplIQHAhLNvtIs?=
	=?Windows-1252?Q?Q//8P9wcZxHc3NCICO1bfkSp2n2NFNnh7d6TtoRmNCtSdKTj2QDhX1Rb?=
	=?Windows-1252?Q?h6R+vI2WifuH12H4uaELPyLWFuVIDyR36gG9kLWmOioj/vBrYVb4pwjP?=
	=?Windows-1252?Q?TZngKyvf60/RyJ/tm/5DbUKCLgAvw1mDJY8T5cJFY1iziNxq1EUFXwpc?=
	=?Windows-1252?Q?CLmQHMB9oexc7sOpqPl1sEm2ZC0Ral6u1V5gmNYSfUB9fqEgLm43XmL0?=
	=?Windows-1252?Q?tFIDyRfBXc/oSfuGtFYIwD3T/eJkf4bWrXMdxoebIapdzgZmFROMmWlF?=
	=?Windows-1252?Q?LDwQoArQd+gQaqfVYW6Crk/et7McMCkIFBBTyVAbngaRkIxvqmNiVc5g?=
	=?Windows-1252?Q?8efSVaIZ2Aeb81k7cWGHNCzeCoZbf6vhNgdM8bISGi4miADYTHM2XVZo?=
	=?Windows-1252?Q?N7BWmIgePb03YclEjC/nqVnqIfnjNM7GVCtI5wQwZyZa/KPNhQLLm4sE?=
	=?Windows-1252?Q?XOh1Mei117oNj2sGwA80hyhEs14wVQQd3cEkgQKbTAxedWnKb/RIHodi?=
	=?Windows-1252?Q?zs+kKRwDk4IN6q7GOq9/3sfFlRpABkPv34uf6V3rN98V1u2sZc940B9v?=
	=?Windows-1252?Q?2mC66rxWPt9YfKKuGMnEjigNONy9VG2St0QW7C35ul4igh/Xrv98L67F?=
	=?Windows-1252?Q?E7HtfQpjvEG+q80GxvaIf/Htz516Lppn3YcJGH4jvCDhpClMsrM8GT4e?=
	=?Windows-1252?Q?9NkzJ6je2q+8xylh8v8d4WUjuHGaKm9yLuUaS1fAMg+7NYTCGMtugLFO?=
	=?Windows-1252?Q?fSnR0TjFDPmtn6t0zzxwk?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB1632;
	5:qHb7jR4cprq5ZQ/26icm4+zEtofQ0XvH+oWWsIpQjs38pz9A2Iyf8lJG7iCCgLKP2f//Mg6vH5buXPaE79W1rqo786bOawRqe7L6Mdjs6WN4t5Oc7d2ukbItnBjQX5qr4Y4YyzqxWTW1jgihGIMNHLB/1Rm+9CRZpwTywwYG0gI=;
	24:lyIw+TxcADOjBn2dWmvfJIlMZU5JOnYSldYulg8AxZTIQqp5uJgeMZ8czZIzpGuuvVNHb609eAYB43nDP1bOU9PjY7farNy7T7iC7ycX7iw=;
	7:NqYa0rx7gqzYkS1Df3xShxRiaLXCr8Sk/fNYb+JcWEgnz1RyAOuXtmFAIOfeC12A6DnK9n4VSK+xK2GXaifUmERkb1JAaHjLPUy4jkFfC25oo+J6qRoZ+JBToy65TkVLTNMG+TwT0jGD33OX/VcAF+JYsciJMXcAR9gcxsY5pRl5qCdMmZHjEjhDOklkNVxc4WpiFTTuv9DQ7gA4Ogw9jQ==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2016 21:30:33.6681 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR0301MB1632
Subject: [meta-qt5][PATCH] packagegroup-qt5-demos.bb: Includes some interesting Qt5 demos.
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
X-List-Received-Date: Tue, 14 Jun 2016 21:44:48 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Signed-off-by: Ann Thornton <ann.thornton@nxp.com>
---
  recipes-qt/packagegroups/packagegroup-qt5-demos.bb | 22 
++++++++++++++++++++++
  1 file changed, 22 insertions(+)
  create mode 100644 recipes-qt/packagegroups/packagegroup-qt5-demos.bb

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-demos.bb 
b/recipes-qt/packagegroups/packagegroup-qt5-demos.bb
new file mode 100644
index 0000000..436ba03
--- /dev/null
+++ b/recipes-qt/packagegroups/packagegroup-qt5-demos.bb
@@ -0,0 +1,22 @@
+# Copyright (C) 2014 Freescale Semiconductor
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "Package group for Qt5 demos"
+LICENSE = "MIT"
+
+inherit packagegroup
+
+RDEPENDS_${PN} += " \
+    qtbase-examples \
+    qtdeclarative-examples \
+    qt3d-examples \
+    qtsmarthome \
+    qt5ledscreen \
+    quitbattery \
+    qt5everywheredemo \ +    qt5nmapcarousedemo \
+    qt5nmapper \
+    cinematicexperience \
+    quitindicators \
+    qt5-demo-extrafiles \
+  "
-- 
1.9.1


