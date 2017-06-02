Return-Path: <mns@gomspace.com>
X-Greylist: delayed 144720 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 02 Jun 2017 05:55:59 UTC
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-ve1eur01on0113.outbound.protection.outlook.com [104.47.1.113])
	by mail.openembedded.org (Postfix) with ESMTP id BC4A860616
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jun 2017 05:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gomspace01.onmicrosoft.com; s=selector1-gomspace-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=cNDcwYTFAbI01CgMCeksIOfb3LgTAPYWEo2IXcWKlM8=;
	b=OtUoK/XH8o5AVWa1olsDwu+yERecipr3JrMXq9vFjFEbRu6DORedb9fkWyO5exKKEhKH/CjqQAhSMEcH2by8bR2izFUCRsfe6ZAVN7Z+tED3jIJTZPWs/wPE7EG1ANcuW1FPtfATlRPtRo4Bxna4nKFgxLTm6wRY2L0j/By8Ak4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=gomspace.com;
Received: from martin-Precision-5510.gomspace.lan (77.243.61.136) by
	VI1PR0402MB2783.eurprd04.prod.outlook.com (2603:10a6:800:ad::13) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1143.10;
	Fri, 2 Jun 2017 05:55:58 +0000
From: Martin Siegumfeldt <mns@gomspace.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Jun 2017 07:55:44 +0200
Message-Id: <20170602055545.20448-1-mns@gomspace.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
X-Originating-IP: [77.243.61.136]
X-ClientProxiedBy: AM4PR0802CA0017.eurprd08.prod.outlook.com
	(2603:10a6:200:57::27) To VI1PR0402MB2783.eurprd04.prod.outlook.com
	(2603:10a6:800:ad::13)
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2783:
X-MS-Office365-Filtering-Correlation-Id: 7eb03d8e-cbcf-41cb-6b62-08d4a97c0a8f
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(201703131423075);
	SRVR:VI1PR0402MB2783; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0402MB2783;
	3:Z/SQVey90le3CbpAE/waokyQmABD2khu8kBkdbF8ygzM6nT1wUIeEPTWTycFz9Ee0fF2+gcyxWqVHc5gMdpcY4XBdbxury0LEe0xFdSLWrmdPmM1Lm8bP2HHk+uCR1yucGg+AC+6j4ouV6ui2n3BsYWFiaVXOe+p16rmfZ0QUTJ/e1J9wpuBsAf4mro3//wUz9JzWFOOeAr+uG+fl6h089e1Lk+m/Ge4mz5Mb0d3c7RMZkiGCwTG1438FfBa7WNB+DgqHx8AyyeXjyKj6jjp4YVwftPXjOHclpnWavYDnZI=;
	25:gn/RGQG6GOA2Sua1SYQ8DlxPFSFMbFBF9afCRw7oKwd2RCO9G2FBQ7351yogpTjg+JFxagqg1OPuE3uBkXgoH5Kt7AhtKCFa0iBQvNltbGyuEUett01Ld6LkSt+/6DXx065dVMdUM7jXjdBWzqhN8dF4H/FSs/5zXOAIYVXmvNAZP2Z9SL/Uevp5GJDUb+EQa/NcqB3oI3GYDkHVS4PO81FBHBFKdfhFHcRhWvX3WG3jeMSWwnTruxJ2H5hlWjtDK0baRXqku52zGpz0deOPADPYSI2XzOHsC/siq/J82uX/g9oWoSYMzXbK+A8LrJPnztNydm+7u/KTGrQJuU0tcONp4hpJ75dOP/PBqe5D2VqbP3+rnbfiW/iMlNaK0dTU1n8oaZ/ylIbOuQK7ru2TSF4CuLhQQs5v/K7uq56PykmoHwuvXSO5r4ZU03730QD3AEJWZh8HcrCTeSZYu/tPOHuAU7znokWGXMg3sULtQBA=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0402MB2783;
	31:M1HNWG7oQzgRr22skeM7+I5RQKrcjsbjk1Y6QYmBarhcHD0G8BOZzQrmaPytMNcoXHarkizfG24JojGC5eRtI5icgF12x/s8kGB+yDJXdMqHwAu9ahpooUxztlgOyk0UItp09YZbxnccFRjTHzEAiaD2box9jZTvEUypLTr2gDSKyPYndQr1iJ8DRwC4IVdE+d0We7iEdGlwgaJDQgUnHqMs/K9a/dT6QG36L4+wE+xPKiYevE0gWXqo+ZtfZiNU;
	20:oWP+RwvxeDLPH5E3kEh7feJqCz2BA9FJCl+7/Uwdd8mvk9zWXtstnJrIkVo+2qToBIukEKCbb08zVowoXZpRPSrZtAzuSobG6J6LZt4YMsSKh1flvTxqxa2KaB5NQsFTHthwrx7N+vzTyv5zazcw58wmjjEFdak5Z2Q270qpgoGVOAOMMF5oFPLDgLgR/Lk7R6j6dbkdAJjtVBLoD5pu2XSiaq3AIQY1gfbhqgm7i0NN9VfhbjTIfh67gsgHx0V0Ylc1KplqXPvyzYNgc/qK1yOTEj91pFRNjgqCUH8s94eYGdeZuPXzzywdIrJ812LkoMaIDzlPGPg5TGGnOi5FOfIZRnVqD1SpnGuv7tNcmkxX2t9TYimCgczByn+kNJ3VXAeM85oY9y+Bv74fjW6nIc31cw3eG1dF8V1SHjDbCzp0osrys55D00PrkkUQygJq
