Return-Path: <mubin.usman.sayyed@xilinx.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0084.outbound.protection.outlook.com [104.47.34.84])
	by mail.openembedded.org (Postfix) with ESMTP id 2A87760053
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Aug 2016 13:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=i0OiH3SesfEeYuJYHlO273L1100AXOaLSA3BfQFaBx8=;
	b=qzh4LhLm7SwrfZo+oPaqsKP+WOC+idwN/HdCQbG/xj6cp0J9DosrF7TqAdCrxiMoiMb58SDeUD0JnAETdcOqbGUJQ2w2hRF/OqZJfxNl2N+irYCf/NFWhGC31zj2zAXrYyZvZ8m7Qls4Bh9D2m/FO0J4RolXI3ifoc9lgw0JsbU=
Received: from BY2PR02CA0049.namprd02.prod.outlook.com (10.141.216.39) by
	BN1PR02MB085.namprd02.prod.outlook.com (10.255.204.13) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
	15.1.587.13; Tue, 23 Aug 2016 13:02:50 +0000
Received: from CY1NAM02FT031.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::209) by BY2PR02CA0049.outlook.office365.com
	(2a01:111:e400:2c40::39) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id 15.1.587.9 via
	Frontend Transport; Tue, 23 Aug 2016 13:02:49 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT031.mail.protection.outlook.com (10.152.75.180) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.587.6
	via Frontend Transport; Tue, 23 Aug 2016 13:02:49 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:55896
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <mubin.usman.sayyed@xilinx.com>) id 1bcBLu-0002Ui-7D
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Aug 2016 06:02:50 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <mubin.usman.sayyed@xilinx.com>) id 1bcBLn-0005RA-AA
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Aug 2016 06:02:43 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u7ND2XAD030276; Tue, 23 Aug 2016 06:02:33 -0700
Received: from [172.23.146.171] (helo=xhdl3763.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <mubinusm@xilinx.com>)
	id 1bcBLc-0005O9-NN; Tue, 23 Aug 2016 06:02:32 -0700
Received: by xhdl3763.xilinx.com (Postfix, from userid 44329)
	id B4F492CE077D; Tue, 23 Aug 2016 18:32:31 +0530 (IST)
