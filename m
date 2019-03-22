Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 012F57D001
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 10:21:43 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id z6so3969062wmi.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 03:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=kSwMdK6cnxfW3BR1qjfBcD0s6a5ba+E71i4LmA61sO0=;
	b=ggjim4DxsL16+QYkTzaBG1d2qz3iiHO7shx2IVmOQ5NexYFiIVLpdv8hmCmlFAdVBV
	bBFTKsheUgSJlqNO4+XXKR1HDOm2MCgibH0sG+PD0lZ8kYxlEkpa+5kczKK+S9QaVxgj
	46EIAfTBEeB+cwhWOYRAhz6HazkY/Axm7PMF5fKCZ0BF3Xme+7JxMZkjp1fsUo/wVLsX
	FiwTiHKVOMA7elmb+t//pblpvJThTbqtrOTijCWmFVPLkONV7IIHiUNl0ALJMNrUsY8q
	QMgQqL4MT8RA9tqX9zyRgN87u83FVQrqi7M03u5EC3tLMRJeRtvSAmUYny+anae2YBEy
	4BPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kSwMdK6cnxfW3BR1qjfBcD0s6a5ba+E71i4LmA61sO0=;
	b=pK0xpCigrvMUis5W2XdSrri5AeLFMo0PSEbPaustilgBYjmfg0VAQtmboFa30xMl9E
	/1C358dUwwI8vIKkWw0ykN+3S8e3wINfRlSQiGSMyr0xm3uTRWSMRRStP1nts+KYCnD9
	N+F8df9PLl7T1Q4B/O8fQLp7nPeb61g2pNsod0a+dluyvbTRuxlWnN+zlBgCPVk6KrOV
	rjYvt0HcTYqt99LA2P+MCRnBnvwIgvrEEBTKy2CXZQ97fYGAEKDwiwY8AKGgU99Bqbor
	VIyXT4S+1bis70wraIiHraNDXC+xrDzuRI/hraTCKAyj0HKjjZJ/9EsqCNwyZniSAa2H
	3LHg==
X-Gm-Message-State: APjAAAWMqw5gD183FFnEwluvjgBTPtrkBkswlegzJBD/K3JwnIsqkXdq
	FxMVdPeLZUcdTAiZnce+93mGcL4A
X-Google-Smtp-Source: APXvYqzbB9z0M9ruBb09qmoTseFQCPwE2CzePBiruIFTbf5CeGrg9l2EP8s0jUF/rNLuxVpaZpkRvg==
X-Received: by 2002:a1c:f30d:: with SMTP id q13mr1487670wmq.21.1553250104478; 
	Fri, 22 Mar 2019 03:21:44 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	t69sm12255677wmt.16.2019.03.22.03.21.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 22 Mar 2019 03:21:43 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Mar 2019 11:21:21 +0100
Message-Id: <20190322102129.5067-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190322102129.5067-1-schnitzeltony@gmail.com>
References: <20190322102129.5067-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 03/11] gtkmm3: upgrade 3.22.2 -> 3.24.1
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
X-List-Received-Date: Fri, 22 Mar 2019 10:21:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/gtk+/{gtkmm3_3.22.2.bb => gtkmm3_3.24.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-gnome/gtk+/{gtkmm3_3.22.2.bb => gtkmm3_3.24.1.bb} (78%)

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.22.2.bb b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.1.bb
similarity index 78%
rename from meta-oe/recipes-gnome/gtk+/gtkmm3_3.22.2.bb
rename to meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.1.bb
index 96b54dd2c..6dd051337 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.22.2.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.1.bb
@@ -14,8 +14,8 @@ inherit gnomebase distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "883e9046768b3a5afc8e365988823e77"
-SRC_URI[archive.sha256sum] = "91afd98a31519536f5f397c2d79696e3d53143b80b75778521ca7b48cb280090"
+SRC_URI[archive.md5sum] = "9524ed4e5c821d13eeda49ba2a78f024"
+SRC_URI[archive.sha256sum] = "ddfe42ed2458a20a34de252854bcf4b52d3f0c671c045f56b42aa27c7542d2fd"
 SRC_URI += "file://0001-do-not-build-demos.patch"
 
 EXTRA_OECONF = " --disable-documentation "
-- 
2.20.1


