Return-Path: <mmcclain@uplogix.com>
X-Greylist: delayed 375 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 17 Jul 2018 19:26:42 UTC
Received: from s05-gw002.mycloudmailbox.com (s05-gw002.mycloudmailbox.com
	[199.244.76.202])
	by mail.openembedded.org (Postfix) with ESMTP id 39F1D605C3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2018 19:26:42 +0000 (UTC)
Received: from S05-MBX04-11.S05.local (unknown [10.30.33.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by s05-gw002.mycloudmailbox.com (Postfix) with ESMTPS id
	41VVVN3JQkzVq7X for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2018 15:20:28 -0400 (EDT)
Received: from localhost.localdomain (10.30.32.129) by S05-MBX04-11.S05.local
	(10.30.33.98) with Microsoft SMTP Server (TLS) id 15.0.1367.3;
	Tue, 17 Jul 2018 15:20:27 -0400
From: Matthew McClain <mmcclain@uplogix.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Jul 2018 14:20:23 -0500
Message-ID: <20180717192023.77954-1-mmcclain@uplogix.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-Originating-IP: [10.30.32.129]
X-ClientProxiedBy: S05-CAS010.S05.local (10.30.32.60) To
	S05-MBX04-11.S05.local (10.30.33.98)
X-RoutingAgent: Treated
Subject: [meta-java][PATCH] openjdk-8: 'do_unpack_remove_X11_wrappers' confuses pyro bitbake parser
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
X-List-Received-Date: Tue, 17 Jul 2018 19:26:42 -0000
Content-Type: text/plain

Renaming the function to anything else allows the recipe to be parsed.  The
problem appears to be the word "_remove_".  This affects both the sumo and
master branches.

Signed-off-by: Matthew McClain <mmcclain@uplogix.com>
---
 recipes-core/openjdk/openjdk-8-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index b2020c3..fbb10be 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -39,7 +39,7 @@ do_unpack_extract_submodules () {
     tar xjf ${WORKDIR}/${NASHORN_FILE} --transform "s,-${NASHORN_CHANGESET},,g"
 }
 
-do_unpack_remove_X11_wrappers() {
+do_unpack_delete_X11_wrappers() {
     find ${S}/jdk/src/solaris/classes/sun/awt/X11 -maxdepth 1 -name '*.java' -delete
 }
 
@@ -153,7 +153,7 @@ def jdk_configure_options(d):
     return options[3]
 
 do_unpack[postfuncs] += "do_unpack_extract_submodules"
-do_unpack[postfuncs] += "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', 'do_unpack_remove_X11_wrappers', d)}"
+do_unpack[postfuncs] += "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', 'do_unpack_delete_X11_wrappers', d)}"
 
 do_configure_prepend() {
         export ${@jdk_environment_options(d)}
-- 
2.17.1


