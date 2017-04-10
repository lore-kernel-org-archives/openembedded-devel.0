Return-Path: <herve.jourdain@neuf.fr>
X-Greylist: delayed 377 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 10 Apr 2017 05:21:28 UTC
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.10])
	by mail.openembedded.org (Postfix) with ESMTP id 41EB977819
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Apr 2017 05:21:28 +0000 (UTC)
Received: from nbhjo (203-69-87-74.HINET-IP.hinet.net [203.69.87.74])
	by msfrf2620.sfr.fr (SMTP Server) with ESMTP id CD0EE1C000839;
	Mon, 10 Apr 2017 07:15:11 +0200 (CEST)
Received: from nbhjo (203-69-87-74.HINET-IP.hinet.net [203.69.87.74])	(using
	TLSv1.2
	with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2620.sfr.fr (SMTP Server) with ESMTPSA;
	Mon, 10 Apr 2017 07:15:10 +0200 (CEST)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: 'Andrey Konovalov' <andrey.konovalov@linaro.org>,
	openembedded-devel@lists.openembedded.org
References: <1491591433-19590-1-git-send-email-andrey.konovalov@linaro.org>
In-Reply-To: <1491591433-19590-1-git-send-email-andrey.konovalov@linaro.org>
Date: Mon, 10 Apr 2017 07:15:04 +0200
Message-ID: <004901d2b1b9$6cb39420$461abc60$@neuf.fr>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQIQF3AF58lZYP3cO8fcbc2G7aq4ZaFDQ1+A
X-sfr-mailing: LEGIT
Subject: Re: ***SPAM*** [PATCH] chromium: enable aarch64 support
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
X-List-Received-Date: Mon, 10 Apr 2017 05:21:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Language: fr

Hi,

And in more recent / GN based versions of Chromium, no specific patch is
even needed, as aarch64 is "natively" supported by the codebase.
I guess recipes for those will come soon, since it seems several different
persons/groups came with their own flavor of GN build...

Cheers,
Herve

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
Andrey Konovalov
Sent: vendredi 7 avril 2017 20:57
To: openembedded-devel@lists.openembedded.org
Subject: ***SPAM*** [oe] [PATCH] chromium: enable aarch64 support

Tested by running:
- chromium-wayland on HiKey
- chromium on dragonboard-410c

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 recipes-browser/chromium/chromium.inc                   |  1 +
 recipes-browser/chromium/files/aarch64/include.gypi     |  6 ++++++
 recipes-browser/chromium/files/aarch64/oe-defaults.gypi | 15
+++++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 recipes-browser/chromium/files/aarch64/include.gypi
 create mode 100644 recipes-browser/chromium/files/aarch64/oe-defaults.gypi

diff --git a/recipes-browser/chromium/chromium.inc
b/recipes-browser/chromium/chromium.inc
index 60edccb..c0c3b94 100644
--- a/recipes-browser/chromium/chromium.inc
+++ b/recipes-browser/chromium/chromium.inc
@@ -7,6 +7,7 @@ COMPATIBLE_MACHINE_x86-64 = "(.*)"
 COMPATIBLE_MACHINE_armv6 = "(.*)"
 COMPATIBLE_MACHINE_armv7a = "(.*)"
 COMPATIBLE_MACHINE_armv7ve = "(.*)"
+COMPATIBLE_MACHINE_aarch64 = "(.*)"
 
 # The build type defaults to Release. If you want a Debug build, you can
set  # the variable CHROMIUM_BUILD_TYPE to "Debug" in your conf/local.conf
file.
diff --git a/recipes-browser/chromium/files/aarch64/include.gypi
b/recipes-browser/chromium/files/aarch64/include.gypi
new file mode 100644
index 0000000..ad0347a
--- /dev/null
+++ b/recipes-browser/chromium/files/aarch64/include.gypi
@@ -0,0 +1,6 @@
+{
+  'variables': {
+    # Configure for aarch64 compilation
+    'target_arch': 'arm64',
+  },
+}
diff --git a/recipes-browser/chromium/files/aarch64/oe-defaults.gypi
b/recipes-browser/chromium/files/aarch64/oe-defaults.gypi
new file mode 100644
index 0000000..27e1cfe
--- /dev/null
+++ b/recipes-browser/chromium/files/aarch64/oe-defaults.gypi
@@ -0,0 +1,15 @@
+{
+  'variables': {
+    'use_system_bzip2': 1,
+    'disable_nacl': 1,
+    'proprietary_codecs': 1,
+    'v8_use_snapshot': 1,
+    'use_system_ffmpeg': 0,
+    'linux_use_tcmalloc': 0,
+    'linux_link_kerberos': 0,
+    'use_kerberos': 0,
+    'use_cups': 0,
+    'use_gnome_keyring': 0,
+    'linux_link_gnome_keyring': 0
+  },
+}
--
2.1.4

--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel


