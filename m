Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6DBEE7886D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:24:48 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id q3so167077plr.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+o0Rp8Ip0WMMJAcvD2Aod+4T21VjgV3cq+NS0ML78n8=;
	b=tHMyWMI8BcbTj0ugR6/W0SLAJuIiazIlJgWQAXTmXzCngVgSPr7yVkVpp9+qStuB6g
	gFZ55JNu/a99bg04/fkAzHlqJ5M6mxnyHCOd2yukrIJYCfNVnR2KFUcHeMQVi7yC12Xy
	9eEI74Df1CEyYCFGR2TdH/Liew8yYcDqysf7JPAFUQX289gUJVK5D6dQfrTF3hCocERQ
	nCWalhGk9c6IKiubKnl+GwVtUzvCTqECdakCBhvWJYA1bbLN1e2rXdqtS/EFvIZuDsNx
	wIevwbZWEft+0H9Mm25ya1k0imZeEuuaiX8cy8qdPtAlVQTicoF3sp4+Io6lAJJBHeX2
	JS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+o0Rp8Ip0WMMJAcvD2Aod+4T21VjgV3cq+NS0ML78n8=;
	b=WGN8PHOQhlgZ0gwcMyVaU3UfK3xdyujAOCYLlZxi/maZeVIryetzOru90x/uauVYEn
	CrP+Z/m0iPYV49+seCOTtnhaZ1HGl8qxyvS1GWB4/xCrO77N8mGkh9w7iS3mddDQ151l
	jM+VGDnPb21hioK/CLtgAtfW5zZ1ELUSl11kOfaMGi8J9T5/G2SencA/CPqozuHY7ERU
	QmvdjViy38Py9alYRlULrNl/Fi59Lm9RLgEguUNmfBTRhQ4olZM8YGC8xSZZrWaii5iA
	aWmzRIJQnPKIaHmH4Z72EuYGvtoPFTwSQ7PHY2oPHMXi5Pp5ae6VLFpAtWlZSfVGjdx0
	2xIA==
X-Gm-Message-State: AKwxytewQ0VTXrIzFeZfT8wHoNWUHrPp0hLhlVOSTfZv9kcJIY3LcpNQ
	kLy+iDR8KQlKVuE6VvlcYqA=
X-Google-Smtp-Source: AH8x227+RU2qlAAk5oY7i2la/pTC8jNZgowHcOkMsisymJho/OogfJ9aEHEF3SS2xUnByXV3no1gJA==
X-Received: by 2002:a17:902:7006:: with SMTP id
	y6-v6mr6049506plk.35.1517023489726; 
	Fri, 26 Jan 2018 19:24:49 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.24.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:24:49 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:09 -0800
Message-Id: <7b52b9641f7520314cad26489eaa870e8a69f945.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
Subject: [PATCH 09/36] polkit: add consolekit only when x11 is enabled
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
X-List-Received-Date: Sat, 27 Jan 2018 03:24:48 -0000

From: Jackie Huang <jackie.huang@windriver.com>

consolekit depends on virtual/libx11 then it requires x11
distro feature, so add consolekit option only when x11
is in DISTRO_FEATURES.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 19f0e8b40b88162483198934ac38c04d60102791)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/polkit/polkit_0.113.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/polkit/polkit_0.113.bb b/meta-oe/recipes-extended/polkit/polkit_0.113.bb
index 326c934..f34928f 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.113.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.113.bb
@@ -10,7 +10,9 @@ DEPENDS = "expat glib-2.0 intltool-native mozjs"
 inherit autotools gtk-doc pkgconfig useradd systemd gobject-introspection
 
 PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
-                 ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', 'consolekit', d)}"
+                 ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', \
+                    bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d), d)} \
+                "
 
 PACKAGECONFIG[pam] = "--with-authfw=pam,--with-authfw=shadow,libpam,libpam"
 PACKAGECONFIG[systemd] = "--enable-libsystemd-login=yes --with-systemdsystemunitdir=${systemd_unitdir}/system/,--enable-libsystemd-login=no --with-systemdsystemunitdir=,systemd"
-- 
2.7.4


