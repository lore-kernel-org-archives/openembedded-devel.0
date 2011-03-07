Received: from einhorn.in-berlin.de ([192.109.42.8] ident=root)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PwdKD-0007FD-4e
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Mar 2011 17:30:25 +0100
X-Envelope-From: sledz@dresearch.de
Received: from mobil-400-586.intern.dresearch.de
	(p57A21FAE.dip0.t-ipconnect.de [87.162.31.174])
	(authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	p27GSqf8012336
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Mon, 7 Mar 2011 17:28:52 +0100
Received: by mobil-400-586.intern.dresearch.de (Postfix, from userid 1000)
	id C209725FF8; Mon,  7 Mar 2011 17:28:50 +0100 (CET)
From: Steffen Sledz <sledz@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Mar 2011 17:28:43 +0100
Message-Id: <1299515323-2246-1-git-send-email-sledz@dresearch.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <4D74ED30.5020607@mentor.com>
References: <4D74ED30.5020607@mentor.com>
X-Scanned-By: MIMEDefang_at_IN-Berlin_e.V. on 192.109.42.8
Subject: [PATCH] gupnp_0.13.4: disable introspection
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
X-List-Received-Date: Mon, 07 Mar 2011 16:30:25 -0000

Introspection uses host tools within compile stage. Missing tools or
tools of wrong version result in errors like

|   GEN    GUPnP-1.0.gir
| Couldn't find include 'Soup-2.4.gir' (search path: ...)

or

|   GEN    GUPnP-1.0.gir
| /usr/share/gir-1.0/Soup-2.4.gir: Incompatible version 1.0 (supported: 1.2)

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 recipes/upnp/gupnp_0.13.4.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/upnp/gupnp_0.13.4.bb b/recipes/upnp/gupnp_0.13.4.bb
index 07266a1..4327662 100644
--- a/recipes/upnp/gupnp_0.13.4.bb
+++ b/recipes/upnp/gupnp_0.13.4.bb
@@ -2,13 +2,14 @@ LICENSE = "LGPL"
 DEPENDS = "e2fsprogs gssdp libsoup-2.4 libxml2 gtk-doc-native libgee"
 
 require gupnp.inc
+PR = "1"
 
 SRC_URI[md5sum] = "0d562f5f02534c70c3743b2c514db8ba"
 SRC_URI[sha256sum] = "7974953f38a41236c875c3df509abc43e8218b5925fdc18212a73b1ae0d0e7e8"
 
 inherit autotools pkgconfig
 
-EXTRA_OECONF = "--disable-gtk-doc"
+EXTRA_OECONF = "--disable-gtk-doc --enable-introspection=no"
 
 do_configure() {
 	libtoolize --force
-- 
1.7.1



