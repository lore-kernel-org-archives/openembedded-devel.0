Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2316D7FDDF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 21:05:30 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id q9so4512236wmj.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jan 2020 13:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=4MvB21JLwmvAT1RzWUDrEmqU/GWYoS0SVbhyq+vXBms=;
	b=lBJZaBAF4YMXxnGLbp75TEb1T+CSomVX410hDC4R0PojKvkaBZKrbZbSJkcKukLA1l
	XQEHLpOqqVyN1lY4tD0KF9SiTqwTtTSskvyuM/mMwdOqI7v0CSENzHYdrD4o1vY5pdrd
	otQB12Rfr/FyF0cmumrT9pwmVEBgdJHo8VhxZqnSEgNGLYhUVE6DWF7aUGJVf0T82SA3
	6+38HnAvGbWw5jgEcy43vWk8EJvICLbsnEFnvwHVc5owABuXkn0z7E6slF2XlCrQTIZO
	WTLY7WrSB7rpdEo5M+cDQDLNIrlckZbt22u05MwH0DP97jHSLxi+9VeILMTdffuQrI0P
	rMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4MvB21JLwmvAT1RzWUDrEmqU/GWYoS0SVbhyq+vXBms=;
	b=Posdy8GA/G+KYaBBvLxN3hpY6Yd65FLKw2IBB5DOW3tIfPYu7YGDuMAsi2U0VLoKf4
	G9wtEut1yS5v9S/GBX15fG4yJYtothhIlM4EvcQ+lpElpYnwJG+ufZYx4f5yW7zs35CX
	zYFDO6/M88FUxkAVoU+SAJCSmPE2ndPotAdZukVN8Tn4GoPLyiVv39/uX2sQrIQwhbNX
	YqcOK5+PdQF/n+0qAgFu/bfPITc9+bI10NiVOOzCUzEmHrd4wsHkagPSabD45b8Qw3vb
	aYsc7/Z2EbK4BI8YKMpZi8k3ZLQ5cJ1HTm4EFNRE8tOip6kwmy3jrYp4Q3kgA0bsfNiW
	g1Ag==
X-Gm-Message-State: APjAAAV5k+U9jThkPevEYEHQnzKDRvnq/f1scQ4+uRP6RqOZMWWagDXY
	ZlYE/wfJtL6axX2Eg4RMOCAQDHzhLls=
X-Google-Smtp-Source: APXvYqydNufBcBmbNn2V6Q7XGPCfUs5kDtWgT07wuYR4UlHPIh5IOylIZHoE9AV1gLVP6h2qaGQ/8w==
X-Received: by 2002:a1c:a78c:: with SMTP id q134mr6414809wme.98.1578603930639; 
	Thu, 09 Jan 2020 13:05:30 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0446528B12EBEBA10192C2.dip0.t-ipconnect.de.
	[2003:f0:7f04:4652:8b12:ebeb:a101:92c2])
	by smtp.gmail.com with ESMTPSA id q6sm9825041wrx.72.2020.01.09.13.05.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 13:05:30 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jan 2020 22:05:15 +0100
Message-Id: <20200109210518.22451-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200109210518.22451-1-schnitzeltony@gmail.com>
References: <20200109210518.22451-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 6/9] gjs: upgrade 1.58.3 -> 1.58.4
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
X-List-Received-Date: Thu, 09 Jan 2020 21:05:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From [1]:

Version 1.58.4
--------------

- Now prints a warning when constructing an unregistered object inheriting from
  GObject (i.e. if you forgot to use GObject.registerClass.) In 1.58.2 this
  would throw an exception, which broke some existing code, so that change was
  reverted in 1.58.3. In this version the check is reinstated, but we log a
  warning instead of throwing an exception, so that people know to fix their
  code, but without breaking things.
  NOTE: In 1.64 (the next stable release) the warning will be changed back into
  an exception, because code with this problem can be subtly broken and cause
  unexpected errors elsewhere. So make sure to fix your code if you get this
  warning.

- Closed bugs and merge requests:
  * GSettings crash fixes [Andy Holmes, !373]

- Memory savings for Cairo objects [Philip Chimento, !374]

- Fix for crash in debug functions [Philip Chimento, !374]

[1] http://ftp.gnome.org/pub/gnome/sources/gjs/1.58/gjs-1.58.4.news

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/gjs/{gjs_1.58.3.bb => gjs_1.58.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.58.3.bb => gjs_1.58.4.bb} (87%)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.58.4.bb
similarity index 87%
rename from meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb
rename to meta-gnome/recipes-gnome/gjs/gjs_1.58.4.bb
index ddd5196b2..eb7d323a6 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.58.4.bb
@@ -11,8 +11,8 @@ DEPENDS = "mozjs gtk+3"
 
 inherit gnomebase gsettings gobject-introspection vala gettext features_check upstream-version-is-even
 
-SRC_URI[archive.md5sum] = "bce6dea9a6583a8b3c6af5854df76aaf"
-SRC_URI[archive.sha256sum] = "ca9fcd47b95ab0fc445301b2595e51fcea24d6f3cd87c190fe07006146d773ae"
+SRC_URI[archive.md5sum] = "385f4baa266991a08d3e425bc69ee962"
+SRC_URI[archive.sha256sum] = "261a3f666c771d7744965fe71b804fc2c3a3d46a8e3e8d4f7ed5ef97967ebd5f"
 SRC_URI += "file://0001-Disable-tests-on-host.patch"
 
 # gobject-introspection is mandatory and cannot be configured
-- 
2.21.0


