Received: from einhorn.in-berlin.de ([192.109.42.8])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1Pcxec-00069M-Hg
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 11:10:10 +0100
X-Envelope-From: sledz@dresearch.de
Received: from mobil-400-586.intern.dresearch.de
	(p57A22740.dip0.t-ipconnect.de [87.162.39.64]) (authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	p0CA9csb007092
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 12 Jan 2011 11:09:38 +0100
Received: by mobil-400-586.intern.dresearch.de (Postfix, from userid 1000)
	id DA21824A35; Wed, 12 Jan 2011 11:09:37 +0100 (CET)
From: Steffen Sledz <sledz@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Jan 2011 11:09:35 +0100
Message-Id: <1294826975-24312-1-git-send-email-sledz@dresearch.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <4D2D7BEB.8080706@dresearch.de>
References: <4D2D7BEB.8080706@dresearch.de>
X-Scanned-By: MIMEDefang_at_IN-Berlin_e.V. on 192.109.42.8
Subject: [PATCH] epiphany-2.30.2: unbreak build by disabling CA files
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
X-List-Received-Date: Wed, 12 Jan 2011 10:10:10 -0000

This is a workaround to unbreak the build of epiphany for various host
operating systems, since nobody was able/willing to fix it in the right
way.

see also:
* <http://thread.gmane.org/gmane.comp.handhelds.openembedded/38251>
* <http://thread.gmane.org/gmane.comp.handhelds.openembedded/41291>

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 recipes/gnome/epiphany_2.30.2.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gnome/epiphany_2.30.2.bb b/recipes/gnome/epiphany_2.30.2.bb
index 57a5d9a..3a8b5f5 100644
--- a/recipes/gnome/epiphany_2.30.2.bb
+++ b/recipes/gnome/epiphany_2.30.2.bb
@@ -11,7 +11,7 @@ SRC_URI[archive.md5sum] = "29b084acfa016540d91d3601ec3dff5c"
 SRC_URI[archive.sha256sum] = "cd0124e71e72142593cfeb442d58d97e99ba94ace6e31d94717fe977c0bfb98a"
 
 
-EXTRA_OECONF += "--disable-nss --with-engine=webkit --with-distributor-name=${DISTRO}"
+EXTRA_OECONF += "--disable-nss --with-engine=webkit --with-distributor-name=${DISTRO} --without-ca-file"
 
 do_configure_prepend() {
         touch ${S}/gnome-doc-utils.make
-- 
1.7.1



