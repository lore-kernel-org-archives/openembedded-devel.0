Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 65EF974933
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 00:22:40 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id b6-v6so6214313pla.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2018 17:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3dJyAAvMJ26ER+Des6zuu8bOBVvNhIfSGdpvfBP4sPw=;
	b=JmQ4tWx0au2CWSJOlBLqOv142CuPVREsneBF+/lE1YHk3ueac8plNGhZ/Ru5N8mKKS
	7BBQiwr3sm7ldHk1kg22cDhJLiRtG2rVX/E3N1T/qXxXuatwrAqqTrhoJTmXPyCE7Zji
	kEAZM+dCF5cD9OHwC4dzY9RMYgnJZg5GhWzp4Sbap+7jJJun9Ehb47wlebjEUUmLAHVu
	myc5EK12mVXwNA6LZY/9ObKvn5dord8i8u+3sgQ+gf+3yVxb3AjXoPmiZRvj46w+B86M
	hcErDcTCQvjp6uOWZZ+aHpYjvCBNySNHIJXR2sxwA7WRcQ8+wQELYkxiIhhRJS4EVbff
	485w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3dJyAAvMJ26ER+Des6zuu8bOBVvNhIfSGdpvfBP4sPw=;
	b=YAVrTuhLh5iL7sxM/3FnBhv1K6gJBkxSHCzJUCfaeFQAP1vMftKnw08/QfndiRh+NW
	rfPx7+SiiTis4Eh+7AELJ08f/o3UWy2KFAHqWUGLhLUX1QwbAmzzzWYCxS6FXDDL+R1R
	KBOu9U7jHL84EazjS8nhb2A/Igs1Mo7r7ffi5Zw5sWLTcwBHEicZ+Hf9EPDWe5z31jsv
	hUkB7ukjt1M+JhQTII/7DzlQ+VrRM+xmWTgQu3OgzRZRQ0islDPh2mf+f3fkL7+sS76L
	RwAARHY+PmsrLgU7WHjualF1OiFVFdLSIBtCzp138nZ/sbuW5sy8NXUT3yTVOPknLPQ+
	KRcA==
X-Gm-Message-State: AElRT7Hj0VqO7pBFcnIGirOjC+vcxZkDbJeQ4yvG0B8yltwlEITfMtbS
	1Y4Jv7DrnDLKV9jp3L60lmuvkA==
X-Google-Smtp-Source: AIpwx4+hTg8C2rLuz+Fpd+l+edS6VijE/+9HF+/5+6OzmVIJicXLfddwev94lvdx9YDvNaZcwmO3eA==
X-Received: by 2002:a17:902:6909:: with SMTP id
	j9-v6mr41192556plk.92.1523319761651; 
	Mon, 09 Apr 2018 17:22:41 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6097:a43d:5d02:3a1c])
	by smtp.gmail.com with ESMTPSA id
	a5sm2562046pfl.159.2018.04.09.17.22.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Apr 2018 17:22:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Mon,  9 Apr 2018 17:22:29 -0700
Message-Id: <1523319756-8431-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523319756-8431-1-git-send-email-akuster808@gmail.com>
References: <1523319756-8431-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 03/10] xfce4-vala: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 10 Apr 2018 00:22:40 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
index a25e2e6..28f9cde 100644
--- a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
+++ b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
@@ -3,7 +3,9 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
 DEPENDS = "libxfce4util garcon xfconf libxfce4ui xfce4-panel exo vala xfce4-dev-tools-native"
 
-inherit xfce pkgconfig
+inherit xfce pkgconfig distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://archive.xfce.org/src/bindings/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "0bbb1d6e473e0fe9b335b7b1b49d8a71"
-- 
2.7.4