From: Mubin Sayyed <mubin.usman.sayyed@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 23 Aug 2016 18:32:19 +0530
Message-ID: <1471957341-26005-2-git-send-email-mubinusm@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1471957341-26005-1-git-send-email-mubinusm@xilinx.com>
References: <1471957341-26005-1-git-send-email-mubinusm@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22530.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(199003)(189002)(36386004)(106466001)(63266004)(5003940100001)(46386002)(47776003)(229853001)(305945005)(103686003)(19273905006)(92566002)(356003)(7846002)(450100001)(2351001)(107886002)(110136002)(50226002)(8936002)(36756003)(33646002)(4326007)(19580405001)(11100500001)(50466002)(2950100001)(2906002)(189998001)(48376002)(19580395003)(90966002)(87936001)(626004)(76176999)(45336002)(50986999)(42186005)(8676002)(4001430100002)(586003)(86362001)(15975445007)(52956003)(5660300001)(81156014)(81166006)(107986001)(5001870100001)(563064011);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1PR02MB085; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT031;
	1:Ye5WnYS5DCHcZ0V+0ObFcPerG71ou0nz0f+lgjrB5V/Yb02efwD3bwGedi+ADSUM2+iC9YYotV3IJDGFKCgTm026LhCQCQv58bmhFFOjPWoR5FHHRZqc7PfDCte9F2xsqY3OT043c6QkkbSQcijnTG492RqPttlgGpCXK5YGZeDD3pqX9fPOyNzytRhSUsFnyNteLa1PazSnikSRBMr/LO/Qhd+pdr2pD6z/LvtZmyXLos6PFZ3PLmIxFf+rfyWLT4FU+JdlhhSYzDXpdRAylc6W2qI4nJbufieL8c5jqTWFBgLV/Z8dlaIm67opBVWEVPP7IzvSVHbEc6Fv+Jvum/eqMR3R6F+MLZU6V+EabytN2ERzV4ztUXh6ck5etItkjyjZ7PZOfDNHRrJV8dw0BpuhYO203gpsuNbpeDNgM8VqxFBiAzu9Zwn1tHM5L4u5rVqHaJhYc8hLuSzGl/Kdde8iYv4bBlwWbPIhPDWd/QuQ7O+qkEw2iPiE+8vkJ0founVonVvhTBxE+r3IQ+s2NlIqTbV6yr16Igp2Y4NwwgUrQe8CmNXgDyIv9SMKSVks
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 6666b9fe-a62f-4f26-ce91-08d3cb55c92e
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB085;
	2:g9LSUn/RdKbEIYYpT3jJYnmLwQqyCEdJTP4zwJ0KfHZvjI7PAIwy/8jpkMOzphEyuIj8GjFl7nJV5L6/27b9p2Vl5ReFrfXhegHOWTNPvjvLbB5EGlugiPwdrK6fR6OjsFlVpzc9+oa6Ls+FgGXCds+o+Rk1vTHWKBo+u5MU8vztkkv4oAavQKJNugScCb+L;
	3:EBSEQEDiBpIC723iZx8xFsAIIH++ZNGMt2yiMxOgxb6BXsL+efzuGIMuC0bN5tqDvRszq87hl1DASGhz3q7K6lwMWN7fP804cHBhZfNHYAsf9McSleIeR7vzsDAtBgJpoUrkqjeFpaXaQOkEA9vHTdcu4T6E5wgo/4exaEa3DauLlcuDE9VhPPtRRpnr0WzWaTNUocRPZ0TpZyh9qq7Lv0WG2PzClKFXopKSOOIPwAtRJVmJAZBtm5rhEZzI1ah66uVpUlMYUIRLicHepGr4Mw==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:BN1PR02MB085; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB085;
	25:9k3LH9OnsdDH+JDJsIM8fyhr3Fy20OMpVLECu2jk3BrQsJTM+5gA4O6OoJVjmYI4qNGhqLZhpBNB+h9m2X+ZtjkHmRMOccPfD/1rzvI8NQKQ03WsmjlFQHY1oxIEayazrIq8fZjpbYXBz/ic0+zv7R6SsD1YNHx6bZ29iLB088iR96T47SxPdHzbPiaxayliC1MhjGKSVgjKVnztGwrLjxO+XUm+uctiOKBsOZE1PrJ3enHM3ZXTyzCWDPmkuMnSUWW9iHaZ/u0BqeNCKE0TuaGJubTFZRpenNo+XSGca0LtqlGmU7QNIz4eJ26+0ofuFtQ9rQiUvMMeYWNhI6Lg6r2AT1WJSiat/Vg5ERhbe0TQ//luCQ3n4jugHFP/9WOR9lYKQANsDOsTscBSNAyMF4U6Ug6CkYvHa8bKgRRsuTzvrMSxINCCUD0vllDWGGbsxa4A+39UNwFyN0YWZMLhzerUdfCdxxN5F7ily3Rat2pe2R2laeN5S25bT5x7sscGW6bWB4ciEpZoj/uDJh0kxomnH3NjkXOJWvENrfQoBRL4YyZ52arrC/Fl809Qvp3nm0BjYcWZje8mz2phhRKrRXUXrUouIXmNXqe4v15RfT6plvRNKWx0bjunyA4K0fXgskl2HcKBDDNfMYgZAnDOXm0HhHn8Ge7teNPGSwoSw38nd5PpzFW3lyCq6xca9hI6KyCFeDoq2ykhRu6Uz5QZbbdMbAttDOKCFLLSwTUvIaawe4db5ljsJYPQdhKcj86XhTEVtgPpCrE+OEUWERGDQQpmHBhCXJZ8/krvAhIOLHLQojvr2VWjAAjBRALKbC/PpL+QwGONTyGoF3PFRObc/OLg/T6WdTMkOrNKkmPRe4/0DE8oeMoDoVVIIz6kLTDLxhZlEwwa3PIbC6yePeqzhw==
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB085;
	31:gdi8VyPm+vl5Ps/7CTdpZ3jEXXY4K10yW8ZTTv49Y/OpL7f6zw7xC97i2uW8lpaHE0ilfsLNepMwRhjzbACY5vKat9LN3ePOeVc9kUtFUeP5pcyYWnZio+XSCut0G+JB1yeAYxeG3lwMAnNEGr3XLqfxOYjg6PBsLe//1iNSwp0BnRmE2TQf9ojBL0gV4n5oX+IyqmrAxeL+OJmnp6DyuGQptBRrPXc9fzAVBv6Kc88=;
	20:KlWY2BDp52VFJu5oGcjkxu8L8xONzRQ6mHskoyxJrV5yTLR4e6+afOEBWgr4o0HR7PyQiwn9pCwD8Pls8k/2mvncoHjuUQikQO2UsoFKZLBmhVvl8JawhnNDZYIdzgYumjreVuRxqM71jV1z5g0zrhwCLTkbY88Y2cn1fMRsZ75k8hx/2y6qNplUb8Y2CXahd946T1QkZ/uK2GZoFVUquCkV0M69JTZB0tH3uuLYQ/oA41QIWgqrZeVKGOBTcTwyu8Q18Vn/IwH09WhohMVMS/qodtVBJwLJ41WmJBw//HzpoHWMhXIVx49FVC8q0ZrOyvtoz9QkzWDzLEzdVgKNVCgiYU6g6MVygIYA9RniZV/GKVUj3/dv91VOvgTAxnIQqMlwkjJW3mF/1sEVxxbheCa4OOvhZiCf9ah5S04NRCgG+u/xoqXSiwMSURWNCvX5dpU7dwsa7dJ34w3N4IY2EuKsqvXjeaYNp63u8nGtFejspj+g2PKJz8BHWGOBtgpi
