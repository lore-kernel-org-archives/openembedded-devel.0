Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4629B60720
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Oct 2016 10:04:02 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id f193so6403553wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Oct 2016 03:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=I2hupruMhcHfDs7MSM3R3cS1sC0UqPPCoaXojBt+tUc=;
	b=Q9yto+mdMQf1yGHjQsCkmjWKrCly3IPhZaHjLMuJZX+MRjOkWNVxLgZmeyyzTFaDbI
	Kg8ThHNcaC4f7HV9RF1N/hTv/0jWK1uwid1b4dO9qe2PftdFjgjf8DDwhXQxlq+KtfsL
	Ol/VTIlF1s+pnlLo9gVYKbTUVdw2bhoHjeKiAsBQ0yYfLRjNC0iKgKvyggiAtAZjHZhq
	8sF7E8YK30VKyrjSUhX+uOFqwXdC0ECO6HbiOhIvfGRMTJUBqbT6+u950DFzLOR5XIUY
	Fodz0rbpy0wrD/xyA8xO7Wgprwap6/A4gB2yux76v/KEm1M4DSHstdL5Zz0k1lWK3PGk
	5rEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=I2hupruMhcHfDs7MSM3R3cS1sC0UqPPCoaXojBt+tUc=;
	b=bg0vUsLzyf9/XIKOJvk1zvK5XUpMUN/igEhfhTFRHvGFpVMJbe9V1iBCjjEKQ/V+jl
	ZIWeEpL1ZwtEe727gEnnte7BJ24DCtGpaXYBTo4laYLZk97VT8BsK0zeT1C7cLzJ5/uD
	MMF0nicdVqOSfYhpqUq+6dl7Dm/gBJTEpjTBiqDCdnZgZWzvssoTxQAOvkleAl7CmvgM
	rk8BXiyyglDejIoTHS8v5HnChftS9IMvBeznDWfvB0zAB6XGKwd08gdLjk6ocXrxa9Lp
	Q6/Y36qb07fJq0N+5e/FACowNP7aY3YwkRyI/begzt6LRAS3ZI6UWJGcg851EuXqIs57
	Oy0Q==
X-Gm-Message-State: AA6/9RncTOmDAOvbsQx+wGgE/JVjVe3ywstg4hU9RpxgBWlKcvrVdzMBTey9VSr9rTIcmw==
X-Received: by 10.194.55.9 with SMTP id n9mr19282509wjp.208.1475921031005;
	Sat, 08 Oct 2016 03:03:51 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0EC6.dip0.t-ipconnect.de.
	[79.223.14.198]) by smtp.googlemail.com with ESMTPSA id
	n7sm7509219wmf.18.2016.10.08.03.03.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Oct 2016 03:03:50 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  8 Oct 2016 12:03:34 +0200
Message-Id: <1475921015-7131-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1475921015-7131-1-git-send-email-schnitzeltony@googlemail.com>
References: <1475921015-7131-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH V2 3/4] a2jmidid: initial add v8
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
X-List-Received-Date: Sat, 08 Oct 2016 10:04:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...-pthread-library-dependency-to-fix-linkin.patch | 43 ++++++++++++++++++++++
 meta-oe/recipes-multimedia/jack/a2jmidid_8.bb      | 22 +++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/jack/a2jmidid/0001-wscript-add-pthread-library-dependency-to-fix-linkin.patch
 create mode 100644 meta-oe/recipes-multimedia/jack/a2jmidid_8.bb

diff --git a/meta-oe/recipes-multimedia/jack/a2jmidid/0001-wscript-add-pthread-library-dependency-to-fix-linkin.patch b/meta-oe/recipes-multimedia/jack/a2jmidid/0001-wscript-add-pthread-library-dependency-to-fix-linkin.patch
new file mode 100644
index 0000000..d17d311
--- /dev/null
+++ b/meta-oe/recipes-multimedia/jack/a2jmidid/0001-wscript-add-pthread-library-dependency-to-fix-linkin.patch
@@ -0,0 +1,43 @@
+From 488dc9b00239976caac6bd9ed76b38d9d1659dd9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Tue, 4 Oct 2016 23:44:49 +0200
+Subject: [PATCH] wscript: add pthread library dependency to fix linking
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Stolen from [1]
+
+[1] http://pkgs.fedoraproject.org/cgit/rpms/a2jmidid.git/tree/a2jmidid-linking.patch
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ wscript | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/wscript b/wscript
+index 664625b..66a532a 100644
+--- a/wscript
++++ b/wscript
+@@ -67,6 +67,7 @@ def configure(conf):
+         conf.env['DBUS_ENABLED'] = False
+ 
+     conf.env['LIB_DL'] = ['dl']
++    conf.env['LIB_PTHREAD'] = ['pthread']
+ 
+     #conf.check_header('expat.h', mandatory=True)
+     #conf.env['LIB_EXPAT'] = ['expat']
+@@ -152,7 +153,7 @@ def build(bld):
+ 
+     prog.includes = '.' # make waf dependency tracking work
+     prog.target = 'a2jmidid'
+-    prog.uselib = 'ALSA JACK DL'
++    prog.uselib = 'ALSA JACK DL PTHREAD'
+     if bld.env()['DBUS_ENABLED']:
+         prog.uselib += " DBUS-1"
+     prog = bld.create_obj('cc', 'program')
+-- 
+2.5.5
+
diff --git a/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb b/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
new file mode 100644
index 0000000..d7e93b6
--- /dev/null
+++ b/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
@@ -0,0 +1,22 @@
+SUMMARY = "a2jmidid is daemon for exposing ALSA sequencer applications as JACK MIDI"
+SECTION = "libs/multimedia"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = " \
+    file://gpl2.txt;md5=751419260aa954499f7abaabaa882bbe \
+"
+
+DEPENDS = "alsa-lib jack dbus"
+
+SRC_URI = " \
+    http://download.gna.org/${BPN}/${BPN}-${PV}.tar.bz2 \
+    file://0001-wscript-add-pthread-library-dependency-to-fix-linkin.patch \
+"
+SRC_URI[md5sum] = "9cf4edbc3ad2ddeeaf6c8c1791ff3ddd"
+SRC_URI[sha256sum] = "2a9635f62aabc59edb54ada07048dd47e896b90caff94bcee710d3582606f55f"
+
+inherit waf
+
+export LINKFLAGS="${LDFLAGS}"
+
+FILES_${PN} += "${datadir}/dbus-1/services"
-- 
2.5.5


