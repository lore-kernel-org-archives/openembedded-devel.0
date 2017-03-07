Return-Path: <tom.hochstein@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0056.outbound.protection.outlook.com [104.47.2.56])
	by mail.openembedded.org (Postfix) with ESMTP id BDACB73090
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Mar 2017 05:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Rpx1zwTTBTShBvpzwD0LMGFGcNKC2XKNspMeJ2NM8l0=;
	b=E9LLWx/l+8g+BlaOIU8KUwllqBA8b/S87QZB4XgGmoE259wnI9KYurKAwEennsKnsmQdrG6roeLs7c3cH37Z4jYlkh8iYb8Tb16+nXAVPTPN/c1/0RgN6WMmXQ/R7ArE0QMK7+R5GQGxe2cGS0nuNiZyhHx81dHH9TEAYaZ+rNU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=nxp.com;
Received: from tx30imx-01.am.freescale.net (192.88.168.1) by
	AM5PR0402MB2819.eurprd04.prod.outlook.com (10.175.41.138) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.947.12; Tue, 7 Mar 2017 01:14:05 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 6 Mar 2017 19:06:23 -0600
Message-ID: <1488848783-9696-2-git-send-email-tom.hochstein@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1488848783-9696-1-git-send-email-tom.hochstein@nxp.com>
References: <1488848783-9696-1-git-send-email-tom.hochstein@nxp.com>
MIME-Version: 1.0
X-Originating-IP: [192.88.168.1]
X-ClientProxiedBy: BN6PR17CA0040.namprd17.prod.outlook.com (10.175.189.26) To
	AM5PR0402MB2819.eurprd04.prod.outlook.com (10.175.41.138)
X-MS-Office365-Filtering-Correlation-Id: 6ab2215d-ff2a-47e0-7451-08d464f74018
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(48565401081);
	SRVR:AM5PR0402MB2819; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2819;
	3:u6hCiAl0bd86BbYktMf57hpPLg/7KRtqkqgDDrYtcoVBGGW3QkzDP4E+3HarT78Q2IBmg25D/owxHMOPE8qJNNHImxWtCkkxN6LgShe7wWSrSJenc/63C8vRuRZtnjwJGXmJ69YyhuursjztmP3LC/fRmv6VWTNQw62FPqsvGTobEz5rs+2Bzj3RH/vqzDQ23d+yV82A038F+5KW5fRn/IY+0YmT5B+Y4Ldfz6sMAGtyoBoXXRQz+I/6pnRZHinfCTXOY3YWoYVMj7jnFN0IXaFwq11iuyDJs1Ovzbxsdf8=;
	25:hEJR6XB/+q8ydhpDCqLih64v0XyY5ANPml/cyWFOJl1YtCyNkBXYRu4asuVNbMkuXUUYfUZmhkgVmCDfwdE9k+SINcd7gn1+p4nJbpZdKQ0t7zAAWVrPUevcq2zt8CHstbWCV9C13cJl7g/x44OZnizUD/m4rz6vF5xR3xPcQJa9TQvNnw4x0HSjHt+vOgbaUPcy5xo5lE+PjSsj3o/B4Pj4wWfODesqGJqtobhsIlzKyyHSm68T4LRds8enpm7IVfNNtU6aAsfbTnQ+uMwJ8pMADeILhO2ouvjTBqXXLiAEzzcjgd1QB3DGdKYkrJPRdONExjQ2KWplFrul3KPTngUIuzaaOs3+IGFdgWNzhIo5wTTs8VANAKUKiS2S0+XFzj6qu1FCHLmBDMR0zKNYAN6D6ylADLQB/u2e6Buqo79XKY+/dI91Z80/zfVtzhTU
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2819;
	31:QDPUMKYIaSByorZYY/mFvciNWOoT+ItxhjO9e6L6BgSmB/B/iV9fA69YauIZbaPeuCxwdCMviJ7s3MgSlaGyqciDhUZvl8JiOfi/Ewvi9gwh7ZmcF9DLqe/AyGqmIUrY1os2hELion2kthfJX90fVo/WTiejxEAaRHzIMZWRzExYR31gFTX49A2CTJaJWylJAVlhqV97VJ+cm+nvaSHQaqqs83noLEKowKMzpW308yaGlLrIWVj0m8hNGDE3gjbL1QuhqZy3InoG/WlPFcFDkiP4Knzr+CA2j/cK5jqfM/M=;
	20:wrpgl5BbCfd8omXR9xIRiutmdGDPuw7Wp6xVmzQJ8uqzuVmZgIzjQbAgSfH+saPAcADoIwf9cRgK+fvEcC3Ox0ljMPppzVBTUY7g38S6Ua/cMh5VvvylTcCnTA+/C9ZYKM/aBi/hf+MClqXbwJjtZKQIIVOOBOZm0bd9/MLmJVsXOpjZ4CxVuWSH87R57oiq5l5rb7BNfmVYt0n4Qfd5bRdQsHfI4sHh0hIjlOlWVjxoUMBSbJlxH6rT0k0X/aiQdwOwq2vImOlH7SDmLTXgpV0yVbOl85cBjWhdCin7Nq/yZkTZPn5QD58xB+1EVl0h16HZV/H0THoUEEc+s4HclaTrPBaMZlpUFfotbU02N8f+rmM4BpWuEuf4lNiOkEL6R9X+TQ0dtjOeoF82VD/Q3REbeokp3YEziblqIhoy6ner/OQ3GToQm6WXQceAlPiP7SuaCuWyva/5nTGpbOa+di0jVAci5rRBGlx9Un+IubUYXa8k7RHjahyAKI0Wn5/y
