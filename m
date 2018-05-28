Return-Path: <leon.anavi@konsulko.com>
X-Greylist: delayed 2677 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 28 May 2018 20:18:16 UTC
Received: from voyager.icnhost.net (ns13.icndns.net [78.142.50.13])
	by mail.openembedded.org (Postfix) with ESMTP id BD3E7606BF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 May 2018 20:18:16 +0000 (UTC)
Received: from [213.145.109.17] (port=46104 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-SHA256:128) (Exim 4.89_1)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1fNNtj-00067J-Fz; Mon, 28 May 2018 22:33:39 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 May 2018 22:33:21 +0300
Message-Id: <1527536001-32637-1-git-send-email-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.7.4
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: [meta-multimedia][PATCH] rygel: Update license to LGPLv2.1
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
X-List-Received-Date: Mon, 28 May 2018 20:18:17 -0000

Fix the warning below and set proper license according to the
content of file COPYING in Rygel:

WARNING: rygel-0.34.0-r0 do_populate_lic: rygel: \
No generic license file exists for: LGPL1.1 in any provider

According to a git commit in Rygel made two years ago by Jens
Georg: "all: Update license text to LGPLv2.1 proper We always
claimed being LGPLv2.1 but the license text said differently."
In the same time the tag for Rygel 0.34 has been created on
20 March 2017, aka after this git commit. For more details:
https://gitlab.gnome.org/GNOME/rygel/commit/cdcb6bd55efd0c3b7a2fd4ae5c3d8556f69f8402

Furthermore, the changelog of Rygel 0.34.0 also indicates
that the license is LGPLv2.1+ (after a fix in release 0.29.1):
https://abi-laboratory.pro/tracker/changelog/rygel/0.34.0/log.html

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb
index e94c9ff..f13f5ce 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb
@@ -5,7 +5,7 @@ Additionally, media player software may use Rygel to become a MediaRenderer \
 that may be controlled remotely by a UPnP or DLNA Controller."
 HOMEPAGE = "http://live.gnome.org/Rygel"
 
-LICENSE = "LGPL1.1+"
+LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "libxml2 glib-2.0 gssdp gupnp gupnp-av gupnp-dlna gstreamer1.0 gstreamer1.0-plugins-base ossp-uuid libgee libsoup-2.4 libmediaart-2.0 libunistring sqlite3 intltool-native"
-- 
2.7.4


