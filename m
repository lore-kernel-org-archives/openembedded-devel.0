Return-Path: <samuli.piippo@qt.io>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0125.outbound.protection.outlook.com [157.55.234.125])
	by mail.openembedded.org (Postfix) with ESMTP id 15BAC60118
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 May 2016 08:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=QDki4L71/fu0qGmZ1o2wKedOoTrXepWX9PDw4C4y7o8=;
	b=G6pTwsMDZGd55KOF8oyNdEifCRyrKPo0TiXQVWrOheMCqxcYavZrlW8+f30woVQt4OZtE1WA9DSXTZMk44fubKikV1E+JZZU+3E/Hd0JhEfVcCYtloy6A/waN5miwnHRl7waFfcPRQUTRXo+3HMxX0DO5fcVlPc1uo6RW0VLjGs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=qt.io;
Received: from piippo.intra.qt.io (192.89.120.53) by
	AM2PR02MB0563.eurprd02.prod.outlook.com (2a01:111:e400:840b::19) with
	Microsoft SMTP Server (TLS) id 15.1.492.11;
	Mon, 9 May 2016 08:33:04 +0000
From: Samuli Piippo <samuli.piippo@qt.io>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 9 May 2016 11:33:40 +0300
Message-ID: <1462782820-30842-1-git-send-email-samuli.piippo@qt.io>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.89.120.53]
X-ClientProxiedBy: AM3PR01CA059.eurprd01.prod.exchangelabs.com
	(2a01:111:e400:8828::49) To AM2PR02MB0563.eurprd02.prod.outlook.com
	(2a01:111:e400:840b::19)
X-MS-Office365-Filtering-Correlation-Id: 4cca5fba-c96b-477f-bcd7-08d377e48a95
X-Microsoft-Exchange-Diagnostics: 1; AM2PR02MB0563;
	2:0Dh0gAKomVManBXixyO2uepofaDDSifW/YZ/TPoJqm17eU3Qoe7yC6QlRWV2ZiCw26sYa/cI7woPXEGHRUGj8YO4aouihp+hHSQOmDR4OfnX2TVSZsXI8k/tIaIQ9e/x5T3WGqZvQ+8m+vaDj4CxOsD3AhZ9OVKwSdn3kiHsVmno/DZNN2C3VXsOPlJIQrRP;
	3:barGEmBArdVk6vUTevgBFxvaFVZP2FkcgIBR7HmpCoToP4pCMut1PaISA8T8eqvF4aw3xmLgwrsU9qOjf7+UK28DzCmPNjyt9WdRwKPpEaaKSAg5JdtBQHlHJuieD4+p
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM2PR02MB0563;
X-Microsoft-Exchange-Diagnostics: 1; AM2PR02MB0563;
	25:Ik/Ue0+58vMLS3mZhTqq14XOeANX8W65+N4HAqB+skKunqrsta6CmAQT56apB10NAgYzs8ueSoUSLmZhrxurRKxf3vfXZoKX0EoYJWlTiEOkBA1c8O/qwFn14zbiPi6ttWTbHeiEWRd26yXpashGaU9lk+/7TvCQO2KyWUMQbqwwj6OTu2WZzCymbDSBEbf3rGU2jWobzSYu4VHI4e6O9vxf4YHom1WFr4GeQHR+TMr/8oL/xm9PlXb0nAXjISpWKS7PBSO/D6Tl2iYChSkWudKQ9xcbrMczo+ZIhvs3hvzQqMPGfeB9jRG11EWUxviYgHNfmVUZwuAmbpkePHvmAxF4S2eWMG18J9EsOsyn3zqkG7By7WxtBgOdL2uNMuXuXi7UEzI4r0XCF9OxS9CH/pm//aF95+lsT0kJ4Pt1nzycJBQGyDbzW4t24lJCWFfQokFYcW1gyuIdHqV4ZrFxHk1gYxwydRJ/rlrvLh1DQELJG9hq1bKz0Ikw7Vd/anRIRJTHt1yVdGwlv08YTocS8SRa3486C5HfEFNunC3zToZZv0TKQyel1Mp3O2aJ8wdjSzixyy46D4w7+rNujhOgM/yTn7p3HjEVfgGnRVNhtF3MVcsOYXMqD4uDOO3dRLLIP/H4+kwYxJglzMZszpMFryosGZChAgZSZojBTUIfgOXcLfFm8xwQurMg2MHooKvzI4nEnHOzfQKz3blj4Al6sjHQLptvRQJnCIKwPtcr9LG8wQZuvrVMZbgg/9Sgl4JW;
	20:EqhG0K8pwVp0i7lRfvXq0EQ7c4qaif0a97Az11yb08Q6pgou2/+323NWB8U40KD87ySuot6CpOPK5Y6K+Lh9w7evmZaq6lMO0rJrhBzzrMF1F3QUVe76ueAJG2IYxt/6BNoYT3zay4at0RVEq+v+edT5zkWpDhfdhj6gfR0leF4=
