Return-Path: <ra43240@vinca.am.freescale.net>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0065.outbound.protection.outlook.com [157.56.110.65])
	by mail.openembedded.org (Postfix) with ESMTP id AA9A865CC2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2016 15:54:06 +0000 (UTC)
Received: from BN3PR0301CA0040.namprd03.prod.outlook.com (10.160.180.178) by
	BN1PR0301MB0593.namprd03.prod.outlook.com (10.160.170.20) with
	Microsoft SMTP
	Server (TLS) id 15.1.492.11; Fri, 13 May 2016 15:39:27 +0000
Received: from BN1AFFO11FD007.protection.gbl (2a01:111:f400:7c10::194) by
	BN3PR0301CA0040.outlook.office365.com (2a01:111:e400:4000::50) with
	Microsoft SMTP Server (TLS) id 15.1.492.11 via Frontend Transport;
	Fri, 13 May 2016 15:39:27 +0000
Authentication-Results: spf=none (sender IP is 192.88.168.50)
	smtp.mailfrom=vinca.am.freescale.net; nxp.com;
	dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received-SPF: None (protection.outlook.com: vinca.am.freescale.net does not
	designate permitted sender hosts)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD007.mail.protection.outlook.com (10.58.52.67) with Microsoft
	SMTP Server (TLS) id 15.1.492.8 via Frontend Transport;
	Fri, 13 May 2016 15:39:26 +0000
Received: from vinca.am.freescale.net (vinca.am.freescale.net [10.81.16.111])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u4DFdQuM001821; Fri, 13 May 2016 08:39:26 -0700
Received: from vinca.am.freescale.net (localhost [127.0.0.1])
	by vinca.am.freescale.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP
	id u4DFcZgf032553; Fri, 13 May 2016 10:38:35 -0500
Received: (from ra43240@localhost)
	by vinca.am.freescale.net (8.14.4/8.14.4/Submit) id u4DFcZ9d032552;
	Fri, 13 May 2016 10:38:35 -0500
