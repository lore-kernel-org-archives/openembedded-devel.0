Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CCF1B65DEB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 03:34:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7J3O2RI012326
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Aug 2014 20:34:54 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 18 Aug 2014 20:31:36 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Aug 2014 11:31:35 +0800
Message-ID: <1408419095-8164-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-networking] autofs: uprev it to 5.1.0
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
X-List-Received-Date: Tue, 19 Aug 2014 03:35:00 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1. Uprev it to 5.1.0, add remove the unneed patches
2. fix a building failure since not include stdarg.h
3. using pkg-config to check xml and krb5
4. force STRIP to empty to not strip the file

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...autofs-5.0.6-fix-recursive-mount-deadlock.patch |   78 ----
 ...-5.0.6-increase-file-map-read-buffer-size.patch |   38 --
 ...DME-update-mailing-list-subscription-info.patch |   56 ---
 .../autofs-5.0.7-add-symlink-pseudo-option.patch   |  217 ---------
 ...dd-timeout-option-description-to-man-page.patch |   42 --
 ...5.0.7-allow-non-root-user-to-check-status.patch |   69 ---
 ...witch_conf-to-not-contain-automount-lines.patch |   50 ---
 ...-configure-allow-cross-compilation-update.patch |   28 --
 ....0.7-configure-in-allow-cross-compilation.patch |   41 --
 ...s-5.0.7-depricate-nosymlink-pseudo-option.patch |   40 --
 ...-5.0.7-document-browse-option-in-man-page.patch |   46 --
 ....0.7-dont-fail-on-master-map-self-include.patch |   59 ---
 ....7-dont-schedule-new-alarms-after-readmap.patch |   69 ---
 ...ent-d_type-to-filter-out-files-in-scandir.patch |   41 --
 ...autofs-5.0.7-dont-wait-forever-to-restart.patch |   54 ---
 ...s-5.0.7-fix-automounter-support-on-parisc.patch |   24 -
 ...descriptor-leak-when-reloading-the-daemon.patch |  179 --------
 ...utofs-5.0.7-fix-init-script-status-return.patch |   39 --
 ...tofs-5.0.7-fix-ipv6-proximity-calculation.patch |  297 ------------
 .../autofs-5.0.7-fix-libtirpc-build-option.patch   |   66 ---
 ...-fix-map-entry-duplicate-offset-detection.patch |   37 --
 ...ofs-5.0.7-fix-nobind-man-page-description.patch |   46 --
 ...-5.0.7-fix-nobind-sun-escaped-map-entries.patch |   47 --
 ...s-5.0.7-fix-null-map-entry-order-handling.patch |   81 ----
 ...ofs-5.0.7-fix-parse-buffer-initialization.patch |   51 ---
 .../autofs-5.0.7-fix-requires-in-spec-file.patch   |   37 --
 .../autofs-5.0.7-fix-submount-offset-delete.patch  |   45 --
 ...ofs-5.0.7-fix-systemd-unidir-in-spec-file.patch |   72 ---
 .../autofs-5.0.7-fix-typo-in-automount-8.patch     |   37 --
 ....7-fix-use-cache-entry-after-free-mistake.patch |   49 --
 ....7-fix-use-get_proximity-without-libtirpc.patch |   54 ---
 ...s-5.0.7-fix-wildcard-multi-map-regression.patch |  225 ----------
 ...tofs-5.0.7-handle-new-location-of-systemd.patch |   57 ---
 ...tofs-5.0.7-include-usage-in-usage-message.patch |   25 --
 ...e-WITH_LDAP-conditional-around-LDAP-types.patch |  448 -------------------
 ...ption-of-default-MOUNT_WAIT-setting-clear.patch |   57 ---
 ...-5.0.7-make-yellow-pages-support-optional.patch |  156 -------
 ...odules-replicated-use-sin6.addr-s6_addr32.patch |   39 --
 .../autofs-5.0.7-update-kernel-include-files.patch |   92 ----
 ...-protocol-ids-instead-of-protoent-structs.patch |  471 --------------------
 ...karound-missing-GNU-versionsort-extension.patch |  149 -------
 ...emd-allow-with-systemd-to-take-a-path-arg.patch |    0
 .../Makefile.rules-cross.patch                     |    0
 .../autofs-5.1.0/add-the-needed-stdarg.h.patch     |   24 +
 .../autofs-5.0.7-do-not-check-for-modprobe.patch   |    0
 .../autofs-5.0.7-fix-lib-deps.patch                |    0
 ...7-include-linux-nfs.h-directly-in-rpc_sub.patch |    0
 .../autofs-additional-distros.patch                |    0
 .../{autofs-5.0.7 => autofs-5.1.0}/cross.patch     |    0
 .../fix_disable_ldap.patch                         |    0
 .../autofs/autofs-5.1.0/force-STRIP-to-emtpy.patch |   25 ++
 .../libtirpc-name-clash-backout.patch              |   25 +-
 .../{autofs-5.0.7 => autofs-5.1.0}/libtirpc.patch  |    4 +-
 .../{autofs-5.0.7 => autofs-5.1.0}/no-bash.patch   |    0
 ...-pkg-config-to-detect-libxml-2.0-and-krb5.patch |   39 ++
 .../autofs/{autofs_5.0.7.bb => autofs_5.1.0.bb}    |   54 +--
 56 files changed, 112 insertions(+), 3867 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.6-fix-recursive-mount-deadlock.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.6-increase-file-map-read-buffer-size.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-README-update-mailing-list-subscription-info.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-add-symlink-pseudo-option.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-add-timeout-option-description-to-man-page.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-allow-non-root-user-to-check-status.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-allow-nsswitch_conf-to-not-contain-automount-lines.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-configure-allow-cross-compilation-update.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-configure-in-allow-cross-compilation.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-depricate-nosymlink-pseudo-option.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-document-browse-option-in-man-page.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-dont-fail-on-master-map-self-include.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-dont-schedule-new-alarms-after-readmap.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-dont-use-dirent-d_type-to-filter-out-files-in-scandir.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-dont-wait-forever-to-restart.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-automounter-support-on-parisc.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-file-descriptor-leak-when-reloading-the-daemon.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-init-script-status-return.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-ipv6-proximity-calculation.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-libtirpc-build-option.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-map-entry-duplicate-offset-detection.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-nobind-man-page-description.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-nobind-sun-escaped-map-entries.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-null-map-entry-order-handling.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-parse-buffer-initialization.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-requires-in-spec-file.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-submount-offset-delete.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-systemd-unidir-in-spec-file.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-typo-in-automount-8.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-use-cache-entry-after-free-mistake.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-use-get_proximity-without-libtirpc.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-wildcard-multi-map-regression.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-handle-new-location-of-systemd.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-include-usage-in-usage-message.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-lib-defaults-use-WITH_LDAP-conditional-around-LDAP-types.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-make-description-of-default-MOUNT_WAIT-setting-clear.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-make-yellow-pages-support-optional.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-modules-replicated-use-sin6.addr-s6_addr32.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-update-kernel-include-files.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-use-numeric-protocol-ids-instead-of-protoent-structs.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-workaround-missing-GNU-versionsort-extension.patch
 rename meta-networking/recipes-daemons/autofs/{autofs-5.0.7 => autofs-5.1.0}/0001-systemd-allow-with-systemd-to-take-a-path-arg.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.0.7 => autofs-5.1.0}/Makefile.rules-cross.patch (100%)
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.1.0/add-the-needed-stdarg.h.patch
 rename meta-networking/recipes-daemons/autofs/{autofs-5.0.7 => autofs-5.1.0}/autofs-5.0.7-do-not-check-for-modprobe.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.0.7 => autofs-5.1.0}/autofs-5.0.7-fix-lib-deps.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.0.7 => autofs-5.1.0}/autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.0.7 => autofs-5.1.0}/autofs-additional-distros.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.0.7 => autofs-5.1.0}/cross.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.0.7 => autofs-5.1.0}/fix_disable_ldap.patch (100%)
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.1.0/force-STRIP-to-emtpy.patch
 rename meta-networking/recipes-daemons/autofs/{autofs-5.0.7 => autofs-5.1.0}/libtirpc-name-clash-backout.patch (59%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.0.7 => autofs-5.1.0}/libtirpc.patch (94%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.0.7 => autofs-5.1.0}/no-bash.patch (100%)
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.1.0/using-pkg-config-to-detect-libxml-2.0-and-krb5.patch
 rename meta-networking/recipes-daemons/autofs/{autofs_5.0.7.bb => autofs_5.1.0.bb} (36%)

diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.6-fix-recursive-mount-deadlock.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.6-fix-recursive-mount-deadlock.patch
deleted file mode 100644
index e6549a7..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.6-fix-recursive-mount-deadlock.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-autofs-5.0.6 - fix recursive mount deadlock
-
-From: Ian Kent <raven@themaw.net>
-
-Prior to the vfs-automount changes that went into 2.6.38
-and were finalized in 3.1 it was not possible to block
-path walks into multi-mounts whose root was covered by
-another mount. To deal with that a write lock was used
-to ensure the mount tree construction was completed. This
-restricts the types of recursively defined mount maps that
-can be used and can lead to a deadlock during lookup.
-
-Now that we can prevent processes walking into multi-mounts
-that are under construction we no longer need to use a
-write lock.
-
-Also, in the patch below, a cache writelock is changed to
-a read lock because a write lock isn't needed since the
-map cache entry isn't being updated.
----
-
- CHANGELOG       |    1 +
- daemon/direct.c |   14 ++++++++++++--
- 2 files changed, 13 insertions(+), 2 deletions(-)
-
-
-diff --git a/CHANGELOG b/CHANGELOG
-index 936c9ab..9cdad6e 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -12,6 +12,7 @@
- - configure.in: allow cross compilation.
- - README: update mailing list subscription info.
- - allow non root user to check status.
-+- fix recursive mount deadlock.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/daemon/direct.c b/daemon/direct.c
-index 7e2f0d7..3e09c5d 100644
---- a/daemon/direct.c
-+++ b/daemon/direct.c
-@@ -1285,6 +1285,8 @@ int handle_packet_missing_direct(struct autofs_point *ap, autofs_packet_missing_
- 	struct timespec wait;
- 	struct timeval now;
- 	int ioctlfd, len, state;
-+	unsigned int kver_major = get_kver_major();
-+	unsigned int kver_minor = get_kver_minor();
- 
- 	pthread_setcancelstate(PTHREAD_CANCEL_DISABLE, &state);
- 
-@@ -1297,8 +1299,16 @@ int handle_packet_missing_direct(struct autofs_point *ap, autofs_packet_missing_
- 	 * cache entry we will not be able to find the mapent. So
- 	 * we must take the source writelock to ensure the parent
- 	 * has mount is complete before we look for the entry.
-+	 *
-+	 * Since the vfs-automount kernel changes we can now block
-+	 * on covered mounts during mount tree construction so a
-+	 * write lock is no longer needed. So we now can handle a
-+	 * wider class of recursively define mount lookups.
- 	 */
--	master_source_writelock(ap->entry);
-+	if (kver_major > 5 || (kver_major == 5 && kver_minor > 1))
-+		master_source_readlock(ap->entry);
-+	else
-+		master_source_writelock(ap->entry);
- 	map = ap->entry->maps;
- 	while (map) {
- 		/*
-@@ -1311,7 +1321,7 @@ int handle_packet_missing_direct(struct autofs_point *ap, autofs_packet_missing_
- 		}
- 
- 		mc = map->mc;
--		cache_writelock(mc);
-+		cache_readlock(mc);
- 		me = cache_lookup_ino(mc, pkt->dev, pkt->ino);
- 		if (me)
- 			break;
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.6-increase-file-map-read-buffer-size.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.6-increase-file-map-read-buffer-size.patch
deleted file mode 100644
index 39b2221..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.6-increase-file-map-read-buffer-size.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-autofs-5.0.6 - increase file map read buffer size
-
-From: Ian Kent <raven@themaw.net>
-
-The file map entry read buffer can be too small for larger
-multi-mount map entries so increase it.
----
-
- CHANGELOG           |    1 +
- include/automount.h |    2 +-
- 2 files changed, 2 insertions(+), 1 deletions(-)
-
-
-diff --git a/CHANGELOG b/CHANGELOG
-index 9cdad6e..3bdf8a4 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -13,6 +13,7 @@
- - README: update mailing list subscription info.
- - allow non root user to check status.
- - fix recursive mount deadlock.
-+- increase file map read buffer size.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/include/automount.h b/include/automount.h
-index 561fcc2..37541f5 100644
---- a/include/automount.h
-+++ b/include/automount.h
-@@ -233,7 +233,7 @@ int rmdir_path(struct autofs_point *ap, const char *path, dev_t dev);
- #define AUTOFS_LOOKUP_VERSION 5
- 
- #define KEY_MAX_LEN    NAME_MAX
--#define MAPENT_MAX_LEN 4095
-+#define MAPENT_MAX_LEN 16384
- #define PARSE_MAX_BUF	KEY_MAX_LEN + MAPENT_MAX_LEN + 2
- 
- int lookup_nss_read_master(struct master *master, time_t age);
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-README-update-mailing-list-subscription-info.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-README-update-mailing-list-subscription-info.patch
deleted file mode 100644
index 99b6181..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-README-update-mailing-list-subscription-info.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-autofs-5.0.7 - README: update mailing list subscription info
-
-From: Chris Packham <chris.packham@alliedtelesis.co.nz>
-
-Following the kernel.org compromise the mailing list was moved to
-vger.kernel.org. Update the subscription info and add URLs for the gmane
-mailing list archive.
-
-Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
----
-
- CHANGELOG |    1 +
- README    |   17 ++++++++++++++---
- 2 files changed, 15 insertions(+), 3 deletions(-)
-
-
-diff --git a/CHANGELOG b/CHANGELOG
-index fe801e8..44c9fb2 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -10,6 +10,7 @@
- - fix null map entry order handling.
- - make description of default MOUNT_WAIT setting clear.
- - configure.in: allow cross compilation.
-+- README: update mailing list subscription info.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/README b/README
-index cef16a9..9024e64 100644
---- a/README
-+++ b/README
-@@ -43,9 +43,20 @@ Fitzhardinge's <jeremy@goop.org> work on autofs 3. Further enhancements
- have been made by Ian Kent <raven@themaw.net>.
- 
- If you use or want to help develop autofs, please join the autofs
--mailing list by visiting:
-+mailing list by sending an email to:
- 
--	http://linux.kernel.org/mailman/listinfo/autofs
-+	majordomo@vger.kernel.org
- 
--and folling the instructions there to subscribe to the autofs mailing list.
-+With the body text:
-+
-+	subscribe autofs
-+
-+Once subscribed you can send patches to:
-+
-+	autofs@vger.kernel.org
-+
-+The autofs mailing list archive can be viewed on gmane:
-+
-+	http://news.gmane.org/gmane.linux.kernel.autofs
-+	http://blog.gmane.org/gmane.linux.kernel.autofs
- 
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-add-symlink-pseudo-option.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-add-symlink-pseudo-option.patch
deleted file mode 100644
index b0440f4..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-add-symlink-pseudo-option.patch
+++ /dev/null
@@ -1,217 +0,0 @@
-autofs-5.0.7 - add symlink pseudo option
-
-From: Ian Kent <raven@themaw.net>
-
-Add a "symlink" pseudo option to tell the bind mount module to symlink
-instead of bind when mounting mounts other than direct mounts and
-non-root indirect mount offset mounts (aka. non-root multi-mount
-entries).
----
- CHANGELOG              |    1 +
- include/automount.h    |    3 +++
- lib/master_parse.y     |    8 +++++++-
- lib/master_tok.l       |    1 +
- man/auto.master.5.in   |    8 ++++++++
- modules/mount_autofs.c |    5 +++++
- modules/mount_bind.c   |   36 +++++++++++++++++++++++++++++++++++-
- 7 files changed, 60 insertions(+), 2 deletions(-)
-
-diff --git a/CHANGELOG b/CHANGELOG
-index c189483..247d334 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -32,6 +32,7 @@
- - fix wildcard multi map regression.
- - fix file descriptor leak when reloading the daemon.
- - depricate nosymlink pseudo option.
-+- add symlink pseudo option.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/include/automount.h b/include/automount.h
-index 37541f5..e72fa0d 100644
---- a/include/automount.h
-+++ b/include/automount.h
-@@ -455,6 +455,9 @@ struct kernel_mod_version {
- /* Don't use bind mounts even when system supports them */
- #define MOUNT_FLAG_NOBIND		0x0020
- 
-+/* Use symlinks instead of bind mounting local mounts */
-+#define MOUNT_FLAG_SYMLINK		0x0040
-+
- struct autofs_point {
- 	pthread_t thid;
- 	char *path;			/* Mount point name */
-diff --git a/lib/master_parse.y b/lib/master_parse.y
-index f925b5a..11caf5b 100644
---- a/lib/master_parse.y
-+++ b/lib/master_parse.y
-@@ -57,6 +57,7 @@ static char *type;
- static char *format;
- static long timeout;
- static long negative_timeout;
-+static unsigned symlnk;
- static unsigned nobind;
- static unsigned ghost;
- extern unsigned global_selection_options;
-@@ -100,7 +101,7 @@ static int master_fprintf(FILE *, char *, ...);
- %token COMMENT
- %token MAP
- %token OPT_TIMEOUT OPT_NTIMEOUT OPT_NOBIND OPT_NOGHOST OPT_GHOST OPT_VERBOSE
--%token OPT_DEBUG OPT_RANDOM OPT_USE_WEIGHT
-+%token OPT_DEBUG OPT_RANDOM OPT_USE_WEIGHT OPT_SYMLINK
- %token COLON COMMA NL DDASH
- %type <strtype> map
- %type <strtype> options
-@@ -186,6 +187,7 @@ line:
- 	| PATH OPT_USE_WEIGHT { master_notify($1); YYABORT; }
- 	| PATH OPT_DEBUG { master_notify($1); YYABORT; }
- 	| PATH OPT_TIMEOUT { master_notify($1); YYABORT; }
-+	| PATH OPT_SYMLINK { master_notify($1); YYABORT; }
- 	| PATH OPT_NOBIND { master_notify($1); YYABORT; }
- 	| PATH OPT_GHOST { master_notify($1); YYABORT; }
- 	| PATH OPT_NOGHOST { master_notify($1); YYABORT; }
-@@ -557,6 +559,7 @@ option: daemon_option
- 
- daemon_option: OPT_TIMEOUT NUMBER { timeout = $2; }
- 	| OPT_NTIMEOUT NUMBER { negative_timeout = $2; }
-+	| OPT_SYMLINK	{ symlnk = 1; }
- 	| OPT_NOBIND	{ nobind = 1; }
- 	| OPT_NOGHOST	{ ghost = 0; }
- 	| OPT_GHOST	{ ghost = 1; }
-@@ -627,6 +630,7 @@ static void local_init_vars(void)
- 	debug = 0;
- 	timeout = -1;
- 	negative_timeout = 0;
-+	symlnk = 0;
- 	nobind = 0;
- 	ghost = defaults_get_browse_mode();
- 	random_selection = global_selection_options & MOUNT_FLAG_RANDOM_SELECT;
-@@ -811,6 +815,8 @@ int master_parse_entry(const char *buffer, unsigned int default_timeout, unsigne
- 		entry->ap->flags |= MOUNT_FLAG_RANDOM_SELECT;
- 	if (use_weight)
- 		entry->ap->flags |= MOUNT_FLAG_USE_WEIGHT_ONLY;
-+	if (symlnk)
-+		entry->ap->flags |= MOUNT_FLAG_SYMLINK;
- 	if (negative_timeout)
- 		entry->ap->negative_timeout = negative_timeout;
- 
-diff --git a/lib/master_tok.l b/lib/master_tok.l
-index 30abb15..f9b4e55 100644
---- a/lib/master_tok.l
-+++ b/lib/master_tok.l
-@@ -361,6 +361,7 @@ OPTNTOUT	(-n{OPTWS}|-n{OPTWS}={OPTWS}|--negative-timeout{OPTWS}|--negative-timeo
- 		return(NUMBER);
- 	}
- 
-+	-?symlink		{ return(OPT_SYMLINK); }
- 	-?nobind		{ return(OPT_NOBIND); }
- 	-?nobrowse		{ return(OPT_NOGHOST); }
- 	-g|--ghost|-?browse	{ return(OPT_GHOST); }
-diff --git a/man/auto.master.5.in b/man/auto.master.5.in
-index 8007542..bbea43a 100644
---- a/man/auto.master.5.in
-+++ b/man/auto.master.5.in
-@@ -159,6 +159,14 @@ on individual map entries of both types. Bind mounting of NFS file
- systems can also be prevented for specific map entrys by adding the
- "port=" mount option to the entries.
- .TP
-+.I "symlink"
-+This option makes bind mounting use a symlink instead of an actual bind
-+mount. It is an autofs specific option that is a pseudo mount option and
-+so is given without a leading dash. It may be used with indirect map
-+entries only, either in the master map (so it effects all map entries)
-+or with individual map entries. The option is ignored for direct mounts
-+and non-root offest mount entries.
-+.TP
- .I "\-r, \-\-random-multimount-selection"
- Enables the use of ramdom selection when choosing a host from a
- list of replicated servers. This option is applied to this mount
-diff --git a/modules/mount_autofs.c b/modules/mount_autofs.c
-index ef16020..8c1e600 100644
---- a/modules/mount_autofs.c
-+++ b/modules/mount_autofs.c
-@@ -51,6 +51,7 @@ int mount_mount(struct autofs_point *ap, const char *root, const char *name,
- 	int argc, status;
- 	int nobind = ap->flags & MOUNT_FLAG_NOBIND;
- 	int ghost = ap->flags & MOUNT_FLAG_GHOST;
-+	int symlnk = ap->flags & MOUNT_FLAG_SYMLINK;
- 	time_t timeout = ap->entry->maps->exp_timeout;
- 	unsigned logopt = ap->logopt;
- 	struct map_type_info *info;
-@@ -120,6 +121,8 @@ int mount_mount(struct autofs_point *ap, const char *root, const char *name,
- 				nobind = 1;
- 			else if (strncmp(cp, "browse", 6) == 0)
- 				ghost = 1;
-+			else if (strncmp(cp, "symlink", 7) == 0)
-+				symlnk = 1;
- 			else if (strncmp(cp, "timeout=", 8) == 0) {
- 				char *val = strchr(cp, '=');
- 				unsigned tout;
-@@ -158,6 +161,8 @@ int mount_mount(struct autofs_point *ap, const char *root, const char *name,
- 	}
- 	nap = entry->ap;
- 	nap->parent = ap;
-+	if (symlnk)
-+		nap->flags |= MOUNT_FLAG_SYMLINK;
- 
- 	argc = 1;
- 
-diff --git a/modules/mount_bind.c b/modules/mount_bind.c
-index 9bce686..4975294 100644
---- a/modules/mount_bind.c
-+++ b/modules/mount_bind.c
-@@ -73,10 +73,44 @@ int mount_mount(struct autofs_point *ap, const char *root, const char *name, int
- 	char buf[MAX_ERR_BUF];
- 	int err;
- 	int i, len;
-+	int symlnk = (*name != '/' && (ap->flags & MOUNT_FLAG_SYMLINK));
- 
- 	if (ap->flags & MOUNT_FLAG_REMOUNT)
- 		return 0;
- 
-+	/* Extract "symlink" pseudo-option which forces local filesystems
-+	 * to be symlinked instead of bound.
-+	 */
-+	if (*name != '/' && !symlnk && options) {
-+		const char *comma;
-+		int o_len = strlen(options) + 1;
-+
-+		for (comma = options; *comma != '\0';) {
-+			const char *cp;
-+			const char *end;
-+
-+			while (*comma == ',')
-+				comma++;
-+
-+			/* Skip leading white space */
-+			while (*comma == ' ' || *comma == '\t')
-+				comma++;
-+
-+			cp = comma;
-+			while (*comma != '\0' && *comma != ',')
-+				comma++;
-+
-+			/* Skip trailing white space */
-+			end = comma - 1;
-+			while (*comma == ' ' || *comma == '\t')
-+				end--;
-+
-+			o_len = end - cp + 1;
-+			if (strncmp("symlink", cp, o_len) == 0)
-+				symlnk = 1;
-+		}
-+	}
-+
- 	/* Root offset of multi-mount */
- 	len = strlen(root);
- 	if (root[len - 1] == '/') {
-@@ -100,7 +134,7 @@ int mount_mount(struct autofs_point *ap, const char *root, const char *name, int
- 	if (options == NULL || *options == '\0')
- 		options = "defaults";
- 
--	if (bind_works) {
-+	if (!symlnk && bind_works) {
- 		int status, existed = 1;
- 
- 		debug(ap->logopt, MODPREFIX "calling mkdir_path %s", fullpath);
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-add-timeout-option-description-to-man-page.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-add-timeout-option-description-to-man-page.patch
deleted file mode 100644
index ac598dd..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-add-timeout-option-description-to-man-page.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-autofs-5.0.7 - add timeout option description to man page
-
-From: Ian Kent <ikent@redhat.com>
-
-The pseudo option used t set the timeout for map entries is one of
-the most most frequently used autofs options but is not mentioned
-in auto.master(5).
----
-
- CHANGELOG            |    1 +
- man/auto.master.5.in |    5 +++++
- 2 files changed, 6 insertions(+), 0 deletions(-)
-
-
-diff --git a/CHANGELOG b/CHANGELOG
-index 93b9c26..7b8d185 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -6,6 +6,7 @@
- - fix parse buffer initialization.
- - fix typo in automount(8).
- - dont wait forever to restart.
-+- add timeout option description to man page.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/man/auto.master.5.in b/man/auto.master.5.in
-index 54269f8..21d7544 100644
---- a/man/auto.master.5.in
-+++ b/man/auto.master.5.in
-@@ -167,6 +167,11 @@ server is specified in the map entry. If no server weights are given
- then each available server will be tried in the order listed, within
- proximity.
- .TP
-+.I "\-t, \-\-timeout <seconds>"
-+Set the expire timeout for map entries. This option can be used to
-+override the global default given either on the command line
-+or in the configuration.
-+.TP
- .I "\-n, \-\-negative\-timeout <seconds>"
- Set the timeout for caching failed key lookups. This option can be
- used to override the global default given either on the command line
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-allow-non-root-user-to-check-status.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-allow-non-root-user-to-check-status.patch
deleted file mode 100644
index 6020c31..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-allow-non-root-user-to-check-status.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-autofs-5.0.7 - allow non root user to check status
-
-From: Ian Kent <ikent@redhat.com>
-
-
----
-
- CHANGELOG             |    1 +
- redhat/autofs.init.in |   20 +++++++++++++-------
- 2 files changed, 14 insertions(+), 7 deletions(-)
-
-
-diff --git a/CHANGELOG b/CHANGELOG
-index 44c9fb2..936c9ab 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -11,6 +11,7 @@
- - make description of default MOUNT_WAIT setting clear.
- - configure.in: allow cross compilation.
- - README: update mailing list subscription info.
-+- allow non root user to check status.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/redhat/autofs.init.in b/redhat/autofs.init.in
-index cd5cb34..fe18b3e 100644
---- a/redhat/autofs.init.in
-+++ b/redhat/autofs.init.in
-@@ -167,6 +167,19 @@ function usage_message() {
- 
- RETVAL=0
- 
-+# allow non-root users to read status / usage
-+
-+case "$1" in
-+	status)
-+		status -p @@autofspiddir@@/autofs.pid -l autofs $prog
-+		exit 0;
-+		;;
-+	usage)
-+		usage_message
-+		exit 0;
-+		;;
-+esac
-+
- # Only the root user may change the service status
- if [ `id -u` -ne 0 ] && [ "$1" != "status" ]; then
- 	echo "insufficient privilege to change service status"
-@@ -184,9 +197,6 @@ case "$1" in
- 	stop)
- 		stop
- 		;;
--	status)
--		status -p @@autofspiddir@@/autofs.pid -l autofs $prog
--		;;
- 	restart|force-reload)
- 		restart
- 		;;
-@@ -202,10 +212,6 @@ case "$1" in
- 			restart
- 		fi
- 		;;
--	usage)
--		usage_message
--		exit 0
--		;;
- 	*)
- 		usage_message
- 		exit 2
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-allow-nsswitch_conf-to-not-contain-automount-lines.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-allow-nsswitch_conf-to-not-contain-automount-lines.patch
deleted file mode 100644
index c342d10..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-allow-nsswitch_conf-to-not-contain-automount-lines.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-autofs-5.0.7 - Allow nsswitch.conf to not contain "automount:" lines
-
-From: Michael Tokarev <mjt@tls.msk.ru>
-
-Current code does not allow a case when nsswitch.conf
-does not mention automount map at all, like all new
-installations.  It logs a rather unpleasant error
-message instead:
-
- syntax error in nsswitch config near [ syntax error ]
-
-this patch has a minimal fix, to allo "file" to be empty.
-
-Whole parser in C is about 25 lines of code, the "grammar"
-is trivial, and it is better to ditch all this yacc/lex
-stuff, but that will be much more intrusive change.
-
-Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
-Cc: 682266@bugs.debian.org
----
-
- CHANGELOG       |    1 +
- lib/nss_parse.y |    1 +
- 2 files changed, 2 insertions(+), 0 deletions(-)
-
-
-diff --git a/CHANGELOG b/CHANGELOG
-index bd0dd82..16ac2a0 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -16,6 +16,7 @@
- - increase file map read buffer size.
- - handle new location of systemd.
- - fix map entry duplicate offset detection.
-+- Allow nsswitch.conf to not contain "automount:" lines.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/lib/nss_parse.y b/lib/nss_parse.y
-index a39fda4..055e9d7 100644
---- a/lib/nss_parse.y
-+++ b/lib/nss_parse.y
-@@ -72,6 +72,7 @@ file: {
- 		nss_debug = YYDEBUG;
- #endif
- 	} sources NL
-+	| /* empty */
- 	;
- 
- sources: nss_source
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-configure-allow-cross-compilation-update.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-configure-allow-cross-compilation-update.patch
deleted file mode 100644
index a8bc3ce..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-configure-allow-cross-compilation-update.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-autofs-5.0.7 - configure: allow cross compilation update
-
-From: Chris Packham <chris.packham@alliedtelesis.co.nz>
-
-Run "make distclean" to update configure. This should have been included
-in 5936c738 when configure.in was updated but it was missed.
----
-
- configure |    5 +----
- 1 files changed, 1 insertions(+), 4 deletions(-)
-
-
-diff --git a/configure b/configure
-index bf62203..ba3bba6 100755
---- a/configure
-+++ b/configure
-@@ -5378,10 +5378,7 @@ DAEMON_LDFLAGS=
- { $as_echo "$as_me:${as_lineno-$LINENO}: checking whether gcc -fPIE works" >&5
- $as_echo_n "checking whether gcc -fPIE works... " >&6; }
- if test "$cross_compiling" = yes; then :
--  { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
--$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
--as_fn_error $? "cannot run test program while cross compiling
--See \`config.log' for more details" "$LINENO" 5; }
-+  gcc_supports_pie=no
- else
-   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
- /* end confdefs.h.  */
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-configure-in-allow-cross-compilation.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-configure-in-allow-cross-compilation.patch
deleted file mode 100644
index ac18bd9..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-configure-in-allow-cross-compilation.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-autofs-5.0.7 - configure.in: allow cross compilation
-
-From: Chris Packham <chris.packham@alliedtelesis.co.nz>
-
-The default behaviour of AC_RUN_IFELSE is to stop with an error if cross
-compiling. Avoid this by providing the optional 4th argument to set
-gcc_supports_pie=no if support for PIE cannot be detected.
-
-Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
----
-
- CHANGELOG    |    1 +
- configure.in |    2 +-
- 2 files changed, 2 insertions(+), 1 deletions(-)
-
-
-diff --git a/CHANGELOG b/CHANGELOG
-index 961e340..fe801e8 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -9,6 +9,7 @@
- - add timeout option description to man page.
- - fix null map entry order handling.
- - make description of default MOUNT_WAIT setting clear.
-+- configure.in: allow cross compilation.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/configure.in b/configure.in
-index 1a24e34..90bda62 100644
---- a/configure.in
-+++ b/configure.in
-@@ -307,7 +307,7 @@ DAEMON_CFLAGS=
- DAEMON_LDFLAGS=
- AC_MSG_CHECKING([whether gcc -fPIE works])
- AC_RUN_IFELSE([AC_LANG_PROGRAM([[]], [[int main(void) {return 0;}]])],
--	      [gcc_supports_pie=yes], [gcc_supports_pie=no])
-+	      [gcc_supports_pie=yes], [gcc_supports_pie=no], [gcc_supports_pie=no])
- AC_MSG_RESULT([$gcc_supports_pie])
- if test $gcc_supports_pie = yes ; then
- 	DAEMON_CFLAGS="-fPIE"
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-depricate-nosymlink-pseudo-option.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-depricate-nosymlink-pseudo-option.patch
deleted file mode 100644
index c784de7..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-depricate-nosymlink-pseudo-option.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-autofs-5.0.7 - depricate nosymlink pseudo option
-
-From: Ian Kent <raven@themaw.net>
-
-The undocumented "nosymlink" option was the only way to force local
-NFS mounting until the more descriptive "nobind" option was added.
-
-So depricate the "nosymlink" option in favour of the "nobind" option.
----
- CHANGELOG           |    1 +
- modules/mount_nfs.c |    4 ++++
- 2 files changed, 5 insertions(+)
-
-diff --git a/CHANGELOG b/CHANGELOG
-index a7ed212..c189483 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -31,6 +31,7 @@
- - dont fail on master map self include.
- - fix wildcard multi map regression.
- - fix file descriptor leak when reloading the daemon.
-+- depricate nosymlink pseudo option.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/modules/mount_nfs.c b/modules/mount_nfs.c
-index bbbb1de..e61320b 100644
---- a/modules/mount_nfs.c
-+++ b/modules/mount_nfs.c
-@@ -125,6 +125,10 @@ int mount_mount(struct autofs_point *ap, const char *root, const char *name, int
- 
- 			o_len = end - cp + 1;
- 			if (strncmp("nosymlink", cp, o_len) == 0) {
-+				warn(ap->logopt, MODPREFIX
-+				     "the \"nosymlink\" option is depricated "
-+				     "and will soon be removed, "
-+				     "use the \"nobind\" option instead");
- 				nosymlink = 1;
- 			} else if (strncmp("nobind", cp, o_len) == 0) {
- 				nobind = 1;
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-document-browse-option-in-man-page.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-document-browse-option-in-man-page.patch
deleted file mode 100644
index 4641342..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-document-browse-option-in-man-page.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-autofs-5.0.7 - document browse option in man page
-
-From: Ian Kent <raven@themaw.net>
-
-The "browse" option has remained undocumented for a long time.
-Finally add a section for it to auto.master(5) making special
-note of the potential performance implications.
----
- CHANGELOG            |    1 +
- man/auto.master.5.in |   11 +++++++++++
- 2 files changed, 12 insertions(+)
-
-diff --git a/CHANGELOG b/CHANGELOG
-index ecdea0b..d8e4049 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -36,6 +36,7 @@
- - fix requires in spec file.
- - fix libtirpc build option to require libtirpc-devel if needed.
- - fix systemd unidir in spec file.
-+- document browse option in man page.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/man/auto.master.5.in b/man/auto.master.5.in
-index bbea43a..c552e56 100644
---- a/man/auto.master.5.in
-+++ b/man/auto.master.5.in
-@@ -147,6 +147,17 @@ multiple file systems should be mounted (`multimounts'). If this option
- is given, no file system is mounted at all if at least one file system
- can't be mounted.
- .TP
-+.I "[no]browse"
-+This is an autofs specific option that is a pseudo mount option and
-+so is given without a leading dash. Use of the browse option pre-creates
-+mount point directories for indirect mount maps so the map keys can be
-+seen in a directory listing without being mounted. Use of this option
-+can cause performance problem if the indirect map is large so it should
-+be used with caution. The internal program default is to enable browse
-+mode for indirect mounts but the default installed configuration overrides
-+this by setting BROWSE_MODE to "no" because of the potential performance
-+problem.
-+.TP
- .I "nobind"
- This is an autofs specific option that is a pseudo mount option and
- so is given without a leading dash. It may be used either in the master
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-dont-fail-on-master-map-self-include.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-dont-fail-on-master-map-self-include.patch
deleted file mode 100644
index afb908b..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-dont-fail-on-master-map-self-include.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-autofs-5.0.7 - dont fail on master map self include
-
-From: Ian Kent <raven@themaw.net>
-
-When reading the master map a self included file map should skip the source
-and proceed to the next so, in this case, return an nss status that will
-allow the map read to continue. In particular not NSS_STATUS_UNAVAIL which
-causes the lookup to record a failure or NSS_STATUS_SUCCESS which indicates
-a successful lookup and termintes the reading of sources.
----
- CHANGELOG             |    1 +
- modules/lookup_file.c |    7 ++++---
- 2 files changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/CHANGELOG b/CHANGELOG
-index 39388a5..97d6f48 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -28,6 +28,7 @@
- - make yellow pages support optional.
- - modules/replicated.c: use sin6_addr.s6_addr32.
- - workaround missing GNU versionsort extension.
-+- dont fail on master map self include.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/modules/lookup_file.c b/modules/lookup_file.c
-index facb305..f37bed9 100644
---- a/modules/lookup_file.c
-+++ b/modules/lookup_file.c
-@@ -397,8 +397,9 @@ int lookup_read_master(struct master *master, time_t age, void *context)
- 	unsigned int path_len, ent_len;
- 	int entry, cur_state;
- 
-+	/* Don't return fail on self include, skip source */
- 	if (master->recurse)
--		return NSS_STATUS_UNAVAIL;
-+		return NSS_STATUS_TRYAGAIN;
- 
- 	if (master->depth > MAX_INCLUDE_DEPTH) {
- 		error(logopt, MODPREFIX
-@@ -443,7 +444,7 @@ int lookup_read_master(struct master *master, time_t age, void *context)
- 
- 			inc = check_master_self_include(master, ctxt);
- 			if (inc) 
--				master->recurse = 1;;
-+				master->recurse = 1;
- 			master->depth++;
- 			status = lookup_nss_read_master(master, age);
- 			if (!status) {
-@@ -645,7 +646,7 @@ int lookup_read_map(struct autofs_point *ap, time_t age, void *context)
- 	mc = source->mc;
- 
- 	if (source->recurse)
--		return NSS_STATUS_UNAVAIL;
-+		return NSS_STATUS_TRYAGAIN;
- 
- 	if (source->depth > MAX_INCLUDE_DEPTH) {
- 		error(ap->logopt,
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-dont-schedule-new-alarms-after-readmap.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-dont-schedule-new-alarms-after-readmap.patch
deleted file mode 100644
index 6444687..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-dont-schedule-new-alarms-after-readmap.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-autofs-5.0.7 - don't schedule new alarms after readmap
-
-From: Leonardo Chiquitto <leonardo.lists@gmail.com>
-
-Currently, a new alarm is scheduled every time the daemon receives
-a SIGHUP (map re-read) or SIGUSR1 (forced expiration). Besides that,
-map re-reads started on demand when a map is found to be outdated
-also generate a new alarm.
-
-Once added, these alarms are never deleted and hence increase the
-number of times the daemon wakes up to run the expiration procedure.
-After a couple of months, in setups with many mount points, it's
-normal to see automount waking up every second to handle the
-expiration timer.
-
-This patch removes the alarm scheduling from the readmap cleanup
-routine and makes sure the alarm is re-added after the expiration
-process only when it was not triggered by SIGUSR1.
-
-I couldn't think of any use case to justify keeping these alarms:
-it's critical to have the alarm ticking every timeout/4 seconds,
-but more than one periodic alarm running doesn't seem to make
-sense.
----
-
- CHANGELOG      |    1 +
- daemon/state.c |    6 +-----
- 2 files changed, 2 insertions(+), 5 deletions(-)
-
-
-diff --git a/CHANGELOG b/CHANGELOG
-index c9be73e..4cf5621 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -22,6 +22,7 @@
- - fix init script status return.
- - fix use get_proximity() without libtirpc.
- - don't use dirent d_type to filter out files in scandir()
-+- don't schedule new alarms after readmap.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/daemon/state.c b/daemon/state.c
-index b451c56..6e23022 100644
---- a/daemon/state.c
-+++ b/daemon/state.c
-@@ -144,7 +144,7 @@ void expire_cleanup(void *arg)
- 					ap->submount = 2;
- 			}
- 
--			if (!ap->submount)
-+			if (ap->state == ST_EXPIRE && !ap->submount)
- 				alarm_add(ap, ap->exp_runfreq);
- 
- 			/* FALLTHROUGH */
-@@ -330,13 +330,9 @@ static void do_readmap_cleanup(void *arg)
- 	ap = ra->ap;
- 
- 	st_mutex_lock();
--
- 	ap->readmap_thread = 0;
- 	st_set_done(ap);
--	if (!ap->submount)
--		alarm_add(ap, ap->exp_runfreq);
- 	st_ready(ap);
--
- 	st_mutex_unlock();
- 
- 	free(ra);
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-dont-use-dirent-d_type-to-filter-out-files-in-scandir.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-dont-use-dirent-d_type-to-filter-out-files-in-scandir.patch
deleted file mode 100644
index 9c9d99b..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-dont-use-dirent-d_type-to-filter-out-files-in-scandir.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-autofs-5.0.7 - don't use dirent d_type to filter out files in scandir()
-
-From: Leonardo Chiquitto <leonardo.lists@gmail.com>
-
-The "d_type" field of a dirent structure is not filled in by all
-file systems (XFS being one example), so we can't rely on it to
-check file types.
----
-
- CHANGELOG            |    1 +
- modules/lookup_dir.c |    4 ----
- 2 files changed, 1 insertions(+), 4 deletions(-)
-
-
-diff --git a/CHANGELOG b/CHANGELOG
-index 460bd27..c9be73e 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -21,6 +21,7 @@
- - fix submount offset delete.
- - fix init script status return.
- - fix use get_proximity() without libtirpc.
-+- don't use dirent d_type to filter out files in scandir()
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/modules/lookup_dir.c b/modules/lookup_dir.c
-index 658cc29..33901c0 100644
---- a/modules/lookup_dir.c
-+++ b/modules/lookup_dir.c
-@@ -103,10 +103,6 @@ static int acceptable_dirent_p(const struct dirent *e)
- {
-   size_t namesz;
- 
--
--  if (!(e->d_type == DT_REG || e->d_type == DT_LNK))
--	  return 0;
--
-   namesz = strlen(e->d_name);
-   if (!namesz)
- 	  return 0;
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-dont-wait-forever-to-restart.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-dont-wait-forever-to-restart.patch
deleted file mode 100644
index 9973b47..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-dont-wait-forever-to-restart.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-autofs-5.0.7 - dont wait forever to restart
-
-From: Ian Kent <ikent@redhat.com>
-
-When restarting autofs the daemon must be stopped before it is started
-again if it is to function properly. At the moment the init script waits
-forever which is not ok if the daemon won't exit for some reason.
-
-So, if the daemon is still running after the stop, run stop() again, wait
-a bit longer and if it still hasn't stopped kill it with a SIGKILL to clear
-the way for the startup.
----
-
- CHANGELOG             |    1 +
- redhat/autofs.init.in |   13 ++++++++++---
- 2 files changed, 11 insertions(+), 3 deletions(-)
-
-
-diff --git a/CHANGELOG b/CHANGELOG
-index 6051723..93b9c26 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -5,6 +5,7 @@
- - fix ipv6 proximity calculation.
- - fix parse buffer initialization.
- - fix typo in automount(8).
-+- dont wait forever to restart.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/redhat/autofs.init.in b/redhat/autofs.init.in
-index ec6d5d6..cd5cb34 100644
---- a/redhat/autofs.init.in
-+++ b/redhat/autofs.init.in
-@@ -129,9 +129,16 @@ function restart() {
- 	status autofs > /dev/null 2>&1
- 	if [ $? -eq 0 ]; then
- 		stop
--		while [ -n "`pidof $prog`" ] ; do
--			sleep 5
--		done
-+		if [ -n "`pidof $prog`" ]; then
-+			# If we failed to stop, try at least one more time
-+			# after waiting a little while
-+			sleep 20
-+			stop
-+			auto_pid=`pidof $prog`
-+			if [ -n "$auto_pid" ]; then
-+				kill -9 $auto_pid
-+			fi
-+		fi
- 	fi
- 	start
- }
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-automounter-support-on-parisc.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-automounter-support-on-parisc.patch
deleted file mode 100644
index e00fdc1..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-automounter-support-on-parisc.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-autofs-5.0.7 - fix automounter support on parisc
-
-From: Helge Deller <deller@gmx.de>
-
-This patch fixes automounter support on the parisc architecture with
-64-bit kernel and 32-bit userspace.
-
-Signed-off-by: Helge Deller <deller@gmx.de>
----
- daemon/automount.c |    1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/daemon/automount.c b/daemon/automount.c
-index 4a3eb3d..4c651cf 100644
---- a/daemon/automount.c
-+++ b/daemon/automount.c
-@@ -610,6 +610,7 @@ static size_t get_kpkt_len(void)
- 		if (strcmp(un.machine, "alpha") == 0 ||
- 		    strcmp(un.machine, "ia64") == 0 ||
- 		    strcmp(un.machine, "x86_64") == 0 ||
-+		    strcmp(un.machine, "parisc64") == 0 ||
- 		    strcmp(un.machine, "ppc64") == 0)
- 			pkt_len += 4;
- 
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-file-descriptor-leak-when-reloading-the-daemon.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-file-descriptor-leak-when-reloading-the-daemon.patch
deleted file mode 100644
index 8ce6c0f..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-file-descriptor-leak-when-reloading-the-daemon.patch
+++ /dev/null
@@ -1,179 +0,0 @@
-autofs-5.0.7 - fix file descriptor leak when reloading the daemon
-
-From: Leonardo Chiquitto <leonardo.lists@gmail.com>
-
-A customer reported that AutoFS may leak file descriptors when some
-maps are modified and the daemon reloaded. I'm able to reproduce the
-problem on 5.0.7 by following these steps:
-
-1. Configure a simple direct mount:
-
-# cat /etc/auto.master
-/-	/etc/auto.direct
-
-# cat /etc/auto.direct
-/nfs   server:/nfs
-
-2. Start the automounter and do NOT trigger the mount
-
-3. Replace /etc/auto.direct with:
-
-# cat /etc/auto.direct
-/nfs/1  server:/nfs
-/nfs/2  server:/nfs
-
-4. Reload:
-
-# kill -HUP $(pidof automount)
-
->From now on, every reload will leak a file descriptor:
-
-# ls -la /proc/$(pidof automount)/fd | grep /nfs
-lr-x------ 1 root root 64 Aug 14 22:08 11 -> /nfs
-lr-x------ 1 root root 64 Aug 14 22:08 12 -> /nfs
-lr-x------ 1 root root 64 Aug 14 22:08 13 -> /nfs
-lr-x------ 1 root root 64 Aug 14 22:08 14 -> /nfs
-lr-x------ 1 root root 64 Aug 14 22:08 5 -> /nfs
-
-I've investigated the problem and discovered that the leak happens in
-do_umount_autofs_direct():
-
-- edit imk
-The same leak is present in umount_autofs_offset() also.
-Updated patch to cover that too.
-- end edit
-
-int do_umount_autofs_direct(struct autofs_point *ap, struct mnt_list
-*mnts, struct mapent *me)
-{
-(...)
-	if (me->ioctlfd != -1) {
-		if (tree_is_mounted(mnts, me->key, MNTS_REAL)) {
-			error(ap->logopt,
-			      "attempt to umount busy direct mount %s",
-			      me->key);
-			return 1;
-		}
-		ioctlfd = me->ioctlfd;
-	} else	// ioctlfd == -1
-		ops->open(ap->logopt, &ioctlfd, me->dev, me->key);  <= we open it here
-
-	if (ioctlfd >= 0) {
-		unsigned int status = 1;
-
-		rv = ops->askumount(ap->logopt, ioctlfd, &status);
-				/// at this point, rv == 0 and status == 0
-		if (rv) {
-			char *estr = strerror_r(errno, buf, MAX_ERR_BUF);
-			error(ap->logopt, "ioctl failed: %s", estr);
-			return 1;
-		} else if (!status) {
-				/// at this point, ap->state == ST_READMAP
-			if (ap->state != ST_SHUTDOWN_FORCE) {
-				error(ap->logopt,
-				      "ask umount returned busy for %s",
-				      me->key);
-				return 1;			<= we return here, without closing the fd
-			} else {
-				me->ioctlfd = -1;
-				ops->catatonic(ap->logopt, ioctlfd);
-				ops->close(ap->logopt, ioctlfd);
-				goto force_umount;
-			}
-(...)
----
- CHANGELOG       |    1 +
- daemon/direct.c |   19 ++++++++++++++++---
- 2 files changed, 17 insertions(+), 3 deletions(-)
-
-diff --git a/CHANGELOG b/CHANGELOG
-index 46ef335..a7ed212 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -30,6 +30,7 @@
- - workaround missing GNU versionsort extension.
- - dont fail on master map self include.
- - fix wildcard multi map regression.
-+- fix file descriptor leak when reloading the daemon.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/daemon/direct.c b/daemon/direct.c
-index 3e09c5d..228a666 100644
---- a/daemon/direct.c
-+++ b/daemon/direct.c
-@@ -86,7 +86,8 @@ int do_umount_autofs_direct(struct autofs_point *ap, struct mnt_list *mnts, stru
- {
- 	struct ioctl_ops *ops = get_ioctl_ops();
- 	char buf[MAX_ERR_BUF];
--	int ioctlfd, rv, left, retries;
-+	int ioctlfd = -1, rv, left, retries;
-+	int opened = 0;
- 
- 	left = umount_multi(ap, me->key, 0);
- 	if (left) {
-@@ -103,8 +104,10 @@ int do_umount_autofs_direct(struct autofs_point *ap, struct mnt_list *mnts, stru
- 			return 1;
- 		}
- 		ioctlfd = me->ioctlfd;
--	} else
-+	} else {
- 		ops->open(ap->logopt, &ioctlfd, me->dev, me->key);
-+		opened = 1;
-+	}
- 
- 	if (ioctlfd >= 0) {
- 		unsigned int status = 1;
-@@ -113,12 +116,16 @@ int do_umount_autofs_direct(struct autofs_point *ap, struct mnt_list *mnts, stru
- 		if (rv) {
- 			char *estr = strerror_r(errno, buf, MAX_ERR_BUF);
- 			error(ap->logopt, "ioctl failed: %s", estr);
-+			if (opened && ioctlfd != -1)
-+				ops->close(ap->logopt, ioctlfd);
- 			return 1;
- 		} else if (!status) {
- 			if (ap->state != ST_SHUTDOWN_FORCE) {
- 				error(ap->logopt,
- 				      "ask umount returned busy for %s",
- 				      me->key);
-+				if (opened && ioctlfd != -1)
-+					ops->close(ap->logopt, ioctlfd);
- 				return 1;
- 			} else {
- 				me->ioctlfd = -1;
-@@ -536,7 +543,8 @@ int umount_autofs_offset(struct autofs_point *ap, struct mapent *me)
- {
- 	struct ioctl_ops *ops = get_ioctl_ops();
- 	char buf[MAX_ERR_BUF];
--	int ioctlfd, rv = 1, retries;
-+	int ioctlfd = -1, rv = 1, retries;
-+	int opened = 0;
- 
- 	if (me->ioctlfd != -1) {
- 		if (is_mounted(_PATH_MOUNTED, me->key, MNTS_REAL)) {
-@@ -554,6 +562,7 @@ int umount_autofs_offset(struct autofs_point *ap, struct mapent *me)
- 			return 0;
- 		}
- 		ops->open(ap->logopt, &ioctlfd, me->dev, me->key);
-+		opened = 1;
- 	}
- 
- 	if (ioctlfd >= 0) {
-@@ -563,6 +572,8 @@ int umount_autofs_offset(struct autofs_point *ap, struct mapent *me)
- 		if (rv) {
- 			char *estr = strerror_r(errno, buf, MAX_ERR_BUF);
- 			logerr("ioctl failed: %s", estr);
-+			if (opened && ioctlfd != -1)
-+				ops->close(ap->logopt, ioctlfd);
- 			return 1;
- 		} else if (!status) {
- 			if (ap->state != ST_SHUTDOWN_FORCE) {
-@@ -570,6 +581,8 @@ int umount_autofs_offset(struct autofs_point *ap, struct mapent *me)
- 					error(ap->logopt,
- 					     "ask umount returned busy for %s",
- 					     me->key);
-+				if (opened && ioctlfd != -1)
-+					ops->close(ap->logopt, ioctlfd);
- 				return 1;
- 			} else {
- 				me->ioctlfd = -1;
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-init-script-status-return.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-init-script-status-return.patch
deleted file mode 100644
index a08d62f..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-init-script-status-return.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-autofs-5.0.7 - fix init script status return
-
-From: Ian Kent <ikent@redhat.com>
-
-The patch that added the piddir to configure to fix incorrect init
-script status() function returns failed to actually return the value
-to the user.
----
-
- CHANGELOG             |    1 +
- redhat/autofs.init.in |    2 +-
- 2 files changed, 2 insertions(+), 1 deletions(-)
-
-
-diff --git a/CHANGELOG b/CHANGELOG
-index 76c1f73..5bcb1af 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -19,6 +19,7 @@
- - Allow nsswitch.conf to not contain "automount:" lines.
- - fix nobind man page description.
- - fix submount offset delete.
-+- fix init script status return.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/redhat/autofs.init.in b/redhat/autofs.init.in
-index fe18b3e..9d008ff 100644
---- a/redhat/autofs.init.in
-+++ b/redhat/autofs.init.in
-@@ -172,7 +172,7 @@ RETVAL=0
- case "$1" in
- 	status)
- 		status -p @@autofspiddir@@/autofs.pid -l autofs $prog
--		exit 0;
-+		exit $?;
- 		;;
- 	usage)
- 		usage_message
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-ipv6-proximity-calculation.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-ipv6-proximity-calculation.patch
deleted file mode 100644
index b341ecd..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-ipv6-proximity-calculation.patch
+++ /dev/null
@@ -1,297 +0,0 @@
-autofs-5.0.7 - fix ipv6 proximity calculation
-
-From: Ian Kent <ikent@redhat.com>
-
-The socket based ioctl used to get interface information only
-return IPv4 information. Change get_proximity() function to use
-getifaddrs(3) instead.
----
-
- CHANGELOG            |    1 
- modules/replicated.c |  149 ++++++++++++++------------------------------------
- 2 files changed, 42 insertions(+), 108 deletions(-)
-
-
-diff --git a/CHANGELOG b/CHANGELOG
-index dc38580..34c70fa 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -2,6 +2,7 @@
- =======================
- - fix nobind sun escaped map entries.
- - fix use cache entry after free in lookup_prune_one_cache().
-+- fix ipv6 proximity calculation.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/modules/replicated.c b/modules/replicated.c
-index 78046c6..bd6003b 100644
---- a/modules/replicated.c
-+++ b/modules/replicated.c
-@@ -52,6 +52,7 @@
- #include <net/if.h>
- #include <netinet/in.h>
- #include <netdb.h>
-+#include <ifaddrs.h>
- 
- #include "rpc_subs.h"
- #include "replicated.h"
-@@ -110,58 +111,18 @@ void seed_random(void)
- 	return;
- }
- 
--static int alloc_ifreq(struct ifconf *ifc, int sock)
--{
--	int ret, lastlen = ifc_last_len, len = ifc_buf_len;
--	char err_buf[MAX_ERR_BUF], *buf;
--
--	while (1) {
--		buf = malloc(len);
--		if (!buf) {
--			char *estr = strerror_r(errno, err_buf, MAX_ERR_BUF);
--			logerr("malloc: %s", estr);
--			return 0;
--		}
--
--		ifc->ifc_len = len;
--		ifc->ifc_req = (struct ifreq *) buf;
--
--		ret = ioctl(sock, SIOCGIFCONF, ifc);
--		if (ret == -1) {
--			char *estr = strerror_r(errno, err_buf, MAX_ERR_BUF);
--			logerr("ioctl: %s", estr);
--			free(buf);
--			return 0;
--		}
--
--		if (ifc->ifc_len <= lastlen)
--			break;
--
--		lastlen = ifc->ifc_len;
--		len += MAX_IFC_BUF;
--		free(buf);
--	}
--
--	if (lastlen != ifc_last_len) {
--		ifc_last_len = lastlen;
--		ifc_buf_len = len;
--	}
--
--	return 1;
--}
--
- static unsigned int get_proximity(struct sockaddr *host_addr)
- {
-+	struct ifaddrs *ifa = NULL;
-+	struct ifaddrs *this;
- 	struct sockaddr_in *addr, *msk_addr, *if_addr;
- 	struct sockaddr_in6 *addr6, *msk6_addr, *if6_addr;
- 	struct in_addr *hst_addr;
- 	struct in6_addr *hst6_addr;
- 	int addr_len;
--	char buf[MAX_ERR_BUF], *ptr;
--	struct ifconf ifc;
--	struct ifreq *ifr, nmptr;
--	int sock, ret, i;
-+	char buf[MAX_ERR_BUF];
- 	uint32_t mask, ha, ia, *mask6, *ha6, *ia6;
-+	int ret;
- 
- 	addr = NULL;
- 	addr6 = NULL;
-@@ -170,13 +131,14 @@ static unsigned int get_proximity(struct sockaddr *host_addr)
- 	mask6 = NULL;
- 	ha6 = NULL;
- 	ia6 = NULL;
-+	ha = 0;
- 
- 	switch (host_addr->sa_family) {
- 	case AF_INET:
- 		addr = (struct sockaddr_in *) host_addr;
- 		hst_addr = (struct in_addr *) &addr->sin_addr;
- 		ha = ntohl((uint32_t) hst_addr->s_addr);
--		addr_len = sizeof(hst_addr);
-+		addr_len = sizeof(*hst_addr);
- 		break;
- 
- 	case AF_INET6:
-@@ -186,7 +148,7 @@ static unsigned int get_proximity(struct sockaddr *host_addr)
- 		addr6 = (struct sockaddr_in6 *) host_addr;
- 		hst6_addr = (struct in6_addr *) &addr6->sin6_addr;
- 		ha6 = &hst6_addr->s6_addr32[0];
--		addr_len = sizeof(hst6_addr);
-+		addr_len = sizeof(*hst6_addr);
- 		break;
- #endif
- 
-@@ -194,36 +156,29 @@ static unsigned int get_proximity(struct sockaddr *host_addr)
- 		return PROXIMITY_ERROR;
- 	}
- 
--	sock = open_sock(AF_INET, SOCK_DGRAM, 0);
--	if (sock < 0) {
-+	ret = getifaddrs(&ifa);
-+	if (ret) {
- 		char *estr = strerror_r(errno, buf, MAX_ERR_BUF);
--		logerr("socket creation failed: %s", estr);
-+		logerr("getifaddrs: %s", estr);
- 		return PROXIMITY_ERROR;
- 	}
- 
--	if (!alloc_ifreq(&ifc, sock)) {
--		close(sock);
--		return PROXIMITY_ERROR;
--	}
--
--	/* For each interface */
--
--	/* Is the address a local interface */
--	i = 0;
--	ptr = (char *) &ifc.ifc_buf[0];
--
--	while (ptr < (char *) ifc.ifc_req + ifc.ifc_len) {
--		ifr = (struct ifreq *) ptr;
-+	this = ifa;
-+	while (this) {
-+		if (this->ifa_flags & IFF_POINTOPOINT ||
-+		    this->ifa_addr->sa_data == NULL) {
-+			this = this->ifa_next;
-+			continue;
-+		}
- 
--		switch (ifr->ifr_addr.sa_family) {
-+		switch (this->ifa_addr->sa_family) {
- 		case AF_INET:
- 			if (host_addr->sa_family == AF_INET6)
- 				break;
--			if_addr = (struct sockaddr_in *) &ifr->ifr_addr;
-+			if_addr = (struct sockaddr_in *) this->ifa_addr;
- 			ret = memcmp(&if_addr->sin_addr, hst_addr, addr_len);
- 			if (!ret) {
--				close(sock);
--				free(ifc.ifc_req);
-+				freeifaddrs(ifa);
- 				return PROXIMITY_LOCAL;
- 			}
- 			break;
-@@ -234,55 +189,41 @@ static unsigned int get_proximity(struct sockaddr *host_addr)
- #else
- 			if (host_addr->sa_family == AF_INET)
- 				break;
--
--			if6_addr = (struct sockaddr_in6 *) &ifr->ifr_addr;
-+			if6_addr = (struct sockaddr_in6 *) this->ifa_addr;
- 			ret = memcmp(&if6_addr->sin6_addr, hst6_addr, addr_len);
- 			if (!ret) {
--				close(sock);
--				free(ifc.ifc_req);
-+				freeifaddrs(ifa);
- 				return PROXIMITY_LOCAL;
- 			}
- #endif
--
- 		default:
- 			break;
- 		}
--
--		i++;
--		ptr = (char *) &ifc.ifc_req[i];
-+		this = this->ifa_next;
- 	}
- 
--	i = 0;
--	ptr = (char *) &ifc.ifc_buf[0];
--
--	while (ptr < (char *) ifc.ifc_req + ifc.ifc_len) {
--		ifr = (struct ifreq *) ptr;
--
--		nmptr = *ifr;
--		ret = ioctl(sock, SIOCGIFNETMASK, &nmptr);
--		if (ret == -1) {
--			char *estr = strerror_r(errno, buf, MAX_ERR_BUF);
--			logerr("ioctl: %s", estr);
--			close(sock);
--			free(ifc.ifc_req);
--			return PROXIMITY_ERROR;
-+	this = ifa;
-+	while (this) {
-+		if (this->ifa_flags & IFF_POINTOPOINT ||
-+		    this->ifa_addr->sa_data == NULL) {
-+			this = this->ifa_next;
-+			continue;
- 		}
- 
--		switch (ifr->ifr_addr.sa_family) {
-+		switch (this->ifa_addr->sa_family) {
- 		case AF_INET:
- 			if (host_addr->sa_family == AF_INET6)
- 				break;
--			if_addr = (struct sockaddr_in *) &ifr->ifr_addr;
-+			if_addr = (struct sockaddr_in *) this->ifa_addr;
- 			ia =  ntohl((uint32_t) if_addr->sin_addr.s_addr);
- 
--			/* Is the address within a localiy attached subnet */
-+			/* Is the address within a localy attached subnet */
- 
--			msk_addr = (struct sockaddr_in *) &nmptr.ifr_netmask;
-+			msk_addr = (struct sockaddr_in *) this->ifa_netmask;
- 			mask = ntohl((uint32_t) msk_addr->sin_addr.s_addr);
- 
- 			if ((ia & mask) == (ha & mask)) {
--				close(sock);
--				free(ifc.ifc_req);
-+				freeifaddrs(ifa);
- 				return PROXIMITY_SUBNET;
- 			}
- 
-@@ -304,8 +245,7 @@ static unsigned int get_proximity(struct sockaddr *host_addr)
- 				break;
- 
- 			if ((ia & mask) == (ha & mask)) {
--				close(sock);
--				free(ifc.ifc_req);
-+				freeifaddrs(ifa);
- 				return PROXIMITY_NET;
- 			}
- 			break;
-@@ -316,35 +256,28 @@ static unsigned int get_proximity(struct sockaddr *host_addr)
- #else
- 			if (host_addr->sa_family == AF_INET)
- 				break;
--
--			if6_addr = (struct sockaddr_in6 *) &ifr->ifr_addr;
-+			if6_addr = (struct sockaddr_in6 *) this->ifa_addr;
- 			ia6 = &if6_addr->sin6_addr.s6_addr32[0];
- 
- 			/* Is the address within the network of the interface */
- 
--			msk6_addr = (struct sockaddr_in6 *) &nmptr.ifr_netmask;
-+			msk6_addr = (struct sockaddr_in6 *) this->ifa_netmask;
- 			mask6 = &msk6_addr->sin6_addr.s6_addr32[0];
- 
- 			if (ipv6_mask_cmp(ha6, ia6, mask6)) {
--				close(sock);
--				free(ifc.ifc_req);
-+				freeifaddrs(ifa);
- 				return PROXIMITY_SUBNET;
- 			}
- 
- 			/* How do we define "local network" in ipv6? */
- #endif
--			break;
--
- 		default:
- 			break;
- 		}
--
--		i++;
--		ptr = (char *) &ifc.ifc_req[i];
-+		this = this->ifa_next;
- 	}
- 
--	close(sock);
--	free(ifc.ifc_req);
-+	freeifaddrs(ifa);
- 
- 	return PROXIMITY_OTHER;
- }
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-libtirpc-build-option.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-libtirpc-build-option.patch
deleted file mode 100644
index 8ad2afa..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-libtirpc-build-option.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-autofs-5.0.7 - fix libtirpc build option
-
-From: Ian Kent <raven@themaw.net>
-
-
----
- CHANGELOG   |    1 +
- autofs.spec |   17 ++++++++++++++++-
- 2 files changed, 17 insertions(+), 1 deletion(-)
-
-diff --git a/CHANGELOG b/CHANGELOG
-index e848bcd..b6b2679 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -34,6 +34,7 @@
- - depricate nosymlink pseudo option.
- - add symlink pseudo option.
- - fix requires in spec file.
-+- fix libtirpc build option to require libtirpc-devel if needed.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/autofs.spec b/autofs.spec
-index 703f7a9..f77acc1 100644
---- a/autofs.spec
-+++ b/autofs.spec
-@@ -12,6 +12,10 @@
- # disable them.
- %define with_systemd        %{?_without_systemd:        0} %{?!_without_systemd:        1}
- 
-+# Use --without libtirpc in your rpmbuild command or force values to 0 to
-+# disable them.
-+%define with_libtirpc        %{?_without_libtirpc:        0} %{?!_without_libtirpc:        1}
-+
- Summary: A tool from automatically mounting and umounting filesystems.
- Name: autofs
- %define version 5.0.7
-@@ -25,6 +29,9 @@ Buildroot: %{_tmppath}/%{name}-tmp
- %if %{with_systemd}
- BuildRequires: systemd-units
- %endif
-+%if %{with_libtirpc}
-+BuildRequires: libtirpc-devel
-+%endif
- BuildRequires: autoconf, hesiod-devel, openldap-devel, bison, flex, cyrus-sasl-devel
- Requires: chkconfig
- Requires: /bin/bash mktemp sed textutils sh-utils grep /bin/ps
-@@ -72,9 +79,17 @@ echo %{version}-%{release} > .version
-   %define _unitdir %{?_unitdir:/lib/systemd/system}
-   %define systemd_configure_arg --with-systemd
- %endif
-+%if %{with_libtirpc}
-+  %define libtirpc_configure_arg --with-libtirpc
-+%endif
- 
- %build
--CFLAGS="$RPM_OPT_FLAGS -Wall" ./configure --libdir=%{_libdir} --disable-mount-locking --enable-ignore-busy --with-libtirpc %{?systemd_configure_arg:}
-+CFLAGS="$RPM_OPT_FLAGS -Wall" \
-+./configure --libdir=%{_libdir} \
-+	--disable-mount-locking \
-+	--enable-ignore-busy \
-+	%{?systemd_configure_arg:} \
-+	%{?libtirpc_configure_arg:}
- CFLAGS="$RPM_OPT_FLAGS -Wall" make initdir=/etc/rc.d/init.d DONTSTRIP=1
- 
- %install
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-map-entry-duplicate-offset-detection.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-map-entry-duplicate-offset-detection.patch
deleted file mode 100644
index 126d9a2..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-map-entry-duplicate-offset-detection.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-autofs-5.0.7 - fix map entry duplicate offset detection
-
-From: Ian Kent <raven@themaw.net>
-
-Recent changes broke the detection of duplicate offsets in map entries.
----
-
- CHANGELOG   |    1 +
- lib/cache.c |    2 +-
- 2 files changed, 2 insertions(+), 1 deletions(-)
-
-
-diff --git a/CHANGELOG b/CHANGELOG
-index 8f6bb3a..bd0dd82 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -15,6 +15,7 @@
- - fix recursive mount deadlock.
- - increase file map read buffer size.
- - handle new location of systemd.
-+- fix map entry duplicate offset detection.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/lib/cache.c b/lib/cache.c
-index 9179ad5..1e05a99 100644
---- a/lib/cache.c
-+++ b/lib/cache.c
-@@ -659,7 +659,7 @@ int cache_update_offset(struct mapent_cache *mc, const char *mkey, const char *k
- 
- 	me = cache_lookup_distinct(mc, key);
- 	if (me && me->age == age) {
--		if (me->multi != owner)
-+		if (me->multi == owner)
- 			return CHE_DUPLICATE;
- 	}
- 
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-nobind-man-page-description.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-nobind-man-page-description.patch
deleted file mode 100644
index 41328a0..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-nobind-man-page-description.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-autofs-5.0.7 - fix nobind man page description
-
-From: Ian Kent <raven@themaw.net>
-
-Update auto.master(5) to better describe the behavior of the "nobind"
-option when used with direct mounts maps.
----
-
- CHANGELOG            |    1 +
- man/auto.master.5.in |   10 +++++++---
- 2 files changed, 8 insertions(+), 3 deletions(-)
-
-
-diff --git a/CHANGELOG b/CHANGELOG
-index 16ac2a0..7eb7235 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -17,6 +17,7 @@
- - handle new location of systemd.
- - fix map entry duplicate offset detection.
- - Allow nsswitch.conf to not contain "automount:" lines.
-+- fix nobind man page description.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/man/auto.master.5.in b/man/auto.master.5.in
-index 21d7544..8007542 100644
---- a/man/auto.master.5.in
-+++ b/man/auto.master.5.in
-@@ -151,9 +151,13 @@ can't be mounted.
- This is an autofs specific option that is a pseudo mount option and
- so is given without a leading dash. It may be used either in the master
- map entry (so it effects all the map entries) or with individual map
--entries to prevent bind mounting of local NFS filesystems. Bind mounting
--of NFS file systems can also be prevented for specific map entrys by
--adding the "port=" mount option to the entries.
-+entries to prevent bind mounting of local NFS filesystems. For direct
-+mount maps the option is only effective if specified on the first direct
-+map entry and is applied to all direct mount maps in the master map. It
-+is ignored if given on subsequent direct map entries. It may be used
-+on individual map entries of both types. Bind mounting of NFS file
-+systems can also be prevented for specific map entrys by adding the
-+"port=" mount option to the entries.
- .TP
- .I "\-r, \-\-random-multimount-selection"
- Enables the use of ramdom selection when choosing a host from a
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-nobind-sun-escaped-map-entries.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-nobind-sun-escaped-map-entries.patch
deleted file mode 100644
index b5d7ad2..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-nobind-sun-escaped-map-entries.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-autofs-5.0.7 - fix nobind sun escaped map entries
-
-From: Ian Kent <ikent@redhat.com>
-
-If a map contains a Sun colon escape to indicate the mount is a local
-file system and the "nobind" option is present there is no hostname in
-the mount location and the mount fails.
----
-
- CHANGELOG           |    4 ++++
- modules/mount_nfs.c |    5 +++--
- 2 files changed, 7 insertions(+), 2 deletions(-)
-
-
-diff --git a/CHANGELOG b/CHANGELOG
-index 67fdcec..faf4c80 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -1,3 +1,7 @@
-+??/??/2012 autofs-5.0.8
-+=======================
-+- fix nobind sun escaped map entries.
-+
- 25/07/2012 autofs-5.0.7
- =======================
- - fix ipv6 name for lookup fix.
-diff --git a/modules/mount_nfs.c b/modules/mount_nfs.c
-index 9b8e5f1..bbbb1de 100644
---- a/modules/mount_nfs.c
-+++ b/modules/mount_nfs.c
-@@ -263,13 +263,14 @@ int mount_mount(struct autofs_point *ap, const char *root, const char *name, int
- 			} else
- 				strcpy(loc, n_addr);
- 		} else {
--			loc = malloc(strlen(this->name) + strlen(this->path) + 2);
-+			char *host = this->name ? this->name : "localhost";
-+			loc = malloc(strlen(host) + strlen(this->path) + 2);
- 			if (!loc) {
- 				char *estr = strerror_r(errno, buf, MAX_ERR_BUF);
- 				error(ap->logopt, "malloc: %s", estr);
- 				goto forced_fail;
- 			}
--			strcpy(loc, this->name);
-+			strcpy(loc, host);
- 		}
- 		strcat(loc, ":");
- 		strcat(loc, this->path);
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-null-map-entry-order-handling.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-null-map-entry-order-handling.patch
deleted file mode 100644
index 610afaa..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-null-map-entry-order-handling.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-autofs-5.0.7 - fix null map entry order handling
-
-From: Ian Kent <ikent@redhat.com>
-
-If a null map entry appears after a corresponding indirect map entry
-autofs doesn't handle it properly.
-
-Since it appears after the map entry it should'nt affect it but autofs
-doesn't account for this case and assumes the map entry is already
-mounted and tries to shut it down causing attempted access to facilities
-that don't exist.
----
-
- CHANGELOG    |    1 +
- lib/master.c |   32 +++++++++++++++++++++++++++++---
- 2 files changed, 30 insertions(+), 3 deletions(-)
-
-
-diff --git a/CHANGELOG b/CHANGELOG
-index 7b8d185..79cf673 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -7,6 +7,7 @@
- - fix typo in automount(8).
- - dont wait forever to restart.
- - add timeout option description to man page.
-+- fix null map entry order handling.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/lib/master.c b/lib/master.c
-index 904b13d..a0e62f2 100644
---- a/lib/master.c
-+++ b/lib/master.c
-@@ -1179,9 +1179,35 @@ int master_mount_mounts(struct master *master, time_t age, int readall)
- 
- 		cache_readlock(nc);
- 		ne = cache_lookup_distinct(nc, this->path);
--		if (ne && this->age > ne->age) {
-+		/*
-+		 * If this path matched a nulled entry the master map entry
-+		 * must be an indirect mount so the master map entry line
-+		 * number may be obtained from this->maps.
-+		 */
-+		if (ne) {
-+			int lineno = ne->age;
- 			cache_unlock(nc);
--			st_add_task(ap, ST_SHUTDOWN_PENDING);
-+
-+			/* null entry appears after map entry */
-+			if (this->maps->master_line < lineno) {
-+				warn(ap->logopt,
-+				     "ignoring null entry that appears after "
-+				     "existing entry for %s", this->path);
-+				goto cont;
-+			}
-+			if (ap->state != ST_INIT) {
-+				st_add_task(ap, ST_SHUTDOWN_PENDING);
-+				continue;
-+			}
-+			/*
-+			 * The map entry hasn't been started yet and we've
-+			 * seen a preceeding null map entry for it so just
-+			 * delete it from the master map entry list so it
-+			 * doesn't get in the road.
-+			 */
-+			list_del_init(&this->list);
-+			master_free_mapent_sources(ap->entry, 1);
-+			master_free_mapent(ap->entry);
- 			continue;
- 		}
- 		nested = cache_partial_match(nc, this->path);
-@@ -1194,7 +1220,7 @@ int master_mount_mounts(struct master *master, time_t age, int readall)
- 				cache_delete(nc, nested->key);
- 		}
- 		cache_unlock(nc);
--
-+cont:
- 		st_mutex_lock();
- 
- 		state_pipe = this->ap->state_pipe[1];
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-parse-buffer-initialization.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-parse-buffer-initialization.patch
deleted file mode 100644
index 22bd5da..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-parse-buffer-initialization.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-autofs-5.0.7 - fix parse buffer initialization
-
-From: Ian Kent <ikent@redhat.com>
-
-When parsing a master map entry, if the mount point path is longer than
-the following map string the lexical analyzer buffer may not have a null
-terminator where it is expected. If the map name string also contains a
-string that is the same as a map type at the end the map name the map
-name is not constructed correctly because of this lack of a string
-terminator in the buffer.
----
-
- CHANGELOG        |    1 +
- lib/master_tok.l |    4 +++-
- 2 files changed, 4 insertions(+), 1 deletions(-)
-
-
-diff --git a/CHANGELOG b/CHANGELOG
-index 34c70fa..276d6ba 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -3,6 +3,7 @@
- - fix nobind sun escaped map entries.
- - fix use cache entry after free in lookup_prune_one_cache().
- - fix ipv6 proximity calculation.
-+- fix parse buffer initialization.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/lib/master_tok.l b/lib/master_tok.l
-index 0d6edb7..30abb15 100644
---- a/lib/master_tok.l
-+++ b/lib/master_tok.l
-@@ -74,7 +74,8 @@ int my_yyinput(char *, int);
- #define unput(c) (*(char *) --line = c)
- #endif
- 
--char buff[1024];
-+#define BUFF_LEN	1024
-+char buff[BUFF_LEN];
- char *bptr;
- char *optr = buff;
- unsigned int tlen;
-@@ -174,6 +175,7 @@ OPTNTOUT	(-n{OPTWS}|-n{OPTWS}={OPTWS}|--negative-timeout{OPTWS}|--negative-timeo
- 		*bptr = '\0';
- 		strcpy(master_lval.strtype, buff);
- 		bptr = buff;
-+		memset(buff, 0, BUFF_LEN);
- 		return(PATH);
- 	}
- 
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-requires-in-spec-file.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-requires-in-spec-file.patch
deleted file mode 100644
index 404c848..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-requires-in-spec-file.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-autofs-5.0.7 - fix requires in spec file
-
-From: Ian Kent <raven@themaw.net>
-
-Fix the use of depricated reqires in tar spec file.
----
- CHANGELOG   |    1 +
- autofs.spec |    4 ++--
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/CHANGELOG b/CHANGELOG
-index 247d334..e848bcd 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -33,6 +33,7 @@
- - fix file descriptor leak when reloading the daemon.
- - depricate nosymlink pseudo option.
- - add symlink pseudo option.
-+- fix requires in spec file.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/autofs.spec b/autofs.spec
-index b8a3b7a..703f7a9 100644
---- a/autofs.spec
-+++ b/autofs.spec
-@@ -25,8 +25,8 @@ Buildroot: %{_tmppath}/%{name}-tmp
- %if %{with_systemd}
- BuildRequires: systemd-units
- %endif
--BuildPrereq: autoconf, hesiod-devel, openldap-devel, bison, flex, cyrus-sasl-devel
--Prereq: chkconfig
-+BuildRequires: autoconf, hesiod-devel, openldap-devel, bison, flex, cyrus-sasl-devel
-+Requires: chkconfig
- Requires: /bin/bash mktemp sed textutils sh-utils grep /bin/ps
- %if %{with_systemd}
- Requires(post): systemd-sysv
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-submount-offset-delete.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-submount-offset-delete.patch
deleted file mode 100644
index b38e214..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-submount-offset-delete.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-autofs-5.0.7 - fix submount offset delete
-
-From: Ian Kent <ikent@redhat.com>
-
-As part of the implementation to allow for limited update of
-the internal hosts map by using a HUP signal some code that
-deleted any offset entries from the cache on lookup was removed
-as it appeared to not be needed.
-
-There is however a case where it is needed to avoid a duplicate
-cache entry failure on lookup.
----
-
- CHANGELOG          |    1 +
- daemon/automount.c |    4 ++--
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
-
-diff --git a/CHANGELOG b/CHANGELOG
-index 7eb7235..76c1f73 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -18,6 +18,7 @@
- - fix map entry duplicate offset detection.
- - Allow nsswitch.conf to not contain "automount:" lines.
- - fix nobind man page description.
-+- fix submount offset delete.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/daemon/automount.c b/daemon/automount.c
-index e56f9e1..4a3eb3d 100644
---- a/daemon/automount.c
-+++ b/daemon/automount.c
-@@ -544,8 +544,8 @@ int umount_multi(struct autofs_point *ap, const char *path, int incl)
- 	 * If we are a submount we need to umount any offsets our
- 	 * parent may have mounted over top of us.
- 	 */
--	/*if (ap->submount)
--		left += umount_subtree_mounts(ap->parent, path, is_autofs_fs);*/
-+	if (ap->submount)
-+		left += umount_subtree_mounts(ap->parent, path, is_autofs_fs);
- 
- 	left += umount_subtree_mounts(ap, path, is_autofs_fs);
- 
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-systemd-unidir-in-spec-file.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-systemd-unidir-in-spec-file.patch
deleted file mode 100644
index d856faf..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-systemd-unidir-in-spec-file.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-autofs-5.0.7 - fix systemd unidir in spec file
-
-From: Ian Kent <raven@themaw.net>
-
-
----
- CHANGELOG   |    1 +
- autofs.spec |   16 ++++++++--------
- 2 files changed, 9 insertions(+), 8 deletions(-)
-
-diff --git a/CHANGELOG b/CHANGELOG
-index b6b2679..ecdea0b 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -35,6 +35,7 @@
- - add symlink pseudo option.
- - fix requires in spec file.
- - fix libtirpc build option to require libtirpc-devel if needed.
-+- fix systemd unidir in spec file.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/autofs.spec b/autofs.spec
-index f77acc1..a768e44 100644
---- a/autofs.spec
-+++ b/autofs.spec
-@@ -76,7 +76,7 @@ inkludera n
- %setup -q
- echo %{version}-%{release} > .version
- %if %{with_systemd}
--  %define _unitdir %{?_unitdir:/lib/systemd/system}
-+  %define unitdir %{?_unitdir:/lib/systemd/system}
-   %define systemd_configure_arg --with-systemd
- %endif
- %if %{with_libtirpc}
-@@ -95,7 +95,7 @@ CFLAGS="$RPM_OPT_FLAGS -Wall" make initdir=/etc/rc.d/init.d DONTSTRIP=1
- %install
- rm -rf $RPM_BUILD_ROOT
- %if %{with_systemd}
--install -d -m 755 $RPM_BUILD_ROOT%{_unitdir}
-+install -d -m 755 $RPM_BUILD_ROOT%{unitdir}
- %else
- mkdir -p -m755 $RPM_BUILD_ROOT/etc/rc.d/init.d
- %endif
-@@ -109,9 +109,13 @@ make install mandir=%{_mandir} initdir=/etc/rc.d/init.d INSTALLROOT=$RPM_BUILD_R
- echo make -C redhat
- make -C redhat
- %if %{with_systemd}
--install -m 644 redhat/autofs.service $RPM_BUILD_ROOT%{_unitdir}/autofs.service
-+# Configure can get this wrong when the unit files appear under /lib and /usr/lib
-+find $RPM_BUILD_ROOT -type f -name autofs.service -exec rm -f {} \;
-+install -m 644 redhat/autofs.service $RPM_BUILD_ROOT%{unitdir}/autofs.service
-+%define init_file_name %{unitdir}/autofs.service
- %else
- install -m 755 redhat/autofs.init $RPM_BUILD_ROOT/etc/rc.d/init.d/autofs
-+%define init_file_name /etc/rc.d/init.d/autofs
- %endif
- install -m 644 redhat/autofs.sysconfig $RPM_BUILD_ROOT/etc/sysconfig/autofs
- 
-@@ -170,11 +174,7 @@ fi
- %files
- %defattr(-,root,root)
- %doc CREDITS CHANGELOG INSTALL COPY* README* samples/ldap* samples/autofs.schema samples/autofs_ldap_auth.conf
--%if %{with_systemd}
--%{_unitdir}/autofs.service
--%else
--%config /etc/rc.d/init.d/autofs
--%endif
-+%config %{init_file_name}
- %config(noreplace) /etc/auto.master
- %config(noreplace,missingok) /etc/auto.misc
- %config(noreplace,missingok) /etc/auto.net
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-typo-in-automount-8.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-typo-in-automount-8.patch
deleted file mode 100644
index 6d88ce0..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-typo-in-automount-8.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-autofs-5.0.7 - fix typo in automount(8)
-
-From: Ian Kent <ikent@redhat.com>
-
-
----
-
- CHANGELOG       |    1 +
- man/automount.8 |    2 +-
- 2 files changed, 2 insertions(+), 1 deletions(-)
-
-
-diff --git a/CHANGELOG b/CHANGELOG
-index 276d6ba..6051723 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -4,6 +4,7 @@
- - fix use cache entry after free in lookup_prune_one_cache().
- - fix ipv6 proximity calculation.
- - fix parse buffer initialization.
-+- fix typo in automount(8).
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/man/automount.8 b/man/automount.8
-index 0186984..dddebce 100644
---- a/man/automount.8
-+++ b/man/automount.8
-@@ -51,7 +51,7 @@ are over-ridden macro definitions of the same name specified in
- mount entries.
- .TP
- .I "\-f, \-\-foreground"
--Run the daemon in the forground and log to stderr instead of syslog."
-+Run the daemon in the foreground and log to stderr instead of syslog."
- .TP
- .I "\-r, \-\-random-multimount-selection"
- Enables the use of ramdom selection when choosing a host from a
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-use-cache-entry-after-free-mistake.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-use-cache-entry-after-free-mistake.patch
deleted file mode 100644
index a469c16..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-use-cache-entry-after-free-mistake.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-autofs-5.0.7 - fix use cache entry after free mistake
-
-From: Ian Kent <ikent@redhat.com>
-
-Fix an obvious use after free mistake in lookup_prune_one_cache().
----
-
- CHANGELOG       |    1 +
- daemon/lookup.c |    7 +++++--
- 2 files changed, 6 insertions(+), 2 deletions(-)
-
-
-diff --git a/CHANGELOG b/CHANGELOG
-index faf4c80..dc38580 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -1,6 +1,7 @@
- ??/??/2012 autofs-5.0.8
- =======================
- - fix nobind sun escaped map entries.
-+- fix use cache entry after free in lookup_prune_one_cache().
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/daemon/lookup.c b/daemon/lookup.c
-index 7909536..e3d9536 100644
---- a/daemon/lookup.c
-+++ b/daemon/lookup.c
-@@ -1103,15 +1103,18 @@ void lookup_prune_one_cache(struct autofs_point *ap, struct mapent_cache *mc, ti
- 		if (valid)
- 			cache_delete(mc, key);
- 		else if (!is_mounted(_PROC_MOUNTS, path, MNTS_AUTOFS)) {
-+			dev_t devid = ap->dev;
- 			status = CHE_FAIL;
-+			if (ap->type == LKP_DIRECT)
-+				devid = this->dev;
- 			if (this->ioctlfd == -1)
- 				status = cache_delete(mc, key);
- 			if (status != CHE_FAIL) {
- 				if (ap->type == LKP_INDIRECT) {
- 					if (ap->flags & MOUNT_FLAG_GHOST)
--						rmdir_path(ap, path, ap->dev);
-+						rmdir_path(ap, path, devid);
- 				} else
--					rmdir_path(ap, path, this->dev);
-+					rmdir_path(ap, path, devid);
- 			}
- 		}
- 		cache_unlock(mc);
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-use-get_proximity-without-libtirpc.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-use-get_proximity-without-libtirpc.patch
deleted file mode 100644
index 74ed8fa..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-use-get_proximity-without-libtirpc.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-autofs-5.0.7 - fix use get_proximity() without libtirpc
-
-From: Ian Kent <raven@themaw.net>
-
-If autofs is not using libtirpc and there are any configured IPv6
-interfaces then get_proximity() will fail with PROXIMITY_UNSUPPORTED.
-
-In this case when checking interfaces the IPv6 interfaces need to be
-ignored.
----
-
- CHANGELOG            |    1 +
- modules/replicated.c |    8 ++------
- 2 files changed, 3 insertions(+), 6 deletions(-)
-
-
-diff --git a/CHANGELOG b/CHANGELOG
-index 5bcb1af..460bd27 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -20,6 +20,7 @@
- - fix nobind man page description.
- - fix submount offset delete.
- - fix init script status return.
-+- fix use get_proximity() without libtirpc.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/modules/replicated.c b/modules/replicated.c
-index bd6003b..6b96320 100644
---- a/modules/replicated.c
-+++ b/modules/replicated.c
-@@ -184,9 +184,7 @@ static unsigned int get_proximity(struct sockaddr *host_addr)
- 			break;
- 
- 		case AF_INET6:
--#ifndef WITH_LIBTIRPC
--			return PROXIMITY_UNSUPPORTED;
--#else
-+#ifdef WITH_LIBTIRPC
- 			if (host_addr->sa_family == AF_INET)
- 				break;
- 			if6_addr = (struct sockaddr_in6 *) this->ifa_addr;
-@@ -251,9 +249,7 @@ static unsigned int get_proximity(struct sockaddr *host_addr)
- 			break;
- 
- 		case AF_INET6:
--#ifndef WITH_LIBTIRPC
--			return PROXIMITY_UNSUPPORTED;
--#else
-+#ifdef WITH_LIBTIRPC
- 			if (host_addr->sa_family == AF_INET)
- 				break;
- 			if6_addr = (struct sockaddr_in6 *) this->ifa_addr;
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-wildcard-multi-map-regression.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-wildcard-multi-map-regression.patch
deleted file mode 100644
index 44e4a18..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-wildcard-multi-map-regression.patch
+++ /dev/null
@@ -1,225 +0,0 @@
-autofs-5.0.7 - fix wildcard multi map regression
-
-From: Ian Kent <raven@themaw.net>
-
-A recent patch that removed code to add the current map entry when
-being parsed if it didn't already exist cause wildcard indirect
-multi-mount map entries to fail to mount.
-
-Indirect multi-mount map entries need the entry matched by a wildcard
-lookup to be added to the map entry cache because subsequent operations
-expect a distinct map entry to be present or they will fail. This is
-what the code that was removed did but it did so in the wrong place
-which caused a deadlock situation.
----
- CHANGELOG                |    1 +
- modules/lookup_file.c    |   23 ++++++++++++++++-------
- modules/lookup_ldap.c    |   19 +++++++++++++++----
- modules/lookup_nisplus.c |   21 ++++++++++++++++-----
- modules/lookup_sss.c     |   17 ++++++++++++++---
- modules/lookup_yp.c      |   21 ++++++++++++++++-----
- 6 files changed, 78 insertions(+), 24 deletions(-)
-
-diff --git a/CHANGELOG b/CHANGELOG
-index 97d6f48..46ef335 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -29,6 +29,7 @@
- - modules/replicated.c: use sin6_addr.s6_addr32.
- - workaround missing GNU versionsort extension.
- - dont fail on master map self include.
-+- fix wildcard multi map regression.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/modules/lookup_file.c b/modules/lookup_file.c
-index f37bed9..65e5ee6 100644
---- a/modules/lookup_file.c
-+++ b/modules/lookup_file.c
-@@ -1040,7 +1040,7 @@ int lookup_mount(struct autofs_point *ap, const char *name, int name_len, void *
- 			return NSS_STATUS_UNAVAIL;
- 		}
- 
--		cache_readlock(mc);
-+		cache_writelock(mc);
- 		me = cache_lookup_first(mc);
- 		if (me && st.st_mtime <= me->age) {
- 			/*
-@@ -1082,7 +1082,7 @@ int lookup_mount(struct autofs_point *ap, const char *name, int name_len, void *
- 		}
- 	}
- 
--	cache_readlock(mc);
-+	cache_writelock(mc);
- do_cache_lookup:
- 	me = cache_lookup(mc, key);
- 	/*
-@@ -1098,11 +1098,20 @@ do_cache_lookup:
- 		if (!me)
- 			me = cache_lookup_distinct(mc, "*");
- 	}
--	if (me && me->mapent && (me->source == source || *me->key == '/')) {
--		pthread_cleanup_push(cache_lock_cleanup, mc);
--		strcpy(mapent_buf, me->mapent);
--		mapent = mapent_buf;
--		pthread_cleanup_pop(0);
-+	if (me && me->mapent) {
-+		/*
-+		 * Add wildcard match for later validation checks and
-+		 * negative cache lookups.
-+		 */
-+		if (ap->type == LKP_INDIRECT && *me->key == '*') {
-+			ret = cache_update(mc, source, key, me->mapent, me->age);
-+			if (!(ret & (CHE_OK | CHE_UPDATED)))
-+				me = NULL;
-+		}
-+		if (me && (me->source == source || *me->key == '/')) {
-+			strcpy(mapent_buf, me->mapent);
-+			mapent = mapent_buf;
-+		}
- 	}
- 	cache_unlock(mc);
- 
-diff --git a/modules/lookup_ldap.c b/modules/lookup_ldap.c
-index 431e50d..83e3215 100644
---- a/modules/lookup_ldap.c
-+++ b/modules/lookup_ldap.c
-@@ -2969,7 +2969,7 @@ int lookup_mount(struct autofs_point *ap, const char *name, int name_len, void *
- 			return status;
- 	}
- 
--	cache_readlock(mc);
-+	cache_writelock(mc);
- 	me = cache_lookup(mc, key);
- 	/* Stale mapent => check for entry in alternate source or wildcard */
- 	if (me && !me->mapent) {
-@@ -2979,9 +2979,20 @@ int lookup_mount(struct autofs_point *ap, const char *name, int name_len, void *
- 		if (!me)
- 			me = cache_lookup_distinct(mc, "*");
- 	}
--	if (me && me->mapent && (me->source == source || *me->key == '/')) {
--		strcpy(mapent_buf, me->mapent);
--		mapent = mapent_buf;
-+	if (me && me->mapent) {
-+		/*
-+		 * Add wildcard match for later validation checks and
-+		 * negative cache lookups.
-+		 */
-+		if (ap->type == LKP_INDIRECT && *me->key == '*') {
-+			ret = cache_update(mc, source, key, me->mapent, me->age);
-+			if (!(ret & (CHE_OK | CHE_UPDATED)))
-+				me = NULL;
-+		}
-+		if (me && (me->source == source || *me->key == '/')) {
-+			strcpy(mapent_buf, me->mapent);
-+			mapent = mapent_buf;
-+		}
- 	}
- 	cache_unlock(mc);
- 
-diff --git a/modules/lookup_nisplus.c b/modules/lookup_nisplus.c
-index 9fced96..8237a1e 100644
---- a/modules/lookup_nisplus.c
-+++ b/modules/lookup_nisplus.c
-@@ -561,7 +561,7 @@ int lookup_mount(struct autofs_point *ap, const char *name, int name_len, void *
- 			return status;
- 	}
- 
--	cache_readlock(mc);
-+	cache_writelock(mc);
- 	me = cache_lookup(mc, key);
- 	/* Stale mapent => check for entry in alternate source or wildcard */
- 	if (me && !me->mapent) {
-@@ -571,10 +571,21 @@ int lookup_mount(struct autofs_point *ap, const char *name, int name_len, void *
- 		if (!me)
- 			me = cache_lookup_distinct(mc, "*");
- 	}
--	if (me && me->mapent && (me->source == source || *me->key == '/')) {
--		mapent_len = strlen(me->mapent);
--		mapent = malloc(mapent_len + 1);
--		strcpy(mapent, me->mapent);
-+	if (me && me->mapent) {
-+		/*
-+		 * Add wildcard match for later validation checks and
-+		 * negative cache lookups.
-+		 */
-+		if (ap->type == LKP_INDIRECT && *me->key == '*') {
-+			ret = cache_update(mc, source, key, me->mapent, me->age);
-+			if (!(ret & (CHE_OK | CHE_UPDATED)))
-+				me = NULL;
-+		}
-+		if (me && (me->source == source || *me->key == '/')) {
-+			mapent_len = strlen(me->mapent);
-+			mapent = malloc(mapent_len + 1);
-+			strcpy(mapent, me->mapent);
-+		}
- 	}
- 	cache_unlock(mc);
- 
-diff --git a/modules/lookup_sss.c b/modules/lookup_sss.c
-index e0b84cc..5c2ed0a 100644
---- a/modules/lookup_sss.c
-+++ b/modules/lookup_sss.c
-@@ -645,9 +645,20 @@ int lookup_mount(struct autofs_point *ap, const char *name, int name_len, void *
- 		if (!me)
- 			me = cache_lookup_distinct(mc, "*");
- 	}
--	if (me && me->mapent && (me->source == source || *me->key == '/')) {
--		strcpy(mapent_buf, me->mapent);
--		mapent = mapent_buf;
-+	if (me && me->mapent) {
-+		/*
-+		 * Add wildcard match for later validation checks and
-+		 * negative cache lookups.
-+		 */
-+		if (ap->type == LKP_INDIRECT && *me->key == '*') {
-+			ret = cache_update(mc, source, key, me->mapent, me->age);
-+			if (!(ret & (CHE_OK | CHE_UPDATED)))
-+				me = NULL;
-+		}
-+		if (me && (me->source == source || *me->key == '/')) {
-+			strcpy(mapent_buf, me->mapent);
-+			mapent = mapent_buf;
-+		}
- 	}
- 	cache_unlock(mc);
- 
-diff --git a/modules/lookup_yp.c b/modules/lookup_yp.c
-index 720df2e..a716e1f 100644
---- a/modules/lookup_yp.c
-+++ b/modules/lookup_yp.c
-@@ -662,7 +662,7 @@ int lookup_mount(struct autofs_point *ap, const char *name, int name_len, void *
- 			return status;
- 	}
- 
--	cache_readlock(mc);
-+	cache_writelock(mc);
- 	me = cache_lookup(mc, key);
- 	/* Stale mapent => check for entry in alternate source or wildcard */
- 	if (me && !me->mapent) {
-@@ -672,10 +672,21 @@ int lookup_mount(struct autofs_point *ap, const char *name, int name_len, void *
- 		if (!me)
- 			me = cache_lookup_distinct(mc, "*");
- 	}
--	if (me && me->mapent && (me->source == source || *me->key == '/')) {
--		mapent_len = strlen(me->mapent);
--		mapent = alloca(mapent_len + 1);
--		strcpy(mapent, me->mapent);
-+	if (me && me->mapent) {
-+		/*
-+		 * Add wildcard match for later validation checks and
-+		 * negative cache lookups.
-+		 */
-+		if (ap->type == LKP_INDIRECT && *me->key == '*') {
-+			ret = cache_update(mc, source, key, me->mapent, me->age);
-+			if (!(ret & (CHE_OK | CHE_UPDATED)))
-+				me = NULL;
-+		}
-+		if (me && (me->source == source || *me->key == '/')) {
-+			mapent_len = strlen(me->mapent);
-+			mapent = alloca(mapent_len + 1);
-+			strcpy(mapent, me->mapent);
-+		}
- 	}
- 	cache_unlock(mc);
- 
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-handle-new-location-of-systemd.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-handle-new-location-of-systemd.patch
deleted file mode 100644
index 1c26794..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-handle-new-location-of-systemd.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-autofs-5.0.7 - Handle new location of systemd
-
-From: Frederic Crozat <fcrozat@suse.com>
-
-Some distributions are moving systemd unit files from /lib to
-/usr/lib, so we need to test both directories.
-
-edit: imk
-It occurs to me I've forgotten to check for the 64 bit variants
-of the directories, so add them as well.
-end edit: imk
----
-
- CHANGELOG  |    1 +
- aclocal.m4 |    2 +-
- configure  |    2 +-
- 3 files changed, 3 insertions(+), 2 deletions(-)
-
-
-diff --git a/CHANGELOG b/CHANGELOG
-index 3bdf8a4..8f6bb3a 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -14,6 +14,7 @@
- - allow non root user to check status.
- - fix recursive mount deadlock.
- - increase file map read buffer size.
-+- handle new location of systemd.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/aclocal.m4 b/aclocal.m4
-index 1798c8b..47bca0c 100644
---- a/aclocal.m4
-+++ b/aclocal.m4
-@@ -234,7 +234,7 @@ AC_DEFUN([AF_WITH_SYSTEMD],
- [if test "$withval" = yes; then
-   if test -z "$systemddir"; then
-     AC_MSG_CHECKING([location of the systemd unit files directory])
--    for systemd_d in /lib/systemd/system; do
-+    for systemd_d in /usr/lib/systemd/system /usr/lib64/systemd/system /lib/systemd/system /lib64/systemd/system; do
-       if test -z "$systemddir"; then
-         if test -d "$systemd_d"; then
-           systemddir="$systemd_d"
-diff --git a/configure b/configure
-index ba3bba6..3722a46 100755
---- a/configure
-+++ b/configure
-@@ -2157,7 +2157,7 @@ if test "${with_systemd+set}" = set; then :
-   if test -z "$systemddir"; then
-     { $as_echo "$as_me:${as_lineno-$LINENO}: checking location of the systemd unit files directory" >&5
- $as_echo_n "checking location of the systemd unit files directory... " >&6; }
--    for systemd_d in /lib/systemd/system; do
-+    for systemd_d in /usr/lib/systemd/system /usr/lib64/systemd/system /lib/systemd/system /lib64/systemd/system; do
-       if test -z "$systemddir"; then
-         if test -d "$systemd_d"; then
-           systemddir="$systemd_d"
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-include-usage-in-usage-message.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-include-usage-in-usage-message.patch
deleted file mode 100644
index 1c8a565..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-include-usage-in-usage-message.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-autofs-5.0.7 - include usage in usage message
-
-From: Ian Kent <ikent@redhat.com>
-
-Since usage is a case entry we should also nclude it in the usage
-message.
----
-
- redhat/autofs.init.in |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-
-diff --git a/redhat/autofs.init.in b/redhat/autofs.init.in
-index 8e355da..ec6d5d6 100644
---- a/redhat/autofs.init.in
-+++ b/redhat/autofs.init.in
-@@ -155,7 +155,7 @@ function reload() {
- }
- 
- function usage_message() {
--	echo $"Usage: $0 {start|forcestart|stop|status|restart|force-reload|forcerestart|reload|condrestart|try-restart}"
-+	echo $"Usage: $0 {start|forcestart|stop|status|restart|force-reload|forcerestart|reload|condrestart|try-restart|usage}"
- }
- 
- RETVAL=0
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-lib-defaults-use-WITH_LDAP-conditional-around-LDAP-types.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-lib-defaults-use-WITH_LDAP-conditional-around-LDAP-types.patch
deleted file mode 100644
index 22e0418..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-lib-defaults-use-WITH_LDAP-conditional-around-LDAP-types.patch
+++ /dev/null
@@ -1,448 +0,0 @@
-autofs-5.0.7 - lib/defaults.c: use WITH_LDAP conditional around LDAP types
-
-From: Chris Packham <chris.packham@alliedtelesis.co.nz>
-
-Wrap the inclusion of lookup_ldap.h and functions that use ldap_uri or
-ldap_schema with the WITH_LDAP conditional. WITH_LDAP is set by the
-configure step when LDAP support is not desired. This also allows
-compilation on a system that doesn't have any LDAP libraries.
----
-
- CHANGELOG             |    1 
- include/defaults.h    |   14 +-
- include/lookup_ldap.h |    1 
- lib/defaults.c        |  325 +++++++++++++++++++++++++------------------------
- modules/lookup_ldap.c |    1 
- 5 files changed, 175 insertions(+), 167 deletions(-)
-
-
-diff --git a/CHANGELOG b/CHANGELOG
-index ba1d65b..1130db6 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -24,6 +24,7 @@
- - don't use dirent d_type to filter out files in scandir()
- - don't schedule new alarms after readmap.
- - use numeric protocol ids instead of protoent structs.
-+- lib/defaults.c: use WITH_LDAP conditional around LDAP types.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/include/defaults.h b/include/defaults.h
-index cda2174..871e14b 100644
---- a/include/defaults.h
-+++ b/include/defaults.h
-@@ -44,8 +44,16 @@
- 
- #define DEFAULT_MAP_HASH_TABLE_SIZE	1024
- 
-+#ifdef WITH_LDAP
- struct ldap_schema;
- struct ldap_searchdn;
-+void defaults_free_uris(struct list_head *);
-+struct list_head *defaults_get_uris(void);
-+struct ldap_schema *defaults_get_default_schema(void);
-+void defaults_free_searchdns(struct ldap_searchdn *);
-+struct ldap_searchdn *defaults_get_searchdns(void);
-+struct ldap_schema *defaults_get_schema(void);
-+#endif
- 
- unsigned int defaults_read_config(unsigned int);
- const char *defaults_get_master_map(void);
-@@ -57,12 +65,6 @@ unsigned int defaults_get_logging(void);
- const char *defaults_get_ldap_server(void);
- unsigned int defaults_get_ldap_timeout(void);
- unsigned int defaults_get_ldap_network_timeout(void);
--struct list_head *defaults_get_uris(void);
--void defaults_free_uris(struct list_head *);
--struct ldap_schema *defaults_get_default_schema(void);
--struct ldap_schema *defaults_get_schema(void);
--struct ldap_searchdn *defaults_get_searchdns(void);
--void defaults_free_searchdns(struct ldap_searchdn *);
- unsigned int defaults_get_mount_nfs_default_proto(void);
- unsigned int defaults_get_append_options(void);
- unsigned int defaults_get_mount_wait(void);
-diff --git a/include/lookup_ldap.h b/include/lookup_ldap.h
-index e441a61..9a4ce73 100644
---- a/include/lookup_ldap.h
-+++ b/include/lookup_ldap.h
-@@ -8,7 +8,6 @@
- #include <openssl/evp.h>
- #include <openssl/err.h>
- #include <sasl/sasl.h>
--#include <libxml/tree.h>
- #include <krb5.h>
- #endif
- 
-diff --git a/lib/defaults.c b/lib/defaults.c
-index 5ce71b7..ae1162f 100644
---- a/lib/defaults.c
-+++ b/lib/defaults.c
-@@ -17,9 +17,12 @@
- #include <ctype.h>
- #include <string.h>
- 
-+#include "config.h"
- #include "list.h"
- #include "defaults.h"
-+#ifdef WITH_LDAP
- #include "lookup_ldap.h"
-+#endif
- #include "log.h"
- #include "automount.h"
- 
-@@ -197,6 +200,7 @@ static int parse_line(char *line, char **res, char **value)
- 	return 1;
- }
- 
-+#ifdef WITH_LDAP
- void defaults_free_uris(struct list_head *list)
- {
- 	struct list_head *next;
-@@ -290,166 +294,6 @@ struct list_head *defaults_get_uris(void)
- 	return list;
- }
- 
--/*
-- * Read config env variables and check they have been set.
-- *
-- * This simple minded routine assumes the config file
-- * is valid bourne shell script without spaces around "="
-- * and that it has valid values.
-- */
--unsigned int defaults_read_config(unsigned int to_syslog)
--{
--	FILE *f;
--	char buf[MAX_LINE_LEN];
--	char *res;
--
--	f = open_fopen_r(DEFAULTS_CONFIG_FILE);
--	if (!f)
--		return 0;
--
--	while ((res = fgets(buf, MAX_LINE_LEN, f))) {
--		char *key, *value;
--
--		if (!parse_line(res, &key, &value))
--			continue;
--
--		if (check_set_config_value(key, ENV_NAME_MASTER_MAP, value, to_syslog) ||
--		    check_set_config_value(key, ENV_NAME_TIMEOUT, value, to_syslog) ||
--		    check_set_config_value(key, ENV_NAME_NEGATIVE_TIMEOUT, value, to_syslog) ||
--		    check_set_config_value(key, ENV_NAME_BROWSE_MODE, value, to_syslog) ||
--		    check_set_config_value(key, ENV_NAME_LOGGING, value, to_syslog) ||
--		    check_set_config_value(key, ENV_LDAP_TIMEOUT, value, to_syslog) ||
--		    check_set_config_value(key, ENV_LDAP_NETWORK_TIMEOUT, value, to_syslog) ||
--		    check_set_config_value(key, ENV_NAME_MAP_OBJ_CLASS, value, to_syslog) ||
--		    check_set_config_value(key, ENV_NAME_ENTRY_OBJ_CLASS, value, to_syslog) ||
--		    check_set_config_value(key, ENV_NAME_MAP_ATTR, value, to_syslog) ||
--		    check_set_config_value(key, ENV_NAME_ENTRY_ATTR, value, to_syslog) ||
--		    check_set_config_value(key, ENV_NAME_VALUE_ATTR, value, to_syslog) ||
--		    check_set_config_value(key, ENV_APPEND_OPTIONS, value, to_syslog) ||
--		    check_set_config_value(key, ENV_MOUNT_WAIT, value, to_syslog) ||
--		    check_set_config_value(key, ENV_UMOUNT_WAIT, value, to_syslog) ||
--		    check_set_config_value(key, ENV_AUTH_CONF_FILE, value, to_syslog) ||
--		    check_set_config_value(key, ENV_MAP_HASH_TABLE_SIZE, value, to_syslog) ||
--		    check_set_config_value(key, ENV_MOUNT_NFS_DEFAULT_PROTOCOL, value, to_syslog))
--			;
--	}
--
--	if (!feof(f) || ferror(f)) {
--		if (!to_syslog) {
--			fprintf(stderr,
--				"fgets returned error %d while reading %s\n",
--				ferror(f), DEFAULTS_CONFIG_FILE);
--		} else {
--			logmsg("fgets returned error %d while reading %s",
--			      ferror(f), DEFAULTS_CONFIG_FILE);
--		}
--		fclose(f);
--		return 0;
--	}
--
--	fclose(f);
--	return 1;
--}
--
--const char *defaults_get_master_map(void)
--{
--	char *master;
--
--	master = get_env_string(ENV_NAME_MASTER_MAP);
--	if (!master)
--		return strdup(default_master_map_name);
--
--	return (const char *) master;
--}
--
--int defaults_master_set(void)
--{
--	char *val = getenv(ENV_NAME_MASTER_MAP);
--	if (!val)
--		return 0;
--
--	return 1;
--}
--
--unsigned int defaults_get_timeout(void)
--{
--	long timeout;
--
--	timeout = get_env_number(ENV_NAME_TIMEOUT);
--	if (timeout < 0)
--		timeout = DEFAULT_TIMEOUT;
--
--	return (unsigned int) timeout;
--}
--
--unsigned int defaults_get_negative_timeout(void)
--{
--	long n_timeout;
--
--	n_timeout = get_env_number(ENV_NAME_NEGATIVE_TIMEOUT);
--	if (n_timeout <= 0)
--		n_timeout = DEFAULT_NEGATIVE_TIMEOUT;
--
--	return (unsigned int) n_timeout;
--}
--
--unsigned int defaults_get_browse_mode(void)
--{
--	int res;
--
--	res = get_env_yesno(ENV_NAME_BROWSE_MODE);
--	if (res < 0)
--		res = DEFAULT_BROWSE_MODE;
--
--	return res;
--}
--
--unsigned int defaults_get_logging(void)
--{
--	char *res;
--	unsigned int logging = DEFAULT_LOGGING;
--
--	res = get_env_string(ENV_NAME_LOGGING);
--	if (!res)
--		return logging;
--
--	if (!strcasecmp(res, "none"))
--		logging = DEFAULT_LOGGING;
--	else {
--		if (!strcasecmp(res, "verbose"))
--			logging |= LOGOPT_VERBOSE;
--
--		if (!strcasecmp(res, "debug"))
--			logging |= LOGOPT_DEBUG;
--	}
--
--	free(res);
--
--	return logging;
--}
--
--unsigned int defaults_get_ldap_timeout(void)
--{
--	int res;
--
--	res = get_env_number(ENV_LDAP_TIMEOUT);
--	if (res < 0)
--		res = DEFAULT_LDAP_TIMEOUT;
--
--	return res;
--}
--
--unsigned int defaults_get_ldap_network_timeout(void)
--{
--	int res;
--
--	res = get_env_number(ENV_LDAP_NETWORK_TIMEOUT);
--	if (res < 0)
--		res = DEFAULT_LDAP_NETWORK_TIMEOUT;
--
--	return res;
--}
--
- struct ldap_schema *defaults_get_default_schema(void)
- {
- 	struct ldap_schema *schema;
-@@ -645,6 +489,167 @@ struct ldap_schema *defaults_get_schema(void)
- 
- 	return schema;
- }
-+#endif
-+
-+/*
-+ * Read config env variables and check they have been set.
-+ *
-+ * This simple minded routine assumes the config file
-+ * is valid bourne shell script without spaces around "="
-+ * and that it has valid values.
-+ */
-+unsigned int defaults_read_config(unsigned int to_syslog)
-+{
-+	FILE *f;
-+	char buf[MAX_LINE_LEN];
-+	char *res;
-+
-+	f = open_fopen_r(DEFAULTS_CONFIG_FILE);
-+	if (!f)
-+		return 0;
-+
-+	while ((res = fgets(buf, MAX_LINE_LEN, f))) {
-+		char *key, *value;
-+
-+		if (!parse_line(res, &key, &value))
-+			continue;
-+
-+		if (check_set_config_value(key, ENV_NAME_MASTER_MAP, value, to_syslog) ||
-+		    check_set_config_value(key, ENV_NAME_TIMEOUT, value, to_syslog) ||
-+		    check_set_config_value(key, ENV_NAME_NEGATIVE_TIMEOUT, value, to_syslog) ||
-+		    check_set_config_value(key, ENV_NAME_BROWSE_MODE, value, to_syslog) ||
-+		    check_set_config_value(key, ENV_NAME_LOGGING, value, to_syslog) ||
-+		    check_set_config_value(key, ENV_LDAP_TIMEOUT, value, to_syslog) ||
-+		    check_set_config_value(key, ENV_LDAP_NETWORK_TIMEOUT, value, to_syslog) ||
-+		    check_set_config_value(key, ENV_NAME_MAP_OBJ_CLASS, value, to_syslog) ||
-+		    check_set_config_value(key, ENV_NAME_ENTRY_OBJ_CLASS, value, to_syslog) ||
-+		    check_set_config_value(key, ENV_NAME_MAP_ATTR, value, to_syslog) ||
-+		    check_set_config_value(key, ENV_NAME_ENTRY_ATTR, value, to_syslog) ||
-+		    check_set_config_value(key, ENV_NAME_VALUE_ATTR, value, to_syslog) ||
-+		    check_set_config_value(key, ENV_APPEND_OPTIONS, value, to_syslog) ||
-+		    check_set_config_value(key, ENV_MOUNT_WAIT, value, to_syslog) ||
-+		    check_set_config_value(key, ENV_UMOUNT_WAIT, value, to_syslog) ||
-+		    check_set_config_value(key, ENV_AUTH_CONF_FILE, value, to_syslog) ||
-+		    check_set_config_value(key, ENV_MAP_HASH_TABLE_SIZE, value, to_syslog) ||
-+		    check_set_config_value(key, ENV_MOUNT_NFS_DEFAULT_PROTOCOL, value, to_syslog))
-+			;
-+	}
-+
-+	if (!feof(f) || ferror(f)) {
-+		if (!to_syslog) {
-+			fprintf(stderr,
-+				"fgets returned error %d while reading %s\n",
-+				ferror(f), DEFAULTS_CONFIG_FILE);
-+		} else {
-+			logmsg("fgets returned error %d while reading %s",
-+			      ferror(f), DEFAULTS_CONFIG_FILE);
-+		}
-+		fclose(f);
-+		return 0;
-+	}
-+
-+	fclose(f);
-+	return 1;
-+}
-+
-+const char *defaults_get_master_map(void)
-+{
-+	char *master;
-+
-+	master = get_env_string(ENV_NAME_MASTER_MAP);
-+	if (!master)
-+		return strdup(default_master_map_name);
-+
-+	return (const char *) master;
-+}
-+
-+int defaults_master_set(void)
-+{
-+	char *val = getenv(ENV_NAME_MASTER_MAP);
-+	if (!val)
-+		return 0;
-+
-+	return 1;
-+}
-+
-+unsigned int defaults_get_timeout(void)
-+{
-+	long timeout;
-+
-+	timeout = get_env_number(ENV_NAME_TIMEOUT);
-+	if (timeout < 0)
-+		timeout = DEFAULT_TIMEOUT;
-+
-+	return (unsigned int) timeout;
-+}
-+
-+unsigned int defaults_get_negative_timeout(void)
-+{
-+	long n_timeout;
-+
-+	n_timeout = get_env_number(ENV_NAME_NEGATIVE_TIMEOUT);
-+	if (n_timeout <= 0)
-+		n_timeout = DEFAULT_NEGATIVE_TIMEOUT;
-+
-+	return (unsigned int) n_timeout;
-+}
-+
-+unsigned int defaults_get_browse_mode(void)
-+{
-+	int res;
-+
-+	res = get_env_yesno(ENV_NAME_BROWSE_MODE);
-+	if (res < 0)
-+		res = DEFAULT_BROWSE_MODE;
-+
-+	return res;
-+}
-+
-+unsigned int defaults_get_logging(void)
-+{
-+	char *res;
-+	unsigned int logging = DEFAULT_LOGGING;
-+
-+	res = get_env_string(ENV_NAME_LOGGING);
-+	if (!res)
-+		return logging;
-+
-+	if (!strcasecmp(res, "none"))
-+		logging = DEFAULT_LOGGING;
-+	else {
-+		if (!strcasecmp(res, "verbose"))
-+			logging |= LOGOPT_VERBOSE;
-+
-+		if (!strcasecmp(res, "debug"))
-+			logging |= LOGOPT_DEBUG;
-+	}
-+
-+	free(res);
-+
-+	return logging;
-+}
-+
-+unsigned int defaults_get_ldap_timeout(void)
-+{
-+	int res;
-+
-+	res = get_env_number(ENV_LDAP_TIMEOUT);
-+	if (res < 0)
-+		res = DEFAULT_LDAP_TIMEOUT;
-+
-+	return res;
-+}
-+
-+unsigned int defaults_get_ldap_network_timeout(void)
-+{
-+	int res;
-+
-+	res = get_env_number(ENV_LDAP_NETWORK_TIMEOUT);
-+	if (res < 0)
-+		res = DEFAULT_LDAP_NETWORK_TIMEOUT;
-+
-+	return res;
-+}
- 
- unsigned int defaults_get_mount_nfs_default_proto(void)
- {
-diff --git a/modules/lookup_ldap.c b/modules/lookup_ldap.c
-index 3bc4dc5..431e50d 100644
---- a/modules/lookup_ldap.c
-+++ b/modules/lookup_ldap.c
-@@ -28,6 +28,7 @@
- #include <arpa/nameser.h>
- #include <resolv.h>
- #include <lber.h>
-+#include <libxml/tree.h>
- 
- #define MODULE_LOOKUP
- #include "automount.h"
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-make-description-of-default-MOUNT_WAIT-setting-clear.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-make-description-of-default-MOUNT_WAIT-setting-clear.patch
deleted file mode 100644
index a3dd3fb..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-make-description-of-default-MOUNT_WAIT-setting-clear.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-autofs-5.0.7 - make description of default MOUNT_WAIT setting clear
-
-From: Ian Kent <ikent@redhat.com>
-
-
----
-
- CHANGELOG                      |    1 +
- redhat/autofs.sysconfig.in     |    5 +++--
- samples/autofs.conf.default.in |    5 +++--
- 3 files changed, 7 insertions(+), 4 deletions(-)
-
-
-diff --git a/CHANGELOG b/CHANGELOG
-index 79cf673..961e340 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -8,6 +8,7 @@
- - dont wait forever to restart.
- - add timeout option description to man page.
- - fix null map entry order handling.
-+- make description of default MOUNT_WAIT setting clear.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/redhat/autofs.sysconfig.in b/redhat/autofs.sysconfig.in
-index 36b924d..a8992c4 100644
---- a/redhat/autofs.sysconfig.in
-+++ b/redhat/autofs.sysconfig.in
-@@ -18,8 +18,9 @@ TIMEOUT=300
- # 	       Setting this timeout can cause problems when
- # 	       mount would otherwise wait for a server that
- # 	       is temporarily unavailable, such as when it's
--# 	       restarting. The defailt of waiting for mount(8)
--# 	       usually results in a wait of around 3 minutes.
-+# 	       restarting. The default setting (-1) of waiting
-+# 	       for mount(8) usually results in a wait of around
-+# 	       3 minutes.
- #
- #MOUNT_WAIT=-1
- #
-diff --git a/samples/autofs.conf.default.in b/samples/autofs.conf.default.in
-index ac2f63b..1da89cf 100644
---- a/samples/autofs.conf.default.in
-+++ b/samples/autofs.conf.default.in
-@@ -18,8 +18,9 @@ TIMEOUT=300
- # 	       Setting this timeout can cause problems when
- # 	       mount would otherwise wait for a server that
- # 	       is temporarily unavailable, such as when it's
--# 	       restarting. The defailt of waiting for mount(8)
--# 	       usually results in a wait of around 3 minutes.
-+# 	       restarting. The default setting (-1) of waiting
-+# 	       for mount(8) usually results in a wait of around
-+# 	       3 minutes.
- #
- #MOUNT_WAIT=-1
- #
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-make-yellow-pages-support-optional.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-make-yellow-pages-support-optional.patch
deleted file mode 100644
index 4199690..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-make-yellow-pages-support-optional.patch
+++ /dev/null
@@ -1,156 +0,0 @@
-autofs-5.0.7 - make yellow pages support optional
-
-From: Chris Packham <chris.packham@alliedtelesis.co.nz>
-
-If rpcsvc/ypclnt.h is not available don't compile in Yellow Pages
-support.
----
-
- CHANGELOG           |    1 +
- Makefile.conf.in    |    3 +++
- configure           |   16 ++++++++++++++++
- configure.in        |    9 +++++++++
- include/config.h.in |    3 +++
- lib/rpc_subs.c      |    1 -
- modules/Makefile    |    9 +++++++--
- 7 files changed, 39 insertions(+), 3 deletions(-)
-
-
-diff --git a/CHANGELOG b/CHANGELOG
-index 1130db6..ed17163 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -25,6 +25,7 @@
- - don't schedule new alarms after readmap.
- - use numeric protocol ids instead of protoent structs.
- - lib/defaults.c: use WITH_LDAP conditional around LDAP types.
-+- make yellow pages support optional.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/Makefile.conf.in b/Makefile.conf.in
-index 802318b..3766d45 100644
---- a/Makefile.conf.in
-+++ b/Makefile.conf.in
-@@ -43,6 +43,9 @@ NISPLUS = @HAVE_NISPLUS@
- # SMBFS support: yes (1) no (0)
- SMBFS = @HAVE_SMBMOUNT@
- 
-+# YellowPages support: yes (1) no (0)
-+YPCLNT = @HAVE_YPCLNT@
-+
- # Support for calling e2fsck when mounting ext2 filesystems
- EXT2FS = @HAVE_E2FSCK@
- 
-diff --git a/configure b/configure
-index 3722a46..cf6428c 100755
---- a/configure
-+++ b/configure
-@@ -614,6 +614,7 @@ XML_FLAGS
- LIBLDAP
- HAVE_LDAP
- LDAP_FLAGS
-+HAVE_YPCLNT
- HAVE_NISPLUS
- EGREP
- GREP
-@@ -4575,6 +4576,21 @@ fi
- 
- 
- 
-+# YellowPages support?
-+HAVE_YPCLNT=0
-+ac_fn_c_check_header_mongrel "$LINENO" "rpcsvc/ypclnt.h" "ac_cv_header_rpcsvc_ypclnt_h" "$ac_includes_default"
-+if test "x$ac_cv_header_rpcsvc_ypclnt_h" = xyes; then :
-+  HAVE_YPCLNT=1
-+fi
-+
-+
-+
-+if test "$HAVE_YPCLNT" = "1"; then
-+
-+$as_echo "#define HAVE_YPCLNT 1" >>confdefs.h
-+
-+fi
-+
- #
- # OpenLDAP support?  Expect that this may have a special directory...
- #
-diff --git a/configure.in b/configure.in
-index 90bda62..363c376 100644
---- a/configure.in
-+++ b/configure.in
-@@ -213,6 +213,15 @@ HAVE_NISPLUS=0
- AC_CHECK_HEADER(rpcsvc/nis.h, HAVE_NISPLUS=1)
- AC_SUBST(HAVE_NISPLUS)
- 
-+# YellowPages support?
-+HAVE_YPCLNT=0
-+AC_CHECK_HEADER([rpcsvc/ypclnt.h], HAVE_YPCLNT=1)
-+AC_SUBST(HAVE_YPCLNT)
-+if test "$HAVE_YPCLNT" = "1"; then
-+	AC_DEFINE(HAVE_YPCLNT, 1,
-+		[Define if using YellowPages])
-+fi
-+
- #
- # OpenLDAP support?  Expect that this may have a special directory...
- #
-diff --git a/include/config.h.in b/include/config.h.in
-index 9bdf98a..7f1c5b5 100644
---- a/include/config.h.in
-+++ b/include/config.h.in
-@@ -72,6 +72,9 @@
- /* Define to 1 if you have the <unistd.h> header file. */
- #undef HAVE_UNISTD_H
- 
-+/* Define if using YellowPages */
-+#undef HAVE_YPCLNT
-+
- /* Use libxml2 tsd usage workaround */
- #undef LIBXML2_WORKAROUND
- 
-diff --git a/lib/rpc_subs.c b/lib/rpc_subs.c
-index ad1d557..718caf9 100644
---- a/lib/rpc_subs.c
-+++ b/lib/rpc_subs.c
-@@ -27,7 +27,6 @@
- #include <net/if.h>
- #include <netinet/in.h>
- #include <arpa/inet.h>
--#include <rpcsvc/ypclnt.h>
- #include <errno.h>
- #include <sys/ioctl.h>
- #include <ctype.h>
-diff --git a/modules/Makefile b/modules/Makefile
-index 939da7c..c5deb24 100644
---- a/modules/Makefile
-+++ b/modules/Makefile
-@@ -5,13 +5,13 @@
- -include ../Makefile.conf
- include ../Makefile.rules
- 
--SRCS :=	lookup_yp.c  lookup_file.c lookup_program.c  lookup_userhome.c \
-+SRCS :=	lookup_file.c lookup_program.c  lookup_userhome.c \
- 	lookup_multi.c lookup_hosts.c lookup_dir.c \
- 	parse_sun.c    \
- 	mount_generic.c  mount_nfs.c  mount_afs.c  mount_autofs.c \
- 	mount_changer.c  mount_bind.c
- 
--MODS :=	lookup_yp.so lookup_file.so lookup_program.so lookup_userhome.so \
-+MODS :=	lookup_file.so lookup_program.so lookup_userhome.so \
- 	lookup_multi.so lookup_hosts.so lookup_dir.so \
- 	parse_sun.so \
- 	mount_generic.so mount_nfs.so mount_afs.so mount_autofs.so \
-@@ -37,6 +37,11 @@ ifeq ($(NISPLUS), 1)
-   MODS += lookup_nisplus.so
- endif
- 
-+ifeq ($(YPCLNT), 1)
-+  SRCS += lookup_yp.c
-+  MODS += lookup_yp.so
-+endif
-+
- ifeq ($(LDAP), 1)
-   SRCS += lookup_ldap.c
-   MODS += lookup_ldap.so
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-modules-replicated-use-sin6.addr-s6_addr32.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-modules-replicated-use-sin6.addr-s6_addr32.patch
deleted file mode 100644
index 4516bc5..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-modules-replicated-use-sin6.addr-s6_addr32.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-autofs-5.0.7 -  modules/replicated.c: use sin6_addr.s6_addr32
-
-From: Chris Packham <chris.packham@alliedtelesis.co.nz>
-
-The exported in6.h kernel header provides a convenience macro s6_addr32
-for accessing the 32bit words of an ipv6 address. Use this instead of
-__in6_u.__u6_addr32.
----
-
- CHANGELOG            |    1 +
- modules/replicated.c |    2 +-
- 2 files changed, 2 insertions(+), 1 deletions(-)
-
-
-diff --git a/CHANGELOG b/CHANGELOG
-index ed17163..4eaa9f9 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -26,6 +26,7 @@
- - use numeric protocol ids instead of protoent structs.
- - lib/defaults.c: use WITH_LDAP conditional around LDAP types.
- - make yellow pages support optional.
-+- modules/replicated.c: use sin6_addr.s6_addr32.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/modules/replicated.c b/modules/replicated.c
-index dbd5513..26f64b8 100644
---- a/modules/replicated.c
-+++ b/modules/replicated.c
-@@ -1146,7 +1146,7 @@ try_name:
- 				rr4++;
- 		} else if (this->ai_family == AF_INET6) {
- 			struct sockaddr_in6 *addr = (struct sockaddr_in6 *) this->ai_addr;
--			if (!IN6_IS_ADDR_LOOPBACK(addr->sin6_addr.__in6_u.__u6_addr32))
-+			if (!IN6_IS_ADDR_LOOPBACK(addr->sin6_addr.s6_addr32))
- 				rr6++;
- 		}
- 		this = this->ai_next;
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-update-kernel-include-files.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-update-kernel-include-files.patch
deleted file mode 100644
index 3b6bb92..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-update-kernel-include-files.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-autofs-5.0.7 - update kernel include files
-
-From: Ian Kent <raven@themaw.net>
-
-Update autofs include files to include the latest changes.
----
- include/linux/auto_fs.h  |   33 ++++++++++-----------------------
- include/linux/auto_fs4.h |    3 ++-
- 2 files changed, 12 insertions(+), 24 deletions(-)
-
-diff --git a/include/linux/auto_fs.h b/include/linux/auto_fs.h
-index 91d414f..64df1a6 100644
---- a/include/linux/auto_fs.h
-+++ b/include/linux/auto_fs.h
-@@ -14,13 +14,8 @@
- #ifndef _LINUX_AUTO_FS_H
- #define _LINUX_AUTO_FS_H
- 
--#ifdef __KERNEL__
--#include <linux/fs.h>
--#include <linux/limits.h>
- #include <linux/types.h>
--#include <linux/ioctl.h>
--#else
--#include <asm/types.h>
-+#ifndef __KERNEL__
- #include <sys/ioctl.h>
- #endif /* __KERNEL__ */
- 
-@@ -32,25 +27,16 @@
- #define AUTOFS_MIN_PROTO_VERSION	AUTOFS_PROTO_VERSION
- 
- /*
-- * Architectures where both 32- and 64-bit binaries can be executed
-- * on 64-bit kernels need this.  This keeps the structure format
-- * uniform, and makes sure the wait_queue_token isn't too big to be
-- * passed back down to the kernel.
-- *
-- * This assumes that on these architectures:
-- * mode     32 bit    64 bit
-- * -------------------------
-- * int      32 bit    32 bit
-- * long     32 bit    64 bit
-- *
-- * If so, 32-bit user-space code should be backwards compatible.
-+ * The wait_queue_token (autofs_wqt_t) is part of a structure which is passed
-+ * back to the kernel via ioctl from userspace. On architectures where 32- and
-+ * 64-bit userspace binaries can be executed it's important that the size of
-+ * autofs_wqt_t stays constant between 32- and 64-bit Linux kernels so that we
-+ * do not break the binary ABI interface by changing the structure size.
-  */
--
--#if defined(__sparc__) || defined(__mips__) || defined(__x86_64__) \
-- || defined(__powerpc__) || defined(__s390__)
--typedef unsigned int autofs_wqt_t;
--#else
-+#if defined(__ia64__) || defined(__alpha__) /* pure 64bit architectures */
- typedef unsigned long autofs_wqt_t;
-+#else
-+typedef unsigned int autofs_wqt_t;
- #endif
- 
- /* Packet types */
-@@ -81,6 +67,7 @@ struct autofs_packet_expire {
- #define AUTOFS_IOC_FAIL       _IO(0x93,0x61)
- #define AUTOFS_IOC_CATATONIC  _IO(0x93,0x62)
- #define AUTOFS_IOC_PROTOVER   _IOR(0x93,0x63,int)
-+#define AUTOFS_IOC_SETTIMEOUT32 _IOWR(0x93,0x64,compat_ulong_t)
- #define AUTOFS_IOC_SETTIMEOUT _IOWR(0x93,0x64,unsigned long)
- #define AUTOFS_IOC_EXPIRE     _IOR(0x93,0x65,struct autofs_packet_expire)
- 
-diff --git a/include/linux/auto_fs4.h b/include/linux/auto_fs4.h
-index 55fa478..e02982f 100644
---- a/include/linux/auto_fs4.h
-+++ b/include/linux/auto_fs4.h
-@@ -12,6 +12,7 @@
- #define _LINUX_AUTO_FS4_H
- 
- /* Include common v3 definitions */
-+#include <linux/types.h>
- #include <linux/auto_fs.h>
- 
- /* autofs v4 definitions */
-@@ -23,7 +24,7 @@
- #define AUTOFS_MIN_PROTO_VERSION	3
- #define AUTOFS_MAX_PROTO_VERSION	5
- 
--#define AUTOFS_PROTO_SUBVERSION		1
-+#define AUTOFS_PROTO_SUBVERSION		2
- 
- /* Mask for expire behaviour */
- #define AUTOFS_EXP_IMMEDIATE		1
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-use-numeric-protocol-ids-instead-of-protoent-structs.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-use-numeric-protocol-ids-instead-of-protoent-structs.patch
deleted file mode 100644
index 113b0a0..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-use-numeric-protocol-ids-instead-of-protoent-structs.patch
+++ /dev/null
@@ -1,471 +0,0 @@
-autofs-5.0.7 - use numeric protocol ids instead of protoent structs
-
-From: Leonardo Chiquitto <leonardo.lists@gmail.com>
-
-The function getprotobyname() is not reentrant, so we can't call
-it simultaneously from multiple threads. Instead of switching to
-the reentrant version which adds more complexity to the code,
-lets use numeric protocol IDs instead of protoent structures.
----
-
- CHANGELOG            |    1 +
- include/rpc_subs.h   |    4 +--
- lib/rpc_subs.c       |   80 ++++++++++++++++++--------------------------------
- modules/replicated.c |   42 +++++++++++---------------
- 4 files changed, 50 insertions(+), 77 deletions(-)
-
-
-diff --git a/CHANGELOG b/CHANGELOG
-index 4cf5621..ba1d65b 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -23,6 +23,7 @@
- - fix use get_proximity() without libtirpc.
- - don't use dirent d_type to filter out files in scandir()
- - don't schedule new alarms after readmap.
-+- use numeric protocol ids instead of protoent structs.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/include/rpc_subs.h b/include/rpc_subs.h
-index ca474d9..b6d59f9 100644
---- a/include/rpc_subs.h
-+++ b/include/rpc_subs.h
-@@ -54,7 +54,7 @@ struct conn_info {
- 	unsigned short port;
- 	unsigned long program;
- 	unsigned long version;
--	struct protoent *proto;
-+	int proto;
- 	unsigned int send_sz;
- 	unsigned int recv_sz;
- 	struct timeval timeout;
-@@ -66,7 +66,7 @@ int rpc_udp_getclient(struct conn_info *, unsigned int, unsigned int);
- void rpc_destroy_udp_client(struct conn_info *);
- int rpc_tcp_getclient(struct conn_info *, unsigned int, unsigned int);
- void rpc_destroy_tcp_client(struct conn_info *);
--int rpc_portmap_getclient(struct conn_info *, const char *, struct sockaddr *, size_t, const char *, unsigned int);
-+int rpc_portmap_getclient(struct conn_info *, const char *, struct sockaddr *, size_t, int, unsigned int);
- int rpc_portmap_getport(struct conn_info *, struct pmap *, unsigned short *);
- int rpc_ping_proto(struct conn_info *);
- int rpc_ping(const char *, long, long, unsigned int);
-diff --git a/lib/rpc_subs.c b/lib/rpc_subs.c
-index d33a3c4..ad1d557 100644
---- a/lib/rpc_subs.c
-+++ b/lib/rpc_subs.c
-@@ -170,7 +170,7 @@ static int rpc_do_create_client(struct sockaddr *addr, struct conn_info *info, i
- 
- 	*client = NULL;
- 
--	proto = info->proto->p_proto;
-+	proto = info->proto;
- 	if (proto == IPPROTO_UDP)
- 		type = SOCK_DGRAM;
- 	else
-@@ -201,7 +201,7 @@ static int rpc_do_create_client(struct sockaddr *addr, struct conn_info *info, i
- 	in4_raddr = (struct sockaddr_in *) addr;
- 	in4_raddr->sin_port = htons(info->port);
- 
--	switch (info->proto->p_proto) {
-+	switch (info->proto) {
- 	case IPPROTO_UDP:
- 		clnt = clntudp_bufcreate(in4_raddr,
- 					 info->program, info->version,
-@@ -241,7 +241,7 @@ static int rpc_do_create_client(struct sockaddr *addr, struct conn_info *info, i
- 
- 	*client = NULL;
- 
--	proto = info->proto->p_proto;
-+	proto = info->proto;
- 	if (proto == IPPROTO_UDP)
- 		type = SOCK_DGRAM;
- 	else
-@@ -292,11 +292,11 @@ static int rpc_do_create_client(struct sockaddr *addr, struct conn_info *info, i
- 	nb_addr.maxlen = nb_addr.len = slen;
- 	nb_addr.buf = addr;
- 
--	if (info->proto->p_proto == IPPROTO_UDP)
-+	if (info->proto == IPPROTO_UDP)
- 		clnt = clnt_dg_create(*fd, &nb_addr,
- 				      info->program, info->version,
- 				      info->send_sz, info->recv_sz);
--	else if (info->proto->p_proto == IPPROTO_TCP) {
-+	else if (info->proto == IPPROTO_TCP) {
- 		ret = connect_nb(*fd, addr, slen, &info->timeout);
- 		if (ret < 0)
- 			return ret;
-@@ -355,7 +355,7 @@ static int create_client(struct conn_info *info, CLIENT **client)
- 	memset(&hints, 0, sizeof(hints));
- 	hints.ai_flags = AI_ADDRCONFIG;
- 	hints.ai_family = AF_UNSPEC;
--	if (info->proto->p_proto == IPPROTO_UDP)
-+	if (info->proto == IPPROTO_UDP)
- 		hints.ai_socktype = SOCK_DGRAM;
- 	else
- 		hints.ai_socktype = SOCK_STREAM;
-@@ -370,7 +370,7 @@ static int create_client(struct conn_info *info, CLIENT **client)
- 
- 	haddr = ai;
- 	while (haddr) {
--		if (haddr->ai_protocol != info->proto->p_proto) {
-+		if (haddr->ai_protocol != info->proto) {
- 			haddr = haddr->ai_next;
- 			continue;
- 		}
-@@ -417,16 +417,11 @@ out_close:
- int rpc_udp_getclient(struct conn_info *info,
- 		      unsigned int program, unsigned int version)
- {
--	struct protoent *pe_proto;
- 	CLIENT *client;
- 	int ret;
- 
- 	if (!info->client) {
--		pe_proto = getprotobyname("udp");
--		if (!pe_proto)
--			return -ENOENT;
--
--		info->proto = pe_proto;
-+		info->proto = IPPROTO_UDP;
- 		info->timeout.tv_sec = RPC_TOUT_UDP;
- 		info->timeout.tv_usec = 0;
- 		info->send_sz = UDPMSGSIZE;
-@@ -458,16 +453,11 @@ void rpc_destroy_udp_client(struct conn_info *info)
- int rpc_tcp_getclient(struct conn_info *info,
- 		      unsigned int program, unsigned int version)
- {
--	struct protoent *pe_proto;
- 	CLIENT *client;
- 	int ret;
- 
- 	if (!info->client) {
--		pe_proto = getprotobyname("tcp");
--		if (!pe_proto)
--			return -ENOENT;
--
--		info->proto = pe_proto;
-+		info->proto = IPPROTO_TCP;
- 		info->timeout.tv_sec = RPC_TOUT_TCP;
- 		info->timeout.tv_usec = 0;
- 		info->send_sz = 0;
-@@ -513,23 +503,18 @@ void rpc_destroy_tcp_client(struct conn_info *info)
- 
- int rpc_portmap_getclient(struct conn_info *info,
- 			  const char *host, struct sockaddr *addr, size_t addr_len,
--			  const char *proto, unsigned int option)
-+			  int proto, unsigned int option)
- {
--	struct protoent *pe_proto;
- 	CLIENT *client;
- 	int ret;
- 
--	pe_proto = getprotobyname(proto);
--	if (!pe_proto)
--		return -ENOENT;
--
- 	info->host = host;
- 	info->addr = addr;
- 	info->addr_len = addr_len;
- 	info->program = PMAPPROG;
- 	info->port = PMAPPORT;
- 	info->version = PMAPVERS;
--	info->proto = pe_proto;
-+	info->proto = proto;
- 	info->send_sz = RPCSMALLMSGSIZE;
- 	info->recv_sz = RPCSMALLMSGSIZE;
- 	info->timeout.tv_sec = PMAP_TOUT_UDP;
-@@ -537,7 +522,7 @@ int rpc_portmap_getclient(struct conn_info *info,
- 	info->close_option = option;
- 	info->client = NULL;
- 
--	if (pe_proto->p_proto == IPPROTO_TCP)
-+	if (info->proto == IPPROTO_TCP)
- 		info->timeout.tv_sec = PMAP_TOUT_TCP;
- 
- 	ret = create_client(info, &client);
-@@ -555,7 +540,7 @@ int rpc_portmap_getport(struct conn_info *info,
- 	struct conn_info pmap_info;
- 	CLIENT *client;
- 	enum clnt_stat status;
--	int proto = info->proto->p_proto;
-+	int proto = info->proto;
- 	int ret;
- 
- 	memset(&pmap_info, 0, sizeof(struct conn_info));
-@@ -633,13 +618,13 @@ int rpc_ping_proto(struct conn_info *info)
- {
- 	CLIENT *client;
- 	enum clnt_stat status;
--	int proto = info->proto->p_proto;
-+	int proto = info->proto;
- 	int ret;
- 
- 	if (info->client)
- 		client = info->client;
- 	else {
--		if (info->proto->p_proto == IPPROTO_UDP) {
-+		if (info->proto == IPPROTO_UDP) {
- 			info->send_sz = UDPMSGSIZE;
- 			info->recv_sz = UDPMSGSIZE;
- 		}
-@@ -688,7 +673,7 @@ int rpc_ping_proto(struct conn_info *info)
- 
- static unsigned int __rpc_ping(const char *host,
- 				unsigned long version,
--				char *proto,
-+				int proto,
- 				long seconds, long micros,
- 				unsigned int option)
- {
-@@ -696,6 +681,7 @@ static unsigned int __rpc_ping(const char *host,
- 	struct conn_info info;
- 	struct pmap parms;
- 
-+	info.proto = proto;
- 	info.host = host;
- 	info.addr = NULL;
- 	info.addr_len = 0;
-@@ -710,13 +696,9 @@ static unsigned int __rpc_ping(const char *host,
- 
- 	status = RPC_PING_FAIL;
- 
--	info.proto = getprotobyname(proto);
--	if (!info.proto)
--		return status;
--
- 	parms.pm_prog = NFS_PROGRAM;
- 	parms.pm_vers = version;
--	parms.pm_prot = info.proto->p_proto;
-+	parms.pm_prot = info.proto;
- 	parms.pm_port = 0;
- 
- 	status = rpc_portmap_getport(&info, &parms, &info.port);
-@@ -734,19 +716,19 @@ int rpc_ping(const char *host, long seconds, long micros, unsigned int option)
- 	unsigned long vers2 = NFS2_VERSION;
- 	unsigned int status;
- 
--	status = __rpc_ping(host, vers2, "udp", seconds, micros, option);
-+	status = __rpc_ping(host, vers2, IPPROTO_UDP, seconds, micros, option);
- 	if (status > 0)
- 		return RPC_PING_V2 | RPC_PING_UDP;
- 
--	status = __rpc_ping(host, vers3, "udp", seconds, micros, option);
-+	status = __rpc_ping(host, vers3, IPPROTO_UDP, seconds, micros, option);
- 	if (status > 0)
- 		return RPC_PING_V3 | RPC_PING_UDP;
- 
--	status = __rpc_ping(host, vers2, "tcp", seconds, micros, option);
-+	status = __rpc_ping(host, vers2, IPPROTO_TCP, seconds, micros, option);
- 	if (status > 0)
- 		return RPC_PING_V2 | RPC_PING_TCP;
- 
--	status = __rpc_ping(host, vers3, "tcp", seconds, micros, option);
-+	status = __rpc_ping(host, vers3, IPPROTO_TCP, seconds, micros, option);
- 	if (status > 0)
- 		return RPC_PING_V3 | RPC_PING_TCP;
- 
-@@ -769,7 +751,7 @@ int rpc_time(const char *host,
- 	double taken;
- 	struct timeval start, end;
- 	struct timezone tz;
--	char *proto = (ping_proto & RPC_PING_UDP) ? "udp" : "tcp";
-+	int proto = (ping_proto & RPC_PING_UDP) ? IPPROTO_UDP : IPPROTO_TCP;
- 	unsigned long vers = ping_vers;
- 
- 	gettimeofday(&start, &tz);
-@@ -791,12 +773,12 @@ static int rpc_get_exports_proto(struct conn_info *info, exports *exp)
- {
- 	CLIENT *client;
- 	enum clnt_stat status;
--	int proto = info->proto->p_proto;
-+	int proto = info->proto;
- 	unsigned int option = info->close_option;
- 	int vers_entry;
- 	int ret;
- 
--	if (info->proto->p_proto == IPPROTO_UDP) {
-+	if (info->proto == IPPROTO_UDP) {
- 		info->send_sz = UDPMSGSIZE;
- 		info->recv_sz = UDPMSGSIZE;
- 	}
-@@ -903,11 +885,9 @@ exports rpc_get_exports(const char *host, long seconds, long micros, unsigned in
- 	parms.pm_port = 0;
- 
- 	/* Try UDP first */
--	info.proto = getprotobyname("udp");
--	if (!info.proto)
--		goto try_tcp;
-+	info.proto = IPPROTO_UDP;
- 
--	parms.pm_prot = info.proto->p_proto;
-+	parms.pm_prot = info.proto;
- 
- 	status = rpc_portmap_getport(&info, &parms, &info.port);
- 	if (status < 0)
-@@ -920,11 +900,9 @@ exports rpc_get_exports(const char *host, long seconds, long micros, unsigned in
- 		return exportlist;
- 
- try_tcp:
--	info.proto = getprotobyname("tcp");
--	if (!info.proto)
--		return NULL;
-+	info.proto = IPPROTO_TCP;
- 
--	parms.pm_prot = info.proto->p_proto;
-+	parms.pm_prot = info.proto;
- 
- 	status = rpc_portmap_getport(&info, &parms, &info.port);
- 	if (status < 0)
-diff --git a/modules/replicated.c b/modules/replicated.c
-index 6b96320..dbd5513 100644
---- a/modules/replicated.c
-+++ b/modules/replicated.c
-@@ -419,7 +419,7 @@ void free_host_list(struct host **list)
- 
- static unsigned int get_nfs_info(unsigned logopt, struct host *host,
- 			 struct conn_info *pm_info, struct conn_info *rpc_info,
--			 const char *proto, unsigned int version, int port)
-+			 int proto, unsigned int version, int port)
- {
- 	unsigned int random_selection = host->options & MOUNT_FLAG_RANDOM_SELECT;
- 	unsigned int use_weight_only = host->options & MOUNT_FLAG_USE_WEIGHT_ONLY;
-@@ -433,22 +433,18 @@ static unsigned int get_nfs_info(unsigned logopt, struct host *host,
- 	int status, count = 0;
- 
- 	if (host->addr)
--		debug(logopt, "called with host %s(%s) proto %s version 0x%x",
-+		debug(logopt, "called with host %s(%s) proto %d version 0x%x",
- 		      host->name, get_addr_string(host->addr, buf, len),
- 		      proto, version);
- 	else
- 		debug(logopt,
--		      "called for host %s proto %s version 0x%x",
-+		      "called for host %s proto %d version 0x%x",
- 		      host->name, proto, version);
- 
--	rpc_info->proto = getprotobyname(proto);
--	if (!rpc_info->proto)
--		return 0;
--
-+	rpc_info->proto = proto;
- 	memset(&parms, 0, sizeof(struct pmap));
--
- 	parms.pm_prog = NFS_PROGRAM;
--	parms.pm_prot = rpc_info->proto->p_proto;
-+	parms.pm_prot = proto;
- 
- 	if (!(version & NFS4_REQUESTED))
- 		goto v3_ver;
-@@ -479,7 +475,7 @@ static unsigned int get_nfs_info(unsigned logopt, struct host *host,
- 		}
- 	}
- 
--	if (rpc_info->proto->p_proto == IPPROTO_UDP)
-+	if (rpc_info->proto == IPPROTO_UDP)
- 		status = rpc_udp_getclient(rpc_info, NFS_PROGRAM, NFS4_VERSION);
- 	else
- 		status = rpc_tcp_getclient(rpc_info, NFS_PROGRAM, NFS4_VERSION);
-@@ -540,7 +536,7 @@ v3_ver:
- 			goto v2_ver;
- 	}
- 
--	if (rpc_info->proto->p_proto == IPPROTO_UDP)
-+	if (rpc_info->proto == IPPROTO_UDP)
- 		status = rpc_udp_getclient(rpc_info, NFS_PROGRAM, NFS3_VERSION);
- 	else
- 		status = rpc_tcp_getclient(rpc_info, NFS_PROGRAM, NFS3_VERSION);
-@@ -587,7 +583,7 @@ v2_ver:
- 			goto done_ver;
- 	}
- 
--	if (rpc_info->proto->p_proto == IPPROTO_UDP)
-+	if (rpc_info->proto == IPPROTO_UDP)
- 		status = rpc_udp_getclient(rpc_info, NFS_PROGRAM, NFS2_VERSION);
- 	else
- 		status = rpc_tcp_getclient(rpc_info, NFS_PROGRAM, NFS2_VERSION);
-@@ -618,7 +614,7 @@ v2_ver:
- 	}
- 
- done_ver:
--	if (rpc_info->proto->p_proto == IPPROTO_UDP) {
-+	if (rpc_info->proto == IPPROTO_UDP) {
- 		rpc_destroy_udp_client(rpc_info);
- 		rpc_destroy_udp_client(pm_info);
- 	} else {
-@@ -675,7 +671,7 @@ static int get_vers_and_cost(unsigned logopt, struct host *host,
- 
- 	if (version & TCP_REQUESTED) {
- 		supported = get_nfs_info(logopt, host,
--				   &pm_info, &rpc_info, "tcp", vers, port);
-+				   &pm_info, &rpc_info, IPPROTO_TCP, vers, port);
- 		if (IS_ERR(supported)) {
- 			if (ERR(supported) == EHOSTUNREACH ||
- 			    ERR(supported) == ETIMEDOUT)
-@@ -688,7 +684,7 @@ static int get_vers_and_cost(unsigned logopt, struct host *host,
- 
- 	if (version & UDP_REQUESTED) {
- 		supported = get_nfs_info(logopt, host,
--				   &pm_info, &rpc_info, "udp", vers, port);
-+				   &pm_info, &rpc_info, IPPROTO_UDP, vers, port);
- 		if (IS_ERR(supported)) {
- 			if (!ret && ERR(supported) == ETIMEDOUT)
- 				return ret;
-@@ -709,7 +705,7 @@ static int get_supported_ver_and_cost(unsigned logopt, struct host *host,
- 	socklen_t len = INET6_ADDRSTRLEN;
- 	char buf[len + 1];
- 	struct conn_info pm_info, rpc_info;
--	const char *proto;
-+	int proto;
- 	unsigned int vers;
- 	struct timeval start, end;
- 	struct timezone tz;
-@@ -748,10 +744,10 @@ static int get_supported_ver_and_cost(unsigned logopt, struct host *host,
- 	 *  So, we do the conversion here.
- 	 */
- 	if (version & UDP_SELECTED_MASK) {
--		proto = "udp";
-+		proto = IPPROTO_UDP;
- 		version >>= 8;
- 	} else
--		proto = "tcp";
-+		proto = IPPROTO_TCP;
- 
- 	switch (version) {
- 	case NFS2_SUPPORTED:
-@@ -768,9 +764,7 @@ static int get_supported_ver_and_cost(unsigned logopt, struct host *host,
- 		return 0;
- 	}
- 
--	rpc_info.proto = getprotobyname(proto);
--	if (!rpc_info.proto)
--		return 0;
-+	rpc_info.proto = proto;
- 
- 	if (port > 0)
- 		rpc_info.port = port;
-@@ -786,14 +780,14 @@ static int get_supported_ver_and_cost(unsigned logopt, struct host *host,
- 
- 		memset(&parms, 0, sizeof(struct pmap));
- 		parms.pm_prog = NFS_PROGRAM;
--		parms.pm_prot = rpc_info.proto->p_proto;
-+		parms.pm_prot = rpc_info.proto;
- 		parms.pm_vers = vers;
- 		ret = rpc_portmap_getport(&pm_info, &parms, &rpc_info.port);
- 		if (ret < 0)
- 			goto done;
- 	}
- 
--	if (rpc_info.proto->p_proto == IPPROTO_UDP)
-+	if (rpc_info.proto == IPPROTO_UDP)
- 		status = rpc_udp_getclient(&rpc_info, NFS_PROGRAM, vers);
- 	else
- 		status = rpc_tcp_getclient(&rpc_info, NFS_PROGRAM, vers);
-@@ -815,7 +809,7 @@ static int get_supported_ver_and_cost(unsigned logopt, struct host *host,
- 		}
- 	}
- done:
--	if (rpc_info.proto->p_proto == IPPROTO_UDP) {
-+	if (rpc_info.proto == IPPROTO_UDP) {
- 		rpc_destroy_udp_client(&rpc_info);
- 		rpc_destroy_udp_client(&pm_info);
- 	} else {
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-workaround-missing-GNU-versionsort-extension.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-workaround-missing-GNU-versionsort-extension.patch
deleted file mode 100644
index 6a1a49e..0000000
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-workaround-missing-GNU-versionsort-extension.patch
+++ /dev/null
@@ -1,149 +0,0 @@
-autofs-5.0.7 - workaround missing GNU versionsort extension
-
-From: Chris Packham <chris.packham@alliedtelesis.co.nz>
-
-alphasort() and scandir() are specified in POSIX.1-2008, versionsort()
-is a GNU extension. When versionsort isn't available fallback to using
-alphasort.
----
-
- CHANGELOG            |    1 +
- configure            |   62 ++++++++++++++++++++++++++++++++++++++++++++++++++
- configure.in         |    6 +++++
- include/config.h.in  |    3 ++
- modules/lookup_dir.c |    5 ++++
- 5 files changed, 77 insertions(+), 0 deletions(-)
-
-
-diff --git a/CHANGELOG b/CHANGELOG
-index 4eaa9f9..39388a5 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -27,6 +27,7 @@
- - lib/defaults.c: use WITH_LDAP conditional around LDAP types.
- - make yellow pages support optional.
- - modules/replicated.c: use sin6_addr.s6_addr32.
-+- workaround missing GNU versionsort extension.
- 
- 25/07/2012 autofs-5.0.7
- =======================
-diff --git a/configure b/configure
-index cf6428c..c1423d8 100755
---- a/configure
-+++ b/configure
-@@ -4010,6 +4010,68 @@ $as_echo "yes" >&6; }
-   KRB5_FLAGS=`$KRB5_CONFIG --cflags`
- fi
- 
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for library containing versionsort" >&5
-+$as_echo_n "checking for library containing versionsort... " >&6; }
-+if ${ac_cv_search_versionsort+:} false; then :
-+  $as_echo_n "(cached) " >&6
-+else
-+  ac_func_search_save_LIBS=$LIBS
-+cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-+/* end confdefs.h.  */
-+
-+/* Override any GCC internal prototype to avoid an error.
-+   Use char because int might match the return type of a GCC
-+   builtin and then its argument prototype would still apply.  */
-+#ifdef __cplusplus
-+extern "C"
-+#endif
-+char versionsort ();
-+int
-+main ()
-+{
-+return versionsort ();
-+  ;
-+  return 0;
-+}
-+_ACEOF
-+for ac_lib in '' ; do
-+  if test -z "$ac_lib"; then
-+    ac_res="none required"
-+  else
-+    ac_res=-l$ac_lib
-+    LIBS="-l$ac_lib  $ac_func_search_save_LIBS"
-+  fi
-+  if ac_fn_c_try_link "$LINENO"; then :
-+  ac_cv_search_versionsort=$ac_res
-+fi
-+rm -f core conftest.err conftest.$ac_objext \
-+    conftest$ac_exeext
-+  if ${ac_cv_search_versionsort+:} false; then :
-+  break
-+fi
-+done
-+if ${ac_cv_search_versionsort+:} false; then :
-+
-+else
-+  ac_cv_search_versionsort=no
-+fi
-+rm conftest.$ac_ext
-+LIBS=$ac_func_search_save_LIBS
-+fi
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_search_versionsort" >&5
-+$as_echo "$ac_cv_search_versionsort" >&6; }
-+ac_res=$ac_cv_search_versionsort
-+if test "$ac_res" != no; then :
-+  test "$ac_res" = "none required" || LIBS="$ac_res $LIBS"
-+
-+fi
-+
-+if test "$ac_cv_search_versionsort" = "no"; then
-+
-+$as_echo "#define WITHOUT_VERSIONSORT 1" >>confdefs.h
-+
-+fi
-+
- #
- # glibc/libc 6 new libraries
- #
-diff --git a/configure.in b/configure.in
-index 363c376..4029375 100644
---- a/configure.in
-+++ b/configure.in
-@@ -163,6 +163,12 @@ AF_SLOPPY_MOUNT()
- AF_CHECK_LIBXML()
- AF_CHECK_KRB5()
- 
-+AC_SEARCH_LIBS([versionsort],[])
-+if test "$ac_cv_search_versionsort" = "no"; then
-+	AC_DEFINE(WITHOUT_VERSIONSORT, 1,
-+		[Define if your C library does not provide versionsort])
-+fi
-+
- #
- # glibc/libc 6 new libraries
- #
-diff --git a/include/config.h.in b/include/config.h.in
-index 7f1c5b5..a2a05a8 100644
---- a/include/config.h.in
-+++ b/include/config.h.in
-@@ -135,6 +135,9 @@
- /* Define to 1 to use the libtirpc tsd usage workaround */
- #undef TIRPC_WORKAROUND
- 
-+/* Define if your C library does not provide versionsort */
-+#undef WITHOUT_VERSIONSORT
-+
- /* Define if using the dmalloc debugging malloc package */
- #undef WITH_DMALLOC
- 
-diff --git a/modules/lookup_dir.c b/modules/lookup_dir.c
-index 33901c0..07471b7 100644
---- a/modules/lookup_dir.c
-+++ b/modules/lookup_dir.c
-@@ -39,6 +39,11 @@
- #define AUTOFS_DIR_EXT ".autofs"
- #define AUTOFS_DIR_EXTSIZ (sizeof(AUTOFS_DIR_EXT) - 1)
- 
-+/* Work around non-GNU systems that don't provide versionsort */
-+#ifdef WITHOUT_VERSIONSORT
-+#define versionsort alphasort
-+#endif
-+
- struct lookup_context {
-   const char *mapname;
- };
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/0001-systemd-allow-with-systemd-to-take-a-path-arg.patch b/meta-networking/recipes-daemons/autofs/autofs-5.1.0/0001-systemd-allow-with-systemd-to-take-a-path-arg.patch
similarity index 100%
rename from meta-networking/recipes-daemons/autofs/autofs-5.0.7/0001-systemd-allow-with-systemd-to-take-a-path-arg.patch
rename to meta-networking/recipes-daemons/autofs/autofs-5.1.0/0001-systemd-allow-with-systemd-to-take-a-path-arg.patch
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/Makefile.rules-cross.patch b/meta-networking/recipes-daemons/autofs/autofs-5.1.0/Makefile.rules-cross.patch
similarity index 100%
rename from meta-networking/recipes-daemons/autofs/autofs-5.0.7/Makefile.rules-cross.patch
rename to meta-networking/recipes-daemons/autofs/autofs-5.1.0/Makefile.rules-cross.patch
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.1.0/add-the-needed-stdarg.h.patch b/meta-networking/recipes-daemons/autofs/autofs-5.1.0/add-the-needed-stdarg.h.patch
new file mode 100644
index 0000000..fdb906b
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.1.0/add-the-needed-stdarg.h.patch
@@ -0,0 +1,24 @@
+[PATCH] add the needed stdarg.h
+
+Upstream-status: Pending
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ lib/defaults.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/defaults.c b/lib/defaults.c
+index 2b03ea2..5728e67 100644
+--- a/lib/defaults.c
++++ b/lib/defaults.c
+@@ -16,6 +16,7 @@
+ 
+ #include <stdlib.h>
+ #include <stdio.h>
++#include <stdarg.h>
+ #include <ctype.h>
+ #include <string.h>
+ #include <sys/utsname.h>
+-- 
+1.7.10.4
+
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-do-not-check-for-modprobe.patch b/meta-networking/recipes-daemons/autofs/autofs-5.1.0/autofs-5.0.7-do-not-check-for-modprobe.patch
similarity index 100%
rename from meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-do-not-check-for-modprobe.patch
rename to meta-networking/recipes-daemons/autofs/autofs-5.1.0/autofs-5.0.7-do-not-check-for-modprobe.patch
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-lib-deps.patch b/meta-networking/recipes-daemons/autofs/autofs-5.1.0/autofs-5.0.7-fix-lib-deps.patch
similarity index 100%
rename from meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-fix-lib-deps.patch
rename to meta-networking/recipes-daemons/autofs/autofs-5.1.0/autofs-5.0.7-fix-lib-deps.patch
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch b/meta-networking/recipes-daemons/autofs/autofs-5.1.0/autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch
similarity index 100%
rename from meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch
rename to meta-networking/recipes-daemons/autofs/autofs-5.1.0/autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-additional-distros.patch b/meta-networking/recipes-daemons/autofs/autofs-5.1.0/autofs-additional-distros.patch
similarity index 100%
rename from meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-additional-distros.patch
rename to meta-networking/recipes-daemons/autofs/autofs-5.1.0/autofs-additional-distros.patch
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/cross.patch b/meta-networking/recipes-daemons/autofs/autofs-5.1.0/cross.patch
similarity index 100%
rename from meta-networking/recipes-daemons/autofs/autofs-5.0.7/cross.patch
rename to meta-networking/recipes-daemons/autofs/autofs-5.1.0/cross.patch
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/fix_disable_ldap.patch b/meta-networking/recipes-daemons/autofs/autofs-5.1.0/fix_disable_ldap.patch
similarity index 100%
rename from meta-networking/recipes-daemons/autofs/autofs-5.0.7/fix_disable_ldap.patch
rename to meta-networking/recipes-daemons/autofs/autofs-5.1.0/fix_disable_ldap.patch
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.1.0/force-STRIP-to-emtpy.patch b/meta-networking/recipes-daemons/autofs/autofs-5.1.0/force-STRIP-to-emtpy.patch
new file mode 100644
index 0000000..634005b
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.1.0/force-STRIP-to-emtpy.patch
@@ -0,0 +1,25 @@
+[PATCH] force STRIP to emtpy
+
+otherwise the generate file will be stripped
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ Makefile.rules |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.rules b/Makefile.rules
+index 710a2c9..e4334db 100644
+--- a/Makefile.rules
++++ b/Makefile.rules
+@@ -31,7 +31,7 @@ LDFLAGS   ?= -s
+ endif
+ 
+ ifdef DONTSTRIP
+-STRIP     ?= :
++STRIP     = :
+ else
+ STRIP     ?= strip --strip-debug
+ endif
+-- 
+1.7.10.4
+
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/libtirpc-name-clash-backout.patch b/meta-networking/recipes-daemons/autofs/autofs-5.1.0/libtirpc-name-clash-backout.patch
similarity index 59%
rename from meta-networking/recipes-daemons/autofs/autofs-5.0.7/libtirpc-name-clash-backout.patch
rename to meta-networking/recipes-daemons/autofs/autofs-5.1.0/libtirpc-name-clash-backout.patch
index 1047240..e93021d 100644
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/libtirpc-name-clash-backout.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.1.0/libtirpc-name-clash-backout.patch
@@ -1,12 +1,15 @@
-Index: autofs-5.0.7/lib/rpc_subs.c
-===================================================================
---- autofs-5.0.7.orig/lib/rpc_subs.c	2012-07-24 23:05:26.000000000 -0700
-+++ autofs-5.0.7/lib/rpc_subs.c	2012-10-28 14:47:49.008382116 -0700
+---
+ lib/rpc_subs.c |   10 ----------
+ 1 file changed, 10 deletions(-)
+
+diff --git a/lib/rpc_subs.c b/lib/rpc_subs.c
+index 5d6ead0..c7177f2 100644
+--- a/lib/rpc_subs.c
++++ b/lib/rpc_subs.c
 @@ -34,16 +34,6 @@
- #include <pthread.h>
  #include <poll.h>
  
--#ifdef WITH_LIBTIRPC
+ #ifdef WITH_LIBTIRPC
 -#undef auth_destroy
 -#define auth_destroy(auth)                                              \
 -                do {                                                    \
@@ -16,6 +19,10 @@ Index: autofs-5.0.7/lib/rpc_subs.c
 -                } while (0)
 -#endif
 -
- #include "mount.h"
- #include "rpc_subs.h"
- #include "automount.h"
+-#ifdef WITH_LIBTIRPC
+ const rpcprog_t rpcb_prog = RPCBPROG;
+ const rpcvers_t rpcb_version = RPCBVERS;
+ #else
+-- 
+1.7.10.4
+
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/libtirpc.patch b/meta-networking/recipes-daemons/autofs/autofs-5.1.0/libtirpc.patch
similarity index 94%
rename from meta-networking/recipes-daemons/autofs/autofs-5.0.7/libtirpc.patch
rename to meta-networking/recipes-daemons/autofs/autofs-5.1.0/libtirpc.patch
index 04f52c6..d68944b 100644
--- a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/libtirpc.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.1.0/libtirpc.patch
@@ -16,11 +16,11 @@ Index: autofs-5.0.7/Makefile.rules
 --- autofs-5.0.7.orig/Makefile.rules	2012-10-28 13:17:45.308237022 -0700
 +++ autofs-5.0.7/Makefile.rules	2012-10-28 13:21:25.720242803 -0700
 @@ -48,7 +48,7 @@
- LDFLAGS += -lpthread
+ LIBS += -lpthread
  
  ifdef TIRPCLIB
 -CFLAGS += -I/usr/include/tirpc
 +CFLAGS += -I=/usr/include/tirpc
- LDFLAGS += $(TIRPCLIB)
+ LIBS += $(TIRPCLIB)
  endif
  
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/no-bash.patch b/meta-networking/recipes-daemons/autofs/autofs-5.1.0/no-bash.patch
similarity index 100%
rename from meta-networking/recipes-daemons/autofs/autofs-5.0.7/no-bash.patch
rename to meta-networking/recipes-daemons/autofs/autofs-5.1.0/no-bash.patch
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.1.0/using-pkg-config-to-detect-libxml-2.0-and-krb5.patch b/meta-networking/recipes-daemons/autofs/autofs-5.1.0/using-pkg-config-to-detect-libxml-2.0-and-krb5.patch
new file mode 100644
index 0000000..93b76bd
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.1.0/using-pkg-config-to-detect-libxml-2.0-and-krb5.patch
@@ -0,0 +1,39 @@
+using pkg-config to detect libxml-2.0 and krb5
+
+Upstream-status: Pending
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ configure.in |   16 ++++++++++++++--
+ 2 files changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 392d122..a3028aa 100644
+--- a/configure.in
++++ b/configure.in
+@@ -162,8 +162,20 @@ if test x$enable_sloppy_mount = xyes; then
+ fi
+ 
+ # LDAP SASL auth needs libxml and Kerberos
+-AF_CHECK_LIBXML()
+-AF_CHECK_KRB5()
++PKG_CHECK_MODULES(XML, [libxml-2.0],HAVE_LIBXML=1,HAVE_LIBXML=0)
++AC_SUBST([HAVE_LIBXML])
++XML_FLAGS=$XML_CFLAGS
++
++PKG_CHECK_MODULES(KRB5, [krb5],HAVE_KRB5=1,HAVE_KRB5=0)
++AC_SUBST([HAVE_KRB5])
++if test "x$HAVE_KRB5" = "x1"; then
++  SAVE_CFLAGS=$CFLAGS
++  SAVE_LIBS=$LIBS
++  CFLAGS="$CFLAGS $KRB5_FLAGS"
++  LIBS="$LIBS $KRB5_LIBS"
++
++  AC_CHECK_FUNCS([krb5_principal_get_realm])
++fi
+ 
+ AC_SEARCH_LIBS([versionsort],[])
+ if test "$ac_cv_search_versionsort" = "no"; then
+-- 
+1.7.10.4
+
diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb b/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb
similarity index 36%
rename from meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
rename to meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb
index 966dada..aab2187 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb
@@ -3,56 +3,12 @@ SECTION = "base"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-PR = "r6"
-
 DEPENDS += "libtirpc flex-native bison-native"
 
 inherit autotools-brokensep systemd
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.bz2 \
-           file://autofs-5.0.7-fix-nobind-sun-escaped-map-entries.patch \
-           file://autofs-5.0.7-fix-use-cache-entry-after-free-mistake.patch \
-           file://autofs-5.0.7-fix-ipv6-proximity-calculation.patch \
-           file://autofs-5.0.7-fix-parse-buffer-initialization.patch \
-           file://autofs-5.0.7-fix-typo-in-automount-8.patch \
-           file://autofs-5.0.7-include-usage-in-usage-message.patch \
-           file://autofs-5.0.7-dont-wait-forever-to-restart.patch \
-           file://autofs-5.0.7-add-timeout-option-description-to-man-page.patch \
-           file://autofs-5.0.7-fix-null-map-entry-order-handling.patch \
-           file://autofs-5.0.7-make-description-of-default-MOUNT_WAIT-setting-clear.patch \
-           file://autofs-5.0.7-configure-in-allow-cross-compilation.patch \
-           file://autofs-5.0.7-README-update-mailing-list-subscription-info.patch \
-           file://autofs-5.0.7-allow-non-root-user-to-check-status.patch \
-           file://autofs-5.0.7-configure-allow-cross-compilation-update.patch \
-           file://autofs-5.0.6-fix-recursive-mount-deadlock.patch \
-           file://autofs-5.0.6-increase-file-map-read-buffer-size.patch \
-           file://autofs-5.0.7-handle-new-location-of-systemd.patch \
-           file://autofs-5.0.7-fix-map-entry-duplicate-offset-detection.patch \
-           file://autofs-5.0.7-allow-nsswitch_conf-to-not-contain-automount-lines.patch \
-           file://autofs-5.0.7-fix-nobind-man-page-description.patch \
-           file://autofs-5.0.7-fix-submount-offset-delete.patch \
-           file://autofs-5.0.7-fix-init-script-status-return.patch \
-           file://autofs-5.0.7-fix-use-get_proximity-without-libtirpc.patch \
-           file://autofs-5.0.7-dont-use-dirent-d_type-to-filter-out-files-in-scandir.patch \
-           file://autofs-5.0.7-dont-schedule-new-alarms-after-readmap.patch \
-           file://autofs-5.0.7-use-numeric-protocol-ids-instead-of-protoent-structs.patch \
-           file://autofs-5.0.7-lib-defaults-use-WITH_LDAP-conditional-around-LDAP-types.patch \
-           file://autofs-5.0.7-make-yellow-pages-support-optional.patch \
-           file://autofs-5.0.7-modules-replicated-use-sin6.addr-s6_addr32.patch \
-           file://autofs-5.0.7-workaround-missing-GNU-versionsort-extension.patch \
-           file://autofs-5.0.7-dont-fail-on-master-map-self-include.patch \
-           file://autofs-5.0.7-fix-wildcard-multi-map-regression.patch \
-           file://autofs-5.0.7-fix-file-descriptor-leak-when-reloading-the-daemon.patch \
-           file://autofs-5.0.7-depricate-nosymlink-pseudo-option.patch \
-           file://autofs-5.0.7-add-symlink-pseudo-option.patch \
-           file://autofs-5.0.7-update-kernel-include-files.patch \
-           file://autofs-5.0.7-fix-requires-in-spec-file.patch \
-           file://autofs-5.0.7-fix-libtirpc-build-option.patch \
-           file://autofs-5.0.7-fix-systemd-unidir-in-spec-file.patch \
-           file://autofs-5.0.7-document-browse-option-in-man-page.patch \
-           file://autofs-5.0.7-fix-automounter-support-on-parisc.patch \
+SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.gz \
            file://autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch \
-           file://Makefile.rules-cross.patch \
            file://no-bash.patch \
            file://cross.patch \
            file://libtirpc.patch \
@@ -60,11 +16,13 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.bz2 \
            file://autofs-5.0.7-do-not-check-for-modprobe.patch \
            file://fix_disable_ldap.patch \
            file://autofs-5.0.7-fix-lib-deps.patch \
-           file://0001-systemd-allow-with-systemd-to-take-a-path-arg.patch \
+           file://add-the-needed-stdarg.h.patch \
+           file://using-pkg-config-to-detect-libxml-2.0-and-krb5.patch \
+           file://force-STRIP-to-emtpy.patch \
 "
 
-SRC_URI[md5sum] = "bc46838dece83c02d800ff144ed9f431"
-SRC_URI[sha256sum] = "08c4304d8076dc80c14df559bc5fd821b67ef3457b245f61068bd053d8f94ccc"
+SRC_URI[md5sum] = "b7724a9a55923f3c06933a8dfd1e79d3"
+SRC_URI[sha256sum] = "794a28d178d2b21a2380ee71cbdb3b15b4be47c06f3de255b8c5c4351f046b26"
 
 inherit update-rc.d pkgconfig
 
-- 
1.7.10.4


