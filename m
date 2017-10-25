Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 11475 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 25 Oct 2017 18:54:39 UTC
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0075.outbound.protection.outlook.com [104.47.36.75])
	by mail.openembedded.org (Postfix) with ESMTP id 0708871D9F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 18:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=tZMi50ki0cnFoLCVyGTwof9dHTDlP2dITz0kyyuFjpg=;
	b=fJrgBaU0OwD970p9m6TU4AVdlYXwldiGJdDiSg41PcL2dmF+VUdZw7hHhRSk6ZcBXhRpRQGAoweXpM/jQ+9Ip5+d+IVSJxaF4zvB88xg6jShL087PjSYgaqE+OSTjl29NiLUcExqlZWJn3X+3D8LKL6A6hpWpjETAqJUjptHr8A=
Received: from MWHPR0201CA0001.namprd02.prod.outlook.com (10.167.160.142) by
	BN6PR02MB3379.namprd02.prod.outlook.com (10.161.153.10) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.156.4; Wed, 25 Oct 2017 18:54:40 +0000
Received: from BL2NAM02FT019.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::202) by MWHPR0201CA0001.outlook.office365.com
	(2603:10b6:301:74::14) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.178.6 via
	Frontend Transport; Wed, 25 Oct 2017 18:54:39 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT019.mail.protection.outlook.com (10.152.77.166) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.156.4
	via Frontend Transport; Wed, 25 Oct 2017 18:54:39 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:42824
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1e7Qp4-0002zf-FI for openembedded-devel@lists.openembedded.org;
	Wed, 25 Oct 2017 11:54:38 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1e7Qp4-0006It-Al for openembedded-devel@lists.openembedded.org;
	Wed, 25 Oct 2017 11:54:38 -0700
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1e7Qp2-0006Ip-Tw; Wed, 25 Oct 2017 11:54:36 -0700
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Oct 2017 11:49:06 -0700
Message-ID: <1508957346-6324-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23416.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(39860400002)(346002)(2980300002)(438002)(189002)(199003)(50986999)(106002)(50226002)(2351001)(189998001)(107886003)(36386004)(316002)(50466002)(63266004)(16586007)(48376002)(106466001)(6916009)(47776003)(33646002)(77096006)(9786002)(478600001)(72206003)(966005)(8936002)(305945005)(81156014)(6306002)(8676002)(19273905006)(5660300001)(6666003)(81166006)(356003)(4326008)(2906002)(36756003)(5003940100001)(107986001)(5001870100001)(563064011);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB3379; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT019;
	1:DijJIHTq3QGjhJhiGBvr6BqM6C+2BRkVF/cc1BAi5zoaBG8k5wogfOduz3ZJ8AgpJGz9AqYSKXEPXrERYmzPJkN5OiW2J5GLfwfEdYdxhRNge9O/2sybmgomyYLbMwZh
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3cb8a791-4734-4e84-41fc-08d51bd9d87c
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627075)(201703031133081)(201702281549075)(2017052603199);
	SRVR:BN6PR02MB3379; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3379;
	3:9jlOPX0vh81z9NFnytC1aDESN3t0FnS5FizAsBfCRwq1yrwrzQZcnMTPHs7rsoHQWHWdspN5WZROF4AyMMy4M71dCWved6GKo570szxwYnOaf2FVKUs/Z2jgyG21u0DRonw2g5gWrzdzMU6/U5lr98uvzsHaedclA6QwwiztIgggW1TABJVSFU7YKPpuIPFRbm+hIeAy/wzTyfQeTtnhL/bM/KLBYR5ZZOrRw2MIT/oCfgUytO/dx4pKEvML6hFRt9LhYkyStNw5gEhaHPi3uAiwbWd4+XyDGkwe9fhjagq01LP9cO5wWySmG03avFCZsQeasqnRp0oNADIUqEwKWEpR3LbrnnZAHbFVNN7f7Nk=;
	25:IZFHmGmRxycOVjgCE4nXYy7Tki/tfkG++RYZWXmzVpRcghqGBoyXtsnpx0mbZ2SksjMGQRQ30xNQasjkPVJJ80epvkAP2zLNIhTDp82XoEoiUT+O/IHOHnPmNYtcyx1d8Z7HzHTrd92gcXiYzeh0N38X2L9/QMkIulam4piqKLlaEMRZW4srOvUbVptF5U85Hxosg0E+383iz9AmqIrE5/7jCuVUW2+40IDYh9vnpQFCP1C8pHeeVMl+1DoRqAN1cRrNIcnJ1Y0MWwJNcQ3Fjxq3Tc/SMQh/Gc6x84n40cOyHR80laGuFkaxu66yzlm5rHxZgvUu/VG68LnYbbwG/w==
