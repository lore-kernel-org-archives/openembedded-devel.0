Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 321B073D46
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 19:13:19 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so2572471wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 12:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=MNeXX0rPf2xMFR7zAS+bDsTxiVjGdbJAVyVLc2M48VY=;
	b=QGgjfeBE9cletPMv2UnODAPQEI0bd4es3Uy9k4i0o29i1nOsakpW0a60wELz09VnMm
	tyhth47zVnZL6lwMpUYin/Q2F4+XHsVxLK/MWU0vifaTRff09euytq++psb9w5wpi5Mj
	PVr52uNZ2V4HbQ75Zk376x5HOyhrU3lyCxFmMqOrRkz3XEUB7DWV1cYKcCqRdLNuZjMI
	CnRQ4kebJE4sArHTxJVDa1kJnhCPnzfvv7e9XWaSAjb5fYLJk4BUCoDihxRBA6mSCk6l
	AkzZpniqjZOON7UBmF3k2EL7Dnm6vC8AzfKcqX016L28kmstruLkEMQu9mwuKy48GHMo
	GLGA==
X-Received: by 10.194.78.109 with SMTP id a13mr174980wjx.20.1445541199550;
	Thu, 22 Oct 2015 12:13:19 -0700 (PDT)
Received: from localhost.localdomain (p4FDF1181.dip0.t-ipconnect.de.
	[79.223.17.129]) by smtp.googlemail.com with ESMTPSA id
	h8sm203993wib.8.2015.10.22.12.13.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Oct 2015 12:13:18 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Oct 2015 21:13:07 +0200
Message-Id: <1445541189-13375-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1445541189-13375-1-git-send-email-schnitzeltony@googlemail.com>
References: <1445541189-13375-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] efl: add wayland-packageconfig to defaults if wayland is in distro features
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
X-List-Received-Date: Thu, 22 Oct 2015 19:13:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

At least meta-fsl-arm supports either x11 or wayland - not both at the same
time - for their gpu blobs. Selecting x11 only does not build wayland-egl and
efl's configuration fails with:

| checking whether to enable Wayland Egl rendering backend... yes
| configure: error: Wayland Egl dependencies not found
| Configure failed. The contents of all config.log files follows to aid debugging

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-efl/recipes-efl/efl/efl.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/efl/efl.inc b/meta-efl/recipes-efl/efl/efl.inc
index 3cbd04b..945ca6b 100644
--- a/meta-efl/recipes-efl/efl/efl.inc
+++ b/meta-efl/recipes-efl/efl/efl.inc
@@ -51,7 +51,7 @@ EXTRA_OECONF_append_class-native = " \
     --disable-image-loader-dds \
 "
 
-PACKAGECONFIG ?= "wayland egl opengl-es gstreamer1 pulseaudio luajit"
+PACKAGECONFIG ?= "egl opengl-es gstreamer1 pulseaudio luajit ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}"
 PACKAGECONFIG_class-native = "luajit"
 
 PACKAGECONFIG[wayland] = "--enable-wayland --enable-wayland-ivi-shell,--disable-wayland --disable-wayland-ivi-shell,wayland"
-- 
2.1.0


