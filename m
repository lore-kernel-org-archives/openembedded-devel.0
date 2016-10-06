Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 324CD6FF5D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Oct 2016 17:41:10 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id p25so978059uaa.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Oct 2016 10:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=dviE7CYLYHTRr30ckqUsXSUwGNTzYrcEgzf84ShG8eQ=;
	b=VCyt0PPRExwtaXyPSuiGEjHHGchEUsU7OWhHOUAbDRvg10YBt5HqhXMXjTBSestIzD
	qmO8M8cMdlDr5VhJimlPsOq+X1x0WZEH4R986hNjwifcxcTurg6BYq74+1nOuOWlQPqh
	OSVLPJ2PG5ZJEm/TyKUJT8m44buZ4nkRln1tRNtqMN/ya72L5UZ+WLLCECCcqVq4Wy2I
	bd8W2hqR1YrY1+ASnIroMPgcEIYCNMikbHIujjH5vshdJHsRElEvWlApvhC82ORF8CHq
	O1uqixZzf17i6xIxUTJ89EDOB7d1hZinwJth0rXQQ2wQUHseanQNjDFix65o1SfxCQ0R
	+Suw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=dviE7CYLYHTRr30ckqUsXSUwGNTzYrcEgzf84ShG8eQ=;
	b=Hh/g5z04YTJaPHmXLxpqA2N7PtZyg1KF6jm+YeR0CR9DBfkKtnAj6vbe3yGV/Vi5WM
	y5Tx4wV5EkOgEJSEEcrGZHHpqmCEkNwLA8TUFIOK0UibS2zzNY0K4HvhVvagRace9ZEL
	LsvQDKnBmfwKsR7ytzS/tTwi3MtECsEx7dOwg35y1Dgy582JbVHBFV5WY8VO3zxCnwGS
	jjj4qrQFTHqvpM+96Ka9Tpi4eCgiEWFGtN0WYg0o0iVsH+kTRPVP2Fs08/tlrEb6ugIS
	1VwDwebEaDCHrvVssZTLYl9+S6QuWfb8yN9Q5WzNxPNWurEL2BmvYjbDKTOgyvTq/NMj
	dguQ==
X-Gm-Message-State: AA6/9RmZ1+fVYyT1w6aeJwKrl+nzydO7F5U3xPP3gV2lrkf0huCsQZKayd/ROFszVTjK/A==
X-Received: by 10.159.35.71 with SMTP id 65mr6650317uae.81.1475775672059;
	Thu, 06 Oct 2016 10:41:12 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.155.148])
	by smtp.gmail.com with ESMTPSA id 76sm865321uad.21.2016.10.06.10.41.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Oct 2016 10:41:11 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Oct 2016 14:40:39 -0300
Message-Id: <1475775639-31507-2-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1475775639-31507-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1475775639-31507-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-multimedia][PATCH 2/2] alsa-equal: Add recipe for version 0.6
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
X-List-Received-Date: Thu, 06 Oct 2016 17:41:15 -0000

Alsaequal is a real-time adjustable equalizer plugin for ALSA. It can be
adjusted using an ALSA compatible mixer, like alsamixergui or alsamixer.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../alsa-equal/alsa-equal/0001-Fix-asneeded.patch  | 37 +++++++++
 .../alsa-equal/0002-Fix-Eq-CAPS-plugin-name.patch  | 83 +++++++++++++++++++
 .../alsa-equal/alsa-equal/0003-Fix-mixer.patch     | 92 ++++++++++++++++++++++
 .../alsa-equal/alsa-equal_0.6.bb                   | 44 +++++++++++
 4 files changed, 256 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal/0001-Fix-asneeded.patch
 create mode 100644 meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal/0002-Fix-Eq-CAPS-plugin-name.patch
 create mode 100644 meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal/0003-Fix-mixer.patch
 create mode 100644 meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb

