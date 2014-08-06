Return-Path: <joe.macdonald@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 13FCE709FB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 13:37:53 +0000 (UTC)
Received: by mail-ie0-f173.google.com with SMTP id tr6so2842551ieb.32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Aug 2014 06:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=VM9blWuJ2R5O40i9M2QAaZBYrv555+esknbjT0xsEts=;
	b=oyDJGxYIXtv5oQYaZRmMuB1GyvUp6fk2xLhC+Hzj9TrvhBeqvwNktEDCX3TpJBJc5P
	9WXQjxVcT7S9KYvxiruCIQprYX4TaJY9UF/pby4Y8mfqm90ARPlClXa0EgmyPI/YI93Y
	M4S3Y9zUWrCXuzRk0f6C1EANLmqqIjcX4Ukx/nA2zUO4RvQNwkXG1NDIzM0iOuLIf+pe
	gyaGxf/LDiKcr3IWeqpBvJlefhSbOArh1ksLT7epafOniZn3WqIxqb4o3YAvPbYf69DF
	sCc201QvScmJNe8Jj48+60QpGxVbDBcsDg3u2gcaCL+smJRW5vUU1Ncrprq8BOrY3Vom
	V/rg==
X-Received: by 10.43.6.195 with SMTP id ol3mr14978322icb.86.1407332274431;
	Wed, 06 Aug 2014 06:37:54 -0700 (PDT)
Received: from skynet.deserted.net (24-246-4-250.cable.teksavvy.com.
	[24.246.4.250])
	by mx.google.com with ESMTPSA id hu5sm7704362igb.16.2014.08.06.06.37.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 06:37:52 -0700 (PDT)
Sender: Joe MacDonald <joe.macdonald@gmail.com>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Aug 2014 09:37:51 -0400
Message-Id: <1407332271-32696-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 2.0.0.257.g75cc6c6
Subject: [meta-networking][PATCH] wireshark: update to latest stable version
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
X-List-Received-Date: Wed, 06 Aug 2014 13:37:54 -0000

