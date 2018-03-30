Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2CCDA746AE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:27 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id y55so8062413wry.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=iJQdVlqo3381YzAMJj24j/8AGXPChMWy3fFu6gT5m6s=;
	b=eA8qrbqi0KRh/YcRvVqoxD9vIL7HDQ2nfIz2U4LsqGjXFmcl+nm8X9zfJrWaRdrXGb
	Zb6XKIOfi9tjNX9IfMXG5aRZLNf3QGeoyMRu0xwRJEgaB0HZ6AmIdkLFpZs55m9DLUQw
	ej5nnYjBVegdqwEl9Y3TUvGb0T3ydzcO86QboAWaILnGDBe5xph9EJ1ZBggqsWm9fxMH
	IIltc/xSJAQJvUD/IpAv104qN7GdH9jSUz28RNrvPKmRvOVoCvQYZyEKUg/kjsq/sI3H
	/g0QrXkSrJHYx5ApcnuSl8Akg/PdcpuOe9QCvJ34L/sGy7RJI/4H5bp7kV2Qq3OCUkCD
	yICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=iJQdVlqo3381YzAMJj24j/8AGXPChMWy3fFu6gT5m6s=;
	b=nyAUpe+68rdsYpvtKmiJpSaG99IZC6yREWFYkr5KaUmkIW3MXKY0r9tMo6Kh8XofEs
	8KCKfXHlYnmbwuY2gxfv4VZyWvNWKvqpIT6xbCKQn5zsO4brU66cDBd0jYiM0R2jGGPT
	6qwpqqRLCRgZADEdaTlWHQGkjm61Y++JWoy6WgKF5CU/CASO0ViA45JKsR3vLdV7mNxO
	vHeobwxPI6TbZwesGpg7+KsfJ6hwFqChqIB7n3IbkPIjwAi0C7ce02FRiahZe3TLxDkD
	pGQGuFnOQmhvsHmO0rcjTMDIAVVfmjMM/NDrB5OyUxl9BuOJgF69WJU+AXKa96npXhHB
	9jzg==
X-Gm-Message-State: AElRT7EckkHCjfF9Ah6SZq5Kc6Wtaar/d6weBEQbTG5J9pNwl1VUJMZq
	mS0tsxELYhGoM44FhfQR/9n0vw==
X-Google-Smtp-Source: AIpwx4/M4hxZbbthLsR9ktY7XhVl7XtP7WFxpb8Il7o4DymT1SZsyp7JeOcr/Cgm4y2F/n1nOFYAsQ==
X-Received: by 10.223.182.13 with SMTP id f13mr9324353wre.262.1522416747784;
	Fri, 30 Mar 2018 06:32:27 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:27 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:35 +0200
Message-Id: <20180330133151.25882-24-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 23/39] xfce4-settings: update 4.12.2 -> 4.12.3
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
X-List-Received-Date: Fri, 30 Mar 2018 13:32:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
index 093be0a93..bf9bd3102 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
@@ -13,12 +13,12 @@ REQUIRED_DISTRO_FEATURES = "x11"
 # + minor bugfixes - sent mainline but no response
 # + option to hide mousepointer for a specific (touch) input device - sent mainline but no response
 SRC_URI = " \
-    git://github.com/schnitzeltony/xfce4-settings.git;protocol=git;branch=for-oe-4.12.2 \
+    git://github.com/schnitzeltony/xfce4-settings.git;protocol=git;branch=for-oe-4.12.3 \
     file://0001-xsettings.xml-Set-default-themes.patch \
 "
-SRCREV = "e097ea5f95f8cbc3f23b6558aae2b772d6322591"
+SRCREV = "b701ac8b66b83c17469dd5009da51eeb59eba442"
 S = "${WORKDIR}/git"
-PV = "4.12.2+git${SRCPV}"
+PV = "4.12.3+git${SRCPV}"
 
 EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
 
-- 
2.14.3


