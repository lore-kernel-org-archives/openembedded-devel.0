Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id C7BBE7F68C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 13:03:29 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id q7so1617535pfh.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 06:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=tjwln6JrnSF4wY/exDzBUU6sATYdIuUs66ZWoQs2YPU=;
	b=RJ/4GDRpYS+8o+0ArGY3TMccizveXTjb5KN6IdqFomTtnlGiOCsXu6bXujb+zvx2t2
	71r9qLZu9HStwIyQwRbE4X5mV74ns0agI1qSp1DJ1xTDJEmnrtjfELcipAKnmMOjfetL
	BBLnOXojFCIcUmnEt+hOcE26/6U50EU1F6q+gppTilN0p6EHLZat5muRrAFyFrlk9ccL
	qKHRX6DLtflOgy9knKKY3PfVCZObKp8Lx2pPRB3lYgnPDw7b7NZAUVBwF0eyZXfqmVzk
	mYWn/ZPJ8vGSnFO1tygGjjVS/AityfVWA9r9JLgD74X+1ACSCd2L7jKDFdrcNfKOBx+e
	sNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tjwln6JrnSF4wY/exDzBUU6sATYdIuUs66ZWoQs2YPU=;
	b=Qqc5jMICkszY7Yrrp3j1+8yRdTPPSdMg1rPyEEfynU+Up9LWOhkrxHcFZBXPUaX8KK
	rgrq9P0gVa24sG6oBkfzwsa2NzY5TqKqCSYWs2veaPgHUifBgKGMvtxvwv13WQ+X2Cd9
	TK7gjP4Ac88fFNLeXZ2awHeFg9BRBKuOu8fhYCxgcrctH8QaGYFMDmsRu6qLsaSndLHZ
	LSDJj99d2B9XAN67tAKXjyKjN1A6yQAG12QVbXaLH8b96L+iuB1ZMIXdPrQixIU8sMvt
	I9ib+yAtfxl+E5uvkmmnJlcQOBhqQw7IrrkYlqJZ50/M/dZXh3yJiqgbyMl/tSlH3Fre
	AweA==
X-Gm-Message-State: APjAAAWz+7q0qmxI5Rn3foaPN47osUFwC+luD5tyQsby6uZvzBw6LvpM
	2rMUbz+W5qQO1GlF7IQWgMHXl7Je6Fu5Ow==
X-Google-Smtp-Source: APXvYqwizDeFj8FhnJJUc4Q97WLwgFEhAqt87EOET4RvVLCR9VKN2Y2N6Mmr2AQMaMGfd/8MRcUQRQ==
X-Received: by 2002:a62:1646:: with SMTP id 67mr3116pfw.183.1571317410080;
	Thu, 17 Oct 2019 06:03:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::e34d])
	by smtp.gmail.com with ESMTPSA id 14sm2877424pfn.21.2019.10.17.06.03.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 17 Oct 2019 06:03:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Oct 2019 06:03:18 -0700
Message-Id: <20191017130318.1978280-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017130318.1978280-1-raj.khem@gmail.com>
References: <20191017130318.1978280-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 2/2] dconf: Upgrade to 0.34.0
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
X-List-Received-Date: Thu, 17 Oct 2019 13:03:30 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-gnome/dconf/{dconf_0.32.0.bb => dconf_0.34.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/dconf/{dconf_0.32.0.bb => dconf_0.34.0.bb} (76%)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.32.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.34.0.bb
similarity index 76%
rename from meta-gnome/recipes-gnome/dconf/dconf_0.32.0.bb
rename to meta-gnome/recipes-gnome/dconf/dconf_0.34.0.bb
index 8d1bbdfd1a..a1996a1a37 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.32.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.34.0.bb
@@ -3,8 +3,8 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 SECTION = "x11/gnome"
 
-SRC_URI[archive.md5sum] = "e1ac0b6285abefeed69ca9e380e44f5a"
-SRC_URI[archive.sha256sum] = "68bce78b19bc94cb2c3bb8587e37f9e5e338568c3a674f86edde9c9f1624ffab"
+SRC_URI[archive.md5sum] = "a3ab18ed51a0494a1c8436fef20cc1b0"
+SRC_URI[archive.sha256sum] = "943a94ab16121de5580ceaed2605b87444d1bca1c6cd8beefb778bcb0aa2da52"
 
 DEPENDS = "dbus glib-2.0 intltool-native"
 
-- 
2.23.0


