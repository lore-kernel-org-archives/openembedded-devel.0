Return-Path: <mubin.usman.sayyed@xilinx.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0083.outbound.protection.outlook.com [104.47.34.83])
	by mail.openembedded.org (Postfix) with ESMTP id 9002C60119
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2016 05:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=03I3TasvAIDAxFxdRfGo2bPrJW0wFT1I2iGQz+6gUmg=;
	b=ATS/JrCBluYCf4j1/b2tqDY7BALN3NB9PM34oqOJ2qf6s2ykj70dZzbAQcrbGh3XptcPdTYhQcHO7xrctf7v7UsbAtHXCl27nOTpiD7YQ4Gvt+5HGUv7gTNtxZewZcNQIP1Hh0zWhm3ju3j63iYJsuCC7iOv4jJIaY6dJQuHmbc=
Received: from DM5PR02CA0060.namprd02.prod.outlook.com (10.168.192.22) by
	BY2PR02MB1687.namprd02.prod.outlook.com (10.163.27.25) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
	15.1.619.10; Fri, 16 Sep 2016 05:34:06 +0000
Received: from SN1NAM02FT052.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::201) by DM5PR02CA0060.outlook.office365.com
	(2603:10b6:3:39::22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id 15.1.609.9 via
	Frontend Transport; Fri, 16 Sep 2016 05:34:06 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT052.mail.protection.outlook.com (10.152.72.146) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.619.6
	via Frontend Transport; Fri, 16 Sep 2016 05:34:05 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <mubin.usman.sayyed@xilinx.com>) id 1bklmj-0005LO-RR
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2016 22:34:01 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <mubin.usman.sayyed@xilinx.com>) id 1bklmm-00025N-Qn
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2016 22:34:04 -0700
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u8G5Y4sB016309 for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 22:34:04 -0700
Received: from [172.22.159.26] (helo=XAP-PVEXCAS02.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <MUBINUSM@xilinx.com>) id 1bklmm-00024f-3Y
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2016 22:34:04 -0700
Received: from XAP-PVEXMBX01.xlnx.xilinx.com ([fe80::4c50:cc5:695a:c7f8]) by
	XAP-PVEXCAS02.xlnx.xilinx.com ([::1]) with mapi id 14.03.0248.002;
	Fri, 16 Sep 2016 13:34:03 +0800
From: Mubin Usman Sayyed <mubin.usman.sayyed@xilinx.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe] [PATCH v2 0/3] Added cpu benchmarks
Thread-Index: AQHSBDrj9N8i7QcY002GoMTEM4CP2KB7rtdA
Date: Fri, 16 Sep 2016 05:34:02 +0000
Message-ID: <366532EA46EE364DB88242E771105CB59D6146@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1472725387-29968-1-git-send-email-mubinusm@xilinx.com>
In-Reply-To: <1472725387-29968-1-git-send-email-mubinusm@xilinx.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.23.95.88]
MIME-Version: 1.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22578.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(189002)(199003)(377454003)(13464003)(19580395003)(3846002)(87936001)(189998001)(107886002)(2501003)(5660300001)(33656002)(92566002)(81156014)(8676002)(106116001)(450100001)(81166006)(110136003)(4001430100002)(2906002)(4326007)(5250100002)(7736002)(11100500001)(626004)(8746002)(7846002)(46406003)(356003)(5890100001)(8936002)(54356999)(50466002)(76176999)(2351001)(97756001)(19580405001)(305945005)(50986999)(86362001)(2950100001)(7696004)(2900100001)(6116002)(55846006)(586003)(63266004)(2920100001)(106466001)(23726003)(47776003)(102836003)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB1687; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT052;
	1:EURGeWfZ9je+60da+NRTPJQtn45eSbXfWB3JzaEZ0NU4876nr9Fu/WlG/YGYDcOzGPr3GCsR4W7ECdu/wFiJuac3GQjMIplHo497jb4kO4b+vjCkpifqLAjXtNve57n76YN5tlexse2FgchxVmPbZJbk7QB8sGMSawo8A7kDbR0Y/+JiBH55ZHoO3Q1SJzPBvhJ//GE3iHe3qVgpLgRGT/4HOPsgStuSv6O0nQ7lKdCSSCDl1M3YKpc0ha5bVacjpCi4fVJsrmRblVhyuyhAYvH5Em8zrwOEYFRjpVMm2W+Iq+h1SRVQ9TaxRNV92E57lyUKtNbUqz2uX7w9HUcyeOIKTSMOunBepxJJfCn5ugCqkVLt4dDJySU/UqFgLuC595xtVSfJ/iL0ewgzjpSevR4u1Oj7FRFXmfXYvls5TwfvvRYs3ZyiZ5OXun7ufZRhyHLR/aWhK9KM8inAT4bp9A6PnvNGyD/R8VrUQAE5c+WZxobM+1xGibGgNxheL39bFSMGSxoWipoj/vNHRl7WGirhtSNkNYXzHvcjv8Z3sPahIEPVXko1FbypfAz8PClb
