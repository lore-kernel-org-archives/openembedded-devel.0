Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 31D0F78591
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2018 15:14:01 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id 80so2612006wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2018 08:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=0e2WR57AUfHxv1R0K6eB7vRG+eD0WLA+zz5kVrH5zf8=;
	b=n6lBcfBWDbFiGAsNzB9d/a+ashSoCSVXGO9dIQxBoIO0LsRTPYufOe9NPcRRQXcz+o
	T2yRtNbWHWT2aA8jXdWBVbbDR8ZXt4wC6DJnJx1KfEOwU3OzzPuVZd/V/+X4+bBb1k1e
	gSX30aud16M0lZQXIs42/Wuz0G7sdElc1Wi56S/9OL9VzV9cp5v7nrTf8Mzptx10QEpw
	cGRwt4BxKiBi0d5zElAgnNhiI4Q2h2SvFHegiO6XsWNwlL1/YRqgdRvWEX0mv/kHHWm9
	jCA3iBqD0hhxDgX1phoW4f8+lRPRuD54BWuLRxiRZAD1ILXBj6LqP3ebSG3ykX/wNVKb
	/rcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0e2WR57AUfHxv1R0K6eB7vRG+eD0WLA+zz5kVrH5zf8=;
	b=fRPbZhPBKxaeEgtswfDXSzphC72FfZa9LrHqGikjQJ1udLV2MzE+tGv75m8ffwOGQs
	VjJUligUztn1iz31PJSpkC7v5k3TW8fGHDxN+hnEcRKzijehySFQU+ps8cRxCy48uAJg
	M/PupnEuzn5lI7gP00pNsAScnyi8vE6fMm6OJg2VluO+q5ygjki7ywOM48OivtoG7l1m
	+dq9W8SFqyNQOFPZaeFzlAKhR3DvxBlURSPhIldsiWFezaB2/oEvEvaxlJcx41/uY6wb
	3xKbbPz0QbPqfR4RQS/BuxA9a13XwNmkm8yQXDNhpypTNKIrCphU/dUh2Ck4ObwLXEGL
	MYkA==
X-Gm-Message-State: AElRT7GKth8iqZX3pwUxEdC9ZhuN19Azs0gqzm1cdBoiRpqqxhDarkB0
	n/v1H09OMwEpl/OXM+Isw54dGA==
X-Google-Smtp-Source: AIpwx49+FtZH4mkjy7WYZVtWwgU8QXJzy7RekMHs/3jrr3WqLXtw+6AV8jY1gNpRAQtxNigikg4ZeA==
X-Received: by 10.223.163.195 with SMTP id m3mr3415655wrb.91.1522250041848;
	Wed, 28 Mar 2018 08:14:01 -0700 (PDT)
Received: from localhost.localdomain (p50971113.dip0.t-ipconnect.de.
	[80.151.17.19]) by smtp.gmail.com with ESMTPSA id
	n49sm5986665wrn.90.2018.03.28.08.14.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Mar 2018 08:14:01 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Mar 2018 17:13:30 +0200
Message-Id: <20180328151331.20660-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180328151331.20660-1-schnitzeltony@gmail.com>
References: <20180328151331.20660-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] remove slim leftovers
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
X-List-Received-Date: Wed, 28 Mar 2018 15:14:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas MÃ¼ller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-graphics/slim/slim/Makefile.oe     | 64 ------------------
 meta-oe/recipes-graphics/slim/slim/slim-dynwm      |  8 ---
 meta-oe/recipes-graphics/slim/slim/slim.pamd       | 19 ------
 meta-oe/recipes-graphics/slim/slim/slim.service    | 11 ----
 .../recipes-graphics/slim/slim/update_slim_wmlist  | 76 ----------------------
 5 files changed, 178 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/slim/slim/Makefile.oe
 delete mode 100644 meta-oe/recipes-graphics/slim/slim/slim-dynwm
 delete mode 100644 meta-oe/recipes-graphics/slim/slim/slim.pamd
 delete mode 100644 meta-oe/recipes-graphics/slim/slim/slim.service
 delete mode 100644 meta-oe/recipes-graphics/slim/slim/update_slim_wmlist

