Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9FD1F7D00F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 10:21:45 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id t124so1575379wma.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 03:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=EsHrD8p+AocYFZfvIiNbo1z+7e8hc/T1xM+lg7SnO00=;
	b=rrv7vodC5xYEgGPGLGPqR+wbLZy03QteCiUUULOxfyG27YhUjg+imUCzDE6BJSPH1f
	QQI/qgQWr8dZEP8dsObInugMBnODVmou2gx0HTwEd1ZTULKEG3ptIcRX+hXHkgPl1lgT
	zcHUfOmrbDMAMScyXSgB1ShpAsMJALORd6VOVtjqj4GPtdG2n8LCbm6RlpgAtxLWKUF+
	5RwxRSUeJ61CNx9CvovOlMr1IWtG2zvIt7lkj0wGOfTYWQTKg47GoXVmYDLcMQhGk8b/
	njkzVRNGvBT4NQSU6GbnBKRFWuMC5W26T1yeMH8TJyl4L+TbhNnsWiwpqnhYS3KBbuqp
	8wfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EsHrD8p+AocYFZfvIiNbo1z+7e8hc/T1xM+lg7SnO00=;
	b=C9+VMF1KTik/KQXNWWH6CEZfMKug5R5hatGZtqyin65FshZJAaFvK5VMNfenZp0Xi5
	ovQNdnc335JvyN/m1frONYhW52WhdTTDLbpzOJl8H3XF4Ko6vVDB6sHlD9u6XYE7ue0L
	1a3RRLPO/0y/oYOWLiMXV19ybSvZudahqx1cU9CKWry+fhXBb1g/U8UELuDDhu7NJaZF
	YShGplcQb3BrIp/bzMRyQDQF8e+zDJG8SUUpZSkhPwx3tX/nWjExp+B9qyZpbzb0ry+N
	FJ4g6OlognvBM5gL5y9m36cLAXc7bafSVOVgjA982QqJrkS03rWVXWX3H8FbHtLrh/U+
	EEBg==
X-Gm-Message-State: APjAAAWIZuXJ2r9bBejqqgLKH0IDMOtRi9ScBI7dIewd9cf8hX9Smzri
	8FlMWe7S8sVC4DlyE7G0x3h/nHsu
X-Google-Smtp-Source: APXvYqyzlCKc6fhhVEfwlAjXQN2kGajLuKMypinPzFXBbCO8iKR+q9me4QU3XreqShwcXjkz8n9HWA==
X-Received: by 2002:a7b:c344:: with SMTP id l4mr2416756wmj.121.1553250106352; 
	Fri, 22 Mar 2019 03:21:46 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	t69sm12255677wmt.16.2019.03.22.03.21.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 22 Mar 2019 03:21:45 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Mar 2019 11:21:23 +0100
Message-Id: <20190322102129.5067-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190322102129.5067-1-schnitzeltony@gmail.com>
References: <20190322102129.5067-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 05/11] xfdesktop: upgrade 4.13.2 -> 4.13.3
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
X-List-Received-Date: Fri, 22 Mar 2019 10:21:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../xfdesktop/{xfdesktop_4.13.2.bb => xfdesktop_4.13.3.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.13.2.bb => xfdesktop_4.13.3.bb} (76%)

diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.13.2.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.13.3.bb
similarity index 76%
rename from meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.13.2.bb
rename to meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.13.3.bb
index 85696a193..2c70a9c31 100644
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.13.2.bb
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.13.3.bb
@@ -8,8 +8,8 @@ inherit xfce distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "c05569c1c39ccd314fb5da20d5086909"
-SRC_URI[sha256sum] = "387f43d8a4615f44060c019cad212ac12df62c58eea2605813743116f71ad3bd"
+SRC_URI[md5sum] = "f08944f1b69ce1c6e1fbb9d7f4cb1da7"
+SRC_URI[sha256sum] = "80f7f28ef17638fe1cf4481db694731c208785a56b6c840005202f9c2db238f5"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-- 
2.20.1


