Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 083C06F933
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 15:22:00 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id t60so6382823wes.19
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 08:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=jlnXLs+6qXZ89ahTf6xTohr6rTpu00Jmuxh3OMcaqPg=;
	b=LQ0PASm4l4aTvExw7MJm9jPjChAWcXAw4s4mXjj2nzlqw0oarudKtC5kKB7bkN+mnG
	vSLTqiAyHJB/bJQsEoowVbRhzH7WKJi7o24D0BCMO1eTQCpF6yRW4UCdFnyz1k/UfMzE
	xH1S2De9gd4q14D9/VOoeCCpZscy40jFSlgHv9OkHWtbo3lGDU23S0HlORWUNHYJsnpy
	RiiFnEfnekRuo6/5yHwLg+IbK/k6FjuY156p7ZhgqpF5aPdQyiGFIj866v5uYHsYySAU
	eTyIUUlaIwyZ4FBUFFLS5R6hZb+bcsnt7hU/dmSuKbDHsFptlI28JpURjmCXiiDrt62L
	jR4A==
X-Received: by 10.194.90.39 with SMTP id bt7mr3913559wjb.93.1396365721020;
	Tue, 01 Apr 2014 08:22:01 -0700 (PDT)
Received: from localhost.localdomain (ip-176-198-252-199.unitymediagroup.de.
	[176.198.252.199])
	by mx.google.com with ESMTPSA id 48sm41246865eee.2.2014.04.01.08.21.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 08:22:00 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 17:21:39 +0200
Message-Id: <1396365706-14220-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1396365706-14220-1-git-send-email-schnitzeltony@googlemail.com>
References: <1396365706-14220-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce/meta-gnome 03/10] xfwm4: fix configue by inheriting xfce-git.bbclass
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
X-List-Received-Date: Tue, 01 Apr 2014 15:22:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb
index 4799460..f8cd4b2 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d791728a073bc009b4ffaf00b7599855"
 DEPENDS = "virtual/libx11 libxpm gtk+ libxfce4util libxfce4ui xfconf libwnck dbus-glib startup-notification exo-native"
 
-inherit xfce update-alternatives
+inherit xfce xfce-git update-alternatives
 
 SRC_URI = " \
     git://git.xfce.org/xfce/xfwm4;protocol=git \
@@ -17,10 +17,6 @@ PV = "4.10.1+git${SRCPV}"
 
 EXTRA_OECONF += "--enable-maintainer-mode"
 
-do_configure_prepend() {
-       NOCONFIGURE=yes ./autogen.sh
-}
-
 python populate_packages_prepend () {
     themedir = d.expand('${datadir}/themes')
     do_split_packages(d, themedir, '^(.*)', 'xfwm4-theme-%s', 'XFWM4 theme %s', allow_dirs=True)
-- 
1.8.3.1


