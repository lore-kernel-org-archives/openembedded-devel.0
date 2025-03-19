Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11487C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 17:23:48 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.682.1742405019856747657
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 10:23:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout08.t-online.de (Postfix) with SMTP id 07F54165E
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 18:23:37 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.32.245]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tux8i-1SMDOD0; Wed, 19 Mar 2025 18:23:36 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] flite: update
Date: Wed, 19 Mar 2025 18:24:21 +0100
Message-ID: <20250319172421.10300-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1742405016-437EDC07-81F1C996/10/3626336762 SUSPECT URL
X-TOI-MSGID: 3f3bd2be-cd9a-410a-84e0-82489f1becb3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 17:23:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116085

- update to latest tip
- add a PR to fix implicit dependency on flite_voice_list.c
  [https://github.com/festvox/flite/pull/92]
- add a patch to fix parallel builds

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...s-dont-fail-in-mkdir-if-rm-rf-has-fa.patch | 30 +++++++++
 ...28529357ba13994a2bd90cfd11bfceeffcce.patch | 65 +++++++++++++++++++
 .../recipes-multimedia/flite/flite_2.2.bb     | 12 ++--
 3 files changed, 100 insertions(+), 7 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/flite/flite/0001-c=
ommon_make_rules-dont-fail-in-mkdir-if-rm-rf-has-fa.patch
 create mode 100644 meta-multimedia/recipes-multimedia/flite/flite/14aa28=
529357ba13994a2bd90cfd11bfceeffcce.patch

diff --git a/meta-multimedia/recipes-multimedia/flite/flite/0001-common_m=
ake_rules-dont-fail-in-mkdir-if-rm-rf-has-fa.patch b/meta-multimedia/reci=
pes-multimedia/flite/flite/0001-common_make_rules-dont-fail-in-mkdir-if-r=
m-rf-has-fa.patch
new file mode 100644
index 0000000000..5f116d744c
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/flite/flite/0001-common_make_rul=
es-dont-fail-in-mkdir-if-rm-rf-has-fa.patch
@@ -0,0 +1,30 @@
+From a0377147222ba7950c76a646827751cc36799682 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 17 Mar 2025 20:08:14 +0100
+Subject: [PATCH] common_make_rules: dont fail in mkdir if rm -rf has fai=
led
+
+rm -rf fails, probably because the directory is already in use by anothe=
r process.
+
+Upstream-Status: Pending [Upstream seems to be dead]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ config/common_make_rules | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config/common_make_rules b/config/common_make_rules
+index 1a45b43..ae60fad 100644
+--- a/config/common_make_rules
++++ b/config/common_make_rules
+@@ -120,7 +120,7 @@ $(OBJDIR)/.build_so: $(FULLSHOBJS)
+ # Used in the lib/ directory and in building new voices
+ $(LIBDIR)/%.so: $(LIBDIR)/%.shared.a
+ 	@ echo making $@
+-	@ rm -rf shared_os && mkdir shared_os
++	@ rm -rf shared_os && mkdir -p shared_os
+ 	@ rm -f $@ $@.${PROJECT_VERSION} $@.${PROJECT_SHLIB_VERSION}=20
+ 	@ (cd shared_os && $(AR) x ../$<)
+ 	@ (cd shared_os && $(CC) -shared -Wl,-soname,`basename $@`.${PROJECT_S=
HLIB_VERSION} -o ../$@.${PROJECT_VERSION} *.os $(LDFLAGS))
+--=20
+2.48.1
+
diff --git a/meta-multimedia/recipes-multimedia/flite/flite/14aa28529357b=
a13994a2bd90cfd11bfceeffcce.patch b/meta-multimedia/recipes-multimedia/fl=
ite/flite/14aa28529357ba13994a2bd90cfd11bfceeffcce.patch
new file mode 100644
index 0000000000..3eb3b1dbec
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/flite/flite/14aa28529357ba13994a=
2bd90cfd11bfceeffcce.patch
@@ -0,0 +1,65 @@
+From 14aa28529357ba13994a2bd90cfd11bfceeffcce Mon Sep 17 00:00:00 2001
+From: Moritz Barsnick <barsnick@gmx.net>
+Date: Thu, 23 Mar 2023 14:53:08 +0100
+Subject: [PATCH] fix implicit dependency on flite_voice_list.c
+
+Also make flite_lang_list a proper rule, so that it only builds once.
+
+Both C files were repeatedly being clobbered, as were their respective
+object files.
+
+Convert flite_voice_list.c is into an explicit dependency with a creatio=
n
+rule. flite_voice_list.o continues to be implicit from flite_voice_list.=
c.
+
+Convert flite_lang_list into a similar, proper object rule.
+
+Fixes https://github.com/festvox/flite/issues/86
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ main/Makefile | 20 ++++++--------------
+ 1 file changed, 6 insertions(+), 14 deletions(-)
+
+diff --git a/main/Makefile b/main/Makefile
+index 8166182..b9a8828 100644
+--- a/main/Makefile
++++ b/main/Makefile
+@@ -106,21 +106,16 @@ endif
+=20
+ .NOTPARALLEL: $(ALL)
+=20
+-flite_lang_list:=20
+-	rm -f flite_lang_list.c
++flite_lang_list.c:
+ 	$(TOP)/tools/make_lang_list $(LANGS) $(LEXES)
+-	$(MAKE) flite_lang_list.o
+=20
+-$(BINDIR)/flite$(EXEEXT): flite_main.o flite_lang_list $(flite_LIBS_dep=
s)
++flite_voice_list.c:
+ 	$(TOP)/tools/make_voice_list $(VOICES)
+-	rm -f flite_voice_list.o
+-	$(MAKE) flite_voice_list.o
++
++$(BINDIR)/flite$(EXEEXT): flite_main.o flite_voice_list.o flite_lang_li=
st.o $(flite_LIBS_deps)
+ 	$(CC) $(CFLAGS) -o $@ flite_main.o flite_voice_list.o flite_lang_list.=
o $(flite_LIBS_flags) $(LDFLAGS)
+=20
+-$(BINDIR)/flitevox_info$(EXEEXT): flitevox_info_main.o flite_lang_list =
$(flite_LIBS_deps)
+-	$(TOP)/tools/make_voice_list $(VOICES)
+-	rm -f flite_voice_list.o
+-	$(MAKE) flite_voice_list.o
++$(BINDIR)/flitevox_info$(EXEEXT): flitevox_info_main.o flite_voice_list=
.o flite_lang_list.o $(flite_LIBS_deps)
+ 	$(CC) $(CFLAGS) -o $@ flitevox_info_main.o flite_voice_list.o flite_la=
ng_list.o $(flite_LIBS_flags) $(LDFLAGS)
+=20
+ $(BINDIR)/world$(EXEEXT): world_main.c
+@@ -144,10 +139,7 @@ each:
+ 	   $(MAKE) VOICE=3D$$i $(BINDIR)/flite_$$i ; \
+ 	done
+=20
+-$(BINDIR)/flite_${VOICE}: flite_main.o flite_lang_list $(flite_LIBS_dep=
s)
+-	$(TOP)/tools/make_voice_list $(VOICE)
+-	rm -f flite_voice_list.o
+-	$(MAKE) flite_voice_list.o
++$(BINDIR)/flite_${VOICE}: flite_main.o flite_voice_list.o flite_lang_li=
st.o $(flite_LIBS_deps)
+ 	$(CC) $(CFLAGS) -o $@ flite_main.o flite_voice_list.o flite_lang_list.=
o $(flite_LIBS_flags) $(LDFLAGS)
+=20
+ install:
diff --git a/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb b/meta=
-multimedia/recipes-multimedia/flite/flite_2.2.bb
index bb9edfd5bf..f10e5cda83 100644
--- a/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
+++ b/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
@@ -9,22 +9,20 @@ inherit autotools-brokensep
 DEPENDS +=3D "alsa-lib chrpath-replacement-native"
=20
 SRC_URI =3D "git://github.com/festvox/flite.git;protocol=3Dhttps;branch=3D=
master"
+SRC_URI +=3D "file://0001-common_make_rules-dont-fail-in-mkdir-if-rm-rf-=
has-fa.patch"
 SRC_URI +=3D "file://0001-Remove-defining-const-as-nothing.patch"
+SRC_URI +=3D "file://14aa28529357ba13994a2bd90cfd11bfceeffcce.patch"
=20
-SRCREV =3D "e9e2e37c329dbe98bfeb27a1828ef9a71fa84f88"
+SRCREV =3D "6c9f20dc915b17f5619340069889db0aa007fcdc"
=20
 S =3D "${WORKDIR}/git"
+PV .=3D "+git"
=20
 EXTRA_OECONF +=3D "--enable-shared"
-
-do_configure:append() {
-    sed -i '/$(INSTALL) -m 755 $(BINDIR)\/flite_time $(DESTDIR)$(INSTALL=
BINDIR)/d' ${S}/main/Makefile
-}
+LDFLAGS:append =3D " -lasound"
=20
 do_install:append() {
     chown -R root:root ${D}${libdir}/*
 }
-# | make[1]: *** No rule to make target 'flite_voice_list.c', needed by =
'all'.  Stop.
-PARALLEL_MAKE =3D ""
=20
 CLEANBROKEN =3D "1"
--=20
2.48.1


