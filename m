Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 85D377D47E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 May 2019 08:53:35 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id y5so14193004wma.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 May 2019 01:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3xRYxWpYx3UUZDdYQaTEu5l+pblvWGG8Wa45fVQie34=;
	b=KPxMyhfwbWCIjyMz9vvS03PU10wTZGM9pOoL722jVBZDAYZEEM3XMuyh8dWQJ3dfu5
	2a2YexL1CYXJq+Fg9LUl/Hdalq6+/kXo/Pse3iHi519DROOhkb5vVVFDBctNfzAaaZRE
	DL1w1VP8Ec2aF586fM/jxv62HwGYi/TUQhwZHgdB9tPzGA2kelJCyx7WQzCrSM/v5rDy
	GiZx4Ta3NnkoOpIJCxwG3NmiuGJSTY+BAXjAN1bJLI5uRXmDE9zYFwMqMGQhGBXF0FlK
	3DI/M2EQcnFuAr7Bo3jv8FHChRrJB11RxO9ICLZY/QCB5g9mXGhrfzT1uu6fmFk4Fu9C
	bAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3xRYxWpYx3UUZDdYQaTEu5l+pblvWGG8Wa45fVQie34=;
	b=AjZTMpIEypsIaLE2ExXRyXlpw1zeH3xPOD0LqNaMHek6DpDwFzSQChRCyXmHl6AT9i
	15wAdrjMjr2ZKOUKHZf/mXD4KHOnqxRem3mjRBH37LrZ3hKxuSEYZvMgZjJPy+lB07OV
	9oFnQ59rrWkVl/UxzNl9L1J4zNpE+jisJ0/asuBl+OIjTA7OO85+sCpDnN9mACk7Qu2N
	zKLUvf4g18HNv036EADbfnSFNI2KtpybfjXL6ItGwd6mIyJv34S9YT72Y9mXGb/46eKZ
	pira5o8k6Zyt/YyzTJXkTds1LkqU5/o9uX1X74jpRkFjBRRFPMhtuMMnnhycaxgPQRhI
	E14g==
X-Gm-Message-State: APjAAAUT4m3GKePKGr5f1K+zTGZDYj5b7h0tsauUMN0tWjKNlwAW0S9/
	EfEMIx9psvXZeLzI2xJIyi7KXYae
X-Google-Smtp-Source: APXvYqwNHJ0vGZs54DNOrU8XvVwdtNw2l07wdcTUBDoirJMjcADgN+UDDD/UNEc6N807HAsYsPWjAA==
X-Received: by 2002:a05:600c:257:: with SMTP id
	23mr3881382wmj.56.1557132815885; 
	Mon, 06 May 2019 01:53:35 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	l21sm7311106wmh.35.2019.05.06.01.53.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 May 2019 01:53:34 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 May 2019 10:53:23 +0200
Message-Id: <20190506085323.23598-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] xfce4-terminal: add vte-prompt to RRECOMMENDS
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
X-List-Received-Date: Mon, 06 May 2019 08:53:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Without xfce4-terminal sets window/tab-title to 'Untitled'

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.7.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.7.4.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.7.4.bb
index 7fc638e47..426282e14 100644
--- a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.7.4.bb
+++ b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.7.4.bb
@@ -10,3 +10,5 @@ FILES_${PN} += "${datadir}/xfce4 \
 
 SRC_URI[md5sum] = "c861540dd1dd05f56e62382b3851cf66"
 SRC_URI[sha256sum] = "a88f98af4da72394f2cfbd7f14b0f053ec0a3b58a4f6a577836357c60a6c42ab"
+
+RRECOMMENDS_${PN} += "vte-prompt"
-- 
2.20.1


