Return-Path: <samuli.piippo@qt.io>
X-Greylist: delayed 5456 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 20 Apr 2016 15:21:38 UTC
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0124.outbound.protection.outlook.com [157.55.234.124])
	by mail.openembedded.org (Postfix) with ESMTP id 2A16665CC3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 15:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=744FDfl72qyoN9xO608HphA1ddAucuMcWhQIvUwxg6I=;
	b=MYcFhpMVUQyDOgTQY606IT8TVrCkq5sU+zDfRA/L5KXbG8a51UUKJjQhCTpL1pmszcx3iwoTm1yDtVUzvtAhWu77qc/5ljB9AJ7IyVM6x4jClcntPokjwaQ39yQbL1lQ5RvnVJMgc011di0V+AnrDRIoGXjO/ow0kKPNccKWLCk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=qt.io;
Received: from piippo.it.local (91.217.248.11) by
	AM2PR02MB0562.eurprd02.prod.outlook.com (2a01:111:e400:840b::18) with
	Microsoft SMTP Server (TLS) id 15.1.453.26;
	Wed, 20 Apr 2016 13:50:42 +0000
From: Samuli Piippo <samuli.piippo@qt.io>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Apr 2016 16:51:02 +0300
Message-ID: <1461160262-4752-1-git-send-email-samuli.piippo@qt.io>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM3PR08CA0038.eurprd08.prod.outlook.com
	(2a01:111:e400:8840::48) To AM2PR02MB0562.eurprd02.prod.outlook.com
	(2a01:111:e400:840b::18)
X-MS-Office365-Filtering-Correlation-Id: 7fa8e143-1448-49a9-9b06-08d36922c3b9
X-Microsoft-Exchange-Diagnostics: 1; AM2PR02MB0562;
	2:wuIPOzFYB3i96Z0q/EgvJI9LO6lu+fQnpHnAo2vJL78xLhcmhnDRnxlFNuYe9NiGlYOMkA6VX7BJ/BVpWoX5DLmqs0LWfi52uPbRZtqBOGV8gsNWQcyF1aWcLfO8lh2kf4jRBgZC9HLhi0uMK2D3o6Am1h6OLtgDkBRoAT76S7USdXdnFnv9HRcuP62SVXty;
	3:VBw4E+ZZMQTeFMm5KHBU1SerBuQOkrCPbz+T8/UnXo4vL5cMXHlDh2z3iPc1+TjEyCJHONtfK3zkO+QssiV9CvH6HUK1fraqxZhqMrsAdaxxhegrddAJoQJ++qVX6Epb
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM2PR02MB0562;
X-Microsoft-Exchange-Diagnostics: 1; AM2PR02MB0562;
	25:MIm2I0mIaC9MweWrCpQhXuDCGkc1a/4rwqkfhusPTuYjLICXrhljbkpV9hb1rVZp2+Qum6hrWh5ou3DmEQwmx2nNx6O4qwb5KcvogAnpTGdzoU2PLVRUDIrKHKYdhupIGpYvmAidiNpq3t0bCUglt3zi0qoJaPvGLzsMjzkqagaWOcgw5kGpFbGJ2VYYDcUny8uOpitZ9t/juKYa34Z1nuT+XbT95wta+g8Se6CncGYUtQr4O2v7NDtQahHyya69T1OXJn5vtTe+Ug8vJGal9fYj85tpXOqXnnoOp8h3/0XlciAhPgwumI7cyFb9E3QIVSNMZkQ8mERgeYK7mH0t4x7UEYBgmSYhr6cGDe2EA1eb65BNFxjwIPMYjp/xzYrj6LNqzm/WuQGO8jYVRUiRhLbyTD4sRlSAckzVG/sx2d7LlUYBopM14GwvXK8P5tjXdXZxH+lPMefrJqCrIzB9zn/wuu1dMatLKnQ9qupEkheKMD3fp6D39l3Z9Cv2aVkaPJDsqaESN8VapmWmw7jk9pgZzAx9/03BxdL3MsrCYPvRhHBnxkobILFRkSI1DkPpEgyX7h9mP4/h2aUhZFfXETvdG4ZXdknuzoiLVew328OrekigobbetxvIo343L+rYNf2aIjhHqY2jhRUdT981Xw==
X-Microsoft-Antispam-PRVS: <AM2PR02MB056219AC0F328CADA237149BE96D0@AM2PR02MB0562.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(9101521026)(6040130)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6041046)(6043046);
	SRVR:AM2PR02MB0562; BCL:0; PCL:0; RULEID:; SRVR:AM2PR02MB0562; 
