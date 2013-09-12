Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0F94F600A4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2013 15:31:58 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id cb5so3749704wib.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2013 08:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=IpVv6ZyisegRslcwHuJ+nb6qoxmSXXhKJxT//6bmoqs=;
	b=i4udLV5nvWO8pap9zZWedeZ5nbAzYfZUIFpcSXpHTr5KyMnhb0NtrQdrWAigG67Bxm
	AfEmNmLThTj06Hggc6XRbhfa/k1dzWQIS3KNpot07u5S24v8V8cgmhd+ZxCqzMoAs6s+
	JutsIT9o6ZLA+mOK9ttAgpHA+V6G/Oz/oKAI4hC54BKBDMoPHSDqPKXnJlsKXtHhJ/dF
	oCd/Hv5bFmn+joPfb8tq8xTOp2dX0zDNO8JNa9dqWiezhOuntrMrDcsgvbIl56tW2+DH
	C16Q/AVwYcykjwS7Y08wFkkeBm81Rn6unXwsj9IsxdUeEt1hJGC77Q2c8CLNbVdt7zHg
	en6w==
X-Gm-Message-State: ALoCoQloq98FGfyg75yFM+Wa64KKNynTvf4p9hA5iYL4+huFTz9UlIp51hOXcb17fO67zR605/pv
X-Received: by 10.194.123.8 with SMTP id lw8mr6811591wjb.40.1378999920550;
	Thu, 12 Sep 2013 08:32:00 -0700 (PDT)
Received: from melchett.burtonini.com ([81.2.106.35])
	by mx.google.com with ESMTPSA id ey4sm5278877wic.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 12 Sep 2013 08:31:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Sep 2013 16:31:53 +0100
Message-Id: <1378999913-22567-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-multimedia][PATCH] dleyna: switch to git clones instead of generated tarballs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Sep 2013 15:31:59 -0000

The tarballs used were the dynamically-generated tarballs from github, which
recently have changed checksum.  Avoid this problem entirely by fetching from
git, locked to the relevant tag.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-multimedia/dleyna/media-service-upnp_0.4.0.bb        |    6 +++---
 .../recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb     |    6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.4.0.bb b/meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.4.0.bb
index 6d81ed2..fb0194b 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.4.0.bb
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "dbus glib-2.0 gssdp gupnp gupnp-av gupnp-dlna libsoup-2.4"
 
-SRC_URI = "https://github.com/01org/${BPN}/archive/v${PV}.zip"
-SRC_URI[md5sum] = "9fc4db84b3459bc77232b24bde48b000"
-SRC_URI[sha256sum] = "9cdee47bbbfa3de5aaa5cf3fc9e208ccd97e5079f6d8fa84a6d1f24a1b760237"
+SRC_URI = "git://github.com/01org/${BPN}.git"
+SRCREV = "1996ecbe4a06c95d22f7d958e32e3d28f7a4a2e9"
+S = "${WORKDIR}/git"
 
 inherit autotools
 
diff --git a/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb b/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb
index d23babe..478b1c7 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "dbus glib-2.0 gssdp gupnp gupnp-av gupnp-dlna libsoup-2.4"
 
-SRC_URI = "https://github.com/01org/${BPN}/archive/v${PV}.zip"
-SRC_URI[md5sum] = "1e19349712a34dd56a14fc280b5d8b74"
-SRC_URI[sha256sum] = "d6623d98dd35ee32bc08349b4a22d12101dda38a2ece1e468ff0160e519a854d"
+SRC_URI = "git://github.com/01org/${BPN}.git"
+SRCREV = "4a0b1d7cd8e22d3cb0e09c77c344ceccbcbbd34f"
+S = "${WORKDIR}/git"
 
 inherit autotools
 
-- 
1.7.10.4


