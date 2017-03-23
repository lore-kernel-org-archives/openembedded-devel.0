Return-Path: <tom.hochstein@nxp.com>
X-Greylist: delayed 12856 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 23 Mar 2017 22:11:15 UTC
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-ve1eur01on0059.outbound.protection.outlook.com [104.47.1.59])
	by mail.openembedded.org (Postfix) with ESMTP id 59B5177B83
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Mar 2017 22:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=HPi/cH5sVGuB82vixufmcaPShq9efZl2Msha1+0KX6Y=;
	b=ucdx7x9KxQXdJWeIhGmzKWKQ5S0ZSUz1PGQhs9UfqTNQrezQ5T1q8C/G6PBojJUVIlEb7IwZC1dFXu9EUIRVKtlWLQ+WS7to71L4zbowAuI2P3Ud/PX/fiYnOxLaXznAPoH7DvmBYFvqERsELnxLnSSxyJ6O+N7Fc5v9WNHBNWc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=nxp.com;
Received: from tx30imx-01.am.freescale.net (192.88.168.1) by
	AM5PR0402MB2817.eurprd04.prod.outlook.com (10.175.41.136) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.991.14; Thu, 23 Mar 2017 18:36:58 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 23 Mar 2017 13:29:20 -0500
Message-ID: <1490293760-4372-1-git-send-email-tom.hochstein@nxp.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.88.168.1]
X-ClientProxiedBy: MWHPR1301CA0020.namprd13.prod.outlook.com (10.174.164.161)
	To AM5PR0402MB2817.eurprd04.prod.outlook.com (10.175.41.136)
X-MS-Office365-Filtering-Correlation-Id: dcabf422-c852-4a17-cbe6-08d4721b9749
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(48565401081);
	SRVR:AM5PR0402MB2817; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2817;
	3:+dzMh6GHjcyQnttt83pZvf0NLWvu8hFmBE7dYFJ8QGrIzK+XtSbZ+G4Kbm/qBgzoO1y5oIKoELriki/tyhvUJ3b2OhQ7j9rteXKUd2Q9kF+ZvR851N9/bAzl4yP1lHYdPoLssPaF3ZhUKEY7mjoPYIPPZYmHqFYz2wEdKquAGhXTvDYWofVmgiXbS2toIT6TbiNnRL++OBVT4Gzi8pUbZBpl51MmRQHcpjMUHckF+veZ97qxF60nsQZTA5blKTIF5/dvZbm7TJF7PQ692Cz/Uf0Fh8ZbV2ClCkydm25i3aY=;
	25:5qhgrNmUkzgmURDh7o57dhfjoYj8iKACi9uYiYDAryc923OoDK4nyvc3vbUUcQ/A1rw40qL0zd95nLzvQ/4fcK6fr1Hve/QKn47E1bsh2aQmmRh/1DgsIm1l56IY4W1stLIn9KhbDXuO5phFXuihdPp2bY9M3auBQVD4hKYYrbQ4wAUO/y71uq5lL9c/8fn3xdtzEqty97zUT/tW/H+QVQwwHqlC22q2/O2LI274zVwVCIQtWfNwXk1GWyR44zvWcO4QMqUcALyQrOzyqJPlwo9keP5r8XRPbAFHc9JqRrGpTpiFicWS3qUK49sHry+T2jlP2mvzI7IHareYZqXFjqqEnZE0xwYTtnoqbk7N3av5TaO3Iz4r4aZHWz06++qVIGSXJfM2ymNpp3IfBKyZse3u0ZQoD/JBW3uCGfJKyyvzocSrMxpuY3tzsb6Nz+P5KV9uuWlUlYnOQYAv70RW+A==
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2817;
	31:KHPLSgFtkrMdj5/RhzLxWJRYIaHhfrRCvxpckd+qZhTv3+2A5/cfM2jDnT6hbKKeO9DcgtHZIU+jtuyRFKncrjSTbSaPvFN1AfZoLFLaY6NDvJgIkY4Ait1l7VWoinN5lRHJYrjK0PWNvvM0tpw5qKEj2hjq29sbfmuT8HbeCwZSFfHr3QSrc17GXeQOdYWXg3jMSxc9eOMVg1LEAsxFTESlCbvtP3YP71u/d5q7EgOvtGVRAz+CB1QTG1I+Y9orQsDDeVY4JDaEity9TTAW1/PGRLH4iueU3uWVQyIARz8=;
	20:GB7z+UxdJWrL5qDxGDq4V+c6BhMmS/TCMYULROE9u/6smY6NetATojhiEOXIaSIeGFK5VJP0QCldkt5lRgEeHmsrwPscPZ+3TVxr47uy/zGqQFdI4OASAfdEOLNp8WyP3eN25vLKvThpPz59YzA5nO7NBds2vFVH0ouewWCmcwaXkS8Cww5fgJ++ghrFo5FCnHEnD0XPXlSeGSN7MkMLZGKlxnXpiNU2VZ3mgERX/hJ+USMZICmeIQQsA38DIz5fJLMvFzZ/BwnZqngxw+pnQmoPJMMUbxWgmkgCATTa1492YKQpssBYyMwDaFkBfe2KMawryjOxILucldpGikLP7lkM2sF7ogbd9i2yPoSW1Zm76mamLkBJbWrliEXa7krmcLgFT7azesoP2i4xE+GxZNUmmfcSLdb2W6C9z1UdPB0eTPy4YiELNeZle5v8WnMl2HQLUsTfOKUvqHuxN32AkvczE4gsp2YYTbGQ2lkuLtjJCXpxncHWPbp0JGIWfEBd
