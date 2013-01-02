Received: from mail-ea0-f176.google.com ([209.85.215.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TqQI4-0000Yv-Oc
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jan 2013 16:31:37 +0100
Received: by mail-ea0-f176.google.com with SMTP id d13so5961057eaa.35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jan 2013 07:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=gZjNi+JgJlEQTrM6WGE8UlsH1mJE5tnLw1gerg/tE9g=;
	b=tsB6QfRx6fOAAbWU+IbyeA/FU7oMl8N3zx18TDXPxCRSOkWSf9EOBtQnnNE4YGNucs
	NKlO1BOXe+M56UUX+ZTvXIzpZs+93luS1mwM/Q28eKCjhpJUtbsQyqaTxq/KSMCp3tFS
	83ibEci8MG9gAXXRxQY5e3tzTzRJWy9QxhHk9iHt46cY/1GSugEWgEMwIAfQaLPNpQ8Y
	b82bUh57DUfsVc1oI1E+u+JVhs/SO5UjxPFSWrev6q5Dc70QgxtDG5Dr85asq7eUZD/K
	/qqKW00jzJPpJJcDD8jnCkmt+y165ro8DlHFbLSE1tvQ1zyMt+0f1xx1J02psTc6hJqy
	thyw==
X-Received: by 10.14.204.198 with SMTP id h46mr126682209eeo.1.1357139794552;
	Wed, 02 Jan 2013 07:16:34 -0800 (PST)
Received: from localhost.localdomain (p4FDF1C58.dip.t-dialin.net.
	[79.223.28.88])
	by mx.google.com with ESMTPS id b2sm98071345eep.9.2013.01.02.07.16.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Jan 2013 07:16:33 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jan 2013 16:16:10 +0100
Message-Id: <1357139774-4364-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1357139774-4364-1-git-send-email-schnitzeltony@googlemail.com>
References: <1357139774-4364-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/meta-gnome/V2 06/10] mousepad: initial add 0.3.0
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
X-List-Received-Date: Wed, 02 Jan 2013 15:31:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb

diff --git a/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb b/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb
new file mode 100644
index 0000000..859c90e
--- /dev/null
+++ b/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = "A simple text editor for Xfce"
+SECTION = "x11/application"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+DEPENDS = "gtk+ dbus-glib gtksourceview2"
+
+inherit xfce-app
+
+SRC_URI[md5sum] = "dcfcdfaa8a19c89f35d5f6f64753e6e1"
+SRC_URI[sha256sum] = "10f27506994d0d0b8f9e02555404a144babedab97517abe3b6be8b2d21ff046d"
-- 
1.7.4.4



