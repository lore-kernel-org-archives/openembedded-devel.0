Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9285EC35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 18:11:28 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.1753.1742407883695555154
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 11:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout01.t-online.de (Postfix) with SMTP id E3B718D6
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 19:11:21 +0100 (CET)
Received: from [192.168.178.20] ([84.163.32.245]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tuxsv-2Hcji40; Wed, 19 Mar 2025 19:11:21 +0100
Date: Wed, 19 Mar 2025 19:12:07 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCHv2] flite: update
To: openembedded-devel@lists.openembedded.org
Message-Id: <7KUDTS.HPKR8JZZWJVP@t-online.de>
In-Reply-To: <182E46B0A0852EC0.29673@lists.openembedded.org>
References: <182E46B0A0852EC0.29673@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-yO23aiCEsivTXtJ4OxsX"
X-TOI-EXPURGATEID: 150726::1742407881-11780793-11A94DEB/10/3626336762 SUSPECT URL
X-TOI-MSGID: 91346820-6a73-44ba-a65b-4f3b34519318
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 18:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116100

--=-yO23aiCEsivTXtJ4OxsX
Content-Type: text/plain; charset=us-ascii; format=flowed

v2: add missing Upstream-Status to one of the patches

On Wed, Mar 19 2025 at 19:11:11 +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> - update to latest tip
> - add a PR to fix implicit dependency on flite_voice_list.c
>   [<https://github.com/festvox/flite/pull/92>]
> - add a patch to fix parallel builds
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  ...s-dont-fail-in-mkdir-if-rm-rf-has-fa.patch | 30 +++++++++
>  ...28529357ba13994a2bd90cfd11bfceeffcce.patch | 67 
> +++++++++++++++++++
>  .../recipes-multimedia/flite/flite_2.2.bb     | 12 ++--
>  3 files changed, 102 insertions(+), 7 deletions(-)
>  create mode 100644 
> meta-multimedia/recipes-multimedia/flite/flite/0001-common_make_rules-dont-fail-in-mkdir-if-rm-rf-has-fa.patch
>  create mode 100644 
> meta-multimedia/recipes-multimedia/flite/flite/14aa28529357ba13994a2bd90cfd11bfceeffcce.patch
> 
> diff --git 
> a/meta-multimedia/recipes-multimedia/flite/flite/0001-common_make_rules-dont-fail-in-mkdir-if-rm-rf-has-fa.patch 
> b/meta-multimedia/recipes-multimedia/flite/flite/0001-common_make_rules-dont-fail-in-mkdir-if-rm-rf-has-fa.patch
> new file mode 100644
> index 0000000000..5f116d744c
> --- /dev/null
> +++ 
> b/meta-multimedia/recipes-multimedia/flite/flite/0001-common_make_rules-dont-fail-in-mkdir-if-rm-rf-has-fa.patch
> @@ -0,0 +1,30 @@
> +From a0377147222ba7950c76a646827751cc36799682 Mon Sep 17 00:00:00 
> 2001
> +From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> +Date: Mon, 17 Mar 2025 20:08:14 +0100
> +Subject: [PATCH] common_make_rules: dont fail in mkdir if rm -rf has 
> failed
> +
> +rm -rf fails, probably because the directory is already in use by 
> another process.
> +
> +Upstream-Status: Pending [Upstream seems to be dead]
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> +---
> + config/common_make_rules | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/config/common_make_rules b/config/common_make_rules
> +index 1a45b43..ae60fad 100644
> +--- a/config/common_make_rules
> ++++ b/config/common_make_rules
> +@@ -120,7 +120,7 @@ $(OBJDIR)/.build_so: $(FULLSHOBJS)
> + # Used in the lib/ directory and in building new voices
> + $(LIBDIR)/%.so: $(LIBDIR)/%.shared.a
> + 	@ echo making $@
> +-	@ rm -rf shared_os && mkdir shared_os
> ++	@ rm -rf shared_os && mkdir -p shared_os
> + 	@ rm -f $@ $@.${PROJECT_VERSION} $@.${PROJECT_SHLIB_VERSION}
> + 	@ (cd shared_os && $(AR) x ../$<)
> + 	@ (cd shared_os && $(CC) -shared -Wl,-soname,`basename 
> $@`.${PROJECT_SHLIB_VERSION} -o ../$@.${PROJECT_VERSION} *.os 
> $(LDFLAGS))
> +--
> +2.48.1
> +
> diff --git 
> a/meta-multimedia/recipes-multimedia/flite/flite/14aa28529357ba13994a2bd90cfd11bfceeffcce.patch 
> b/meta-multimedia/recipes-multimedia/flite/flite/14aa28529357ba13994a2bd90cfd11bfceeffcce.patch
> new file mode 100644
> index 0000000000..1ab9b7e9b2
> --- /dev/null
> +++ 
> b/meta-multimedia/recipes-multimedia/flite/flite/14aa28529357ba13994a2bd90cfd11bfceeffcce.patch
> @@ -0,0 +1,67 @@
> +From 14aa28529357ba13994a2bd90cfd11bfceeffcce Mon Sep 17 00:00:00 
> 2001
> +From: Moritz Barsnick <barsnick@gmx.net <mailto:barsnick@gmx.net>>
> +Date: Thu, 23 Mar 2023 14:53:08 +0100
> +Subject: [PATCH] fix implicit dependency on flite_voice_list.c
> +
> +Also make flite_lang_list a proper rule, so that it only builds once.
> +
> +Both C files were repeatedly being clobbered, as were their 
> respective
> +object files.
> +
> +Convert flite_voice_list.c is into an explicit dependency with a 
> creation
> +rule. flite_voice_list.o continues to be implicit from 
> flite_voice_list.c.
> +
> +Convert flite_lang_list into a similar, proper object rule.
> +
> +Fixes <https://github.com/festvox/flite/issues/86>
> +
> +Upstream-Status: Pending [<https://github.com/festvox/flite/pull/92>]
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> +---
> + main/Makefile | 20 ++++++--------------
> + 1 file changed, 6 insertions(+), 14 deletions(-)
> +
> +diff --git a/main/Makefile b/main/Makefile
> +index 8166182..b9a8828 100644
> +--- a/main/Makefile
> ++++ b/main/Makefile
> +@@ -106,21 +106,16 @@ endif
> +
> + .NOTPARALLEL: $(ALL)
> +
> +-flite_lang_list:
> +-	rm -f flite_lang_list.c
> ++flite_lang_list.c:
> + 	$(TOP)/tools/make_lang_list $(LANGS) $(LEXES)
> +-	$(MAKE) flite_lang_list.o
> +
> +-$(BINDIR)/flite$(EXEEXT): flite_main.o flite_lang_list 
> $(flite_LIBS_deps)
> ++flite_voice_list.c:
> + 	$(TOP)/tools/make_voice_list $(VOICES)
> +-	rm -f flite_voice_list.o
> +-	$(MAKE) flite_voice_list.o
> ++
> ++$(BINDIR)/flite$(EXEEXT): flite_main.o flite_voice_list.o 
> flite_lang_list.o $(flite_LIBS_deps)
> + 	$(CC) $(CFLAGS) -o $@ flite_main.o flite_voice_list.o 
> flite_lang_list.o $(flite_LIBS_flags) $(LDFLAGS)
> +
> +-$(BINDIR)/flitevox_info$(EXEEXT): flitevox_info_main.o 
> flite_lang_list $(flite_LIBS_deps)
> +-	$(TOP)/tools/make_voice_list $(VOICES)
> +-	rm -f flite_voice_list.o
> +-	$(MAKE) flite_voice_list.o
> ++$(BINDIR)/flitevox_info$(EXEEXT): flitevox_info_main.o 
> flite_voice_list.o flite_lang_list.o $(flite_LIBS_deps)
> + 	$(CC) $(CFLAGS) -o $@ flitevox_info_main.o flite_voice_list.o 
> flite_lang_list.o $(flite_LIBS_flags) $(LDFLAGS)
> +
> + $(BINDIR)/world$(EXEEXT): world_main.c
> +@@ -144,10 +139,7 @@ each:
> + 	   $(MAKE) VOICE=$$i $(BINDIR)/flite_$$i ; \
> + 	done
> +
> +-$(BINDIR)/flite_${VOICE}: flite_main.o flite_lang_list 
> $(flite_LIBS_deps)
> +-	$(TOP)/tools/make_voice_list $(VOICE)
> +-	rm -f flite_voice_list.o
> +-	$(MAKE) flite_voice_list.o
> ++$(BINDIR)/flite_${VOICE}: flite_main.o flite_voice_list.o 
> flite_lang_list.o $(flite_LIBS_deps)
> + 	$(CC) $(CFLAGS) -o $@ flite_main.o flite_voice_list.o 
> flite_lang_list.o $(flite_LIBS_flags) $(LDFLAGS)
> +
> + install:
> diff --git a/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb 
> b/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
> index bb9edfd5bf..f10e5cda83 100644
> --- a/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
> +++ b/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
> @@ -9,22 +9,20 @@ inherit autotools-brokensep
>  DEPENDS += "alsa-lib chrpath-replacement-native"
> 
>  SRC_URI = 
> "git://github.com/festvox/flite.git;protocol=https;branch=master"
> +SRC_URI += 
> "file://0001-common_make_rules-dont-fail-in-mkdir-if-rm-rf-has-fa.patch" 
> <file://0001-common_make_rules-dont-fail-in-mkdir-if-rm-rf-has-fa.patch/>
>  SRC_URI += "file://0001-Remove-defining-const-as-nothing.patch" 
> <file://0001-remove-defining-const-as-nothing.patch/>
> +SRC_URI += "file://14aa28529357ba13994a2bd90cfd11bfceeffcce.patch" 
> <file://14aa28529357ba13994a2bd90cfd11bfceeffcce.patch/>
> 
> -SRCREV = "e9e2e37c329dbe98bfeb27a1828ef9a71fa84f88"
> +SRCREV = "6c9f20dc915b17f5619340069889db0aa007fcdc"
> 
>  S = "${WORKDIR}/git"
> +PV .= "+git"
> 
>  EXTRA_OECONF += "--enable-shared"
> -
> -do_configure:append() {
> -    sed -i '/$(INSTALL) -m 755 $(BINDIR)\/flite_time 
> $(DESTDIR)$(INSTALLBINDIR)/d' ${S}/main/Makefile
> -}
> +LDFLAGS:append = " -lasound"
> 
>  do_install:append() {
>      chown -R root:root ${D}${libdir}/*
>  }
> -# | make[1]: *** No rule to make target 'flite_voice_list.c', needed 
> by 'all'.  Stop.
> -PARALLEL_MAKE = ""
> 
>  CLEANBROKEN = "1"
> --
> 2.48.1
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116099): 
> <https://lists.openembedded.org/g/openembedded-devel/message/116099>
> Mute This Topic: <https://lists.openembedded.org/mt/111794899/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-yO23aiCEsivTXtJ4OxsX
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2: add missing Upstream-Status to one of the patches</div></div><div id="geary-quote" dir="auto"><br>On Wed, Mar 19 2025 at 19:11:11 +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">- update to latest tip
- add a PR to fix implicit dependency on flite_voice_list.c
  [<a href="https://github.com/festvox/flite/pull/92">https://github.com/festvox/flite/pull/92</a>]
- add a patch to fix parallel builds

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 ...s-dont-fail-in-mkdir-if-rm-rf-has-fa.patch | 30 +++++++++
 ...28529357ba13994a2bd90cfd11bfceeffcce.patch | 67 +++++++++++++++++++
 .../recipes-multimedia/flite/flite_2.2.bb     | 12 ++--
 3 files changed, 102 insertions(+), 7 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/flite/flite/0001-common_make_rules-dont-fail-in-mkdir-if-rm-rf-has-fa.patch
 create mode 100644 meta-multimedia/recipes-multimedia/flite/flite/14aa28529357ba13994a2bd90cfd11bfceeffcce.patch

diff --git a/meta-multimedia/recipes-multimedia/flite/flite/0001-common_make_rules-dont-fail-in-mkdir-if-rm-rf-has-fa.patch b/meta-multimedia/recipes-multimedia/flite/flite/0001-common_make_rules-dont-fail-in-mkdir-if-rm-rf-has-fa.patch
new file mode 100644
index 0000000000..5f116d744c
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/flite/flite/0001-common_make_rules-dont-fail-in-mkdir-if-rm-rf-has-fa.patch
@@ -0,0 +1,30 @@
+From a0377147222ba7950c76a646827751cc36799682 Mon Sep 17 00:00:00 2001
+From: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
+Date: Mon, 17 Mar 2025 20:08:14 +0100
+Subject: [PATCH] common_make_rules: dont fail in mkdir if rm -rf has failed
+
+rm -rf fails, probably because the directory is already in use by another process.
+
+Upstream-Status: Pending [Upstream seems to be dead]
+
+Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
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
+-	@ rm -rf shared_os &amp;&amp; mkdir shared_os
++	@ rm -rf shared_os &amp;&amp; mkdir -p shared_os
+ 	@ rm -f $@ $@.${PROJECT_VERSION} $@.${PROJECT_SHLIB_VERSION} 
+ 	@ (cd shared_os &amp;&amp; $(AR) x ../$&lt;)
+ 	@ (cd shared_os &amp;&amp; $(CC) -shared -Wl,-soname,`basename $@`.${PROJECT_SHLIB_VERSION} -o ../$@.${PROJECT_VERSION} *.os $(LDFLAGS))
+-- 
+2.48.1
+
diff --git a/meta-multimedia/recipes-multimedia/flite/flite/14aa28529357ba13994a2bd90cfd11bfceeffcce.patch b/meta-multimedia/recipes-multimedia/flite/flite/14aa28529357ba13994a2bd90cfd11bfceeffcce.patch
new file mode 100644
index 0000000000..1ab9b7e9b2
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/flite/flite/14aa28529357ba13994a2bd90cfd11bfceeffcce.patch
@@ -0,0 +1,67 @@
+From 14aa28529357ba13994a2bd90cfd11bfceeffcce Mon Sep 17 00:00:00 2001
+From: Moritz Barsnick &lt;<a href="mailto:barsnick@gmx.net">barsnick@gmx.net</a>&gt;
+Date: Thu, 23 Mar 2023 14:53:08 +0100
+Subject: [PATCH] fix implicit dependency on flite_voice_list.c
+
+Also make flite_lang_list a proper rule, so that it only builds once.
+
+Both C files were repeatedly being clobbered, as were their respective
+object files.
+
+Convert flite_voice_list.c is into an explicit dependency with a creation
+rule. flite_voice_list.o continues to be implicit from flite_voice_list.c.
+
+Convert flite_lang_list into a similar, proper object rule.
+
+Fixes <a href="https://github.com/festvox/flite/issues/86">https://github.com/festvox/flite/issues/86</a>
+
+Upstream-Status: Pending [<a href="https://github.com/festvox/flite/pull/92">https://github.com/festvox/flite/pull/92</a>]
+
+Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
+---
+ main/Makefile | 20 ++++++--------------
+ 1 file changed, 6 insertions(+), 14 deletions(-)
+
+diff --git a/main/Makefile b/main/Makefile
+index 8166182..b9a8828 100644
+--- a/main/Makefile
++++ b/main/Makefile
+@@ -106,21 +106,16 @@ endif
+ 
+ .NOTPARALLEL: $(ALL)
+ 
+-flite_lang_list: 
+-	rm -f flite_lang_list.c
++flite_lang_list.c:
+ 	$(TOP)/tools/make_lang_list $(LANGS) $(LEXES)
+-	$(MAKE) flite_lang_list.o
+ 
+-$(BINDIR)/flite$(EXEEXT): flite_main.o flite_lang_list $(flite_LIBS_deps)
++flite_voice_list.c:
+ 	$(TOP)/tools/make_voice_list $(VOICES)
+-	rm -f flite_voice_list.o
+-	$(MAKE) flite_voice_list.o
++
++$(BINDIR)/flite$(EXEEXT): flite_main.o flite_voice_list.o flite_lang_list.o $(flite_LIBS_deps)
+ 	$(CC) $(CFLAGS) -o $@ flite_main.o flite_voice_list.o flite_lang_list.o $(flite_LIBS_flags) $(LDFLAGS)
+ 
+-$(BINDIR)/flitevox_info$(EXEEXT): flitevox_info_main.o flite_lang_list $(flite_LIBS_deps)
+-	$(TOP)/tools/make_voice_list $(VOICES)
+-	rm -f flite_voice_list.o
+-	$(MAKE) flite_voice_list.o
++$(BINDIR)/flitevox_info$(EXEEXT): flitevox_info_main.o flite_voice_list.o flite_lang_list.o $(flite_LIBS_deps)
+ 	$(CC) $(CFLAGS) -o $@ flitevox_info_main.o flite_voice_list.o flite_lang_list.o $(flite_LIBS_flags) $(LDFLAGS)
+ 
+ $(BINDIR)/world$(EXEEXT): world_main.c
+@@ -144,10 +139,7 @@ each:
+ 	   $(MAKE) VOICE=$$i $(BINDIR)/flite_$$i ; \
+ 	done
+ 
+-$(BINDIR)/flite_${VOICE}: flite_main.o flite_lang_list $(flite_LIBS_deps)
+-	$(TOP)/tools/make_voice_list $(VOICE)
+-	rm -f flite_voice_list.o
+-	$(MAKE) flite_voice_list.o
++$(BINDIR)/flite_${VOICE}: flite_main.o flite_voice_list.o flite_lang_list.o $(flite_LIBS_deps)
+ 	$(CC) $(CFLAGS) -o $@ flite_main.o flite_voice_list.o flite_lang_list.o $(flite_LIBS_flags) $(LDFLAGS)
+ 
+ install:
diff --git a/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb b/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
index bb9edfd5bf..f10e5cda83 100644
--- a/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
+++ b/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
@@ -9,22 +9,20 @@ inherit autotools-brokensep
 DEPENDS += "alsa-lib chrpath-replacement-native"
 
 SRC_URI = "git://github.com/festvox/flite.git;protocol=https;branch=master"
+SRC_URI += "<a href="file://0001-common_make_rules-dont-fail-in-mkdir-if-rm-rf-has-fa.patch" "="">file://0001-common_make_rules-dont-fail-in-mkdir-if-rm-rf-has-fa.patch"</a>
 SRC_URI += "<a href="file://0001-Remove-defining-const-as-nothing.patch" "="">file://0001-Remove-defining-const-as-nothing.patch"</a>
+SRC_URI += "<a href="file://14aa28529357ba13994a2bd90cfd11bfceeffcce.patch" "="">file://14aa28529357ba13994a2bd90cfd11bfceeffcce.patch"</a>
 
-SRCREV = "e9e2e37c329dbe98bfeb27a1828ef9a71fa84f88"
+SRCREV = "6c9f20dc915b17f5619340069889db0aa007fcdc"
 
 S = "${WORKDIR}/git"
+PV .= "+git"
 
 EXTRA_OECONF += "--enable-shared"
-
-do_configure:append() {
-    sed -i '/$(INSTALL) -m 755 $(BINDIR)\/flite_time $(DESTDIR)$(INSTALLBINDIR)/d' ${S}/main/Makefile
-}
+LDFLAGS:append = " -lasound"
 
 do_install:append() {
     chown -R root:root ${D}${libdir}/*
 }
-# | make[1]: *** No rule to make target 'flite_voice_list.c', needed by 'all'.  Stop.
-PARALLEL_MAKE = ""
 
 CLEANBROKEN = "1"
<div>-- 
</div>2.48.1

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#116099): <a href="https://lists.openembedded.org/g/openembedded-devel/message/116099">https://lists.openembedded.org/g/openembedded-devel/message/116099</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/111794899/3618223">https://lists.openembedded.org/mt/111794899/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-yO23aiCEsivTXtJ4OxsX--


