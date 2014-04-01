Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id C31A66F8A0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 15:21:59 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id l18so7477796wgh.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 08:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=ZdCkMGNh2E0SKY4Pjm2h0Of52A/b5dt2Xxc2jRxFa2I=;
	b=ytUwPHm0D4QDiVcRoHV2h68wMdKBplvd9jaygNe96j2KPiJtTEqT/BxFS+xlT8wpeT
	dGJNcRJLNQG0N/66lYvUpcehCbYYtjwzXIgcf7js7QSMvBbNg8Kk3lRJqtZ+88Yj1N0y
	8ada7C7tZYi2CDgxvMYUEfPI45DlAI5qIR8JwqtrCaEVDTPZ0pUYfXmkkYTkcUe4QTKC
	60sIlPMGnzhG3NwzINcI/9iLLpviRsIq1xNlS1twBvGrJRHhK7TXIF61/IgM63Oha1vf
	sT9SZXp+/gwUfWOmJ50pvNIcegPY4QlgKR59RuA7Tq7pduZ0A1xccbqhTaFlDBCO5XuP
	YKdw==
X-Received: by 10.194.48.80 with SMTP id j16mr21689057wjn.44.1396365719828;
	Tue, 01 Apr 2014 08:21:59 -0700 (PDT)
Received: from localhost.localdomain (ip-176-198-252-199.unitymediagroup.de.
	[176.198.252.199])
	by mx.google.com with ESMTPSA id 48sm41246865eee.2.2014.04.01.08.21.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 08:21:58 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 17:21:38 +0200
Message-Id: <1396365706-14220-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1396365706-14220-1-git-send-email-schnitzeltony@googlemail.com>
References: <1396365706-14220-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce/meta-gnome 02/10] xarchiver: fix configue
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
X-List-Received-Date: Tue, 01 Apr 2014 15:22:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* use xfce-git to fix aclocal-copy error
* add intltool-native in DEPENDS to fix
  | configure.in:57: error: possibly undefined macro: AC_PROG_INTLTOOL

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
index ba538e6..9e4b696 100644
--- a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
+++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
@@ -5,24 +5,20 @@ SECTION = "x11"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "gtk+ glib-2.0 xfce4-dev-tools-native"
+DEPENDS = "gtk+ glib-2.0 xfce4-dev-tools-native intltool-native"
 
 SRC_URI = "git://gitorious.org/xfce/xarchiver.git;branch=master"
 SRCREV = "e80e90528c9aab2fe36d9078b945b44c05cc20d3"
 PV = "0.5.3"
 S = "${WORKDIR}/git"
 
-inherit gettext pkgconfig autotools gtk-icon-cache
+inherit xfce-git gettext pkgconfig autotools gtk-icon-cache
 
 # install tap files for thunar-archive-plugin in ${libdir}/thunar-archive-plugin
 EXTRA_OECONF += "--libexecdir=${libdir}"
 
 EXTRA_OECONF += "--enable-maintainer-mode"
 
-do_configure_prepend() {
-       NOCONFIGURE=yes ./autogen.sh
-}
-
 FILES_${PN} += "${libdir}/thunar-archive-plugin"
 
 RRECOMMENDS_${PN} = "lzop zip tar bzip2 unzip xz"
-- 
1.8.3.1


