Return-Path: <neenareddy.busireddy@nxp.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0088.outbound.protection.outlook.com [157.56.112.88])
	by mail.openembedded.org (Postfix) with ESMTP id A618173CBD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 May 2016 21:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
	s=selector1-nxp-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=otou4JGQ0jFxx74rDNf4zLzv8Hzmbyx9uWLd8XSJ30w=;
	b=ROcz7IZ4RlK6on+j/yBCEdqVpWv+5sFHwOCKitNg7+jf6e8T007Dzgq9DLCw5Ilrbla0eajocJtDTwFFNDTl02ZiKSk0es6o+T6Jmf2ppvqzx0AXEufywRZwdOzSoG5mMyKh+RwEaJQIqee/+IkjwrIy/xYRgWYXM/GcHGNbGcc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=nxp.com;
Received: from change-01.am.freescale.net (192.88.168.50) by
	HE1PR04MB1578.eurprd04.prod.outlook.com (10.164.48.140) with Microsoft
	SMTP Server (TLS) id 15.1.497.12; Wed, 18 May 2016 21:24:45 +0000
From: Neena Busireddy <neenareddy.busireddy@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 May 2016 16:22:54 -0500
Message-ID: <1463606575-24741-1-git-send-email-neenareddy.busireddy@nxp.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.88.168.50]
X-ClientProxiedBy: SN1PR07CA0041.namprd07.prod.outlook.com (10.162.170.179) To
	HE1PR04MB1578.eurprd04.prod.outlook.com (10.164.48.140)
X-MS-Office365-Filtering-Correlation-Id: 28ad6b97-6dbc-4cfb-e41b-08d37f62d5c6
X-Microsoft-Exchange-Diagnostics: 1; HE1PR04MB1578;
	2:JVgJhHu5fPz7enEtbXwytbUkio7KY+8fWRMpz9gydpEKzP5XYzxNaH8XGH2FtgRF/98w213mqZtzb98Ahtzm/mHWL7k9j+cXzWla6DiCWI5nj2hR0DQJXSpiAwITjVc4NWr0CCk1jFIrqa8Wffgs63Hyi68bAj3iX//k8zrDblOU3Xj7fg0NyXu4oCi/xeIL;
	3:s++rJ86Ipj7UMtq2pOoOcB12u4px2xxmnHFf9Da7Ma7EPQtdC14OlyNQjoYHWtbiICXMyAi5tu9wdxiZilpuds5VuLSi5ytheJpnVaGqwxSHOcug9I+0bqeQu0aQkWK7;
	25:sbolNnudEvADmb1sW72l4SanUvPOoWRANpSRbV5v2SeXuuGfmQjKLCgwGuuD8XK0lUqmRDQKRasCAzm5zF7SC5xuysSDXYMwe46jqWiFw4zm06gutuoyh0vRICif8XeHYbmgvakct/xlY5fOe97Rypw0KgzIL+UHVxUWSgynVtsw45TnS89F+JLgcrh9bLynBRRmS/jMQa4JQq6eKl0I1zqFsj9E1Jzyt4LBq9OImFfsBjKfLeF55trzGwa+lWao+cN14qrVVA8TCK1KmxBYKgaFudQaY1oacx6gx24DjxDadhW3G9JnRPSRnWuF0rBHukk1T14mxdodDB0x8wYaVNhqfbBmiDH+c4rCC/5jHJeVX9XuI1VGER0XJstnHsOmgsYJCiKvqw3AoOz7bIq7kLEs7yFDjHudJGBV54X7SCo=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:HE1PR04MB1578;