X-MS-Office365-Filtering-Correlation-Id: dac2ecd3-2e09-412a-e5b6-08d3ddf31310
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1687;
	2:OeBuBlXxNO5lAuwYVHyaMx8uCZcB8stI+iOfpa/U8WRKK9EepDchWGm5Tvn2JBwNrmCC2aF4F2fnVgOhGjgIBJsiaFOIzyGW2uS5Mkzihy8zvISKRT8XAxF1DL8GNXiEQdXwovnTYl6Ri7XdpjJ4sE9bio6MiJIVt3BX8sgesDx1NyAmiBHEmJSxWurBqBTv;
	3:PZM49awstNouFJltsH63mnQk0qsdnp7txk3JqX10pmxzniljku/5t1CQSFQN+gSRFfc6wi2qgooMPCxIKo3rcxmEzUaLiSRY2lpNDusHN1jrXYqJgoRNKR6JKKBeMPFQcBGmLUg8FaLaUiNQ5DGfntTNcnTg3MQUh3zTqdDJg3c++CGgmv0SSfDhnUWJb/WfcAL3QTaHC55qSnhrdvrhFdVEVZFd2dbz56FuFQjxB7KfOJl2wTiy61F/JdWgxMO+jJOZXN45p23wXYxI2nfGSA==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:BY2PR02MB1687; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1687;
	25:8LZotw+KKq78geTMQJFA/pIrMwYtN41sjq1kxeC4tD6iv8ErhBcRRt81uYAKABa7PnSWCzEdm+jSWdhz/OEhiAx1RV84V80HowUt2AJ+CbYe+v+AAbfs7YvF62/doeK7CvtNtUV8+5JrFpeWRvwvhp5cEocT4ky+wW6eVqI9eLSJli25+sn59s7UpAwJfAj+Qur9prOOL4cD6XY8vJL9zODtt6bLitW7mHka5kgBakxkzpHY72czdgtoY4i2zdo4zPkM1ZVZZnFv70M1V0Vx6TyDV0uX19BcnXQluduaXeEWmT8lsPKcLqyzIHa1xFpA0ciae7pnXioQnyuS+FmBsQW2B/ZXuxDLJ0feAE7Pe9Q4IQmuncoDPxLfJzmovU+y75pxXcKmFZuN6VMsXiD4SXdBEVBHCL07VzNpoUFn0GY19xHOyGg8LgaQe60VYZw3loybk6DSkRgF1LDFHtjSrySF8wBPbntsRAMgiaGDlQzvO7JscK8M4W9X9hhlFP+pPThYx5XWaz6ZNlPkEjwC3lvdZaiOEt8Wz4Mz2Yamwtxuj8yEQoFSr82KkgbsKJqmzscDQ+6zSfnBW4oHtfPPJqg5lyMs4iuEBLtSwo+oT9K14AJ43wL055an7EokoVe7Ys1amLr3NjR4ascUfrjsbtNTH4IR/8TwvSE0JB2V5rdWK3xrJzg7ywGfsCmSUaLHUtd7tETjVjqGjH4FC0kxfwQ6nWCs5xv6KSFTsEviGOM2Rf2IUct/e2vIXMLJ6Cx3DIEVQnSTDykc0DDTCt88uSUv+TBWWX9bWiBDygEdB0SX8ffwEa6VRENQhFl3fij3
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1687;
	31:OQy/oHXVzsB06ph5+WSQHnXc8z9tVLhgqTSA6N+kVgHsvrfEqoXOgaGsz2qdUC5NnLvGZVsOoXxT+e0+OdDAaA4eni4K5TRB0QAipYjY7bthZW3wd6VqGJVLGU2U6LrTGs3uK0p5S95xfR0JrPC7+OUdzuS5N7rAA3s8KgVK+mQtaFCkLCyvHoYdiYESnQQ1CrV/DwbEmwuKZ+yG+IAxZ8/fY6CiGuvJDNPH3KuLs/w=;
	20:tt+on4vKDMSi8i1q03YW+KAqVxU3+zlNvBweM37zbBz1Z6lo455MBs9YBXVHJpB4AnT3ntZnMtltlLHqkOhpjO/j/z560a2rqDPK/RrtShhChEWexapcNuWzvy3Aqn6mZrwa/lRkSufL5PJ6Q1HMp+JeTHfU7mmceM/SdrRGc5hewCCgJfLxxiP9c6YidalWDNcdM/aQTUh4J3wBqZJg/bBssyCbNknZh0OSU+pYigJZX+b2TR74HRa918IJPVyFMXZhw5hJ1wpMw8pqGwH7Du2IHvLA2VVR1GwKjMuFMBFE+nxn7Ig7Y1rkNITNTpz7/kMP90rnRZw/ueQ/ZkiYHPbhQJ9X2M9rSDTHgMr8n3FYWWfG7kEUy5ypJwMEL7ptuepBzDqFh8nu35u8v04OAAWQxXj4nzTVYRxNgKy2f3/BDh0T3YvNQsr6XduS48pdXPv2s1L0X++bgvEtTGw7Srou0bwo5oOppV+NUXXfl+gfued/SB83i7ICR7yXhMsV
