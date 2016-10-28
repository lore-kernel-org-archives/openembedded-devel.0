Return-Path: <johannes.pointner@br-automation.com>
X-Greylist: delayed 903 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 28 Oct 2016 06:38:07 UTC
Received: from mail2.br-automation.com (mail2.br-automation.com
	[213.33.116.61])
	by mail.openembedded.org (Postfix) with ESMTP id 8F9B6719B0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Oct 2016 06:38:07 +0000 (UTC)
X-AuditID: c0a80110-2565e9a000000f55-db-5812eec85e39
Received: from brsmtp01.br-automation.com (Unknown_Domain [192.168.1.60])
	by mail2.br-automation.com () with SMTP id E4.9E.03925.8CEE2185;
	Fri, 28 Oct 2016 08:23:04 +0200 (CEST)
From: Johannes Pointner <johannes.pointner@br-automation.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Oct 2016 08:22:38 +0200
Message-Id: <20161028062238.30497-1-johannes.pointner@br-automation.com>
X-Mailer: git-send-email 2.10.1
X-MIMETrack: Itemize by SMTP Server on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 28/10/2016 08:23:11,
	Serialize by Router on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 28/10/2016 08:23:16,
	Serialize complete at 28/10/2016 08:23:16,
	Itemize by SMTP Server on BRSMTP01/Eggelsberg/AT/B&R(Release
	9.0.1FP5|November 22, 2015) at 28.10.2016 08:22:58,
	Serialize by Router on BRSMTP01/Eggelsberg/AT/B&R(Release
	9.0.1FP5|November 22, 2015) at 28.10.2016 08:23:01,
	Serialize complete at 28.10.2016 08:23:01
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNJMWRmVeSWpSXmKPExsVyYAWjje6Jd0IRBq3fFCwuHl7K7MDocW7j
	CsYAxigum5TUnMyy1CJ9uwSujMNHPzAXTOasaPyj28DYx9HFyMkhIWAisebEPdYuRi4OIYHN
	jBIP5s5jAkmwCdhKHJnwlQXEFhHQlfj4YS4jiM0sYC3xfvkCVhBbWMBK4tW7Q0A1HBwsAqoS
	65ZEgYR5BTwk2ld9YYOYLy9x4eopFpD5EgIbWSQO/W1ggUgISZxefJZ5AiP3AkaGVYziuYmZ
	OUZ6SUW6iaUl+bmJJZn5eXrJ+bmbGCFeFNjBuPuN9iFGAQ5GJR7eRfOFIoRYE8uKK3MPMUpw
	MCuJ8K56AxTiTUmsrEotyo8vKs1JLT7EKM3BoiTOa3wXKCWQnliSmp2aWpBaBJNl4uCUamDk
	sVcqtYx92R600uOXB+NBgzvL+i06+UROX2VT2b7b/1uvec0D9521uSzWWVtXhUcd/VBdPTeX
	4cRO7T0fb/88I+m+Pac2Z8uMSf0/RYr+vi/4ptv75tbUgMzm+LyCUnEZ6QVWPzYVrDzhXLXe
	ZYPoc+Nfb/YF7J3MMMFUc/UPydoDfEx/DiYqsRRnJBpqMRcVJwIARxAe6d4BAAA=
Subject: [meta-oe][PATCH] libtiny2: Upgrade 3.0.0 -> 4.0.1
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
X-List-Received-Date: Fri, 28 Oct 2016 06:38:09 -0000

This new release includes loots of small (incompatible) changes, and
the addition of int64 support.

Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
---
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