X-Microsoft-Exchange-Diagnostics: 1; HE1PR04MB1578;
	20:0mmnlzQGddwiytnoNlOUuwIbTXmM55ESTNF3x5+VCfYj+TLyj6zIbIn4JFdmwTGNSND/uuaJwwxM0JmdijkBt3j6igH7oWvK3KS6rRY+JH/h6f2RtZDF7V9K1qk6kn75NbsHVJZu69yHkYeofJlwWJoExAeX0OCuoeDupNhNFccCeNKhlTEW7mTDbQ4RShLAMnx8AMhqH6V95dR+Cqwez0wz55xkFjUnt5FSOJts3KatYY3FnXn2YLs6fqTx82/4Bd0oH0x77Gs4ShFVmgOy2fieINf5QJO0QYeJTlpPZu/MUkBYSrmiNNGDmcb04gMJc8kkxuAR52HtN83DGgmpiXHEsA7H3eDQb8rBpfMN0KNKLV6TjpaaMMF255HHg9QA5oHSXwQpmZfckw6j3gk0JpjmoCUyM0v9Fa30LPGFyVkTBoyVm5V7bT1oGhhzPTZV86DtuZyDn+YyRUQdhHIxdtzJRVjcfdm4HZ3jAqmgNWd2ZaE81fIKNjU2OS+Nfqkv;
	4:ayB85I1C7qOtwqvqoz6Wu1dYD9WAsoU+7BqM89xo8EheKgKIFvYPUlyFVYvAkLSfQGnBRWW+Pt+KXeHfaZgwVfdn3GdeTuCu/ZIWUSr9tqc/TDmSJkpu8OSpffCuMAoOg/xziYOq7Np0UvKKS2mWVMmDRMim8UDZWWR+qFZrHDebsShsLdJ3xf0m5QWeB/63u9Siu9nE3Jhf7QUFtLRhNrWleq0bhhUdybmVqsYkSg2C9PQWNLdueqizpu7pD4z3BapuL3V1qurWYjHdE6mxoetTq4tgz/0Og+8CQKrbqqO58/2Xxe4Apx12YonzDUiRJoEXFs24AseGVaNhGuOJS9Hi18ejElmvy6czjoJFqTmlUW14dWjD304Fl7WpxtyD
X-Microsoft-Antispam-PRVS: <HE1PR04MB1578E7F5B1A408978B3FFD0891490@HE1PR04MB1578.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6055026);
	SRVR:HE1PR04MB1578; BCL:0; PCL:0; RULEID:; SRVR:HE1PR04MB1578; 
