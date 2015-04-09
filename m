Return-Path: <Dmitry_Eremin@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id E431065C98
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Apr 2015 20:03:31 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-03.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1YgIfl-0001HR-AQ from Dmitry_Eremin@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Apr 2015 13:03:33 -0700
Received: from fangorn.rup.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-03.mgc.mentorg.com (137.202.0.108) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Thu, 9 Apr 2015 21:03:32 +0100
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 Apr 2015 23:03:29 +0300
Message-ID: <1428609810-15698-2-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1428609810-15698-1-git-send-email-dmitry_eremin@mentor.com>
References: <1428609810-15698-1-git-send-email-dmitry_eremin@mentor.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/3] lmsensors-config: add rrdtool to lmsensors-config-cgi RDEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Apr 2015 20:03:32 -0000
Content-Type: text/plain

QA reports a warning because lmsensors-config-cgi uses rrdtool, but does
not declare runtime dependency on it. Add rrdtool to RDEPENDS_${PN}-cgi.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb b/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
index fe2f499..df834a3 100644
--- a/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
@@ -46,7 +46,7 @@ PACKAGES =+ "${PN}-fancontrol"
 # sensord web cgi support
 PACKAGES =+ "${PN}-cgi"
 RRECOMMENDS_${PN}-cgi = "lighttpd lighttpd-module-cgi"
-RDEPENDS_${PN}-cgi = "${PN}-sensord"
+RDEPENDS_${PN}-cgi = "${PN}-sensord rrdtool"
 FILES_${PN}-cgi = "/www/*" 
 
 # libsensors configuration file
-- 
2.1.4


