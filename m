Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 130E27FCDD
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:28:24 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id c14so25029210wrn.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 03:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=W0xZH4yA1lXQZqW8s8uQxt22Rz42ScVyVgcLUukyAxY=;
	b=iy8+ZMeTzcaaL8g1X9vdQM1Tu6qOskNhuAQOFF55D2Fpy8aHSW2NiSf07jbao+3tDs
	LUKfq33YWlivFsmJBDwlC24HAmAhWDkLkNdYN5+6OLeJqnmvIBIsTlG5DJ9wKdQvSkqz
	fwmo1Ds6uNrJ8vylnfGJCSEtptsduRoFzylTovCxXD2tkKWDpmpkWU78ixUAWy7uq7Pa
	ptzTlwvlXJ00c1bJyId95piGegzJCH230WjICg5nKMFYa5VMT3tAxwS1VTus1YgSL8j2
	GWKSA86tHcSCACLlOoFwFJM4D9eJe9l8tUPLQkXRHcrCW3YdiS1Nr7hBABgcqx8d82/E
	25vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=W0xZH4yA1lXQZqW8s8uQxt22Rz42ScVyVgcLUukyAxY=;
	b=rR5FO5hYCfKTat/EwMoi2M7p7t5K6RdUxdAlKg41uv+eU394t9gNdlD1BSU6zmtsWl
	hsqimOTIiEZ/NdC1DUtgTM9R7NZ6DqQSvE0GtxxE6kcEZtRYXAsNGAclQe3xkD8Kb9i2
	LYksWFbCMBQrg6nFlGGDT4x0EVRowYYy2Cc3T9QIQR9OQ+h03zU8PWTNXuRiTvWj+Ct9
	bgTYFGltn94oi+b49UJbYsDb0VNw8c2E5oG60JTWhxit5jpTtXMmYBV9L0rZgKWcwfa/
	pFDyfhQPcnHoL0cl765ybJ8WQWpDis6ouzybNZXTAbKtzf5uwWSNOlJqgToNLPbkjPTU
	MEeQ==
X-Gm-Message-State: APjAAAWSrXh+R8GepeGmfZHhIazQWcMcGHQvUpv7qhPUohbyk9aHs7xP
	fNESaDTR3lWah4MzkJey0EO4v/wLYeg=
X-Google-Smtp-Source: APXvYqyjWK3O8f+2Zt0VM10ref81CZYUOaDcht/Kotkga4jmrL65iSUJLW9l3N8ITtPBX2tr3vz5Jg==
X-Received: by 2002:a05:6000:11c3:: with SMTP id
	i3mr7925877wrx.244.1579346904783; 
	Sat, 18 Jan 2020 03:28:24 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F3CA15804DD3CACFED9DBE9.dip0.t-ipconnect.de.
	[2003:f0:7f3c:a158:4dd:3cac:fed9:dbe9])
	by smtp.gmail.com with ESMTPSA id
	b15sm2965720wmj.13.2020.01.18.03.28.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 03:28:24 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 12:27:55 +0100
Message-Id: <20200118112757.5287-22-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200118112757.5287-1-schnitzeltony@gmail.com>
References: <20200118112757.5287-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 21/23] onboard: add mime-xdg to inherit
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
X-List-Received-Date: Sat, 18 Jan 2020 11:28:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-support/onboard/onboard_1.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb b/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
index 03fd0517b..1eb4a100c 100644
--- a/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
+++ b/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://launchpad.net/onboard/1.4/${PV}/+download/${BPN}-${PV}.tar.gz
 SRC_URI[md5sum] = "1a2fbe82e934f5b37841d17ff51e80e8"
 SRC_URI[sha256sum] = "01cae1ac5b1ef1ab985bd2d2d79ded6fc99ee04b1535cc1bb191e43a231a3865"
 
-inherit features_check setuptools3 pkgconfig gtk-icon-cache gsettings
+inherit features_check setuptools3 pkgconfig gtk-icon-cache gsettings mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.21.0


