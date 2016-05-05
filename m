Return-Path: <neenareddy.busireddy@nxp.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0094.outbound.protection.outlook.com [157.56.112.94])
	by mail.openembedded.org (Postfix) with ESMTP id 5883670018
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 May 2016 19:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
	s=selector1-nxp-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=TC5lQG5AwpdN94OHeUo05FNyYZ8AT8CvHE1L2GWd7JY=;
	b=qEgkBkwHqk0zvivDm1ultPrFU/j9MU2EVCbindjkSFSeGeMqVHeVis5806hoQPWTF8Etg0fYJ9HBgO/XMwUjyHbrbsNmF3kKydS4Sjqs6p7LZHCEYmjpzr/vac4JGEFx7rnO2aUGEt/IkLtB4JFND7gaKVzxD+oDDhZC7/CwLB4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=nxp.com;
Received: from change-01.am.freescale.net (192.88.168.50) by
	VI1PR04MB1583.eurprd04.prod.outlook.com (10.164.84.141) with Microsoft
	SMTP Server (TLS) id 15.1.485.9; Thu, 5 May 2016 19:13:56 +0000
From: Neena Busireddy <neenareddy.busireddy@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 5 May 2016 14:12:06 -0500
Message-ID: <1462475526-12554-1-git-send-email-neenareddy.busireddy@nxp.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.88.168.50]
X-ClientProxiedBy: BLUPR11CA0014.namprd11.prod.outlook.com (10.141.240.24) To
	VI1PR04MB1583.eurprd04.prod.outlook.com (10.164.84.141)
X-MS-Office365-Filtering-Correlation-Id: 67f08f78-83c8-4e4c-58f9-08d37519681b
X-Microsoft-Exchange-Diagnostics: 1; VI1PR04MB1583;
	2:yt+JRBi9L6aGKfw/drYJ2P4rw4PHnBBgNr+PiAw6w5d43Gi8MtuBlOvCNM6MUBLsOfxJbHYNmsgj8ApgfFrd27KU7Gq5S7K/Sd4AnI5/oqnKQGrAuwaeqt5sgfTq/u1xQjt6RcycDQl04JAaS7lOYcn6nM2Tnyv1eRzshqu535jdkyl+7BKyO2Q1vmuhDds+;
	3:XNNLrsACx1GzDAgqKnTHucHs6Y3I7ovo6xXMlXXvI9sie+w+DhCqSIr53fwpf/kHGdetr17uQCglTyQMUlYYkeFZfzqiJzk4yyokbUPY3WVu5UC18V571TeGFfx2Vdlt
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:VI1PR04MB1583;
X-Microsoft-Exchange-Diagnostics: 1; VI1PR04MB1583;
	25:BszTICPJQ71C+3hV1uwa6zjBJGshfPcGJXLfaS1g5PYK+Em1f/cPApeawn7LJyUiqELynlbPlQaJOZAY1GXt1+nDsesdK9rzmLL3SNyG9mvwtW13I2lmGjGhgTNU2YtilsT1cGs8z1Ab6GPic7So+EKebXyqaoht6ICV3fOGdoeNo6m+oUEGMFkPs0G1uoab0VTIOKPyd7oS0oAuC58ImRMP6T67uQSHxbg9PUQF/e9WAPOeO+wv9KbUoHme/q9mzm88VBFs5jil+IQtjq3SHmSSSgdPfp0Ua4GiiYUXdd3zpyiXBnAD9tZDTLDXW3Y4aP1Gq1MUp2+a+l2YyW2asCZFS0UP2P9j7b3VDAgpq0oGfoHvovpPxCW2BuLjFf+JyJYvhbLhNiVd+C+ODTgfy9VNVGeVQmMtzVnvr2GguT/AbC5DjCfX6LlUey74P7bSMC9CITg68TCmL1dcSldO72aV1B9+uDS8Pcb2qlJlgfwUFDxMbTOiqoDmAsBrNoGoQ8TIxe0GsYwnSXThpdMebyZhjKSitmBcQGmFhopTJqzCCiXEqB0IChzE0NiAkVJI42RBGxIs9Yf0tAVycvbH2gab64vbA2j+c+BBQqN9Bw54VSgJg98fbj9I+dre4KKbKfzGHbGRmAukUQuDXyuMwCJBOSJv0Mk7LMIsoWaIashqtP/m0Gr4WMnzLUdKq9bN8/v3Xi/LxFGArzIyy1H3OoCLVIkKbK+As/GYAfo2jVHZjOte/5c6RK5lArD9fUv6FQgLvVxCC4/NWgY9F95VPouDd46K89UdJELDfNKgRXWgbjs6fnbtWCZaMaGykqrziyZ2x9EQV4qmfve4gVPulg==
