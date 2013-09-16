Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0B7906C872
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 09:04:37 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id l10so1872842eei.35
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 02:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=US8xpiVFOuwovBG6grME0VaqhyU/T+s9H6PTOgqScbY=;
	b=wUZPYykw7b6ruh+nEpyoRUqsHovyYf7yxnJUAWMpVZQJjbPZWeZv0l9aIo+yzjF5iW
	9H7zML4pnzqs2QmelHj7LKAncQSiSTpxWGsMfYs/tspAoT2dix88f6MvCE7Pi2YEgt/5
	J21sdzdz5RZ/mSSuJ3EP2bfIkwgStDmul4iACQpSNGd3cFs5prwokscOIBm9azlPFPRc
	NVbo462KtG3kRYON7JdRyFQG8CzSkvG6w4sTtNWJrjQGU4ImTt33O/iJ0GirY3R1H2md
	zF5qsV47R6aTyuNDt1qHU0RiYw15dy88D6JRGVhluQiyzv79Wy5Ubtzeyzr+HSDUv8Z1
	N3qQ==
X-Received: by 10.14.218.197 with SMTP id k45mr42009782eep.32.1379322279607;
	Mon, 16 Sep 2013 02:04:39 -0700 (PDT)
Received: from localhost.localdomain (ip-178-200-247-59.unitymediagroup.de.
	[178.200.247.59])
	by mx.google.com with ESMTPSA id f49sm40119433eec.7.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 16 Sep 2013 02:04:39 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2013 11:04:16 +0200
Message-Id: <1379322259-3831-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1379322259-3831-1-git-send-email-schnitzeltony@googlemail.com>
References: <1379322259-3831-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 6/9] xfwm4: move to git repo
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
X-List-Received-Date: Mon, 16 Sep 2013 09:04:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

follow libxfce4ui API change [1]

[1] http://git.xfce.org/xfce/xfwm4/commit/settings-dialogs/xfwm4-settings.c?id=21ebbe4722b01763822157f9242fc865a9687c68

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xfwm4/{xfwm4_4.10.1.bb => xfwm4_git.bb}        |   17 ++++++++++++++---
 1 files changed, 14 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.10.1.bb => xfwm4_git.bb} (70%)

diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.10.1.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb
similarity index 70%
rename from meta-xfce/recipes-xfce/xfwm4/xfwm4_4.10.1.bb
rename to meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb
index 86ac20e..b72d44f 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.10.1.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb
@@ -6,9 +6,20 @@ DEPENDS = "virtual/libx11 libxpm gtk+ libxfce4util libxfce4ui xfconf libwnck dbu
 
 inherit xfce update-alternatives
 
-SRC_URI[md5sum] = "10de50c79ed944cbb9c87741062c2a76"
-SRC_URI[sha256sum] = "380c44fba6eb779e34be0fe94f3726cfa131803014d6073c45aec8a1257fa740"
-SRC_URI += "file://0001-don-t-block-display-events-when-time-is-set-backward.patch"
+SRC_URI = " \
+    git://git.xfce.org/xfce/xfwm4;protocol=git \
+    file://0001-don-t-block-display-events-when-time-is-set-backward.patch \
+"
+
+SRCREV = "bce3062d0879ab8504c446f99ad57c9fd76c5097"
+S = "${WORKDIR}/git"
+PV = "4.10.1+git${SRCPV}"
+
+EXTRA_OECONF += "--enable-maintainer-mode"
+
+do_configure_prepend() {
+       NOCONFIGURE=yes ./autogen.sh
+}
 
 python populate_packages_prepend () {
     themedir = d.expand('${datadir}/themes')
-- 
1.7.6.5


