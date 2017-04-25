Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2D62B77AA9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 03:47:41 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id a103so206922478ioj.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 20:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ddxrqY6XYztKHZGl2TUNq86bxE0vphUgRK5u1k1OcgI=;
	b=b/VGRLQ2JLFh2KcDB91SIc6J2pkhjmP9pWiTtvvhfJW5kDqG87WlrxljoQo4CyeuKu
	f9sfLQQV4nJfIjKZwoLq31N2eefxMYzDkUrctmw8xMeGVvzdWd29ABpyYK36YqoVE+y/
	m5CB79/p9Xvlx3uayZEYwikyexEi1/j/YUuGUjtIyvEymJGubbwhxkZAe3nkoX/FsfQK
	fZ4Mt3Dxu+OaJ1RRe5K7VkcLzJjq7M3mFxkbQaLOEVw52xD9+LjlKE8VzFSqEXW5vEX+
	Jwel85LIVGnFcUDLG612JoYid7dENOYHuhHlqR/2NBqkvXQRuMLik6nQF9wO4Fao8KKs
	NLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ddxrqY6XYztKHZGl2TUNq86bxE0vphUgRK5u1k1OcgI=;
	b=iNudoSxFc9a8UIKqxvfdF6MhTzP+5CMRi9sDAauQj996hAOHUh9yNeacAOISuEKxlD
	EfLvyExRyJdSu/XOjSB88fJbSiNxTOx89mitKr/a2yE4bItogXq5ND+FIh7q7PoDiAO/
	o+4ARapZauB+S3bzLZ6sxURusGoXpj7+y+sitLwpaVtiiRXEgrA3KCfXuKRhQr1Zt2H/
	BDRMHR1/Sr9diVTjySNVmxl7j2dQ4KwTa5ydG5YeRK4DoNYLo8L13R1SK+Y4DoHuMEXa
	jtQHLGvO3HW2j7rgVWwhIhwSeG6p0QspvwYmwPqEIuMrOY2dTU5H+b7nRyT32X6kdJgO
	3dQQ==
X-Gm-Message-State: AN3rC/65YHjqQkUlNB+EkrnIvQrY8lCTjExbhb8AF70xJPetyp1vzPaf
	jVLw4ysZ1JS5QQ==
X-Received: by 10.107.59.81 with SMTP id i78mr11445644ioa.100.1493092063330;
	Mon, 24 Apr 2017 20:47:43 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id 9sm1244118itm.6.2017.04.24.20.47.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Apr 2017 20:47:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Apr 2017 20:47:15 -0700
Message-Id: <20170425034719.8630-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170425034719.8630-1-raj.khem@gmail.com>
References: <20170425034719.8630-1-raj.khem@gmail.com>
Subject: [meta-multimedia][ 07/11] libmusicbrainz: Add missing dep on libxml2
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
X-List-Received-Date: Tue, 25 Apr 2017 03:47:42 -0000

Shows up when libxml2 is not installed on build host
since the native part then fails to build.

|   Could NOT find LibXml2 (missing: LIBXML2_LIBRARIES)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
index 250c5f14e..16e52134b 100644
--- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
+++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "The MusicBrainz client is a library which can be built into other
 HOMEPAGE = "http://musicbrainz.org"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=fbc093901857fcd118f065f900982c24"
-DEPENDS = "expat neon neon-native"
+DEPENDS = "expat libxml2 libxml2-native neon neon-native"
 
 PV = "5.1.0+git${SRCPV}"
 
-- 
2.12.2


