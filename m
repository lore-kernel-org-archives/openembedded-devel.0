Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web11.1293.1597271932462047542
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 15:38:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=isxEkm7X;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id h12so1776192pgm.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 15:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kmtoH9I9gZQckn3UmmS88cloKfKKPkPdvRBVNeB3Ppc=;
        b=isxEkm7XTSwRyxKq56xkV6oI7e1JMrrfluiiXsz4nWqcpeLO4VBuiz7XM4WLT84HVz
         1JAJviLfAHOrkwgqBpHOfK5XgiloPbTOAkIpT05Knkq2YhKGteqLk2nU0GLa9lZNiqPE
         35vsV9I2SR7wS3kGDWukMLxtfAZ0F+EDXwiNTSFJ2lnmMFB13nEmimduDtM0ctjx2Lyv
         cx6z48mqjVs0ICv/TfcCtTgI0kpN99cLnpgi9d9b24KqNuC7+KC8XenR89NqH58Ch28a
         lSrAuiCmry1DMCcFSKVPWRvJHrYpjrzUfkfeJaRBwFhXp3is8tAMdGaNSI6hjv7KjqV1
         JGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kmtoH9I9gZQckn3UmmS88cloKfKKPkPdvRBVNeB3Ppc=;
        b=oZJWk+zW3sthqq8bgKLCUeinBlznmKvuOWwN/w3fY9EHxCFstWBHhmEiO17uOS2iwZ
         ItGLfZDb1F6AL7E+cEt+x6JO88RJPHYPyIOtrWsX4fKZBPcEe5Pl/tCejoO5zjZeF4QH
         c9TekiNQnO62EbVL8+7xuYdLRoKG8XNg29MLdxealgC0Ea2D8t6yRUqTR7Nr1ifzR4H4
         2AVysp0vjvMfWuYCga2oKYArpoSCsAHMOqeOy9DS9rr4hOgj6ClFGQ2iWgtZrgDfc9vB
         zd9Ua/RUg8fKvr6c9fnNXYgxPIsEYHHfdbex8XCqsviSrv1/eLy8un53XT9Q52Z2JM7S
         IYpg==
X-Gm-Message-State: AOAM532fcg9nlgN0lbvaAp7NJIlSpU/hG/oGKlYg6JrwCo64nSQ4A2Z6
	1mQSNrtfiLJaJ5XJYL3h9CJoCVvoEWyWfEpvQao=
X-Google-Smtp-Source: ABdhPJyxDW1HidaSV1NNKKFhw1wH/BkvUEbhacNBtAcz6xQUCzGesFVutnc3dYFdKnFNJp41d4ceO1bvGVXBPMx4UxQ=
X-Received: by 2002:a63:df54:: with SMTP id h20mr1135636pgj.319.1597271931879;
 Wed, 12 Aug 2020 15:38:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200812220358.1690080-1-raj.khem@gmail.com>
In-Reply-To: <20200812220358.1690080-1-raj.khem@gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Thu, 13 Aug 2020 00:38:39 +0200
Message-ID: <CALbNGRTrTzA27=uBwhAu5Pz2fukT3yRQV+=1q4q1ACn0B5EKfw@mail.gmail.com>
Subject: Re: [meta-xfce][PATCH 1/3] xfce4-sensors-plugin: Fix build with -fno-common
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I am fine with these

Out of curiosity: What am I missing (or what should I be prepared for)
that these build fine for me?

Andreas

