Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4B3A37D68F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Apr 2019 23:07:17 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id 188so4057168pfd.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2019 16:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qtYlNWQxANOOBt9XIgWWTUCgGy3L/5nyoiZo5ZkDvkQ=;
	b=VC+ByS1d5CF3zq3HAtwI+iqmFil8OkQSWMs+0Aqf88OBJc056LCX4osK+/eTJGqq0E
	sH2DzdBLLMWNX1Suavw0eOY7DvjulWnm2BhuNUInFmAxkrcnUXsVH4nYVp3k/2P8xyAa
	dH/mMqZMt5vuwAxnh53SziKXpWPgAnrw8GY9s3IoskqUlj7fgAMLsXmezIO4GjHTJMwG
	2xbgblF+2E6crjaagikK7eV3a+jfTdqKqbNKa/1kCBe70KWWtlr6uF9UmDyPlm+rpWJD
	V/Ym+W0G+QViJ+QYfyb1Oj915y3UiR79cOKYaZ+h1TTT+i04RFdsudSFLlQAzP8tr549
	VgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qtYlNWQxANOOBt9XIgWWTUCgGy3L/5nyoiZo5ZkDvkQ=;
	b=k0gd5LezaoBDBqcE9INYIoTAfK1X+4V1tLAOhCPmcTFYZOI5Fn4SXlRVb+bmYwfkI0
	9vHAwf/g9wHGmMQx7EVPUI4r+qFpEe9wwKWzjfg28MzOaA9v9cuc1KsroEqsXqkn29IV
	BpHRFDuA3HLqdB6js1780ub8HMDTmikcb84+yG9pMkn3Q1zhxvcNw1VBsFWEEvQamtgI
	oTduE591hCihq1tRoPp+/kdPEl42mtdHF8zFeCYwSFY0TWpvkQtDjkyCdezh2OxPXubk
	XgNODIw+HTyPaxbNLzdp7yRa0mLZiRBgKWZJ5HjLNssvNkuE6O1cy5GAEYQ2+5JtBkDd
	xMag==
X-Gm-Message-State: APjAAAWZ093LWlNG93HTGfkZCpNt7b8M4W1NfBg77rSkHCub6ZSgOuGk
	+aBIZPkfPewpXUAp1W0WaHqLFo3IGpc=
X-Google-Smtp-Source: APXvYqy7MXbyeH4Flzd/wa04qFYcSb206urJFkPLDzxVg+XxSC7CTIQrQQe3GsgXm5BOd+3b64IkQw==
X-Received: by 2002:a63:e554:: with SMTP id z20mr14582387pgj.234.1554505637757;
	Fri, 05 Apr 2019 16:07:17 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::8ec8])
	by smtp.gmail.com with ESMTPSA id
	143sm44285311pge.50.2019.04.05.16.07.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Apr 2019 16:07:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Apr 2019 16:07:04 -0700
Message-Id: <20190405230704.15832-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH] ncmpc: Rename artist_screen to library_screen
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
X-List-Received-Date: Fri, 05 Apr 2019 23:07:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

artist_screen is not a valid meson option

Fixes
ERROR: ncmpc-0.33-r0 do_configure: QA Issue: ncmpc: configure was passed unrecognised options: artist_screen [unknown-configure-option]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.33.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.33.bb b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.33.bb
index 8468d125df..d4ebe1769a 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.33.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.33.bb
@@ -11,7 +11,7 @@ DEPENDS += " \
     libmpdclient \
 "
 
-PACKAGECONFIG ??= "colors locale mouse nls regex help_screen artist_screen search_screen song_screen key_screen lyrics_screen outputs_screen"
+PACKAGECONFIG ??= "colors locale mouse nls regex help_screen library_screen search_screen song_screen key_screen lyrics_screen outputs_screen"
 
 PACKAGECONFIG[colors] = "-Dcolors=true,-Dcolors=false"
 PACKAGECONFIG[lirc] = "-Dlirc=enabled,-Dlirc=disabled,lirc"
@@ -22,7 +22,7 @@ PACKAGECONFIG[nls] = "-Dnls=enabled,-Dnls=disabled,gettext-native"
 PACKAGECONFIG[regex] = "-Dregex=enabled,-Dregex=disabled,pcre"
 
 PACKAGECONFIG[help_screen] = "-Dhelp_screen=true,-Dhelp_screen=false"
-PACKAGECONFIG[artist_screen] = "-Dartist_screen=true,-Dartist_screen=false"
+PACKAGECONFIG[library_screen] = "-Dlibrary_screen=true,-Dlibrary_screen=false"
 PACKAGECONFIG[search_screen] = "-Dsearch_screen=true,-Dsearch_screen=false"
 PACKAGECONFIG[song_screen] = "-Dsong_screen=true,-Dsong_screen=false"
 PACKAGECONFIG[key_screen] = "-Dkey_screen=true,-Dkey_screen=false"
-- 
2.21.0


