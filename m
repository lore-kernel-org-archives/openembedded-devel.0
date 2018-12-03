Return-Path: <psaavedra@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 720FC6C641
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Dec 2018 12:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=References:In-Reply-To:Message-Id:Date:Subject:To:From;
	bh=rII+k8ERcxoG/ME1jhDkJcJLSGqvWkeyhY438de/6T8=; 
	b=DequjJDkp37xaT++UTDJ/uqlXddEz1/wBYeI6hTY1YU14DYgD6C+qhNUCmhAp1Uqnp97514mgAMf8IH1zAL8c1Ow5Dz1bZmr4Zt2/ixApkjuepNrNBXO2fpdFTnwxDw4XQ+1AHEzAWMHInOGIQG1pXIMBObSuJsjT+s+vXmSbI7pW/kexz57kSu68uzIZdFiAvt6xsFmMzbc2RMAQSaXfcLmxmUASdcQLRITnbVSm7qcWr4SERHqGCKP4d3JnZtA6I08Flyr913sKW+Bi2rdQlieXNoNMgNDHSp4xJm6DTEYwHOPEfjJlaKbkwS38I1FKfL1EpShx3tTU00p3vkRLw==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim) id 1gTnb5-0007Lt-Ot
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2018 13:45:11 +0100
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Dec 2018 13:45:04 +0100
Message-Id: <4359a79b1ca1bd7e480f342359c001bc34310965.1543840903.git.psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1543840903.git.psaavedra@igalia.com>
References: <cover.1543840903.git.psaavedra@igalia.com>
Subject: [meta-openembedded][PATCH v4 2/7] dconf: remove gsettings inherit schemas
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
X-List-Received-Date: Mon, 03 Dec 2018 12:45:12 -0000

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