X-Microsoft-Antispam-PRVS: <AM5PR0402MB2819AC92445925DDB40A49BFE22F0@AM5PR0402MB2819.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6055026)(6041248)(20161123555025)(20161123558025)(20161123564025)(20161123562025)(20161123560025)(6072148);
	SRVR:AM5PR0402MB2819; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0402MB2819; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2819;
	4:Ay/tiEuIRe7rRKGg8fybCcNp8YvvVVW6PQQjj08zgE92Haz1RZmiAsm27y7eFajCEUs16iFatEquKbUfusqHA9SXnG4wt+aTNqVDNcTbMKd2iGz1RMYrRADPKdy5teIGmI0mof/a2Dr6nNXAGRXmMXps2krqgm7WrXUmxfQEQ81QaFL8CG4cLjOeyKL9I5giQIlONhtO0Gt4ED8cZ4SXtJg5hItX6Zi5dAMOLEtnkYL/jG/5hU/8wM0l9acJdvyDxXoF8neMBSzLqDJwHN320J86F8mn5arKQ7w4GVESI9eqj3R19Fo+9doBxZrezI/5p8SqpakoX/hPTRmKFotBVrjFT1/ib6i5uhisRj9fSYZyfk33FQiQjsq9KhzU4GO7YRS8uq8p/9OsNIdrNXAK0LWcFHBeybOumYQr4D2ywiviQ4ihBxWeeLk3CIGaPTasHZZUQgUGWuUF0n/Fx6y7BMNDzwHNiDvZTiIWYdFBPD1Ywth0dIFVmggfvCYZpxXBzA6rgXnFblmfv4bWx7VqZaJ/QwhKZ+HuLoruiuhiYQAV8yMVNg5gaFWJXmmI2bGc8SvrwzIDvR1FXOkH0+RKSK71+gzmm7L0AEqRFN6GW1in4U6P9oISmsjmoxxdF0d24O9k7GZFbN+20j5y3lddX1BsFp0Upk0gn/40CahfG208S8gGin0avD9t3njwYMySi8yvZImP53IEEU6owp7/Ew==
