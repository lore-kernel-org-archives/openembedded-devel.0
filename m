Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 43B5B6BDAB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:42 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id b45so348657eek.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=P4BcuuUK9TIbxFrcm7YMuUjwnf7XNaIC3eT5Qn8P61A=;
	b=el1V+GpKD6flKiu3d8Ul5qNTG8sTjeh2VWztX+eMWPiNNDhJ+K/flFblefRcfQRcBQ
	0yTyhnZLk1ZQodIJgPyo6VksuyGFE/AQzG2h30sA+CIJdxyMWNReXvxrGV9npm3iKILa
	e+0xYYsavOtDhwJkDhufHExkKFgnzRz8+vvhC/qMxQpO3L6ckQVonUYYCtxozoXj+STJ
	KrSKYz9NvEFLzKbu+/vzQi46YBFmo93rIe3lDZcjrehMxN3O46iLgdT4NgytEaE8/9UG
	Tmd/oLNmxfyGHkoOpvrn04OMdzdxbQ3n8umi+yu9K/e0O8WtznxX4S+Pp/G9GneznC8M
	H5cA==
X-Received: by 10.14.183.130 with SMTP id q2mr5454099eem.5.1377791502738;
	Thu, 29 Aug 2013 08:51:42 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k7sm47172138eeg.13.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:33 +0200
Message-Id: <aea426b24749da56c7cf450d61284410bd77f52e.1377791378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 40/66] epiphany: Add PACKAGECONFIG for zeroconf
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:42 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb b/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb
index 00d51f9..ccccad9 100644
--- a/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb
+++ b/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb
@@ -8,6 +8,9 @@ inherit gnome
 SRC_URI[archive.md5sum] = "0c566b3ffd428d2135e3c8cb65352d64"
 SRC_URI[archive.sha256sum] = "278a5c00ce07e6a3ea440d289de22dbec3ebec4ded4ff3b4c48b580f469c2dcc"
 
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'zeroconf', 'zeroconf', '', d)}"
+PACKAGECONFIG[zeroconf] = "--enable-zeroconf,--disable-zeroconf,avahi"
+
 EXTRA_OECONF += " --disable-nss --with-distributor-name=${DISTRO} --without-ca-file"
 
 do_configure_prepend() {
-- 
1.8.3.2


