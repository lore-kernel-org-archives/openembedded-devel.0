Return-Path: <cristian.stoica@nxp.com>
X-Greylist: delayed 66611 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 12 Dec 2017 10:12:47 UTC
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0069.outbound.protection.outlook.com [104.47.41.69])
	by mail.openembedded.org (Postfix) with ESMTP id 173066FEFE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Dec 2017 10:12:47 +0000 (UTC)
Received: from MWHPR03CA0006.namprd03.prod.outlook.com (10.175.133.144) by
	CO2PR03MB2360.namprd03.prod.outlook.com (10.166.93.20) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.302.9; Tue, 12 Dec 2017 10:12:48 +0000
Received: from BN1AFFO11FD013.protection.gbl (2a01:111:f400:7c10::144) by
	MWHPR03CA0006.outlook.office365.com (2603:10b6:300:117::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.302.9 via Frontend Transport; Tue, 12 Dec 2017 10:12:47 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; mentor.com; dkim=none (message not signed)
	header.d=none;mentor.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD013.mail.protection.outlook.com (10.58.52.73) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.282.5
	via Frontend Transport; Tue, 12 Dec 2017 10:12:41 +0000
Received: from legolas.ea.freescale.net (legolas.ea.freescale.net
	[10.171.72.223])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	vBCACiBS014375; Tue, 12 Dec 2017 03:12:45 -0700
From: Cristian Stoica <cristian.stoica@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 12 Dec 2017 12:12:40 +0200
Message-ID: <20171212101240.14632-1-cristian.stoica@nxp.com>
X-Mailer: git-send-email 2.13.5
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131575471614974018;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7966004)(336005)(376002)(346002)(39380400002)(39860400002)(2980300002)(1109001)(1110001)(339900001)(189003)(199004)(36756003)(77096006)(16586007)(316002)(105606002)(106466001)(2351001)(50466002)(81166006)(2906002)(6666003)(356003)(97736004)(54906003)(47776003)(6916009)(81156014)(48376002)(68736007)(305945005)(85426001)(6306002)(50226002)(8676002)(5660300001)(4326008)(15974865002)(51416003)(39060400002)(498600001)(8936002)(1076002)(53936002)(575784001)(59450400001)(86362001)(104016004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CO2PR03MB2360;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD013;
	1:qL/Du7643Q5pJX7xWUlw/6HbiNIMAlvVZYrK9a4kzew6zw7h25f8gAwt70L7+QPmWH2aZVsDEhNUZFv/5aCcsYzejkO7DWIc8xhdq0owVJeNJe/J+Qb+NY3hHQY7kTz/
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 6d354816-7d14-4fbd-d842-08d54148e13a
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(5600026)(4604075)(4534020)(4628075)(201703131517081)(2017052603307);
	SRVR:CO2PR03MB2360; 
X-Microsoft-Exchange-Diagnostics: 1; CO2PR03MB2360;
	3:D0kmCsWhl/oqDfnCTnHPJZWGQ2GBFTi48S+l21HVT6C9rk9K3zH8JKIKdPwBU3BP8VUr41v86AEIo0dwf7tnFsDOKHyPvSZF1/ZNS7o5vnFbg27iqIUG/467ZpXoYr0pF1w0B3c6RACriurp8kRj9nY5Fp56axu+8WFWWh2EBMe7k3RiVCMiOm+gqs3PutIFqAbpJpIQqadab5CzZg8x1OlXwihkuBtLEx27T3ALzzSalWjIUfS7MXGyAGTO99W00UVKxg7uzjfmq2jXSiaDUL+dr64l1IQGRy0DVvJD0wQvDrUmKl6VITBHdr9V0XGTvb/WCLBgQsRkLmz3vSgGIwz1P8aOirTA243PWrpVlmk=;
	25:GBR8D1xk7Tai/O0tYqFUxE/EYvX2JRQfaiVf7/3vpTroyR8ccFrnHprOnh8AZKoJjuVRFMDAHg8sFXQkuKcbhPLN8Brz2HMLqsfbjFgMe54gNAR85ORhR4fyDdzU5gmBwBUInASGNMSEtZ+1d8Tv4cBAvL0DRrL0OyFxVIEVtCPahfzNU6HsVF+qgAwN95EXhE+iVCxCH/M2P+wWRWlAK/8QcWZRrpdwRPkSXBFf69ipWRrHVmBgH0p3HHZ0nxIgYj6fsT+dqYlP9dXCK2Ct07N79ScNBObQdSaEF4W0bqg4nVYiETKULfxTz5s59smzPnUDvbSKzkJXJwPVX8BLfw==
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO2PR03MB2360:
X-Microsoft-Exchange-Diagnostics: 1; CO2PR03MB2360;
	31:/QlWHaXutXSN1NwXt2Mb8PJojxLu7JrbPzYuiqneXv87tTsLPVyHdeYPx07kHpXUGZNHtvFmXcCWxBPRxvKJW/tMy0W98AjAxZOL0AdrvHJI1Vx7NOIZRDka666hINtAN/cJeCiOKuPgaGDlDqgI+hqiI7iZeISqwgLCu4yynP2z6/rI59C88yXCc5i7mjUUEaEW+6TUin//U96ehH0orldAn+bvziuM0DvTHv/uJfo=;
	4:njK/c+jlrF0vOoTk2x5w091yA/KjVi1Dd8emBMv6t3vttNmPxir9z5qwLdpl7BbQgAMA9KUbQ63ddE64gPzqAOYVs1uU8XRYpoQCksC7Sf/pbqZliOfDo/X540ZBoj5ipci4h9TnV/WT5UUeDU/iYxnEvPsm5LCNtdP/XP/yZRNUdgpLjm3TZ9+wV4RfmrpxGDCAODxI+Y9uHg+YaUY/LAYxQdU8gOCsvsaeLjcMmoWjP6Y6l7PgZ+ifDbAwxerWgTQxGn4WgcH76MAhSeS3kC36H00qY6S1/Xpyx5jVGN8YUpj6S2oRezoCQjha0JX1
X-Microsoft-Antispam-PRVS: <CO2PR03MB2360DB88684C2182B3B0DA22E7340@CO2PR03MB2360.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6095135)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93001095)(3002001)(3231023)(6055026)(6096035)(20161123556025)(201703131430075)(201703131441075)(201703131448075)(201703131433075)(201703161259150)(20161123565025)(20161123563025)(20161123559100)(20161123561025)(201708071742011);
	SRVR:CO2PR03MB2360; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095)(400006); SRVR:CO2PR03MB2360;
