Received: from mail-pb0-f49.google.com ([209.85.160.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TrmX7-000361-Jt
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 10:28:48 +0100
Received: by mail-pb0-f49.google.com with SMTP id un15so9958382pbc.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 01:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=81Z/5sJgFfWLAj2KI7s0od+E6lPy425xM3lR/55+N+A=;
	b=XSZXQdN4wNrYKAiRil1nhPAUyY6WG7RSHbC6HmFlM9aBlDU9R5w3Z2tcehwho42X8z
	DcEP8opUXU1xOhHiM8zKdhlye8rb0rA/YHxXx5odZ627CC6tYGK35CbQumN6BfMrw7oX
	c6aVg5ZtfoYZFxA3CKwpa3vF0dERA+NgN6hYHkMLM6QBURPgO8LV/SFBbjr5hf0RpFND
	wsc2YHm5qBSplZZ5UAaMzJL6PaS/9pZm+u3H7wT4I0rbjDU0+5UO+IFaZUSQKCWRuv96
	AeHImGnnk2EkiUQk1ldahl/4vqkC3XJcrP3sGHJp0LLg9332TMgM+Rxqazt9/9O5hLfr
	b84A==
X-Received: by 10.66.79.134 with SMTP id j6mr146517993pax.11.1357463617264;
	Sun, 06 Jan 2013 01:13:37 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qw8sm5137145pbc.39.2013.01.06.01.13.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 01:13:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Jan 2013 01:12:26 -0800
Message-Id: <1357463568-26241-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-networking][PATCH V2 03/25] autofs: Add recipes for 5.0.7
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
X-List-Received-Date: Sun, 06 Jan 2013 09:28:49 -0000

Forward port from OE classic

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../autofs/autofs-5.0.7/Makefile.rules-cross.patch |   23 ++
 ...autofs-5.0.6-fix-recursive-mount-deadlock.patch |   78 +++++
 ...-5.0.6-increase-file-map-read-buffer-size.patch |   38 +++
 ...DME-update-mailing-list-subscription-info.patch |   56 ++++
 ...dd-timeout-option-description-to-man-page.patch |   42 +++
 ...5.0.7-allow-non-root-user-to-check-status.patch |   69 +++++
 ...-configure-allow-cross-compilation-update.patch |   28 ++
 ....0.7-configure-in-allow-cross-compilation.patch |   41 +++
 ...autofs-5.0.7-dont-wait-forever-to-restart.patch |   54 ++++
 ...tofs-5.0.7-fix-ipv6-proximity-calculation.patch |  297 ++++++++++++++++++++
 ...-5.0.7-fix-nobind-sun-escaped-map-entries.patch |   47 ++++
 ...s-5.0.7-fix-null-map-entry-order-handling.patch |   81 ++++++
 ...ofs-5.0.7-fix-parse-buffer-initialization.patch |   51 ++++
 .../autofs-5.0.7-fix-typo-in-automount-8.patch     |   37 +++
 ....7-fix-use-cache-entry-after-free-mistake.patch |   49 ++++
 ...tofs-5.0.7-handle-new-location-of-systemd.patch |   57 ++++
 ...tofs-5.0.7-include-usage-in-usage-message.patch |   25 ++
 ...ption-of-default-MOUNT_WAIT-setting-clear.patch |   57 ++++
 .../autofs-5.0.7/autofs-additional-distros.patch   |   12 +
 .../autofs/autofs-5.0.7/cross.patch                |   44 +++
 .../autofs-5.0.7/libtirpc-name-clash-backout.patch |   21 ++
 .../autofs/autofs-5.0.7/libtirpc.patch             |   26 ++
 .../autofs/autofs-5.0.7/no-bash.patch              |   20 ++
 .../recipes-daemons/autofs/autofs_5.0.7.bb         |   71 +++++
 24 files changed, 1324 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/Makefile.rules-cross.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.6-fix-recursive-mount-deadlock.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.6-increase-file-map-read-buffer-size.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-README-update-mailing-list-subscription-info.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-add-timeout-option-description-to-man-page.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-allow-non-root-user-to-check-status.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-configure-allow-cross-compilation-update.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-configure-in-allow-cross-compilation.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-dont-wait-forever-to-restart.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-ipv6-proximity-calculation.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-nobind-sun-escaped-map-entries.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-null-map-entry-order-handling.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-parse-buffer-initialization.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-typo-in-automount-8.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-use-cache-entry-after-free-mistake.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-handle-new-location-of-systemd.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-include-usage-in-usage-message.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-make-description-of-default-MOUNT_WAIT-setting-clear.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-additional-distros.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/cross.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/libtirpc-name-clash-backout.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/libtirpc.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/no-bash.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb

diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/Makefile.rules-cross.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/Makefile.rules-cross.patch
new file mode 100644
index 0000000..7dc7096
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/Makefile.rules-cross.patch
@@ -0,0 +1,23 @@
+Index: autofs-5.0.7/Makefile.rules
+===================================================================
+--- autofs-5.0.7.orig/Makefile.rules	2012-07-24 23:05:26.000000000 -0700
++++ autofs-5.0.7/Makefile.rules	2012-10-26 09:23:40.270204270 -0700
+@@ -34,14 +34,14 @@
+ else
+ CFLAGS    ?= -O2 -Wall
+ LDFLAGS   = -s
+-STRIP     = strip --strip-debug
++STRIP     = ${TARGET_PREFIX}strip --strip-debug
+ endif
+ endif
+ 
+-CC        = gcc
+-CXX       = g++
++CC        ?= ${TARGET_PREFIX}gcc
++CXX       ?= ${TARGET_PREFIX}g++
+ CXXFLAGS  = $(CFLAGS)
+-LD        = ld
++LD        ?= ${TARGET_PREFIX}ld
+ SOLDFLAGS = -shared
+ 
+ CFLAGS += -D_REENTRANT -D_FILE_OFFSET_BITS=64
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.6-fix-recursive-mount-deadlock.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.6-fix-recursive-mount-deadlock.patch
new file mode 100644
index 0000000..e6549a7
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.6-fix-recursive-mount-deadlock.patch
@@ -0,0 +1,78 @@
+autofs-5.0.6 - fix recursive mount deadlock
+
+From: Ian Kent <raven@themaw.net>
+
+Prior to the vfs-automount changes that went into 2.6.38
+and were finalized in 3.1 it was not possible to block
+path walks into multi-mounts whose root was covered by
+another mount. To deal with that a write lock was used
+to ensure the mount tree construction was completed. This
+restricts the types of recursively defined mount maps that
+can be used and can lead to a deadlock during lookup.
+
+Now that we can prevent processes walking into multi-mounts
+that are under construction we no longer need to use a
+write lock.
+
+Also, in the patch below, a cache writelock is changed to
+a read lock because a write lock isn't needed since the
+map cache entry isn't being updated.
+---
+
+ CHANGELOG       |    1 +
+ daemon/direct.c |   14 ++++++++++++--
+ 2 files changed, 13 insertions(+), 2 deletions(-)
+
+
+diff --git a/CHANGELOG b/CHANGELOG
+index 936c9ab..9cdad6e 100644
+--- a/CHANGELOG
++++ b/CHANGELOG
+@@ -12,6 +12,7 @@
+ - configure.in: allow cross compilation.
+ - README: update mailing list subscription info.
+ - allow non root user to check status.
++- fix recursive mount deadlock.
+ 
+ 25/07/2012 autofs-5.0.7
+ =======================
+diff --git a/daemon/direct.c b/daemon/direct.c
+index 7e2f0d7..3e09c5d 100644
+--- a/daemon/direct.c
++++ b/daemon/direct.c
+@@ -1285,6 +1285,8 @@ int handle_packet_missing_direct(struct autofs_point *ap, autofs_packet_missing_
+ 	struct timespec wait;
+ 	struct timeval now;
+ 	int ioctlfd, len, state;
++	unsigned int kver_major = get_kver_major();
++	unsigned int kver_minor = get_kver_minor();
+ 
+ 	pthread_setcancelstate(PTHREAD_CANCEL_DISABLE, &state);
+ 
+@@ -1297,8 +1299,16 @@ int handle_packet_missing_direct(struct autofs_point *ap, autofs_packet_missing_
+ 	 * cache entry we will not be able to find the mapent. So
+ 	 * we must take the source writelock to ensure the parent
+ 	 * has mount is complete before we look for the entry.
++	 *
++	 * Since the vfs-automount kernel changes we can now block
++	 * on covered mounts during mount tree construction so a
++	 * write lock is no longer needed. So we now can handle a
++	 * wider class of recursively define mount lookups.
+ 	 */
+-	master_source_writelock(ap->entry);
++	if (kver_major > 5 || (kver_major == 5 && kver_minor > 1))
++		master_source_readlock(ap->entry);
++	else
++		master_source_writelock(ap->entry);
+ 	map = ap->entry->maps;
+ 	while (map) {
+ 		/*
+@@ -1311,7 +1321,7 @@ int handle_packet_missing_direct(struct autofs_point *ap, autofs_packet_missing_
+ 		}
+ 
+ 		mc = map->mc;
+-		cache_writelock(mc);
++		cache_readlock(mc);
+ 		me = cache_lookup_ino(mc, pkt->dev, pkt->ino);
+ 		if (me)
+ 			break;
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.6-increase-file-map-read-buffer-size.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.6-increase-file-map-read-buffer-size.patch
new file mode 100644
index 0000000..39b2221
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.6-increase-file-map-read-buffer-size.patch
@@ -0,0 +1,38 @@
+autofs-5.0.6 - increase file map read buffer size
+
+From: Ian Kent <raven@themaw.net>
+
+The file map entry read buffer can be too small for larger
+multi-mount map entries so increase it.
+---
+
+ CHANGELOG           |    1 +
+ include/automount.h |    2 +-
+ 2 files changed, 2 insertions(+), 1 deletions(-)
+
+
+diff --git a/CHANGELOG b/CHANGELOG
+index 9cdad6e..3bdf8a4 100644
+--- a/CHANGELOG
++++ b/CHANGELOG
+@@ -13,6 +13,7 @@
+ - README: update mailing list subscription info.
+ - allow non root user to check status.
+ - fix recursive mount deadlock.
++- increase file map read buffer size.
+ 
+ 25/07/2012 autofs-5.0.7
+ =======================
+diff --git a/include/automount.h b/include/automount.h
+index 561fcc2..37541f5 100644
+--- a/include/automount.h
++++ b/include/automount.h
+@@ -233,7 +233,7 @@ int rmdir_path(struct autofs_point *ap, const char *path, dev_t dev);
+ #define AUTOFS_LOOKUP_VERSION 5
+ 
+ #define KEY_MAX_LEN    NAME_MAX
+-#define MAPENT_MAX_LEN 4095
++#define MAPENT_MAX_LEN 16384
+ #define PARSE_MAX_BUF	KEY_MAX_LEN + MAPENT_MAX_LEN + 2
+ 
+ int lookup_nss_read_master(struct master *master, time_t age);
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-README-update-mailing-list-subscription-info.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-README-update-mailing-list-subscription-info.patch
new file mode 100644
index 0000000..99b6181
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-README-update-mailing-list-subscription-info.patch
@@ -0,0 +1,56 @@
+autofs-5.0.7 - README: update mailing list subscription info
+
+From: Chris Packham <chris.packham@alliedtelesis.co.nz>
+
+Following the kernel.org compromise the mailing list was moved to
+vger.kernel.org. Update the subscription info and add URLs for the gmane
+mailing list archive.
+
+Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
+---
+
+ CHANGELOG |    1 +
+ README    |   17 ++++++++++++++---
+ 2 files changed, 15 insertions(+), 3 deletions(-)
+
+
+diff --git a/CHANGELOG b/CHANGELOG
+index fe801e8..44c9fb2 100644
+--- a/CHANGELOG
++++ b/CHANGELOG
+@@ -10,6 +10,7 @@
+ - fix null map entry order handling.
+ - make description of default MOUNT_WAIT setting clear.
+ - configure.in: allow cross compilation.
++- README: update mailing list subscription info.
+ 
+ 25/07/2012 autofs-5.0.7
+ =======================
+diff --git a/README b/README
+index cef16a9..9024e64 100644
+--- a/README
++++ b/README
+@@ -43,9 +43,20 @@ Fitzhardinge's <jeremy@goop.org> work on autofs 3. Further enhancements
+ have been made by Ian Kent <raven@themaw.net>.
+ 
+ If you use or want to help develop autofs, please join the autofs
+-mailing list by visiting:
++mailing list by sending an email to:
+ 
+-	http://linux.kernel.org/mailman/listinfo/autofs
++	majordomo@vger.kernel.org
+ 
+-and folling the instructions there to subscribe to the autofs mailing list.
++With the body text:
++
++	subscribe autofs
++
++Once subscribed you can send patches to:
++
++	autofs@vger.kernel.org
++
++The autofs mailing list archive can be viewed on gmane:
++
++	http://news.gmane.org/gmane.linux.kernel.autofs
++	http://blog.gmane.org/gmane.linux.kernel.autofs
+ 
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-add-timeout-option-description-to-man-page.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-add-timeout-option-description-to-man-page.patch
new file mode 100644
index 0000000..ac598dd
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-add-timeout-option-description-to-man-page.patch
@@ -0,0 +1,42 @@
+autofs-5.0.7 - add timeout option description to man page
+
+From: Ian Kent <ikent@redhat.com>
+
+The pseudo option used t set the timeout for map entries is one of
+the most most frequently used autofs options but is not mentioned
+in auto.master(5).
+---
+
+ CHANGELOG            |    1 +
+ man/auto.master.5.in |    5 +++++
+ 2 files changed, 6 insertions(+), 0 deletions(-)
+
+
+diff --git a/CHANGELOG b/CHANGELOG
+index 93b9c26..7b8d185 100644
+--- a/CHANGELOG
++++ b/CHANGELOG
+@@ -6,6 +6,7 @@
+ - fix parse buffer initialization.
+ - fix typo in automount(8).
+ - dont wait forever to restart.
++- add timeout option description to man page.
+ 
+ 25/07/2012 autofs-5.0.7
+ =======================
+diff --git a/man/auto.master.5.in b/man/auto.master.5.in
+index 54269f8..21d7544 100644
+--- a/man/auto.master.5.in
++++ b/man/auto.master.5.in
+@@ -167,6 +167,11 @@ server is specified in the map entry. If no server weights are given
+ then each available server will be tried in the order listed, within
+ proximity.
+ .TP
++.I "\-t, \-\-timeout <seconds>"
++Set the expire timeout for map entries. This option can be used to
++override the global default given either on the command line
++or in the configuration.
++.TP
+ .I "\-n, \-\-negative\-timeout <seconds>"
+ Set the timeout for caching failed key lookups. This option can be
+ used to override the global default given either on the command line
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-allow-non-root-user-to-check-status.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-allow-non-root-user-to-check-status.patch
new file mode 100644
index 0000000..6020c31
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-allow-non-root-user-to-check-status.patch
@@ -0,0 +1,69 @@
+autofs-5.0.7 - allow non root user to check status
+
+From: Ian Kent <ikent@redhat.com>
+
+
+---
+
+ CHANGELOG             |    1 +
+ redhat/autofs.init.in |   20 +++++++++++++-------
+ 2 files changed, 14 insertions(+), 7 deletions(-)
+
+
+diff --git a/CHANGELOG b/CHANGELOG
+index 44c9fb2..936c9ab 100644
+--- a/CHANGELOG
++++ b/CHANGELOG
+@@ -11,6 +11,7 @@
+ - make description of default MOUNT_WAIT setting clear.
+ - configure.in: allow cross compilation.
+ - README: update mailing list subscription info.
++- allow non root user to check status.
+ 
+ 25/07/2012 autofs-5.0.7
+ =======================
+diff --git a/redhat/autofs.init.in b/redhat/autofs.init.in
+index cd5cb34..fe18b3e 100644
+--- a/redhat/autofs.init.in
++++ b/redhat/autofs.init.in
+@@ -167,6 +167,19 @@ function usage_message() {
+ 
+ RETVAL=0
+ 
++# allow non-root users to read status / usage
++
++case "$1" in
++	status)
++		status -p @@autofspiddir@@/autofs.pid -l autofs $prog
++		exit 0;
++		;;
++	usage)
++		usage_message
++		exit 0;
++		;;
++esac
++
+ # Only the root user may change the service status
+ if [ `id -u` -ne 0 ] && [ "$1" != "status" ]; then
+ 	echo "insufficient privilege to change service status"
+@@ -184,9 +197,6 @@ case "$1" in
+ 	stop)
+ 		stop
+ 		;;
+-	status)
+-		status -p @@autofspiddir@@/autofs.pid -l autofs $prog
+-		;;
+ 	restart|force-reload)
+ 		restart
+ 		;;
+@@ -202,10 +212,6 @@ case "$1" in
+ 			restart
+ 		fi
+ 		;;
+-	usage)
+-		usage_message
+-		exit 0
+-		;;
+ 	*)
+ 		usage_message
+ 		exit 2
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-configure-allow-cross-compilation-update.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-configure-allow-cross-compilation-update.patch
new file mode 100644
index 0000000..a8bc3ce
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-configure-allow-cross-compilation-update.patch
@@ -0,0 +1,28 @@
+autofs-5.0.7 - configure: allow cross compilation update
+
+From: Chris Packham <chris.packham@alliedtelesis.co.nz>
+
+Run "make distclean" to update configure. This should have been included
+in 5936c738 when configure.in was updated but it was missed.
+---
+
+ configure |    5 +----
+ 1 files changed, 1 insertions(+), 4 deletions(-)
+
+
+diff --git a/configure b/configure
+index bf62203..ba3bba6 100755
+--- a/configure
++++ b/configure
+@@ -5378,10 +5378,7 @@ DAEMON_LDFLAGS=
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking whether gcc -fPIE works" >&5
+ $as_echo_n "checking whether gcc -fPIE works... " >&6; }
+ if test "$cross_compiling" = yes; then :
+-  { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+-$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+-as_fn_error $? "cannot run test program while cross compiling
+-See \`config.log' for more details" "$LINENO" 5; }
++  gcc_supports_pie=no
+ else
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-configure-in-allow-cross-compilation.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-configure-in-allow-cross-compilation.patch
new file mode 100644
index 0000000..ac18bd9
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-configure-in-allow-cross-compilation.patch
@@ -0,0 +1,41 @@
+autofs-5.0.7 - configure.in: allow cross compilation
+
+From: Chris Packham <chris.packham@alliedtelesis.co.nz>
+
+The default behaviour of AC_RUN_IFELSE is to stop with an error if cross
+compiling. Avoid this by providing the optional 4th argument to set
+gcc_supports_pie=no if support for PIE cannot be detected.
+
+Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
+---
+
+ CHANGELOG    |    1 +
+ configure.in |    2 +-
+ 2 files changed, 2 insertions(+), 1 deletions(-)
+
+
+diff --git a/CHANGELOG b/CHANGELOG
+index 961e340..fe801e8 100644
+--- a/CHANGELOG
++++ b/CHANGELOG
+@@ -9,6 +9,7 @@
+ - add timeout option description to man page.
+ - fix null map entry order handling.
+ - make description of default MOUNT_WAIT setting clear.
++- configure.in: allow cross compilation.
+ 
+ 25/07/2012 autofs-5.0.7
+ =======================
+diff --git a/configure.in b/configure.in
+index 1a24e34..90bda62 100644
+--- a/configure.in
++++ b/configure.in
+@@ -307,7 +307,7 @@ DAEMON_CFLAGS=
+ DAEMON_LDFLAGS=
+ AC_MSG_CHECKING([whether gcc -fPIE works])
+ AC_RUN_IFELSE([AC_LANG_PROGRAM([[]], [[int main(void) {return 0;}]])],
+-	      [gcc_supports_pie=yes], [gcc_supports_pie=no])
++	      [gcc_supports_pie=yes], [gcc_supports_pie=no], [gcc_supports_pie=no])
+ AC_MSG_RESULT([$gcc_supports_pie])
+ if test $gcc_supports_pie = yes ; then
+ 	DAEMON_CFLAGS="-fPIE"
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-dont-wait-forever-to-restart.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-dont-wait-forever-to-restart.patch
new file mode 100644
index 0000000..9973b47
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-dont-wait-forever-to-restart.patch
@@ -0,0 +1,54 @@
+autofs-5.0.7 - dont wait forever to restart
+
+From: Ian Kent <ikent@redhat.com>
+
+When restarting autofs the daemon must be stopped before it is started
+again if it is to function properly. At the moment the init script waits
+forever which is not ok if the daemon won't exit for some reason.
+
+So, if the daemon is still running after the stop, run stop() again, wait
+a bit longer and if it still hasn't stopped kill it with a SIGKILL to clear
+the way for the startup.
+---
+
+ CHANGELOG             |    1 +
+ redhat/autofs.init.in |   13 ++++++++++---
+ 2 files changed, 11 insertions(+), 3 deletions(-)
+
+
+diff --git a/CHANGELOG b/CHANGELOG
+index 6051723..93b9c26 100644
+--- a/CHANGELOG
++++ b/CHANGELOG
+@@ -5,6 +5,7 @@
+ - fix ipv6 proximity calculation.
+ - fix parse buffer initialization.
+ - fix typo in automount(8).
++- dont wait forever to restart.
+ 
+ 25/07/2012 autofs-5.0.7
+ =======================
+diff --git a/redhat/autofs.init.in b/redhat/autofs.init.in
+index ec6d5d6..cd5cb34 100644
+--- a/redhat/autofs.init.in
++++ b/redhat/autofs.init.in
+@@ -129,9 +129,16 @@ function restart() {
+ 	status autofs > /dev/null 2>&1
+ 	if [ $? -eq 0 ]; then
+ 		stop
+-		while [ -n "`pidof $prog`" ] ; do
+-			sleep 5
+-		done
++		if [ -n "`pidof $prog`" ]; then
++			# If we failed to stop, try at least one more time
++			# after waiting a little while
++			sleep 20
++			stop
++			auto_pid=`pidof $prog`
++			if [ -n "$auto_pid" ]; then
++				kill -9 $auto_pid
++			fi
++		fi
+ 	fi
+ 	start
+ }
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-ipv6-proximity-calculation.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-ipv6-proximity-calculation.patch
new file mode 100644
index 0000000..b341ecd
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-ipv6-proximity-calculation.patch
@@ -0,0 +1,297 @@
+autofs-5.0.7 - fix ipv6 proximity calculation
+
+From: Ian Kent <ikent@redhat.com>
+
+The socket based ioctl used to get interface information only
+return IPv4 information. Change get_proximity() function to use
+getifaddrs(3) instead.
+---
+
+ CHANGELOG            |    1 
+ modules/replicated.c |  149 ++++++++++++++------------------------------------
+ 2 files changed, 42 insertions(+), 108 deletions(-)
+
+
+diff --git a/CHANGELOG b/CHANGELOG
+index dc38580..34c70fa 100644
+--- a/CHANGELOG
++++ b/CHANGELOG
+@@ -2,6 +2,7 @@
+ =======================
+ - fix nobind sun escaped map entries.
+ - fix use cache entry after free in lookup_prune_one_cache().
++- fix ipv6 proximity calculation.
+ 
+ 25/07/2012 autofs-5.0.7
+ =======================
+diff --git a/modules/replicated.c b/modules/replicated.c
+index 78046c6..bd6003b 100644
+--- a/modules/replicated.c
++++ b/modules/replicated.c
+@@ -52,6 +52,7 @@
+ #include <net/if.h>
+ #include <netinet/in.h>
+ #include <netdb.h>
++#include <ifaddrs.h>
+ 
+ #include "rpc_subs.h"
+ #include "replicated.h"
+@@ -110,58 +111,18 @@ void seed_random(void)
+ 	return;
+ }
+ 
+-static int alloc_ifreq(struct ifconf *ifc, int sock)
+-{
+-	int ret, lastlen = ifc_last_len, len = ifc_buf_len;
+-	char err_buf[MAX_ERR_BUF], *buf;
+-
+-	while (1) {
+-		buf = malloc(len);
+-		if (!buf) {
+-			char *estr = strerror_r(errno, err_buf, MAX_ERR_BUF);
+-			logerr("malloc: %s", estr);
+-			return 0;
+-		}
+-
+-		ifc->ifc_len = len;
+-		ifc->ifc_req = (struct ifreq *) buf;
+-
+-		ret = ioctl(sock, SIOCGIFCONF, ifc);
+-		if (ret == -1) {
+-			char *estr = strerror_r(errno, err_buf, MAX_ERR_BUF);
+-			logerr("ioctl: %s", estr);
+-			free(buf);
+-			return 0;
+-		}
+-
+-		if (ifc->ifc_len <= lastlen)
+-			break;
+-
+-		lastlen = ifc->ifc_len;
+-		len += MAX_IFC_BUF;
+-		free(buf);
+-	}
+-
+-	if (lastlen != ifc_last_len) {
+-		ifc_last_len = lastlen;
+-		ifc_buf_len = len;
+-	}
+-
+-	return 1;
+-}
+-
+ static unsigned int get_proximity(struct sockaddr *host_addr)
+ {
++	struct ifaddrs *ifa = NULL;
++	struct ifaddrs *this;
+ 	struct sockaddr_in *addr, *msk_addr, *if_addr;
+ 	struct sockaddr_in6 *addr6, *msk6_addr, *if6_addr;
+ 	struct in_addr *hst_addr;
+ 	struct in6_addr *hst6_addr;
+ 	int addr_len;
+-	char buf[MAX_ERR_BUF], *ptr;
+-	struct ifconf ifc;
+-	struct ifreq *ifr, nmptr;
+-	int sock, ret, i;
++	char buf[MAX_ERR_BUF];
+ 	uint32_t mask, ha, ia, *mask6, *ha6, *ia6;
++	int ret;
+ 
+ 	addr = NULL;
+ 	addr6 = NULL;
+@@ -170,13 +131,14 @@ static unsigned int get_proximity(struct sockaddr *host_addr)
+ 	mask6 = NULL;
+ 	ha6 = NULL;
+ 	ia6 = NULL;
++	ha = 0;
+ 
+ 	switch (host_addr->sa_family) {
+ 	case AF_INET:
+ 		addr = (struct sockaddr_in *) host_addr;
+ 		hst_addr = (struct in_addr *) &addr->sin_addr;
+ 		ha = ntohl((uint32_t) hst_addr->s_addr);
+-		addr_len = sizeof(hst_addr);
++		addr_len = sizeof(*hst_addr);
+ 		break;
+ 
+ 	case AF_INET6:
+@@ -186,7 +148,7 @@ static unsigned int get_proximity(struct sockaddr *host_addr)
+ 		addr6 = (struct sockaddr_in6 *) host_addr;
+ 		hst6_addr = (struct in6_addr *) &addr6->sin6_addr;
+ 		ha6 = &hst6_addr->s6_addr32[0];
+-		addr_len = sizeof(hst6_addr);
++		addr_len = sizeof(*hst6_addr);
+ 		break;
+ #endif
+ 
+@@ -194,36 +156,29 @@ static unsigned int get_proximity(struct sockaddr *host_addr)
+ 		return PROXIMITY_ERROR;
+ 	}
+ 
+-	sock = open_sock(AF_INET, SOCK_DGRAM, 0);
+-	if (sock < 0) {
++	ret = getifaddrs(&ifa);
++	if (ret) {
+ 		char *estr = strerror_r(errno, buf, MAX_ERR_BUF);
+-		logerr("socket creation failed: %s", estr);
++		logerr("getifaddrs: %s", estr);
+ 		return PROXIMITY_ERROR;
+ 	}
+ 
+-	if (!alloc_ifreq(&ifc, sock)) {
+-		close(sock);
+-		return PROXIMITY_ERROR;
+-	}
+-
+-	/* For each interface */
+-
+-	/* Is the address a local interface */
+-	i = 0;
+-	ptr = (char *) &ifc.ifc_buf[0];
+-
+-	while (ptr < (char *) ifc.ifc_req + ifc.ifc_len) {
+-		ifr = (struct ifreq *) ptr;
++	this = ifa;
++	while (this) {
++		if (this->ifa_flags & IFF_POINTOPOINT ||
++		    this->ifa_addr->sa_data == NULL) {
++			this = this->ifa_next;
++			continue;
++		}
+ 
+-		switch (ifr->ifr_addr.sa_family) {
++		switch (this->ifa_addr->sa_family) {
+ 		case AF_INET:
+ 			if (host_addr->sa_family == AF_INET6)
+ 				break;
+-			if_addr = (struct sockaddr_in *) &ifr->ifr_addr;
++			if_addr = (struct sockaddr_in *) this->ifa_addr;
+ 			ret = memcmp(&if_addr->sin_addr, hst_addr, addr_len);
+ 			if (!ret) {
+-				close(sock);
+-				free(ifc.ifc_req);
++				freeifaddrs(ifa);
+ 				return PROXIMITY_LOCAL;
+ 			}
+ 			break;
+@@ -234,55 +189,41 @@ static unsigned int get_proximity(struct sockaddr *host_addr)
+ #else
+ 			if (host_addr->sa_family == AF_INET)
+ 				break;
+-
+-			if6_addr = (struct sockaddr_in6 *) &ifr->ifr_addr;
++			if6_addr = (struct sockaddr_in6 *) this->ifa_addr;
+ 			ret = memcmp(&if6_addr->sin6_addr, hst6_addr, addr_len);
+ 			if (!ret) {
+-				close(sock);
+-				free(ifc.ifc_req);
++				freeifaddrs(ifa);
+ 				return PROXIMITY_LOCAL;
+ 			}
+ #endif
+-
+ 		default:
+ 			break;
+ 		}
+-
+-		i++;
+-		ptr = (char *) &ifc.ifc_req[i];
++		this = this->ifa_next;
+ 	}
+ 
+-	i = 0;
+-	ptr = (char *) &ifc.ifc_buf[0];
+-
+-	while (ptr < (char *) ifc.ifc_req + ifc.ifc_len) {
+-		ifr = (struct ifreq *) ptr;
+-
+-		nmptr = *ifr;
+-		ret = ioctl(sock, SIOCGIFNETMASK, &nmptr);
+-		if (ret == -1) {
+-			char *estr = strerror_r(errno, buf, MAX_ERR_BUF);
+-			logerr("ioctl: %s", estr);
+-			close(sock);
+-			free(ifc.ifc_req);
+-			return PROXIMITY_ERROR;
++	this = ifa;
++	while (this) {
++		if (this->ifa_flags & IFF_POINTOPOINT ||
++		    this->ifa_addr->sa_data == NULL) {
++			this = this->ifa_next;
++			continue;
+ 		}
+ 
+-		switch (ifr->ifr_addr.sa_family) {
++		switch (this->ifa_addr->sa_family) {
+ 		case AF_INET:
+ 			if (host_addr->sa_family == AF_INET6)
+ 				break;
+-			if_addr = (struct sockaddr_in *) &ifr->ifr_addr;
++			if_addr = (struct sockaddr_in *) this->ifa_addr;
+ 			ia =  ntohl((uint32_t) if_addr->sin_addr.s_addr);
+ 
+-			/* Is the address within a localiy attached subnet */
++			/* Is the address within a localy attached subnet */
+ 
+-			msk_addr = (struct sockaddr_in *) &nmptr.ifr_netmask;
++			msk_addr = (struct sockaddr_in *) this->ifa_netmask;
+ 			mask = ntohl((uint32_t) msk_addr->sin_addr.s_addr);
+ 
+ 			if ((ia & mask) == (ha & mask)) {
+-				close(sock);
+-				free(ifc.ifc_req);
++				freeifaddrs(ifa);
+ 				return PROXIMITY_SUBNET;
+ 			}
+ 
+@@ -304,8 +245,7 @@ static unsigned int get_proximity(struct sockaddr *host_addr)
+ 				break;
+ 
+ 			if ((ia & mask) == (ha & mask)) {
+-				close(sock);
+-				free(ifc.ifc_req);
++				freeifaddrs(ifa);
+ 				return PROXIMITY_NET;
+ 			}
+ 			break;
+@@ -316,35 +256,28 @@ static unsigned int get_proximity(struct sockaddr *host_addr)
+ #else
+ 			if (host_addr->sa_family == AF_INET)
+ 				break;
+-
+-			if6_addr = (struct sockaddr_in6 *) &ifr->ifr_addr;
++			if6_addr = (struct sockaddr_in6 *) this->ifa_addr;
+ 			ia6 = &if6_addr->sin6_addr.s6_addr32[0];
+ 
+ 			/* Is the address within the network of the interface */
+ 
+-			msk6_addr = (struct sockaddr_in6 *) &nmptr.ifr_netmask;
++			msk6_addr = (struct sockaddr_in6 *) this->ifa_netmask;
+ 			mask6 = &msk6_addr->sin6_addr.s6_addr32[0];
+ 
+ 			if (ipv6_mask_cmp(ha6, ia6, mask6)) {
+-				close(sock);
+-				free(ifc.ifc_req);
++				freeifaddrs(ifa);
+ 				return PROXIMITY_SUBNET;
+ 			}
+ 
+ 			/* How do we define "local network" in ipv6? */
+ #endif
+-			break;
+-
+ 		default:
+ 			break;
+ 		}
+-
+-		i++;
+-		ptr = (char *) &ifc.ifc_req[i];
++		this = this->ifa_next;
+ 	}
+ 
+-	close(sock);
+-	free(ifc.ifc_req);
++	freeifaddrs(ifa);
+ 
+ 	return PROXIMITY_OTHER;
+ }
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-nobind-sun-escaped-map-entries.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-nobind-sun-escaped-map-entries.patch
new file mode 100644
index 0000000..b5d7ad2
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-nobind-sun-escaped-map-entries.patch
@@ -0,0 +1,47 @@
+autofs-5.0.7 - fix nobind sun escaped map entries
+
+From: Ian Kent <ikent@redhat.com>
+
+If a map contains a Sun colon escape to indicate the mount is a local
+file system and the "nobind" option is present there is no hostname in
+the mount location and the mount fails.
+---
+
+ CHANGELOG           |    4 ++++
+ modules/mount_nfs.c |    5 +++--
+ 2 files changed, 7 insertions(+), 2 deletions(-)
+
+
+diff --git a/CHANGELOG b/CHANGELOG
+index 67fdcec..faf4c80 100644
+--- a/CHANGELOG
++++ b/CHANGELOG
+@@ -1,3 +1,7 @@
++??/??/2012 autofs-5.0.8
++=======================
++- fix nobind sun escaped map entries.
++
+ 25/07/2012 autofs-5.0.7
+ =======================
+ - fix ipv6 name for lookup fix.
+diff --git a/modules/mount_nfs.c b/modules/mount_nfs.c
+index 9b8e5f1..bbbb1de 100644
+--- a/modules/mount_nfs.c
++++ b/modules/mount_nfs.c
+@@ -263,13 +263,14 @@ int mount_mount(struct autofs_point *ap, const char *root, const char *name, int
+ 			} else
+ 				strcpy(loc, n_addr);
+ 		} else {
+-			loc = malloc(strlen(this->name) + strlen(this->path) + 2);
++			char *host = this->name ? this->name : "localhost";
++			loc = malloc(strlen(host) + strlen(this->path) + 2);
+ 			if (!loc) {
+ 				char *estr = strerror_r(errno, buf, MAX_ERR_BUF);
+ 				error(ap->logopt, "malloc: %s", estr);
+ 				goto forced_fail;
+ 			}
+-			strcpy(loc, this->name);
++			strcpy(loc, host);
+ 		}
+ 		strcat(loc, ":");
+ 		strcat(loc, this->path);
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-null-map-entry-order-handling.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-null-map-entry-order-handling.patch
new file mode 100644
index 0000000..610afaa
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-null-map-entry-order-handling.patch
@@ -0,0 +1,81 @@
+autofs-5.0.7 - fix null map entry order handling
+
+From: Ian Kent <ikent@redhat.com>
+
+If a null map entry appears after a corresponding indirect map entry
+autofs doesn't handle it properly.
+
+Since it appears after the map entry it should'nt affect it but autofs
+doesn't account for this case and assumes the map entry is already
+mounted and tries to shut it down causing attempted access to facilities
+that don't exist.
+---
+
+ CHANGELOG    |    1 +
+ lib/master.c |   32 +++++++++++++++++++++++++++++---
+ 2 files changed, 30 insertions(+), 3 deletions(-)
+
+
+diff --git a/CHANGELOG b/CHANGELOG
+index 7b8d185..79cf673 100644
+--- a/CHANGELOG
++++ b/CHANGELOG
+@@ -7,6 +7,7 @@
+ - fix typo in automount(8).
+ - dont wait forever to restart.
+ - add timeout option description to man page.
++- fix null map entry order handling.
+ 
+ 25/07/2012 autofs-5.0.7
+ =======================
+diff --git a/lib/master.c b/lib/master.c
+index 904b13d..a0e62f2 100644
+--- a/lib/master.c
++++ b/lib/master.c
+@@ -1179,9 +1179,35 @@ int master_mount_mounts(struct master *master, time_t age, int readall)
+ 
+ 		cache_readlock(nc);
+ 		ne = cache_lookup_distinct(nc, this->path);
+-		if (ne && this->age > ne->age) {
++		/*
++		 * If this path matched a nulled entry the master map entry
++		 * must be an indirect mount so the master map entry line
++		 * number may be obtained from this->maps.
++		 */
++		if (ne) {
++			int lineno = ne->age;
+ 			cache_unlock(nc);
+-			st_add_task(ap, ST_SHUTDOWN_PENDING);
++
++			/* null entry appears after map entry */
++			if (this->maps->master_line < lineno) {
++				warn(ap->logopt,
++				     "ignoring null entry that appears after "
++				     "existing entry for %s", this->path);
++				goto cont;
++			}
++			if (ap->state != ST_INIT) {
++				st_add_task(ap, ST_SHUTDOWN_PENDING);
++				continue;
++			}
++			/*
++			 * The map entry hasn't been started yet and we've
++			 * seen a preceeding null map entry for it so just
++			 * delete it from the master map entry list so it
++			 * doesn't get in the road.
++			 */
++			list_del_init(&this->list);
++			master_free_mapent_sources(ap->entry, 1);
++			master_free_mapent(ap->entry);
+ 			continue;
+ 		}
+ 		nested = cache_partial_match(nc, this->path);
+@@ -1194,7 +1220,7 @@ int master_mount_mounts(struct master *master, time_t age, int readall)
+ 				cache_delete(nc, nested->key);
+ 		}
+ 		cache_unlock(nc);
+-
++cont:
+ 		st_mutex_lock();
+ 
+ 		state_pipe = this->ap->state_pipe[1];
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-parse-buffer-initialization.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-parse-buffer-initialization.patch
new file mode 100644
index 0000000..22bd5da
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-parse-buffer-initialization.patch
@@ -0,0 +1,51 @@
+autofs-5.0.7 - fix parse buffer initialization
+
+From: Ian Kent <ikent@redhat.com>
+
+When parsing a master map entry, if the mount point path is longer than
+the following map string the lexical analyzer buffer may not have a null
+terminator where it is expected. If the map name string also contains a
+string that is the same as a map type at the end the map name the map
+name is not constructed correctly because of this lack of a string
+terminator in the buffer.
+---
+
+ CHANGELOG        |    1 +
+ lib/master_tok.l |    4 +++-
+ 2 files changed, 4 insertions(+), 1 deletions(-)
+
+
+diff --git a/CHANGELOG b/CHANGELOG
+index 34c70fa..276d6ba 100644
+--- a/CHANGELOG
++++ b/CHANGELOG
+@@ -3,6 +3,7 @@
+ - fix nobind sun escaped map entries.
+ - fix use cache entry after free in lookup_prune_one_cache().
+ - fix ipv6 proximity calculation.
++- fix parse buffer initialization.
+ 
+ 25/07/2012 autofs-5.0.7
+ =======================
+diff --git a/lib/master_tok.l b/lib/master_tok.l
+index 0d6edb7..30abb15 100644
+--- a/lib/master_tok.l
++++ b/lib/master_tok.l
+@@ -74,7 +74,8 @@ int my_yyinput(char *, int);
+ #define unput(c) (*(char *) --line = c)
+ #endif
+ 
+-char buff[1024];
++#define BUFF_LEN	1024
++char buff[BUFF_LEN];
+ char *bptr;
+ char *optr = buff;
+ unsigned int tlen;
+@@ -174,6 +175,7 @@ OPTNTOUT	(-n{OPTWS}|-n{OPTWS}={OPTWS}|--negative-timeout{OPTWS}|--negative-timeo
+ 		*bptr = '\0';
+ 		strcpy(master_lval.strtype, buff);
+ 		bptr = buff;
++		memset(buff, 0, BUFF_LEN);
+ 		return(PATH);
+ 	}
+ 
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-typo-in-automount-8.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-typo-in-automount-8.patch
new file mode 100644
index 0000000..6d88ce0
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-typo-in-automount-8.patch
@@ -0,0 +1,37 @@
+autofs-5.0.7 - fix typo in automount(8)
+
+From: Ian Kent <ikent@redhat.com>
+
+
+---
+
+ CHANGELOG       |    1 +
+ man/automount.8 |    2 +-
+ 2 files changed, 2 insertions(+), 1 deletions(-)
+
+
+diff --git a/CHANGELOG b/CHANGELOG
+index 276d6ba..6051723 100644
+--- a/CHANGELOG
++++ b/CHANGELOG
+@@ -4,6 +4,7 @@
+ - fix use cache entry after free in lookup_prune_one_cache().
+ - fix ipv6 proximity calculation.
+ - fix parse buffer initialization.
++- fix typo in automount(8).
+ 
+ 25/07/2012 autofs-5.0.7
+ =======================
+diff --git a/man/automount.8 b/man/automount.8
+index 0186984..dddebce 100644
+--- a/man/automount.8
++++ b/man/automount.8
+@@ -51,7 +51,7 @@ are over-ridden macro definitions of the same name specified in
+ mount entries.
+ .TP
+ .I "\-f, \-\-foreground"
+-Run the daemon in the forground and log to stderr instead of syslog."
++Run the daemon in the foreground and log to stderr instead of syslog."
+ .TP
+ .I "\-r, \-\-random-multimount-selection"
+ Enables the use of ramdom selection when choosing a host from a
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-use-cache-entry-after-free-mistake.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-use-cache-entry-after-free-mistake.patch
new file mode 100644
index 0000000..a469c16
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-use-cache-entry-after-free-mistake.patch
@@ -0,0 +1,49 @@
+autofs-5.0.7 - fix use cache entry after free mistake
+
+From: Ian Kent <ikent@redhat.com>
+
+Fix an obvious use after free mistake in lookup_prune_one_cache().
+---
+
+ CHANGELOG       |    1 +
+ daemon/lookup.c |    7 +++++--
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+
+diff --git a/CHANGELOG b/CHANGELOG
+index faf4c80..dc38580 100644
+--- a/CHANGELOG
++++ b/CHANGELOG
+@@ -1,6 +1,7 @@
+ ??/??/2012 autofs-5.0.8
+ =======================
+ - fix nobind sun escaped map entries.
++- fix use cache entry after free in lookup_prune_one_cache().
+ 
+ 25/07/2012 autofs-5.0.7
+ =======================
+diff --git a/daemon/lookup.c b/daemon/lookup.c
+index 7909536..e3d9536 100644
+--- a/daemon/lookup.c
++++ b/daemon/lookup.c
+@@ -1103,15 +1103,18 @@ void lookup_prune_one_cache(struct autofs_point *ap, struct mapent_cache *mc, ti
+ 		if (valid)
+ 			cache_delete(mc, key);
+ 		else if (!is_mounted(_PROC_MOUNTS, path, MNTS_AUTOFS)) {
++			dev_t devid = ap->dev;
+ 			status = CHE_FAIL;
++			if (ap->type == LKP_DIRECT)
++				devid = this->dev;
+ 			if (this->ioctlfd == -1)
+ 				status = cache_delete(mc, key);
+ 			if (status != CHE_FAIL) {
+ 				if (ap->type == LKP_INDIRECT) {
+ 					if (ap->flags & MOUNT_FLAG_GHOST)
+-						rmdir_path(ap, path, ap->dev);
++						rmdir_path(ap, path, devid);
+ 				} else
+-					rmdir_path(ap, path, this->dev);
++					rmdir_path(ap, path, devid);
+ 			}
+ 		}
+ 		cache_unlock(mc);
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-handle-new-location-of-systemd.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-handle-new-location-of-systemd.patch
new file mode 100644
index 0000000..1c26794
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-handle-new-location-of-systemd.patch
@@ -0,0 +1,57 @@
+autofs-5.0.7 - Handle new location of systemd
+
+From: Frederic Crozat <fcrozat@suse.com>
+
+Some distributions are moving systemd unit files from /lib to
+/usr/lib, so we need to test both directories.
+
+edit: imk
+It occurs to me I've forgotten to check for the 64 bit variants
+of the directories, so add them as well.
+end edit: imk
+---
+
+ CHANGELOG  |    1 +
+ aclocal.m4 |    2 +-
+ configure  |    2 +-
+ 3 files changed, 3 insertions(+), 2 deletions(-)
+
+
+diff --git a/CHANGELOG b/CHANGELOG
+index 3bdf8a4..8f6bb3a 100644
+--- a/CHANGELOG
++++ b/CHANGELOG
+@@ -14,6 +14,7 @@
+ - allow non root user to check status.
+ - fix recursive mount deadlock.
+ - increase file map read buffer size.
++- handle new location of systemd.
+ 
+ 25/07/2012 autofs-5.0.7
+ =======================
+diff --git a/aclocal.m4 b/aclocal.m4
+index 1798c8b..47bca0c 100644
+--- a/aclocal.m4
++++ b/aclocal.m4
+@@ -234,7 +234,7 @@ AC_DEFUN([AF_WITH_SYSTEMD],
+ [if test "$withval" = yes; then
+   if test -z "$systemddir"; then
+     AC_MSG_CHECKING([location of the systemd unit files directory])
+-    for systemd_d in /lib/systemd/system; do
++    for systemd_d in /usr/lib/systemd/system /usr/lib64/systemd/system /lib/systemd/system /lib64/systemd/system; do
+       if test -z "$systemddir"; then
+         if test -d "$systemd_d"; then
+           systemddir="$systemd_d"
+diff --git a/configure b/configure
+index ba3bba6..3722a46 100755
+--- a/configure
++++ b/configure
+@@ -2157,7 +2157,7 @@ if test "${with_systemd+set}" = set; then :
+   if test -z "$systemddir"; then
+     { $as_echo "$as_me:${as_lineno-$LINENO}: checking location of the systemd unit files directory" >&5
+ $as_echo_n "checking location of the systemd unit files directory... " >&6; }
+-    for systemd_d in /lib/systemd/system; do
++    for systemd_d in /usr/lib/systemd/system /usr/lib64/systemd/system /lib/systemd/system /lib64/systemd/system; do
+       if test -z "$systemddir"; then
+         if test -d "$systemd_d"; then
+           systemddir="$systemd_d"
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-include-usage-in-usage-message.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-include-usage-in-usage-message.patch
new file mode 100644
index 0000000..1c8a565
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-include-usage-in-usage-message.patch
@@ -0,0 +1,25 @@
+autofs-5.0.7 - include usage in usage message
+
+From: Ian Kent <ikent@redhat.com>
+
+Since usage is a case entry we should also nclude it in the usage
+message.
+---
+
+ redhat/autofs.init.in |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+
+diff --git a/redhat/autofs.init.in b/redhat/autofs.init.in
+index 8e355da..ec6d5d6 100644
+--- a/redhat/autofs.init.in
++++ b/redhat/autofs.init.in
+@@ -155,7 +155,7 @@ function reload() {
+ }
+ 
+ function usage_message() {
+-	echo $"Usage: $0 {start|forcestart|stop|status|restart|force-reload|forcerestart|reload|condrestart|try-restart}"
++	echo $"Usage: $0 {start|forcestart|stop|status|restart|force-reload|forcerestart|reload|condrestart|try-restart|usage}"
+ }
+ 
+ RETVAL=0
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-make-description-of-default-MOUNT_WAIT-setting-clear.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-make-description-of-default-MOUNT_WAIT-setting-clear.patch
new file mode 100644
index 0000000..a3dd3fb
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-make-description-of-default-MOUNT_WAIT-setting-clear.patch
@@ -0,0 +1,57 @@
+autofs-5.0.7 - make description of default MOUNT_WAIT setting clear
+
+From: Ian Kent <ikent@redhat.com>
+
+
+---
+
+ CHANGELOG                      |    1 +
+ redhat/autofs.sysconfig.in     |    5 +++--
+ samples/autofs.conf.default.in |    5 +++--
+ 3 files changed, 7 insertions(+), 4 deletions(-)
+
+
+diff --git a/CHANGELOG b/CHANGELOG
+index 79cf673..961e340 100644
+--- a/CHANGELOG
++++ b/CHANGELOG
+@@ -8,6 +8,7 @@
+ - dont wait forever to restart.
+ - add timeout option description to man page.
+ - fix null map entry order handling.
++- make description of default MOUNT_WAIT setting clear.
+ 
+ 25/07/2012 autofs-5.0.7
+ =======================
+diff --git a/redhat/autofs.sysconfig.in b/redhat/autofs.sysconfig.in
+index 36b924d..a8992c4 100644
+--- a/redhat/autofs.sysconfig.in
++++ b/redhat/autofs.sysconfig.in
+@@ -18,8 +18,9 @@ TIMEOUT=300
+ # 	       Setting this timeout can cause problems when
+ # 	       mount would otherwise wait for a server that
+ # 	       is temporarily unavailable, such as when it's
+-# 	       restarting. The defailt of waiting for mount(8)
+-# 	       usually results in a wait of around 3 minutes.
++# 	       restarting. The default setting (-1) of waiting
++# 	       for mount(8) usually results in a wait of around
++# 	       3 minutes.
+ #
+ #MOUNT_WAIT=-1
+ #
+diff --git a/samples/autofs.conf.default.in b/samples/autofs.conf.default.in
+index ac2f63b..1da89cf 100644
+--- a/samples/autofs.conf.default.in
++++ b/samples/autofs.conf.default.in
+@@ -18,8 +18,9 @@ TIMEOUT=300
+ # 	       Setting this timeout can cause problems when
+ # 	       mount would otherwise wait for a server that
+ # 	       is temporarily unavailable, such as when it's
+-# 	       restarting. The defailt of waiting for mount(8)
+-# 	       usually results in a wait of around 3 minutes.
++# 	       restarting. The default setting (-1) of waiting
++# 	       for mount(8) usually results in a wait of around
++# 	       3 minutes.
+ #
+ #MOUNT_WAIT=-1
+ #
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-additional-distros.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-additional-distros.patch
new file mode 100644
index 0000000..6a35843
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-additional-distros.patch
@@ -0,0 +1,12 @@
+--- autofs-4.1.4/samples/rc.autofs.in~	2005-04-11 06:30:54.000000000 -0500
++++ autofs-4.1.4/samples/rc.autofs.in	2007-04-07 13:18:44.000000000 -0500
+@@ -43,6 +43,9 @@
+ 	system=debian
+ elif [ -f /etc/redhat-release ]; then
+ 	system=redhat
++elif [ -f /etc/issue ] && grep -q "^SlugOS\|Yocto" /etc/issue ; then
++	# SlugOS and Yocto behave like Debian, at least for autofs purposes.
++	system=debian
+ else
+ 	echo "$0: Unknown system, please port and contact autofs@linux.kernel.org" 1>&2
+ 	exit 1
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/cross.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/cross.patch
new file mode 100644
index 0000000..8f1af62
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/cross.patch
@@ -0,0 +1,44 @@
+Index: autofs-5.0.7/aclocal.m4
+===================================================================
+--- autofs-5.0.7.orig/aclocal.m4	2012-10-28 04:45:07.000000000 -0700
++++ autofs-5.0.7/aclocal.m4	2012-10-28 10:47:53.263996910 -0700
+@@ -7,6 +7,8 @@
+ AC_DEFUN(AF_PATH_INCLUDE,
+ [AC_PATH_PROGS($1,$2,$3,$4)
+ if test -n "$$1"; then
++  AH_TEMPLATE([HAVE_$1], [Have $2])
++  AH_TEMPLATE([PATH_$1], [Have $2])
+   AC_DEFINE(HAVE_$1,1,[define if you have $1])
+   AC_DEFINE_UNQUOTED(PATH_$1, "$$1", [define if you have $1])
+   HAVE_$1=1
+Index: autofs-5.0.7/configure.in
+===================================================================
+--- autofs-5.0.7.orig/configure.in	2012-10-28 04:45:06.000000000 -0700
++++ autofs-5.0.7/configure.in	2012-10-28 10:50:07.580000628 -0700
+@@ -301,13 +301,15 @@
+ cat > pietest.c <<EOF
+ int main(void) { return 0; }
+ EOF
++AF_tmp_ldflags="$LDFLAGS"
++AF_tmp_cflags="$CFLAGS"
+ CFLAGS=-fPIE
+ LDFLAGS=-pie
+ DAEMON_CFLAGS=
+ DAEMON_LDFLAGS=
+ AC_MSG_CHECKING([whether gcc -fPIE works])
+-AC_RUN_IFELSE([AC_LANG_PROGRAM([[]], [[int main(void) {return 0;}]])],
+-	      [gcc_supports_pie=yes], [gcc_supports_pie=no], [gcc_supports_pie=no])
++AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[int main(void) {return 0;}]])],
++	       [gcc_supports_pie=yes], [gcc_supports_pie=no], [gcc_supports_pie=no])
+ AC_MSG_RESULT([$gcc_supports_pie])
+ if test $gcc_supports_pie = yes ; then
+ 	DAEMON_CFLAGS="-fPIE"
+@@ -316,6 +318,8 @@
+ rm -f pietest.c
+ AC_SUBST(DAEMON_CFLAGS)
+ AC_SUBST(DAEMON_LDFLAGS)
++CFLAGS="${AF_tmp_cflags}"
++LDFLAGS="${AF_tmp_ldflags}"
+ 
+ #
+ # Enable ability to access value in external env variable
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/libtirpc-name-clash-backout.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/libtirpc-name-clash-backout.patch
new file mode 100644
index 0000000..1047240
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/libtirpc-name-clash-backout.patch
@@ -0,0 +1,21 @@
+Index: autofs-5.0.7/lib/rpc_subs.c
+===================================================================
+--- autofs-5.0.7.orig/lib/rpc_subs.c	2012-07-24 23:05:26.000000000 -0700
++++ autofs-5.0.7/lib/rpc_subs.c	2012-10-28 14:47:49.008382116 -0700
+@@ -34,16 +34,6 @@
+ #include <pthread.h>
+ #include <poll.h>
+ 
+-#ifdef WITH_LIBTIRPC
+-#undef auth_destroy
+-#define auth_destroy(auth)                                              \
+-                do {                                                    \
+-                        int refs;                                       \
+-                        if ((refs = auth_put((auth))) == 0)             \
+-                                ((*((auth)->ah_ops->ah_destroy))(auth));\
+-                } while (0)
+-#endif
+-
+ #include "mount.h"
+ #include "rpc_subs.h"
+ #include "automount.h"
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/libtirpc.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/libtirpc.patch
new file mode 100644
index 0000000..04f52c6
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/libtirpc.patch
@@ -0,0 +1,26 @@
+Index: autofs-5.0.7/aclocal.m4
+===================================================================
+--- autofs-5.0.7.orig/aclocal.m4	2012-10-28 13:17:45.504237027 -0700
++++ autofs-5.0.7/aclocal.m4	2012-10-28 13:20:50.108242739 -0700
+@@ -403,7 +403,7 @@
+ # save current flags
+ af_check_libtirpc_save_cflags="$CFLAGS"
+ af_check_libtirpc_save_ldflags="$LDFLAGS"
+-CFLAGS="$CFLAGS -I/usr/include/tirpc"
++CFLAGS="$CFLAGS -I=/usr/include/tirpc"
+ LDFLAGS="$LDFLAGS -ltirpc"
+ 
+ AC_TRY_LINK(
+Index: autofs-5.0.7/Makefile.rules
+===================================================================
+--- autofs-5.0.7.orig/Makefile.rules	2012-10-28 13:17:45.308237022 -0700
++++ autofs-5.0.7/Makefile.rules	2012-10-28 13:21:25.720242803 -0700
+@@ -48,7 +48,7 @@
+ LDFLAGS += -lpthread
+ 
+ ifdef TIRPCLIB
+-CFLAGS += -I/usr/include/tirpc
++CFLAGS += -I=/usr/include/tirpc
+ LDFLAGS += $(TIRPCLIB)
+ endif
+ 
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/no-bash.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/no-bash.patch
new file mode 100644
index 0000000..cf03635
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/no-bash.patch
@@ -0,0 +1,20 @@
+Index: autofs-5.0.7/samples/auto.net
+===================================================================
+--- autofs-5.0.7.orig/samples/auto.net	2012-07-24 23:05:26.000000000 -0700
++++ autofs-5.0.7/samples/auto.net	2012-10-28 10:44:25.035991715 -0700
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ # This file must be executable to work! chmod 755!
+ 
+Index: autofs-5.0.7/samples/auto.smb
+===================================================================
+--- autofs-5.0.7.orig/samples/auto.smb	2012-07-24 23:05:26.000000000 -0700
++++ autofs-5.0.7/samples/auto.smb	2012-10-28 10:44:25.035991715 -0700
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ # This file must be executable to work! chmod 755!
+ 
diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
new file mode 100644
index 0000000..5013e5e
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
@@ -0,0 +1,71 @@
+DESCRIPTION = "Kernel based automounter for linux."
+SECTION = "base"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+DEPENDS += "openldap libtirpc flex-native bison-native"
+
+inherit autotools systemd
+
+SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.bz2 \
+           file://autofs-5.0.7-fix-nobind-sun-escaped-map-entries.patch \
+           file://autofs-5.0.7-fix-use-cache-entry-after-free-mistake.patch \
+           file://autofs-5.0.7-fix-ipv6-proximity-calculation.patch \
+           file://autofs-5.0.7-fix-parse-buffer-initialization.patch \
+           file://autofs-5.0.7-fix-typo-in-automount-8.patch \
+           file://autofs-5.0.7-include-usage-in-usage-message.patch \
+           file://autofs-5.0.7-dont-wait-forever-to-restart.patch \
+           file://autofs-5.0.7-add-timeout-option-description-to-man-page.patch \
+           file://autofs-5.0.7-fix-null-map-entry-order-handling.patch \
+           file://autofs-5.0.7-make-description-of-default-MOUNT_WAIT-setting-clear.patch \
+           file://autofs-5.0.7-configure-in-allow-cross-compilation.patch \
+           file://autofs-5.0.7-README-update-mailing-list-subscription-info.patch \
+           file://autofs-5.0.7-allow-non-root-user-to-check-status.patch \
+           file://autofs-5.0.7-configure-allow-cross-compilation-update.patch \
+           file://autofs-5.0.6-fix-recursive-mount-deadlock.patch \
+           file://autofs-5.0.6-increase-file-map-read-buffer-size.patch \
+           file://autofs-5.0.7-handle-new-location-of-systemd.patch \
+           file://Makefile.rules-cross.patch \
+           file://no-bash.patch \
+           file://cross.patch \
+           file://libtirpc.patch \
+           file://libtirpc-name-clash-backout.patch \
+          "
+
+SRC_URI[md5sum] = "bc46838dece83c02d800ff144ed9f431"
+SRC_URI[sha256sum] = "08c4304d8076dc80c14df559bc5fd821b67ef3457b245f61068bd053d8f94ccc"
+
+inherit update-rc.d
+
+INITSCRIPT_NAME = "autofs"
+INITSCRIPT_PARAMS = "defaults"
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "autofs.service"
+
+# FIXME: modules/Makefile has crappy rules that don't obey LDFLAGS
+CFLAGS += "${LDFLAGS}"
+
+EXTRA_OEMAKE = "DONTSTRIP=1"
+EXTRA_OECONF += "--with-systemd --disable-mount-locking \
+                --enable-ignore-busy --with-openldap=no \
+                --with-sasl=no --with-libtirpc=yes \
+                --with-path=${STAGING_BINDIR_NATIVE} \
+                "
+CACHED_CONFIGUREVARS = "ac_cv_path_RANLIB=${RANLIB} \
+                        ac_cv_path_RPCGEN=rpcgen \
+                       "
+
+do_configure_prepend () {
+        if [ ! -e acinclude.m4 ]; then
+                cp aclocal.m4 acinclude.m4
+        fi
+}
+
+#do_install () {
+#        install -d ${D}${mandir}/man5 ${D}${mandir}/man8 \
+#                   ${D}${sbindir}
+#        oe_runmake 'INSTALLROOT=${D}' install
+#}
+
+INSANE_SKIP_${PN} = "dev-so"
-- 
1.7.9.5



