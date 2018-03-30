Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id CB6A87475B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:41 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id l49so8081098wrl.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=0e2WR57AUfHxv1R0K6eB7vRG+eD0WLA+zz5kVrH5zf8=;
	b=HxQDWOx5bImZp6pRbcj/1juy4dixf8Zt9iwxN3o32bqpbXOc4xCZZO3YsNk+h3VXNv
	nkRpZv1YREpSGVeRrroj3hZJjNk7Ly6LdIPD6Ew5UCufpZEpEFTcC2UVDULEqbLzuLj+
	R5f8pEUSqgjRDoZvxPmPKqKHSYiWcBYPmKNYAFy3akJt2YHfZANqElBRx0hZ0HGTe1rQ
	D7zts4+bH1oAn3Ft51gZqH8mVn8ES520XpZ4KPR8ZmXuNigWXwm/VEdvenKLvQuty4a4
	DdcokFIDOyIM5JkouY9pJ6RmrHgmNTucLCcPu+e2FbP0OM+gAFqQ3M+obzqHAx/nrdYV
	WTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0e2WR57AUfHxv1R0K6eB7vRG+eD0WLA+zz5kVrH5zf8=;
	b=IUX7AqcgDGS4ZZTL5jqNHPHmG9wwyHjEeuKf8Fxk7RPJ/YWZHKzSRrcDtAMCvYnpOW
	p0OIEVm2pDWIklEtI8rxNl0nb5iYSWxnK8dEH+ZuKPweTNne264L5raQ5EFxBPtyWZ2u
	DtuRZy7ikXoKNnT6G1vnKXbMcJLhNjxgUjz1NqKHhQFwCufciiV0b+RPFaS4Il2Zl2mV
	d7ALw9Z9vp2vHRFlQFAgMyQifb5jyDUj77I1l/sxkMNJbAa0waUKKMpDG5DQIKBBGQ45
	Yu03hmEFTZOMu/hCQ4TGMDO+pLfUVcIpK/VJ90nE6BAXiJOeNSAOM3H3zEaxuAVTkzZ6
	n8OA==
X-Gm-Message-State: AElRT7H5CQ/gnqVzxdj6VAqc6VzVZzlsRyDwVW3cJKK8sXq6WG1sW+XI
	XMXwDRRV/F2lmhHvg9u1iC/miw==
X-Google-Smtp-Source: AIpwx49Rhjapd2RaQA/506ttnwFwORfgmnRmMgOAn65wqpJO41d47vPFWe0iqEhim3ePsFrBJz+6Jg==
X-Received: by 10.223.136.146 with SMTP id f18mr9928469wrf.57.1522416761770;
	Fri, 30 Mar 2018 06:32:41 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:41 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:50 +0200
Message-Id: <20180330133151.25882-39-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 38/39] remove slim leftovers
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
X-List-Received-Date: Fri, 30 Mar 2018 13:32:42 -0000
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