X-Microsoft-Antispam-PRVS: <AM2PR02MB0563FE9D90D835C00F7B6693E9700@AM2PR02MB0563.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040130)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6041072)(6043046);
	SRVR:AM2PR02MB0563; BCL:0; PCL:0; RULEID:; SRVR:AM2PR02MB0563; 
X-Microsoft-Exchange-Diagnostics: 1; AM2PR02MB0563;
	4:1DYcUrAdbICBey9MtBsCw/n0I0xy0/0kHZJ+2XwXD5NXsIeZvI0mI4w6AQKQdCvrNiSePm6qp5SB37PByfsu+UmZgNQD/Z8xsplUR2V4/2hhI75oF3MjH1/08fIgikkL4MiXKvtPEt/BoFhFOcvT0ZIo3TPZcRjfIaBRfq/sQ2mbdx9Ssny3qJYYrlDxH/g4WUiAyIIGqRZvEAWKFQJqY7vbqkUb6RhqJTsa+IUP733kdNo7QFUBlej/oPbz9IZ4N6GlWxzblh5T21KYYrAYuXI4lnxBevj+XIGpyfgKpgSuwwCoEzsZWsqi1CvPqvSlS5VV/2GL5ZOd/k8o+a154PhZI4KELuIPG1J1TtZI9HSQtQtnvoB5QUo03/lI98SMuq+HVz768/1N4d18OdHndbR94R7UrJdDHhQCNC1Rj2w=
