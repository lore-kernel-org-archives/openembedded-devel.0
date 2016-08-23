Return-Path: <mubin.usman.sayyed@xilinx.com>
X-Greylist: delayed 931 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 23 Aug 2016 13:34:02 UTC
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0058.outbound.protection.outlook.com [104.47.34.58])
	by mail.openembedded.org (Postfix) with ESMTP id BE4A26FEF5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Aug 2016 13:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=dCag8K3arSjPNoZqxZLf0IHL98/NX4g3a3uWhqbBsI4=;
	b=OSK04d+d0Vg1EWcw5+JVEf4447jTK+qQDx38eBSUFlVT+TNJEiEilG9vClhy3TWxZ64plRteRdo7ro7vUgGFV4IOUMwhtdZuiLAiehKO0cg4rHV+M5zkWpByTigWSAbDNPetNllCNkOwYYZLMEkuzPNrccdJRQrlBbUfIp2BQfI=
Received: from BY2PR02CA0041.namprd02.prod.outlook.com (10.141.216.31) by
	SN1PR02MB1631.namprd02.prod.outlook.com (10.162.128.157) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
	15.1.557.21; Tue, 23 Aug 2016 13:02:36 +0000
Received: from CY1NAM02FT055.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::202) by BY2PR02CA0041.outlook.office365.com
	(2a01:111:e400:2c40::31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id 15.1.587.13 via
	Frontend Transport; Tue, 23 Aug 2016 13:02:33 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT055.mail.protection.outlook.com (10.152.74.80) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.587.6
	via Frontend Transport; Tue, 23 Aug 2016 13:02:34 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:55678
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <mubin.usman.sayyed@xilinx.com>) id 1bcBLe-0002Tn-QC
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Aug 2016 06:02:34 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <mubin.usman.sayyed@xilinx.com>) id 1bcBLd-0005Ob-6g
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Aug 2016 06:02:33 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u7ND2Wq7030262; Tue, 23 Aug 2016 06:02:32 -0700
Received: from [172.23.146.171] (helo=xhdl3763.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <mubinusm@xilinx.com>)
	id 1bcBLb-0005Ne-VC; Tue, 23 Aug 2016 06:02:32 -0700
Received: by xhdl3763.xilinx.com (Postfix, from userid 44329)
	id D1E5A2CE0534; Tue, 23 Aug 2016 18:32:30 +0530 (IST)