X-Microsoft-Exchange-Diagnostics: 1; VI1PR04MB1583;
	20:E+U3ljzbH6xH3HQHuQAxoeCC8O/q53ZBlwmcQ+sqjYuiOGcZA4o4USS+ag/tXM3T8IQdIt/jbw4WR7d+cP9XShqQGOVUgulsJsLRM2ZCoebvtrPR54hN273hbzBnWznl26uYT6fglcJOeLcgl8ALxxC3BUKTTYxOrcvQDdF1Hs7rAXkhjir/CLWEbVg5k/ZiBMkOl8Er96pZvPd4AUNcvlV+rQh4C6nuGbVESYjkVtXE9DDYurLTzCY2x+G0cqTkR/d+wYfL7hQWjPn4bysvCuFwAuljZloFSYV5rstmcOfgFml41UMVX80H2BEFY1PZrYUa+gykfPVjiJVbyNMsipIWqZrLmBZY4Lno/2Tns52V7Nfl0alPHEr/Lmz9Ie0p4bHW61tKyohlgVHEHbYhAGRcBlHHVSJ/uhbu3w4EU6WrFQuodMTaVWYLf4YI8i/Hbva37HeCz6b3WsYEWnvH6Dj1c9eLdLPlBeS3+V9SNTOGw/LZ3gl90vkND5j+OyHM;
	4:E3jOWBE5ifGIuzGJadP1gheNQx0tyu36Txc/viTdHvnKoA6+Y2JjBFc0jJNfXF4v3HNyt5F9nJQyaIl+ZtLlx790hzmZI57do+cUsyOptGnICQsAiuCCqoEmPnkL8KxX+kn/ykI3SQnURxxkRUSSb9/Kg/vSx25IQ9Mms7YHnz8feXlCheVuN3T/+VIiZ71qQuUpfo9UOsJmRKU/7i5cBpT8jPB3V5pK+aOE4C4xlhtbC9emH59S11CdRLMYBfcgscStjHPt85uleAQYLnadK1IjHKvvgZcGuUZKOmiYMw69InwBdnYPtRqSvhhcYJEZnYvWqtMEpw64DsRTzADdZeN6ahvc/XZlXZn+nlS+cVQUiq/hE9s0wjbF+rdMvXSFyqfak9Qr8aPJ7/2hatkRW7vBHltVfa+QAc3ulSNg7LI=
X-Microsoft-Antispam-PRVS: <VI1PR04MB1583DFE7AE054ADF01605BDB917C0@VI1PR04MB1583.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(9101521098)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6055026);
	SRVR:VI1PR04MB1583; BCL:0; PCL:0; RULEID:; SRVR:VI1PR04MB1583; 