X-Forefront-PRVS: 0239D46DB6
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(7916002)(39410400002)(39840400002)(39860400002)(39450400003)(39850400002)(6916009)(47776003)(2950100002)(6666003)(5660300001)(81166006)(8676002)(86362001)(33646002)(50226002)(48376002)(3846002)(6116002)(50466002)(450100001)(92566002)(66066001)(5003940100001)(2906002)(4326008)(36756003)(53936002)(110136004)(189998001)(38730400002)(305945005)(42186005)(2351001)(6506006)(6486002)(7736002)(25786008)(50986999)(76176999)(6512007)(6306002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0402MB2819;
	H:tx30imx-01.am.freescale.net; FPR:; SPF:None; MLV:sfv; LANG:en;
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM5PR0402MB2819;
	23:eb0FrJ0+cMxIKPNUa0Dx6SMsDXV27FxUlY5eYDr?=
	=?us-ascii?Q?zq+Gu0sB82bE4/dAuMEcyw5EKTknlsC3JQoNfvZaMo+75InvwXsCBXwoPw9Y?=
	=?us-ascii?Q?bjtPenbnb3JXQZkm2XgcFYhjVLPRNJqbSPguvhSrpErJ94DSaNXt2CuhevAF?=
	=?us-ascii?Q?MjOEGWShtj7JFlwKfQxzXA0Coz5WBlFEIb++I4e/nu4M47sWlX4mhncTRNvE?=
	=?us-ascii?Q?cdUGOV1whCrbBHU2QBtqZ/QVipuTSg/EDBl5Z+Zf4vNyLYFDey/zn88Kjg0D?=
	=?us-ascii?Q?AnmLtxVtB91gPl7kJk6+zNgEuvENsPQiziDGAtnpcAA72Eg/y2mpJcg5bbWx?=
	=?us-ascii?Q?86INRmRpWVi4leLOylIQwIdLYq3KfLCPZP+YDoaurc6QozRVt0uYNalOVYD9?=
	=?us-ascii?Q?s6VxlsvukWmjphu3x4osuy2F/cxAwB4ifBbZD76kpXZ6g55q1Gn/EGkXY2lq?=
	=?us-ascii?Q?6GcNDZECClnLA9X87pS2cJTqIjXlllyo/yOh+wSoJyKt2sVYptwGZhjmKqkG?=
	=?us-ascii?Q?0UsLGbCDros9901W5Rgx6gJhl3kmZ3QTU/hncM8TmHEpcLQFUm8RH70vlmzF?=
	=?us-ascii?Q?6nszor35iSxJWu4CBzju+jg3/gjtU0SndOb+rk77xl3SwndTGfXLaK0lKdKL?=
	=?us-ascii?Q?3m1OsVbx2DfFl/8hFQRAhKVZJIZlFzmOq4mnA+q9+si6vMla/Khbl38qQyQH?=
	=?us-ascii?Q?OnlViDpApserPr6omuxwTRZVhD25steGZD0uwMP4RxB9KemDSIGlJt6oEeMU?=
	=?us-ascii?Q?P4SxBbkx/cQ3kP4bp7sFZwlGWzqvdnxcwC4NA56r4BAr6X1DjwliVvw7FfRR?=
	=?us-ascii?Q?kie/lF4dfpSOa2CXpYAtP1Gz8X6klgUhzNu/48t1TnJ4aopOO2ZXC5bKDfjd?=
	=?us-ascii?Q?Wr14cqn4QlNV4NLOBVvcuN9rUqrLE5i8PHW8lGTYIfH1H3NzxtMcucLyxgV+?=
	=?us-ascii?Q?/FM+boap+ytlgUx9yrCGSuMWwhPTWZhwOO1RcLJVjmokXVk8L79zgQI8ryto?=
	=?us-ascii?Q?FtQ8wRhqGb/q2gNBsqkEJl7ozM4+2/cACuX4r32vuWwWS1lskLouFLtzP4tP?=
	=?us-ascii?Q?b6D4/1N88cgJ35fhe328+97iDdLXcaFQbdm59X4m9cYtACYEHOw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2819;
	6:2VSKmjIjkAK6VWdSzAJK2tul/L99fe+/2u4Uo7QLyXquj4qRDks+If4nCqyVO/59CfP0mEjSW86Lxjofh21u0w/uzynlOdzlK9qgRXUOrVNEIMr3PAgKI1PsVdZmd2JWnr+Q4z+dUzsaUwGQty2eXeLXHvI0VPunTu0gEhRQsB1QJtYlTRCp62VYTHkec6qzAUX6P+NIK/gV9KNhLDSgANnjGp55luGSG1zOf/h1Sch0MC6BAe3sq/ZYOQesztgYBE2dwZeoZfLPRZCCz/i/M4mpsGQiTOyAy8iMnOjTOMBY12SGa5dvyR/qW9OV4YReF2AH15TsxpnW/pORPsXdI7Kwl5/WgZ5t3v2tBmeJRvxxF00UOhaXUhUlW8wyHrLHSpJHlac7Xo+ueV6uZzyXfqoX1sk/0Z355gsYWgGyGMM=;
	5:Y9hdURpB9zvT9cQWF6RCOsr4FbLTN0yAPA0XAAotfRW8xvBxmhRe/uP+iMTAwKJC4ZXRr+sBwuvZaTZzthpapys55twKZ53L7ANRKgB+r2F2nY0g4eE7ajF7RBuPfv5E1XopKR8w5ESy1SjY1B3tuA==;
	24:54hf0EcBqb1V/4gRLV1Gfjg4+qnnQ9csAtGoxPfWtWZ8t4yRrEKi9dBLB2lVMcL2QyErk26NxGRjd3U68bQaos/uJeuSAkzpERsgwRxon1o=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2819;
	7:Fru8kuFvf3HIy+9UPSD6bGoY6gCrwAqXIi+n/Rb2mw05xVaU0TdQhG1e6UhiGhxM4J76h8Ngd7YMpJeuV1o1vpa2OSNdEOdxwCrrvyMG+64yfgzciddg1XQyjIxIpoSzAXxPl9rNpLfyYYa6k1nMJT7grllRZM6lxbs8ITe8/eAM/X8ow6QoeVBaiPQUlxfhISpbK1e5eM+1Og33Dywm2MwvdsNZMGUZIR1n70i75prfJmT9RDtvoXUMXTM4uHVOWWsNXFgWzsApmBMe3vK5ti4xAgzoHkQbqCPeP8TRY9n6FQhUqN2XoRRIcYDMbpLaYbe95vdFzJZKMQZxZLE5vQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2017 01:14:05.5872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2819
Subject: [meta-oe][PATCH 2/2] glm: Add recipe for OpenGL Mathematics library
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
X-List-Received-Date: Tue, 07 Mar 2017 05:46:15 -0000
Content-Type: text/plain

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta-oe/recipes-graphics/glm/glm_0.9.8.4.bb | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/glm/glm_0.9.8.4.bb

diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.8.4.bb b/meta-oe/recipes-graphics/glm/glm_0.9.8.4.bb
new file mode 100644
index 0000000..2a78c46
--- /dev/null
+++ b/meta-oe/recipes-graphics/glm/glm_0.9.8.4.bb
@@ -0,0 +1,21 @@
+SUMMARY = "OpenGL Mathematics Library"
+DESCRIPTION = "OpenGL Mathematics (GLM) is a header only C++ \
+mathematics library for graphics software based on the OpenGL \
+Shading Language (GLSL) specifications."
+HOMEPAGE = "https://glm.g-truc.net"
+BUGTRACKER = "https://github.com/g-truc/glm/issues"
+
+SECTION = "libs"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://copying.txt;md5=4431606d144252143c9c3df384a74cad"
+
+SRC_URI = "git://github.com/g-truc/glm;protocol=https"
+
+SRCREV = "5dcc56489e1b66dfd5bca751fa9b8dc68059e008"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+FILES_${PN}-dev += "${libdir}/cmake"
-- 
1.9.1