X-Microsoft-Exchange-Diagnostics: 1; AM2PR02MB0562;
	4:j9BBS/MlgNrzLcf75taJSM2WHa2jb98rsMHoKWiey7ZFbgYvjXrA8ZkEBrFRTMM8cVPBo3p5OAJQW9JSJ7iMzYBMD7/xJBEB/+3eaoR7VQRuq1i4Y3IEOWxZ5d2BPhNAuTDqdmShKgf8PKgGCvy+upsXixf8m610u85QcrmWYoSPB7W+PzCKmzG9/LU3o8xPCM83l13DVIWigTnheJtHVRCFsAbOA29z52bcVuOiQt1JHNmj0Zm5uLPtO+bRx7pfrdIHYc6UGlw7LMRh+RzmxViiyWcBRKu5xgFTuMdOWez9oU7Q/DvsYHxf51s2JOBMou4UtDFz4YK9csXmpIKCV6G7MHMxyBYNeZZPGDEeyPEhTNeB9SZCMAotEc+J7QcNMy9a/mJ3bX8yqZX0gG0JqZgULkwWsSbPzMSMI7P4+fhrL349b/YlCmOuE7hdpBb/
X-Forefront-PRVS: 0918748D70
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(189998001)(110136002)(107886002)(50986999)(48376002)(74482002)(5003940100001)(50466002)(81166005)(2906002)(36756003)(5008740100001)(33646002)(19580405001)(19580395003)(42186005)(86362001)(1096002)(450100001)(3846002)(50226001)(2351001)(92566002)(6116002)(66066001)(5004730100002)(586003)(229853001)(47776003)(7099028);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM2PR02MB0562; H:piippo.it.local;
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; AM2PR02MB0562;
	23:068iOrt3TZegAJGZobG+kg/bYnCl9bVwJ4CWWOImbJVvfVe/dDY/zMH4nLICA6MUeNAIezwOSfFVnaCICJwkKITUULtXgsILznqIZC0G+P1GuNMiTTnPz697phchEE1bTaQdOyhC/2aPAQbJwuA1Yd6poVD74Sdtxkav+rLMHLMm3+7VQb7z/Jd7BpDUCXeKnnXeAnb3LQwnEWOqnXDQa9fXS1KVrFWPlLy0YxgCeuGQbICXohqghBVLT24eYjejJG9w1pi0iGRa8ZltPC26L8938X83vMK+8aNjSSd3+IrHo2annf+WKFqzli6ka7+Ts0fWDbrL1tBMqB5BjM+AWuCirLy92rWF/zHJlS+SZQsWjwa6NGBurqhU2HD8svmeB/f7NX6LBJQx1PXF4+KidzJDwoHP9wrpwXHJZERid07/0lHxkeRSDRT9fMtjpscph75idPXC195eSZNTiqifu7Z+dwHg+hvtDVm71OpBdwnGwXZAZMa/xHOqIO61InilfE1AIweeWRssf6fTLgcMfmvRLj0u5TTgsslfiYSus2+kfPCnxHWCpSAa4jqQk+5xtRgP+m07nn4ZaXmLC2SLbpE8Vhnhgw++6kn4PN1zoppFiGeiEGwou95Mhnzy4Itd+C1E3kldJp8a/H3mKLnK4bOFxsA2HuH/3GWjI6hGddmSgRg1x+95JGf+VQxTaPpQk5iA8Cy8TETgOIK+eF+aEFOcnf3xxbzF1fPueZRoWk+n3S10POoRFICkQMmPxV+cTRcF2mTmHYNOTMSkDlOGklPE1vI+r8tN6o2FtB6o1CxchGtEzTQ95swaWTJd4WKqlN6Pm48QDiS0kX63rBRZu55ow4wzG45fCCEylOmAwesONHHM6+qiH+12za2qd0Sb
X-Microsoft-Exchange-Diagnostics: 1; AM2PR02MB0562;
	5:QkIBnAyx7Sjgm+YNCrD6DVSn4iMlWf1oxuSyHJgyYz3zBgj+rBzNnwiDGTEd/a0pdIEH+urnpiDXPPeXZOLfMhm8rgHmmQhVZsn5FwAuyPrNHUrwP7aEnYvtIjl8ky+4OTbj/NSnrPMl93CWBSa6Sg==;
	24:ALibIt/lj46qZh0ftxivFBk+V6RE8r5SqESnW8NyeBu8IU4iQ56BOxdVeHY1iQNG5bXcHzaCw9d5WmpEVPmA/F3eaOSSB2s1Zjmsc/l3yLY=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2016 13:50:42.1647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM2PR02MB0562
Subject: [meta-qt5][PATCH] qt5: Allow disabling SHA validation for branch
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
X-List-Received-Date: Wed, 20 Apr 2016 15:21:42 -0000
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
index 8a6d93e..1805551 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -3,10 +3,11 @@
 
 QT_MODULE ?= "${BPN}"
 QT_MODULE_BRANCH ?= "5.6"
+QT_MODULE_NOBRANCH ?= "0"
 
 # each module needs to define valid SRCREV
 SRC_URI = " \
-    ${QT_GIT}/${QT_MODULE}.git;name=${QT_MODULE};branch=${QT_MODULE_BRANCH};protocol=${QT_GIT_PROTOCOL} \
+    ${QT_GIT}/${QT_MODULE}.git;name=${QT_MODULE};nobranch=${QT_MODULE_NOBRANCH};branch=${QT_MODULE_BRANCH};protocol=${QT_GIT_PROTOCOL} \
 "
 
 S = "${WORKDIR}/git"
-- 
1.9.1


