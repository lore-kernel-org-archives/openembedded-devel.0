Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE83C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 09:56:18 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.46318.1743069369033950370
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Mar 2025 02:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout08.t-online.de (Postfix) with SMTP id 6CC069AF;
	Thu, 27 Mar 2025 10:56:06 +0100 (CET)
Received: from [192.168.178.20] ([84.154.173.104]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1txjy2-1Cy1gG0; Thu, 27 Mar 2025 10:56:06 +0100
Date: Thu, 27 Mar 2025 10:56:42 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCHv2] gimp: update 2.10.38 - 3.0.2
To: alex.kanavin@gmail.com
Cc: "Alexander Kanavin via lists.openembedded.org"
	<alex.kanavin=gmail.com@lists.openembedded.org>,
	openembedded-devel@lists.openembedded.org
Message-Id: <IY0STS.0LHRDIA5XZPF@t-online.de>
In-Reply-To: <CANNYZj-dzSajh6AF6sV8Au1uDosh9A+WgJiQ18bLee=uYfDNjw@mail.gmail.com>
References: <20250327015621.77527-1-f_l_k@t-online.de>
	<CANNYZj-dzSajh6AF6sV8Au1uDosh9A+WgJiQ18bLee=uYfDNjw@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-N/eCRctIHpjCP7Gp8D86"
X-TOI-EXPURGATEID: 150726::1743069366-AE7FBACD-CF191AE3/10/3626336762 SUSPECT URL
X-TOI-MSGID: e74440ab-e382-4768-97c0-4cc4f4c1f1d3
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Mar 2025 09:56:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116319

--=-N/eCRctIHpjCP7Gp8D86
Content-Type: text/plain; charset=us-ascii; format=flowed

The complete changelog would be about 3500 lines and I thought that 
would be too much
<https://gitlab.gnome.org/GNOME/gimp/-/blob/GIMP_3_0_0/NEWS?ref_type=tags>

Should it be added to the commit?