From: Ann Thornton <ann.thornton@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 May 2016 10:38:33 -0500
Message-ID: <1463153913-32514-1-git-send-email-ann.thornton@nxp.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131076275668357334;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(428002)(189002)(199003)(9170700003)(5008740100001)(110136002)(11100500001)(105586002)(6806005)(189998001)(8936002)(50226002)(48376002)(50986999)(87936001)(92566002)(81166006)(101416001)(19580405001)(19580395003)(106466001)(50466002)(33646002)(4326007)(230783001)(1220700001)(586003)(42186005)(229853001)(2906002)(5003940100001)(2351001)(47776003)(36756003)(960300001)(8676002)(7059030)(42882005)(87636001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1PR0301MB0593;
	H:tx30smr01.am.freescale.net; FPR:; SPF:None; MLV:sfv; MX:1; A:0;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD007;
	1:0dmpISL2CUhjipUUqsbuDSF4BG1LOYw5w9Lx7J/gMI3NmJomRHacSjbVgl6TmI79NYDSjXf2fj7C4Cse83Jn/AIxzSN+U28XrAF/jNITLCjd9qJsN1HM+L/vMtNos5utSQolqUIAHDqRrqNbUq3WHDjXmY9lrekHW5xo1DGoDRuYmPsvxzhMhEG8s/aztcR6S+uiwqkrqKW+mw/XIf0girBi+xEAqo3L9SLUZO0sWJdFzy1XKkHGhXnAUqnIUzLXq5hCpn2UpVUfrU7V3mzM30zvw4IrfYQ5naq7M0sd+1Bo8HxJ7wPTKYt9pp8ZXDFkjKKOKQvW4BLJLlnkS4pKLGMnQNHOvqxA6JTm1FeDcbafTX8TIH+OhtAVqcgE9KZ6/TZGLhSIyYOwQPJo5mRDUFzFrnT6KxtBRG3y2lSZz4d2Eza9MoTltpbXuiyzp2bQklah7qQMxZqXHlu6DLA8B+oXi2hJrAilqrtid9b+OBHxG+L2K5+cJsiC6rweQbnYs+byBP2tUKNBXvDTTTamXmdoLi2J3HI4LGpl4I82kyMS1rxucssTnRU6HEg2v8VshlH8nObaqjEOrsoH/q6nvx/pi+JbqrQkKhQqhelxuT2Rr3RL8mUVxwQn7dtHBcfxDD1r+9umuVuhSAJXtTX4w9JkXER4evQEvZKjklcN0zriCmPIb2E1Hj8A2YDj5DAfSYrEPyRvX6WOvHDXdZmDLI0jDFW3aHVk12oK4r/Z/yo=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 51384c72-8528-4d06-90d6-08d37b44c428
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0301MB0593;
	2:DkBsGxpMVVyVC2XpmIv9unrQolaknSoOxUMifZSYWwd61ZD+eYRChfRGa2oaUBDPHH2dY2iW3XRThFvnc7zN4Wo3g6Ciyf6cQUiFhzPMS8E2BfXdNB+G+TGE74rXJ2qpIV8FED0ar22vw/AqfowLZdj6bvY4Yks+/ADMCyEw+rZ3GGW6XeuFn/fh6Yv87Qap;
	3:Jp+qY1y8KuNQ5zcyx33/QVag5kQl5kg9DUnf0maA8GfI5ZtZ1pS5oMZg4bD1+n5WZPwgT38yuX2DPGn6zr1cuVo6UIR/19vrdJi3bFUJBd4N7X06ZixopW4O5uwEz6RRwol1o8nO9PRoTQdDbqPiV9w9FL8PF07eWt5Q/kQAvb6WQtAywpLEKafCgc0dtPaJuzRuy9cftXvLISRQjreFbEFzY/upB9/lVo/Mlalan/A=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN1PR0301MB0593;
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0301MB0593;
	25:u2r0bSbZqShlLXP5p4hKOtwgfa0HtmvJPn7bgTp3bylSQyJqcucQSmPW9XUI3JZiIoczLmkDa+hD6UODty1j/uJ3+pmFthOQSDhoem42vQctBeVCoHJ2OPxgeYFuxuWllh91VB0OjWmX3qhl6vfOok4OizwQHrXe71vUqxqR90KQKbMUlpJveD4Yn1RvLYfKUBSTQHwIx7KfTfAFP3h/TlxpMe2SGK43/ZJZfPkWWo2edup6weIrmvB9D85D7sCpWhzsRPFNaW/3foU6/wKGjoLyXGHqJ1ChBXwsNaGhuXta5MBZUF18lIEaqxa+gIkQBBUUeXO7JVHq5nOoOKxEvlGC5YDv6swS1W1vo04o+WrNw3C40/df3ndqE90rnF2q5dkcrzkVoDHOcFnyCXDyhBJ96ZrKG+H9rglx/QgALvj/abxIUwEOETiGZWRn43YldJtBpb8+pHsI6JoQy2ffQAktkZNI9plTxqmm+N/CfR15fSFAbDWBwRmuMK96bxJxdGLWuMaGAQl/VTvCxfp3Z6ZDSYPmUHq56ZHwOENRBkb5e+9ru6/E8SlBz/LNHFWAdLiQMAC8gmZq8m2UV7bejmIy+y8+9Sy0WIZliyYnZ6niBd4uw5abFwIcudHkxIXolBUYPNNDhNdLATBvkAx+006AUc+OA/06wkzbP2eRpmPrHMdaR7ep1qWLJy1cdO/m9RKcdIYQErECdyGdD1tsnz8fzp53AFw2JKhdk28eozAXs6NIjwxZ0tKGmOmpI75JVhORzjNmKXuQJsAjiNbQI1VBLFjD5CGEyRW1qu23VFk=
X-Microsoft-Antispam-PRVS: <BN1PR0301MB059307012A371E8C6A40E1A39A740@BN1PR0301MB0593.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13015025)(13018025)(13024025)(13023025)(13017025)(5005006)(8121501046)(3002001)(10201501046)(6055026);
	SRVR:BN1PR0301MB0593; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BN1PR0301MB0593; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0301MB0593;
	4:aHz2oP0P+fkoBYvo5Vl7lCB4RftsrF7fILgTY6+YoPUSqFsGexpQfFpE+XkytLmlyM6omiQiLtzg0NQ1IkjOJ2niwKRmNJM+efroCb4g/V5Ekpfnz/dyJ5MY/U6QY520Dc9LhH9/16wY7FBqa4+2ZxLiIx4QgJxwsoFZ/l+e27OyWPw0CfLjaIqD5UvaSrW8e0T3tgmvQjkUA6pDLynHPnFf3IIk0nH1nFa1PTgM6jJRbTJlB/dTzARYYD74EUFTJ/He2NTZUMrdwfcG/cJ14KU064f6yMd5pVACkjrUzYHh3FrwzJWiy3ZQhDhBAw5k9Ya0820x0MbDu1j1zAJxn/Nerkqwsoc1siTQ8Er9/HYZaeQVQY4tlNawctYELD2uo3dJVN73VFAOSxm7JJBWrLG4DE3nS7+B9RG0iHADVZu+o054W/OBft3IBQiXv2NYFVejWsoYrK+4iYl8XCDQq6u0kVCUF7g6gJ4Fl0nbq7Q=
