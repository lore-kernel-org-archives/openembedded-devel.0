Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7FA2678A12
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 04:03:33 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id 93-v6so627742plc.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 20:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hEyiyZrC4oIJzZvDsooqHhspsCHEJOqY2RNCbm1DfLg=;
	b=S3P7jvll297neQAXnMNO4GgAULtGqYH5cCIe+HVp7CW2odDfOFX0z9iD56H2fisS6j
	EQZ3lPHFW2vDCt9ePjjlAduK4oeisg8xmS1UlzAOGZlfH9Ymrpf3ojNzmgLmuVxnWzsQ
	J/xa0oAmO7QukUiC1lqy+tfGoWeGQV2Dq0P0X7pYk1BH6Ycip/OvwK2N8GIVL7c13/tN
	BnHBkD5j/QWUHtHAeb/km4Es37D+rNytczA08Vw3tbzwUrODuFvYPU2utsN5YFbmvW1h
	rQ3PpAmTKoZn4MB7EY8W6Rg5M9qdJiG+Nmd7xijiq9dsJqwzzDvBYqw5KW38G9RENmeW
	qI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hEyiyZrC4oIJzZvDsooqHhspsCHEJOqY2RNCbm1DfLg=;
	b=GFrZOk0Rst1bcKhHkhf8XPRZquY//WDd+UjjqcfMBNRij8KgCuyAlfcE4gg9C+bbpr
	z7fkophFLab1uJemh9Lp5+S5MnKuLeKHgn8nFxJOlzTK79SLzcgFAH735cDszitK4Ghs
	40VU4eD3X8EDk9ZPTgzhiLJqKJmXYkkF33ZIlf+Wldts2RIP0lO+/MFbhvd0KMGtj98s
	B+BVQFqjwztJ2kRTmjcC9R/W6YytES2bveSC1Wapd77oJDriICdrrrnkt31HXzwrKNy/
	H7T+EkrjT3y18agP3k3jsEfkWuOGEdJTMfGjpK24AYklAIWbU31kdLQohvxbdFCyYq0g
	inAw==
X-Gm-Message-State: APf1xPByoNFxxpkEvIT/aoa8UrF1IGVUdCDOkGTgYDPi35XR2z6rT1AT
	A39NpyJVQvBUnMo+YAbfEyWGug==
X-Google-Smtp-Source: AG47ELsygF6UTwpJ9PZKUin7ucPSgMnSJOVacg2AuiLLTkaYgjOVaCWCON/KTaIHa9Vbcm7XSMZ4QQ==
X-Received: by 2002:a17:902:8c93:: with SMTP id
	t19-v6mr18861198plo.304.1520395414785; 
	Tue, 06 Mar 2018 20:03:34 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	14sm30677152pga.53.2018.03.06.20.03.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 20:03:34 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 20:03:09 -0800
Message-Id: <1520395408-19266-6-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
References: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 06/25] orrery: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 04:03:33 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-navigation/orrery/orrery_2.7.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/orrery/orrery_2.7.bb b/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
index 1a00b08..010f65f 100644
--- a/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
+++ b/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
@@ -5,7 +5,9 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://orrery.c;endline=25;md5=d792bdf2b591972da175aecc38d88cfe"
 DEPENDS = "gtk+"
 
-inherit autotools-brokensep pkgconfig
+inherit distro_features_check autotools-brokensep pkgconfig
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://projects.openmoko.org/frs/download.php/923/orrery_2.7_clean.tar.gz \
            file://orrery.png \
-- 
2.7.4