X-Microsoft-Antispam-PRVS: <BN1PR02MB085C0D6D885B876FC4B4D18BDEB0@BN1PR02MB085.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13015025)(13017025)(13023025)(13024025)(13018025)(5005006)(8121501046)(3002001)(10201501046)(6055026);
	SRVR:BN1PR02MB085; BCL:0; PCL:0; RULEID:; SRVR:BN1PR02MB085; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB085;
	4:ohPPyNFcGS2cjLKgpmq0lSo/pQSHnhTgD15YrDDHLn6OHVV3lxl37gv9M9/zL+wX51iY3wpKHSWYfr+/vt/okc26smQQMGxkFv6rKvXC42IUxOHTEDEclK8yFblHVUVA6JUOym3cG0PdC9VENM+O+tma/tDwiA/IKdMW7479S8foy2tGXy/ntxWCrLqtylzvpGzq2Gumxdd5mJ/CmdN0wD+6vAw8CzK+7bNGym1mI8CXrYRujjCPq5H9SaNg8XO2wr+rXkAXnqs7QXOlp9necvbvZWKF/ufQhz8lL9JVYlVB7aNK+2HNaTikCZdTEbmJJrqdS7LqfHWj2pkTQq02MLng97Wadh9+anPnsJhN5+uOISLNN2lvNyxeYJkCieg66ommRJG/CY44uhiRtnsnOK/nYEmPSZ1M4/mVbHGGPJcoIY1UG4g6q5YAz3QX5HkavPJBYsdbMI82zt9o95Yik85gaWFI7ZZw2E7NzeC0WnS7Ks/q+xR4vqFA4zPxToTRsP3R9JaJEUAJMcrd+/jFMsN5Xkvzkj+JKAbSulCSrSk=
