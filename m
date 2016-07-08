Return-Path: <joe@deserted.net>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 30AF560119
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jul 2016 16:30:50 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id u186so5597464ita.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jul 2016 09:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:subject:date:message-id;
	bh=VTRJajCBo3XTMv7iz1qa8sT8RFLWg8flkGBYoCJS9IU=;
	b=1pREdFC6lOSQDSxn0MoI/AysMkdIEyyBpAN0RGiqJX+nzFhXScZaTvoQgzLPYTrGdU
	ap3F5JO2nIjrW4YDlxzpC2ayS/YtaH3csvGQ4BQVyvuGBKg76balzpczCb386boWD89q
	0b7NubLxjEmRF12pKa/r9K5h6rcu9gNuRhg0JH8ZMWOKK5bui90RdiXDxj0VAPrOLzlb
	BGqM8IPvG2H/dILyBRtfkcnK0Du7Zxa5dJrBcD12hZrvmDNMMNx+/eRjcTeXzPJlvk0+
	nYkFEH3R6wCuWDx9LBiA3dxyZHHZ9Q4xBzG0xTbdX4pwJwVb44Ul/8Jb4w6Kd4YJ3zbQ
	v2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id;
	bh=VTRJajCBo3XTMv7iz1qa8sT8RFLWg8flkGBYoCJS9IU=;
	b=fa7wda08cRrF50ef7XDPrywxhRY+ZtmOwfl3tYYezlFTt/JDHnB0vySc6EatIvqglu
	LGn3DlYFFKFpUsvQyhSIAlzXqgk8yWI/Mxw+I2rxczHlT+nrPS5fbRy+pjtPqQTUqBqf
	+0WbXLDn3z5XXB1roiO5/6XX06+Y/+f+Bqkf3LpqTlX7oeyEcfZs5ij3XwrsYJANUS8a
	AVbTpWSvlPNzvrw4lrhAsaiWIznJThq/fQpR6nJCmjGRLmPbeQIwG8XAXMlcLDGeNiCv
	s6w+mWukflPOqjrdg9mM8+MlRTTdIMJj+f8cwRgVryS2JIeQfxMradNFwDlCcysv89Cy
	QuYQ==
X-Gm-Message-State: ALyK8tKl/9Nl98M3ggy7HAfHcbxx83eJkV5E4y69SgUgiMFRVvJHXWLQqN6wf6nKadRdjg==
X-Received: by 10.36.39.78 with SMTP id g75mr3889557ita.53.1467995451133;
	Fri, 08 Jul 2016 09:30:51 -0700 (PDT)
Received: from mir.deserted.net ([23.233.31.74])
	by smtp.gmail.com with ESMTPSA id l63sm672739ioi.14.2016.07.08.09.30.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jul 2016 09:30:49 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jul 2016 12:30:52 -0400
Message-Id: <1467995452-30013-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] plymouth: remove virtual prefix for RPROVIDES
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
X-List-Received-Date: Fri, 08 Jul 2016 16:30:51 -0000

The 'virtual' namespace is only intended to be used for build-time
dependencies, not in the runtime package namespace.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
index de23dcd..597d8cd 100644
--- a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
+++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "libcap libpng cairo dbus udev"
 PROVIDES = "virtual/psplash"
-RPROVIDES_${PN} = "virtual/psplash virtual/psplash-support"
+RPROVIDES_${PN} += "psplash psplash-support"
 
 SRC_URI = "http://www.freedesktop.org/software/plymouth/releases/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "ff420994deb7ea203df678df92e7ab7d"
-- 
1.9.1