X-Microsoft-Antispam-PRVS: <AM5PR0402MB28178048A76C08B8EDEBA50AE23F0@AM5PR0402MB2817.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(6055026)(6041248)(20161123558025)(20161123560025)(20161123564025)(20161123555025)(20161123562025)(6072148);
	SRVR:AM5PR0402MB2817; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0402MB2817; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2817;
	4:UtkIAnsDoRCKKKbY2ta2wIHtB28fTz9v22tU+rW4H8/PpdWeJngg58FbF52DL/nxUddLYdKdkihNSOG9rbpHs3L2g+5XLme0o4W2cLo7gobmAHMu6++06tlj14hX4HYUwL+9EWL3PhnYVNGFCwNVQRongnMucLF/FMBW3JakGL49GWcjgyzZIR53SAgq/zIy49/52QJ6fLUMEWEBGCB71tOY5zu1BmXMNHHDlz1sTwqgTJqAXH/EtbxArJpAjs0DJlNkB98geDx6dLr74MxkDwKRYNpZ01CO2l5iaoTY8ARIwST51dnUikvys6DLWKXucCZlX/BUGqeyUpq3hZZr4QzK1E5pAWtK41eH8h/eHfAXMqGya7mRoN9rkYMZWXClmR7jbD3LRS2XHlV3NFZCcp86tkLhrUelZY9yJgKF11TpCCNYc3SPuYf0xpe7I2Nu/QrmCo8UBlEx7a/LBsEZWNyvPi9833aBQXryEL5IJXLyyFlZZA0+WXdtFA4tJmckKC1U3P0U9E3M637nHE+5/8fmsVhAYh4togPiMdmpaM0XBZotsCrjhUbu2cJz9Vwz3uO7+UX5Zs4MEnc4ZIUl+/wFbZqmG75eh97c84d16sU5pDsmA3BrB+0V5oU3nvnSGMJbkKvPfNgKN+NEKjMu6JprN8kiSaTuZaRiU41ILYk=
