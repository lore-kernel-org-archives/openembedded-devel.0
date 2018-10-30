Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4C9CA79C76
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 08:41:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9U8fgFh005673
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 01:41:42 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 30 Oct 2018 01:41:41 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 30 Oct 2018 15:59:24 +0800
Message-ID: <20181030075927.23175-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181030075927.23175-1-kai.kang@windriver.com>
References: <20181030075927.23175-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 1/4] libwnck3: 3.24.1 -> 3.30.0
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
X-List-Received-Date: Tue, 30 Oct 2018 08:41:41 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../libwnck/{libwnck3_3.24.1.bb => libwnck3_3.30.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/libwnck/{libwnck3_3.24.1.bb => libwnck3_3.30.0.bb} (78%)

diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.24.1.bb b/meta-gnome/recipes-gnome/libwnck/libwnck3_3.30.0.bb
similarity index 78%
rename from meta-gnome/recipes-gnome/libwnck/libwnck3_3.24.1.bb
rename to meta-gnome/recipes-gnome/libwnck/libwnck3_3.30.0.bb
index f3103b4d7..9cee9c967 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.24.1.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck3_3.30.0.bb
@@ -12,8 +12,8 @@ PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-s
 
 inherit gnomebase gobject-introspection gtk-doc gettext
 
-SRC_URI[archive.md5sum] = "23df51ec0a1169014fe3a102d572b244"
-SRC_URI[archive.sha256sum] = "afa6dc283582ffec15c3374790bcbcb5fb422bd38356d72deeef35bf7f9a1f04"
+SRC_URI[archive.md5sum] = "60109c2ab0b07da1099ee57980054de1"
+SRC_URI[archive.sha256sum] = "ac6d0d2646aa80676d3066651e73abb7bff7ed79be238c9b21a0083e2adc3439"
 
 inherit distro_features_check
 # libxres means x11 only
-- 
2.18.0