X-Forefront-PRVS: 0941B96580
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN1PR0301MB0593;
	23:M+b4D5kDNCrvSddoXTC51Fh6pjpg64Hq8Tr1AO4?=
	=?us-ascii?Q?YT/jZjVkarqwirN0gX7m6giTn08wyDbATnh4t6FX5DhUZrz6XX6anqwz8apH?=
	=?us-ascii?Q?K8+Hm1xFYVffuzMalfycA7F1XaHDBfzjfvFoE25TOThq45mvRjF7fqRVeyPz?=
	=?us-ascii?Q?96Rqt0cGcbv31l/aNWghLcsV1soDSQfXzEvCiMmm4hX1oogQmGewHp7zuUxJ?=
	=?us-ascii?Q?qDJ2bo6U3pSvhQgl3r0uPPKOG70GKjaSYAdCp5X/ktPBrf2CIuwNbJpH2OC3?=
	=?us-ascii?Q?n92SpgbZBTUVV+/hdS0WU9IZDZuovaXLbteficKD8Rp7Du0omp9ulMzBZaYz?=
	=?us-ascii?Q?2WU3kWgmTV72qozamaCySJ004Z9Qg12yKmB+1w+L220QQZ5ImHdpHGWqrANp?=
	=?us-ascii?Q?wWZjZhlvmUk1GOkT+bUVrm4BQDCkwCcLAKiviO3lx8LpCKjK2Q5rvujaaInA?=
	=?us-ascii?Q?uImN1vKEh1fXq4DTdN5Y6F+Ka/RCUfXvqOdn3GkD4RK/SaPvT8n3o6MEaaeX?=
	=?us-ascii?Q?mHmY5lVFbCEA+fwiFpKv4Ui+253s6JBekI4rSLMPnatQVCpkYxccL39/Ysdx?=
	=?us-ascii?Q?5MacQ9H3C2QBwlSrR1OyfMXRVGcfKgObyLWf5eLofntSz6iWPRGbrGlSFv7H?=
	=?us-ascii?Q?XEaVk1Rj9q3H/m1SgKfjWARW9zT5yDmWdIdC4o+RaTtoEXp/CKi8FF4S5Oxc?=
	=?us-ascii?Q?j22X/naehoJB3y4w7iK5pXu2gjkgNiVTuLy/jviDwSYh/d+uHNGIf1OpH/Hh?=
	=?us-ascii?Q?XiY2Xr6kWoPZxX8Mn4Yc1e5F2vNnjNVfe9VJxCWtgmEIlziofd+aG+nAMaOC?=
	=?us-ascii?Q?OIRMwRb82j4TM7i6MliDvtky2EftxVDyrsEwZFDwurlK/lTuVWlhR0GVPE2D?=
	=?us-ascii?Q?4NnieqkWjAK8aJivgXn+FZWmgcU6Wtq4wp9sdg13Ky7kKiGvtW5hWGmnq3/I?=
	=?us-ascii?Q?n19kAn1cWzFJtIOSYdG2oq5MXcnzyrrytyfqSJuw4VZS1utj0HQkpxq7m3N4?=
	=?us-ascii?Q?ybZIwAvNXewaJ39WK1986z41jfWzYn7EGWwWQWy13tixS/TJJ20f8bQxJXPT?=
	=?us-ascii?Q?3vuQIiE4=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0301MB0593;
	5:yFsoqKzencJFtczeBL7+l2/IT9h+mC/Lz+o35gX2ey97Zo9OVNTjQkW04Pxjwg/oYpUStRssffEnDBrDjP7e3Jh68rTzlp8yDiinsXWT5mX0bFkC3CNdfPLqrgkYRz7GO/kDqg1n8a3j920YUpx5WxfqWGl00kTsULz/fno9voU=;
	24:PZB9u+Q4i8V37tKKXcQzQKIzmsVLLytY4r+jWjlwWeLwDFCLRRUYea6xyyAM4FfufTe7LZ/7y8aiGazZH/gV7dF+XUuaMo0K4qTi73cPID8=;
	7:g9nO/53mI5ZzeL54ykP9Ib596N230dRt4hV87gG99M93uUmbxEd4aXbpEWB5BH0PkuCEYjSq9fukuNON03+PeKxSCI1nQXjkCn7Y0dJgYFBD7w0/QvIPx4RjudGMbcZdhshN29+ERW0NfAwyEsXOqBTKNA+Nj+qUKpmvJPImYgrxlzRecBDziegPwSsouM72
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2016 15:39:26.6485 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR0301MB0593
Subject: [meta-qt5][PATCH] packagegroup-qt5-toolchain-target.bb: Add qtdeclarative-tools and use Ruby tools only when Ruby is present.
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
X-List-Received-Date: Fri, 13 May 2016 15:54:07 -0000
Content-Type: text/plain

Signed-off-by: Ann Thornton <ann.thornton@nxp.com>
---
 recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 mode change 100644 => 100755 recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
old mode 100644
new mode 100755
index c26a707..2b65bc1
--- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
+++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
@@ -94,7 +94,7 @@ RDEPENDS_${PN} += " \
     qttools-staticdev \
     qttools-tools \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '${USE_WAYLAND}', '', d)} \
-    ${USE_RUBY} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'ruby', '${USE_RUBY}', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '${USE_X11}', '', d)} \
     qtwebsockets-dev \
     qtwebsockets-mkspecs \
@@ -106,6 +106,7 @@ RDEPENDS_${PN} += " \
     qtxmlpatterns-dev \
     qtxmlpatterns-mkspecs \
     qttranslations-qtxmlpatterns \
+    qtdeclarative-tools \
 "
 
 RRECOMMENDS_${PN} += " \
-- 
1.9.1


