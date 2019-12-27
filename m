Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id A0F637CB4F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 21:31:38 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id p17so9325932wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 13:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=hGmkN8h+uOYsbMwT6oMfcJvFDXyj/xjlcWa6GLZRyBU=;
	b=tjrEtckWXpegpAqnv9m1LKP1gZE0qHnlcUOiey6IP2A8oNHxLfRyfp7Cx8YR5sGcpH
	0kV7fHaa4XkQGrRs3YcaUUQRJvRc+uIfp69ef8gqIEYx7Yx6EaV5B2ji7fSxeMZ0nCrS
	WTlwhPMcjaBHp07+o4J3XEM1ceDq9kANuFO4vIhK8zR/jMCVI51pcelsFvp2u7QCmTIB
	i5gTttq4fqwnB2zs5kI6wMRFB78zf3082qUTUbQZ+0PaND71ecqI+wxy6u3je2yhlXXM
	buhSWRP6FBCpgPqq4aonRQvYE+yRPuM9eDg1Mp1Oql38BG9cIWwijmNQ4FPmpVhGF295
	A4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hGmkN8h+uOYsbMwT6oMfcJvFDXyj/xjlcWa6GLZRyBU=;
	b=oY3faqfZPzcI3Vq/LlgM0M5Z6qbUz7qHFi/AnewQYKQzRVPvroWDH89Qx+xnII9GRB
	rgwPjrAhlKQjmLAwEDV/MdTkDpkGFf6jP9K/aCGmjVEbXyt3OVndE5FGlL55rxx/8+Xf
	6kupDUH28uQ+o6dzeKJqsc+RBQ/ctp9LnUoK+MC/8K3IDZdIqxR11E82HrcUH9V54K/l
	cng4xohxCmJWAk/9W1KWOdeHFcXjNLjOptlDOMRIiq2YcFoDofhOtLF2d0U4qF5pOHHz
	CiecFiVy6ReJI2fLtwkamQNyY2MRhkesZ9F3LhpaQllX/+0Vs15cMUkD6Q0332q9UYIE
	ZIxA==
X-Gm-Message-State: APjAAAXOdaX6B5G1EjLK3KHeClDOROtMXOwsxKyjlM8Sx+k1koHTUo4K
	P1UlVW6+UtkmWe25dYuz5r+gaov9Xv4=
X-Google-Smtp-Source: APXvYqxgHSNXS5QB/I9mCqBuEnHUdC3nwi62hVa+GySuUukDB28m4Sspch5qd1JBCusVOEl8cKvJ1w==
X-Received: by 2002:a05:600c:23c9:: with SMTP id
	p9mr21041641wmb.160.1577482299198; 
	Fri, 27 Dec 2019 13:31:39 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F052B8722A751F738295925.dip0.t-ipconnect.de.
	[2003:f0:7f05:2b87:22a7:51f7:3829:5925])
	by smtp.gmail.com with ESMTPSA id
	m7sm11915929wma.39.2019.12.27.13.31.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Dec 2019 13:31:38 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Dec 2019 22:31:12 +0100
Message-Id: <20191227213120.3930-15-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191227213120.3930-1-schnitzeltony@gmail.com>
References: <20191227213120.3930-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 15/23] gnome-session: 3.34.1 -> 3.34.2
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
X-List-Received-Date: Fri, 27 Dec 2019 21:31:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From [1]:

==============
Version 3.34.2
==============

	autostart-app: Strip blacklisted variables from autostart environment
	data: Ensure shutdown target does not keep units loaded
	data: Make X11 services part of gnome-session-initialized
	data: Remove gnome-session-stable.timer and related units
	data: Remove never used gnome-session-shutdown.service
	doap: Add a description
	manager: Disable session saving on systemd managed sessions
	session-fill: Disable session restoring on systemd
	Translation updates: Chinese (Taiwan), Russian

[1] http://ftp.gnome.org/pub/gnome/sources/gnome-session/3.34/gnome-session-3.34.2.news

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{gnome-session_3.34.1.bb => gnome-session_3.34.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-session/{gnome-session_3.34.1.bb => gnome-session_3.34.2.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_3.34.1.bb b/meta-gnome/recipes-gnome/gnome-session/gnome-session_3.34.2.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/gnome-session/gnome-session_3.34.1.bb
rename to meta-gnome/recipes-gnome/gnome-session/gnome-session_3.34.2.bb
index e1bf16b5c..15bf489c7 100644
--- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_3.34.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_3.34.2.bb
@@ -22,8 +22,8 @@ inherit gnomebase gettext gsettings upstream-version-is-even features_check
 
 REQUIRED_DISTRO_FEATURES = "x11 polkit systemd pam gobject-introspection-data"
 
-SRC_URI[archive.md5sum] = "1a9c10d5468b3ba8abee94653692fe0d"
-SRC_URI[archive.sha256sum] = "d7801fe2d5a751b19cb58081771316a76aabd5c550cd58d4e4c6a5a4ed356660"
+SRC_URI[archive.md5sum] = "38dcdb844a0349cc2fb10998095543e4"
+SRC_URI[archive.sha256sum] = "8bb77381650a03ae4be7260751363bd27da93f09bac1ddbc885f4ce44ebaf8e1"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', 'consolekit',d)}"
 
-- 
2.21.0