X-MS-TrafficTypeDiagnostic: BN6PR02MB3379:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3379;
	31:LUUvmd2rqMIgsJyWytKlj4ADjEZ8BR9cPBgWGfg1KC+sNAHD6j9vxNN6JzqQOec/dvJ0TGkZr1Vs5UObFek23m3InnDaAaTkJks4BM+lRliSOiuzVkFN4AZ1/oivFYyNu1487tF5KNWHucn3dwbZSnkjyl/MVbOCoXOkE499/GD2GEvQnrjHXNqudZYu+U5SKWSb4lMQC77PpKfooLZmdh5o5RzwltQhsDdRO8AfmOA=;
	20:DZNVzUXBqf6Dim7z5Tk4owP3nRnzQgusSllXeKo4CawURU36S1J5nYYNG9F4n/lVwbgfGeUrwpvpSwlboeZXHwal9hUyW0f1UHpCMiiVotSBEgaFMMG0JvXf+rAxbt7zJeo4rHn5bIGwPN+y357jkcAaPuZ+UEhn3bVZyEkUCbGnpHCWSsKFW1K22/EGecm2Jt3Zrm8VpW3z7YFA+67eiBm45kEzcFkHBHK3iaOE1YHTMp+P+3cvk7rG3upu9iKngowv8gvr+EH9GJS9/5e7SA9XcD2GTE3cJLDVA51mWUXGEg5Y3MwOgRZ9kbx/7ZUJfQLipywnTq315XOS0g9lBdEkWbHcih61MXLwRxf7USg2Kq2IDRKTJ2c83yRRFOsG+U7iyJPm5cVF8Px9YLb+0X1bjuwJSa4GVHaVS4sH1lFbOMrbRpL4v/JcPaOTK8f0yzlxVR0VtD1o0VHDzEkycEvjT5plezH4F3wTiy2Dm2qs1ve91bwUuqaw9cNOQ9zD
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <BN6PR02MB3379FF548E47E2FE61D7FA03B9440@BN6PR02MB3379.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93004095)(100000703101)(100105400095)(10201501046)(3231020)(3002001)(6055026)(6041248)(20161123562025)(20161123564025)(20161123555025)(20161123558100)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR02MB3379; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR02MB3379; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3379;
	4:HCez0JFttkzONkdcybCOuOUQQHcVlI/M2FtW850d8Vv3E+uk66X8gsQ1pz2aPebSCQwkmdC2aAIRXM2QMy16JEhWaUEd8uDQX15l/N+hjv6ygk3kDRzreJTdYYUbvOO+UyxJIS7HVeniXhgWphruiyDAK0eoCP5VAILTCD5ml1iJCb5zM2K9qryH+hKKIo9mOU4Vm7ic1DLNsDoB4TBQko8KtDV4erAYTFidNPTDZ22QeuAepIUhscT3H/dRmK2QPbcJnaRIhrFvslZsurnlEfwnty4ykNCIlOgs4mMEAB0=
