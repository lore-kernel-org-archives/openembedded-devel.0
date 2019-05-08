Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2BC057DE43
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 May 2019 19:58:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44znNd1Skzz7P
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 May 2019 21:58:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557345537;
	bh=cxm2nvzenTj0stU8oMtzAOK+a+uB0SdVlN6jWTh5c1w=;
	h=From:To:Subject:Date:From;
	b=q+wlx0ajrZkv9lgOixOxkFxw+INr+tvU3oJfLzRpnSnjVzPyISrgKgf27D1jz6/5P
	Aaq3vsMFoZ3+PaDY2ZZu+eFOq+qGBouMZHYgXZnFR/GQHMAAdJaYma0F2ufjg9aIo9
	T1nYtcoxOyc6YZt/U4DCDBXqXQPNkfVGo5koxZmNI/jOwC3tZ5Al6dC4Bt8kdDeuro
	XMF+Fzjd+Gvlx2M5OYYvdZkuhX71tq/zVgKr1w6PCLeMhUKz4xGjwVGz7ML+J2YtEj
	FaE8TtpOS8lSPVGYdUjt8Fj8aAbExdrIOKedibfD3/GGbdlhy445AxWZUkUdkSHDDc
	nvrcFl0UpZt5fVNDapk11mov6od22vZpLjKQdVuZf3R0hdmRFwkI1jt2Kl1bBkrstv
	3dSIymbh5zT+f6QoWvORa89CG6dvHqz69YaFfUevfRg5TQQP+CR+r+6r3sfEsm4sS2
	3xrQhfsM29VId4jh6kCIB8TwyTdg8/eGGrmxvg0Nm27rQfKYtAdkmDB62ssM3EuIzX
	UxIaUdW1zk0rLJJVHhSzUnXNUxAB+8KXzqPME58qZTrja60yuS8OLMQhVDGSBJ35ao
	USeZWd0GkeEuZSRhhnqBfmvVoi8e702F6XNGP9a1ig93ycbg5MbmbM3upOjFtgSzWI
	XdO5TtB8WQ/ZA53fITJEvJFQ=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 May 2019 22:58:51 +0300
Message-Id: <20190508195852.28803-6-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-multimedia][PATCH] fluidsynth: Explicitly disable readline support
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
X-List-Received-Date: Wed, 08 May 2019 19:58:56 -0000

readline is GPL, so make it explicit that it shouldn't
be enabled accidentally.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb
index 4f600a218..9a8cb87ba 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb
@@ -8,7 +8,7 @@ SRC_URI += " \
     file://0003-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch \
 "
 
-EXTRA_OECMAKE = "-Denable-floats=ON -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
+EXTRA_OECMAKE = "-Denable-floats=ON -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} -Denable-readline=OFF"
 
 do_configure_append() {
     make_tables.exe ${B}/
-- 
2.17.1


