Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TqQI6-0000Yx-1s
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jan 2013 16:31:38 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so5782554eaa.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jan 2013 07:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=oo+g5mjUy0iNEwZ/vlryJXDhwvcp22Wk6r/06dq/esI=;
	b=gCubZgo0P+x20OXg5aNPQl1IRRh9VmIldVMt+VKcOv1CGzXchH78JYjqHTG537dK4S
	yRT2WKTvdPKU6nyOpUS2a9fIjrlBQ9t1dw/1jSH5x7mb9fjxgHAU0X6LPKNw7DzXSsEy
	Vq6O29AGpDPPYum70eSY87qCkinKNlInC/B6cvkRlLgH3Ruu5EbIJyOSWi97uztcMLmR
	QBqRkDyP4XegHH+GLDWZGq6+ZG8EIRR4AAD/7TkxQHJdjpGRgGl/x2chVSneF6oJbYzK
	aTHTC7r4k3WqnmI7rd3kxj1C/Bv4JzRn6sdjC27B0PFr34H+7Oo+EA8QMHR4HQHp5ezn
	ftJQ==
X-Received: by 10.14.219.72 with SMTP id l48mr126394455eep.37.1357139795877;
	Wed, 02 Jan 2013 07:16:35 -0800 (PST)
Received: from localhost.localdomain (p4FDF1C58.dip.t-dialin.net.
	[79.223.28.88])
	by mx.google.com with ESMTPS id b2sm98071345eep.9.2013.01.02.07.16.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Jan 2013 07:16:35 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jan 2013 16:16:11 +0100
Message-Id: <1357139774-4364-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1357139774-4364-1-git-send-email-schnitzeltony@googlemail.com>
References: <1357139774-4364-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/meta-gnome/V2 07/10] xfce4-mixer: update to 4.10.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Jan 2013 15:31:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...{xfce4-mixer_4.8.0.bb => xfce4-mixer_4.10.0.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-mixer/{xfce4-mixer_4.8.0.bb => xfce4-mixer_4.10.0.bb} (53%)

diff --git a/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.8.0.bb b/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.10.0.bb
similarity index 53%
rename from meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.8.0.bb
rename to meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.10.0.bb
index 23a8ba5..1884860 100644
--- a/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.8.0.bb
+++ b/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.10.0.bb
@@ -6,9 +6,9 @@ inherit xfce-panel-plugin
 
 DEPENDS += "glib-2.0 gst-plugins-base gtk+ xfconf"
 
-SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
+SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "3fa3a9973e18c04da26709a654e242ff"
-SRC_URI[sha256sum] = "9f9f48fdd0d3f6b1e46694b93a44d15b800db72a96d831b5111d9ac976970fab"
+SRC_URI[md5sum] = "e47d5b3e873fdee3fa80d309a5f53e9c"
+SRC_URI[sha256sum] = "a8c589001b438171ea5a6b46ce9895c3ffbc5081ab67805ab9870e540068dade"
 
 RDEPENDS_${PN} = "gst-meta-audio"
-- 
1.7.4.4



