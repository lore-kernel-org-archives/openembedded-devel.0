Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 55F5978A39
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 19:01:26 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id y8-v6so1846003pll.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Mar 2018 11:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dHA/zguH3UdMQolpGKScM0aHaNcrnJiFtrA5uzSpuV8=;
	b=tWw0lnWYwG+XB+ot80HZMxDXnUDENtNzIjzeB0jpGLt4aPgqjBB/OJWKJFjHU5M1Wq
	Ut8SXzxGRjvpUhhJesTPbMBJpJamhyD1wgZHPjrm48IRMygnIOuKlmRvxOkGKNnL1wnt
	znheLHXJb2GsN24bg6ZTpDXVaXiYOKjUrU4pZuTIykUiacLDLtFoObe2L+NZtjftIUxF
	paRRdj+IAqeK+R4+olfPxLFROKdt+7Y48r3hHOFh9C7pbPUhhRGWgWhqRRxlJM3ZS8ht
	Pwb7Yn7fbYbpFKHpEHo1V+wSFHKpnSwF27HjDusPGLpAfNL2Vjvuet9Sm/JFY52Z4B0c
	uA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dHA/zguH3UdMQolpGKScM0aHaNcrnJiFtrA5uzSpuV8=;
	b=jIAjw9N6Q+vfL/3GneRk+G+8eblS71xXuUCCvhAj/U/fkl7yAhJvg0W4KvQGk6Nfzc
	BzRTc3hGNvx0lmia4tFEpmfnm3fwVGv1EO7cPItHfVN552Hott0WBxlYKmOMJGe1qhpm
	A2YgDJs2CkwIBRv+5pNAHMob8sg0iUbw79f/Nj2rtWJW4DfPOlas4lSb8dziZ8v0w00V
	XIVQ+/Hk82zvPMtUwkYlfCQ7Q30GhunLkmTqD4GlCN0H6bxIjCh+duGVFBLvi8llKT2A
	Jx34tUaYsFLb9GGsYD9Dbc0ykWdytE9n+hOn56l8j3s5lvWN4UwPEHl8Fc5CNiBg4xP7
	ufGw==
X-Gm-Message-State: APf1xPA8CZ6exMR0D3PjrsQm0jWLS8SuGxE8JVCayAowCVwXtnog/7xH
	bFEtnWQ7B6D4vdx02QSW9V8bWg==
X-Google-Smtp-Source: AG47ELsi9NFycrSYTSYtn3fOq1igSdOk8OhAiTi7GsQU7Tx2h1f5Y0HFX85ZAnE4gm+xm/IuLMWElg==
X-Received: by 2002:a17:902:7b90:: with SMTP id
	w16-v6mr20794453pll.26.1520449288651; 
	Wed, 07 Mar 2018 11:01:28 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	s67sm36835461pfg.104.2018.03.07.11.01.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Mar 2018 11:01:27 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed,  7 Mar 2018 11:00:59 -0800
Message-Id: <1520449275-29492-7-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
References: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
Subject: [meta-gnome][PATCH 07/23] gnome-menus3: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 19:01:27 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb
index 01da347..647ae91 100644
--- a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 DEPENDS = "python libxml2 gconf popt gtk+3 intltool-native gnome-common-native"
 
-inherit gnomebase pkgconfig python-dir pythonnative gobject-introspection
+inherit distro_features_check gnomebase pkgconfig python-dir pythonnative gobject-introspection
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 BPN = "gnome-menus"
 
-- 
2.7.4