From: Mubin Sayyed <mubin.usman.sayyed@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 23 Aug 2016 18:32:18 +0530
Message-ID: <1471957341-26005-1-git-send-email-mubinusm@xilinx.com>
X-Mailer: git-send-email 2.1.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22530.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(199003)(189002)(586003)(87936001)(50986999)(36756003)(189998001)(47776003)(48376002)(107886002)(50466002)(50226002)(110136002)(8936002)(2351001)(229853001)(4001430100002)(52956003)(106466001)(36386004)(305945005)(626004)(5003940100001)(7846002)(2906002)(356003)(63266004)(103686003)(92566002)(45336002)(33646002)(86362001)(4326007)(450100001)(81166006)(46386002)(81156014)(8676002)(42186005)(5660300001)(90966002)(11100500001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR02MB1631; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT055;
	1:R73dR5JaDGTT22Tjd9CabQvoq/ry0jmO9Hn4Zugj61eP2nlAgk+UXL7cNUHyBTk7rRzoxuQC19wEPwjx700NPjfxhAPqwv7b7QCSDmJYIZ9fpBjHHVcHu6L0emp8siXe3WwEEk/OKe+a/wpPOqAhLxzHbMQrvoydJV4c7hYkvEbqUxo1CfMcg9IFwU5JfCHkwFcAVHxOXXDWUnQkqAEU0cgTTIRDzMhb2VqYAGrUg3AZWvWrQENJb5Uj8FAnZvNqs5kmPXGO/rki2Tkyc5dek+sHJnu16VjztTRftTUA2sTflPZx8tpNeRM+jKBeARueDGpYuC8jizzlKQsifwJu/6LdMaVfDEXFxfwkG6h1bXcgR1fiofR4rDO2FN7wUfEoQNNA+gdcUgYU1ZEjGKS/Svp58r6M+JZoKYsv57ZU0eEbEt+vMcfK8bKI7aLVXAeIp6mWyefNms9dRTFb4GlVQX7FGs8sQC2suMXn6+hYseNOD89XCyEKHdpqMLlxYObHqkGHZdRCTw5FJ2r3Gq3yvoX0unq8JangP6RUso/3EfA5oZHDJLrxVpir6ldBq7at
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: fe44e603-aa47-460f-3bad-08d3cb55c008
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1631;
	2:L5hg6X/qRu6GZqTAgf1fj4Bx0DRWYOlNxuq4PpoUEmBxkLDGtylPWdQnxaQoF4CF0SowLuPAV3de/LBxO/i6VJ0H9aFfirSDR3rK5cIzwurrFZ2oizH1oC5DJb4aBM9WCzRU8PMlpBPGQb+l0Ek1ehamrxR5BsOrkbV//VQvX9y66B9Dlq6+iCR5wmVLfF5V;
	3:Fo+VRABoFKRMKNHEwaggFau182zg+tDuOYccnYM+QNrqCuCu3UL2pXnAL6e9e26IPdBWI4ZOv3Zg1sivOPvKxsZejmXwcJfxZ1Bv+HX22jEKBNhB6e6jaX94SJZsCBviTWUSskFc4v5prEJJDQ1Bjfr/qz+X0BBi+XpAExeFBj9mImgHxBFRJ5zgdChV0q5qC5x9GlXDeaR+swYNW/eMbnhkHDbEjNxChHNXhCjfn5ewtEi6L8qdj+FfC7oJuohr9uqtPPxI2+edpoJz2BtDfQ==;
	25:lRuBHhdJPB37KeUyKZj6RhF76Zc0tUzeijXNv4TPDtWFqhl+GVANk1pqaug85NEHSn18nK3mmve06BbUSB8yIu1FELx29n2NZBpVR24m7KY/B8M68UXi9Kt9lNUEiy3Shl7bITuVuQU2gKHBN5KVC7fqbp0rF0ZO+5IgutPYGGHE0jKJBLj1DCrStLxF0gbVFN5TAoJWC3CVSwIBm64Q+8kGcOeI9jmumkrKrkKlp6hyzcIUlriCnQ3RkIPkmvSPtdEig2c7wbC/osk4ekAG6lRcavnB7UecZUR/2t6TMbNrJinb9UPEzEZJ8OiWceYGCq3Bx7R7K+4K39T/0KAA12CS7B0dIpMbEvjt6T3WfeaXXwLj26VegPdxUBhHWz2pIuDfaFL8vWzKQ2bbQtwVHX12za3az9ewJr0EwfJ+vuc=
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:SN1PR02MB1631; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1631;
	31:1ETLgufhdb66O5+u3aoAP/C78rXsoENbLLMgvkiEpKr5lC+SGAtAOb/1nceSwxY/5nC+o0pTrAtAYZiIdQ07yL6wHlmhCEc/4UYUvH1rEuR2/+wSKrH1Ia6fxpbcgbMxnsxnmAFQlbTAAGufs6AjpQLW16P/k6ldlcDdDVI2btwvDq0z19AsKKaqwPvevLN5/VA2sliiGjAeFR0E8Faw6WD331DUjV29HaicMoNqYxY=;
	20:JvAf5hNDg50IBjWveP9rRqoXq+Y59TNvJeu44je1hzjGnY+PWmPXTXHUEsxIZLj8+fv4YbpjAlYhJoDeBU7Fj8kbdM1IJUy0N1xdfsmjB5woz6o0bh5vvj7PD1R7xNRRACp6sj9C8YRYQVOXn+0AwzJ1oerdp+k4EevcobnSlxdezRvjx3FRmFyhVrvnOn0e0KcaiRmBV9xd92mOGBcjy4Mi/QB6NXb32pjs4WlekYacds1UzBH0gOBRW/8zwOG0ll52cXWZBR4U8aqFg0NNtCzWRGD0EOfwUJJGJSyliordWI7qsL+UpICgLKC3SdjxVwXEkGpoNCHPtJ8LduY1E137Vw2HGOJHm2yu60YD6ojb19dzi/FP1/5ZOJ2/qrwVzTyOFPH284pO7i/QAwIqK/Vj0E4DhmKIo6TMUPt+bkXOl4yiblZrbWP/Uk+Ylpwizy/dgQ0fxrXm9tytLqZVO04OTCzYjmDl3J6+/JGKz2Jy6CGDVLIErKjxmYEwvmXT
X-Microsoft-Antispam-PRVS: <SN1PR02MB16312A8CE0C73402D10A74BEBDEB0@SN1PR02MB1631.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13015025)(13017025)(13023025)(13024025)(13018025)(5005006)(8121501046)(3002001)(10201501046)(6055026);
	SRVR:SN1PR02MB1631; BCL:0; PCL:0; RULEID:; SRVR:SN1PR02MB1631; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1631;
	4:DcntPv7NMw2DmYsBANeowVbFArk3uqh4NXTfRUFKminWmTounjYvs3MacgNAPD79p2ddPle5J9sjRthJ2A4EYA/T6HI86N0WUbxlsO66Lx3hRQ0PsuSlpLIKNBtDprzm1D24/pu/D5U65czljDzxJAgZpOtkhGsvzG7qVomvsmK1bZkVcW3DQwyOhVCvUz8ZVOh6hHYURzJHoqHc2C8aXRvGhUAMu3utRDMKuQ2h/rWY46ceYyY9ScYsSNbDgewgwJS2rS0nMLo5kBzsLvj2C3Bho6FocGNrqGZqNp2eEaxWkNBdSWq/T21BFRRGYV1vmMIDGT44xM/iXFKzaWUcCrtzC/64SLFhpCSmd3aViAiWJ3prO1ZcD8EzI2awKv1o9Zq7M5gERCZiCy5znh6BjZAdBVqIcFhfVRC/JgcubFkQ5vDSTKgZTPM/dbyQRxosIZ0jyrRv8VPrI9MKESUJP2bX5Tcz5LyUQgXXjzRHMR7fSvivYpejbUO3I6LATZXq
