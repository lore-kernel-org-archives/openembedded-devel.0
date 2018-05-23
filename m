Return-Path: <Martin.Hundeboll@prevas.se>
X-Greylist: delayed 10785 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 23 May 2018 23:55:40 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0053.outbound.protection.outlook.com [104.47.2.53])
	by mail.openembedded.org (Postfix) with ESMTP id 60D38603FE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2018 23:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=4bpRfDgxBf/kr7JrqmwcFUjab/05RKHCfsJZ1evtvOs=;
	b=LWgWZqkSOFLO9wppeoW+peypBkKi3J9iGJW6q9iyQcRwMz0BDE05O27OtrlGxPvzsld+QXQY/eUsvEHrqzL4imYGdGL/muh854gVFvMgE3kKrOUR7cxBgqA+9T8SUy3R0tFb7W5JFKeUyB40O+mBbi3XIQrsFS3VWLfhagEWgwI=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Hundeboll@prevas.se; 
Received: from mnhu.aaad.autarch.net (85.184.147.232) by
	AM4PR1001MB1426.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:200:9a::10) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.797.11;
	Wed, 23 May 2018 18:23:51 +0000
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <mnhu@prevas.dk>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 May 2018 20:23:31 +0200
Message-Id: <20180523182331.23083-2-mnhu@prevas.dk>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180523182331.23083-1-mnhu@prevas.dk>
References: <20180523182331.23083-1-mnhu@prevas.dk>
MIME-Version: 1.0
X-Originating-IP: [85.184.147.232]
X-ClientProxiedBy: AM6PR0102CA0033.eurprd01.prod.exchangelabs.com
	(2603:10a6:209:14::46) To AM4PR1001MB1426.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:200:9a::10)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:AM4PR1001MB1426; 
X-Microsoft-Exchange-Diagnostics: 1; AM4PR1001MB1426;
	3:QP7N+RkGxKJfwQe+vor/Y+kADFVEGfVNV4mRaszK5Oa99Kex3/XdSLhEtsgoQuiBZmf7rPdo6Q7Y+Ocmfaa3VJWfV4aggXYK4Wd71o1jZxsGlg0+O7oJRvyqfUyi4lwppp/EJz6+QnkBgJ1Hr6IYEPqqFo+7xgn5rXBiUc70KYO/EZkBkRtM2S7v+WfXk9PXFIi7SoSJVYQ/YjJ0+0EtXyo0eq0jOCglyBZdgGbXQ/QUkZsvo9w+/jO4/oFY+4XT;
	25:qG/Wfm7oH2xcZAFlhISCJ+W8x7EsPXA4llDK4ZrBp0Vg/wmITKA+yeXwmR41DVMX4IgM81Y+FMVS1O1c51ND4YyGjZ5S2LYtlKZMAmaTXDTX20MSQCCwNM2zTCqw/m8+qEdfLqQ3tlJjYDFoNxS5S74jezsxYOtyZOqbMa+dixjXNacaHTJFlSVQ6CMW9Id5deNmlluAuw0jfclfxP4N8lmBLHo1J7Rso2L1Xdtbve/L57rUAImyMCGS7D0xpUhiNI5lm0Zk4b2l1N59MQkBwvGbDgTt5ywREsfmEpFEnXYn9Z7zcJObU7jGU9OdrTawOtYDGp/lv5n5XoH0NIG/zA==;
	31:o6Ge0PqFu667+H5cSygnl4Hprr+OsFH8a1pjCAn49KmnMYHG6WoLPkh09ielSNMEL6B0rKFAunfMa/c3upq22KIvdcaKE8oEEN1cvYRiaviAca0kbuZ9COvWjCnT39o6j5UssC579rDV1QRnphNp3+dnmOA+sKhnEYikN/dTksUAFsydA6RwXFofQ6d9npFzR69ZyzncZ3L/+7qybT0lAC/+ei+F6IZIlKZhCjle3to=
X-MS-TrafficTypeDiagnostic: AM4PR1001MB1426:
X-Microsoft-Antispam-PRVS: <AM4PR1001MB14262722A9F78AEB9ECB18D99D6B0@AM4PR1001MB1426.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(3231254)(944501410)(52105095)(10201501046)(93006095)(149027)(150027)(6041310)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:AM4PR1001MB1426; BCL:0; PCL:0; RULEID:;
	SRVR:AM4PR1001MB1426; 