X-Forefront-PRVS: 051900244E
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CO2PR03MB2360;
	23:Q3wrZxr6gjtsNSJffgIZzVaeU4gpLaKASLK2QrqHl?=
	=?us-ascii?Q?grV0g1IoT3bEVf7byTGVd7UuI/s6luSRuVMtCRBBVgsFjpZJhES/vV2FzwnY?=
	=?us-ascii?Q?6QH/GWV3dGEKkumYvlHb0l+TEbpFLF2fFPBWUFnDVgX1hi+DEBSqRiNekJPs?=
	=?us-ascii?Q?mspR7y/qUpmJ0U+KDpQ/kRIim1haKtItZ/4WTnd6JDmmPrmy9QDj7WutIUjt?=
	=?us-ascii?Q?dg3/pUfsEDcMmlEbVlt0j1s6neiLlqmfZWo+m6rTXgoicISyR5qkI84kDjCi?=
	=?us-ascii?Q?NIwKZYU41cGLQUxklEraD3AcM+aOoIvtfZNHo+1U5e23c7ngaoeuKQ8ENWOZ?=
	=?us-ascii?Q?f77wtU44XgJ7X8GkUJGegjb3aXJYsJ13HKKzTEsymW9kZ5p0Plf9Nr6EPN4M?=
	=?us-ascii?Q?rkEPV3OfPIwPACD0/+VYY5whQ+ye1p+xm4WCKUhCTk3ZwwgXI9GXdPQ+Sa7L?=
	=?us-ascii?Q?Yqi9CW1rbWF/Xy9zmJjfDBAbQSuVv49OVuF5Fe0quQlbWYez5ybc7Za+t6s0?=
	=?us-ascii?Q?2wLVUvaYnSfgh5lZZqzZwUkaLP9SRq6lHPb1OQq1ZWiFHqga77tdNPOztyKg?=
	=?us-ascii?Q?UzMS8It2BBKhnJe7uuFJfl1QymyV4N4hvDTmcoJbdwYIxzw+98C6hcWcjyi8?=
	=?us-ascii?Q?uGdeOdo2wuEHTB2E5hk3hyueTgo16HIYsxnV09pqRW1+eAl09HsKP5MNCtkT?=
	=?us-ascii?Q?Ts8bHiXKLLXe+r2F4JiKhNldr7ORlcbRfnxw0I+iaS8WU1n3Kc8SwONiDHJq?=
	=?us-ascii?Q?MpSLtPoJpjWsJuLBPnjXqCoqRSxI8w6QLVZ86K9E+6pOVNe9PpH1BgKFWL5W?=
	=?us-ascii?Q?Jy5SrZ4pCygaYLfmUyV+GiBC35M/itRSp/1ZiRK5JTzdeOu4AhobLLu2G2gm?=
	=?us-ascii?Q?3GNnqYHL+VfGH4aUObZNPr+kAJ0lakeFyVOBM/X4s1IAy21Wck4VofWzH5UH?=
	=?us-ascii?Q?T077nE1EPs9p5pjQj76h02xCsF+jS1C0Cop3MkIuu15RB5CnvHpdvpu3+d8n?=
	=?us-ascii?Q?jKFSVshlLp79IiiKhoL/oI3sJkb9oIPWY5TVypHFAaiA5ERAtv2Vfyqqd+9Y?=
	=?us-ascii?Q?LwTh6tWja6XwpJIm1lICJeShcjx2xg+tcdWixp6veIyX3Wu25X7fOjt9yMp0?=
	=?us-ascii?Q?XLJNC2C2qDAm0FY+YSdAKWqttOVU30JEltIEDNagEZPRh2TEmYH/A=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CO2PR03MB2360;
	6:zPRDPsFsn2yR4zy+LRvJvhl/KO9fdM/Qf6OX0JWeaBd8vWJ/VvhxZJ3rPN65BFhVAAdNMntFEO0IWvQP4aC2lHkJjsJ2MUX/JTByFXhA24ouOTsZ7XzAbWe+SSOlQS1j3SDLd0EOs/jHvJSORY2HrXqZ5zTy6BtoR3DHHcQU5GGY9aYB8j0AT3iB+TxMFeXMIUJYI/M+DHlMbrWUjs/2TYgAl8ANBFico63BYABnr8hlmzCTrMFEqo5aGWqZ9Izqmsov8VZ6W0QKxoIXf9yvSTgAFKWKOslL1Bv4V8Duh0a58X+4f/YPKusHDvTm5r5zUgGJS8+66NMTPrq+EVQQ9ywx81mP7eik2uDTRuOq6po=;
	5:91k7+iLxjoBBLkEI1as/AR78M9miK3DPH/fJJe/+64Y4TJV0TUIg9mulXJ8ZErzEYZwQmfKii7WsbgoMZdHY3AgKdFaPHhrFlf7zeJIxufwoNXqe++m2JHE2SDQNPHCfkrF2zR0lKTKPcmDV4SAc34A9T5MrSDyJ0LiFHZ26kI0=;
	24:NnCLxYZQHGNl9Yflx++XhbTw1Q9iPrkS87Eg0Z2q0GuucESZ7vTtezM2zD136oBMGQwbXA+CqdiA8Aglt9tsoTbtQKFBZwTKNueLRajxyCY=;
	7:3zSeeBBDZImsd3lbnSr2kist9pbFPjx6tiguDy1TpPr5NBAoSIQaMb7Bwyib3U5alvDemhm0aI4lu3o3BX7lsExxBrHePDP2Mz+hfl3ZF5Bj5ZkLBpAAUtok/2Nh5hHo8ihRXKqwy0DEa++p7lgl0K4MSWOyMnz3HetkjSUK+gb5A7iuxUB5sq3X0aBVLxeySYno8bVHb+NAd80i8yU82r19W4bSN7j6Y0k3MtmFFPYv28Xt6QkQOtk1+21pGlBx
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2017 10:12:41.3258 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d354816-7d14-4fbd-d842-08d54148e13a
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR03MB2360
Subject: [meta-networking][jethro][PATCH - resend] netperf: upgrade to 2.7.0+ with git version
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
X-List-Received-Date: Tue, 12 Dec 2017 10:12:48 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The homepage of netperf has been moved to github. The original webpage
www.netperf.org is redirected to github and tarballs are removed. So use
git version of recipe instead.