X-Microsoft-Antispam-PRVS: <BY2PR02MB16873DB84E892BF408BBF774BDF30@BY2PR02MB1687.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(264703809997249)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(8121501046)(5005006)(13017025)(13015025)(13018025)(13024025)(13023025)(3002001)(10201501046)(6055026);
	SRVR:BY2PR02MB1687; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB1687; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1687;
	4:oAgvb7qy7qVhvTdUe1f/4U1KxeFYBGeNbGI8Yg3tqIv47fqgGI8MdQWr+6CW20ofnZt3S87u82UvZdD65Uhg9sYgTJyUkpOf4a5aXrxuzDBJHhCi5+vSUrNphitB63XvSZJEPJQlaz9zW0I7ef+/i7XIrK/TtaxX0C+oNj/6Vxqnagdw3CyWiU6s7+HigTVIERK3KVSmI8zWcXmoaB3fHlUuaR/GR4maTLW3i4uGY+GjlKwtX8ZTuTbnH6mbZ3UhcMtc9EcvapJG/8pl1K/VE3fLDu6jWXMjot2N4aujQIk7+SDK84ylbhcSzxd+cRvmd9EKECeeWxoaGmUlCwai2VBJjBahZGhPmSSpiLZdk6bPN0Afu7OJOnRu59XtpPkYe2FGi0thH1+aC2HvWoXdzt+gbuOxJaIr52OcAwHFWQjiRXJ9I99gK0Q2z51Gws67QO2zkH/M8jvLNFEvCHYZgyrf45gBehp+lnoTjBM+7T9XqoIiqWFKUZcvkZ+2CKVhoewJ0jT1VNuJNFEP+1tVHptm1hNsW9XtOgvm+6adHDISlvTtmOLk0GwZk5wmdFtwcPLS5wacf7XD6IyPNNFzgQ==