X-Microsoft-Antispam-PRVS: <VI1PR0402MB2783B549834FB41E25211C35C4F70@VI1PR0402MB2783.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(58145275503218);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(3002001)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(6041248)(20161123564025)(20161123560025)(2016111802025)(20161123562025)(20161123558100)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(6043046)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:VI1PR0402MB2783; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:VI1PR0402MB2783; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR0402MB2783;
	4:LvYb+Fl8TTX8sCJS3hr0NCxgq8QPRWMv9c/aO4wt?=
	=?us-ascii?Q?LQ77od5uYpMBF7Rq0zC6skJIffMfiA8LOUDtBkQtnLrO/7WaTSA4wZScv3Sv?=
	=?us-ascii?Q?dDAhGQaAsithFYjwwPHqHSS1YR1aJRNm/NrU21Xl8GxaIpUdfBgBFMDdlyKl?=
	=?us-ascii?Q?M2QEilD/c0wOn+xVyskUMnST2VLkTDYfvNNMA7zy1RbYIO6Ak+jPWQzjuqeK?=
	=?us-ascii?Q?+jkVAMyeKDE06YAhv4RgXrHp+mJsNkZETkO3/UR1dbSXHROVgnyE5YwKq7Ki?=
	=?us-ascii?Q?QYX62WTbDiFcq60qQlpT4iAQ0atyI/raFE6j7CqNQmoDPqXupWlHoILtKydX?=
	=?us-ascii?Q?kf9iUS9a8IIzlmqeKETprStIoyDyRShAwmC6fsXjrseH1kXgoEJO9WMWy2Hw?=
	=?us-ascii?Q?AsU0n3D58wwhg7JhDW094d6iPOHNx0DsXPdpB1l9JzIKOJeljOoiAykcrWpN?=
	=?us-ascii?Q?oyhvOA3mbd4iwMyvpEs7NvO0F9HBtz530tDpBUAgXIS4ewZIPLMiun66arFC?=
	=?us-ascii?Q?t3LUR7fwvi2lKJ/M0/lGVGNwWEtWWuxxURZD8e4ChJ2xL3ZqDDp41kSCvYvu?=
	=?us-ascii?Q?ZV4PuR63R0Tp8MGwJHp/OH5qDdg77C8G0ZiKVFlCxI3S89m1UOxIp+7VMH43?=
	=?us-ascii?Q?qg7P+ymm6zpnydEsDJZ0vlkJfokalHwdEQc5Yt6E+bIG/FWlwSG6CBXILfH5?=
	=?us-ascii?Q?5G/+UNC/mqkp8Hb6Izll0MPY8OtUFE9EzOwthZNqowyxxybaNNNPztzFSm4m?=
	=?us-ascii?Q?pY8netkIcKek40ER/9PjC11BHJZNCfZBqM648I8+O8y+UM6pW+nEHZWodKjd?=
	=?us-ascii?Q?f5FlBIRM0JPtlxb455kOasYd9l9ucxprjQn9L9zPrYfMh/iUZGTcDWTjJ1r0?=
	=?us-ascii?Q?qPBi0J9m7V4fGjbDp3H194Z9Cgrmr1k7YqvfK5ell1HgAT8aPajYC8jdf2Ah?=
	=?us-ascii?Q?NDhPkSkCO71bcIkmTwHvps1MKeq9jB50eBtFwTo2rzB96B9qV84jGxFHWAh5?=
	=?us-ascii?Q?W16uexjzisu75USOPoZKKus7ju45g65ZfCOOAQVBGS0JBTB+6MJE8aODCguN?=
	=?us-ascii?Q?dTZFg0qhGHtIvEAM/pDsB4K+/gVWl85OLXsGdQsuUYJd2VWoI2KkNlv4u44j?=
	=?us-ascii?Q?0+2mPK/9lR1+BTrLJKfTjoxtTsh8Rj+uO4GTv9c9VZcEMIitTnwX8IDgEdXv?=
	=?us-ascii?Q?Iwc23Eex660v4p5Wtiz46flWWWvYRO6toyjWixcb+2YLhOX3+vUF/sDHmBqw?=
	=?us-ascii?Q?GYzdJvZNP6iSgvtSC8s=3D?=
