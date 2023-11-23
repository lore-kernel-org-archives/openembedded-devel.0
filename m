Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED17BC5AD4C
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 16:35:08 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.95208.1700757302470401901
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Nov 2023 08:35:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout02.t-online.de (Postfix) with SMTP id B4289ED40;
	Thu, 23 Nov 2023 17:35:00 +0100 (CET)
Received: from [192.168.178.67] ([84.163.41.134]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r6CfL-2g0JYO0; Thu, 23 Nov 2023 17:34:59 +0100
Date: Thu, 23 Nov 2023 17:35:20 +0100
From: f_l_k@t-online.de
Subject: Re: [oe] [meta-networking][PATCH] libcacard: fix version string in
 libcacard.pc
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Message-Id: <WQ4L4S.ID0ZVJAVHQ0O3@t-online.de>
In-Reply-To: <179A4086F38671FD.6421@lists.openembedded.org>
References: <179A4086F38671FD.6421@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-2g6jDcj+W/CYwO8VF5U9"
X-TOI-EXPURGATEID: 150726::1700757299-FAFFA850-CB104D74/0/0 CLEAN NORMAL
X-TOI-MSGID: 7ca51498-94dd-4f1d-818f-6da72c2bb42b
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Nov 2023 16:35:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107023

--=-2g6jDcj+W/CYwO8VF5U9
Content-Type: text/plain; charset=us-ascii; format=flowed

Adding git-native to DEPENDS also fixes this issue. This should be the 
preferred way to fix I guess?

On Thu, Nov 23 2023 at 01:33:02 PM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  ...n.build-set-hardcoded-version-string.patch | 34 
> +++++++++++++++++++
>  .../recipes-support/spice/libcacard_2.8.1.bb  |  5 ++-
>  2 files changed, 38 insertions(+), 1 deletion(-)
>  create mode 100644 
> meta-networking/recipes-support/spice/libcacard/0001-meson.build-set-hardcoded-version-string.patch
> 
> diff --git 
> a/meta-networking/recipes-support/spice/libcacard/0001-meson.build-set-hardcoded-version-string.patch 
> b/meta-networking/recipes-support/spice/libcacard/0001-meson.build-set-hardcoded-version-string.patch
> new file mode 100644
> index 000000000..b9d31c458
> --- /dev/null
> +++ 
> b/meta-networking/recipes-support/spice/libcacard/0001-meson.build-set-hardcoded-version-string.patch
> @@ -0,0 +1,34 @@
> +From dbfc08b9dc879e21bfacbd153948d21db36d50cd Mon Sep 17 00:00:00 
> 2001
> +From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> +Date: Thu, 23 Nov 2023 13:20:40 +0100
> +Subject: [PATCH] meson.build: set hardcoded version string
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> +
> +This fixes version string in the pkgconfig file and thus unbreaks 
> spice build
> +| spice-common| Run-time dependency libcacard found: NO
> +|
> +| ../git/subprojects/spice-common/meson.build:144:16: ERROR: 
> Dependency lookup for libcacard with method 'pkgconfig' failed: 
> Invalid version, need 'libcacard' ['>= 2.5.1'] found 'UNKNOWN'.
> +|
> +| A full log can be found at 
> /home/flk/poky/build/tmp/work/corei7-64-poky-linux/spice/0.15.2/build/meson-logs/meson-log.txt
> +| ERROR: meson failed
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +---
> + meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 9cfe248..00745e5 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -1,5 +1,5 @@
> + project('libcacard', 'c', 'cpp',
> +-  version: run_command('build-aux/git-version-gen', 
> '@0@/.tarball-version'.format(meson.source_root()), check: 
> true).stdout().strip(),
> ++  version: '2.8.1',
> +   license: 'LGPLv2.1',
> +   default_options: ['warning_level=2'],
> + )
> +--
> +2.42.0
> +
> diff --git a/meta-networking/recipes-support/spice/libcacard_2.8.1.bb 
> b/meta-networking/recipes-support/spice/libcacard_2.8.1.bb
> index c81322e68..44cccba9d 100644
> --- a/meta-networking/recipes-support/spice/libcacard_2.8.1.bb
> +++ b/meta-networking/recipes-support/spice/libcacard_2.8.1.bb
> @@ -6,7 +6,10 @@ DEPENDS = "glib-2.0 pcsc-lite nss"
> 
>  SRCREV = "7b07684ea6698d4885ff2062350ad8798a04de42"
> 
> -SRC_URI = 
> "git://gitlab.freedesktop.org/spice/libcacard.git;protocol=https;branch=master"
> +SRC_URI = " \
> +	git://gitlab.freedesktop.org/spice/libcacard.git;protocol=https;branch=master 
> \
> +	file://0001-meson.build-set-hardcoded-version-string.patch 
> <file://0001-meson.build-set-hardcoded-version-string.patch/> \
> +"
> 
>  S = "${WORKDIR}/git"
> 
> --
> 2.42.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107022): 
> <https://lists.openembedded.org/g/openembedded-devel/message/107022>
> Mute This Topic: <https://lists.openembedded.org/mt/102765737/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-2g6jDcj+W/CYwO8VF5U9
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Adding&nbsp;git-native to DEPENDS also fixes this issue. This should be the preferred way to fix I guess?</div></div><div id="geary-quote" dir="auto"><br>On Thu, Nov 23 2023 at 01:33:02 PM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 ...n.build-set-hardcoded-version-string.patch | 34 +++++++++++++++++++
 .../recipes-support/spice/libcacard_2.8.1.bb  |  5 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/spice/libcacard/0001-meson.build-set-hardcoded-version-string.patch

