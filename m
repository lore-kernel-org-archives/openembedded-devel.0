Received: from mail-ea0-f171.google.com ([209.85.215.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ucdpq-0006m1-Du
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 May 2013 17:41:53 +0200
Received: by mail-ea0-f171.google.com with SMTP id b15so1156513eae.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 May 2013 08:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=TJ9KyBVNFbbQxoVDcUNi3dCtmhoA9w+RQHLhoE+FaAI=;
	b=ol3pRrhPT9Ti53MMo5iKqk9kjQOAbL1S1/qnJ1trjwKVUPRdiSyfJYqX2pAM4x0zLK
	GUr7jfQyuU7D3mFseHjIe68B8qC67lBMdiavEzNKWZW5EzvzPQcT5JAp8WgfolAlvSbB
	+/EEAig/WdkvWiCn4iDseg1huJOuw6NV4Fe97eDNvmZPPMmq3AoPiWe9UOcxBwscBDTo
	xU9vloO04gpo0jZ7TWsjgKbKP/kEnfbzl3CB1kzPnEMLqODc86qs+aKpcwafF6KIx+EJ
	PrLHUVGi/NSnbf4t5c14v1bz0ipoTAji5tIQskko5tn3jvgoKK4Cj2PZFn8hhgCdBjFu
	N7tw==
X-Received: by 10.15.82.201 with SMTP id a49mr104826031eez.44.1368631413847;
	Wed, 15 May 2013 08:23:33 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204])
	by mx.google.com with ESMTPSA id t9sm4599519eeo.11.2013.05.15.08.23.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 15 May 2013 08:23:33 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 May 2013 17:20:49 +0200
Message-Id: <1368631259-13401-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1368631259-13401-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368631259-13401-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 04/14] xarchiver: align libexecdir so that thunar-archive-plugin finds tap files
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
X-List-Received-Date: Wed, 15 May 2013 15:42:19 -0000
X-List-Received-Date: Wed, 15 May 2013 15:42:19 -0000
X-List-Received-Date: Wed, 15 May 2013 15:42:19 -0000
X-List-Received-Date: Wed, 15 May 2013 15:42:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xarchiver installs tap files for thunar-archive-plugin in
$libexexdir/thunar-archive-plugin under the assumption that there is a
single/common $libexexdir for all packages. In bitbake.conf oe-core
sets libexecdir = "${libdir}/${BPN}" which causes thunar-archive-plugin
not to find xarchiver tap-files.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-apps/xarchiver/xarchiver_0.5.2.bb      |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
index f47a3bc..6482adc 100644
--- a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
+++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Lightweight, desktop independent GTK+ archive manager"
 HOMEPAGE = "http://xarchiver.sourceforge.net"
 SECTION = "x11"
-PR = "r2"
+PR = "r3"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
@@ -14,4 +14,9 @@ SRC_URI[sha256sum] = "cea932ff9d505969201fd502470bbebbc5726ab3d6765e142fc8295aa6
 
 inherit gettext pkgconfig autotools gtk-icon-cache
 
+# install tap files for thunar-archive-plugin in ${libdir}/thunar-archive-plugin
+EXTRA_OECONF += "--libexecdir=${libdir}"
+
+FILES_${PN} += "${libdir}/thunar-archive-plugin"
+
 RRECOMMENDS_${PN} = "lzop zip tar bzip2 unzip"
-- 
1.7.6.5