X-Forefront-PRVS: 0067A8BA2A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR02MB1687;
	23:KRldRA6IZLsssg64xsRoNEurv/cu+CiSUMBdznOqI?=
	=?us-ascii?Q?h7LHbIEJD+4qjiSdJNTMgPamjcEQOL4gD9EmZi1iNpbcBfVxhO4ZkoDVxUgf?=
	=?us-ascii?Q?QZ3UnXUU/uNcYqodE5nLrouINlwGXlfH+n5QP1gXbcG4cjADsjK5pVMOxAaO?=
	=?us-ascii?Q?IHF5wRY3fSgn577avibksvwYH/vNOzNvjjYXOBRaJJaGngBTaw+iX6zwvvq2?=
	=?us-ascii?Q?PVXuJ8cxo0ku1GLRpTNcfg0YOUaJecYcS2xSgFRs1X7TYuhkJNZ5umFoV81K?=
	=?us-ascii?Q?4lSFcrDt73ZzxfQtEmmMZ1OaVKyoEyh0gIgDrBst2HNj0fg/0S6YLMcoDqwY?=
	=?us-ascii?Q?taB2USKA/atdf1tpp5lanFiQL2l1pGG+zFO2hu7uVVR3vDCBFY0YxcGtSHJ1?=
	=?us-ascii?Q?Y8UGTXigV5wsZSx0aZoCzp+3bMNz/2uGnrY7UqoOuxbaFl8l++CI7gkAwTPy?=
	=?us-ascii?Q?pdphbnC2RwTZi06K07sqd+AqN8n43qhv32Dm3Mpha0tsc3mDAzqcdr/4F99o?=
	=?us-ascii?Q?jMouoXVNdt2/C9v6OqO7KREum/if/aF1/pL4sdtZe2oVof4XVXK1ELY2E9ai?=
	=?us-ascii?Q?7s3pSa/lPceGJ94ueh3WZegzdkRTJTYZfPObt/BPnexgsxSmOA00xz7YT/HV?=
	=?us-ascii?Q?+60WTaccPnNP46Trfh3ylyhvdpi4b9cbe4tb3u9+jtX1M78eTg733Yk1CkVu?=
	=?us-ascii?Q?rhl2IZeGFAXPMQAsLhxLrxLZ7Cz4UeCV/DVePztXBY2HEeL/GFE0FOrTQWlB?=
	=?us-ascii?Q?xSGrUkfvKCbxAIA2uAZEglGvS7SqETxcASny+RZ7xOKTS6wwqsdrb4MnRwpb?=
	=?us-ascii?Q?helbSM+tbrj+0jmhh7WALS/gkDTc0Esdo61ElpaZ6zOXqhbkI/TTnVxC5APv?=
	=?us-ascii?Q?qP3NX1lzwivMYiTH+1/8KSlibJC7/7lqACyeWTD5vonEUAl+1lHoqUpQu5kJ?=
	=?us-ascii?Q?kj5D0dPn0OJTsW3LHp7q4FRC/v14JU11rzQ7IOp15tEij+ZfHkW1/itep8uZ?=
	=?us-ascii?Q?c5byGymyqylSyP4JUwZIPkpuTEVrhahoV/m3PcO0zeKRq0+N7VnESi372zBm?=
	=?us-ascii?Q?Wk1kUgZhCvxZLWrULLkAq6TrglEoDYOxU2JsOXVTbT9eaFOwb5pANXP6oSgM?=
	=?us-ascii?Q?TKWUb1bzWocXWnur0TVIzAndc0ikdskcJwpCON9TFD9fV7N0HuSUENXE95Rl?=
	=?us-ascii?Q?6HGXsTERK0e9TpqacPzmBRPHAN/jstByjaOcOw9zFYA92ADSF/9puhRmmySg?=
	=?us-ascii?Q?yF5UsaFgreoGGVVSWG2KVRYsmYfyntmirG1dTCge7j18eu1A9+vjnHpGGnkk?=
	=?us-ascii?Q?dT/tmH0CJm2LINwCuDR473JkluvP+3Kl/nh2yC156X/LaYQ+IEywQVYshG4W?=
	=?us-ascii?Q?XnoYPCQ+qMXAagoF2rhL/HJkD0=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1687;
	6:KcBoZ0C2g8QzsZkAMYlZxXaHIxvhJrrzKxcXgOw2Y54eQwybuvjq/3J9JyeVQrFAARPCOX9rvbPHJRoqwWNZxnq8XJ5K1oBEyAekkTyAGwhb1a3uBjqFlqq5g2iXp+0a9RaoLOfAj75JzVO0lkDwlkp5CwTOnVvHQ//wPImhY1PLLBEOTRePV/LLoHQ12YlsSd8oV6+zXd5ulglLt3nqRE4gsPIHm291QedmNqyhCMErN5Zt0ZMEzOBLM2oTNFnKrUYnjJslPyxjyxhCNJrN2pcO7mTJXW+h94fePg3jiKSPZJBANTOEP5e3YrA3MfSoEG+E2k7gLOqPq7LD1cFIqg==;
	5:fyjokFDuBLc84zxVr61ZGY8GKDdY1+8pMf/zYrRIAOV2IME72vyHEyODGnLc1tTFfQSDnrfn6+tsyxeDi7uZBhBwolwG2s7WnPutBx9NWYtwrQdxnRv09HB/kJzjfgfbN2YUZRA0EFqw5Zwbh+AydA==;
	24:45wBQd2Viylulw5KMPRLYGc4UBoU1b2x9Hw40ME3mBX1I8n0NayjSgQXTyz/cSkXNP+QIBjXoiu+uYfGeyuopOrP7NogRbetNu95UHdf6oE=;
	7:EZSTrkeg1ycZEQsCGPAKMiogEMk8nChCO4T3uWrMe2TGSgPv53c3ESgGIw3iV+HmIX9W7JFeskyuN7nBtur/ZgsZLK9gid2RZgUtWPErdCzZvQZadaMxAF7sLp0cqVOPmgcBeG/T5Hh9r1xhjOVFK+QFwa/uJb6dsRpqIhqX9I8ZmZ3+shwfhJcBfISs3ICcQfSZnKVwu6x+bU0fdt/Vp+U5B2XeEsKBGRV+NoHtwXqgSFIVCeEFPH56p51+/xaA
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2016 05:34:05.4631 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB1687
Cc: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>,
	Mubin Usman Sayyed <MUBINUSM@xilinx.com>