X-Forefront-PRVS: 0946DC87A1
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(2906002)(6116002)(4326007)(42186005)(110136002)(586003)(3846002)(66066001)(19580395003)(47776003)(48376002)(86362001)(36756003)(81166006)(450100001)(5003940100001)(8676002)(50466002)(189998001)(5008740100001)(50986999)(50226002)(92566002)(77096005)(5004730100002)(229853001)(2351001)(33646002)(19580405001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR04MB1578;
	H:change-01.am.freescale.net; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR04MB1578;
	23:q2CREG/DPWa2T1zXjTeqCNp92yP97th2htqI3v6WQOCvmxbDnn1qKj77/K7InoR37jNqWZF26ZZD0O+2peTvsmYZ6L3skW4okb9SM+WSGHRl0hnlTCVzS96fWXzIhuI0vrGI5S8i7tGJvzd1IeZSb7rQH5s8DaH/GJxDot9Ht6PipmxeZlgeggSpMuReozCB8U9vkeNmutkdquRto/GohvdT0UXQe0Uizx3NipDHzYfMoKb3COP6uNH+oJvmiiOKflffIoOCezfhQhJGLOgS4aQuFjMHd8Qp/LZS3TNg8NtIoe6oVG3mrDZGZBOPakwEVE50oiqg7wisVf7ggTLW8vqIO2d1gbNaWZSJFKDiAGBpA+nHcqEAH+hG3bPZyL1un1JJ1zaGLKEbOgZbRqz8jD0uL89rYO9QegacHqX6pJvdbkSFkn7pxZkOKSScZhdi7vwxZTgSKUaGIDPlrSuz0JTig57BYhKH/R7RXxZTEj0xsdZQp+3DHwtK/Zms0xN+LTDoO2os+qkNgkJWjoJtmzZHDGfml4ddZrcWoW3cWDRMFUhoDdGmGL28+DAFmopJt3elupvNUs+n4tsvWbHaR5eoxHM/1/SPU4e/q/dHqK/v9y6H1rR6dAD5gtp9vfQsy6/KvuLHYjWjN2GXwlLozb1IFGlM91eIZ4x44a1wh+8zSm3pcoB58+p/21POHFseNxoo7BnzdV2QpQQrF7iLIp7nbEd1kJ5tX4krnd4dmAmN9sdNKaaz+TWl7tpu7nIZjIsBM25yuqxIx3Q7ZIUif13pJVWLoWRGGTmQW3QrGuDceTKhCgKBMzm8jCTfq9SrXG6NCxsmueKTVEv/zdub6pdOP4AsQ2JxfSha/RKWGjk=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR04MB1578;
	5:uZkmpGbTHTwbEPp23W8ARzxq8d/IiK7kh47p41x42esU29NlysGJCwa/sJ3iqGStPEcNrkKJ895wS7N9V2jT8aQ0jlOVPw7pwJpeaOV+OKJeTTkUQrZLxsoBxdWfQpNljQDGJNq2kHy4/EJxnT897g==;
	24:bLiMEjkcqoL5XxfxClVcvf1jmCFi0GQgs9Zvbn5yx1PFRGIm1BdV6W5B5YwR599pCB6+QJkaWmxpC4vMdqpKIuXg42vNrwp0SlMo+yEHN5k=;
	7:wE0pszh2xaI+PGn9mKW+vnHiWZghPeMt8p4L354Y0CaYcipgd9r7gZgdEC8qIQ1g+1uprCdZuoOxvT1VxavWfM9qHE1fafW3zp+URBYRu4yz4UvePinCTjVQdiIjrBIpiqz8gfHlFOrqICIIaHiRl1wFDHiQcA6X5lkW0eQUdr0QBIvGYQBDNBm0N+cXqA8i
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2016 21:24:45.3225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB1578
Subject: [meta-oe][PATCH v3 1/2] mesa-glut: Remove the recipe
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
X-List-Received-Date: Wed, 18 May 2016 21:24:50 -0000
Content-Type: text/plain

mesa-glut is dead upstream for almost three years now and it does
not generate library for GLUT.
mesa-glut is now replaced by freeGLUT which is a free-software/open-source
alternative to the OpenGL Utility Toolkit (GLUT) library.

Signed-off-by: Neena Busireddy <neenareddy.busireddy@nxp.com>
---
 meta-oe/recipes-graphics/mesa/mesa-glut_8.0.1.bb | 16 ----------------
 1 file changed, 16 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/mesa/mesa-glut_8.0.1.bb

diff --git a/meta-oe/recipes-graphics/mesa/mesa-glut_8.0.1.bb b/meta-oe/recipes-graphics/mesa/mesa-glut_8.0.1.bb
deleted file mode 100644
index 404ee53..0000000
--- a/meta-oe/recipes-graphics/mesa/mesa-glut_8.0.1.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "OpenGL Utility Toolkit"
-LICENSE = "Kilgard"
-LIC_FILES_CHKSUM = "file://include/GL/glut.h;md5=4aab626c830aed79d7b2e5a76dfa2dd6;startline=4;endline=8"
-
-SRC_URI = "git://anongit.freedesktop.org/mesa/glut"
-
-SRCREV = "ee89e9aeb49604b036e06f1df6478d32006b30cd"
-PV = "8.0.0+git${SRCPV}"
-
-S = "${WORKDIR}/git"
-
-inherit autotools-brokensep pkgconfig distro_features_check
-# depends on virtual/libx11
-REQUIRED_DISTRO_FEATURES = "x11"
-
-DEPENDS = "virtual/libx11 libxmu libxi virtual/libgl libglu"
-- 
1.9.1