X-Forefront-PRVS: 0933E9FD8D
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(3846002)(86362001)(6116002)(5004730100002)(81166005)(2906002)(92566002)(189998001)(586003)(4326007)(450100001)(77096005)(110136002)(19580405001)(5008740100001)(15395725005)(50226002)(19580395003)(50986999)(42186005)(5003940100001)(36756003)(15975445007)(33646002)(48376002)(2351001)(50466002)(47776003)(66066001)(8558605004)(229853001)(19623455009);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB1583;
	H:change-01.am.freescale.net; FPR:; SPF:None; MLV:nov;
	PTR:InfoNoRecords; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR04MB1583;
	23:eB6OZs/9spfgfZoL52h06ZmimJiX+3LNaOJa7wavs8CcNAXaDKFi1qXBLWL0Tu01/2XrLmFrzHw7bi7huaNAOMpLcpIz/vRfam2n0N7dg7qpirthdr4XoJw9wpfO4K3eiSagZYXmT9mRcDl0uVDRpaai/BO3/tZrMmalJaOvv4fgzzOcO/241xhbkZ6L8mDePtBjI9pXHa4LCVsLGUpJ8PqP6MWXKl+yy8DpZH9hm3/Zm+oC/mIKcwbC8Egx5Xye/17pV60UjiVWrZLPRjFZZT83RrTglVjc73ilJCBIzxYhZsykAKDSYnGYWdMnUsn2phOYHsi/G/AyNfavudL3gbUg5dXmq3cTcOLycb/3cJ0TZcvftsjm7aA6VTkUAUJipW/I4wAIrQ3vqruW3ke132A8+RflSBzFdgA5OEAM+4sov/w4mfBD6bIWESz0kxdtNqe8la7OCnXzetDBoQ4+QFBkNbhtEVYf2tNVtUImZZRR2YNARPcstsf5OvLDmynAiMb6GterulEodNc/amz2yGAy/NdQyTSuZXyS5LBE5CCz9dhdcCYWIc2/y/yhtR4zdUOLPY7QEnFDlHJCSH0O6iJUS/fTh83kQiQifjtz/SMV2VG5LlrkGMsZvn6UbLg5lj3BnSXRK+cY3FdTkYVkuP2B/ax0sft4qu2L9y9CDA40/rUHPg4f5S8ei2Eo6BUBZDs4DqGB+cmL4g4CYXVhUlqWb8sURD3F2vqUxZsgYgwnL0COt2U+sWK26uJ9EI3uIWLt/sNn2QEWEv1IUB8NcIbprvjoR/9fxhnwuLEK+1XIKNEkfO3VmyZdd0/xMCwWqMXMKRs7AK8UB4Ug5M17xJM1TQldByFM1USNlg6UcG1PWTOMIfrHlvAsn1hMI8fYrrGSo1HQw0nJNmABeUoGbO7Fy4hbnp6uVfmHSv82S7lyrUFpUhuyGgnFMGfqbWoq
X-Microsoft-Exchange-Diagnostics: 1; VI1PR04MB1583;
	5:s9jcnCieY3v+cQWlUyyeeJPV5q40vdAzfrEaEpoiGHwCsQ7OUgHFpPzROpf3QIoJNKxTG7pynNkDIle344Sl6QRFLY/iXvGWldzeyBQYFPsXNaNSv+LQceGqoQFxza8NL+5pwOLpU7imUT7WEtK5Rw==;
	24:emK//Y/+34rbG6mw+krEz5TBjo4AAIsbDGqERNfMPQt+/K+sdcoNUL8zSOCVODk97hNw1a+C7foXQtmtqGU+WW0/7oNE1xRWUm/QXni3xNM=;
	7:NgPiCCo4gGG+HF3Sc+kIefWvf595pv3hP/qVKS/IOWKgOWs2r6cgDt3XcIt9k+SJIvnWap2/wi5jDYdRAlxgBu5eEAzhd5vn9Bzq/A1KlcMgqTnlrCTXb2I17oaGrK0vRW609ehu3g2nCuWOjeb8z69c671tbwYyesxp83LFF1CAaD6bLPsO7hauM3132Tja
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2016 19:13:56.4845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB1583
Subject: [meta-oe][PATCH] assimp: Add recipe for Open Asset Import Library
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
X-List-Received-Date: Thu, 05 May 2016 19:14:00 -0000
Content-Type: text/plain

Open Asset Import Library (short name: Assimp) is a portable Open Source library
to import various well-known 3D model formats in a uniform manner.

Signed-off-by: Neena Busireddy <neenareddy.busireddy@nxp.com>
---
 meta-oe/recipes-graphics/assimp/assimp_3.1.1.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/assimp/assimp_3.1.1.bb

diff --git a/meta-oe/recipes-graphics/assimp/assimp_3.1.1.bb b/meta-oe/recipes-graphics/assimp/assimp_3.1.1.bb
new file mode 100644
index 0000000..d28418d
--- /dev/null
+++ b/meta-oe/recipes-graphics/assimp/assimp_3.1.1.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Open Asset Import Library is a portable Open Source library to import \
+               various well-known 3D model formats in a uniform manner."
+HOMEPAGE = "http://www.assimp.org/"
+SECTION = "devel"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD;md5=3775480a712fc46a69647678acb234cb"
+
+DEPENDS = "boost"
+
+SRC_URI = "http://sourceforge.net/projects/assimp/files/assimp-3.1/assimp-3.1.1_no_test_models.zip"
+SRC_URI[md5sum] = "ccd4788204509da58a3a53c7aeda7a8b"
+SRC_URI[sha256sum] = "da9827876f10a8b447270368753392cfd502e70a2e9d1361554e5dfcb1fede9e"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit cmake
+
+FILES_${PN}-dev += "${libdir}/cmake/assimp-3.1/*.cmake"
-- 
1.9.1