diff --git a/meta-oe/recipes-graphics/slim/slim/Makefile.oe b/meta-oe/recipes-graphics/slim/slim/Makefile.oe
deleted file mode 100644
index 2ee69346a..000000000
--- a/meta-oe/recipes-graphics/slim/slim/Makefile.oe
+++ /dev/null
@@ -1,64 +0,0 @@
-# Makefile for slim - OpenEmbedded
-#######################################################
-
-
-SLIMLDFLAGS=-lXft -lX11 -lfreetype -lXrender -lfontconfig -lpng12 -lz -lm -lcrypt -lXmu -lpng -ljpeg -lrt -lpthread
-CUSTOM=-DHAVE_SHADOW
-
-USE_PAM=1
-ifdef USE_PAM
-SLIMLDFLAGS+= -lpam
-CUSTOM+= -DUSE_PAM
-endif
-
-#######################################################
-
-NAME=slim
-VERSION=1.3.2
-
-DEFINES=-DPACKAGE=\"$(NAME)\" -DVERSION=\"$(VERSION)\" \
-		-DPKGDATADIR=\"$(PREFIX)/share/slim\" -DSYSCONFDIR=\"$(CFGDIR)\"
-
-OBJECTS=jpeg.o png.o main.o image.o numlock.o cfg.o switchuser.o app.o \
-	panel.o util.o
-ifdef USE_PAM
-OBJECTS+=PAM.o
-endif
-
-all: slim
-
-slim: $(OBJECTS)
-	$(CXX) $(OBJECTS) $(LDFLAGS) $(SLIMLDFLAGS) -o $(NAME)
-
-.cpp.o:
-	$(CXX) $(CXXFLAGS) $(DEFINES) $(CUSTOM) -c $< -o $@
-
-.c.o:
-	$(CC) $(CFLAGS) $(DEFINES) $(CUSTOM) -c $< -o $@
-
-install: slim install-theme
-	install -D -m 755 slim $(DESTDIR)$(PREFIX)/bin/slim
-	install -D -m 644 slim.1 $(DESTDIR)$(MANDIR)/man1/slim.1
-	test -e $(DESTDIR)$(CFGDIR)/slim.conf || \
-		install -D -m 644 slim.conf $(DESTDIR)$(CFGDIR)/slim.conf
-
-clean:
-	@rm -f slim *.o
-
-dist:
-	@rm -rf $(NAME)-$(VERSION)
-	@mkdir $(NAME)-$(VERSION)
-	@cp -r *.cpp *.h *.c Makefile Makefile.* COPYING ChangeLog INSTALL README TODO \
-		xinitrc.sample slim.1 THEMES themes slim.conf $(NAME)-$(VERSION)
-	@rm -rf $(NAME)-$(VERSION)/themes/.svn	$(NAME)-$(VERSION)/themes/default/.svn
-	@tar cvzf $(NAME)-$(VERSION).tar.gz $(NAME)-$(VERSION)
-	@rm -rf $(NAME)-$(VERSION)
-
-
-install-theme:
-	install -D -m 644 themes/default/slim.theme \
-		 $(DESTDIR)$(PREFIX)/share/slim/themes/default/slim.theme
-	install -D -m 644 themes/default/panel.png \
-		 $(DESTDIR)$(PREFIX)/share/slim/themes/default/panel.png
-	install -D -m 644 themes/default/background.jpg \
-		 $(DESTDIR)$(PREFIX)/share/slim/themes/default/background.jpg
diff --git a/meta-oe/recipes-graphics/slim/slim/slim-dynwm b/meta-oe/recipes-graphics/slim/slim/slim-dynwm
deleted file mode 100644
index 49c9d47ec..000000000
--- a/meta-oe/recipes-graphics/slim/slim/slim-dynwm
+++ /dev/null
@@ -1,8 +0,0 @@
-#!/bin/sh
-update_slim_wmlist
-if [ "x$1" = "x-nodaemon" ]; then
-  shift
-  exec slim "$@"
-else
-  slim -d "$@"
-fi
diff --git a/meta-oe/recipes-graphics/slim/slim/slim.pamd b/meta-oe/recipes-graphics/slim/slim/slim.pamd
deleted file mode 100644
index 80c34b1db..000000000
--- a/meta-oe/recipes-graphics/slim/slim/slim.pamd
+++ /dev/null
@@ -1,19 +0,0 @@
-# Begin /etc/pam.d/slim
-
-auth       required     pam_shells.so
-auth       include      common-auth
-auth       optional     pam_securetty.so
-auth       optional     pam_gnome_keyring.so
-
-account    required     pam_nologin.so
-account    include      common-account
-
-password   include      common-password
-
-session    include      common-session
-session    required     pam_mkhomedir.so skel=/etc/skel/ umask=0022
-session    optional     pam_lastlog.so nowtmp
-session    optional     pam_mail.so dir=/var/mail standard
-session    optional     pam_gnome_keyring.so  auto_start
-
-# End /etc/pam.d/slim
diff --git a/meta-oe/recipes-graphics/slim/slim/slim.service b/meta-oe/recipes-graphics/slim/slim/slim.service
deleted file mode 100644
index 341351aad..000000000
--- a/meta-oe/recipes-graphics/slim/slim/slim.service
+++ /dev/null
@@ -1,11 +0,0 @@
-[Unit]
-Description=SLiM Simple Login Manager
-Requires=dev-tty7.device
-After=dev-tty7.device systemd-user-sessions.service
-
-[Service]
-ExecStart=/usr/bin/slim -nodaemon
-StandardOutput=syslog
-
-[Install]
-WantedBy=graphical.target
diff --git a/meta-oe/recipes-graphics/slim/slim/update_slim_wmlist b/meta-oe/recipes-graphics/slim/slim/update_slim_wmlist
deleted file mode 100644
index 0f116537f..000000000
--- a/meta-oe/recipes-graphics/slim/slim/update_slim_wmlist
+++ /dev/null
@@ -1,76 +0,0 @@
-#!/usr/bin/perl -w
-#
-# update_slim_wmlist, based on:
-# update_wdm_wmlist, (c) 1998 Marcelo Magallón <mmagallo@debian.org>
-# rewriten to use the x-window-manager alternative
-# modified to also use the x-session-manager alternative by Arthur Korn
-# Copyright 2000 Wichert Akkerman <wakkerma@debian.org>
-# Modified to use the freedesktop.org .desktop like kdm and gdm
-#
-# This script will read the list of installed window managers from
-# the freedesktop .desktop files in <etc>/X11/sessions/:<etc>/dm/Sessions/:
-# <share>/xsessions/
-# and update the sessions line in /etc/slim.conf.
-# BEWARE: It doesn't ask any questions about this. It just does it. It
-# takes an optional list of window managers.
-
-use strict;
-use File::DesktopEntry;
-
-my $wm_list='';
-my %desktop_files;
-
-unless (@ARGV) {
-    #my @wm_list = ('default');
-    my @wm_list;
-    foreach my $dir ('/etc/X11/sessions/','/etc/dm/Sessions/','/usr/share/xsessions/') {
-	    next unless (opendir DIR, $dir);
-	    my @files;
-	    @files = grep { /\.desktop$/ && -r "$dir/$_" } readdir(DIR);
-	    foreach my $file (@files) {
-		   push @{$desktop_files{$file}}, "$dir/$file";
-	    }
-    }
-    DESKTOP: foreach my $desktop_file (keys(%desktop_files)) {
-	    foreach my $file (@{$desktop_files{$desktop_file}}) {
-		    my $entry = File::DesktopEntry->new_from_file($file);
-		    next DESKTOP if (defined($entry->get_value('Hidden'))
-			and $entry->get_value('Hidden') eq 'true');
-		    if ($entry->get_value('Name') =~ /^gnome$/i) {
-			    push (@wm_list, 'gnome');
-		    }
-		    elsif ($entry->get_value('Name') =~ /^kde$/i) {
-			    push (@wm_list, 'kde');
-		    }
-		    elsif (defined($entry->get_value('Exec'))) {
-			    push (@wm_list, $entry->get_value('Exec'));
-		    }
-		    else { # not found, go to next file
-			    next;
-		    }
-		    # found, proceed to next destop file
-		    next DESKTOP;
-	    }
-    }
-   $wm_list = join (',', sort @wm_list) . ',custom';
-} else {
-    $wm_list = join (',', sort @ARGV);
-}
-
-open (SLIM_CONFIG_FILE, '</etc/slim.conf')
-    or die "Can't open /etc/slim.conf for reading: $!";
-open (NEW_SLIM_CONFIG_FILE, '>/etc/slim.conf.new')
-    or die "Can't open /etc/slim.conf.new for writing: $!";
-
-while (<SLIM_CONFIG_FILE>) {
-    s|^(sessions\s*).*|$1$wm_list|;
-    print NEW_SLIM_CONFIG_FILE;
-}
-
-close(SLIM_CONFIG_FILE);
-close(NEW_SLIM_CONFIG_FILE);
-
-rename '/etc/slim.conf.new', '/etc/slim.conf'
-    or die "Can't rename /etc/slim.conf.new: $!";
-
-exit 0;
-- 
2.14.3