diff --git a/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal/0001-Fix-asneeded.patch b/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal/0001-Fix-asneeded.patch
new file mode 100644
index 0000000..64130d9
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal/0001-Fix-asneeded.patch
@@ -0,0 +1,37 @@
+From c17129561e784bb9efebee2380349f121db0a9db Mon Sep 17 00:00:00 2001
+From: Fabio Berton <fabio.berton@ossystems.com.br>
+Date: Wed, 5 Oct 2016 10:56:33 -0300
+Subject: [PATCH 1/3] Fix asneeded
+Organization: O.S. Systems Software LTDA.
+
+Patch from:
+https://git.backbone.ws/portage/overlay/commit/7a069112054fbb5dc94a857e9c020a38cb1c6fde
+
+Upstream-Status: Pending
+
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 3b2aa7d..0489fc1 100644
+--- a/Makefile
++++ b/Makefile
+@@ -29,11 +29,11 @@ dep:
+ 
+ $(SND_PCM_BIN): $(SND_PCM_OBJECTS)
+ 	@echo LD $@
+-	$(Q)$(LD) $(LDFLAGS) $(SND_PCM_LIBS) $(SND_PCM_OBJECTS) -o $(SND_PCM_BIN)
++	$(Q)$(LD) $(LDFLAGS) $(SND_PCM_OBJECTS) -o $(SND_PCM_BIN) $(SND_PCM_LIBS)
+ 
+ $(SND_CTL_BIN): $(SND_CTL_OBJECTS)
+ 	@echo LD $@
+-	$(Q)$(LD) $(LDFLAGS) $(SND_CTL_LIBS) $(SND_CTL_OBJECTS) -o $(SND_CTL_BIN)
++	$(Q)$(LD) $(LDFLAGS) $(SND_CTL_OBJECTS) -o $(SND_CTL_BIN) $(SND_CTL_LIBS)
+ 
+ %.o: %.c
+ 	@echo GCC $<
+-- 
+2.1.4
+
diff --git a/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal/0002-Fix-Eq-CAPS-plugin-name.patch b/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal/0002-Fix-Eq-CAPS-plugin-name.patch
new file mode 100644
index 0000000..efce380
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal/0002-Fix-Eq-CAPS-plugin-name.patch
@@ -0,0 +1,83 @@
+From d5c6c92045f9b6ad32365f39b8cc77f2fcd7d0f5 Mon Sep 17 00:00:00 2001
+From: Fabio Berton <fabio.berton@ossystems.com.br>
+Date: Wed, 5 Oct 2016 10:57:29 -0300
+Subject: [PATCH 2/3] Fix Eq CAPS plugin name
+Organization: O.S. Systems Software LTDA.
+
+Patch from:
+https://git.backbone.ws/portage/overlay/commit/7a069112054fbb5dc94a857e9c020a38cb1c6fde
+
+Upstream-Status: Pending
+
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+---
+ README      | 8 ++++----
+ ctl_equal.c | 2 +-
+ pcm_equal.c | 2 +-
+ 3 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/README b/README
+index b77fd2d..2df3dc5 100644
+--- a/README
++++ b/README
+@@ -1,11 +1,11 @@
+ Alsaequal is a real-time adjustable equalizer plugin for ALSA. It can
+ be adjusted using any ALSA compatible mixer, e.g. alsamixergui.
+ 
+-Alsaequal uses the Eq CAPS LADSPA Plugin for audio processing, actually
++Alsaequal uses the Eq10 CAPS LADSPA Plugin for audio processing, actually
+ alsaequal is a generic LADSPA plugin interface with real-time access to
+ the LADSPA controls (the LADSPA plugin included with alsa doesn't allow
+ for real-time controls) but it was developed for and only tested with
+-Eq CAPS LADSPA plugin. You are welcome to try it with other plugins, it
++Eq10 CAPS LADSPA plugin. You are welcome to try it with other plugins, it
+ may work. Let me know how it goes, you can reach me at
+ <charles@thedigitalmachine.net>.
+ 
+@@ -66,7 +66,7 @@ ctl.<name_equal> {
+ 	library -- location of the LADSPA library, the default is
+ 					"/usr/lib/ladspa/caps.so"
+ 	module -- module name within the LADSPA library, the deafault
+-					is "Eq"
++					is "Eq10"
+ 	channels -- number of channels, the default is 2
+ }
+ 
+@@ -81,7 +81,7 @@ pcm.<name_pcm> {
+ 	library -- location of the LADSPA library, the default is
+ 					"/usr/lib/ladspa/caps.so"
+ 	module -- module name within the LADSPA library, the deafault
+-					is "Eq"
++					is "Eq10"
+ 	channels -- number of channels, the default is 2
+ }
+ 
+diff --git a/ctl_equal.c b/ctl_equal.c
+index 40747d4..afba793 100644
+--- a/ctl_equal.c
++++ b/ctl_equal.c
+@@ -167,7 +167,7 @@ SND_CTL_PLUGIN_DEFINE_FUNC(equal)
+ 	snd_ctl_equal_t *equal;
+ 	const char *controls = ".alsaequal.bin";
+ 	const char *library = "/usr/lib/ladspa/caps.so";
+-	const char *module = "Eq";
++	const char *module = "Eq10";
+ 	long channels = 2;
+ 	const char *sufix = " Playback Volume";
+ 	int err, i, index;
+diff --git a/pcm_equal.c b/pcm_equal.c
+index 2bc87fb..b0b4265 100644
+--- a/pcm_equal.c
++++ b/pcm_equal.c
+@@ -151,7 +151,7 @@ SND_PCM_PLUGIN_DEFINE_FUNC(equal)
+ 	snd_config_t *sconf = NULL;
+ 	const char *controls = ".alsaequal.bin";
+ 	const char *library = "/usr/lib/ladspa/caps.so";
+-	const char *module = "Eq";
++	const char *module = "Eq10";
+ 	long channels = 2;
+ 	int err;
+ 	
+-- 
+2.1.4
+
diff --git a/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal/0003-Fix-mixer.patch b/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal/0003-Fix-mixer.patch
new file mode 100644
index 0000000..1c2503e
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal/0003-Fix-mixer.patch
@@ -0,0 +1,92 @@
+From 665f68a863b4ac2e21b0a994dce7e2720c03aa9d Mon Sep 17 00:00:00 2001
+From: Fabio Berton <fabio.berton@ossystems.com.br>
+Date: Wed, 5 Oct 2016 11:02:18 -0300
+Subject: [PATCH 3/3] Fix mixer
+Organization: O.S. Systems Software LTDA.
+
+Patch from:
+https://git.backbone.ws/portage/overlay/commit/7a069112054fbb5dc94a857e9c020a38cb1c6fde
+
+Upstream-Status: Pending
+
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+---
+ ctl_equal.c    | 9 ++++++---
+ ladspa_utils.c | 6 ++++--
+ pcm_equal.c    | 6 ++++--
+ 3 files changed, 14 insertions(+), 7 deletions(-)
+
+diff --git a/ctl_equal.c b/ctl_equal.c
+index afba793..dd90e88 100644
+--- a/ctl_equal.c
++++ b/ctl_equal.c
+@@ -263,7 +263,8 @@ SND_CTL_PLUGIN_DEFINE_FUNC(equal)
+ 	for(i = 0; i < equal->num_input_controls; i++) {
+ 		if(equal->control_data->control[i].type == LADSPA_CNTRL_INPUT) {
+ 			index = equal->control_data->control[i].index;
+-			if(equal->klass->PortDescriptors[index] !=
++			if((equal->klass->PortDescriptors[index] & 
++					(LADSPA_PORT_INPUT | LADSPA_PORT_CONTROL)) !=
+ 					(LADSPA_PORT_INPUT | LADSPA_PORT_CONTROL)) {
+ 				SNDERR("Problem with control file %s, %d.", controls, index);
+ 				return -1;
+@@ -284,12 +285,14 @@ SND_CTL_PLUGIN_DEFINE_FUNC(equal)
+ 	}
+ 
+ 	/* Make sure that the control file makes sense */
+-	if(equal->klass->PortDescriptors[equal->control_data->input_index] !=
++	if((equal->klass->PortDescriptors[equal->control_data->input_index] & 
++			(LADSPA_PORT_INPUT | LADSPA_PORT_AUDIO))!=
+ 			(LADSPA_PORT_INPUT | LADSPA_PORT_AUDIO)) {
+ 		SNDERR("Problem with control file %s.", controls);
+ 		return -1;
+ 	}
+-	if(equal->klass->PortDescriptors[equal->control_data->output_index] !=
++	if((equal->klass->PortDescriptors[equal->control_data->output_index] & 
++			(LADSPA_PORT_OUTPUT | LADSPA_PORT_AUDIO))!=
+ 			(LADSPA_PORT_OUTPUT | LADSPA_PORT_AUDIO)) {
+ 		SNDERR("Problem with control file %s.", controls);
+ 		return -1;
+diff --git a/ladspa_utils.c b/ladspa_utils.c
+index 7b596da..0c00800 100644
+--- a/ladspa_utils.c
++++ b/ladspa_utils.c
+@@ -354,10 +354,12 @@ LADSPA_Control * LADSPAcontrolMMAP(const LADSPA_Descriptor *psDescriptor,
+ 						default_controls->control[index].type = LADSPA_CNTRL_OUTPUT;
+ 					}
+ 					index++;
+-				} else if(psDescriptor->PortDescriptors[i] ==
++				} else if((psDescriptor->PortDescriptors[i] &
++						(LADSPA_PORT_INPUT | LADSPA_PORT_AUDIO)) ==
+ 						(LADSPA_PORT_INPUT | LADSPA_PORT_AUDIO)) {
+ 					default_controls->input_index = i;
+-				} else if(psDescriptor->PortDescriptors[i] ==
++				} else if((psDescriptor->PortDescriptors[i] & 
++						(LADSPA_PORT_OUTPUT | LADSPA_PORT_AUDIO)) ==
+ 						(LADSPA_PORT_OUTPUT | LADSPA_PORT_AUDIO)) {
+ 					default_controls->output_index = i;
+ 				}
+diff --git a/pcm_equal.c b/pcm_equal.c
+index b0b4265..8d98371 100644
+--- a/pcm_equal.c
++++ b/pcm_equal.c
+@@ -231,12 +231,14 @@ SND_PCM_PLUGIN_DEFINE_FUNC(equal)
+ 	}
+ 
+ 	/* Make sure that the control file makes sense */
+-	if(equal->klass->PortDescriptors[equal->control_data->input_index] !=
++	if((equal->klass->PortDescriptors[equal->control_data->input_index] &   
++			(LADSPA_PORT_INPUT | LADSPA_PORT_AUDIO)) !=
+ 			(LADSPA_PORT_INPUT | LADSPA_PORT_AUDIO)) {
+ 		SNDERR("Problem with control file %s.", controls);
+ 		return -1;
+ 	}
+-	if(equal->klass->PortDescriptors[equal->control_data->output_index] !=
++	if((equal->klass->PortDescriptors[equal->control_data->output_index] & 
++			(LADSPA_PORT_OUTPUT | LADSPA_PORT_AUDIO)) !=
+ 			(LADSPA_PORT_OUTPUT | LADSPA_PORT_AUDIO)) {
+ 		SNDERR("Problem with control file %s.", controls);
+ 		return -1;
+-- 
+2.1.4
+
diff --git a/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb b/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb
new file mode 100644
index 0000000..637d029
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb
@@ -0,0 +1,44 @@
+DESCRIPTION = "A real-time adjustable equalizer plugin for ALSA"
+HOMEPAGE = "http://www.thedigitalmachine.net/alsaequal.html"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
+
+DEPENDS = "alsa-lib"
+
+SRC_URI = " \
+    http://www.thedigitalmachine.net/tools/alsaequal-${PV}.tar.bz2 \
+    file://0001-Fix-asneeded.patch \
+    file://0002-Fix-Eq-CAPS-plugin-name.patch \
+    file://0003-Fix-mixer.patch \
+"
+
+SRC_URI[md5sum] = "d2edc7710c72cbf3ab297c414e35ebda"
+SRC_URI[sha256sum] = "916e7d152added24617efc350142438a46099efe062bd8781d36dbf10b4e6ff0"
+
+S = "${WORKDIR}/alsaequal"
+
+EXTRA_OEMAKE = " \
+    Q='' \
+    CC='${CC}' \
+    LD='${CC}' \
+    LDFLAGS='${LDFLAGS} -shared -lasound' \
+    CFLAGS='${CFLAGS} -I. -funroll-loops -ffast-math -fPIC -DPIC' \
+    SND_PCM_LIBS='-lasound' \
+    SND_CTL_LIBS='-lasound' \
+"
+
+do_compile() {
+    oe_runmake all
+}
+
+do_install() {
+    install -Dm 0644 libasound_module_ctl_equal.so ${D}${libdir}/alsa-lib/libasound_module_ctl_equal.so
+    install -Dm 0644 libasound_module_pcm_equal.so ${D}${libdir}/alsa-lib/libasound_module_pcm_equal.so
+}
+
+RDEPENDS_${PN} += " \
+    alsa-utils \
+    caps \
+"
+
+FILES_${PN} = "${libdir}/alsa-lib/"
-- 
2.1.4


