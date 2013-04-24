Received: from mail-wi0-f176.google.com ([209.85.212.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UV2we-0005B8-Lx
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Apr 2013 18:53:29 +0200
Received: by mail-wi0-f176.google.com with SMTP id hj19so7602858wib.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2013 09:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=jJ+1N20knsdsFMhNT+82Yy+EHZQhHlEB1rJXe35j/Rs=;
	b=muEXpf1tdoAa24ysnNgf3x9q6yP0aY8bbSIiTEa+yNovIaezq9DTM5G/ie4QghNtkm
	lxhN3GRXay2JzC4A8I9XJc9GEpoHugBh2CDhIYKPUArcze9VR2PDCbYLnBGu8lFGVLPL
	hxzS3XEhwLYFBYUysAoFPfYlWCzTy6EXdB3NuUxRac/ApRvwtvUXMA72YgQ6/Ukz+iHS
	gvNVzimJFKRKQ4yyNOrmbvjul7Qs7T/wYBphC++3gtlun2gdW+bXWjLy/GIADulxaFSP
	hhEgqIa8QTZkbfkrLu1UGeV+sUusajS/Ssun0BOm748NS2oeKmAnQNafkI7brsyYBcSq
	4K8A==
X-Received: by 10.194.176.195 with SMTP id ck3mr48545183wjc.5.1366821342735;
	Wed, 24 Apr 2013 09:35:42 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id er1sm33432791wib.5.2013.04.24.09.35.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Apr 2013 09:35:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Apr 2013 17:32:43 +0100
Message-Id: <71a4379c48d50d14128938bacfb29be4a966fad3.1366821077.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1366821077.git.ross.burton@intel.com>
References: <cover.1366821077.git.ross.burton@intel.com>
In-Reply-To: <cover.1366821077.git.ross.burton@intel.com>
References: <cover.1366821077.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkyKO5UE38GnfqKxxj4OsJQ786KHtWD782k/OTx//+ZXwK7eECw4iTfwEEty57OmYdtVUb0
Subject: [PATCH 2/2] gnome-keyring: add (from oe-core)
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
X-List-Received-Date: Wed, 24 Apr 2013 16:53:50 -0000

This was previously in oe-core but nothing there was actually using it in an
image.  As it's part of GNOME, move it meta-gnome.

The custom service file is dropped, as upstream is now shipping and installing
this file (and has been for some time).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gnome-keyring/gnome-keyring_2.32.1.bb          |   37 ++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
new file mode 100644
index 0000000..72f2722
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
@@ -0,0 +1,37 @@
+DESCRIPTION = "Password and keyring managing daemon"
+HOMEPAGE = "http://www.gnome.org/"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+
+LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://gcr/gcr.h;endline=22;md5=a272df1e633e27ecf35e74fb5576250e \
+                    file://egg/egg-dbus.h;endline=25;md5=eb6f531af37165dc53420c073d774e61 \
+                    file://gp11/gp11.h;endline=24;md5=bd8c7a8a21d6c28d40536d96a35e3469 \
+                    file://pkcs11/pkcs11i.h;endline=24;md5=e72cfbb718389b76a4dae838d1c1f439"
+
+SECTION = "x11/gnome"
+
+PR = "r12"
+
+inherit autotools gnome gtk-doc pkgconfig gsettings
+
+DEPENDS = "gtk+ libgcrypt libtasn1 libtasn1-native gconf ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+RDEPENDS_${PN} = "libgnome-keyring glib-2.0-utils"
+
+EXTRA_OECONF = "${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam --with-pam-dir=${base_libdir}/security', '--disable-pam', d)}"
+
+SRC_URI[archive.md5sum] = "9a8aa74e03361676f29d6e73155786fc"
+SRC_URI[archive.sha256sum] = "31fecec1430a97f59a6159a5a2ea8d6a1b44287f1e9e595b3594df46bf7f18f9"
+
+FILES_${PN} += "${datadir}/dbus-1/services ${datadir}/gcr"
+                
+
+FILES_${PN}-dev += "${libdir}/${BPN}/devel/*.la \
+                    ${libdir}/${BPN}/devel/*${SOLIBSDEV} \
+                    ${libdir}/${BPN}/standalone/*.la \
+                    ${base_libdir}/security/*.la \
+                    ${base_libdir}/security/*${SOLIBSDEV}"
+
+FILES_${PN}-dbg += "${libdir}/${BPN}/standalone/.debug/ \
+                    ${libdir}/${BPN}/devel/.debug/ \
+                    ${base_libdir}/security/.debug/"
-- 
1.7.10.4



