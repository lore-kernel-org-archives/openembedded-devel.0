Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SXacK-0002bF-Cs
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 May 2012 18:10:24 +0200
Received: by bkcjm2 with SMTP id jm2so7581912bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2012 09:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=V9U77Xup/gVkKTDSXTAbMsuUAMUTkLOrdcbMNwJjpv8=;
	b=m96lJ4JDeIUnjlR27nSvxMSyo/3TU80YfCo8lwJzdCqVTGcOIGvygt0eGXxQny/YHE
	lf1H9gUGzIk3uBS28RDByVOSOtB7Wz4OBOCx0tBvRCwiKBOZfwtnQzNFywWYK+g6m5sh
	PCwav6BkTOXBFiAud0USOSAvHum9r7hiv9vg//WTbteXryb0KmGEZ6v9NxYu6IlgHvNa
	IXXry2XP+rftRe9k7KhQ+8gzNdMH8bgZxMmsv1OogZgipM+XnqeoSNGOJNxBBqtFGPIK
	3pOmSRtUjNeC84Cyl7dPyZEnSvTewgdvfsLHU+Y7y3SmV+WAmJng01yyvJf2Hr2hqwsd
	nGtQ==
Received: by 10.204.152.132 with SMTP id g4mr14642586bkw.88.1337875213162;
	Thu, 24 May 2012 09:00:13 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id iq16sm3448705bkc.6.2012.05.24.09.00.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 May 2012 09:00:12 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2012 18:00:03 +0200
Message-Id: <1337875204-19068-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [PATCH 1/2] xfce4-xkb-plugin 0.5.4.3 inital add
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
X-List-Received-Date: Thu, 24 May 2012 16:10:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

run tested on angstrom/overo

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xkb/xfce4-xkb-plugin_0.5.4.3.bb                |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.5.4.3.bb

diff --git a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.5.4.3.bb b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.5.4.3.bb
new file mode 100644
index 0000000..8ec7fd2
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.5.4.3.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "XKB layout switching panel plug-in for the Xfce desktop environment"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-xkb-plugin"
+SECTION = "x11/application"
+LICENSE = "Alexander_Iliev"
+LIC_FILES_CHKSUM = "file://COPYING;md5=496f09f084b0f7e6f02f769a84490c6b"
+
+inherit xfce-panel-plugin
+
+DEPENDS += "libxklavier libwnck librsvg"
+
+SRC_URI[md5sum] = "b31144bd50875ec73f0b3101456c97fd"
+SRC_URI[sha256sum] = "ca4801bb2edfe04eeceb71879b3cf79a0674e8311c39117efdb9d3521307396d"
+
+FILES_${PN} += "${datadir}/xfce4/xkb"
-- 
1.7.6.5