X-Microsoft-Exchange-Diagnostics: 1; AM4PR1001MB1426;
	4:7YWQsFFL/uUYT5XibQ5IejdxajCCU7LhsvChjNTRJjb6TXuHp6gxAa/baL6um4LIeVGRGtPNy7cJpPJFGmy3EeuZNQOYs5EJdlkks2e+5q1ovULwCNH/2P8e9qxNn9GM2rgfZ87hGQ5cddC/AFWGmavj0i+A0H+kEH7bGOZQ3D41LO1LzEZdwa9LwM+LxY7Lkw1l/RW/E8ZIbyQjOI9f/GkmsNXc9CKMC6ufXrfmuKq45HzUA1pLoAetsN71ixsucHclNbyqpoXAbmSWxpNGmA==
X-Forefront-PRVS: 06818431B9
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009001)(979002)(6009001)(428001)(199002)(189002)(20776003)(69226001)(63696002)(47776003)(74876001)(62966002)(74706001)(36756003)(77096001)(77156001)(23676002)(76786001)(76796001)(81542001)(42186004)(93136001)(92566001)(46102001)(64706001)(81342001)(92726001)(77982001)(59766001)(56816005)(33646001)(80022001)(66066001)(76482001)(90146001)(89996001)(65816001)(87936001)(56776001)(88136002)(54316002)(74366001)(44376005)(87286001)(87266001)(50226001)(4396001)(47976001)(50986001)(95666003)(49866001)(47736001)(51856001)(50466002)(85306002)(79102001)(85852003)(83072002)(21056001)(97336001)(94946001)(93516002)(95416001)(94316002)(97186001)(80976001)(93916002)(81686001)(83322001)(19580405001)(81816001)(31966008)(74662001)(19580395003)(53806001)(74482001)(74502001)(47446002)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM4PR1001MB1426;
	H:mnhu.aaad.autarch.net; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtBTTRQUjEwMDFNQjE0MjY7MjM6bGF2cXNodjlBNHRZVC9DM2xGUzZRLy9S?=
	=?utf-8?B?aVBSMUVuNVpRWlN4MTFhaXNEZDY4NEV5L0NaS0ZLRjdXZlFiazZzWnZoamxj?=
	=?utf-8?B?WmFlc3VLZ1U4MzVRb3NaaEdlbldWemxMQW9XMlEvNS94TnlrVmhsTUNQZGdq?=
	=?utf-8?B?bUUvRmRBMFdKK2RoT1RLZmF3TytSYWhuOWVTYlRaTTNSV0FPVVRrNHMzMXhU?=
	=?utf-8?B?ZnQ5R1czU0NBNXZtUzc2eFNMQThvbGFMZ3BwaGZuSWh3QUsvem83MWpuQ2gw?=
	=?utf-8?B?M3UxY25qV3IyNUozZFllRzRtR2VNTlRERGtweFd4TFByNDFJalBJb0luZ2pJ?=
	=?utf-8?B?VVdQWlR6a0k5bXI2Z1MwbWUrMVlmclY4V0k0MWFKbit4Zk5DY1ExMmRyRStT?=
	=?utf-8?B?VDQ3NTR4cGExRVNON0tKektleWk3ZEo1NndYMU4zTE1JU2RZQTFsaE9OZ1dF?=
	=?utf-8?B?OVdicEZ1UzRaMmtJUE1FTFN1OTVxMjhDNzBaTUEvWWloUkUyanZVazdTaTVD?=
	=?utf-8?B?OXNLNk1OZjQrQ0tOVWRQeGJCLzhXNENERXVaK0o0T29zSVFhODg4RTU1OVgr?=
	=?utf-8?B?aldYWHFCRHNUblNhdjI3dDJHZ0VPQWowdmlMZXdpWGdEWXdTQ0h0VUw0RXJ1?=
	=?utf-8?B?aWhtMXZMZERsL1pFRzI2QlpQM0Rrc2JvOTlVRm83WEl1UlBCM2pqVjVYaFUr?=
	=?utf-8?B?K21mZ3J1SVZCb1RQZXNXZ1ZXWlBoQ0JCR1E1TkhFVERmN1Y4UlR1Z29qOHVX?=
	=?utf-8?B?YmphTnNUa201c0M0SkpvWkNEN0h2OWVWMlMxU3JuaHJscjhtRllZa2llRTZv?=
	=?utf-8?B?YUpVcUNxY1ZQbFRQQTZzK3pOMW5pcGFBZ0laQVREZ055ZVluVGVPRmFMeXBs?=
	=?utf-8?B?czhiMXB3cHZtSzdGQUF3bHcxVUFOZHdhMSt3RElyU0JyUDFIbWx2Q2dVV3Ew?=
	=?utf-8?B?djM4MFc2RisyeUgzd1I5anprSFRjTlVOMVJ1MjJpOGU1ZzgvVkQzT0J6VHlY?=
	=?utf-8?B?RGlyc2xxQ0FxTTdiUllSQWh6SGxVNU1tUDVsUlhia0VBOERIMnhTZDh3SnQv?=
	=?utf-8?B?bFBFOVMyOTYyU3NCUWNZWVRRUW13SG5XU29xUGtWcGthek9MbTU2MjY0UWJM?=
	=?utf-8?B?cEo4aWNzay9Od1pjTVdQWjd4RzdCZ2RJV2dYUlpFS21jbk9UUHQ3WjNvY1F4?=
	=?utf-8?B?QjE3N01kYWNHUlpTUG0wUVp2MDF3U3VzQ0FZcUhTOXgyczZuejluRXpaWDRl?=
	=?utf-8?B?R0xQbTM0S0JHV01LZEE1Q1Y5UWx1cEJEcGIwbXVHcElWWDNzS0JZbmVrVkdV?=
	=?utf-8?B?NnpBbTc5ZUoyelg1Z2pZN1JOWHVKWndJOHczaU5RNkprenQ3SWlGdkdoRmMy?=
	=?utf-8?B?S0g5TU9tMi9zaHYzY09NNm1DTjYvNVIvRWFNcXY5MkkwZHJtRFlqZ1ZFSkRP?=
	=?utf-8?B?a0xGUWtPN2NBczZlOTY1d3QzM3hTbzZyZlc1SnBSUUtiRW1BSXVyN09zRlpZ?=
	=?utf-8?B?bVJNQlJzcXNqeE5jTGZiMnZRYSs5TVBSbFlzTmFyaSt6bVI4MmExdU1Rekdr?=
	=?utf-8?B?WWlUcmJIY2pZWWd1cFZvUFpmZHRuRjZVMUNONlJyb1dKWG9nUi9KRkJoSGZD?=
	=?utf-8?B?VlJYUThjamllclZ6ODM3NlJ0QnlFRmRWWCs3ZmhoM3AwOHZSbkgyeU91bUxD?=
	=?utf-8?B?NDJqRVV0aGFWY2ViTnh6RWxTL2JscGMxNkt0Uk5GUXFBaVcwVjN5Q0lYS0t6?=
	=?utf-8?B?c3pzN2JVMzl5bXBwdFl1eEcwZEpPRkpKRjlWbHJNcEM2WUpFRGxKL2xFTGFs?=
	=?utf-8?B?K2c1UnZMbEtEMGU1Z3ZhZ0EwbzZ4TUFiUTJYQUdnZHZNenU3ay83ZUc0NGtW?=
	=?utf-8?B?a2xuckxyaHJuL08yT3N4eVQvUnd5R0xiWXJJM0ZWV3RoeVNaczlYbzdESXg3?=
	=?utf-8?B?Y3pDbnI2ek84ZnF3Mnpub2JvR0FscjRaOERsZWsxTG83b2lnbUxBNG9JZkt3?=
	=?utf-8?B?OXNiZ0JGNEFRVitHTWc3dTZVeWJTSk51WjNUOFU2b3RaUU9XUTBSemU2OGV4?=
	=?utf-8?B?RlpvcDJNaXRUekhHNEpmNUdhWVBNQmhFSURNVFdpYzlvYWJJZndhWkNFbnZ4?=
	=?utf-8?B?bjdmVmZJOTNKSlZFc1VMbUJCbDJiZTR3WFNqU2t1ak5Ud0g4QmFLeWlxUUlY?=
	=?utf-8?B?K2l1K2RyZ0FtdjM3dXk1eU5uUHZiRnZwSTJ4TGErZS9Nb2tWaDBpRDI0U3o3?=
	=?utf-8?B?UHF6NGk4N0FqRkZCU3kyYUszVmVoNXlmaCs0MCtBU3JMYnQ3aVF3TGlTcnpq?=
	=?utf-8?B?R0NaWDJLNzF5VlRYR2V5a3REQm5DR0c0YklCSmFzajVEL2xrR2ZMVGFPeUI1?=
	=?utf-8?B?aEZUN1hMTlE3R2lKQmx2T1V5KzhITUl5NmExeTkrMnRsVWFlVzc1SGJJRnlV?=
	=?utf-8?B?ZkZPbjB5ZzYrdEFxai9zMnI4eDlJejJ4c2ZoTE5CMWdBWjhmK0IzR1FwYzJx?=
	=?utf-8?Q?6UvnQbUx2+5UOlHkVIiFd7hegfUu67lx?=