X-Forefront-PRVS: 004395A01C
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN1PR02MB085;
	23:CTy0tYapM/HM+7mWAlVDjKL+3J6jYDRf8gtqdMAosE?=
	=?us-ascii?Q?G4UGMtBOb8H2UjoJ5J8frXHHg+zvIguPqJYPP9A2Yyqk2+ansXa3daYFAPPU?=
	=?us-ascii?Q?9J/xAEufEJPY/U2hMvtqvvsiJj0eh1H+4S02vbzNDoPb7TSUtpeS04Kr9BpX?=
	=?us-ascii?Q?tk3bs+GQAL5d3kkv/UPifXdv2wnjIQm0pFoUdgJiOihNUa74BH2bJtfFh7Cu?=
	=?us-ascii?Q?VxQI8SSWKmWibMiWdp4gDXqTkBm9N9gOFKxk5Gt4z98tiB7MyygMk0c2OSLl?=
	=?us-ascii?Q?2h0vOQjzngA+r+3KxcJfvtW1Ua58Yz2rOSAPmwbUGoOTGT1YaQjXLFi3Mle8?=
	=?us-ascii?Q?6QoYhSSBMo/M+JuzmWgPb8S3Aly+OAIRYs2xmwIqSLkUJ6flfxJYhG2uwceA?=
	=?us-ascii?Q?R7eenSKQ65KxL2mvd91T5iQ4YAXMILD+wueEjQk/Hk7ktRiI95D/PnvIJ9xD?=
	=?us-ascii?Q?pOmldYp0WCAcuX4+StyINxP/GOj59UrbRPfM0cYEC9A43Fp22tAxhlARABk7?=
	=?us-ascii?Q?7KXSWiVxU1K1KkD5nGO2qMyrtB2BESqRgpLkHawdWKbvdkb2g0K37eKYAXDA?=
	=?us-ascii?Q?Gm1nreY7pWYm8SwiGt50W4l5+DBbmcHz4N5pGDf3XXuntPTxbqVHcyJox75t?=
	=?us-ascii?Q?qWuCBWLQ+mG9Bn/+pInXmWEx4nzIbSXXvvhyIjLAal4pzQBImQEq6LfDpclA?=
	=?us-ascii?Q?E1ODwujoE3nL90HDYnDAbuaJmOU/xt1ma6KHTGTwl47atB+zp9nowrJbo8My?=
	=?us-ascii?Q?IENWWi8XBN21HDtXCS2OW3/JEfz61A4U/jfz7JvLUqMUavfcDgwWmdWWB6zp?=
	=?us-ascii?Q?mOO8Y3jrqesEB4tFwzxjRcAEVKXcDMZionn5Y7JNRSwXVGSzhqHgopwprpmM?=
	=?us-ascii?Q?Xh/ognjS5Gt6d6y2W+X238EcESqWuM/CK7U7+QI8PEBU6FrTtg36bDderJnP?=
	=?us-ascii?Q?uafy27dLGoNlgnc0Ev1b9kVthBVx3g6YYy52gOjJ4vV7zH/W0DfpZR5zSQsu?=
	=?us-ascii?Q?j0djEH/i8lWyEZoP8M9hCOBiRvSKKvIg6upQk3KgS92RhQkehqiU4hRq0jJ9?=
	=?us-ascii?Q?jinPyFb0lDF7e/w7lbefjW2KUAxjINK4+xAd5cNLPmApQwGc0xNPFSFMfE+7?=
	=?us-ascii?Q?cNVo6gn29M9o73vRrwqIN7ulRMhhqObYYwaKzC2G3dq5UrI4FKTK30XKLqPQ?=
	=?us-ascii?Q?1PCL/Km5O6SwFZBPBn5XDQkxC5Y6tJKglaHh1G4vPFyKYxNDK4zRdu398BM2?=
	=?us-ascii?Q?YhQ3QjBbOQVCKCffuca6xxxv5MHZA3JDHPksFzTZLZyxyB0y/F+24c1vJyqe?=
	=?us-ascii?Q?nONO8XEgZAAXBn9zGCkHtkZCz7VPjgCQckgmEngQKU?=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB085;
	6:oKoAvtznoH1yYs2yTvH3Ifp8J8E8nf5C91jHBQIBq746OTDS97Y4MxJl7IC6NWadjHKaChc4vpYdQuBEkFdr/MP+pBe5VHagd85KTzuuRT8nEKNdN4BSv+sL5/CfP66wNHUVxZ1iwzc1xWCI0jDxR44Irr4QPaUy4q6Cu9mxvbXs0ZRV8+DNQVollNkD0WH7+qa0jrOnsjrlUi8wjbM7uA0SksDYcTo8+Kt7hcJ7XTRwKQLqC2UezuumA8QSD72m5BlA+MDXs/jNptgJk60Zx1nFxG2QhhDhyPnqNMDX8tSz7TmuoMn8dTfVY0ea3KF7klGIfx4vvKGu0+GOgi6HHQ==;
	5:h4cpLUKsPhJJuai4q4oPff/XbM5xbKrJ26dzBmWQaITOzlQ+u5ivfKVxBKyJap2JIO9C++KGC8bkXf2p2VqoB3Eg8MjviKW1/MoXFCYaV0XedRYyz5ggzOAyFK879yac1pkMoo5zBkFlsMiqKv67kw==;
	24:gD895AelOVAN4g+y0U3FR5AGb9V1TQbNr8i4B5op19fINFc5ofARaMM9gDXxYNEMc81pNLCfQqoepMKb6EaiAMzYyEgzHFtAKsvSb3TYc1w=;
	7:dVrtITeJnBfCVsJOXaaKbnXFsw7uxQONoeajT88KAVJiM9o3YscFL54tZEg1lgsh5hXCHBQmQamzLN0apxDGEu28fw5eEiEeN0V8Yy2bCUFr626IDWLud1SK6GmfIy/H3TxvbjKe574Aeszn02sEV9tReHASXGSRtgHGEr2oWh6Kb+8kecl6vSgVPbGcygOQxg3ePpkyfrcwMPYg1cC7pHAWu1PuQytGnaaErhtjCAwywKWpV6N00CU79KCEQcvA
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2016 13:02:49.5756 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR02MB085
Cc: manjukum@xilinx.com, Mubin Sayyed <mubinusm@xilinx.com>
Subject: [meta-oe] [PATCH 1/3] benchmarks:Added recipe for whetstone benchmarks
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
X-List-Received-Date: Tue, 23 Aug 2016 13:35:45 -0000
Content-Type: text/plain

