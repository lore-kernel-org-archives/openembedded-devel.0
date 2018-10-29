Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7BAE86003C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 09:40:59 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id d17-v6so7566595wre.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 02:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QGKQcw+yWJAjxAaLbNV6JePvxolXDClO6oIdrQue/5c=;
	b=cA8kOUmZL+1xmSEJnpTpQSCBBWQcxpt3/r6PsVm6qZ+CaCI4NqdPXQepLApUWp4giK
	4Sp2JWIyGLvoVzv71/2c5ii+tC2ypyp67qnxV45/RuHSrpWizJngBLFiwjdHTVS1/DUR
	UfLHpV1rgmSCFY5263Rbb6OmFn3Db2VPutSrwbfwSB9+maRc8AQsrXexD4esgjymAwjc
	Q8kED1LKqm0T+7DjgFP+PLliK90Us98Jb6lolwJh1Cu9+tLJo13LdusuAWihF0ved7f/
	7CR60IXq0rANjuPa/2bKtQZKOQk40OEF9eC2sllCKWRHjvsHwC3PAVO5p4b3MpRpNDfd
	xXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QGKQcw+yWJAjxAaLbNV6JePvxolXDClO6oIdrQue/5c=;
	b=mHxdK3gHD36zDnoD4g6Ni0rKujKfrpbOTk98QtjMCM0bzBNXAvXs5BzgY2QPjYPgu6
	LKwOpgf2/aI4onHkrI8KJv4qYfyCB8vLDvQzxKyzdBO8XkBKZI29swxN6zXE2BmFwODd
	uonxpW1vmQCEhlgWOlCrtM6y7MV/35bj3F9Jg4d3bdPbetk8eURkkrQlb8aL1xeZFbhn
	G5cqdXutK1iZjPYR93nJFFzrDNvExeVWXE+V+jV6EJFceIpBTYnkSqzAHR4hEKVvxQX+
	ir9ffhLYh9907WAye2Y3qqGnU4V+pLTz8xjOn8qQfRP5AmPgQI7crW0YIPgkyCfhRnwp
	Rbtw==
X-Gm-Message-State: AGRZ1gKnYWOhd96zqGyjW7MeIn908DsqdGXA3c13Mk9ehP1/1PuH0ADW
	6gqlqFGCZp/lHMu6GEEj0Hbe/NUB
X-Google-Smtp-Source: AJdET5dPGYw2BNE/fz1wLONbd9GdtD6xdVSEE/FDFkS90QgMmqvihRStiFPgSSXsawCgvRrACTga0w==
X-Received: by 2002:adf:f409:: with SMTP id g9-v6mr6079202wro.40.1540806059626;
	Mon, 29 Oct 2018 02:40:59 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	60-v6sm14614038wra.35.2018.10.29.02.40.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 29 Oct 2018 02:40:58 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Oct 2018 10:40:41 +0100
Message-Id: <20181029094042.14402-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.5
MIME-Version: 1.0
Subject: [PATCH v2 1/2] xfce4-settings: upgrade 4.12.3 -> 4.12.4
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
X-List-Received-Date: Mon, 29 Oct 2018 09:40:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A GTK3 version is abvailable but keep GTK2: haven't found the time yet to
rework my additions which I would miss.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
V1 -> V2: Remove wrong comment on 0002-Fix-linking-to-dbus-glib-bug-13633.patch
That was a leftover - initial version of this patch was on sumo
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
index d937653fa..a4685aed3 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
@@ -13,13 +13,13 @@ REQUIRED_DISTRO_FEATURES = "x11"
 # + minor bugfixes - sent mainline but no response
 # + option to hide mousepointer for a specific (touch) input device - sent mainline but no response
 SRC_URI = " \
-    git://github.com/schnitzeltony/xfce4-settings.git;protocol=git;branch=for-oe-4.12.3 \
+    git://github.com/schnitzeltony/xfce4-settings.git;protocol=git;branch=for-oe-4.12.4 \
     file://0001-xsettings.xml-Set-default-themes.patch \
     file://0002-Fix-linking-to-dbus-glib-bug-13633.patch \
 "
-SRCREV = "b701ac8b66b83c17469dd5009da51eeb59eba442"
+SRCREV = "75d7c9b15e5ccce12b0864d3659ae9b6de96e245"
 S = "${WORKDIR}/git"
-PV = "4.12.3+git${SRCPV}"
+PV = "4.12.4+git${SRCPV}"
 
 EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
 
-- 
2.14.5


