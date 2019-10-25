Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id AF5897FA4B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 07:21:38 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id n15so1009747wrw.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 00:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=f3WNLOe+JETqFeW54oJ1VAr+fdD/f4H/fiF0Ub9tEyM=;
	b=phdjujlJGph7zza/pxmd8ipRuuvQtOc/NyIeExUOODj2+oKEjQs+7qauyd1/LBMI3d
	ZkqBaRAnQxOXsGapFaPcxkbG5ysFfgAq3QSqsh5JonPBRqL/d4/+qbVZ3QB4H256QHYC
	dJZ90ANKilRscu1Av0VWGE4Wm+MdWNIpY3HpdSi7XrSfFCcCSdE4VAVvOCE+E8VnQj/p
	s4iMP/Jr/OG4DR8HBp8uHLuhfC785fjzGo565qWGUp3ZTHY9uCMJt8HBABItj6LGk4ii
	whdTxi50QMLUVOMEYTqdF82o6KWajQoDK7pTjoXC8rptiHxJpggz40aD+vJFPXWuyRLu
	ifqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=f3WNLOe+JETqFeW54oJ1VAr+fdD/f4H/fiF0Ub9tEyM=;
	b=a7tqP7vZBBR+kFNdw8GSK+5zrcrUo8tecE3Wrdg3RPHcVLS64aZPkA5iCD/qJR7L+4
	XG2p17SxHWKrdqPClde1LaH2jIHg3OG4gtsAmxE9z+7SBXswms17DYk8ZTVBScUKaYwb
	F/vYnLy2rvypF/nC9ltqTosxygMrl2qTCCbXLHJEs6UuThFm2X1zWAlkQVAlQkaoXSdC
	fuHH9+udqmT+FqKpWd2+BvPwiBxJGkC3Rw+45HA3iptp2hQp/+JLx8C5omyXYfMFdBJz
	DoGiyTgz5bslhhUuolT7CiUPS90aAAhC/CZpamz5367FaXldYveK3jZx2qiusEqBPtzr
	nypw==
X-Gm-Message-State: APjAAAUGra1Sfu+Tg0F50XZ5OKqQuwX2DZaO7em3wLag71DkI3PwE3Fi
	VRAlDgvoPkVpUaCYcEkiWZoLFHOn
X-Google-Smtp-Source: APXvYqzf497tUpy3CZ7EvQ9Kbn9E9cnUHAU2YIkeHe3DCQ6Yyxnw2ldMXYTvsgNILGaampU2w0ETxA==
X-Received: by 2002:a5d:4a82:: with SMTP id o2mr1432746wrq.186.1571988099129; 
	Fri, 25 Oct 2019 00:21:39 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F12337293F05085D4C59AB5.dip0.t-ipconnect.de.
	[2003:f0:7f12:3372:93f0:5085:d4c5:9ab5])
	by smtp.gmail.com with ESMTPSA id y5sm1207095wmi.10.2019.10.25.00.21.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 25 Oct 2019 00:21:38 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Oct 2019 09:21:11 +0200
Message-Id: <20191025072113.11172-14-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025072113.11172-1-schnitzeltony@gmail.com>
References: <20191025072113.11172-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 13/15] libgusb: initial add 0.3.0+
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
X-List-Received-Date: Fri, 25 Oct 2019 07:21:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* It is a dependency for upcoming colord. That is used by GNOME and KDE [1] so
  move it to meta-oe
* 0.3.0 failed build and gobject-introspection was not configurable -> use
  latest master sources

[1] https://www.freedesktop.org/software/colord/intro.html

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/libgusb/libgusb_git.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-oe/recipes-support/libgusb/libgusb_git.bb

diff --git a/meta-oe/recipes-support/libgusb/libgusb_git.bb b/meta-oe/recipes-support/libgusb/libgusb_git.bb
new file mode 100644
index 000000000..e3c0bdd15
--- /dev/null
+++ b/meta-oe/recipes-support/libgusb/libgusb_git.bb
@@ -0,0 +1,12 @@
+SUMMARY = "GUsb is a GObject wrapper for libusb1"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
+
+DEPENDS = "glib-2.0 libusb"
+
+inherit meson gobject-introspection gtk-doc gettext vala
+
+SRC_URI = "git://github.com/hughsie/libgusb.git"
+SRCREV = "636efc0624aa2a88174220fcabc9764c13d7febf"
+PV = "0.3.0+git${SRCPV}"
+S = "${WORKDIR}/git"
-- 
2.21.0