On Thu, Aug 13, 2020 at 12:04 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...ple-definition-errors-under-GCC-10.0.patch | 118 ++++++++++++++++++
>  .../sensors/xfce4-sensors-plugin_1.3.92.bb    |   4 +-
>  2 files changed, 121 insertions(+), 1 deletion(-)
>  create mode 100644 meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin/0001-Fix-multiple-definition-errors-under-GCC-10.0.patch
>
> diff --git a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin/0001-Fix-multiple-definition-errors-under-GCC-10.0.patch b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin/0001-Fix-multiple-definition-errors-under-GCC-10.0.patch
> new file mode 100644
> index 0000000000..30cb487c8f
> --- /dev/null
> +++ b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin/0001-Fix-multiple-definition-errors-under-GCC-10.0.patch
> @@ -0,0 +1,118 @@
> +From 6c6de7c07290248a3c72a50c7790885ee4bc13a2 Mon Sep 17 00:00:00 2001
> +From: Robin Lee <cheeselee@fedoraproject.org>
> +Date: Mon, 24 Feb 2020 17:52:39 +0800
> +Subject: [PATCH] Fix multiple definition errors under GCC 10.0
> +
> +Fixes #16436, RHBZ#1800268
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + include/sensors-interface-common.h | 22 ++++++++++++++--------
> + lib/sensors-interface-common.c     |  1 +
> + 2 files changed, 15 insertions(+), 8 deletions(-)
> +
> +diff --git a/include/sensors-interface-common.h b/include/sensors-interface-common.h
> +index 62a27eb..05146c5 100644
> +--- a/include/sensors-interface-common.h
> ++++ b/include/sensors-interface-common.h
> +@@ -146,6 +146,12 @@ t_sensors_dialog;
> +
> +
> +
> ++#ifdef XFCE4_SENSORS_INTERFACE_COMMON_DEFINING
> ++#define EXTERN
> ++#else
> ++#define EXTERN extern
> ++#endif
> ++
> + /* Extern functions that need to be re-implemented in the sensors-viewer and
> +  * the panel code.
> +  * They kind of need to be registered at the library by any software
> +@@ -157,7 +163,7 @@ t_sensors_dialog;
> +  * @param ptr_widget: Pointer to original widget, i.e, the update timer box
> +  * @param ptr_sensorsdialog: argument pointer to sensors dialog data
> +  */
> +-void
> ++EXTERN void
> + (*adjustment_value_changed) (GtkWidget *ptr_widget,
> +                              t_sensors_dialog *ptr_sensorsdialog);
> +
> +@@ -167,7 +173,7 @@ void
> +  * @param ptr_widget: Pointer to original widget, i.e, the sensor entry combobox
> +  * @param ptr_sensorsdialog: argument pointer to sensors dialog data
> +  */
> +-void
> ++EXTERN void
> + (*sensor_entry_changed) (GtkWidget *ptr_widget,
> +                          t_sensors_dialog *ptr_sensorsdialog);
> +
> +@@ -178,7 +184,7 @@ void
> +  * @param ptr_str_newtext: Pointer to the string containing the new label
> +  * @param ptr_sensorsdialog: argument pointer to sensors dialog data
> +  */
> +-void
> ++EXTERN void
> + (*list_cell_text_edited) (GtkCellRendererText *ptr_cellrenderertext,
> +                           gchar *ptr_str_path, gchar *ptr_str_newtext,
> +                           t_sensors_dialog *ptr_sensorsdialog);
> +@@ -189,7 +195,7 @@ void
> +  * @param ptr_str_path: pointer to the string with the path of the changed item
> +  * @param ptr_sensorsdialog: argument pointer to sensors dialog data
> +  */
> +-void
> ++EXTERN void
> + (*list_cell_toggle) (GtkCellRendererToggle *ptr_cellrenderertoggle, gchar *ptr_str_path,
> +                      t_sensors_dialog *ptr_sensorsdialog);
> +
> +@@ -201,7 +207,7 @@ void
> +  *                          hexadecimal rgb format #0011ff
> +  * @param ptr_sensorsdialog: argument pointer to sensors dialog data
> +  */
> +-void
> ++EXTERN void
> + (*list_cell_color_edited) (GtkCellRendererText *ptr_cellrenderertext,
> +                            gchar *ptr_str_path, gchar *ptr_str_newcolor,
> +                            t_sensors_dialog *ptr_sensorsdialog);
> +@@ -214,7 +220,7 @@ void
> +  *                        temperature
> +  * @param ptr_sensorsdialog: argument pointer to sensors dialog data
> +  */
> +-void
> ++EXTERN void
> + (*minimum_changed) (GtkCellRendererText *ptr_cellrenderertext, gchar *ptr_str_path,
> +                     gchar *ptr_str_newmin, t_sensors_dialog *ptr_sensorsdialog);
> +
> +@@ -226,7 +232,7 @@ void
> +  *                        temperature
> +  * @param ptr_sensorsdialog: argument pointer to sensors dialog data
> +  */
> +-void
> ++EXTERN void
> + (*maximum_changed) (GtkCellRendererText *ptr_cellrenderertext, gchar *ptr_str_path,
> +                     gchar *ptr_str_newmax, t_sensors_dialog *ptr_sensorsdialog);
> +
> +@@ -236,7 +242,7 @@ void
> +  * @param ptr_widget: Pointer to original widget, i.e, the update timer box
> +  * @param ptr_sensorsdialog: argument pointer to sensors dialog data
> +  */
> +-void
> ++EXTERN void
> + (*temperature_unit_change) (GtkWidget *ptr_widget,
> +                             t_sensors_dialog *ptr_sensorsdialog);
> +
> +diff --git a/lib/sensors-interface-common.c b/lib/sensors-interface-common.c
> +index 70aa154..8c79f1d 100644
> +--- a/lib/sensors-interface-common.c
> ++++ b/lib/sensors-interface-common.c
> +@@ -28,6 +28,7 @@
> + #include <libxfce4panel/xfce-panel-plugin.h>
> +
> + /* Local/package includes */
> ++#define XFCE4_SENSORS_INTERFACE_COMMON_DEFINING
> + #include <configuration.h>
> + #include <sensors-interface-common.h>
> + #include <middlelayer.h>
> +--
> +2.24.1
> +
> diff --git a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.3.92.bb b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.3.92.bb
> index 3fd0ff6cf4..aa5fe019d5 100644
> --- a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.3.92.bb
> +++ b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.3.92.bb
> @@ -7,7 +7,9 @@ inherit xfce-panel-plugin
>
>  SRC_URI[md5sum] = "7327c4c316ebd5d93665e77b432b8d89"
>  SRC_URI[sha256sum] = "3dc6643d2c064b7718badff44b948f8d410f00f13db197820b26ae38045f5112"
> -SRC_URI += "file://0001-Do-not-check-for-sys-class-power_supply-we-are-cross.patch"
> +SRC_URI += "file://0001-Do-not-check-for-sys-class-power_supply-we-are-cross.patch \
> +            file://0001-Fix-multiple-definition-errors-under-GCC-10.0.patch \
> +           "
>
>  EXTRA_OECONF = " \
>      --disable-procacpi \
> --
> 2.28.0
>
