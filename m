Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id D586171D87
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:40 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id c85so15749223wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=8kLvcXLoXGMMGyUdVi5YI1yvv9tt1nFUVP/NWksMgbQ=;
	b=fmS63sxOi/TVpnRIlfQKMLAvEaMBcWuWjK4Iw3evAyb3Pucwjol3V5/dApLuNxf0PD
	3ge5DYihB8biZpFqnQPMCeg3hhyxTUHwE70vZ2MQfy2mkWDgZWFiN29mtNXi8d0QxhJc
	zR0kNh65pj58niUPEXa1RSMM8aVphqDdfcsAQN7xUhlS7CAxbxwJLDFqr+MGzm4Sxb0E
	1jbUN1iEXUaJEjbJlmg1LeXffmflOF7lpUz+2XtW5yHq4Gr8WvWHbCasu/0CExbV1ML+
	HAcVUlyLGFIQxYHLSHOVFobiJjJHrSOQk7cPQdNsSQvrmt9Y7Q0kk4J04A5UtkeanTr+
	nYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8kLvcXLoXGMMGyUdVi5YI1yvv9tt1nFUVP/NWksMgbQ=;
	b=o9ixdYbdm4tFlAuHDFhgBUvzWjsWNuniZiFWWHRrVTevQj+8r7+/gHMHqeNKysj1NF
	JyA9qQs/sFDqrXXZu2gBwrFIEGYcaxt8aNnZEHE8OFa/0iXevdf3ezIOMfn4fTT2fJmC
	GQ1jOnoY/TenUATHF33mETD37PN6fDLJgWaV+FKpXjQ1Qd0uVTd+m+0NjLcOu+uFuHWJ
	70j/NjRR9+U8F2tjt+jF9zlIeSvhr8ZUeQp+fuDmIReJKoPDBTo+EZLXjDEDP3Q5PFkD
	lX+5+65jvRi1EYw1xY6TIIUeRehVlCM37bEDBHQq5w974xnPrhSU4AzRILvMGBu0qK9l
	Ew2g==
X-Gm-Message-State: AMke39kp+eBKMTQXGWtu6u+O5ePuZgOJvIyA+eeRQVlbLQNUAVKycIzb6ep897kUf4evjA==
X-Received: by 10.28.132.2 with SMTP id g2mr20041594wmd.103.1487614060989;
	Mon, 20 Feb 2017 10:07:40 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:40 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:41 +0100
Message-Id: <20170220180700.29836-26-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 25/44] gtksourceview2: add glib-2.0-native to DEPENDS and unblacklist
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
index ac7540e..e3bf551 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://projects.gnome.org/gtksourceview/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "gtk+ libxml2 intltool-native gnome-common-native"
+DEPENDS = "gtk+ libxml2 intltool-native gnome-common-native glib-2.0-native"
 
 PNAME = "gtksourceview"
 
@@ -29,5 +29,3 @@ do_configure_prepend() {
 }
 
 FILES_${PN} += " ${datadir}/gtksourceview-2.0"
-
-PNBLACKLIST[gtksourceview2] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130597/"
-- 
2.9.3


