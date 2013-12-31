Return-Path: <otavio.salvador@gmail.com>
Received: from mail-gg0-f181.google.com (mail-gg0-f181.google.com
	[209.85.161.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2091961223
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2013 02:08:46 +0000 (UTC)
Received: by mail-gg0-f181.google.com with SMTP id y1so2419774ggc.40
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Dec 2013 18:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=bFLEAT8Dt48Jl4uIqMQvr0RBSzTBi2Zfj50OWx+lHN0=;
	b=ztjlrLtmlwUsVRvYM+oWAwDqbrj3XgjIsqT3i6Zd3wDtOwAjt8Y8/vAAzlPxVTAHWJ
	rPCt/mjXzkKr5WHqdFTs+YSuvJA4vtGeTYdoZkFX7X6t8VKF44zF2023mS8uM+GfQLxj
	JENoR9f/j0iVstUDL//798F7jGMaURSq6gsnTPHaEvhLVELKKJS48qdfMtHparwt1mYP
	dinW3dFpYhATcsLIZzZLVoIqN5X2bzsJfx8G3tL1SwjYaAIxk9elRTaZsOnbwEK8Ru/G
	kldLOgOxWjtknwkMEByt7jwWFRRuP847elKb7+f10IdNu4Fqed8/VjLFuzz2BMeMaj85
	liaw==
X-Received: by 10.236.129.135 with SMTP id h7mr5162288yhi.75.1388455726765;
	Mon, 30 Dec 2013 18:08:46 -0800 (PST)
Received: from nano.lab.ossystems.com.br (72.17.156.179.nw.nuvox.net.
	[72.17.156.179])
	by mx.google.com with ESMTPSA id h23sm64211412yhc.0.2013.12.30.18.08.42
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Dec 2013 18:08:46 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 234171769348F; Tue, 31 Dec 2013 00:08:32 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 31 Dec 2013 00:08:31 -0200
Message-Id: <1388455711-20416-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.5.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe] tearofsteel-1080p: Add recipe
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
X-List-Received-Date: Tue, 31 Dec 2013 02:08:46 -0000

This adds the Tears of Steel movie in 1080P as a sample content for
easy addition in images.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../sample-content/tearsofsteel-1080p.bb                   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb

diff --git a/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb b/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb
new file mode 100644
index 0000000..86e79f3
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Tears of Steel movie - 1080P"
+LICENSE = "CC-BY-3.0"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
+
+SRC_URI = "http://ftp.nluug.nl/pub/graphics/blender/demo/movies/ToS/ToS-4k-1920.mov"
+
+inherit allarch
+
+do_install() {
+	install -d ${D}${datadir}/movies
+	install -m 0644 ${WORKDIR}/ToS-4k-1920.mov ${D}${datadir}/movies/
+}
+
+FILES_${PN} += "${datadir}/movies"
-- 
1.8.5.2