X-Forefront-PRVS: 03264AEA72
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(39450400003)(39410400002)(39400400002)(39830400002)(25786009)(36756003)(6506006)(47776003)(50986999)(53936002)(6486002)(189998001)(38730400002)(110136004)(53416004)(6512007)(478600001)(6306002)(54906002)(5003940100001)(42186005)(6916009)(7736002)(86362001)(575784001)(6666003)(66066001)(48376002)(2906002)(4326008)(1076002)(2361001)(5660300001)(6116002)(33646002)(2351001)(3846002)(50466002)(8676002)(50226002)(81166006)(305945005)(42262002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0402MB2783;
	H:martin-Precision-5510.gomspace.lan; FPR:; SPF:None; MLV:sfv;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR0402MB2783;
	23:EYeQnukMs9wbM/ja2dDwtUsxl6IoiWrb4zcr/AZ?=
	=?us-ascii?Q?KZh+MiyO777eV2S53UHRBNgoAQDHqclqqb30AA2Ywx06OHzxjbrC2AIa3nWe?=
	=?us-ascii?Q?pNLGbQ7m701WA9PvITnA8vdRiU/qZJzSgxXzl2YUQp9JNwuxpTy8wp/GL00H?=
	=?us-ascii?Q?fs0WNUPU2B0XMYPxSpcNOmQiZnJv86eAUlHdnoEdMvGdLhFJiaNeqgMLVOA6?=
	=?us-ascii?Q?3PvAelsqQ5t8nFu/gvCTbcTgXToSgIMqgSHc+mg3xYGbj+G57vs7+/MWKS8F?=
	=?us-ascii?Q?kxMg2AYu+aa6seXqTWx//+0qjXEgnqtnqbIhCGn02FJTPk5lSJbkS0232P5n?=
	=?us-ascii?Q?nZ8O+DWUCJvbDk+Zl4GQLT3/ZF6I9L2hhuTqcB5SXyU1wHqCCIBOcxgn73t2?=
	=?us-ascii?Q?OAqt70uFni1cIXMDy389CFRHLYELaqq9dZn162e+mLjrCJX7lBMudSkPjpEm?=
	=?us-ascii?Q?tUN1sq1RvJuL0T3jiqdV/zA9vSzSCmfBh5cYN7lcqJFrwYbxgc/N40901kLe?=
	=?us-ascii?Q?5p7kxjK/7RGUqkobiuP033UfrI+eJjCaF2Kioet1voff0T7qVRMfKlXe3djP?=
	=?us-ascii?Q?PxV2sGcPpFgPw8Yb0Hu3JM/ImUmBJ6F/NuCbTvj4KASBRaOErd5JIKven8+1?=
	=?us-ascii?Q?j4R1uwW0/KXBD2SNU9/EmAae0sdr1OHhtNiUrw4qE79lFTbsetMPgQX3a7zg?=
	=?us-ascii?Q?0jkV+XDOsKiuOWsORF7ZOG8yu962S+87YtHJGJxmXKeqXuBwpQMw8lW9J5Ld?=
	=?us-ascii?Q?vkTrfBSQZvthWxrEu6jMcFK3j5xVHePtOpI8ypdae7AjPJ3gL+MFQHA34jv5?=
	=?us-ascii?Q?xdh5ojU8WeMta5wY8vjPT6DGto1+znyRMW6BvvXY8WqfsWdDg4sU0jdBeG8G?=
	=?us-ascii?Q?fYJG04Aysgqc8FosegQftF0CwMC85DPFXinPdpfKY4leurTF1ZSNRMA45kij?=
	=?us-ascii?Q?GgIaKhqx5k2lFqYvcK5hrX52W5hVLJrsCdV2oq7DQZ2beSamnBnYjYBZY3kK?=
	=?us-ascii?Q?S5EI338BJqLbjo6P43UvphW8AqqCr/Uzjn14B33H/4Of6G9iKFs5vz/fPD19?=
	=?us-ascii?Q?F7c2EkIA6AArfKHDFJFiZzzSpOsmEVnw8S6gbW6VVORX/KOEGDFVsDNC33yS?=
	=?us-ascii?Q?Wi1+AF5WjU6Q=3D?=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0402MB2783;
	6:tqApTj7YK8j/69WYB0kG8Km7bpqOU6FCiHSZ7OMl0KZ3NsWMHTlzqPUfwfYaDc/20vHHWkV2rY1JtUiq+pumBKL7Dg9ZCCnlV8uMHDM82DPJZhS72JWiLisF3GEvtcw+DNZZpjmVNTQ+0V7RSMDR2E9o8Cy7HI+4ZoLua4MqpQBm9U02w/oo1MgcrYFNAFdJYiJpsypMc6oLzZRQ/ZbROBQd3ao7VwjiIP5/GlltV5QBI+rcWzLGAD6UWD2K0WCQf//YvptOVnx6PkmyjcdtGSGYdjIKrdcoagpTufKow10d3yQkpkhnBcHG2hIHEUBim8+auwApfZBlfask0mu/EMTXc2sKnm4aBEEV92GtqR8iSmIsm/W5acwW1h33ywBqrajB3Xpx0IBCE3WBgkSkB/US5bvcmaMUxIdlKIgj4N2ZEDzzpTwCoNeU7j9AYYT+l3x57HN+K882Z3IVTr5vb1agL0xBat4yhxzf1C/T8hCf9Olwgt+OdHvv8Y/h0GXdiTlpxtwrufp0eB7G3/jtAw==
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0402MB2783;
	5:1wOfAf+s+thOCnjoj/YS4S+OYX1N67heXG7JJ3lMSKjieikGAtz7Fe3zHdbJwv71sEnXUBmwvhH+7016QNmj9FHqfHDWIX0CnFuj2L1jUy5QwuMuQ/DJIVWCQ7SLB2dp3QXNi4aHv5avi5bUzLanO8V4++mYxYOrKixFt5v/z/G8FfI4si6pZ7u2swLjnBkykZ7Eus2ST5cyAuWmI+HzhZHOtOp8jBxJoJNbAEWrilI3Jj5gqk/DIyhO2k5s8lCkrcpkkMwtk+B8oaT5QUgDUjQP6DIDwaZ7ap/0tkiYKEkwk11x+Qpdgkky52KZYw2UBQi3UyayjxweAPxoz0adI4Ap3Rqwlwn589HFvofGPjOas5/uQIvUcYHnHozYyPMlfa7ZALEBaujcmnOMcz8bkmaOJtUJFYhbXPm7u9INqghzDatan+R3wpfEya1GmxEgm9gGCWUidroEKv+B9Lk168a0/EoczjLaeYy1xCe4degJd77YXPEVOM45x1XYEncG;
	24:yEHxbYI/PkRzrSoioKgw/AblQJ1A0Lcj1VfQHU5E5Ekk4/T7MBxifzCybJm0BTldYVy8YLiKYcycMlUnzSlhNiDqKQ6BqAnEjKZJS7SlRG8=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0402MB2783;
	7:6041q7mAvLfD44iPLVtJoyagi9EnMvdD1h5uk4G9Pf2tfBP4LqiIyfCH740+SUwobdO8GYF0OF0V0Y/vaFL4NXsqdC4Asw8YZP+uw7MKpTFYcoM7d6U1lcdu6jXCcwfJqRJbsLjAmHw8eOiy5BnaHnCV4jEQ9b2NNkppQGK1MHZiY2ZPzUONiQ7hsvglWIadhqW9COfW6ikI2zbud6UfwALWFW4vMHccTrQIDz237p9657ywdgUk0/r2cOBzn0Hck3pgBxk81y7Mr73+YlFdyQiH47rdnO/QqrCzyAZRBdlLp3vLepPmJOIvrGejHDEORNK/gJDq1lTt/YZ3JleoCQ==
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2017 05:55:58.2417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2783
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: [meta-oe][PATCH 1/2] devmem2: Change source URL to regain access to it
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
X-List-Received-Date: Fri, 02 Jun 2017 05:56:02 -0000
Content-Type: text/plain

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Change URL due to connexion error on the original page.
As the header of the new devmem2.c source file has changed, change the
signature and the LIC_FILES_CHKSUM specificaiton.

Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/devmem2/devmem2.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb b/meta-oe/recipes-support/devmem2/devmem2.bb
index e48cc92..c42eb5e 100644
--- a/meta-oe/recipes-support/devmem2/devmem2.bb
+++ b/meta-oe/recipes-support/devmem2/devmem2.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Simple program to read/write from/to any location in memory"
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://devmem2.c;endline=28;md5=dd68f2b0a5184b3db3dc25c99e0bd0cd"
+LIC_FILES_CHKSUM = "file://devmem2.c;endline=38;md5=a9eb9f3890384519f435aedf986297cf"
 PR = "r7"
 
-SRC_URI = "http://www.lartmaker.nl/lartware/port/devmem2.c \
+SRC_URI = "http://www.free-electrons.com/pub/mirror/devmem2.c \
            file://devmem2-fixups-2.patch;apply=yes;striplevel=0"
 S = "${WORKDIR}"
 
@@ -18,5 +18,5 @@ do_install() {
     install devmem2 ${D}${bindir}
 }
 
-SRC_URI[md5sum] = "be12c0132a1ae118cbf5e79d98427c1d"
-SRC_URI[sha256sum] = "ec382c90af3ef2f49695ff14a4d6521e58ac482c4e29d6c9ebca8768f699c191"
+SRC_URI[md5sum] = "e23f236e94be4c429aa1ceac0f01544b"
+SRC_URI[sha256sum] = "3b15515693bae1ebd14d914e46d388edfec2175829ea1576a7a0c8606ebbe639"
-- 
2.9.3