X-Microsoft-Antispam-Message-Info: OscPGGCbq/ifpJmgxXd3rPzvQ6iHRCcr7G2XDxS0h/DtNRl64G3MPHNftplnBmgUS2FsCbtVBZrzdOnazqj8A3g9ZmkEOu5tfSw23c1Spn0tnx/5NlbBmYXzubgllWV07Yi0htqmvmfkVfUTii6THfrSt8zYIILpb41S1e00RvLgB47dbTDXoJ+oA1u4mQl1
X-Microsoft-Exchange-Diagnostics: 1; AM4PR1001MB1426;
	6:M/Unc9aiotWqbeBsAIyPalayKy1aXgyxBdYk34b8jEFpxEv+ILxpamSpTzLBe60D9SLOtaDIV71hQ67fIubstgRK1rJe3drLS/hXbWYlmy9Ochg5QvXQSgC7GK7L0sAEBvTI9YIgCdamfaM6MwlXZrbsm0HqIFcnMALo36L9TErwbzBABaKK4IgZDrh4Og0kOgEKJKEgUlfAJjEYKCFLeKrmlUX1P3KpRo64B9NtdqBa7xqvkA/1Pmcdn4bk41EcoM6SjSuqyLpRuVo4YaUV0ZyjXl7tH10pd9bqVPKJVvK4ECR4+ybB9ibeZv+mdH+sboyceeCQziEl4+phKwJ2C1vInJy51CK0UQTfmhSC/YjpAAK9x0jXQ9n6etDjx02bTxAfYNwjFxgqFlL79eedqhu/5gM1p38Y8+n/cnGo5mf4a7BPcxJwbGjSN1pVg37qWpa9GMFPF0ft6r8rQ6zr6w==;
	5:UIWaBLNpT/BEA6Sg/7tLpE/DNRJG2NxHFwAwSF2Ls0EK12DT2LXGmoyk8fhfYcLvXvuf0kDTKU64WD7XDj7GH/R5oJw0YkCkXF4EzPriwrfIVDSN+lV2jDYpeataY5V7SYppL69qQuFIgQuVGsUcxlU8Wp+El7uKF29iNDVMFiE=;
	24:ypSVwE3RBrfQy6c9i5Foeo6X80OxlEvqLbuzg7dY+DILLz0FjRDL6MqyS0BaD2cizZGiVTX6e5HOcbxr40oVs1zAt16qA6s9IFpqxZ7rrkE=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; AM4PR1001MB1426;
	7:vMlXIXsGreWrsibO2BF9f2T+TufJALmAKODvNSDT3PL7H+d2lVKRP/UI4N+US100dP/DLClgnBELG+qT6VM0SOP2OSSD3mIvUOrM5iC2erdq4j7v2qgCCs1yj1Qf7oOZXeTNw1UF1OJjdgzMpwaXx0cCbJ45FsMdi4x+s+QBMZ1FBpPOgMqc8hgYvakV76zx1rvpB4UA4m6zvXz4qlBpnyBK0asamr4HCRaJA5Tw78uTnsXoH67ev/Nmb7mE9uxd
