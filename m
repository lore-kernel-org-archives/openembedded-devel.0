Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SanLR-00028M-6s
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jun 2012 14:22:13 +0200
Received: by wibhm14 with SMTP id hm14so1276602wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jun 2012 05:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=t6eqPjy2OGHlyJWkVw4L5qZtPQPWm1kw8m/QMj0bCCU=;
	b=lBVf0o6JQlHrJQubGLNRMakGC0ooL9vGfL2IokZME+TT9LlTpbghmMLS+r0T+4fyPd
	YU8OFUSIVpNQe3+QrDJExT9fmcaA7N5BwU+XlUGsc4pbuT5dt91ObWLE1KhfrMMDd0la
	ynNuQCzjqMV7C3POhfPPRczxYLXCFNre6t2VJbKaIYVP/7FM9+u1QB8B/HeIK6oE/wv1
	EUMZBhH7UT0jW5EHCCxBMIED5JAUscLIr6aBx/iFWqYQDx5PjpG54PBWks/A6xjgZcy2
	mMfy6yS2av9oXTwwcyfVrRLiAFsWjFqDw8OzMOBXNmnGgEaHQfbJVNxqLQ5EErDkrg3a
	eqGw==
Received: by 10.216.141.223 with SMTP id g73mr5193450wej.64.1338639111099;
	Sat, 02 Jun 2012 05:11:51 -0700 (PDT)
Received: from localhost.localdomain (p5B0A09D7.dip.t-dialin.net.
	[91.10.9.215])
	by mx.google.com with ESMTPS id d10sm6981854wiy.3.2012.06.02.05.11.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jun 2012 05:11:50 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Jun 2012 14:15:49 +0200
Message-Id: <1338639361-23775-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
References: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 03/15] xfce4-wavelan-plugin: initial add 0.5.10
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
X-List-Received-Date: Sat, 02 Jun 2012 12:22:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../wavelan/xfce4-wavelan-plugin_0.5.10.bb         |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.10.bb

diff --git a/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.10.bb b/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.10.bb
new file mode 100644
index 0000000..95acd62
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.10.bb
@@ -0,0 +1,9 @@
+DESCRIPTION = "Panel plugin displaying stats from a wireless lan interface"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-wavelan-plugin"
+LICENSE = "BenediktMeurer FlorianRivoal"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e1e5872df9c5cf1a23f16493d9104920"
+
+inherit xfce-panel-plugin
+
+SRC_URI[md5sum] = "a4cd20ef471123936e762a139f1025e1"
+SRC_URI[sha256sum] = "c5b2535b9c90d3fbf6a5f94d096fbc9cb5ce85e2c5d67df933f6fe74ae6f761d"
-- 
1.7.4.4



