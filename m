Return-Path: <johannes.pointner@br-automation.com>
Received: from mail2.br-automation.com (mail2.br-automation.com
	[213.33.116.61])
	by mail.openembedded.org (Postfix) with ESMTP id A8F7560767
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Oct 2016 07:33:34 +0000 (UTC)
X-AuditID: c0a80110-2565e9a000000f55-54-5812ff4f4fba
Received: from brsmtp01.br-automation.com (Unknown_Domain [192.168.1.60])
	by mail2.br-automation.com () with SMTP id 2A.6F.03925.F4FF2185;
	Fri, 28 Oct 2016 09:33:36 +0200 (CEST)
From: Johannes Pointner <johannes.pointner@br-automation.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Oct 2016 09:32:59 +0200
Message-Id: <20161028073259.16509-1-johannes.pointner@br-automation.com>
X-Mailer: git-send-email 2.10.1
X-MIMETrack: Itemize by SMTP Server on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 28/10/2016 09:33:45,
	Serialize by Router on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 28/10/2016 09:33:49,
	Serialize complete at 28/10/2016 09:33:49,
	Itemize by SMTP Server on BRSMTP01/Eggelsberg/AT/B&R(Release
	9.0.1FP5|November 22, 2015) at 28.10.2016 09:33:31,
	Serialize by Router on BRSMTP01/Eggelsberg/AT/B&R(Release
	9.0.1FP5|November 22, 2015) at 28.10.2016 09:33:33,
	Serialize complete at 28.10.2016 09:33:33
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLJMWRmVeSWpSXmKPExsVyYAWjjW7Af6EIg6U/mSwuHl7K7MDocW7j
	CsYAxigum5TUnMyy1CJ9uwSujBNf77AXbOSs6Oy/xtbAuIiji5GTQ0LAROJR02SWLkYuDiGB
	zYwSkxv2sYEk2ARsJY5M+MoCYosI6Ep8/DCXEcRmFrCWeL98ASuILSzgING5/g47iM0ioCrx
	du4WsHpeAQ+JVT8WMUEskJe4cPUU2AIJgY0sEt3LZrNDJIQkTi8+yzyBkXsBI8MqRvHcxMwc
	I72kIt3E0pL83MSSzPw8veT83E2MEE8K7GDc/Ub7EKMAB6MSD6/QF6EIIdbEsuLK3EOMEhzM
	SiK8Pr+AQrwpiZVVqUX58UWlOanFhxilOViUxHmN7wKlBNITS1KzU1MLUotgskwcnFINjAue
	OGz/1+7ekC6/bcXejUFHbllGPub758Tbnj//5pmeWKez/msWZlp2Hzmwo0T+xKLJK459fqm5
	+uDmrfZX7nIf3lriteyyUNEiUc8dG53CZLVOWMa07unJNzl/OfPt96166UfsJB8YfpRrcRIV
	CD93tYY/8aTEy3POV9WExLaKbZ+2gP/GxUolluKMREMt5qLiRACtOTgL4AEAAA==
Subject: [meta-oe][PATCH v2] libtinyxml2: Upgrade 3.0.0 -> 4.0.1
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
X-List-Received-Date: Fri, 28 Oct 2016 07:33:36 -0000

This new release includes loots of small (incompatible) changes, and
the addition of int64 support.

Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
---
v1 -> v2:
* Fixed subject

 .../libtinyxml2/{libtinyxml2_3.0.0.bb => libtinyxml2_4.0.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libtinyxml2/{libtinyxml2_3.0.0.bb => libtinyxml2_4.0.1.bb} (88%)

diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_3.0.0.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_4.0.1.bb
similarity index 88%
rename from meta-oe/recipes-support/libtinyxml2/libtinyxml2_3.0.0.bb
rename to meta-oe/recipes-support/libtinyxml2/libtinyxml2_4.0.1.bb
index af0b785..3a66598 100644
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_3.0.0.bb
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_4.0.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://tinyxml2.cpp;endline=22;md5=c19221dbd8a66ad3090462af4
 
 SRC_URI = "git://github.com/leethomason/tinyxml2.git"
 
-SRCREV = "1977a7258cc66fd4da7f1e9da05a4933646a7803"
+SRCREV = "74d44acb176f8510abf28ee0a70961eb26631988"
 
 S = "${WORKDIR}/git"
 
-- 
2.10.1


