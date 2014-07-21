Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3A37860CEB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 22:20:31 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id r10so8404117pdi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 15:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5RgvVI8xqWbrADl2R6QyUnznrwRPn0GEyLUI5eylXv8=;
	b=bJbYgDXd1rr04atlZXxwNGixhcWas70PAEKKYU6O9NYUn4LFCpssqdUd2OhHuGo3Rj
	pjrirYkX4Li2p5XL4N81d64SjxRr5Q+qAu1y4cThEa7JUNKeO4DDMLkhhRHYIqfshjto
	OunUxpoEC2OSF/cjm114nHksZCCC9qB4kGOXk82SyUKu2c8/SKLdP8OheELE01DfVswD
	50eAPs/0uo7LWH0sx6iLMCDyc0vZlrpHn5kvYabMieatH954Jpx1Yyj4ZcLtfepX/juM
	m597OCSXadbg1t51j8RIiRympfTw2RullETPaC4xP9I/iTelAiFmi/inbcBM7JOnaOtC
	xJMw==
X-Gm-Message-State: ALoCoQnOaU/lDH+kgSZjjW9FFwyGg3ThivUBy73iyzS9PRAy18wfSwq4y14UKyqCuII7lNWYy7jY
X-Received: by 10.68.225.105 with SMTP id rj9mr13505726pbc.108.1405981232809; 
	Mon, 21 Jul 2014 15:20:32 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	lq6sm61999239pab.48.2014.07.21.15.20.31 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Jul 2014 15:20:31 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Jul 2014 15:20:28 -0700
Message-Id: <1405981228-26871-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] v3] Wireshark: build fix and recipe update
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
X-List-Received-Date: Mon, 21 Jul 2014 22:20:33 -0000

Backported Arm build fix
Added gtk3 support
Cleaned up PACKAGECONFIG options

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../files/va_list-can-t-be-NULL-on-ARM.patch       | 98 ++++++++++++++++++++++
 .../wireshark/wireshark_1.12.0-rc2.bb              |  5 +-
 2 files changed, 102 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/wireshark/files/va_list-can-t-be-NULL-on-ARM.patch

