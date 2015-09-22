Return-Path: <mbc@koumoul.net>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7FCBF73CF2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Sep 2015 18:24:08 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so205425651wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Sep 2015 11:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=vCoz5FtEOHGFq4ciuwcenFhBFVuIQGu0P/3gAu3fIL0=;
	b=fYwpJgXwQY99sWnQ/0TDUeY7yMxc13pzIMq8w6bElBz50dxbT2Dbp+vmz3/K3QYepf
	V1MLynrz30lKoMw9gwERV5eQaHxsnMZo3ms809wi6pFpDNpmf+N53+n2mXV4xc4t/edE
	FlXkr3HTd8uD3blCgQ831XlqP8SEYAPGCPk6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=vCoz5FtEOHGFq4ciuwcenFhBFVuIQGu0P/3gAu3fIL0=;
	b=Q5y4ncX4aoaSU1MtJCQO/okd2FZv1WSjcr7IW7dA4CBkipyqNs1CxbxsGVMg4u5ALy
	iPyTXf91BNQ8G8BCr4oAXb0xL4hUxtL0Fte/5J/y01HXQjqUIB6IgUZdGT4vL4OPvxvl
	VgiIKWgPxrjIMfP8xtavRzAwT9ikM/GhQ8yUiaA5gdotV+RyGKJssV5vQl8Apm4o3jij
	/MvQ1TEWnd0FhADa6QL4VeBbrEYkTkaYb8UJeV5/2kmv2SJHzUHvpi6k8GwqzClSQC/d
	lVHTFmqrVOUYiINVqRVEnQtshrowD+od37kVdnKSI/rALTv8/Geudx/ybFAVVxPQnFSy
	0yww==
X-Gm-Message-State: ALoCoQksjQPR8hIHr3qqAvomc1F28ku2//RI1ekbwFdRmpjAfOyoaRQfJ+JTqnaDRBt0L+R2sBT8
X-Received: by 10.180.101.198 with SMTP id fi6mr22572660wib.25.1442946248479; 
	Tue, 22 Sep 2015 11:24:08 -0700 (PDT)
Received: from localhost.localdomain
	(ARennes-655-1-41-27.w109-218.abo.wanadoo.fr. [109.218.120.27])
	by smtp.gmail.com with ESMTPSA id
	fs2sm4431047wib.12.2015.09.22.11.24.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Sep 2015 11:24:07 -0700 (PDT)
Sender: "Manuel Bachmann [ IoT.bzh ]" <mbc@koumoul.net>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Sep 2015 20:23:37 +0200
Message-Id: <1442946217-26724-1-git-send-email-manuel.bachmann@iot.bzh>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-efl][PATCH] efl: support wayland, egl
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
X-List-Received-Date: Tue, 22 Sep 2015 18:24:10 -0000

Allow EFL to build with Wayland support.
Allow EFL to build with EGL support (when combined with
Wayland support, it effectively achieves GL acceleration
under a Wayland compositor).

Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
---
 meta-efl/recipes-efl/efl/efl.inc |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/efl/efl.inc b/meta-efl/recipes-efl/efl/efl.inc
index 65c9f37..41af88e 100644
--- a/meta-efl/recipes-efl/efl/efl.inc
+++ b/meta-efl/recipes-efl/efl/efl.inc
@@ -51,9 +51,11 @@ EXTRA_OECONF_append_class-native = " \
     --disable-image-loader-dds \
 "
 
-PACKAGECONFIG ?= "opengl-es gstreamer1 pulseaudio luajit"
+PACKAGECONFIG ?= "wayland egl opengl-es gstreamer1 pulseaudio luajit"
 PACKAGECONFIG_class-native = "luajit"
 
+PACKAGECONFIG[wayland] = "--enable-wayland --enable-wayland-ivi-shell,--disable-wayland --disable-wayland-ivi-shell,wayland"
+PACKAGECONFIG[egl] = "--enable-egl,--disable-egl,virtual/egl"
 # sort of tri-state
 PACKAGECONFIG[opengl-full] = "--with-opengl=full,,virtual/libgl"
 PACKAGECONFIG[opengl-es] = "--with-opengl=es,,virtual/libgles2"
-- 
1.7.10.4