X-Forefront-PRVS: 0937FB07C5
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(9170700001)(189998001)(50466002)(110136002)(107886002)(450100001)(6116002)(3846002)(2351001)(48376002)(229853001)(33646002)(74482002)(50226002)(2906002)(66066001)(81166005)(47776003)(5008740100001)(5004730100002)(586003)(50986999)(5003940100001)(86362001)(575784001)(36756003)(19580395003)(19580405001)(42186005)(92566002)(53416004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM2PR02MB0563;
	H:piippo.intra.qt.io; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; AM2PR02MB0563;
	23:INpBuQvXq841uA58HwUuIzlACEEHBs4bWEmHnSI45xlroCNZJOUkLT/iD2GRZEgwK+xRhocsnxfwOO/+C9MSiN+Nj0s2B+jIslR3KLZcT4L0w/zoouBrQ2RHbvY0t/ZbnZBKxWWG1r4+GxvGLXao3iNiQn+Pa2OO8ukzFv8fh4OBByZuAGnPUrkEPejtf2wKEQYWRsS06gAIf4MbOxPUEoCdxwOI6McnaSudcQgZNyC8YXVY3GNVcGKK2Fac3ORusDJ+SQYBXgbKa0B6qBJbNA0b7M3ucuQR0qLdTY1QPQPLxGw/gq9PWlcAe4rW9YJT5Gv3B7yke04OM8vKVjwjJh+2+DPyTc2uDlGRS+xh2Fc672HbhFKU1ly6dfEkZXfP/urKK1Fg+bLdYGBDyrgcTfX4fhMdS3TrKz37fTYe/VujkhYQahwoHxuZ4OURVqcw68AcXQj3Gw/mx0VPn7CLoom9QP8Io97aJmm4k2XColoZERdxJA6G/j5V6WwyHlgekKQUIg7M/7NCWAu/PZ5iaqehtmBUYQsirrt8ACHaODqfNQkdwYNIQT5eeEkujVbhqqSI8ffqcK4xFK+bLd+hvzDFEy/zW/iJ/Ewmv5uKZBN4ql0UxIKp2OLU90fbLjxZwklzHvijT6gIm4EQaLHP24BkVWKoiJSjpqXdjE0vEZ0XQjJ+85CABNqy8A+LYBaOKPl41DJr55C8SfbsW+YBV6tgSane7oATgJ9hiEmiQH2y3suw3FQdSzK3V82aGHux+JDMUiUqa0dsBeXxRcAZad4isEOsTr86MLrEIao0aNFeE1Z/qZP0viiJ4bxm7RsCMmbGv9WlzvR8Q1zvOxzqd+ZRrQXwzXyAX9GY3Pfk2Qyl/0C7b6swbx5q0f2sDXdaiLeKFJGUkThJwp2dqCDMXdiyN8E6VOxipzegfY5yjQI=
X-Microsoft-Exchange-Diagnostics: 1; AM2PR02MB0563;
	5:WyKnCnAS35/KqIFwOBtD4etwC1K2QWqbuTFUi1jN9Vjs8NQmpopeMij6gr+f5yJZD6UO/H5lshyjJGbbilYm2Cnbl9ABr6hxEGtWzgypV26nDk7pQ/1RzKZ1h74cUkBonY3XK7QLo8iwUXpx8x1MJQ==;
	24:gfsenoqtGqLHHsT21gMbZcrY4ANg28qJLu/INEZUNuZVrY2seHTVD0H3/Nt5N4UCRBuxNZsEsZfnayyNOghZHgrsAxO2uXwRGi4cG+qo19c=;
	7:/6Su1b16h2yFs+bUo2BujOgVt6+efYoBcctnSpvJ6Lssk87/jRS4psI4wxetpsH00ihXqRJ3NZICAhWNtS4+zqXSN6FqcnbBR6qvyI0tKvbIW+5DKI6lrvDojxBfShHAvox6556FeTfDLj7M6bb/6NY7ijRK7fjO2mYKLZeYYITYm9ysgrG1G2zP1NmRQKnn
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2016 08:33:04.9283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM2PR02MB0563
Subject: [meta-qt5][PATCHv2] qt5: Allow disabling SHA validation for branch
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
X-List-Received-Date: Mon, 09 May 2016 08:33:12 -0000
Content-Type: text/plain

Qt releases are done from a release branch (5.x.x), which is later merged
back to a stable branch (5.x) and then removed. When a recipe is updated
to use the released SHA from the release branch, it will eventually break
when the release branch is removed. This happens because bitbake tries to
validate that given SHA is found from the given branch. Add additional
variable that can be used to disable the SHA check when branch is known
to be later removed, but SHA remains valid.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 recipes-qt/qt5/qt5-git.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index 8f88b6d..ad0abe8 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -3,10 +3,11 @@
 
 QT_MODULE ?= "${BPN}"
 QT_MODULE_BRANCH ?= "5.7"
+QT_MODULE_BRANCH_PARAM ?= "branch=${QT_MODULE_BRANCH}"
 
 # each module needs to define valid SRCREV
 SRC_URI = " \
-    ${QT_GIT}/${QT_MODULE}.git;name=${QT_MODULE};branch=${QT_MODULE_BRANCH};protocol=${QT_GIT_PROTOCOL} \
+    ${QT_GIT}/${QT_MODULE}.git;name=${QT_MODULE};${QT_MODULE_BRANCH_PARAM};protocol=${QT_GIT_PROTOCOL} \
 "
 
 S = "${WORKDIR}/git"
-- 
1.9.1


