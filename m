Return-Path: <psaavedra@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 8D5546D4ED
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Dec 2018 19:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=References:In-Reply-To:Message-Id:Date:Subject:To:From;
	bh=rII+k8ERcxoG/ME1jhDkJcJLSGqvWkeyhY438de/6T8=; 
	b=Th869iK4Tjfpvxh/6Io2OrYTZVANokoxJMavOxKOXbHQTdDRkfYU0rFMS75MG2zfmU46Ul92Y75JxZuMah96UFCtcvzNRf8WlaI/toN6Yc8RoDHW4DSHHBv6d0I3i6hCPkYHmJJ6kfhiKhXY0LgSmfHmVVJIkbdBUeEr6QwZObYRCuKwz7OK4hwciREOaClFAQcpDxMNzmeFRRvKpH0LMEsAyEq+3g2TInZW/YsbRnJw4nN2jYR5MjXmWTGAjgoNtH52OS22D4ZwpMpCfeeyGMd/nGW/e/YVPoo4URqiMb7IPr2gUD3eJqfSHQ/JsqHl5V2/XLOfOJo1kxPClIJKRQ==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim) id 1gTBQA-000699-W9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Dec 2018 20:59:23 +0100
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Dec 2018 20:59:11 +0100
Message-Id: <4359a79b1ca1bd7e480f342359c001bc34310965.1543694144.git.psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1543694144.git.psaavedra@igalia.com>
References: <cover.1543694144.git.psaavedra@igalia.com>
Subject: [meta-openembedded][PATCH v3 2/7] dconf: remove gsettings inherit schemas
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
X-List-Received-Date: Sat, 01 Dec 2018 19:59:24 -0000

... because it doesn't install any schemas

Motivation and details here:

  https://bugzilla.yoctoproject.org/show_bug.cgi?id=13040

Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
---
 meta-gnome/recipes-gnome/dconf/dconf_0.30.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.30.1.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.30.1.bb
index 38d3ec9b4..9f67673b1 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.30.1.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.30.1.bb
@@ -10,7 +10,7 @@ DEPENDS = "dbus glib-2.0 intltool-native"
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnomebase gsettings bash-completion vala
+inherit gnomebase bash-completion vala
 
 SRC_URI += "file://0001-meson.build-do-not-compile-docs.patch \
            "
-- 
2.11.0