X-Forefront-PRVS: 0471B73328
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR02MB3379;
	23:zEW9MWqkhu5AE2vcN0LKW9pC3+pqLY3pRtF2JY4PF?=
	=?us-ascii?Q?FREbKBn0OCUonUx4VLTkGXKrIy2RcMy+ARsJauQ4k0D2BFTOSBECaPDHqf6E?=
	=?us-ascii?Q?P15twpY8YQLnHGq4tZFd0Y1LzvLRalGupggC8JPy8Npuxx6oW2cZog4p61yU?=
	=?us-ascii?Q?bzDuQPN+wbmqzoT72MmzuV9jHaS68+Y0l/GRBzFBVfAkUCxny1R75a20/x+S?=
	=?us-ascii?Q?LmbHAntAd7XqGkMPHpVsYv8ZiZYKTsdEP/JJguxC1Idys9mUTG9EUDiqp7wT?=
	=?us-ascii?Q?NHGPLbpzXzyBcapzyeAJ68wMe6WYTjzUPl0+giRN5/U+AEQIqb4H+NSgFJW7?=
	=?us-ascii?Q?sdqGm9cAfIhUH6VWHlEbTth9eqai+h8Qrbg+96ie+2jvRdDbJh2nMHy7ra0D?=
	=?us-ascii?Q?yH4947sypxrLuS4X9XmjqVT+/Ji3ppeCCRL1EoeWH7MwxOLaxNCvz3I5Z3MB?=
	=?us-ascii?Q?8pewVsc21O4MAjA5y3vopLGTAZwLpPuWg43raEmHSR8n4ZnpabJUfimwKuHU?=
	=?us-ascii?Q?nH3SmXgr7WnbouesELPpd1JD3xJCORm++tnuY3E/fYp8dCZx0vWKOzfFPUeF?=
	=?us-ascii?Q?E2dzQ/OxNoCjTCsJ00iKAZ5+NCuUb6EoiglLYRGDI8UwWTHvC5wBAQe22xyl?=
	=?us-ascii?Q?5iToY8rVvRSyBY4E33f9dbvuJXZJph/BAqgEqye1XJarLN/Qkm8DOROqBxdi?=
	=?us-ascii?Q?NWIGR1EPCc9LQKf9gx/qYKOeXQVKejki6ul4tEpbLvq9vaouoqaJ9BKS8s3q?=
	=?us-ascii?Q?F7mM2oLsV4bo0gVsmWhedGcslaOwcDUpqWOryHl3dPyrgN8PFiiYT1GQ+OfC?=
	=?us-ascii?Q?grdj5mrNj1/EhqpsZySOuNbjDebY/av8+tIVKRUDDe8prM8EDmA/0eVLOenm?=
	=?us-ascii?Q?LPk7xbaZsIV0VC+euucILJjz9bhzHYUbeSVZPisxwYj05ZXCsXRvXyHJeS93?=
	=?us-ascii?Q?ETVp92/jt9Fqmm/8F9XJGrO+5ueRAbzQyk7ac/1PUQ657KCzY/doWmfiJeJm?=
	=?us-ascii?Q?t9FmpK2ScQ74pPmq7xaWh90zuRUiKMREwZKvQvlLAEFMGieMzgLccIgAkIeE?=
	=?us-ascii?Q?VdDpoSVZmiMgW/MsYIhZuTKmv0B2WBhrBgQCwyPVMYa5B59BQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3379;
	6:FrY5Ft9w8oT1klFddpOuDTnakj3zRN3JE7mK4ntVHhOi+nBlWxtDXm0pCg8ex4R8uRmOhzUqMR1RD+QMljJ9gxg00C/HF8j6TiRKcJeSl2ME+j4Gb6NytKtof7z7+PxJK/8jQLx/FlG7ENZNcUWC2LpgOV7BH4V4UJefwXDSfaZGJnd5duaAzeo9qM9rTVFltd0kT5ijhQsDdPIs6mQGrE+cgLr5VJVH5uizSFR5bjIOOG28oVwSsn8rWe78fndsWN3kyegP3PL8J7UGY8vL5aCc7++KfOsZrLtsxVGrQrqzd6I38DvZCLfLCVfuw2ef0bv8kilWkQSAGHf6gylr/A==;
	5:Ybu8NvzLh4hphMSkDjccNgqmG3iOzXJWam39O423uwvY1djfuhsZf8QL0Y7l+0OGGySaGvhply6uNEYzlOxQD14oyHDk5Xp697Sm3KekI9rScT2EPkBOCR85USk2OrWUayLLReapJfz52Nl7HICzMQ==;
	24:hpeILuK6E9LSLxD47pBfnNwc54jmQE5c/ocFRiYsilGEODJNNj/2I0mcYwtGrd4DWDO7tdQu6tVvVV0fTja3QvZNXCHTyRTdDQx22Vw2ciQ=;
	7:CYLa4TqyKe2+KTYpMq9zYDs8Sh/IILZNPqsbvgyvtp8PtaCX+tlBYl3UpBOoTqwfm9VM5syrXiTg0y97Czr+MJmi4KN54j4KQisZXLl97NIf15gkn5dN8YxaLm07n5M8B2ebooh7z0Q9PG10CC8EfzX6SgUAtyKBjA6oWLObW8hRFMQWnmvwNBf71GDBuGOxG9L1UQFOc9pIuIxSlZliOVrPpetyKtfk5kSHoqxMeeI=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2017 18:54:39.4793 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb8a791-4734-4e84-41fc-08d51bd9d87c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3379
Subject: [meta-oe][PATCH v2] whetstone_1.2.bb: Add whetstone benchmark
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
X-List-Received-Date: Wed, 25 Oct 2017 18:54:40 -0000
Content-Type: text/plain

The Whetstone benchmark is a synthetic benchmark for evaluating the
performance of computers.

https://en.wikipedia.org/wiki/Whetstone_(benchmark)

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb

diff --git a/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb b/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
new file mode 100644
index 0000000..e9318eb
--- /dev/null
+++ b/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "CPU benchmark to measure floating point performance"
+LICENSE = "PD"
+LIC_FILES_CHKSUM ="file://${COMMON_LICENSE_DIR}/PD;md5=b3597d12946881e13cb3b548d1173851"
+
+SRC_URI = "http://www.netlib.org/benchmark/whetstone.c"
+SRC_URI[md5sum] = "d8eb2cd7104bb5a12d614ac6d3f1f9fb"
+SRC_URI[sha256sum] = "333e4ceca042c146f63eec605573d16ae8b07166cbc44a17bec1ea97c6f1efbf"
+
+S = "${WORKDIR}"
+
+do_compile () {
+	${CC} ${CFLAGS} ${LDFLAGS} -Ofast -o whetstone whetstone.c -lm
+}
+
+do_install () {
+	install -Dm 0755 whetstone ${D}${bindir}/whetstone
+}
+
-- 
2.7.4


