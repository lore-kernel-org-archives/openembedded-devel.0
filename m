Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SanLb-00027z-SY
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jun 2012 14:22:24 +0200
Received: by mail-wi0-f169.google.com with SMTP id hn14so1164669wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jun 2012 05:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=wMWfwlrTQp17hSoXbeQgCgWbl4AxMxDHt22QvDddCSs=;
	b=pg9rHxn9579cas6m5WzbBZZhC6OTM2V4JryVLshrDx01rWNtIRaknJXeedZfnSKYzO
	G8Zcwv4emthhf+/AHOP5L339CZRsDI5vRQpRxyzeP0BzeyzjTybMhByFgwPFzAcm5pg7
	APpq4kyVFILompGQq+gt87ky81cOBmXNGDMBdMBJZ4xqXzOZ1LqqFDR8OB0K2TckOEmw
	40zCtya4fUWWVvnfGROYsAAYENo6j1aohNpROM26PV3NNrui6AZQf9/3ydi+kx7IIwi3
	wkBBd78LY4QRuSB2ckfnFgetSBVyOOKACRsam3IEtjI3Ozh7awrx3ko1nocIkPbKPdIj
	SCmg==
Received: by 10.216.141.223 with SMTP id g73mr5193887wej.64.1338639123934;
	Sat, 02 Jun 2012 05:12:03 -0700 (PDT)
Received: from localhost.localdomain (p5B0A09D7.dip.t-dialin.net.
	[91.10.9.215])
	by mx.google.com with ESMTPS id d10sm6981854wiy.3.2012.06.02.05.12.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jun 2012 05:12:03 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Jun 2012 14:15:58 +0200
Message-Id: <1338639361-23775-13-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
References: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 12/15] xfce4-embed-plugin: initial add 1.0.0
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
X-List-Received-Date: Sat, 02 Jun 2012 12:22:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../embed/xfce4-embed-plugin_1.0.0.bb              |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.0.0.bb

diff --git a/meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.0.0.bb b/meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.0.0.bb
new file mode 100644
index 0000000..32d6edf
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.0.0.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "A panel plugin that embeds arbitrary windows (or GtkPlug widgets) into the panel."
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-embed-plugin"
+SECTION = "x11/application"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+inherit xfce-panel-plugin
+
+# DEPENDS += "xfconf xproto libxtst"
+
+SRC_URI[md5sum] = "c5b86cbc1c54ee7c1d2e95a4502fed8e"
+SRC_URI[sha256sum] = "35d4c6c56dd6468c0e5afe66f657c1526f2d830a577105a51da43657651832e3"
-- 
1.7.4.4



