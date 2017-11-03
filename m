Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0041.outbound.protection.outlook.com [104.47.34.41])
	by mail.openembedded.org (Postfix) with ESMTP id D6681719A8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Nov 2017 04:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=I9F+IgtKH7CasXYSiSsukII+cqIe+9jRb1jTkQt3s4U=;
	b=icNTLVcA0B2fvwvyKxpbM4wBr88uVs2hpKCWnnQ67H/8R8TtG/+xux4fnaw12nbllwMlMtNrVLN8UEyeJ1lQXCvSqKT4R0Od53nkR+lXC5YDU0k5joflMRAN4dixnfFS5xDQfZghXjrthcnPFhBmFAofwrDcJYw70oSgxP2AmKU=
Received: from BN6PR02CA0106.namprd02.prod.outlook.com (10.161.158.47) by
	MWHPR02MB3391.namprd02.prod.outlook.com (10.164.192.10) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.197.13; Fri, 3 Nov 2017 04:48:28 +0000
Received: from CY1NAM02FT038.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::203) by BN6PR02CA0106.outlook.office365.com
	(2603:10b6:405:60::47) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.197.13 via
	Frontend Transport; Fri, 3 Nov 2017 04:48:27 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT038.mail.protection.outlook.com (10.152.74.217) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.178.5
	via Frontend Transport; Fri, 3 Nov 2017 04:48:27 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:35974
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1eATu6-0002b4-Rx for openembedded-devel@lists.openembedded.org;
	Thu, 02 Nov 2017 21:48:26 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1eATu6-0001vI-OW for openembedded-devel@lists.openembedded.org;
	Thu, 02 Nov 2017 21:48:26 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vA34mJaj017669; Thu, 2 Nov 2017 21:48:20 -0700
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1eATtz-0001uE-Pr; Thu, 02 Nov 2017 21:48:19 -0700
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Nov 2017 21:42:38 -0700
Message-ID: <1509684158-12893-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23434.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(376002)(346002)(2980300002)(438002)(199003)(189002)(107886003)(50466002)(33646002)(50226002)(356003)(48376002)(5003940100001)(106466001)(36386004)(189998001)(8676002)(4326008)(81156014)(19273905006)(2906002)(9786002)(81166006)(6306002)(106002)(2351001)(50986999)(72206003)(47776003)(63266004)(305945005)(316002)(6916009)(36756003)(5660300001)(478600001)(966005)(6666003)(16586007)(77096006)(8936002)(107986001)(5001870100001)(563064011);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB3391; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT038;
	1:4lZlGo5Dw1FpDOGqLfyXDluE82mecvfXIjd7YphFUc3jgrRnjmJjPKCpuqs1Z4meBzXBLahJr8b671Idnqv7OL2fyqetsxK2IsHJmGn+7GVz0DseH+vVmOQfXcSUw7TZ
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ffe67bb-04e6-4a75-042b-08d522761fc1
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603238);
	SRVR:MWHPR02MB3391; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3391;
	3:lDldFQuOg/10mWUpm2NL+PtRVEvUlh0kRscqfV2Vtz5oa9n+c1DGriRiKXZEWiq1ZfXWbOcs47V97hyWnlM2VeExeFhI8QGbs5YnEBPVjCxLF1GzsHUFsAE9B+OlTa1m4XjB3gUzzAMRSr85040KdVW+TeB6xwDSL6UccPzItL1brRgMO64VkvAg2D1xAjpSYbfRqX/lNswsmSZ21mwdMb+3l+dw/IZ5xL99XhJYjQgFmn26Z5+6euwXJrFnI2/Yz2xycECJNx6W1HWoUtY6JCAm27zkoz9CFqKkscRzUPesrYe6E4RRaxh4iOukIwupxQsYaRDSqiQ9Fcb7x8Oaa5Y/sBUbZMOt0J+fSO43sTc=;
	25:scAy8tGZ0r/7X2f/FyyEAR3NnFX5PDcgi5mV5P8cfbwvKZ5dM8VgissEYaIRc/tWoUcrPvFLBsxAc443XfqFZNrbdbHTXivcnhIKSP5ltdqgSdLLdh25BM7eWgL4HHJQVUxZH36U5HmloT91ozVFfoa/9bpQQDjWgHrFXXdAxFdvEAnEfVe3fQVOgH4b9SQPaxmKmjVuN4eB+QNgA29+WVP1iizAj+l8Cx8EwQiOL63VuEsC2/5AU+LcVfwUyEpY33Fb6AjchO494wtQUiPZ7dD7eUNsuyXT0H6lUxsC4NfN1j3z56Dm6eyDEUlh09a+HJkg99WvOO3RXZjuB/aD3w==
