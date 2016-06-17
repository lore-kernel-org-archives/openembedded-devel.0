Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id B4710766A3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2016 19:40:14 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id l81so13304866qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2016 12:40:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=a083KW+zyvPV962brBdrSyTUtF7icS6yWPl7kgKog9Y=;
	b=YjHIjem+aA3uy+NUP7fK6jadrXVW1oRsRdSXIFxH4BvJpCjizphIHeXxFMua0l2KUT
	pOM1HPl780L4N/2/FSqZP+xIc4nSr1DuCQqdcYqZW4udXf7RFf6OpBwhdfibbHCV15b/
	6FQGq2kr6rUiFRwFi1RI/21BoJm9+kpEIBcp3jF4imcRTEphKLpjprrG72dlaIgaGOK+
	rDwDybzUDzLf95a23SMTMiQUsfEKbaTVC7eBV/MT8cOxdggKHJHZP6PuLkhcH2Cg2Na+
	ZX3TpYXG/n3JKFSUYzC7HxJxNfF0x9rfAau8S6u0t2sATSLdKOtWkgwwFztN/PFrajRV
	lVMw==
X-Gm-Message-State: ALyK8tJPQwuw/nYwdINGhZgiG5SDX/xlg9l8VoFFPxRn4XDD4iBD3Puq1nnFqBbD5JV6XQ==
X-Received: by 10.200.57.116 with SMTP id t49mr4643610qtb.58.1466192415479;
	Fri, 17 Jun 2016 12:40:15 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	h60sm11614824qtd.28.2016.06.17.12.40.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Jun 2016 12:40:15 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jun 2016 15:40:09 -0400
Message-Id: <1466192409-3297-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1466192409-3297-1-git-send-email-derek@asterius.io>
References: <1466192409-3297-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH 2/2] Remove blacklisted recipes due to poppler build failures
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jun 2016 19:40:15 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-efl/recipes-efl/efl/epdf_svn.bb                 | 2 --
 meta-gnome/recipes-gnome/evince/evince_3.18.2.bb     | 2 --
 meta-gnome/recipes-support/tracker/tracker_0.14.2.bb | 2 --
 meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb         | 2 --
 meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb     | 2 --
 5 files changed, 10 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/epdf_svn.bb b/meta-efl/recipes-efl/efl/epdf_svn.bb
index a4c7d49..e32a5fd 100644
--- a/meta-efl/recipes-efl/efl/epdf_svn.bb
+++ b/meta-efl/recipes-efl/efl/epdf_svn.bb
@@ -25,5 +25,3 @@ EXTRA_OECONF = "\
 
 # Some upgrade path tweaking, as in evas
 AUTO_LIBNAME_PKGS = ""
-
-PNBLACKLIST[epdf] ?= "Depends on broken poppler"
diff --git a/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb b/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb
index 4fa11a5..fe63093 100644
--- a/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb
@@ -46,5 +46,3 @@ FILES_${PN}-staticdev += "${libdir}/nautilus/extensions-2.0/*.a \
                           ${libdir}/evince/*/backends/*.a"
 FILES_${PN}-nautilus-extension = "${libdir}/nautilus/*/*so"
 FILES_${PN}-browser-plugin = "${libdir}/mozilla/*/*so"
-
-PNBLACKLIST[evince] ?= "Depends on broken poppler"
diff --git a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
index 7e6c400..ff53669 100644
--- a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
+++ b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
@@ -83,5 +83,3 @@ FILES_${PN}-nautilus-extension += "${libdir}/nautilus/extensions-2.0/*.so"
 
 SRC_URI[md5sum] = "f3a871beeebf86fd752863ebd22af9ac"
 SRC_URI[sha256sum] = "9b59330aa2e9e09feee587ded895e9247f71fc25f46b023d616d9969314bc7f1"
-
-PNBLACKLIST[tracker] ?= "Depends on broken poppler"
diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb b/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb
index 3c134bb..29ed4d9 100644
--- a/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb
+++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb
@@ -30,5 +30,3 @@ CFLAGS += "-fPIC"
 
 FILES_${PN}-dbg += "${libdir}/gimp/2.0/*/.debug"
 FILES_${PN}  += "${datadir}/appdata"
-
-PNBLACKLIST[gimp] ?= "Depends on broken poppler"
diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
index 5a0fc6d..66385a4 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
@@ -27,5 +27,3 @@ FILES_${PN}-dbg += "${libdir}/tumbler-1/.debug \
                     ${libdir}/tumbler-1/plugins/.debug \
                     ${libdir}/tumbler-1/plugins/cache/.debug \
 "
-
-PNBLACKLIST[tumbler] ?= "Depends on broken poppler"
-- 
1.9.1


