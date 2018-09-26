Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 4F39979567
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 13:21:26 +0000 (UTC)
Received: from heron.blarg.de (p5DE2B75B.dip0.t-ipconnect.de [93.226.183.91])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id C54712209BF;
	Wed, 26 Sep 2018 15:21:26 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Sep 2018 15:21:14 +0200
Message-Id: <20180926132115.10455-6-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20180926132115.10455-1-max+openembedded@blarg.de>
References: <20180926132115.10455-1-max+openembedded@blarg.de>
MIME-Version: 1.0
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH 6/7] fluidsynth: drop extra dash from `-Denable-pulseaudio=OFF`
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
X-List-Received-Date: Wed, 26 Sep 2018 13:21:26 -0000
Content-Transfer-Encoding: 8bit

From: Max Kellermann <max.kellermann@gmail.com>

This caused a build failure:

 CMake Error: The source directory ".../tmp-glibc/work/aarch64-oe-linux/fluidsynth/1.1.11-r0/build/--Denable-pulseaudio=OFF" does not exist.

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 .../recipes-multimedia/fluidsynth/fluidsynth_1.1.11.bb          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.11.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.11.bb
index 5002fc9f3..4df310275 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.11.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.11.bb
@@ -20,5 +20,5 @@ EXTRA_OECMAKE = "-Denable-floats=ON -DLIB_SUFFIX=${@d.getVar('baselib').replace(
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio', d)}"
 PACKAGECONFIG[sndfile] = "-Denable-libsndfile-support=ON,-Denable-libsndfile-support=OFF,libsndfile1"
 PACKAGECONFIG[jack] = "-Denable-jack-support=ON,-Denable-jack-support=OFF,jack"
-PACKAGECONFIG[pulseaudio] = "-Denable-pulseaudio=ON,--Denable-pulseaudio=OFF,pulseaudio"
+PACKAGECONFIG[pulseaudio] = "-Denable-pulseaudio=ON,-Denable-pulseaudio=OFF,pulseaudio"
 PACKAGECONFIG[portaudio] = "-Denable-portaudio=ON,-Denable-portaudio=OFF,portaudio-v19"
-- 
2.19.0