X-MS-TrafficTypeDiagnostic: MWHPR02MB3391:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3391;
	31:mIxGJZ7RkQGD9DaIPbDlMnpXgeDbhquHbuRfz8t68gCPXRhwjXk134E0a4FAamgUsurQ70FOZkyvx2iphdPEpfzBXa0YIgTTwDdFO+nnhL3/r2QsxZPXc7UJfbtUIdPKsrJSIKT43/y0OLoQNdMvyaMWB0woaaJrKp246QgokSh24rq3Ps4n1xDKGN544VVRb2vvIYxvoypPksTGZw/atTscX33uxEsYqNYKS8xBBMo=;
	20:7IuxuC2boEbxRFFRY3k2UdJS2nxydJeoczCsJtbwcFBJZ2gdRi04DuwINZQrikHwtezM5rL8HyocWH4ZYBzVkV//pOTrABjPfT07GTPYBoxhaKp382LxwEQPDaelCUE1abmd80n3PJOw+KMCfmGDuiJrF0AQ+72Blvu6TNbp5/sZSTfu7vpNM8AaD0Vvv6aZDYgFhMD8laqHEZXXdeEXfy/nqNzxCP9K0T0pq9cjzXx/EMDTql79YAK7YNvOU12qoR/Hh4MaWHVb53zqQR/IgOKy/2SW/2yDkIlhjN/Pnkov91lngX6V0fkvAeq2G4RNCEZT5LDOIIt77MCykJJC487vwO/XrX4CVgs8RpNo/gTl2/cFVSgqgarfYAIa1FgP/ip9OztwvufyyHvfPMrSjKm2ZtkYr96YTzJ1TUn1/CPegHWXkoX776C0A0NNDp8/EYiwjAa1on7twEPIjgywgrTHKUiXRjRjUDXvKrM+m7cBPE5VEolZRa4y19+ybCcV
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <MWHPR02MB3391E39E872E8B9DCC20374BB95D0@MWHPR02MB3391.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(3231021)(3002001)(10201501046)(100000703101)(100105400095)(93006095)(93004095)(6055026)(6041248)(20161123564025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123562025)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR02MB3391; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR02MB3391; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3391;
	4:m5TgdtZraz8bIUM9Yc34j5dbARMWpY4CEdMQW3Mz7wNMOPKwyjpDUYZXWHVRhS2V77R9DpxjTK3cOeWPzuyO3+Xvezm0clNc1aqSKGlc6O4EhgVKn0PqrBDE6ixg3afy0c5GljkVvFla5Mj6pCiv90Czvkx2tXtsMKN8tfyPXb9mUFhHUi+4WidSyFJMbgKCv/lYyMbKjhGjYCP74olIa5uCCwd1kxBacrmYod66JzLRAvBMamddgpkx4JDFNbUPH65TEclHFVREe2k7B/bTfH2bhb34HoytqX32L4cZhynv7caYmCpCFJlZlV7xArOY