This patch adds recipe for whestone benchmarks.
Whestone benchmarks measures CPU's floating-point
arithmetic performance

Signed-off-by: Mubin Sayyed <mubinusm@xilinx.com>
---
 .../recipes-benchmark/whetstone/whetstone_1.0.bb   | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/whetstone/whetstone_1.0.bb

diff --git a/meta-oe/recipes-benchmark/whetstone/whetstone_1.0.bb b/meta-oe/recipes-benchmark/whetstone/whetstone_1.0.bb
new file mode 100644
index 0000000..e6f51cb
--- /dev/null
+++ b/meta-oe/recipes-benchmark/whetstone/whetstone_1.0.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "CPU benchmark to measure floating point performance"
+HOMEPAGE = "https://en.wikipedia.org/wiki/Whetstone_(benchmark)"
+SECTION = "benchmark/tests"
+
+LICENSE = "GPLv1"
+LIC_FILES_CHKSUM ="file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d"
+
+SRC_URI = "http://www.netlib.org/benchmark/whetstone.c"
+SRC_URI[md5sum] = "d8eb2cd7104bb5a12d614ac6d3f1f9fb"
+SRC_URI[sha256sum] = "333e4ceca042c146f63eec605573d16ae8b07166cbc44a17bec1ea97c6f1efbf"
+
+S = "${WORKDIR}"
+
+do_compile () {
+	${CC} -O3 -Ofast -o whetstone whetstone.c -lm 
+}
+
+do_install () {
+	install -d ${D}${bindir}
+	install -m 0755 whetstone ${D}${bindir}	
+}
+
-- 
1.9.1


