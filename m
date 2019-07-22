Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0E16B60069
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 13:09:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45shm418hkz6b
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 15:09:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563800996;
	bh=mTRPSiVUotBG5bGx79z0LUTzzL6bguIzHSlc4Tg9EwU=;
	h=From:To:Subject:Date:From;
	b=lQOnodUvSdFziFMcJNiRxfmaNH0U/NuPQMybsYOMBfJ11EYNiyXe9gXk150xuyKBC
	Ty1CwVIwZ6i3zXF/CDOFPGlQAJDOzCH/jU1aPUdmyVIQfX/USRyDIuWL+5KklVRv4b
	qJ9H2/sc1crzKJyJxvesXayJtuws6FIRzvJp5L2d+dWqE3CjFHBvCk3ERVQrBvhs70
	M8muZkQLBgtKBd4wTJLmGTeMxHUSNFZzy6IQF56VdNqHiURsO6z7dIcq4kqD/f6/V7
	9vYHik4NCIWojVnfygc5kgQits0DivgSvmKqeArebJasjJgZHreKeyvwsi04FB9bLU
	Q6c4NNemWZPcmTXC02oBaC985TAoZQHK/giibb4uuk+c/bCRu1qzkDuN2ISke3kb8V
	j9fhJowkXdgT+gHtolX9rxmu2vVt+oNkiceI+M3zirQfFtmOSss864porKRpBy6HT7
	Zr/NUTX+JPVsQjNuL4kNFpRgHKi0G0QruKGOLbFS3DsJyHS57IMZxl89zdnF8fZ8X5
	fgHG6T9+vbYj76M3czfL4EHQjD+0pcOoO1HY44K9l8A0FMezW9rrefiNsmK1ERzE0L
	2X+eKHB9n8hSjrf/Jf0ADqj8oQ9v6NSbaLLUJRJuO4dZHEst83+2vpGrspxeNgO+9P
	7X57hrRmRB/QAQv8ixL2z5bE=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Jul 2019 16:09:51 +0300
Message-Id: <20190722130952.10623-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-multimedia][PATCH] fluidsynth: Add PACKAGECONFIG for readline
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
X-List-Received-Date: Mon, 22 Jul 2019 13:09:56 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb
index 4f600a218..ba1ef6b1f 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb
@@ -20,3 +20,4 @@ PACKAGECONFIG[jack] = "-Denable-jack=ON,-Denable-jack=OFF,jack"
 PACKAGECONFIG[pulseaudio] = "-Denable-pulseaudio=ON,-Denable-pulseaudio=OFF,pulseaudio"
 PACKAGECONFIG[portaudio] = "-Denable-portaudio=ON,-Denable-portaudio=OFF,portaudio-v19"
 PACKAGECONFIG[profiling] = "-Denable-profiling=ON,-Denable-profiling=OFF"
+PACKAGECONFIG[readline] = "-Denable-readline=ON,-Denable-readline=OFF,readline"
-- 
2.17.1