X-Forefront-PRVS: 0480A51D4A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR02MB3391;
	23:N9bVv7kjeSa/D62yxrtKAvn2Si0lUdXl1QbQJF0pp?=
	=?us-ascii?Q?QJc5oFY+VxR3zLSHA4hPVUElyZ/Z2/iYsXlwYMLlucH0E7H/SmaIg47eTss7?=
	=?us-ascii?Q?E0HeL+Uj5P5UMsQOx557pmzTDQ5aZpbBYqSY/KAsTd0ZNXCS42RS4U3ikJry?=
	=?us-ascii?Q?LmzpTgtjSOUL9QS/Xa/L+GhCgOZctfc9NEsg9D+j7cErtlgrzAaj98Yd9qWY?=
	=?us-ascii?Q?qpkEzbRyohCCP3nm1SPGEEgjdCi69dQaNm8EZp55LBiiLjDhNqmQMa3nlWAj?=
	=?us-ascii?Q?+Tn0yjufazV1fQ4D3Ewou4Lrw0rMNP26PL3ImQjDIAvX3PeGtVA8exsVkz8w?=
	=?us-ascii?Q?eU4tFpjJPU0+QGBVWo3o42N2+vuv2oicOQNGQlBAiqLTZAs2wtJTYB8KrcZE?=
	=?us-ascii?Q?mMcmhSweWDOg5sL+RGf8+zVUmyluFmaff1xIiXpIZOvs0ajqg5hJoZKKWJYp?=
	=?us-ascii?Q?Nw6fWGKvFrrAtijJVWsyr0PLIoZuDT75NLeVF0mlcknKa5Hko0FBUS9XXjr2?=
	=?us-ascii?Q?woorAOz1cdqJwYbRgm1ugaP1YHAbGYOROuJD29yFqQ0/bicSYKS+S2r+EeQb?=
	=?us-ascii?Q?GDdwWRYWGIS96IcyP9a9qs8rklOZIIBLX0pAht3lHhNzth1H4FJnigTRfZm+?=
	=?us-ascii?Q?cSH/xDx/C8yXhbiWecTzRZ7cuUjBE3eUy59wQZi5GpXCsg4NfoZGErBdBjZs?=
	=?us-ascii?Q?GBZq2PDxLG44B8oTUMLybw3U83eFmIe3HyEcQV9qVXXzTlH78g9h3sE4oOn0?=
	=?us-ascii?Q?6pwgd1Fikr2/wubK/n9fw8U2XtmE/Y1DhKcs1P6nz5mOrIyxHfUT/AK32fdb?=
	=?us-ascii?Q?tkgewlMSmr1GqSRPoM4BJXt3YhDR2eg9iN8xg9Z8qFtJiI1PcSNtd6LdV+os?=
	=?us-ascii?Q?6HcMcP4Pv5nIdkd4tzIMcbe0B595CwIjuN/xD+EbsWIoegWNGVCrduD2Ls9E?=
	=?us-ascii?Q?Cu7rgY2eu8r4ESYYLqtCR7pZujgwux66+rHsAkcgmpDARo+IS/ZwKSMEFfNq?=
	=?us-ascii?Q?9KMT0hq+v6SwFoj92W86Iu/96o/iaklY6aAl1QwZ5R5xFJ9AJyUYRNmEsqnN?=
	=?us-ascii?Q?tJgoSoN5b75wfoEzoya7YXYUUoCuTRnsSDwPSIRwn9Oj7S+CA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3391;
	6:TH/pXdHHM9KgWiWWHx9GpgJEy+166kx1rAE5iFwvDogT8uIsSaUXZrhFSKrLYnlEqAWk/jevKH0Rj19YUxR7SQonu9df/rBqUhIbnVaAgJ7krOoCeax937MYlYKuXwpZSgXJ+A3/kUCkL3dF0FSY9WABTCO1sUmz/wPclOWAYuo3hR5G2w5cbWKTLv4yvlTkPaQdA/cECkCn7AqQFJM7RiO3pPRNWHmCtZ6WKAgirhmHrIyBsuGi0Avyei2iB2dRatJVm9EaeBSu8cjBA63BXqbrS6dgKzL0bFccAT308i1c0GeWjyBhCwYodZm4FLk4skx9f2nowLFmt8Ag73L4rIn0JGt3xLNdH2lfuGfoZXU=;
	5:PhINuVAZjTD15CgLFZuLrQGil64MuJm7SE/YLv9dinPxn2p19/yMs4MDz/HjQwFOx4mBnA0VeHkED0mnOqH0w/r01WmISnWl8lN/1VahXa2fUZhYDtKiLLAxTyd2GSDRNRrH1iFtlq6EXnYekKduu64ad7PTF16wFcUFGyuHcK0=;
	24:btvxMw6r8tyuRerM/iQpiIu4j68dNFT9aaBg3pZ0ZYBeWNDuF/p+e4+RJRDyZyt2ONyyPkShzAmNKI8A8HXUH5H07aCyqk+gBvlX/kPeock=;
	7:6o6X84CNK3a6qXVvHkqHSkIelJtExlZHurAJRn9i+LuIx5Nobd5eAXOLkkEWihRJQCsjpyXnJXVJ81oB7fh+aMa0SuwS2PdjLoNP+jZ3pVLishaBYucoaKRO8N/nm5ApYZn7QpIU0jzNlWCK+fgMQGyLpB8S/pT2vf+CPKGS48sDw95n0K0qILj6P+Tc9P99Fr3o7gdiR5QhWSg8u36PEKRz8Bm9fTeqihzbnSBJyy34nGFvIJIyQxZFS4eX3pSz
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2017 04:48:27.5615 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ffe67bb-04e6-4a75-042b-08d522761fc1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3391
Subject: [meta-oe][PATCH v4] whetstone_1.2.bb: Add whetstone benchmark
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
X-List-Received-Date: Fri, 03 Nov 2017 04:48:31 -0000
Content-Type: text/plain

The Whetstone benchmark is a synthetic benchmark for evaluating the
performance of computers.

https://en.wikipedia.org/wiki/Whetstone_(benchmark)

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb

diff --git a/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb b/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
new file mode 100644
index 0000000..8fad04e
--- /dev/null
+++ b/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Whetstone benchmark is a synthetic benchmark for evaluating the performance of computers"
+SUMMARY = "CPU benchmark to measure floating point performance"
+
+LICENSE = "PD"
+LIC_FILES_CHKSUM ="file://${WORKDIR}/whetstone.c;beginline=1;endline=52;md5=c795edc15e7e1d92ca8f88ad718449f5"
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


