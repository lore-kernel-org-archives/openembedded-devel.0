Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 67600786E8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Dec 2017 07:10:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBB7A9bB023621
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 10 Dec 2017 23:10:10 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Sun, 10 Dec 2017 23:10:09 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <Martin.Jansa@gmail.com>, <akuster808@gmail.com>
Date: Mon, 11 Dec 2017 02:10:07 -0500
Message-ID: <1512976207-77362-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH][meta-oe] glade: 3.20.0 -> 3.20.2
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
X-List-Received-Date: Mon, 11 Dec 2017 07:10:10 -0000
Content-Type: text/plain

Since glib-2.0 updated to 2.54.2, build glade 3.20.0 failed
...
|../../glade-3.20.0/gladeui/glade-signal-model.c:68:1:
error: conflicting types for 'g_ptr_array_find'
| g_ptr_array_find (GPtrArray *array, gpointer data)
...

The following commit in the new version fixed the issue.
...
commit cb87c89745c93969c3742e7a8a11d546c00107c8
Author: Juan Pablo Ugarte <juanpablougarte@gmail.com>
Date:   Fri Aug 11 18:17:18 2017 -0300

    GladeSignalModel: rename g_ptr_array_find() to prt_array_find()

    GLib 2.54 introduced g_ptr_array_find() which clashes with our own
function

 gladeui/glade-signal-model.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-devtools/glade/{glade_3.20.0.bb => glade_3.20.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/glade/{glade_3.20.0.bb => glade_3.20.2.bb} (86%)

diff --git a/meta-oe/recipes-devtools/glade/glade_3.20.0.bb b/meta-oe/recipes-devtools/glade/glade_3.20.2.bb
similarity index 86%
rename from meta-oe/recipes-devtools/glade/glade_3.20.0.bb
rename to meta-oe/recipes-devtools/glade/glade_3.20.2.bb
index f33b6e3..ad91ca3 100644
--- a/meta-oe/recipes-devtools/glade/glade_3.20.0.bb
+++ b/meta-oe/recipes-devtools/glade/glade_3.20.2.bb
@@ -14,8 +14,8 @@ inherit autotools pkgconfig gnomebase gobject-introspection
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glade/3.20/glade-${PV}.tar.xz \
            file://remove-yelp-help-rules-var.patch \
           "
-SRC_URI[md5sum] = "9964a2da14c5f845eae363889586ca43"
-SRC_URI[sha256sum] = "82d96dca5dec40ee34e2f41d49c13b4ea50da8f32a3a49ca2da802ff14dc18fe"
+SRC_URI[md5sum] = "d3dd9ba33c7d7c854ab207e1ba844dda"
+SRC_URI[sha256sum] = "07d1545570951aeded20e9fdc6d3d8a56aeefe2538734568c5335be336c6abed"
 
 EXTRA_OECONF += "--disable-man-pages"
 
-- 
2.8.1


