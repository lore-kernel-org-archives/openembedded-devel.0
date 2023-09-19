Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D12CD342B
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 00:24:50 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.7314.1695083088048701411
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Sep 2023 17:24:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout09.t-online.de (Postfix) with SMTP id 972AA17EFA
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 02:24:46 +0200 (CEST)
Received: from [192.168.178.62] ([79.219.233.37]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qiOXl-0ca4Rc0; Tue, 19 Sep 2023 02:24:45 +0200
Date: Tue, 19 Sep 2023 02:24:48 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH] tracker: add missing Upstream-Status
To: openembedded-devel@lists.openembedded.org
Message-Id: <CHI71S.2T4BEV906JGW1@t-online.de>
In-Reply-To: <178624CFD52A1610.9165@lists.openembedded.org>
References: <178624CFD52A1610.9165@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-f8Be4m5zLh0LPrXGsRxd"
X-TOI-EXPURGATEID: 150726::1695083085-0BFFCC62-348B3627/0/0 CLEAN NORMAL
X-TOI-MSGID: c0dbe6c0-89b9-4a70-aebf-8ebb42a1ce36
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 00:24:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104954

--=-f8Be4m5zLh0LPrXGsRxd
Content-Type: text/plain; charset=us-ascii; format=flowed

Ignore this one. I need to update meta-openembedded first and will then 
send a proper patch

On Tue, Sep 19 2023 at 02:19:41 AM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> -remove unused patch
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../tracker/0001-fix-reproducibility.patch    |  2 ++
>  .../0001-meson-Do-not-define-TOP_SRCDIR.patch | 24 
> -------------------
>  2 files changed, 2 insertions(+), 24 deletions(-)
>  delete mode 100644 
> meta-gnome/recipes-gnome/tracker/tracker/0001-meson-Do-not-define-TOP_SRCDIR.patch
> 
> diff --git 
> a/meta-gnome/recipes-gnome/tracker/tracker/0001-fix-reproducibility.patch 
> b/meta-gnome/recipes-gnome/tracker/tracker/0001-fix-reproducibility.patch
> index 30a58923c..4a11f8314 100644
> --- 
> a/meta-gnome/recipes-gnome/tracker/tracker/0001-fix-reproducibility.patch
> +++ 
> b/meta-gnome/recipes-gnome/tracker/tracker/0001-fix-reproducibility.patch
> @@ -8,6 +8,8 @@ binaries at various places. Avoid this to improve 
> binary reproducibility.
> 
>  todo: Some of these paths may need to be adjusted to make the test 
> environment work
> 
> +Upstream-Status: Inappropriate [oe-specific]
> +
>  Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
>  ---
>   meson.build                       | 6 +++---
> diff --git 
> a/meta-gnome/recipes-gnome/tracker/tracker/0001-meson-Do-not-define-TOP_SRCDIR.patch 
> b/meta-gnome/recipes-gnome/tracker/tracker/0001-meson-Do-not-define-TOP_SRCDIR.patch
> deleted file mode 100644
> index 5c6ab71a9..000000000
> --- 
> a/meta-gnome/recipes-gnome/tracker/tracker/0001-meson-Do-not-define-TOP_SRCDIR.patch
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -From 3e262192ffebf5d6fec92d5b7ba08348a94df1ae Mon Sep 17 00:00:00 
> 2001
> -From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
> -Date: Thu, 25 May 2023 20:54:47 -0700
> -Subject: [PATCH] meson: Do not define TOP_SRCDIR
> -
> -This is passed from build env
> -
> -Upstream-Status: Inappropriate [Cross compile specific]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>>
> ----
> - meson.build | 1 -
> - 1 file changed, 1 deletion(-)
> -
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -353,7 +353,7 @@ subdir('utils')
> -
> - test_c_args = tracker_c_args + [
> -     '-DTOP_BUILDDIR="@0@"'.format(build_root),
> --    '-DTOP_SRCDIR="@0@"'.format(source_root),
> -+    '-DTOP_SRCDIR="@0@"'.format('/usr/src/debug/tracker'),
> - ]
> -
> - tracker_uninstalled_cli_dir = join_paths(meson.current_build_dir(), 
> 'src', 'tracker')
> --
> 2.42.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104953): 
> <https://lists.openembedded.org/g/openembedded-devel/message/104953>
> Mute This Topic: <https://lists.openembedded.org/mt/101447003/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-f8Be4m5zLh0LPrXGsRxd
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Ignore this one. I need to update meta-openembedded first and will then send a proper patch</div></div><div id="geary-quote" dir="auto"><br>On Tue, Sep 19 2023 at 02:19:41 AM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">-remove unused patch

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../tracker/0001-fix-reproducibility.patch    |  2 ++
 .../0001-meson-Do-not-define-TOP_SRCDIR.patch | 24 -------------------
 2 files changed, 2 insertions(+), 24 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/tracker/tracker/0001-meson-Do-not-define-TOP_SRCDIR.patch

diff --git a/meta-gnome/recipes-gnome/tracker/tracker/0001-fix-reproducibility.patch b/meta-gnome/recipes-gnome/tracker/tracker/0001-fix-reproducibility.patch
index 30a58923c..4a11f8314 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker/0001-fix-reproducibility.patch
+++ b/meta-gnome/recipes-gnome/tracker/tracker/0001-fix-reproducibility.patch
@@ -8,6 +8,8 @@ binaries at various places. Avoid this to improve binary reproducibility.
 
 todo: Some of these paths may need to be adjusted to make the test environment work
 
+Upstream-Status: Inappropriate [oe-specific]
+
 Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
 ---
  meson.build                       | 6 +++---
diff --git a/meta-gnome/recipes-gnome/tracker/tracker/0001-meson-Do-not-define-TOP_SRCDIR.patch b/meta-gnome/recipes-gnome/tracker/tracker/0001-meson-Do-not-define-TOP_SRCDIR.patch
deleted file mode 100644
index 5c6ab71a9..000000000
--- a/meta-gnome/recipes-gnome/tracker/tracker/0001-meson-Do-not-define-TOP_SRCDIR.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 3e262192ffebf5d6fec92d5b7ba08348a94df1ae Mon Sep 17 00:00:00 2001
-From: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
-Date: Thu, 25 May 2023 20:54:47 -0700
-Subject: [PATCH] meson: Do not define TOP_SRCDIR
-
-This is passed from build env
-
-Upstream-Status: Inappropriate [Cross compile specific]
-Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
----
- meson.build | 1 -
- 1 file changed, 1 deletion(-)
-
---- a/meson.build
-+++ b/meson.build
-@@ -353,7 +353,7 @@ subdir('utils')
- 
- test_c_args = tracker_c_args + [
-     '-DTOP_BUILDDIR="@0@"'.format(build_root),
--    '-DTOP_SRCDIR="@0@"'.format(source_root),
-+    '-DTOP_SRCDIR="@0@"'.format('/usr/src/debug/tracker'),
- ]
- 
- tracker_uninstalled_cli_dir = join_paths(meson.current_build_dir(), 'src', 'tracker')
<div>-- 
</div>2.42.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#104953): <a href="https://lists.openembedded.org/g/openembedded-devel/message/104953">https://lists.openembedded.org/g/openembedded-devel/message/104953</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/101447003/3618223">https://lists.openembedded.org/mt/101447003/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-f8Be4m5zLh0LPrXGsRxd--


