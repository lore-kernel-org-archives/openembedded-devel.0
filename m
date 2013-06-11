Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id EA1E76A9CE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 05:37:25 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id h15so6027039eak.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2013 22:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=qBnenxYVp0gya8sBmwTCA3IeFdmnVMt7mnNj+D7Bt+E=;
	b=ecvkqvXvEGUzPMEsLat26VHsF/nW7pqKLU2x60T7lbcipqujJ3KCmlFn7+DNZ/hgdd
	WtbhdPYYbfoIKhPJvtSz1IIOXU2mgEUcbyKrxxEdLRF0jDkywerSY1r1v/MMVnMCO96H
	wL+Ri6sjgBIbINqrvfQ5HJgtU7lqRK8KyiV1ilMRACOahf2GDS4Q8LMhs++6Cv9TjcGt
	PhsRJKXJBTPOsAMwQigcgRZI9jU6O+/WAE1BhHOXrroTlw+VgjPYJlqYpkwN+qcYOUm/
	zQiJZhHJz+c7nIjLfV3aBCnys58RQgP33usY8iLwPQDTteenZjN5yonAQ9z2jbtC5tTw
	93yw==
X-Received: by 10.14.5.5 with SMTP id 5mr14740826eek.21.1370929046621;
	Mon, 10 Jun 2013 22:37:26 -0700 (PDT)
Received: from localhost.localdomain (ip-178-202-232-2.unitymediagroup.de.
	[178.202.232.2])
	by mx.google.com with ESMTPSA id y10sm28009517eev.3.2013.06.10.22.37.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 22:37:25 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2013 07:34:29 +0200
Message-Id: <1370928876-14423-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
References: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce 08/15] gcr: initial add 3.8.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Jun 2013 05:37:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb

diff --git a/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb b/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb
new file mode 100644
index 0000000..65309da
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "A library for bits of crypto UI and parsing etc"
+HOMEPAGE = "http://www.gnome.org/"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
+
+DEPENDS = "gtk+3 p11-kit"
+
+inherit autotools gnome gtk-doc
+
+GNOME_COMPRESS_TYPE="xz"
+
+SRC_URI[archive.md5sum] = "f5e66afcab19897a0de0590735329fb1"
+SRC_URI[archive.sha256sum] = "a1e615ce2cfd375f383bbdd289935a8e3e16901c3c6f032780847055e8bec2c1"
+
+FILES_${PN} += " \
+    ${datadir}/dbus-1 \
+    ${datadir}/gcr-3 \
+"
-- 
1.7.6.5