Subject: Re: [meta-oe] [PATCH v2 0/3] Added cpu benchmarks
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
X-List-Received-Date: Fri, 16 Sep 2016 05:34:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ping

> -----Original Message-----
> From: Mubin Sayyed [mailto:mubin.usman.sayyed@xilinx.com]
> Sent: Thursday, September 01, 2016 3:53 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>; Mubin
> Usman Sayyed <MUBINUSM@xilinx.com>
> Subject: [oe] [meta-oe] [PATCH v2 0/3] Added cpu benchmarks
>
> Added recipes for cpu benchmarks dhrystone,whetstone and linpack.
>
> Mubin Sayyed (3):
>   benchmarks:Added recipe for whetstone benchmarks
>   benchmarks:Added recipe for dhrystone
>   benchmarks:Added recipe for linpack
>
>  .../recipes-benchmark/dhrystone/dhrystone_2.1.bb   | 21
> +++++++++++++++++++++
>  meta-oe/recipes-benchmark/linpack/linpack_1.0.bb   | 22
> ++++++++++++++++++++++
>  .../recipes-benchmark/whetstone/whetstone_1.0.bb   | 22
> ++++++++++++++++++++++
>  3 files changed, 65 insertions(+)
>  create mode 100644 meta-oe/recipes-
> benchmark/dhrystone/dhrystone_2.1.bb
>  create mode 100644 meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
>  create mode 100644 meta-oe/recipes-
> benchmark/whetstone/whetstone_1.0.bb
>
> --
> 1.9.1



This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.


