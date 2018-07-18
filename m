Return-Path: <mmcclain@uplogix.com>
Received: from s05-gw001.mycloudmailbox.com (s05-gw001.mycloudmailbox.com
	[199.244.76.201])
	by mail.openembedded.org (Postfix) with ESMTP id 12A4870100
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2018 18:13:04 +0000 (UTC)
Received: from S05-MBX04-11.S05.local (unknown [10.30.33.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by s05-gw001.mycloudmailbox.com (Postfix) with ESMTPS id
	41W4y91KW5zVkZk for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2018 14:13:05 -0400 (EDT)
Received: from localhost.localdomain (10.30.32.131) by S05-MBX04-11.S05.local
	(10.30.33.98) with Microsoft SMTP Server (TLS) id 15.0.1367.3;
	Wed, 18 Jul 2018 14:13:04 -0400
From: Matthew McClain <mmcclain@uplogix.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Jul 2018 13:12:59 -0500
Message-ID: <20180718181259.92621-1-mmcclain@uplogix.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-Originating-IP: [10.30.32.131]
X-ClientProxiedBy: S05-CAS009.S05.local (10.30.32.59) To
	S05-MBX04-11.S05.local (10.30.33.98)
X-RoutingAgent: Treated
Subject: [meta-java][PATCH v2] openjdk-8: 'do_unpack_remove_X11_wrappers' confuses pyro bitbake parser
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
X-List-Received-Date: Wed, 18 Jul 2018 18:13:05 -0000
Content-Type: text/plain

When building without X11 support on the sumo or master branches of
meta-java with the pyro branch of poky, meta-oe, etc, the recipe fails
to parse.

Renaming the function to anything else allows the recipe to be parsed.  The
problem appears to be the word "_remove_".

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
2.18.0