X-Forefront-PRVS: 0255DF69B9
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(39840400002)(39450400003)(39410400002)(39860400002)(39850400002)(50466002)(7736002)(86362001)(305945005)(6916009)(6666003)(110136004)(50986999)(25786009)(38730400002)(5003940100001)(42186005)(5660300001)(4326008)(2351001)(81166006)(48376002)(47776003)(66066001)(6116002)(3846002)(50226002)(53936002)(36756003)(2906002)(6512007)(6486002)(6506006)(8676002)(33646002)(189998001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0402MB2817;
	H:tx30imx-01.am.freescale.net; FPR:; SPF:None; MLV:sfv; LANG:en;
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM5PR0402MB2817;
	23:4Z56m8xyDfzxOUbcCuk2Bo8Mas1o1PxJZI2D23l?=
	=?us-ascii?Q?QOUys0Ccx5GPmJrARI6InDI6wdO3/piHJZzwKhrIsWfZdDYKCEwIWh+wvXy1?=
	=?us-ascii?Q?phdmK7z8dZvVwzb6KJdR8+wZmefWxXcZGxpWiDA7r2QA4E7qcIorwnTTvy9c?=
	=?us-ascii?Q?DbcI4XEuy+hW4dJVnBd8/pAvzJqGq45mU5a91G9IzpjrLkFzX3bcqM0q7ckJ?=
	=?us-ascii?Q?vTBnJgsUgRlAl0OtrHYwzwxrNU0mDpsKLp6zT8Bx57QzHnNXsKqBQO2EXr8E?=
	=?us-ascii?Q?U6UwISYwr0GK0Y4zXiTvv+XAxreRnbP+GTg97gBUxh78pNEdFXj+rEKWuhSU?=
	=?us-ascii?Q?IpWRoEo4bmr5F2NF7DUsPE6j7r8r2o0PYNfaPbjvXyCmg/B3SrqLtbvwegeA?=
	=?us-ascii?Q?rcj45/8NGzhfkvTWf7ZtCm1S/uu+NA1pmEdt5N09TcgBKbymVRyu81HVSwwS?=
	=?us-ascii?Q?BBvvNMHILM397w+rBo5wf+rRCMgBPqQHqIJybbtenLuBDTpBWUqZiLfw2SMD?=
	=?us-ascii?Q?Wk6CwgXHBJY8PuFXzRHHuMQmKTNaKKcSj1+uJUkrm8ZFWFI/oBDC3m80O01P?=
	=?us-ascii?Q?r6jgU2l2HkcT4nBrZtAGmMvL+yHM22R3wP17F/ynGaWLbdmsYh+UieR+Q/rJ?=
	=?us-ascii?Q?0kanQBQjqg9aSpuGpBWRvCTqPEwR4eEUg5Mn9+bbCct915EVsLvqCZeSodvv?=
	=?us-ascii?Q?RT9f6auWbvE0rGrXYhCAVi7przDYE4xPRdiei/I42a+tBXs1TzHP4i9nvGxS?=
	=?us-ascii?Q?6jNi6cwy35nkYV+gnM6J4NlKZzoEb+SdZAXK+r2FBCAXyXa9MzdDq7Ig7v9o?=
	=?us-ascii?Q?TefRMrNopJ4oa053FcotkZHrhGTpRGCW7sPkGCf9E+B6gpSJWDQoiABxh18R?=
	=?us-ascii?Q?jxcvugiyU28fhiauOXPB9ngcaoShLLCFO9/3OHHGcNrd6Hk8kved1Y7NAa6M?=
	=?us-ascii?Q?hcfivMFh3Zn66HnQTz6OrCDIgBG++nnq9PvnW7nETGA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2817;
	6:+tFu5von1VL0Uy4SCAZ+gpM5mBubfShrzp0w9M8zFOQnIOLO/utYlTUOtQzz7jbfvDFpUb4EY49+nG/Hjfl7VGvUPMuJFSGYkXAEHFxXxdA7htnegIXHOG9Rl5M1MYfohCoFYiebL7kU2jpnowTobWOGiklYcCtHnxc5367N0Fbnfzlcf1g6MXSo/soCVoc8yr5VbZQwCoJfLvNleKIXEvD3x0yhRVADb2hKPoCXF/ZqmVAm332JEXyjnEym657UewRJug7hvxgzJTmh3hyxLHyzL5qW3kwMefWiSQdL4x6cilMyT46eEYDE+u0IV8PZ/UMGjmtB81S42BJ9vCsZOAs4UmusiS4vaaNU3aHWOAe/Gq8Lifa/RTBNsKO3cU3ibnp8KV82b7UE0IF9MLrc+yEucYTUSzVitox6e8cPoyk=;
	5:ohBCaZgHp7h1/sAj6ng0pSWy5cNd0PQZOaGyWJQpIN6SwOOxuRSlhFIrKYsUKpErXS3vfUUGvaGisU82NpXgJ0WgFcXhz+szM+1xO2GhLZgTsSN9qyJMVRUUjkp4t0UVUb5VfYYd903JD+WkIjhJiA==;
	24:M0lht5QkfvkktU+2wAJ3C+9P0TRpV+qu8cvOhuPgC30zs2P4ke5v6xq8txCPTrsqn1SZySE5W7/dVlQnmMJq/pGHi5evKYUvtmbeap5arwI=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2817;
	7:tu4QuaAWIsOPmY5U2QrNpTe5Q8Ai7WR5gCSt1+20CKZG1gjaV0s1ap824pf1ORvX79+FTAxQ0PBoWnfEVZ6qmj2qaSiLccAuxGAH1DJcysIE7o9LMBmtAIJexKB1uwkpq6RNIuA+S5lMq6709dRL+Kbk+/Q+ETXkWtipsj/JOfkj7u/7kUTX/FS0u5wtw1NDRKKsFMSTilY1mZX9UiNyfFfziDv8GGIkdKRZ7eunRqbl7nXp15zzwk5OuGHYMVrVxu7V6d79fjmWdyVTWUGs3BKqJLgwlbzQ1ILTxgGMpAH5MBLbb6NIBlmms5gwXfySR+3cA14tJ4y5wcBkttwhKw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2017 18:36:58.5865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2817
Subject: [meta-oe][PATCH] glm: Fix rootfs error for glm-dev install
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
X-List-Received-Date: Thu, 23 Mar 2017 22:11:17 -0000
Content-Type: text/plain

Since glm is header only, the default RDEPENDS from glm-dev
to glm causes a rootfs error.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta-oe/recipes-graphics/glm/glm_0.9.8.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.8.4.bb b/meta-oe/recipes-graphics/glm/glm_0.9.8.4.bb
index 2a78c46..2d2e9ad 100644
--- a/meta-oe/recipes-graphics/glm/glm_0.9.8.4.bb
+++ b/meta-oe/recipes-graphics/glm/glm_0.9.8.4.bb
@@ -19,3 +19,4 @@ S = "${WORKDIR}/git"
 inherit cmake
 
 FILES_${PN}-dev += "${libdir}/cmake"
+RDEPENDS_${PN}-dev = ""
-- 
1.9.1


