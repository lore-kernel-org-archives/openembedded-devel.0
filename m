Received: from outbound.icp-qv1-irony-out5.iinet.net.au ([203.59.1.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1QTt7Q-0007Xl-HG
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Jun 2011 12:02:40 +0200
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AqEGAK/v7U3LO4Se/2dsb2JhbABTl3COKHfKB4YhBIZ2jn2KaQ
X-IronPort-AV: E=Sophos;i="4.65,331,1304265600"; d="scan'208";a="272198555"
Received: from unknown (HELO gentoo_vm.DMA.local) ([203.59.132.158])
	by outbound.icp-qv1-irony-out5.iinet.net.au with ESMTP;
	07 Jun 2011 17:34:42 +0800
From: James Limbouris <james@digitalmatter.com.au>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Jun 2011 17:35:26 +0800
Message-Id: <1307439326-12974-1-git-send-email-james@digitalmatter.com.au>
X-Mailer: git-send-email 1.7.3.4
Cc: James Limbouris <james@digitalmatter.com.au>
Subject: [PATCH v2] initscripts: Modify 'populate-volatile.sh' to atomically update 'volatile.cache'
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
X-List-Received-Date: Tue, 07 Jun 2011 10:02:41 -0000

When power is lost before a new volatile.cache has been flushed to disk,
it can be corrupted, leaving the volatiles uncreated and causing software failure.
Using a temporary file on the same volume and renaming it avoids this issue.
The file is sync'd before the rename to avoid problems with newer caching filesystems,
in which the rename is atomic, but the contents of the file may not yet be flushed.

Signed-off-by: James Limbouris <james@digitalmatter.com.au>
---
 .../initscripts-1.0/populate-volatile.sh           |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/recipes/initscripts/initscripts-1.0/populate-volatile.sh b/recipes/initscripts/initscripts-1.0/populate-volatile.sh
index 3bb3d94..e355680 100755
--- a/recipes/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/recipes/initscripts/initscripts-1.0/populate-volatile.sh
@@ -14,7 +14,7 @@ create_file() {
 	chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\" >/dev/tty0 2>&1; 
 	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" >/dev/tty0 2>&1 " 
 
-	test "$VOLATILE_ENABLE_CACHE" = yes && echo "$EXEC" >> /etc/volatile.cache
+	test "$VOLATILE_ENABLE_CACHE" = yes && echo "$EXEC" >> /etc/volatile.cache.build
 
 	[ -e "$1" ] && {
 	  [ "${VERBOSE}" != "no" ] && echo "Target already exists. Skipping."
@@ -29,7 +29,7 @@ mk_dir() {
 	chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\" >/dev/tty0 2>&1; 
 	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" >/dev/tty0 2>&1 "
 
-	test "$VOLATILE_ENABLE_CACHE" = yes && echo "$EXEC" >> /etc/volatile.cache
+	test "$VOLATILE_ENABLE_CACHE" = yes && echo "$EXEC" >> /etc/volatile.cache.build
 	
 	[ -e "$1" ] && {
 	  [ "${VERBOSE}" != "no" ] && echo "Target already exists. Skipping."
@@ -41,7 +41,7 @@ mk_dir() {
 link_file() {
 	EXEC="test -e \"$2\" -o -L $2 || ln -s \"$1\" \"$2\" >/dev/tty0 2>&1" 
 
-	test "$VOLATILE_ENABLE_CACHE" = yes && echo "	$EXEC" >> /etc/volatile.cache
+	test "$VOLATILE_ENABLE_CACHE" = yes && echo "	$EXEC" >> /etc/volatile.cache.build
 	
 	[ -e "$2" ] && {
 	  echo "Cannot create link over existing -${TNAME}-." >&2
@@ -164,8 +164,10 @@ if test -e /etc/volatile.cache -a "$VOLATILE_ENABLE_CACHE" = "yes" -a "x$1" != "
 then
 	sh /etc/volatile.cache
 else	
-	rm -f /etc/volatile.cache
+	rm -f /etc/volatile.cache /etc/volatile.cache.build
 	for file in `ls -1 "${CFGDIR}" | sort`; do
 		apply_cfgfile "${CFGDIR}/${file}"
 	done
+	
+	[ -e /etc/volatile.cache.build ] && sync && mv /etc/volatile.cache.build /etc/volatile.cache
 fi
-- 
1.7.3.4



