Received: from na3sys009aog109.obsmtp.com ([74.125.149.201])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@nanometrics.ca>) id 1Pztxg-0006xo-Lo
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 17:52:41 +0100
Received: from source ([209.85.214.172]) (using TLSv1) by
	na3sys009aob109.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTYDqampWhkw6KRKQ8EOgLliZ/1D3HFRT@postini.com;
	Wed, 16 Mar 2011 09:50:59 PDT
Received: by iwl42 with SMTP id 42so2804539iwl.17
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 09:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=G5lQhNyENtcWaVUp95RA+QYrnIuxspkOlPX7GWAuzuE=;
	b=cScGR2paHZFWHAsR+WF71eVtmIksJd45J0eIJRdh87PYOfh2r8GJSAdeaZGsklFHRg
	eCC8Yx1EdLHf9jd92/MPP5uRdMDZ00UAVYXG3ASF4XQJUwqNZOiENkwkB7h6wFJQuYTF
	+3snFqbq3KcSeh0/nHu+b6yEukD6KEzpAzcaA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=nanometrics.ca; s=google;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=kY67RHyCekTEn4dj/JnYDOFqBF1dQ36exiDfgSGyxVWavAviymYKm9FGAXk4gU/njJ
	ZMM03bT4M7W1RG31HZ7YS1Rh7zkWH0eaAQa2TU5PUv8CvVnOUVjcgXuBfAil8agceJUD
	AWMQzPMKq7qck3jEt4jRbiLIwaltxqY+B5KOU=
Received: by 10.231.204.16 with SMTP id fk16mr200146ibb.49.1300294244702;
	Wed, 16 Mar 2011 09:50:44 -0700 (PDT)
Received: from localhost.localdomain ([206.191.47.130])
	by mx.google.com with ESMTPS id q34sm39593ibu.40.2011.03.16.09.50.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2011 09:50:44 -0700 (PDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Mar 2011 12:50:34 -0400
Message-Id: <08cb84d24fdd8e9d40a5db836b98a3706187c7c6.1300293663.git.bengardiner@nanometrics.ca>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1300293663.git.bengardiner@nanometrics.ca>
References: <cover.1300293663.git.bengardiner@nanometrics.ca>
Subject: [2010.03-maintenance] [PATCH 1/7] image.bbclass: add link to .rootfs.<type> or .<type>.img
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Mar 2011 16:52:41 -0000

The current image link-creation code will unconditionaly create a link
from .<type> pointing to the .rootfs.<type> output.

This is not compatible with the UBIFS images produced which have
.<type>.img extension since they are not considered to be valid rootfs
images when they are not included in a UBI container.

Check for existence of the link target .rootfs.<type> before creating the
link and fallback to a check for the .<type>.img target after that.

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
Acked-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Tom Rini <tom_rini@mentor.com>
(cherry picked from commit cfde49e8d0f1cf09d589910f1a342849db148519)

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
---
 classes/image.bbclass |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/classes/image.bbclass b/classes/image.bbclass
index 9621614..d7fe9b0 100644
--- a/classes/image.bbclass
+++ b/classes/image.bbclass
@@ -140,7 +140,11 @@ def get_imagecmds(d):
         cmd  = "\t#Code for image type " + type + "\n"
         cmd += "\t${IMAGE_CMD_" + type + "}\n"
         cmd += "\tcd ${DEPLOY_DIR_IMAGE}/\n"
-        cmd += "\tln -fs ${IMAGE_NAME}.rootfs." + type + " ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}." + type + "\n\n"
+        cmd += "\tif [ -f ${IMAGE_NAME}.rootfs." + type + " ]; then\n"
+        cmd += "\tln -fs ${IMAGE_NAME}.rootfs." + type + " ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}." + type + "\n"
+        cmd += "\telif [ -f ${IMAGE_NAME}." + type + ".img ]; then\n"
+        cmd += "\tln -fs ${IMAGE_NAME}." + type + ".img ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}." + type + "\n"
+        cmd += "\tfi\n\n"
         cmds += bb.data.expand(cmd, localdata)
     return cmds
 
-- 
1.7.1



