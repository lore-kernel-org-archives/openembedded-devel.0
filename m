Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T1ixl-0006E5-H5
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Aug 2012 21:09:05 +0200
Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 15 Aug 2012 11:56:03 -0700
Received: by wibhr14 with SMTP id hr14so1401762wib.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Aug 2012 11:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=hnT7kgXMVmw7M06vvT/qIGSEllAfsvt4urz08YW8hSo=;
	b=MKpFNwwcM36BmFnbRlXP8RHwN7QFBspfYZ2RuXGWCUeCIPdJSV4wnNq7OsbQx0TKdG
	Quf+AAnFbGat3Chyt8eNJQHPtD+aO2tOGJXPfir+7Ll4HiohuHw/5Ln5TqLLC5QAdnN6
	oCgXT7bYqzMicf1tfuLizkxhdBZL5N/3gt0jFMEUWyqN/ks8wmIIc/XIcDdK/A9K5obS
	poijRDLxjvIA5zzyqkyThR7mSOBk95gh7HvwiYSY2Q68pCP6w0KkhXPoINYGvC+itRiS
	BQI7GDY/9AQ1FDJEa44SD6L1ONhACAUwB1Hb4z+KuROVA6syYOZ4kTbzBmzaW2l5DeSu
	NEJQ==
Received: by 10.216.145.146 with SMTP id p18mr3847928wej.188.1345056961424;
	Wed, 15 Aug 2012 11:56:01 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPS id el6sm30288572wib.8.2012.08.15.11.56.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Aug 2012 11:56:00 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Aug 2012 19:55:50 +0100
Message-Id: <1345056951-14036-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1345056951-14036-1-git-send-email-ross.burton@intel.com>
References: <1345056951-14036-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQn4LZRDZOPY0A41Ch6nDLdYEEgPLtxYhbQGWhv4/GKZwihKBstv03xDUEJpX560RFxAmNK1
Subject: [PATCH 1/2] meta-gnome: add libical
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
X-List-Received-Date: Wed, 15 Aug 2012 19:09:05 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libical/files/pthread-fix.patch                |   52 ++++++++++++++++++++
 meta-gnome/recipes-support/libical/libical_0.48.bb |   17 +++++++
 2 files changed, 69 insertions(+)
 create mode 100644 meta-gnome/recipes-support/libical/files/pthread-fix.patch
 create mode 100644 meta-gnome/recipes-support/libical/libical_0.48.bb

diff --git a/meta-gnome/recipes-support/libical/files/pthread-fix.patch b/meta-gnome/recipes-support/libical/files/pthread-fix.patch
new file mode 100644
index 0000000..aa7767f
--- /dev/null
+++ b/meta-gnome/recipes-support/libical/files/pthread-fix.patch
@@ -0,0 +1,52 @@
+New added pthread feathre leads some deadlock with some unlock code missing.
+This patch fix it.
+
+Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
+
+Upstream-Status: Pending
+
+Index: libical-0.47/src/libical/icaltimezone.c
+===================================================================
+--- libical-0.47.orig/src/libical/icaltimezone.c	2011-12-16 13:42:25.000000000 +0800
++++ libical-0.47/src/libical/icaltimezone.c	2011-12-16 14:16:25.000000000 +0800
+@@ -1773,7 +1773,7 @@
+     filename = (char*) malloc (filename_len);
+     if (!filename) {
+ 	icalerror_set_errno(ICAL_NEWFAILED_ERROR);
+-	return;
++	goto out;
+     }
+ 
+     snprintf (filename, filename_len, "%s/%s.ics", get_zone_directory(),
+@@ -1783,7 +1783,7 @@
+     free (filename);
+     if (!fp) {
+ 	icalerror_set_errno(ICAL_FILE_ERROR);
+-	return;
++	goto out;
+     }
+ 
+ 	
+@@ -1807,7 +1807,7 @@
+ 
+     if (!subcomp) {
+ 	icalerror_set_errno(ICAL_PARSE_ERROR);
+-	return;
++	goto out;
+     }
+ 
+     icaltimezone_get_vtimezone_properties (zone, subcomp);
+@@ -1817,10 +1817,12 @@
+     icalcomponent_free(comp);
+     }
+ #endif 
+-#ifdef HAVE_PTHREAD
++
+  out:
++#ifdef HAVE_PTHREAD
+     pthread_mutex_unlock(&builtin_mutex);
+ #endif
++    return;
+ }
+ 
+ 
diff --git a/meta-gnome/recipes-support/libical/libical_0.48.bb b/meta-gnome/recipes-support/libical/libical_0.48.bb
new file mode 100644
index 0000000..80f629c
--- /dev/null
+++ b/meta-gnome/recipes-support/libical/libical_0.48.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "iCal and scheduling (RFC 2445, 2446, 2447) library"
+HOMEPAGE = "http://sourceforge.net/projects/freeassociation/"
+BUGTRACKER = "http://sourceforge.net/tracker/?group_id=16077&atid=116077"
+LICENSE = "LGPLv2.1 | MPL-1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d4fc58309d8ed46587ac63bb449d82f8 \
+                    file://LICENSE;md5=d1a0891cd3e582b3e2ec8fe63badbbb6"
+SECTION = "libs"
+
+PR = "r0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/freeassociation/${BPN}/${P}/${BPN}-${PV}.tar.gz\
+           file://pthread-fix.patch"
+
+SRC_URI[md5sum] = "e549f434d5fbf9cd156c60ed4943618f"
+SRC_URI[sha256sum] = "2ae78b0757f0dd13431acf42a9a8d038339fd4767fd5134e650bf60ee0b4dff0"
+
+inherit autotools
-- 
1.7.10.4