netperf 2.7.0 was released in July 2015 which is too old. So upgrade to
latest commit of git repo which is on Nov 29, 2016.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
(cherry picked from commit f8e7e5af3578937f056dddbe104a08bb35c56c64)
---

repost after non-subscriber e-mail bounced


 .../netperf/{netperf_2.6.0.bb => netperf_git.bb}             | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta-networking/recipes-support/netperf/{netperf_2.6.0.bb => netperf_git.bb} (89%)

diff --git a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb b/meta-networking/recipes-support/netperf/netperf_git.bb
similarity index 89%
rename from meta-networking/recipes-support/netperf/netperf_2.6.0.bb
rename to meta-networking/recipes-support/netperf/netperf_git.bb
index 760bab0f3..3f98193d9 100644
--- a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
+++ b/meta-networking/recipes-support/netperf/netperf_git.bb
@@ -4,20 +4,20 @@ SECTION = "net"
 HOMEPAGE = "http://www.netperf.org/"
 LICENSE = "netperf"
 LICENSE_FLAGS = "non-commercial"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a0ab17253e7a3f318da85382c7d5d5d6"
 
+PV = "2.7.0+git${SRCPV}"
 
-SRC_URI="ftp://ftp.netperf.org/netperf/archive/netperf-${PV}.tar.bz2 \
+SRC_URI="git://github.com/HewlettPackard/netperf.git \
          file://cpu_set.patch \
          file://vfork.patch \
          file://init"
-SRC_URI[md5sum] = "9654ffdfd4c4f2c93ce3733cd9ed9236"
-SRC_URI[sha256sum] = "cd8dac710d4273d29f70e8dbd09353a6362ac58a11926e0822233c0cb230323a"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=a0ab17253e7a3f318da85382c7d5d5d6"
+SRCREV = "f482bab49fcedee46fc5b755da127f608325cd13"
 
-inherit update-rc.d autotools
+S = "${WORKDIR}/git"
 
-S = "${WORKDIR}/netperf-${PV}"
+inherit update-rc.d autotools
 
 # cpu_set.patch plus _GNU_SOURCE makes src/netlib.c compile with CPU_ macros
 CFLAGS_append = " -DDO_UNIX -DDO_IPV6 -D_GNU_SOURCE"
-- 
2.13.5


