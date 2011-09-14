Received: from einhorn.in-berlin.de ([192.109.42.8] ident=root)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@mobil-400-586.intern.dresearch.de>)
	id 1R3qws-0003Tw-2D for openembedded-devel@lists.openembedded.org;
	Wed, 14 Sep 2011 17:00:26 +0200
X-Envelope-From: sledz@mobil-400-586.intern.dresearch.de
Received: from mobil-400-586.intern.dresearch.de
	(pd95cb174.dip0.t-ipconnect.de [217.92.177.116])
	(authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	p8EEtFeA005166
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 14 Sep 2011 16:55:15 +0200
Received: by mobil-400-586.intern.dresearch.de (Postfix, from userid 1000)
	id B4046C849F; Wed, 14 Sep 2011 16:55:14 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Sep 2011 16:55:06 +0200
Message-Id: <1316012106-10277-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1316010999.6686.108.camel@mattotaupa>
References: <1316010999.6686.108.camel@mattotaupa>
X-Scanned-By: MIMEDefang_at_IN-Berlin_e.V. on 192.109.42.8
Cc: paulepanter@users.sourceforge.net
Subject: [PATCH v2] eglibc-2.9: allow building with newer GNU make
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
X-List-Received-Date: Wed, 14 Sep 2011 15:00:26 -0000

GNU make >= 3.82 does not allow mixed implicit and normal rules

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
Acked-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/eglibc/eglibc-2.9/make-3.82.patch |   27 +++++++++++++++++++++++++++
 recipes/eglibc/eglibc_2.9.bb              |    3 ++-
 2 files changed, 29 insertions(+), 1 deletions(-)
 create mode 100644 recipes/eglibc/eglibc-2.9/make-3.82.patch

diff --git a/recipes/eglibc/eglibc-2.9/make-3.82.patch b/recipes/eglibc/eglibc-2.9/make-3.82.patch
new file mode 100644
index 0000000..64cb270
--- /dev/null
+++ b/recipes/eglibc/eglibc-2.9/make-3.82.patch
@@ -0,0 +1,27 @@
+eglibc-2.9: allow building with newer GNU make
+    
+GNU make >= 3.82 does not allow mixed implicit and normal rules
+
+Because eglibc-2.9 is superseeded by newer versions it makes no sense
+to submit this patch upstream.
+
+Upstream-Status: Inappropriate [other]
+
+Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
+
+diff -Nurd libc.orig//manual/Makefile libc/manual/Makefile
+--- libc.orig//manual/Makefile	2011-09-13 14:49:57.428424088 +0200
++++ libc/manual/Makefile	2011-09-13 14:50:47.009620484 +0200
+@@ -242,7 +242,11 @@
+ .PHONY: stubs
+ stubs: $(objpfx)stubs
+ endif
+-$(objpfx)stubs ../po/manual.pot $(objpfx)stamp%:
++$(objpfx)stubs ../po/manual.pot:
++	$(make-target-directory)
++	touch $@
++
++$(objpfx)stamp%:
+ 	$(make-target-directory)
+ 	touch $@
+ 
diff --git a/recipes/eglibc/eglibc_2.9.bb b/recipes/eglibc/eglibc_2.9.bb
index be60ba7..7e0fa55 100644
--- a/recipes/eglibc/eglibc_2.9.bb
+++ b/recipes/eglibc/eglibc_2.9.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 DEPENDS += "gperf-native"
 FILESPATHPKG =. "eglibc-svn:"
 PV = "2.9"
-PR = "${INC_PR}.10"
+PR = "${INC_PR}.11"
 PR_append = "+svnr${SRCPV}"
 SRCREV="10153"
 EGLIBC_BRANCH="eglibc-2_9"
@@ -14,6 +14,7 @@ SRC_URI = "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
            file://shorten-build-commands.patch \
            file://sh4_set_fpscr.patch \
            file://sh4_local-fpscr_values.patch \
+           file://make-3.82.patch \
            file://etc/ld.so.conf \
            file://generate-supported.mk"
 S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
-- 
1.7.3.4



