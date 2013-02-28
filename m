Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UB2aY-0004Wq-Jb
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Feb 2013 13:28:09 +0100
Received: by mail-wi0-f175.google.com with SMTP id l13so7577583wie.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2013 04:11:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=lDp58qiPJcGJz9inil4Y/0Z68HfqdDCBW2u1bGuG/Ro=;
	b=DvJJY4YySFrF4o8da8Yp4zbOd6YnUwGuQb7lE8SnZsZWHnsBgCk1jnHai/LWghSta4
	65PGHrIP2u5/MnlvmvXj2/8NQtVVmR8dJtxtEivg4NNmi/r2cfEGfOX7qF/L1eW0WsZn
	Ff44pZubIPGCL/N28mzPsRh8yI4eoBPURwPuRKHl48Kif0+1P9YxmvOIl52i+QLtG9a8
	79aieCub5yBPbSzaEp+uIOXKllM8oFFAXv8dWQgbSX1JCX68NDQ0IJ9ABwunCDcEfLEf
	21CvH0Kj9V/pJT6RIKcxYzwrkHkOvsda24QXKQNazasUJJnRDh6jmJoZzQ10vMV5ItWH
	2BIA==
X-Received: by 10.180.78.135 with SMTP id b7mr32231507wix.14.1362053492840;
	Thu, 28 Feb 2013 04:11:32 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id eo1sm32969583wib.8.2013.02.28.04.11.31
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Feb 2013 04:11:32 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Feb 2013 12:09:02 +0000
Message-Id: <ff4c100c5e51ac6227325ea1ea319c902bf554bf.1362053187.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1362053187.git.ross.burton@intel.com>
References: <cover.1362053187.git.ross.burton@intel.com>
In-Reply-To: <cover.1362053187.git.ross.burton@intel.com>
References: <cover.1362053187.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkdZXt5WDZ8fZVEM3MejVGgSbEJdapJjdj8+W3oLuwezD6I4ie5qwb7JwyuEq1AFOLbIuZ/
Subject: [PATCH 3/3] libgdata: add, from oe-core
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
X-List-Received-Date: Thu, 28 Feb 2013 12:28:15 -0000

libgdata was removed from oe-core, but it's still useful so add it to
meta-gnome.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb |   15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb

diff --git a/meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb b/meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb
new file mode 100644
index 0000000..c3f4047
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "GLib-based library for accessing online service APIs using the GData protocol"
+HOMEPAGE = "http://live.gnome.org/libgdata"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
+                    file://gdata/gdata.h;endline=20;md5=079a554efcf65d46f96a515806e7e99a \
+                    file://gdata/gdata-types.h;endline=20;md5=7399b111aac8718da13888fc634be6ef"
+
+DEPENDS = "libxml2 glib-2.0 libsoup-2.4"
+
+inherit gnome pkgconfig autotools gettext
+
+SRC_URI[archive.md5sum] = "ec5262cbcb07b63b58d45aa3ac636096"
+SRC_URI[archive.sha256sum] = "fb244138276a5ce98510b0e2408bbf6f9ce0fd8cdcf86f07cd4be38afbb7c2bc"
-- 
1.7.10.4