On Thu, Mar 27 2025 at 10:49:19 +01:00:00, Alexander Kanavin via 
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org> 
wrote:
> I appreciate the effort to provide changelogs, but the update is from
> gimp 2.x, to gimp 3.x, representing many years of feature development.
> I'd suggest that either the provided changelog reflects that, or it is
> not included at all (gimp users usually know the deal with 2.x vs
> 3.x).
> 
> Alex
> 
> On Thu, 27 Mar 2025 at 02:55, Markus Volk via lists.openembedded.org
> <f_l_k=t-online.de@lists.openembedded.org 
> <mailto:f_l_k=t-online.de@lists.openembedded.org>> wrote:
>> 
>>                     ------------------------------
>>                     GNU Image Manipulation Program
>>                           Development Branch
>>                     ------------------------------
>> 
>>  Overview of Changes from GIMP 3.0.0 to GIMP 3.0.2
>>  =================================================
>> 
>>  This is a bug-fix only release.
>> 
>>  Core:
>> 
>>    - Mark some strings translatable.
>>    - Fix crash when choosing a brush in grid view.
>>    - Windows: temporary revert of some Input Device handling code 
>> which
>>      was breaking pressure sensitivity for some graphics tablets 
>> (though
>>      this revert may make issues with the eraser tip).
>>    - Fix crash when choosing a non-existing font in text tool 
>> options.
>> 
>>  Tools:
>> 
>>    - Reorder Line Art Detection options per design decision.
>> 
>>  Graphical User Interface:
>> 
>>    - Keep headerbar color consistent when out of focus.
>>    - Histogram uses the luminance value of the foreground color as a
>>      threshold to lighten or darken the border color for contrast 
>> with
>>      the histogram itself.
>>    - Improve separation between panels in dark theme.
>>    - Add default response for GimpQueryBox dialogues.
>>    - Spacing between toolbox widgets improved.
>>    - GimpSpinScale slider colors inverted.
>>    - New icons: "gimp-toggle-on" and "gimp-toggle-off" and using 
>> them in
>>      the Search Action's list as icons for toggle actions.
>> 
>>  Plug-ins:
>> 
>>    - Python Console uses the luminance of the background color for 
>> error
>>      text.
>>    - Metadata Editor: fix buffer overflow.
>>    - Gradient Flare: fix crash when setting the size to 0.
>>    - Screenshot: X11 implementation is bypassed (in favor of portals)
>>      when running on XWayland.
>> 
>>  Build:
>> 
>>    - Various packaging fixes and cleanup.
>>    - The Windows installer now prompts (only in user installation) 
>> about
>>      deleting GIMP config files when uninstalling.
>>    - GEGL 0.4.58 is now our minimum requirement.
>>    - Windows installer: create Restore Point on system-wide install.
>> 
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   ...irst-line-of-compiler-version-string.patch |  30 ----
>>   ...f-load-fix-mismatching-variable-type.patch |  24 ----
>>   .../0001-gimp-cross-compile-fix-for-bz2.patch |  30 ++++
>>   ...1-gimptool-allow-default-CC-override.patch |  85 ------------
>>   ...dd-build-time-library-paths-to-LD_LI.patch |  34 -----
>>   ...001-metadata-shut-up-a-weird-warning.patch |  22 ---
>>   ...0002-meson.build-reproducibility-fix.patch |  56 ++++++++
>>   meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb  | 101 --------------
>>   meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb    | 130 
>> ++++++++++++++++++
>>   9 files changed, 216 insertions(+), 296 deletions(-)
>>   delete mode 100644 
>> meta-gnome/recipes-gimp/gimp/gimp/0001-configure-Keep-first-line-of-compiler-version-string.patch
>>   delete mode 100644 
>> meta-gnome/recipes-gimp/gimp/gimp/0001-file-tiff-load-fix-mismatching-variable-type.patch
>>   create mode 100644 
>> meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-compile-fix-for-bz2.patch
>>   delete mode 100644 
>> meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-default-CC-override.patch
>>   delete mode 100644 
>> meta-gnome/recipes-gimp/gimp/gimp/0001-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch
>>   delete mode 100644 
>> meta-gnome/recipes-gimp/gimp/gimp/0001-metadata-shut-up-a-weird-warning.patch
>>   create mode 100644 
>> meta-gnome/recipes-gimp/gimp/gimp/0002-meson.build-reproducibility-fix.patch
>>   delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
>>   create mode 100644 meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
>> 
>>  diff --git 
>> a/meta-gnome/recipes-gimp/gimp/gimp/0001-configure-Keep-first-line-of-compiler-version-string.patch 
>> b/meta-gnome/recipes-gimp/gimp/gimp/0001-configure-Keep-first-line-of-compiler-version-string.patch
>>  deleted file mode 100644
>>  index 618b4cc7a7..0000000000
>>  --- 
>> a/meta-gnome/recipes-gimp/gimp/gimp/0001-configure-Keep-first-line-of-compiler-version-string.patch
>>  +++ /dev/null
>>  @@ -1,30 +0,0 @@
>>  -From 5711ccfab40e304ced7f5be39a4083e3fcecff91 Mon Sep 17 00:00:00 
>> 2001
>>  -From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>>  -Date: Wed, 24 May 2023 22:22:41 -0700
>>  -Subject: [PATCH] configure: Keep first line of compiler version 
>> string
>>  -
>>  -Full output of cc -v may contain additional information which could
>>  -contain build path information, which is unnessasary
>>  -
>>  -Upstream-Status: Submitted 
>> [<https://gitlab.gnome.org/GNOME/gimp/-/merge_requests/926>]
>>  -Signed-off-by: Khem Raj <raj.khem@gmail.com 
>> <mailto:raj.khem@gmail.com>>
>>  ----
>>  - configure.ac | 2 +-
>>  - 1 file changed, 1 insertion(+), 1 deletion(-)
>>  -
>>  -diff --git a/configure.ac b/configure.ac
>>  -index c25415d..68707a0 100644
>>  ---- a/configure.ac
>>  -+++ b/configure.ac
>>  -@@ -599,7 +599,7 @@ fi
>>  - for CC_VERSION_OPT in $CC_VERSION_OPTS; do
>>  -   # We run $CC, and escape and format its output, in a single 
>> step,
>>  -   # since some shells expand escape sequences in "echo" arguments.
>>  --  CC_VERSION="`$CC $CC_VERSION_OPT 2>&1 | sed -e 
>> 's/\\\\/\\\\\\\\\\\\\\\\/g;s/^/\\\\t/;s/$/\\\\n/' | tr -d '\n'`"
>>  -+  CC_VERSION="`$CC $CC_VERSION_OPT 2>&1 | head -1 | sed -e 
>> 's/\\\\/\\\\\\\\\\\\\\\\/g;s/^/\\\\t/;s/$/\\\\n/' | tr -d '\n'`"
>>  -   if test $? -eq 0; then
>>  -     break
>>  -   fi
>>  ---
>>  -2.40.1
>>  -
>>  diff --git 
>> a/meta-gnome/recipes-gimp/gimp/gimp/0001-file-tiff-load-fix-mismatching-variable-type.patch 
>> b/meta-gnome/recipes-gimp/gimp/gimp/0001-file-tiff-load-fix-mismatching-variable-type.patch
>>  deleted file mode 100644
>>  index 13b3dda144..0000000000
>>  --- 
>> a/meta-gnome/recipes-gimp/gimp/gimp/0001-file-tiff-load-fix-mismatching-variable-type.patch
>>  +++ /dev/null
>>  @@ -1,24 +0,0 @@
>>  -From a2458f1528e5733574bb26ff5452b1329116e6db Mon Sep 17 00:00:00 
>> 2001
>>  -From: Simon Budig <simon@budig.de <mailto:simon@budig.de>>
>>  -Date: Sat, 20 May 2023 18:40:41 +0200
>>  -Subject: [PATCH] file-tiff-load: fix mismatching variable type
>>  -
>>  -Upstream-Status: Backport 
>> [<https://gitlab.gnome.org/GNOME/gimp/-/commit/a2458f1528e5733574bb26ff5452b1329116e6db>]
>>  -Signed-off-by: Khem Raj <raj.khem@gmai.com 
>> <mailto:raj.khem@gmai.com>>
>>  ----
>>  - plug-ins/file-tiff/file-tiff-load.c | 6 +++---
>>  - 1 file changed, 3 insertions(+), 3 deletions(-)
>>  -
>>  ---- a/plug-ins/file-tiff/file-tiff-load.c
>>  -+++ b/plug-ins/file-tiff/file-tiff-load.c
>>  -@@ -1301,8 +1301,8 @@ load_image (GFile        *file,
>>  -
>>  -       /* any resolution info in the file? */
>>  -       {
>>  --        gfloat   xres = 72.0;
>>  --        gfloat   yres = 72.0;
>>  -+        gdouble   xres = 72.0;
>>  -+        gdouble   yres = 72.0;
>>  -         gushort  read_unit;
>>  -         GimpUnit unit = GIMP_UNIT_PIXEL; /* invalid unit */
>>  -
>>  diff --git 
>> a/meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-compile-fix-for-bz2.patch 
>> b/meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-compile-fix-for-bz2.patch
>>  new file mode 100644
>>  index 0000000000..721225c8b3
>>  --- /dev/null
>>  +++ 
>> b/meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-compile-fix-for-bz2.patch
>>  @@ -0,0 +1,30 @@
>>  +From a7e40e19d17404cf5ec4135fc1becd5a90f5e1e1 Mon Sep 17 00:00:00 
>> 2001
>>  +From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
>>  +Date: Wed, 25 Dec 2024 07:27:04 +0100
>>  +Subject: [PATCH] gimp: cross-compile fix for bz2
>>  +
>>  +autotools bzip2 build does not create pkgconfig files so looking 
>> for the dependency fails.
>>  +
>>  +Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
>>  +
>>  +Upstream-Status: Inappropriate [can probably be removed once bzip2 
>> is built with meson or cmake]
>>  +---
>>  + meson.build | 2 +-
>>  + 1 file changed, 1 insertion(+), 1 deletion(-)
>>  +
>>  +diff --git a/meson.build b/meson.build
>>  +index 4e48f8c64c..d5dce47015 100644
>>  +--- a/meson.build
>>  ++++ b/meson.build
>>  +@@ -765,7 +765,7 @@ zlib = dependency('zlib')
>>  + MIMEtypes += 'image/x-psp'
>>  +
>>  + # Compiler-provided headers can't be found in crossroads 
>> environment
>>  +-if not meson.is_cross_build()
>>  ++if true
>>  +   bz2 = cc.find_library('bz2')
>>  + else
>>  +   bz2 = dependency('bzip2')
>>  +--
>>  +2.47.1
>>  +
>>  diff --git 
>> a/meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-default-CC-override.patch 
>> b/meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-default-CC-override.patch
>>  deleted file mode 100644
>>  index b04a16cec7..0000000000
>>  --- 
>> a/meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-default-CC-override.patch
>>  +++ /dev/null
>>  @@ -1,85 +0,0 @@
>>  -From 7e5b986cb7797a6535fe2471b9a5fb7c00821f51 Mon Sep 17 00:00:00 
>> 2001
>>  -From: Yoann Congal <yoann.congal@smile.fr 
>> <mailto:yoann.congal@smile.fr>>
>>  -Date: Sun, 13 Oct 2024 01:00:10 +0200
>>  -Subject: [PATCH] gimptool: allow default CC override
>>  -
>>  -From: Yoann Congal <yoann.congal@smile.fr 
>> <mailto:yoann.congal@smile.fr>>
>>  -
>>  -In OE, CC contains sysroot path. Storing CC in binary then leads to
>>  -non-reproducibility.
>>  -
>>  -This commit add a new configure option "--with-default-cc='cmd'" 
>> for
>>  -force the CC stored in gimptool to a reproducible value.
>>  -
>>  -Upstream-Status: Inappropriate [does not apply on master (upstream 
>> has moved to meson)]
>>  -Signed-off-by: Yoann Congal <yoann.congal@smile.fr 
>> <mailto:yoann.congal@smile.fr>>
>>  ----
>>  - app-tools/Makefile.am |  2 +-
>>  - configure.ac          | 13 +++++++++++++
>>  - tools/Makefile.am     |  2 +-
>>  - tools/gimptool.c      |  2 +-
>>  - 4 files changed, 16 insertions(+), 3 deletions(-)
>>  -
>>  -diff --git a/app-tools/Makefile.am b/app-tools/Makefile.am
>>  -index a7cd4ce..81a3a00 100644
>>  ---- a/app-tools/Makefile.am
>>  -+++ b/app-tools/Makefile.am
>>  -@@ -67,7 +67,7 @@ AM_CPPFLAGS = \
>>  -       -DMANDIR=\""$(mandir)"\"                                \
>>  -       -DGIMPPLUGINDIR=\""$(gimpplugindir)"\"                  \
>>  -       -DGIMPDATADIR=\""$(gimpdatadir)"\"                      \
>>  --      -DCC=\""$(CC)"\"                                        \
>>  -+      -DDEFAULT_CC=\""@DEFAULT_CC@"\"                         \
>>  -       -DGIMPDIR=\""$(gimpdir)"\"                              \
>>  -       -DGIMP_PLUGIN_VERSION=\""$(GIMP_PLUGIN_VERSION)"\"      \
>>  -       -I$(top_srcdir)                                         \
>>  -diff --git a/configure.ac b/configure.ac
>>  -index a88b7cc..d90b6db 100644
>>  ---- a/configure.ac
>>  -+++ b/configure.ac
>>  -@@ -2457,6 +2457,19 @@ fi
>>  - AM_CONDITIONAL(DESKTOP_DATADIR, test "x$with_desktop_dir" != xno)
>>  - AC_SUBST(DESKTOP_DATADIR)
>>  -
>>  -+######################
>>  -+# Determine default CC
>>  -+######################
>>  -+
>>  -+AC_ARG_WITH(default-cc, [ --with-default-cc="cmd" default CC to 
>> print in gimptool (default=CC)])
>>  -+
>>  -+if test "x$with_default_cc" != x; then
>>  -+  DEFAULT_CC=$with_default_cc
>>  -+else
>>  -+  DEFAULT_CC=CC
>>  -+fi
>>  -+
>>  -+AC_SUBST(DEFAULT_CC)
>>  -
>>  - #####################
>>  - # Check for XML tools
>>  -diff --git a/tools/Makefile.am b/tools/Makefile.am
>>  -index 420b9b1..ccabde8 100644
>>  ---- a/tools/Makefile.am
>>  -+++ b/tools/Makefile.am
>>  -@@ -87,7 +87,7 @@ AM_CPPFLAGS = \
>>  -       -DMANDIR=\""$(mandir)"\"                                \
>>  -       -DGIMPPLUGINDIR=\""$(gimpplugindir)"\"                  \
>>  -       -DGIMPDATADIR=\""$(gimpdatadir)"\"                      \
>>  --      -DCC=\""$(CC)"\"                                        \
>>  -+      -DDEFAULT_CC=\""@DEFAULT_CC@"\"                         \
>>  -       -DGIMPDIR=\""$(gimpdir)"\"                              \
>>  -       -DGIMP_PLUGIN_VERSION=\""$(GIMP_PLUGIN_VERSION)"\"      \
>>  -       -I$(top_srcdir)                                         \
>>  -diff --git a/tools/gimptool.c b/tools/gimptool.c
>>  -index 21fc043..bbf3fa5 100644
>>  ---- a/tools/gimptool.c
>>  -+++ b/tools/gimptool.c
>>  -@@ -280,7 +280,7 @@ find_out_env_flags (void)
>>  -   else if (msvc_syntax)
>>  -     env_cc = "cl -MD";
>>  -   else
>>  --    env_cc = CC;
>>  -+    env_cc = DEFAULT_CC;
>>  -
>>  -   if (g_ascii_strncasecmp (env_cc, "cl", 2)    == 0 &&
>>  -       g_ascii_strncasecmp (env_cc, "clang", 5) != 0)
>>  diff --git 
>> a/meta-gnome/recipes-gimp/gimp/gimp/0001-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch 
>> b/meta-gnome/recipes-gimp/gimp/gimp/0001-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch
>>  deleted file mode 100644
>>  index cec0055284..0000000000
>>  --- 
>> a/meta-gnome/recipes-gimp/gimp/gimp/0001-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch
>>  +++ /dev/null
>>  @@ -1,34 +0,0 @@
>>  -From c720df90dfe3a3e92e34bfb36a04cc792064a501 Mon Sep 17 00:00:00 
>> 2001
>>  -From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>>  -Date: Wed, 24 May 2023 22:39:02 -0700
>>  -Subject: [PATCH] libtool: Do not add build time library paths to
>>  - LD_LIBRARY_PATH
>>  -
>>  -This does not serve much purpose on cross builds as it will add 
>> build
>>  -time paths which are only useful when trying to run these tools 
>> from
>>  -build area but when they are cross built this is not possible to 
>> run
>>  -them like this.
>>  -
>>  -Upstream-Status: Inappropriate [Cross-compile specific]
>>  -
>>  -Signed-off-by: Khem Raj <raj.khem@gmail.com 
>> <mailto:raj.khem@gmail.com>>
>>  ----
>>  - ltmain.sh | 2 +-
>>  - 1 file changed, 1 insertion(+), 1 deletion(-)
>>  -
>>  -diff --git a/ltmain.sh b/ltmain.sh
>>  -index 134902c..068d74a 100644
>>  ---- a/ltmain.sh
>>  -+++ b/ltmain.sh
>>  -@@ -5748,7 +5748,7 @@ func_exec_program ()
>>  -       if test yes = "$shlibpath_overrides_runpath" && test -n 
>> "$shlibpath_var" && test -n "$temp_rpath"; then
>>  -         $ECHO "\
>>  -     # Add our own library path to $shlibpath_var
>>  --    $shlibpath_var=\"$temp_rpath\$$shlibpath_var\"
>>  -+    $shlibpath_var=\"$shlibpath_var\"
>>  -
>>  -     # Some systems cannot cope with colon-terminated 
>> $shlibpath_var
>>  -     # The second colon is a workaround for a bug in BeOS R4 sed
>>  ---
>>  -2.40.1
>>  -
>>  diff --git 
>> a/meta-gnome/recipes-gimp/gimp/gimp/0001-metadata-shut-up-a-weird-warning.patch 
>> b/meta-gnome/recipes-gimp/gimp/gimp/0001-metadata-shut-up-a-weird-warning.patch
>>  deleted file mode 100644
>>  index 4f04ac8250..0000000000
>>  --- 
>> a/meta-gnome/recipes-gimp/gimp/gimp/0001-metadata-shut-up-a-weird-warning.patch
>>  +++ /dev/null
>>  @@ -1,22 +0,0 @@
>>  -From 51311f913d9f417d121f59b83d560c7b4b853d1c Mon Sep 17 00:00:00 
>> 2001
>>  -From: Simon Budig <simon@budig.de <mailto:simon@budig.de>>
>>  -Date: Sat, 20 May 2023 22:25:40 +0200
>>  -Subject: [PATCH] metadata: shut up a weird warning
>>  -
>>  -Upstream-Status: Backport 
>> [<https://gitlab.gnome.org/GNOME/gimp/-/commit/51311f913d9f417d121f59b83d560c7b4b853d1c>]
>>  -Signed-off-by: Khem Raj <raj.khem@gmail.com 
>> <mailto:raj.khem@gmail.com>>
>>  ----
>>  - plug-ins/metadata/metadata-editor.c | 2 +-
>>  - 1 file changed, 1 insertion(+), 1 deletion(-)
>>  -
>>  ---- a/plug-ins/metadata/metadata-editor.c
>>  -+++ b/plug-ins/metadata/metadata-editor.c
>>  -@@ -2140,7 +2140,7 @@ metadata_dialog_editor_set_metadata (GEx
>>  -                             }
>>  -                           else
>>  -                             {
>>  --                              if (! g_strv_contains (values, 
>> equiv_values[evi]))
>>  -+                              if (! g_strv_contains ((const gchar 
>> * const *) values, equiv_values[evi]))
>>  -                                 {
>>  -                                   gchar *tmpvalue;
>>  -
>>  diff --git 
>> a/meta-gnome/recipes-gimp/gimp/gimp/0002-meson.build-reproducibility-fix.patch 
>> b/meta-gnome/recipes-gimp/gimp/gimp/0002-meson.build-reproducibility-fix.patch
>>  new file mode 100644
>>  index 0000000000..532715d588
>>  --- /dev/null
>>  +++ 
>> b/meta-gnome/recipes-gimp/gimp/gimp/0002-meson.build-reproducibility-fix.patch
>>  @@ -0,0 +1,56 @@
>>  +From bf19c5687703769e406a8086036d4ed6421c33cb Mon Sep 17 00:00:00 
>> 2001
>>  +From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
>>  +Date: Mon, 13 Jan 2025 10:04:33 +0100
>>  +Subject: [PATCH] meson.build: reproducibility fix
>>  +
>>  +Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
>>  +
>>  +Upstream-Status: Inappropriate [oe-specific]
>>  +---
>>  + meson.build | 28 ++++++++++++++--------------
>>  + 1 file changed, 14 insertions(+), 14 deletions(-)
>>  +
>>  +diff --git a/meson.build b/meson.build
>>  +index 97cd621780..e47180db87 100644
>>  +--- a/meson.build
>>  ++++ b/meson.build
>>  +@@ -1599,23 +1599,23 @@ conf.set('HAVE_FUNC_ATTRIBUTE_DESTRUCTOR',
>>  + conf.set_quoted('CC',             cc.get_id())
>>  +
>>  + cc_version=''
>>  +-if cc.get_id() == 'gcc' or cc.get_id() == 'clang'
>>  +-  cc_cmd = run_command(cc, '-v', check: false)
>>  ++#if cc.get_id() == 'gcc' or cc.get_id() == 'clang'
>>  ++#  cc_cmd = run_command(cc, '-v', check: false)
>>  +   # Note: the call might actually fail when using ccache.
>>  +   # See: <https://github.com/mesonbuild/meson/issues/6174>
>>  +-  if cc_cmd.returncode() == 0
>>  +-    cc_version = cc_cmd.stdout() + cc_cmd.stderr()
>>  +-  endif
>>  +-else
>>  ++#  if cc_cmd.returncode() == 0
>>  ++#    cc_version = cc_cmd.stdout() + cc_cmd.stderr()
>>  ++#  endif
>>  ++#else
>>  +   # Various compilers have various options. Try most common ones. 
>> This
>>  +   # list of options comes from autotools checks.
>>  +-  foreach arg : [ '--version', '-v', '-V', '-qversion' ]
>>  +-    cc_cmd = run_command(cc, arg, check: false)
>>  +-    if cc_cmd.returncode() == 0
>>  +-      cc_version = cc_cmd.stdout()
>>  +-    endif
>>  +-  endforeach
>>  +-endif
>>  ++#  foreach arg : [ '--version', '-v', '-V', '-qversion' ]
>>  ++#    cc_cmd = run_command(cc, arg, check: false)
>>  ++#    if cc_cmd.returncode() == 0
>>  ++#      cc_version = cc_cmd.stdout()
>>  ++#    endif
>>  ++#  endforeach
>>  ++#endif
>>  + if cc_version == ''
>>  +   # We didn't manage to get a meaningful verbose version from the
>>  +   # compiler. Just save its name and version.
>>  +--
>>  +2.47.1
>>  +
>>  diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb 
>> b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
>>  deleted file mode 100644
>>  index 0272e05e96..0000000000
>>  --- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
>>  +++ /dev/null
>>  @@ -1,101 +0,0 @@
>>  -SUMMARY = "The GIMP is the GNU Image Manipulation Program"
>>  -HOMEPAGE = "http://www.gimp.org <http://www.gimp.org/>"
>>  -SECTION = "x11/graphics"
>>  -LICENSE = "GPL-3.0-only"
>>  -LIC_FILES_CHKSUM = 
>> "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e" 
>> <file://copying;md5=c678957b0c8e964aa6c70fd77641a71e/>
>>  -
>>  -DEPENDS = " \
>>  -    alsa-lib \
>>  -    atk \
>>  -    cairo \
>>  -    fontconfig \
>>  -    freetype \
>>  -    gdk-pixbuf-native \
>>  -    intltool-native \
>>  -    libxslt-native \
>>  -    gegl-native \
>>  -    dbus-glib \
>>  -    gtk+ \
>>  -    babl \
>>  -    gegl \
>>  -    libmypaint \
>>  -    mypaint-brushes-1.0 \
>>  -    gexiv2 \
>>  -    jpeg \
>>  -    libmng \
>>  -    libpng \
>>  -    libexif \
>>  -    tiff \
>>  -    lcms \
>>  -    poppler \
>>  -    poppler-data \
>>  -    jasper \
>>  -    bzip2 \
>>  -    libgudev \
>>  -    libmng \
>>  -    ${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'x11', 'libxmu 
>> libxpm', '', d)} \
>>  -"
>>  -DEPENDS:append:libc-musl = " libexecinfo"
>>  -
>>  -GNOMEBASEBUILDCLASS = "autotools"
>>  -inherit features_check gnomebase gtk-icon-cache gtk-doc mime-xdg
>>  -
>>  -REQUIRED_DISTRO_FEATURES = "x11"
>>  -
>>  -SHPV = "${@gnome_verdir("${PV}")}"
>>  -
>>  -SRC_URI = 
>> "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2 
>> <https://download.gimp.org/pub/$%7BBPN%7D/v$%7BSHPV%7D/$%7BBP%7D.tar.bz2> 
>> \
>>  -           
>> file://0001-configure-Keep-first-line-of-compiler-version-string.patch 
>> <file://0001-configure-keep-first-line-of-compiler-version-string.patch/> 
>> \
>>  -           
>> file://0001-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch 
>> <file://0001-libtool-do-not-add-build-time-library-paths-to-ld_li.patch/> 
>> \
>>  -           
>> file://0001-file-tiff-load-fix-mismatching-variable-type.patch 
>> <file://0001-file-tiff-load-fix-mismatching-variable-type.patch/> \
>>  -           file://0001-metadata-shut-up-a-weird-warning.patch 
>> <file://0001-metadata-shut-up-a-weird-warning.patch/> \
>>  -           file://0001-gimptool-allow-default-CC-override.patch 
>> <file://0001-gimptool-allow-default-cc-override.patch/> \
>>  -           "
>>  -SRC_URI[sha256sum] = 
>> "50a845eec11c8831fe8661707950f5b8446e35f30edfb9acf98f85c1133f856e"
>>  -
>>  -EXTRA_OECONF = "--disable-python \
>>  -                --without-webkit \
>>  -                --disable-check-update \
>>  -                --without-wmf"
>>  -
>>  -EXTRA_OECONF += "${@oe.utils.conditional 
>> <mailto:${@oe.utils.conditional>('SITEINFO_BITS', '32', ' 
>> --disable-vector-icons', '', d)}"
>>  -
>>  -do_configure:append() {
>>  -    find ${B} -name Makefile | xargs sed -i 
>> s:'-I$(includedir)':'-I.':g
>>  -    find ${B} -name Makefile | xargs sed -i 
>> s:'-I/usr/include':'-I${STAGING_INCDIR}':g
>>  -}
>>  -
>>  -do_compile:prepend() {
>>  -    # Let native babl/gegl find their plugins
>>  -    export BABL_PATH=`find ${STAGING_LIBDIR_NATIVE} -maxdepth 1 
>> -name 'babl-*'`
>>  -    export GEGL_PATH=`find ${STAGING_LIBDIR_NATIVE} -maxdepth 1 
>> -name 'gegl-*'`
>>  -}
>>  -
>>  -FILES:${PN}  += "${datadir}/metainfo"
>>  -
>>  -RDEPENDS:${PN} += "mypaint-brushes-1.0"
>>  -
>>  -
>>  -# gimptool
>>  -
>>  -# gimptool needs a CC definition, use current CC without sysroot
>>  -python __anonymous() {
>>  -    import shlex
>>  -    CC_WITHOUT_SYSROOT = shlex.join(filter(lambda x: not 
>> x.startswith("--sysroot="), shlex.split(d.getVar("CC"))))
>>  -    d.setVar("CC_WITHOUT_SYSROOT", CC_WITHOUT_SYSROOT)
>>  -}
>>  -EXTRA_OECONF += "--with-default-cc='${CC_WITHOUT_SYSROOT}'"
>>  -
>>  -# Split gimptool in its own package
>>  -PACKAGE_BEFORE_PN += "${PN}-gimptool"
>>  -FILES:${PN}-gimptool += "${bindir}/gimptool-2.0"
>>  -
>>  -# gimptool depends on gimp .pc file being installed and tools to 
>> build the plugin.
>>  -RDEPENDS:${PN}-gimptool += "${PN}-dev 
>> packagegroup-core-buildessential"
>>  -INSANE_SKIP:${PN}-gimptool += "dev-deps"
>>  -
>>  -
>>  -CVE_STATUS[CVE-2007-3741] = "not-applicable-platform: This only 
>> applies for Mandriva Linux"
>>  -CVE_STATUS[CVE-2009-0581] = "cpe-incorrect: The current version 
>> (2.10.38) is not affected."
>>  -CVE_STATUS[CVE-2009-0723] = "cpe-incorrect: The current version 
>> (2.10.38) is not affected."
>>  -CVE_STATUS[CVE-2009-0733] = "cpe-incorrect: The current version 
>> (2.10.38) is not affected."
>>  diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb 
>> b/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
>>  new file mode 100644
>>  index 0000000000..8e44f2ca23
>>  --- /dev/null
>>  +++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
>>  @@ -0,0 +1,130 @@
>>  +SUMMARY = "The GIMP is the GNU Image Manipulation Program"
>>  +HOMEPAGE = "http://www.gimp.org <http://www.gimp.org/>"
>>  +SECTION = "graphics"
>>  +LICENSE = "GPL-3.0-only"
>>  +LIC_FILES_CHKSUM = 
>> "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e" 
>> <file://copying;md5=c678957b0c8e964aa6c70fd77641a71e/>
>>  +
>>  +DEPENDS = " \
>>  +    appstream-glib \
>>  +    atk \
>>  +    babl \
>>  +    bzip2 \
>>  +    bison-native \
>>  +    cairo \
>>  +    fontconfig \
>>  +    freetype \
>>  +    gdk-pixbuf-native \
>>  +    gegl \
>>  +    gexiv2 \
>>  +    glib-2.0 \
>>  +    glib-2.0-native \
>>  +    gtk+3 \
>>  +    harfbuzz \
>>  +    iso-codes \
>>  +    jpeg \
>>  +    json-glib \
>>  +    lcms \
>>  +    libarchive \
>>  +    libexif \
>>  +    libmypaint \
>>  +    libpng \
>>  +    librsvg \
>>  +    librsvg-native \
>>  +    libxmu \
>>  +    libxslt-native \
>>  +    mypaint-brushes-1.0 \
>>  +    pango \
>>  +    poppler \
>>  +    poppler-data \
>>  +    python3-pygobject-native \
>>  +    tiff \
>>  +    xz \
>>  +    zlib \
>>  +"
>>  +
>>  +DEPENDS:append:libc-musl = " libexecinfo"
>>  +
>>  +inherit meson gtk-icon-cache mime-xdg pkgconfig gettext 
>> gobject-introspection vala
>>  +
>>  +GIR_MESON_OPTION = 'can-crosscompile-gir'
>>  +VALA_MESON_OPTION = "vala"
>>  +VALA_MESON_ENABLE_FLAG = "enabled"
>>  +VALA_MESON_DISABLE_FLAG = "disabled"
>>  +GIDOCGEN_MESON_OPTION = "gi-docgen"
>>  +GIDOCGEN_MESON_ENABLE_FLAG = "enabled"
>>  +GIDOCGEN_MESON_DISABLE_FLAG = "disabled"
>>  +
>>  +SRC_URI = 
>> "https://download.gimp.org/gimp/v${@oe.utils.trim_version('${PV 
>> <https://download.gimp.org/gimp/v$%7B@oe.utils.trim_version('$%7BPV>}', 
>> 2)}/gimp-${PV}.tar.xz"
>>  +SRC_URI += "file://0001-gimp-cross-compile-fix-for-bz2.patch" 
>> <file://0001-gimp-cross-compile-fix-for-bz2.patch/>
>>  +SRC_URI += "file://0002-meson.build-reproducibility-fix.patch" 
>> <file://0002-meson.build-reproducibility-fix.patch/>
>>  +SRC_URI[sha256sum] = 
>> "546ddc30cb2d0e79123c7fcb4d78211e1ee7a6aace91a6a0ad8cbcbf6ea571a2"
>>  +
>>  +PACKAGECONFIG[aa] = "-Daa=enabled,-Daa=disabled,aalib"
>>  +PACKAGECONFIG[alsa] = "-Dalsa=enabled,-Dalsa=disabled,alsa-lib"
>>  +PACKAGECONFIG[appdata-test] = 
>> "-Dappdata-test=enabled,-Dappdata-test=disabled,appstream-glib-native"
>>  +PACKAGECONFIG[cairo-pdf] = 
>> "-Dcairo-pdf=enabled,-Dcairo-pdf=disabled"
>>  +PACKAGECONFIG[check-update] = 
>> "-Dcheck-update=yes,-Dcheck-update=no"
>>  +PACKAGECONFIG[ghostscript] = 
>> "-Dghostscript=enabled,-Dghostscript=disabled,ghostscript,ghostscript"
>>  +PACKAGECONFIG[gudev] = "-Dgudev=enabled,-Dgudev=disabled,libgudev"
>>  +PACKAGECONFIG[heif] = "-Dheif=enabled,-Dheif=disabled,libheif"
>>  +PACKAGECONFIG[javascript] = 
>> "-Djavascript=enabled,-Djavascript=disabled,,gjs"
>>  +PACKAGECONFIG[jpeg2000] = 
>> "-Djpeg2000=enabled,-Djpeg2000=disabled,jasper"
>>  +PACKAGECONFIG[jpeg-xl] = 
>> "-Djpeg-xl=enabled,-Djpeg-xl=disabled,libjxl"
>>  +PACKAGECONFIG[libunwind] = 
>> "-Dlibunwind=true,-Dlibunwind=false,libunwind"
>>  +PACKAGECONFIG[libbacktrace] = 
>> "-Dlibbacktrace=true,-Dlibbacktrace=false,libbacktrace"
>>  +PACKAGECONFIG[lua] = "-Dlua=true,-Dlua=false,,luajit lua-lgi"
>>  +PACKAGECONFIG[mng] = "-Dmng=enabled,-Dmng=disabled,libmng"
>>  +PACKAGECONFIG[openmp] = 
>> "-Dopenmp=enabled,-Dopenmp=disabled,gcc-runtime"
>>  +PACKAGECONFIG[vector-icons] = 
>> "-Dvector-icons=true,-Dvector-icons=false,librsvg shared-mime-info"
>>  +PACKAGECONFIG[webp] = "-Dwebp=enabled,-Dwebp=disabled,libwebp"
>>  +PACKAGECONFIG[xcursor] = 
>> "-Dxcursor=enabled,-Dxcursor=disabled,libxcursor"
>>  +PACKAGECONFIG[x11] = "-Dxpm=enabled,-Dxpm=disabled,libxpm libxext 
>> libxfixes"
>>  +
>>  +PACKAGECONFIG ?= " \
>>  +    alsa \
>>  +    cairo-pdf \
>>  +    ghostscript \
>>  +    gudev \
>>  +    javascript \
>>  +    jpeg2000 \
>>  +    jpeg-xl \
>>  +    lua \
>>  +    mng \
>>  +    vector-icons \
>>  +    webp \
>>  +    ${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>('LICENSE_FLAGS_ACCEPTED', 
>> 'commercial', 'heif', '', d)} \
>>  +    ${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'x11', 'x11 
>> xcursor', '', d)} \
>>  +"
>>  +
>>  +PACKAGECONFIG:remove:riscv32 = "lua"
>>  +PACKAGECONFIG:remove:riscv64 = "lua"
>>  +PACKAGECONFIG:remove:powerpc64 = "lua"
>>  +PACKAGECONFIG:remove:powerpc64le = "lua"
>>  +
>>  +EXTRA_OEMESON += " \
>>  +    -Dshmem-type=posix \
>>  +    -Dlinux-input=enabled \
>>  +    --buildtype release \
>>  +    --cross-file=${WORKDIR}/meson-${PN}.cross \
>>  +"
>>  +
>>  +do_write_config:append() {
>>  +    cat >${WORKDIR}/meson-${PN}.cross <<EOF
>>  +[binaries]
>>  +gjs = '${bindir}/gjs'
>>  +luajit = '${bindir}/luajit'
>>  +EOF
>>  +}
>>  +
>>  +do_configure:append () {
>>  +    sed -i -e "s|build_by_default: true|build_by_default: false|" 
>> ${S}/gimp-data/images/meson.build
>>  +}
>>  +
>>  +do_install:prepend() {
>>  +    sed -i -e "s|${B}||" ${B}/app/widgets/gimplanguagestore-data.h
>>  +    sed -i -e "s|${B}||" ${B}/plug-ins/file-bmp/huffman.h
>>  +}
>>  +
>>  +FILES:${PN} += "${datadir}/metainfo"
>>  +
>>  +RDEPENDS:${PN} = "mypaint-brushes-1.0 glib-networking 
>> python3-pygobject"
>>  --
>>  2.49.0
>> 
>> 
>> 
>> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116318): 
> <https://lists.openembedded.org/g/openembedded-devel/message/116318>
> Mute This Topic: <https://lists.openembedded.org/mt/111929688/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-N/eCRctIHpjCP7Gp8D86
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div><div>The complete changelog would be about 3500 lines and I thought that would be too much</div><div><a href="https://gitlab.gnome.org/GNOME/gimp/-/blob/GIMP_3_0_0/NEWS?ref_type=tags">https://gitlab.gnome.org/GNOME/gimp/-/blob/GIMP_3_0_0/NEWS?ref_type=tags</a></div><div><br></div><div>Should it be added to the commit?</div></div></div><div id="geary-quote" dir="auto"><br>On Thu, Mar 27 2025 at 10:49:19 +01:00:00, Alexander Kanavin via lists.openembedded.org &lt;alex.kanavin=gmail.com@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">I appreciate the effort to provide changelogs, but the update is from
gimp 2.x, to gimp 3.x, representing many years of feature development.
I'd suggest that either the provided changelog reflects that, or it is
not included at all (gimp users usually know the deal with 2.x vs
3.x).

Alex

On Thu, 27 Mar 2025 at 02:55, Markus Volk via lists.openembedded.org
&lt;<a href="mailto:f_l_k=t-online.de@lists.openembedded.org">f_l_k=t-online.de@lists.openembedded.org</a>&gt; wrote:
<blockquote>
                    ------------------------------
                    GNU Image Manipulation Program
                          Development Branch
                    ------------------------------

 Overview of Changes from GIMP 3.0.0 to GIMP 3.0.2
 =================================================

 This is a bug-fix only release.

 Core:

   - Mark some strings translatable.
   - Fix crash when choosing a brush in grid view.
   - Windows: temporary revert of some Input Device handling code which
     was breaking pressure sensitivity for some graphics tablets (though
     this revert may make issues with the eraser tip).
   - Fix crash when choosing a non-existing font in text tool options.

 Tools:

   - Reorder Line Art Detection options per design decision.

 Graphical User Interface:

   - Keep headerbar color consistent when out of focus.
   - Histogram uses the luminance value of the foreground color as a
     threshold to lighten or darken the border color for contrast with
     the histogram itself.
   - Improve separation between panels in dark theme.
   - Add default response for GimpQueryBox dialogues.
   - Spacing between toolbox widgets improved.
   - GimpSpinScale slider colors inverted.
   - New icons: "gimp-toggle-on" and "gimp-toggle-off" and using them in
     the Search Action's list as icons for toggle actions.

 Plug-ins:

   - Python Console uses the luminance of the background color for error
     text.
   - Metadata Editor: fix buffer overflow.
   - Gradient Flare: fix crash when setting the size to 0.
   - Screenshot: X11 implementation is bypassed (in favor of portals)
     when running on XWayland.

 Build:

   - Various packaging fixes and cleanup.
   - The Windows installer now prompts (only in user installation) about
     deleting GIMP config files when uninstalling.
   - GEGL 0.4.58 is now our minimum requirement.
   - Windows installer: create Restore Point on system-wide install.

 Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
 ---
  ...irst-line-of-compiler-version-string.patch |  30 ----
  ...f-load-fix-mismatching-variable-type.patch |  24 ----
  .../0001-gimp-cross-compile-fix-for-bz2.patch |  30 ++++
  ...1-gimptool-allow-default-CC-override.patch |  85 ------------
  ...dd-build-time-library-paths-to-LD_LI.patch |  34 -----
  ...001-metadata-shut-up-a-weird-warning.patch |  22 ---
  ...0002-meson.build-reproducibility-fix.patch |  56 ++++++++
  meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb  | 101 --------------
  meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb    | 130 ++++++++++++++++++
  9 files changed, 216 insertions(+), 296 deletions(-)
  delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-configure-Keep-first-line-of-compiler-version-string.patch
  delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-file-tiff-load-fix-mismatching-variable-type.patch
  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-compile-fix-for-bz2.patch
  delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-default-CC-override.patch
  delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch
  delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-metadata-shut-up-a-weird-warning.patch
  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0002-meson.build-reproducibility-fix.patch
  delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb

 diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-configure-Keep-first-line-of-compiler-version-string.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-configure-Keep-first-line-of-compiler-version-string.patch
 deleted file mode 100644
 index 618b4cc7a7..0000000000
 --- a/meta-gnome/recipes-gimp/gimp/gimp/0001-configure-Keep-first-line-of-compiler-version-string.patch
 +++ /dev/null
 @@ -1,30 +0,0 @@
 -From 5711ccfab40e304ced7f5be39a4083e3fcecff91 Mon Sep 17 00:00:00 2001
 -From: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
 -Date: Wed, 24 May 2023 22:22:41 -0700
 -Subject: [PATCH] configure: Keep first line of compiler version string
 -
 -Full output of cc -v may contain additional information which could
 -contain build path information, which is unnessasary
 -
 -Upstream-Status: Submitted [<a href="https://gitlab.gnome.org/GNOME/gimp/-/merge_requests/926">https://gitlab.gnome.org/GNOME/gimp/-/merge_requests/926</a>]
 -Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
 ----
 - configure.ac | 2 +-
 - 1 file changed, 1 insertion(+), 1 deletion(-)
 -
 -diff --git a/configure.ac b/configure.ac
 -index c25415d..68707a0 100644
 ---- a/configure.ac
 -+++ b/configure.ac
 -@@ -599,7 +599,7 @@ fi
 - for CC_VERSION_OPT in $CC_VERSION_OPTS; do
 -   # We run $CC, and escape and format its output, in a single step,
 -   # since some shells expand escape sequences in "echo" arguments.
 --  CC_VERSION="`$CC $CC_VERSION_OPT 2&gt;&amp;1 | sed -e 's/\\\\/\\\\\\\\\\\\\\\\/g;s/^/\\\\t/;s/$/\\\\n/' | tr -d '\n'`"
 -+  CC_VERSION="`$CC $CC_VERSION_OPT 2&gt;&amp;1 | head -1 | sed -e 's/\\\\/\\\\\\\\\\\\\\\\/g;s/^/\\\\t/;s/$/\\\\n/' | tr -d '\n'`"
 -   if test $? -eq 0; then
 -     break
 -   fi
 ---
 -2.40.1
 -
 diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-file-tiff-load-fix-mismatching-variable-type.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-file-tiff-load-fix-mismatching-variable-type.patch
 deleted file mode 100644
 index 13b3dda144..0000000000
 --- a/meta-gnome/recipes-gimp/gimp/gimp/0001-file-tiff-load-fix-mismatching-variable-type.patch
 +++ /dev/null
 @@ -1,24 +0,0 @@
 -From a2458f1528e5733574bb26ff5452b1329116e6db Mon Sep 17 00:00:00 2001
 -From: Simon Budig &lt;<a href="mailto:simon@budig.de">simon@budig.de</a>&gt;
 -Date: Sat, 20 May 2023 18:40:41 +0200
 -Subject: [PATCH] file-tiff-load: fix mismatching variable type
 -
 -Upstream-Status: Backport [<a href="https://gitlab.gnome.org/GNOME/gimp/-/commit/a2458f1528e5733574bb26ff5452b1329116e6db">https://gitlab.gnome.org/GNOME/gimp/-/commit/a2458f1528e5733574bb26ff5452b1329116e6db</a>]
 -Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmai.com">raj.khem@gmai.com</a>&gt;
 ----
 - plug-ins/file-tiff/file-tiff-load.c | 6 +++---
 - 1 file changed, 3 insertions(+), 3 deletions(-)
 -
 ---- a/plug-ins/file-tiff/file-tiff-load.c
 -+++ b/plug-ins/file-tiff/file-tiff-load.c
 -@@ -1301,8 +1301,8 @@ load_image (GFile        *file,
 -
 -       /* any resolution info in the file? */
 -       {
 --        gfloat   xres = 72.0;
 --        gfloat   yres = 72.0;
 -+        gdouble   xres = 72.0;
 -+        gdouble   yres = 72.0;
 -         gushort  read_unit;
 -         GimpUnit unit = GIMP_UNIT_PIXEL; /* invalid unit */
 -
 diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-compile-fix-for-bz2.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-compile-fix-for-bz2.patch
 new file mode 100644
 index 0000000000..721225c8b3
 --- /dev/null
 +++ b/meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-compile-fix-for-bz2.patch
 @@ -0,0 +1,30 @@
 +From a7e40e19d17404cf5ec4135fc1becd5a90f5e1e1 Mon Sep 17 00:00:00 2001
 +From: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
 +Date: Wed, 25 Dec 2024 07:27:04 +0100
 +Subject: [PATCH] gimp: cross-compile fix for bz2
 +
 +autotools bzip2 build does not create pkgconfig files so looking for the dependency fails.
 +
 +Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
 +
 +Upstream-Status: Inappropriate [can probably be removed once bzip2 is built with meson or cmake]
 +---
 + meson.build | 2 +-
 + 1 file changed, 1 insertion(+), 1 deletion(-)
 +
 +diff --git a/meson.build b/meson.build
 +index 4e48f8c64c..d5dce47015 100644
 +--- a/meson.build
 ++++ b/meson.build
 +@@ -765,7 +765,7 @@ zlib = dependency('zlib')
 + MIMEtypes += 'image/x-psp'
 +
 + # Compiler-provided headers can't be found in crossroads environment
 +-if not meson.is_cross_build()
 ++if true
 +   bz2 = cc.find_library('bz2')
 + else
 +   bz2 = dependency('bzip2')
 +--
 +2.47.1
 +
 diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-default-CC-override.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-default-CC-override.patch
 deleted file mode 100644
 index b04a16cec7..0000000000
 --- a/meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-default-CC-override.patch
 +++ /dev/null
 @@ -1,85 +0,0 @@
 -From 7e5b986cb7797a6535fe2471b9a5fb7c00821f51 Mon Sep 17 00:00:00 2001
 -From: Yoann Congal &lt;<a href="mailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt;
 -Date: Sun, 13 Oct 2024 01:00:10 +0200
 -Subject: [PATCH] gimptool: allow default CC override
 -
 -From: Yoann Congal &lt;<a href="mailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt;
 -
 -In OE, CC contains sysroot path. Storing CC in binary then leads to
 -non-reproducibility.
 -
 -This commit add a new configure option "--with-default-cc='cmd'" for
 -force the CC stored in gimptool to a reproducible value.
 -
 -Upstream-Status: Inappropriate [does not apply on master (upstream has moved to meson)]
 -Signed-off-by: Yoann Congal &lt;<a href="mailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt;
 ----
 - app-tools/Makefile.am |  2 +-
 - configure.ac          | 13 +++++++++++++
 - tools/Makefile.am     |  2 +-
 - tools/gimptool.c      |  2 +-
 - 4 files changed, 16 insertions(+), 3 deletions(-)
 -
 -diff --git a/app-tools/Makefile.am b/app-tools/Makefile.am
 -index a7cd4ce..81a3a00 100644
 ---- a/app-tools/Makefile.am
 -+++ b/app-tools/Makefile.am
 -@@ -67,7 +67,7 @@ AM_CPPFLAGS = \
 -       -DMANDIR=\""$(mandir)"\"                                \
 -       -DGIMPPLUGINDIR=\""$(gimpplugindir)"\"                  \
 -       -DGIMPDATADIR=\""$(gimpdatadir)"\"                      \
 --      -DCC=\""$(CC)"\"                                        \
 -+      -DDEFAULT_CC=\""@DEFAULT_CC@"\"                         \
 -       -DGIMPDIR=\""$(gimpdir)"\"                              \
 -       -DGIMP_PLUGIN_VERSION=\""$(GIMP_PLUGIN_VERSION)"\"      \
 -       -I$(top_srcdir)                                         \
 -diff --git a/configure.ac b/configure.ac
 -index a88b7cc..d90b6db 100644
 ---- a/configure.ac
 -+++ b/configure.ac
 -@@ -2457,6 +2457,19 @@ fi
 - AM_CONDITIONAL(DESKTOP_DATADIR, test "x$with_desktop_dir" != xno)
 - AC_SUBST(DESKTOP_DATADIR)
 -
 -+######################
 -+# Determine default CC
 -+######################
 -+
 -+AC_ARG_WITH(default-cc, [ --with-default-cc="cmd" default CC to print in gimptool (default=CC)])
 -+
 -+if test "x$with_default_cc" != x; then
 -+  DEFAULT_CC=$with_default_cc
 -+else
 -+  DEFAULT_CC=CC
 -+fi
 -+
 -+AC_SUBST(DEFAULT_CC)
 -
 - #####################
 - # Check for XML tools
 -diff --git a/tools/Makefile.am b/tools/Makefile.am
 -index 420b9b1..ccabde8 100644
 ---- a/tools/Makefile.am
 -+++ b/tools/Makefile.am
 -@@ -87,7 +87,7 @@ AM_CPPFLAGS = \
 -       -DMANDIR=\""$(mandir)"\"                                \
 -       -DGIMPPLUGINDIR=\""$(gimpplugindir)"\"                  \
 -       -DGIMPDATADIR=\""$(gimpdatadir)"\"                      \
 --      -DCC=\""$(CC)"\"                                        \
 -+      -DDEFAULT_CC=\""@DEFAULT_CC@"\"                         \
 -       -DGIMPDIR=\""$(gimpdir)"\"                              \
 -       -DGIMP_PLUGIN_VERSION=\""$(GIMP_PLUGIN_VERSION)"\"      \
 -       -I$(top_srcdir)                                         \
 -diff --git a/tools/gimptool.c b/tools/gimptool.c
 -index 21fc043..bbf3fa5 100644
 ---- a/tools/gimptool.c
 -+++ b/tools/gimptool.c
 -@@ -280,7 +280,7 @@ find_out_env_flags (void)
 -   else if (msvc_syntax)
 -     env_cc = "cl -MD";
 -   else
 --    env_cc = CC;
 -+    env_cc = DEFAULT_CC;
 -
 -   if (g_ascii_strncasecmp (env_cc, "cl", 2)    == 0 &amp;&amp;
 -       g_ascii_strncasecmp (env_cc, "clang", 5) != 0)
 diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch
 deleted file mode 100644
 index cec0055284..0000000000
 --- a/meta-gnome/recipes-gimp/gimp/gimp/0001-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch
 +++ /dev/null
 @@ -1,34 +0,0 @@
 -From c720df90dfe3a3e92e34bfb36a04cc792064a501 Mon Sep 17 00:00:00 2001
 -From: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
 -Date: Wed, 24 May 2023 22:39:02 -0700
 -Subject: [PATCH] libtool: Do not add build time library paths to
 - LD_LIBRARY_PATH
 -
 -This does not serve much purpose on cross builds as it will add build
 -time paths which are only useful when trying to run these tools from
 -build area but when they are cross built this is not possible to run
 -them like this.
 -
 -Upstream-Status: Inappropriate [Cross-compile specific]
 -
 -Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
 ----
 - ltmain.sh | 2 +-
 - 1 file changed, 1 insertion(+), 1 deletion(-)
 -
 -diff --git a/ltmain.sh b/ltmain.sh
 -index 134902c..068d74a 100644
 ---- a/ltmain.sh
 -+++ b/ltmain.sh
 -@@ -5748,7 +5748,7 @@ func_exec_program ()
 -       if test yes = "$shlibpath_overrides_runpath" &amp;&amp; test -n "$shlibpath_var" &amp;&amp; test -n "$temp_rpath"; then
 -         $ECHO "\
 -     # Add our own library path to $shlibpath_var
 --    $shlibpath_var=\"$temp_rpath\$$shlibpath_var\"
 -+    $shlibpath_var=\"$shlibpath_var\"
 -
 -     # Some systems cannot cope with colon-terminated $shlibpath_var
 -     # The second colon is a workaround for a bug in BeOS R4 sed
 ---
 -2.40.1
 -
 diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-metadata-shut-up-a-weird-warning.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-metadata-shut-up-a-weird-warning.patch
 deleted file mode 100644
 index 4f04ac8250..0000000000
 --- a/meta-gnome/recipes-gimp/gimp/gimp/0001-metadata-shut-up-a-weird-warning.patch
 +++ /dev/null
 @@ -1,22 +0,0 @@
 -From 51311f913d9f417d121f59b83d560c7b4b853d1c Mon Sep 17 00:00:00 2001
 -From: Simon Budig &lt;<a href="mailto:simon@budig.de">simon@budig.de</a>&gt;
 -Date: Sat, 20 May 2023 22:25:40 +0200
 -Subject: [PATCH] metadata: shut up a weird warning
 -
 -Upstream-Status: Backport [<a href="https://gitlab.gnome.org/GNOME/gimp/-/commit/51311f913d9f417d121f59b83d560c7b4b853d1c">https://gitlab.gnome.org/GNOME/gimp/-/commit/51311f913d9f417d121f59b83d560c7b4b853d1c</a>]
 -Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
 ----
 - plug-ins/metadata/metadata-editor.c | 2 +-
 - 1 file changed, 1 insertion(+), 1 deletion(-)
 -
 ---- a/plug-ins/metadata/metadata-editor.c
 -+++ b/plug-ins/metadata/metadata-editor.c
 -@@ -2140,7 +2140,7 @@ metadata_dialog_editor_set_metadata (GEx
 -                             }
 -                           else
 -                             {
 --                              if (! g_strv_contains (values, equiv_values[evi]))
 -+                              if (! g_strv_contains ((const gchar * const *) values, equiv_values[evi]))
 -                                 {
 -                                   gchar *tmpvalue;
 -
 diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0002-meson.build-reproducibility-fix.patch b/meta-gnome/recipes-gimp/gimp/gimp/0002-meson.build-reproducibility-fix.patch
 new file mode 100644
 index 0000000000..532715d588
 --- /dev/null
 +++ b/meta-gnome/recipes-gimp/gimp/gimp/0002-meson.build-reproducibility-fix.patch
 @@ -0,0 +1,56 @@
 +From bf19c5687703769e406a8086036d4ed6421c33cb Mon Sep 17 00:00:00 2001
 +From: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
 +Date: Mon, 13 Jan 2025 10:04:33 +0100
 +Subject: [PATCH] meson.build: reproducibility fix
 +
 +Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
 +
 +Upstream-Status: Inappropriate [oe-specific]
 +---
 + meson.build | 28 ++++++++++++++--------------
 + 1 file changed, 14 insertions(+), 14 deletions(-)
 +
 +diff --git a/meson.build b/meson.build
 +index 97cd621780..e47180db87 100644
 +--- a/meson.build
 ++++ b/meson.build
 +@@ -1599,23 +1599,23 @@ conf.set('HAVE_FUNC_ATTRIBUTE_DESTRUCTOR',
 + conf.set_quoted('CC',             cc.get_id())
 +
 + cc_version=''
 +-if cc.get_id() == 'gcc' or cc.get_id() == 'clang'
 +-  cc_cmd = run_command(cc, '-v', check: false)
 ++#if cc.get_id() == 'gcc' or cc.get_id() == 'clang'
 ++#  cc_cmd = run_command(cc, '-v', check: false)
 +   # Note: the call might actually fail when using ccache.
 +   # See: <a href="https://github.com/mesonbuild/meson/issues/6174">https://github.com/mesonbuild/meson/issues/6174</a>
 +-  if cc_cmd.returncode() == 0
 +-    cc_version = cc_cmd.stdout() + cc_cmd.stderr()
 +-  endif
 +-else
 ++#  if cc_cmd.returncode() == 0
 ++#    cc_version = cc_cmd.stdout() + cc_cmd.stderr()
 ++#  endif
 ++#else
 +   # Various compilers have various options. Try most common ones. This
 +   # list of options comes from autotools checks.
 +-  foreach arg : [ '--version', '-v', '-V', '-qversion' ]
 +-    cc_cmd = run_command(cc, arg, check: false)
 +-    if cc_cmd.returncode() == 0
 +-      cc_version = cc_cmd.stdout()
 +-    endif
 +-  endforeach
 +-endif
 ++#  foreach arg : [ '--version', '-v', '-V', '-qversion' ]
 ++#    cc_cmd = run_command(cc, arg, check: false)
 ++#    if cc_cmd.returncode() == 0
 ++#      cc_version = cc_cmd.stdout()
 ++#    endif
 ++#  endforeach
 ++#endif
 + if cc_version == ''
 +   # We didn't manage to get a meaningful verbose version from the
 +   # compiler. Just save its name and version.
 +--
 +2.47.1
 +
 diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
 deleted file mode 100644
 index 0272e05e96..0000000000
 --- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
 +++ /dev/null
 @@ -1,101 +0,0 @@
 -SUMMARY = "The GIMP is the GNU Image Manipulation Program"
 -HOMEPAGE = "<a href="http://www.gimp.org">http://www.gimp.org</a>"
 -SECTION = "x11/graphics"
 -LICENSE = "GPL-3.0-only"
 -LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e" "="">file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"</a>
 -
 -DEPENDS = " \
 -    alsa-lib \
 -    atk \
 -    cairo \
 -    fontconfig \
 -    freetype \
 -    gdk-pixbuf-native \
 -    intltool-native \
 -    libxslt-native \
 -    gegl-native \
 -    dbus-glib \
 -    gtk+ \
 -    babl \
 -    gegl \
 -    libmypaint \
 -    mypaint-brushes-1.0 \
 -    gexiv2 \
 -    jpeg \
 -    libmng \
 -    libpng \
 -    libexif \
 -    tiff \
 -    lcms \
 -    poppler \
 -    poppler-data \
 -    jasper \
 -    bzip2 \
 -    libgudev \
 -    libmng \
 -    <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'x11', 'libxmu libxpm', '', d)} \
 -"
 -DEPENDS:append:libc-musl = " libexecinfo"
 -
 -GNOMEBASEBUILDCLASS = "autotools"
 -inherit features_check gnomebase gtk-icon-cache gtk-doc mime-xdg
 -
 -REQUIRED_DISTRO_FEATURES = "x11"
 -
 -SHPV = "${@gnome_verdir("${PV}")}"
 -
 -SRC_URI = "<a href="https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2">https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2</a> \
 -           <a href="file://0001-configure-Keep-first-line-of-compiler-version-string.patch">file://0001-configure-Keep-first-line-of-compiler-version-string.patch</a> \
 -           <a href="file://0001-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch">file://0001-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch</a> \
 -           <a href="file://0001-file-tiff-load-fix-mismatching-variable-type.patch">file://0001-file-tiff-load-fix-mismatching-variable-type.patch</a> \
 -           <a href="file://0001-metadata-shut-up-a-weird-warning.patch">file://0001-metadata-shut-up-a-weird-warning.patch</a> \
 -           <a href="file://0001-gimptool-allow-default-CC-override.patch">file://0001-gimptool-allow-default-CC-override.patch</a> \
 -           "
 -SRC_URI[sha256sum] = "50a845eec11c8831fe8661707950f5b8446e35f30edfb9acf98f85c1133f856e"
 -
 -EXTRA_OECONF = "--disable-python \
 -                --without-webkit \
 -                --disable-check-update \
 -                --without-wmf"
 -
 -EXTRA_OECONF += "<a href="mailto:${@oe.utils.conditional">${@oe.utils.conditional</a>('SITEINFO_BITS', '32', ' --disable-vector-icons', '', d)}"
 -
 -do_configure:append() {
 -    find ${B} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
 -    find ${B} -name Makefile | xargs sed -i s:'-I/usr/include':'-I${STAGING_INCDIR}':g
 -}
 -
 -do_compile:prepend() {
 -    # Let native babl/gegl find their plugins
 -    export BABL_PATH=`find ${STAGING_LIBDIR_NATIVE} -maxdepth 1 -name 'babl-*'`
 -    export GEGL_PATH=`find ${STAGING_LIBDIR_NATIVE} -maxdepth 1 -name 'gegl-*'`
 -}
 -
 -FILES:${PN}  += "${datadir}/metainfo"
 -
 -RDEPENDS:${PN} += "mypaint-brushes-1.0"
 -
 -
 -# gimptool
 -
 -# gimptool needs a CC definition, use current CC without sysroot
 -python __anonymous() {
 -    import shlex
 -    CC_WITHOUT_SYSROOT = shlex.join(filter(lambda x: not x.startswith("--sysroot="), shlex.split(d.getVar("CC"))))
 -    d.setVar("CC_WITHOUT_SYSROOT", CC_WITHOUT_SYSROOT)
 -}
 -EXTRA_OECONF += "--with-default-cc='${CC_WITHOUT_SYSROOT}'"
 -
 -# Split gimptool in its own package
 -PACKAGE_BEFORE_PN += "${PN}-gimptool"
 -FILES:${PN}-gimptool += "${bindir}/gimptool-2.0"
 -
 -# gimptool depends on gimp .pc file being installed and tools to build the plugin.
 -RDEPENDS:${PN}-gimptool += "${PN}-dev packagegroup-core-buildessential"
 -INSANE_SKIP:${PN}-gimptool += "dev-deps"
 -
 -
 -CVE_STATUS[CVE-2007-3741] = "not-applicable-platform: This only applies for Mandriva Linux"
 -CVE_STATUS[CVE-2009-0581] = "cpe-incorrect: The current version (2.10.38) is not affected."
 -CVE_STATUS[CVE-2009-0723] = "cpe-incorrect: The current version (2.10.38) is not affected."
 -CVE_STATUS[CVE-2009-0733] = "cpe-incorrect: The current version (2.10.38) is not affected."
 diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb b/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
 new file mode 100644
 index 0000000000..8e44f2ca23
 --- /dev/null
 +++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
 @@ -0,0 +1,130 @@
 +SUMMARY = "The GIMP is the GNU Image Manipulation Program"
 +HOMEPAGE = "<a href="http://www.gimp.org">http://www.gimp.org</a>"
 +SECTION = "graphics"
 +LICENSE = "GPL-3.0-only"
 +LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e" "="">file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"</a>
 +
 +DEPENDS = " \
 +    appstream-glib \
 +    atk \
 +    babl \
 +    bzip2 \
 +    bison-native \
 +    cairo \
 +    fontconfig \
 +    freetype \
 +    gdk-pixbuf-native \
 +    gegl \
 +    gexiv2 \
 +    glib-2.0 \
 +    glib-2.0-native \
 +    gtk+3 \
 +    harfbuzz \
 +    iso-codes \
 +    jpeg \
 +    json-glib \
 +    lcms \
 +    libarchive \
 +    libexif \
 +    libmypaint \
 +    libpng \
 +    librsvg \
 +    librsvg-native \
 +    libxmu \
 +    libxslt-native \
 +    mypaint-brushes-1.0 \
 +    pango \
 +    poppler \
 +    poppler-data \
 +    python3-pygobject-native \
 +    tiff \
 +    xz \
 +    zlib \
 +"
 +
 +DEPENDS:append:libc-musl = " libexecinfo"
 +
 +inherit meson gtk-icon-cache mime-xdg pkgconfig gettext gobject-introspection vala
 +
 +GIR_MESON_OPTION = 'can-crosscompile-gir'
 +VALA_MESON_OPTION = "vala"
 +VALA_MESON_ENABLE_FLAG = "enabled"
 +VALA_MESON_DISABLE_FLAG = "disabled"
 +GIDOCGEN_MESON_OPTION = "gi-docgen"
 +GIDOCGEN_MESON_ENABLE_FLAG = "enabled"
 +GIDOCGEN_MESON_DISABLE_FLAG = "disabled"
 +
 +SRC_URI = "<a href="https://download.gimp.org/gimp/v${@oe.utils.trim_version('${PV">https://download.gimp.org/gimp/v${@oe.utils.trim_version('${PV</a>}', 2)}/gimp-${PV}.tar.xz"
 +SRC_URI += "<a href="file://0001-gimp-cross-compile-fix-for-bz2.patch" "="">file://0001-gimp-cross-compile-fix-for-bz2.patch"</a>
 +SRC_URI += "<a href="file://0002-meson.build-reproducibility-fix.patch" "="">file://0002-meson.build-reproducibility-fix.patch"</a>
 +SRC_URI[sha256sum] = "546ddc30cb2d0e79123c7fcb4d78211e1ee7a6aace91a6a0ad8cbcbf6ea571a2"
 +
 +PACKAGECONFIG[aa] = "-Daa=enabled,-Daa=disabled,aalib"
 +PACKAGECONFIG[alsa] = "-Dalsa=enabled,-Dalsa=disabled,alsa-lib"
 +PACKAGECONFIG[appdata-test] = "-Dappdata-test=enabled,-Dappdata-test=disabled,appstream-glib-native"
 +PACKAGECONFIG[cairo-pdf] = "-Dcairo-pdf=enabled,-Dcairo-pdf=disabled"
 +PACKAGECONFIG[check-update] = "-Dcheck-update=yes,-Dcheck-update=no"
 +PACKAGECONFIG[ghostscript] = "-Dghostscript=enabled,-Dghostscript=disabled,ghostscript,ghostscript"
 +PACKAGECONFIG[gudev] = "-Dgudev=enabled,-Dgudev=disabled,libgudev"
 +PACKAGECONFIG[heif] = "-Dheif=enabled,-Dheif=disabled,libheif"
 +PACKAGECONFIG[javascript] = "-Djavascript=enabled,-Djavascript=disabled,,gjs"
 +PACKAGECONFIG[jpeg2000] = "-Djpeg2000=enabled,-Djpeg2000=disabled,jasper"
 +PACKAGECONFIG[jpeg-xl] = "-Djpeg-xl=enabled,-Djpeg-xl=disabled,libjxl"
 +PACKAGECONFIG[libunwind] = "-Dlibunwind=true,-Dlibunwind=false,libunwind"
 +PACKAGECONFIG[libbacktrace] = "-Dlibbacktrace=true,-Dlibbacktrace=false,libbacktrace"
 +PACKAGECONFIG[lua] = "-Dlua=true,-Dlua=false,,luajit lua-lgi"
 +PACKAGECONFIG[mng] = "-Dmng=enabled,-Dmng=disabled,libmng"
 +PACKAGECONFIG[openmp] = "-Dopenmp=enabled,-Dopenmp=disabled,gcc-runtime"
 +PACKAGECONFIG[vector-icons] = "-Dvector-icons=true,-Dvector-icons=false,librsvg shared-mime-info"
 +PACKAGECONFIG[webp] = "-Dwebp=enabled,-Dwebp=disabled,libwebp"
 +PACKAGECONFIG[xcursor] = "-Dxcursor=enabled,-Dxcursor=disabled,libxcursor"
 +PACKAGECONFIG[x11] = "-Dxpm=enabled,-Dxpm=disabled,libxpm libxext libxfixes"
 +
 +PACKAGECONFIG ?= " \
 +    alsa \
 +    cairo-pdf \
 +    ghostscript \
 +    gudev \
 +    javascript \
 +    jpeg2000 \
 +    jpeg-xl \
 +    lua \
 +    mng \
 +    vector-icons \
 +    webp \
 +    <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('LICENSE_FLAGS_ACCEPTED', 'commercial', 'heif', '', d)} \
 +    <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'x11', 'x11 xcursor', '', d)} \
 +"
 +
 +PACKAGECONFIG:remove:riscv32 = "lua"
 +PACKAGECONFIG:remove:riscv64 = "lua"
 +PACKAGECONFIG:remove:powerpc64 = "lua"
 +PACKAGECONFIG:remove:powerpc64le = "lua"
 +
 +EXTRA_OEMESON += " \
 +    -Dshmem-type=posix \
 +    -Dlinux-input=enabled \
 +    --buildtype release \
 +    --cross-file=${WORKDIR}/meson-${PN}.cross \
 +"
 +
 +do_write_config:append() {
 +    cat &gt;${WORKDIR}/meson-${PN}.cross &lt;&lt;EOF
 +[binaries]
 +gjs = '${bindir}/gjs'
 +luajit = '${bindir}/luajit'
 +EOF
 +}
 +
 +do_configure:append () {
 +    sed -i -e "s|build_by_default: true|build_by_default: false|" ${S}/gimp-data/images/meson.build
 +}
 +
 +do_install:prepend() {
 +    sed -i -e "s|${B}||" ${B}/app/widgets/gimplanguagestore-data.h
 +    sed -i -e "s|${B}||" ${B}/plug-ins/file-bmp/huffman.h
 +}
 +
 +FILES:${PN} += "${datadir}/metainfo"
 +
 +RDEPENDS:${PN} = "mypaint-brushes-1.0 glib-networking python3-pygobject"
 --
 2.49.0


 

</blockquote></div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#116318): <a href="https://lists.openembedded.org/g/openembedded-devel/message/116318">https://lists.openembedded.org/g/openembedded-devel/message/116318</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/111929688/3618223">https://lists.openembedded.org/mt/111929688/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-N/eCRctIHpjCP7Gp8D86--


