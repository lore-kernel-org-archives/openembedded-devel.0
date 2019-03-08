Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B56657CF39
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Mar 2019 01:33:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x281X53w026994
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 7 Mar 2019 17:33:05 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 7 Mar 2019 17:33:04 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 7 Mar 2019 20:32:34 -0500
Message-ID: <20190308013237.194105-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190308013237.194105-1-kai.kang@windriver.com>
References: <20190308013237.194105-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 2/5] libtimezonemap: 0.4.5 -> 0.4.6
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
X-List-Received-Date: Fri, 08 Mar 2019 01:33:04 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...ibtimezonemap_0.4.5.bb => libtimezonemap_0.4.6.bb} | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)
 rename meta-gnome/recipes-gnome/libtimezonemap/{libtimezonemap_0.4.5.bb => libtimezonemap_0.4.6.bb} (74%)

diff --git a/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.5.bb b/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
similarity index 74%
rename from meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.5.bb
rename to meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
index 957d7d027..7f52c42cd 100644
--- a/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.5.bb
+++ b/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
@@ -4,14 +4,11 @@ SECTION = "devel/lib"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/libt/${BPN}/${BPN}_${PV}.tar.gz \
-"
-SRC_URI[md5sum] = "054306fa998fe580f17b68aa1e16551b"
-SRC_URI[sha256sum] = "327e64a17c676c1bcda3b6ba3394d3d01250e5ac9a49222b9ff5737d90b15383"
+SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/libt/${BPN}/${BPN}_${PV}.tar.gz"
+SRC_URI[md5sum] = "f85a21994a397fb1ff2d3ec404bdd592"
+SRC_URI[sha256sum] = "0d634cc2476d8f57d1ee1864bd4f442180ae4bf040a9ae4bf73b66bbd85d7195"
 
-
-DEPENDS = "gtk+3 gdk-pixbuf libsoup-2.4 json-glib gnome-common-native \
-"
+DEPENDS = "gtk+3 gdk-pixbuf libsoup-2.4 json-glib gnome-common-native"
 
 B = "${S}"
 
-- 
2.20.0


