Received: from mail-ea0-f180.google.com ([209.85.215.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U2ADI-00043S-Bf
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2013 01:47:13 +0100
Received: by mail-ea0-f180.google.com with SMTP id c1so2543071eaa.39
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Feb 2013 16:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=ALyyZrbQbxVU2dKq33yxzPh+FloTGY3Rb6zXC4foXD4=;
	b=a6xmjVv7s7epJSVj7iw75K10Pxz4kD+9WQb8Dnw/0Qu71XjKT+y8L3B7GAd7S58U+A
	mn9xXn1zo2nKzb73i+3f0N95dtHCDOmU5JAlxrVt5jNJOA1TEvGl8R2niUEAYsbSZO0Z
	1Gua5b8+v9gkyJinLCT6gK5EQJwY1JmMDQALxp6+a8ErcWSgz+2FelzMmBnT5m+GTJqY
	IueL4OO1nYCs7/mmBvgN3QxiXiyOAZcj57J9kPJjzjW6YNS4WeolwZD4Gb/0tUWBbvsp
	Tvs+TP/TpkTvBGyjqx/W9HTGdghgcRUL/tmF7cJ7lKI/W0Pj25XuPyJ3JWVIne31lG+c
	MJSg==
X-Received: by 10.14.213.131 with SMTP id a3mr32186368eep.24.1359937885175;
	Sun, 03 Feb 2013 16:31:25 -0800 (PST)
Received: from localhost.localdomain (p5B0A0847.dip.t-dialin.net. [91.10.8.71])
	by mx.google.com with ESMTPS id j46sm21263378eeo.3.2013.02.03.16.31.23
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 03 Feb 2013 16:31:24 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2013 01:31:09 +0100
Message-Id: <1359937872-26028-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1359937872-26028-1-git-send-email-schnitzeltony@googlemail.com>
References: <1359937872-26028-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 1/4] xfce4-mount-plugin: initial add 0.6.4
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
X-List-Received-Date: Mon, 04 Feb 2013 00:47:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../mount/xfce4-mount-plugin_0.6.4.bb              |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_0.6.4.bb

diff --git a/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_0.6.4.bb b/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_0.6.4.bb
new file mode 100644
index 0000000..b0e02c9
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_0.6.4.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = "Mount/umount utility for the xfce panel"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-mount-plugin"
+SECTION = "x11/application"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+inherit xfce-panel-plugin
+
+SRC_URI[md5sum] = "f5917e9aa2a06bc6a872cc10d2ee4f6f"
+SRC_URI[sha256sum] = "541d7af84d7d0b00ae547aa1f438e2fac51ee4195c4d0a17173c4f72accb227d"
-- 
1.7.4.4



