Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PcEUY-0003Ur-OC
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 10:56:46 +0100
Received: by mail-fx0-f47.google.com with SMTP id 17so17855677fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jan 2011 01:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=ipO1/+JH/+rh46iUZis1I9lTzYATg0CrnYMZ5xiHf4A=;
	b=jW0CKdvPSjeACGPD9q1IsWDCzG3MhVXmeHs0qgOvmK8MGc7/v2LIhlafwYDrkOQIgn
	bFu+oYxytg15zCNTb57BBHClg3BQqH9IKWkNLOb66jJv24XGgPanK2r3lj6vnVR9FMTb
	PdMHvDDy9U4ubopLex0GYDCM+xSHj29cYXYSQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=RFSqsPW2njLEjvM/bnUpcLNBB0LXMELpqise83VT8Zg350Nk7MR13MUCzpIC0yifdB
	S8csHGxAXfTj0Oof+n5YwiDIda0HET6Hk0d8RfPOEE86IPnci9PK/28qCsq9crBHWdER
	MoZRRrJV5P8iLw7d2c8MQO+uB0Ai1POw/5ev8=
Received: by 10.223.83.4 with SMTP id d4mr2341676fal.59.1294653372535;
	Mon, 10 Jan 2011 01:56:12 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id y3sm6853009fai.14.2011.01.10.01.56.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 10 Jan 2011 01:56:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Jan 2011 10:56:00 +0100
Message-Id: <1294653360-27612-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.rc1
In-Reply-To: <1294653360-27612-1-git-send-email-Martin.Jansa@gmail.com>
References: <1294653360-27612-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 6/6] mesa-demos: import recipe from poky
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Jan 2011 09:56:46 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/mesa/mesa-demos_8.0.1.bb |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 recipes/mesa/mesa-demos_8.0.1.bb

diff --git a/recipes/mesa/mesa-demos_8.0.1.bb b/recipes/mesa/mesa-demos_8.0.1.bb
new file mode 100644
index 0000000..0314342
--- /dev/null
+++ b/recipes/mesa/mesa-demos_8.0.1.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "mesa demo applications"
+HOMEPAGE = "http://mesa3d.org"
+SECTION = "x11"
+
+LICENSE = "MIT & PD"
+
+DEPENDS = "virtual/libx11 virtual/libgl libglew"
+
+PR = "r0"
+
+SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/demos/${PV}/${PN}-${PV}.tar.bz2"
+
+inherit autotools pkgconfig
+
+SRC_URI[md5sum] = "320c2a4b6edc6faba35d9cb1e2a30bf4"
+SRC_URI[sha256sum] = "4bc7f2b20d17e3eebfec288f2367a435cd2db71fc5ac9ece2c14827e290d77d1"
-- 
1.7.4.rc1