diff --git a/meta-networking/recipes-support/wireshark/files/va_list-can-t-be-NULL-on-ARM.patch b/meta-networking/recipes-support/wireshark/files/va_list-can-t-be-NULL-on-ARM.patch
new file mode 100644
index 0000000..301c381
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/va_list-can-t-be-NULL-on-ARM.patch
@@ -0,0 +1,98 @@
+From 320c4f0d705a3ed94f710fb4b7b3eef897ff7bc4 Mon Sep 17 00:00:00 2001
+From: Steev Klimaszewski <threeway@gmail.com>
+Date: Thu, 19 Jun 2014 16:54:57 -0500
+Subject: [PATCH] va_list can't be NULL on ARM.
+
+Bug: 10209
+Change-Id: Ibd63a530450b7d2d4ec244e91c77caa731ba63aa
+Signed-off-by: Steev Klimaszewski <threeway@gmail.com>
+Signed-off-by: Balint Reczey <balint@balintreczey.hu>
+Reviewed-on: https://code.wireshark.org/review/2464
+Reviewed-by: Evan Huus <eapache@gmail.com>
+Reviewed-by: Michael Mann <mmann78@netscape.net>
+
+The patch was imported from the wireshark git server
+  (https://code.wireshark.org/review/p/wireshark.git) as of commit id
+    320c4f0d705a3ed94f710fb4b7b3eef897ff7bc4.
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ epan/expert.c | 36 +++++++++++++++++++++++++++++-------
+ 1 file changed, 29 insertions(+), 7 deletions(-)
+
+diff --git a/epan/expert.c b/epan/expert.c
+index 46be838..a69566d 100644
+--- a/epan/expert.c
++++ b/epan/expert.c
+@@ -381,15 +381,26 @@ expert_set_info_vformat(packet_info *pinfo, proto_item *pi, int group, int sever
+ 	tap_queue_packet(expert_tap, pinfo, ei);
+ }
+ 
+-void
+-expert_add_info(packet_info *pinfo, proto_item *pi, expert_field *expindex)
++/* Helper function for expert_add_info() to work around compiler's special needs on ARM*/
++static inline void
++expert_add_info_internal(packet_info *pinfo, proto_item *pi, expert_field *expindex, ...)
+ {
++	/* the va_list is ignored */
++	va_list unused;
+ 	expert_field_info* eiinfo;
+ 
+ 	/* Look up the item */
+ 	EXPERT_REGISTRAR_GET_NTH(expindex->ei, eiinfo);
+ 
+-	expert_set_info_vformat(pinfo, pi, eiinfo->group, eiinfo->severity, *eiinfo->hf_info.p_id, FALSE, eiinfo->summary, NULL);
++	va_start(unused, expindex);
++	expert_set_info_vformat(pinfo, pi, eiinfo->group, eiinfo->severity, *eiinfo->hf_info.p_id, FALSE, eiinfo->summary, unused);
++	va_end(unused);
++}
++
++void
++expert_add_info(packet_info *pinfo, proto_item *pi, expert_field *expindex)
++{
++	expert_add_info_internal(pinfo, pi, expindex);
+ }
+ 
+ void
+@@ -406,22 +417,33 @@ expert_add_info_format(packet_info *pinfo, proto_item *pi, expert_field *expinde
+ 	va_end(ap);
+ }
+ 
+-proto_item *
+-proto_tree_add_expert(proto_tree *tree, packet_info *pinfo, expert_field* expindex,
+-		tvbuff_t *tvb, gint start, gint length)
++/* Helper function for expert_add_expert() to work around compiler's special needs on ARM*/
++static inline proto_item *
++proto_tree_add_expert_internal(proto_tree *tree, packet_info *pinfo, expert_field* expindex,
++		tvbuff_t *tvb, gint start, gint length, ...)
+ {
+ 	expert_field_info* eiinfo;
+ 	proto_item *ti;
++	va_list unused;
+ 
+ 	/* Look up the item */
+ 	EXPERT_REGISTRAR_GET_NTH(expindex->ei, eiinfo);
+ 
+ 	ti = proto_tree_add_text(tree, tvb, start, length, "%s", eiinfo->summary);
+-	expert_set_info_vformat(pinfo, ti, eiinfo->group, eiinfo->severity, *eiinfo->hf_info.p_id, FALSE, eiinfo->summary, NULL);
++	va_start(unused, length);
++	expert_set_info_vformat(pinfo, ti, eiinfo->group, eiinfo->severity, *eiinfo->hf_info.p_id, FALSE, eiinfo->summary, unused);
++	va_end(unused);
+ 	return ti;
+ }
+ 
+ proto_item *
++proto_tree_add_expert(proto_tree *tree, packet_info *pinfo, expert_field* expindex,
++		tvbuff_t *tvb, gint start, gint length)
++{
++	return proto_tree_add_expert_internal(tree, pinfo, expindex, tvb, start, length);
++}
++
++proto_item *
+ proto_tree_add_expert_format(proto_tree *tree, packet_info *pinfo, expert_field* expindex,
+ 		tvbuff_t *tvb, gint start, gint length, const char *format, ...)
+ {
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
index 66716c3..47e72f4 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
@@ -14,6 +14,7 @@ PACKAGECONFIG += " ${@bb.utils.contains("IMAGE_FEATURES", "x11-base", "gtk2 grap
 PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)}"
 
 PACKAGECONFIG[gtk2] = "--with-gtk2=yes,--with-gtk2=no, gtk+"
+PACKAGECONFIG[gtk3] = "--with-gtk3=yes, --with-gtk3=no, gtk+3"
 PACKAGECONFIG[graphics] = "--enable-wireshark, --disable-wireshark,"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 PACKAGECONFIG[gnutls] = "--with-gnutls=yes,--with-gnutls=no, gnutls"
@@ -22,7 +23,9 @@ PACKAGECONFIG[gcrypt] = "--with-gcrypt=yes,--with-gcrypt=no, libgcrypt"
 EXTRA_OECONF = "--with-gtk3=no --with-qt=no --enable-usr-local=no -enable-tshark"
 
 LIC_FILES_CHKSUM = "file://README.linux;md5=631e077455b7972172eb149195e065b0"
-SRC_URI = "http://wiresharkdownloads.riverbed.com/wireshark/src/wireshark-1.12.0-rc2.tar.bz2 "
+SRC_URI = "http://wiresharkdownloads.riverbed.com/wireshark/src/wireshark-1.12.0-rc2.tar.bz2 \
+    file://va_list-can-t-be-NULL-on-ARM.patch \
+    "
     
 SRC_URI[md5sum] = "dc1149073066a29f91116c168558262e"
 SRC_URI[sha256sum]= "31009bb450126e9b12808267419f31016d14e6fde7b5e39c85ad37459908cffb"
-- 
1.9.1