X-Forefront-PRVS: 004395A01C
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR02MB1631;
	23:UZQ7W1bjPdlitpRW330Cnj9SL6cxUbN8MDdp/UJcq?=
	=?us-ascii?Q?ydatDrd22FAJu/gcXr23AMpeYk2ptJfMD9H9i27/Zb8BokVk8AT08TqMjXPk?=
	=?us-ascii?Q?eHExC0Ypc+mogLYU331yIY21URIf+LfhXuMeHm0j7cO/l6lv8fVGp1w6J154?=
	=?us-ascii?Q?BxbCbtzTDFOEwXLIQA4OxnqA1G42y70Qh2ky95SyeWB1KbCq0quGPXgm4ky9?=
	=?us-ascii?Q?7fRZtcKYyDoiozVczeAbeTpaZdIOVG54L9zD9PIxI+TsvJ4ERx/BzDrMgncB?=
	=?us-ascii?Q?UGsPuF52923OxXTNNHcuQzsMmade1X4TMSnfwj22ZWyNC2Kv0BkMzp12Xl+F?=
	=?us-ascii?Q?zR3v2OSDXjabGho0K29blmo9wDHH2Krc4K9vxAF+Adp9qoklWx2LSbrOqxqF?=
	=?us-ascii?Q?7MMpSP/hX0ZQMqvrWMCuLeZlC9ww4XnjqL5dAE/ZcFGexpriXAXp6XXzr6n/?=
	=?us-ascii?Q?aWKKsgY6b98Q66cpnpMF88WvbkoLHEWl41aBa79wIkuIYaRiihKdxAoil9Og?=
	=?us-ascii?Q?IFTrNYPrkwjzObL0AtWUo01nnGaegPGdVA5tAZ3wfj2c/RrgL8nQRwG/xh5/?=
	=?us-ascii?Q?DaN9m6/SiZV1tfiCSbUr5eWCw9OHHJGKN7mi5wI/bkTH/8h9Svztf9ioC2RZ?=
	=?us-ascii?Q?Lo904F5h7GDOcICMzPyOlwBk6vu7b53kaZvUiP3cgQiKi0XJjdvwNEQiFNnr?=
	=?us-ascii?Q?TsMNSZm5mYeBQIaarW1DmI+3OHlYXD9OUG1lsdoUwFFUsaTLWpQcw0q8cNPi?=
	=?us-ascii?Q?+hVZNHNyy7/U5+n7CxZOEL/qRpAjtVGWgDUfX4wwQx1UpAVMaACp2OhkSQCV?=
	=?us-ascii?Q?b90L6SJycx+9se4HT7kHKGSrhVPybrzYbEOG67rXQSwUiCPzckPYiDQh4h44?=
	=?us-ascii?Q?pmJL4YAEMLB0Eq1JL+CZWd56q4QN3MtIX0PGSctZqJy7gEb/0DapSdvigGyw?=
	=?us-ascii?Q?99yLNtpyAcp3s/1ms9zlmAa/qlVLLm4ypepZ9lbfNBl+zBkduXasioWrfFTV?=
	=?us-ascii?Q?ZB7Oc7bzUzWbXerf/jRFWAsLYzcQkYIUTNm0UbNlyiQs8Nqm8RZVmUP42YZG?=
	=?us-ascii?Q?deqwKd38p7qJKQKZDfDfLe2+ZMngySGQBu2Xc/FHEVRni89KZ7ZWEe1Y+D5y?=
	=?us-ascii?Q?XiMl3rIllxwVNhJJ9k8/sJbe7FnXAZ6siGHYfozuBZd+scTCJwVWQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1631;
	6:lPRjv4qlG2mds10DkNUN44yrJxc3Pim4P3DUSMO0YCZrXRCIbqodpT7rp7XIQTqWGsFyQt8aNSgoBNVjAMYXZ+bw+r9h0IIa1G+5OPUFEpskekV1rIcf2neZKvHvQL8GvaeV5R2nwIfmoWmuN7N//LNwTFOuQKSkS30AHhC4hp16JglorAlncEiNIoJWqU1jc2/03Ev22aBgy945NQSyPCPH2/3QYVmW0ZYYo8MguFYLUXGcxkLF2ZJMUjFpn6Rti4nf2SfZNQAOvBk+VjKersmjFCJ78yO3l962+/jzIN9oI5qofvUcqoZNI6aMr11CVEqs7O8mb0325+91QmesmA==;
	5:JuwT61/tLzgqnkx/C3vhUQ2WcrVMg+EByc1wqfXJmgCdnt0v1MMEa/o2E26+4l0z8vMbNOC0OW+1DXZw8m04FnujZ08s3PEPOa/dxZBQUuxZa4KdsCzsn0qPzPjC3tps7Kju+NsMPPuvtjpXg1FnQg==;
	24:FqnDxAdoPX2CjZZUsmnjkqTPsLWC9ODtgKlaFJxYDey+zcNI2uNMXFtRRBCtMBHj/TJWsf85GnVviU+hqhnuHuh9qLpdtefun2hqCJzlFvQ=;
	7:H5s9t2k1lLssNBTRouxR/sz3uQE81ShHZe1sWFH2ZbfHQ59qYXI9tCSNJ3eqXae6DI7ReJKHkWgscYih3/xtWFfa8COAyEhV1aNoTamFsdKfL3ECvzJB9H3NJs6XpnL+QNH7iyJljvG73Xnj0gXrLksCqD4NMmOQx67MfTPX+twpZaDF4r+LDQsB63XCu4EqFw3FcOSK45Z9BsnGVv+p1GNjtyT6Dnq655ylBIELwXmS2hnS+oWonvQ2/FIQY6f3
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2016 13:02:34.2233 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB1631
Cc: manjukum@xilinx.com, Mubin Sayyed <mubinusm@xilinx.com>
Subject: [meta-oe] [PATCH 0/3] Added cpu benchmarks
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
X-List-Received-Date: Tue, 23 Aug 2016 13:34:03 -0000
Content-Type: text/plain

Added recipes for cpu benchmarks dhrystone,whetstone and linpack.

Mubin Sayyed (3):
  benchmarks:Added recipe for whetstone benchmarks
  benchmarks:Added recipe for dhrystone
  benchmarks:Added recipe for linpack

 .../recipes-benchmark/dhrystone/dhrystone_2.1.bb   | 22 ++++++++++++++++++++++
 meta-oe/recipes-benchmark/linpack/linpack_1.0.bb   | 22 ++++++++++++++++++++++
 .../recipes-benchmark/whetstone/whetstone_1.0.bb   | 22 ++++++++++++++++++++++
 3 files changed, 66 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
 create mode 100644 meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
 create mode 100644 meta-oe/recipes-benchmark/whetstone/whetstone_1.0.bb

-- 
1.9.1