diff --git a/meta-networking/recipes-support/spice/libcacard/0001-meson.build-set-hardcoded-version-string.patch b/meta-networking/recipes-support/spice/libcacard/0001-meson.build-set-hardcoded-version-string.patch
new file mode 100644
index 000000000..b9d31c458
--- /dev/null
+++ b/meta-networking/recipes-support/spice/libcacard/0001-meson.build-set-hardcoded-version-string.patch
@@ -0,0 +1,34 @@
+From dbfc08b9dc879e21bfacbd153948d21db36d50cd Mon Sep 17 00:00:00 2001
+From: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
+Date: Thu, 23 Nov 2023 13:20:40 +0100
+Subject: [PATCH] meson.build: set hardcoded version string
+
+Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
+
+This fixes version string in the pkgconfig file and thus unbreaks spice build
+| spice-common| Run-time dependency libcacard found: NO
+| 
+| ../git/subprojects/spice-common/meson.build:144:16: ERROR: Dependency lookup for libcacard with method 'pkgconfig' failed: Invalid version, need 'libcacard' ['&gt;= 2.5.1'] found 'UNKNOWN'.
+| 
+| A full log can be found at /home/flk/poky/build/tmp/work/corei7-64-poky-linux/spice/0.15.2/build/meson-logs/meson-log.txt
+| ERROR: meson failed
+
+Upstream-Status: Inappropriate [oe-specific]
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 9cfe248..00745e5 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1,5 +1,5 @@
+ project('libcacard', 'c', 'cpp',
+-  version: run_command('build-aux/git-version-gen', '@0@/.tarball-version'.format(meson.source_root()), check: true).stdout().strip(),
++  version: '2.8.1',
+   license: 'LGPLv2.1',
+   default_options: ['warning_level=2'],
+ )
+-- 
+2.42.0
+
diff --git a/meta-networking/recipes-support/spice/libcacard_2.8.1.bb b/meta-networking/recipes-support/spice/libcacard_2.8.1.bb
index c81322e68..44cccba9d 100644
--- a/meta-networking/recipes-support/spice/libcacard_2.8.1.bb
+++ b/meta-networking/recipes-support/spice/libcacard_2.8.1.bb
@@ -6,7 +6,10 @@ DEPENDS = "glib-2.0 pcsc-lite nss"
 
 SRCREV = "7b07684ea6698d4885ff2062350ad8798a04de42"
 
-SRC_URI = "git://gitlab.freedesktop.org/spice/libcacard.git;protocol=https;branch=master"
+SRC_URI = " \
+	git://gitlab.freedesktop.org/spice/libcacard.git;protocol=https;branch=master \
+	<a href="file://0001-meson.build-set-hardcoded-version-string.patch">file://0001-meson.build-set-hardcoded-version-string.patch</a> \
+"
 
 S = "${WORKDIR}/git"
 
<div>-- 
</div>2.42.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#107022): <a href="https://lists.openembedded.org/g/openembedded-devel/message/107022">https://lists.openembedded.org/g/openembedded-devel/message/107022</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/102765737/3618223">https://lists.openembedded.org/mt/102765737/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-2g6jDcj+W/CYwO8VF5U9--