X-MS-Office365-Filtering-Correlation-Id: 05652e56-ef2f-48d6-1ee4-08d5c0da5586
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2018 18:23:51.0872 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05652e56-ef2f-48d6-1ee4-08d5c0da5586
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR1001MB1426
Subject: [meta-oe][PATCH 2/2] libgpiod: add packageconfig for python bindings
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
X-List-Received-Date: Wed, 23 May 2018 23:55:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Hundebøll <mnhu@prevas.dk>
---
 meta-oe/recipes-support/libgpiod/libgpiod_1.1.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.1.bb
index c2e11ad38..1bda8bc3a 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.1.bb
@@ -4,3 +4,11 @@ DEPENDS += "autoconf-archive-native"
 
 SRC_URI[md5sum] = "80237a047a9d653a14c5d71e5ce9d641"
 SRC_URI[sha256sum] = "9758466468a7ef3f5e30c182c1303abef6241e665cda4d82a64328a7474838c1"
+
+PACKAGECONFIG[python3] = "--enable-bindings-python,--disable-bindings-python,python3,python3-core"
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native', '', d)}
+
+PACKAGES =+ "${PN}-python"
+FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
+RRECOMMENDS_PYTHON = "${@bb.utils.contains('PACKAGECONFIG', 'python3', '${PN}-python', '',d)}"
+RRECOMMENDS_${PN} += "${RRECOMMENDS_PYTHON}"
-- 
2.17.0