Version 1.12.0 is out, update the SRC_URI and associated variables.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 .../wireshark/va_list-can-t-be-NULL-on-ARM.patch   | 99 ----------------------
 ...wireshark_1.12.0-rc2.bb => wireshark_1.12.0.bb} | 10 +--
 2 files changed, 5 insertions(+), 104 deletions(-)
 delete mode 100644 meta-networking/recipes-support/wireshark/wireshark/va_list-can-t-be-NULL-on-ARM.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_1.12.0-rc2.bb => wireshark_1.12.0.bb} (81%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark/va_list-can-t-be-NULL-on-ARM.patch b/meta-networking/recipes-support/wireshark/wireshark/va_list-can-t-be-NULL-on-ARM.patch
deleted file mode 100644
index 26a004c..0000000
--- a/meta-networking/recipes-support/wireshark/wireshark/va_list-can-t-be-NULL-on-ARM.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From 320c4f0d705a3ed94f710fb4b7b3eef897ff7bc4 Mon Sep 17 00:00:00 2001
-From: Steev Klimaszewski <threeway@gmail.com>
-Date: Thu, 19 Jun 2014 16:54:57 -0500
-Subject: [PATCH] va_list can't be NULL on ARM.
-
-Bug: 10209
-Change-Id: Ibd63a530450b7d2d4ec244e91c77caa731ba63aa
-Signed-off-by: Steev Klimaszewski <threeway@gmail.com>
-Signed-off-by: Balint Reczey <balint@balintreczey.hu>
-Reviewed-on: https://code.wireshark.org/review/2464
-Reviewed-by: Evan Huus <eapache@gmail.com>
-Reviewed-by: Michael Mann <mmann78@netscape.net>
-
-Upstream-Status: Backport
-The patch was imported from the wireshark git server
-  (https://code.wireshark.org/review/p/wireshark.git) as of commit id
-    320c4f0d705a3ed94f710fb4b7b3eef897ff7bc4.
-
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- epan/expert.c | 36 +++++++++++++++++++++++++++++-------
- 1 file changed, 29 insertions(+), 7 deletions(-)
-
-diff --git a/epan/expert.c b/epan/expert.c
-index 46be838..a69566d 100644
---- a/epan/expert.c
-+++ b/epan/expert.c
-@@ -381,15 +381,26 @@ expert_set_info_vformat(packet_info *pinfo, proto_item *pi, int group, int sever
- 	tap_queue_packet(expert_tap, pinfo, ei);
- }
- 
--void
--expert_add_info(packet_info *pinfo, proto_item *pi, expert_field *expindex)
-+/* Helper function for expert_add_info() to work around compiler's special needs on ARM*/
-+static inline void
-+expert_add_info_internal(packet_info *pinfo, proto_item *pi, expert_field *expindex, ...)
- {
-+	/* the va_list is ignored */
-+	va_list unused;
- 	expert_field_info* eiinfo;
- 
- 	/* Look up the item */
- 	EXPERT_REGISTRAR_GET_NTH(expindex->ei, eiinfo);
- 
--	expert_set_info_vformat(pinfo, pi, eiinfo->group, eiinfo->severity, *eiinfo->hf_info.p_id, FALSE, eiinfo->summary, NULL);
-+	va_start(unused, expindex);
-+	expert_set_info_vformat(pinfo, pi, eiinfo->group, eiinfo->severity, *eiinfo->hf_info.p_id, FALSE, eiinfo->summary, unused);
-+	va_end(unused);
-+}
-+
-+void
-+expert_add_info(packet_info *pinfo, proto_item *pi, expert_field *expindex)
-+{
-+	expert_add_info_internal(pinfo, pi, expindex);
- }
- 
- void
-@@ -406,22 +417,33 @@ expert_add_info_format(packet_info *pinfo, proto_item *pi, expert_field *expinde
- 	va_end(ap);
- }
- 
--proto_item *
--proto_tree_add_expert(proto_tree *tree, packet_info *pinfo, expert_field* expindex,
--		tvbuff_t *tvb, gint start, gint length)
-+/* Helper function for expert_add_expert() to work around compiler's special needs on ARM*/
-+static inline proto_item *
-+proto_tree_add_expert_internal(proto_tree *tree, packet_info *pinfo, expert_field* expindex,
-+		tvbuff_t *tvb, gint start, gint length, ...)
- {
- 	expert_field_info* eiinfo;
- 	proto_item *ti;
-+	va_list unused;
- 
- 	/* Look up the item */
- 	EXPERT_REGISTRAR_GET_NTH(expindex->ei, eiinfo);
- 
- 	ti = proto_tree_add_text(tree, tvb, start, length, "%s", eiinfo->summary);
--	expert_set_info_vformat(pinfo, ti, eiinfo->group, eiinfo->severity, *eiinfo->hf_info.p_id, FALSE, eiinfo->summary, NULL);
-+	va_start(unused, length);
-+	expert_set_info_vformat(pinfo, ti, eiinfo->group, eiinfo->severity, *eiinfo->hf_info.p_id, FALSE, eiinfo->summary, unused);
-+	va_end(unused);
- 	return ti;
- }
- 
- proto_item *
-+proto_tree_add_expert(proto_tree *tree, packet_info *pinfo, expert_field* expindex,
-+		tvbuff_t *tvb, gint start, gint length)
-+{
-+	return proto_tree_add_expert_internal(tree, pinfo, expindex, tvb, start, length);
-+}
-+
-+proto_item *
- proto_tree_add_expert_format(proto_tree *tree, packet_info *pinfo, expert_field* expindex,
- 		tvbuff_t *tvb, gint start, gint length, const char *format, ...)
- {
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb
similarity index 81%
rename from meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
rename to meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb
index b965fdf..449ac47 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb
@@ -26,12 +26,12 @@ PACKAGECONFIG[gcrypt] = "--with-gcrypt=yes, --with-gcrypt=no, libgcrypt"
 EXTRA_OECONF = "--with-qt=no --enable-usr-local=no -enable-tshark"
 
 LIC_FILES_CHKSUM = "file://README.linux;md5=631e077455b7972172eb149195e065b0"
-SRC_URI = "http://wiresharkdownloads.riverbed.com/wireshark/src/wireshark-1.12.0-rc2.tar.bz2 \
-    file://va_list-can-t-be-NULL-on-ARM.patch \
+SRC_URI = " \
+    http://wiresharkdownloads.riverbed.com/wireshark/src/wireshark-1.12.0.tar.bz2 \
 "
-    
-SRC_URI[md5sum] = "dc1149073066a29f91116c168558262e"
-SRC_URI[sha256sum]= "31009bb450126e9b12808267419f31016d14e6fde7b5e39c85ad37459908cffb"
+
+SRC_URI[md5sum] = "8dcfe451d8769901129809d2e19c1fb7"
+SRC_URI[sha256sum]= "0f59fea1c5b35de90af681067e49113fee0dd7a901750a97fa25f4256dbf13c7"
 
 do_configure_prepend() {
     # force to use fallback 
-- 
2.0.0.257.g75cc6c6


