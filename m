Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web08.1408.1609788104174237851
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jan 2021 11:21:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bNazB0SN;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id c12so16981397pfo.10
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Jan 2021 11:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=y1x1HbVxb9uy8dFaLHjLpd29O5MUfhYkY4d4G8UB3us=;
        b=bNazB0SN1wm5N+mASQ36Oi2+eNgkIIC5sGmoG1Zvl1bCDp3JQ3+rq7CuoWhhKYqsSa
         vJsOkq4VB6afvwMtSODehS3gIvMfA1rb9Q0Je42LjsVvNgCJAxhpmO2wbj6QT8aBpohF
         BuVQn+Lp3hi8K03S4W8um5jsE5/PBEsdYb/xqy1O/RE8DAxaPnsZmCwOV5+QPbo3aFHL
         boBYilVKTb03VUZCqeppX/ZRRouRgZkihGj8X5e7ka4m0SRWbSU8xgt9vGunHsD7Sh6Y
         fGZ3BQeagMpvKwo5kFleEpAimog5TEMDGQAKFFMdC8nh1tlgFWJ8pUmhSRUlNohLCNxI
         zjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=y1x1HbVxb9uy8dFaLHjLpd29O5MUfhYkY4d4G8UB3us=;
        b=hFFmsumOZ1vRfiWcx4c17NP2jXpg+bqmoJSIzHl9OP+6T9hlPSgkAH0kzaanQqpERn
         aZvhHuakOPBLqbWncy3IM7wf0HXM1SGb22/pr3P6Z7dU71a+ml/np2vdz6w14TcHSpdy
         esp+LnRxqSDJS0ve1YCU1/wYLvnoPhCtNRUg8ISZkWryGIuSpTfNLBepbQxV1PiY+fF3
         LlJhl//2pQOaaineLDvc7mc/YSvmSJwvMKt9sJG9m+DUh5cpgGAJOIVnAKeZz/kQotPi
         i3atYfyOiLudC/x141V4CqcREGcDBTL1H02w49QE0hCFvulUori8+JOvLjGlsJlDDkEK
         BsyA==
X-Gm-Message-State: AOAM532OPdTRH2IZXdra2IYfktMPi9XxW84+jop/4XBxZfS3VOgFjkA2
	qRXs135k7f0/GIF+Q3GVJ5N15UWIbvYQdQ==
X-Google-Smtp-Source: ABdhPJwcysoK+3TT24K0QxIviE4/Zma+7Su8XezUTbO+D/4WE0ANc+ety9iCR3o0KXQ9TZdrAYjzag==
X-Received: by 2002:a63:504e:: with SMTP id q14mr53326849pgl.21.1609788103228;
        Mon, 04 Jan 2021 11:21:43 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::8fb0? ([2601:646:9200:a0f0::8fb0])
        by smtp.gmail.com with ESMTPSA id h1sm47407799pgj.59.2021.01.04.11.21.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jan 2021 11:21:42 -0800 (PST)
Subject: Re: [oe] [PATCH][V2 02/16] xfce4-mount-plugin: upgrade 1.1.3 -> 1.1.5
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20210103141247.1637618-1-schnitzeltony@gmail.com>
 <20210103141247.1637618-3-schnitzeltony@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <615e622d-7e4e-561a-ae75-a5c0d3186b69@gmail.com>
Date: Mon, 4 Jan 2021 11:21:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210103141247.1637618-3-schnitzeltony@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 1/3/21 6:12 AM, Andreas Müller wrote:
> Release notes for 1.1.5
> =======================
> Updated and revised German translation;
> further enhanced autotools setup;
> checked compilation and functionality on FreeBSD 12.2.
> 
> Release notes for 1.1.4
> =======================
> - Remove unused variable exclude_devicenames
> - Remove obsolete panel version 4.9 check
> - Remove checks for unused functions from configure.ac
> - Include stdlib because malloc is used
> - Spellfix. Add missing "e" to siz (size)
> - Update URLs from goodies.x.o to docs.x.o (Bug #16168)
> - Fix build with panel 4.15
> - Make build less verbose
> - Another change to the SVG icon file canvas size
> - Updated svg image to have a larger canvas so that the panel can be
>    resized up to 192 pixels size
> - Added title to popup menu; even if it is not empty (Bug #14478)
> - https URL instead of http
> - Renamed improperly named member variable of main mountpoint display
>    structure
> - Display percentage on progress bar again (regression from port to
>    Gtk3)
> - Reformatted popup information with more columns and nicer alignment.
>    (Bug #14670)
> - Fix bug 13624 by not trying to save when closing the plugin, but
>    already and only when closing the settings dialog
> - Translation Updates:
>    Albanian, Arabic, Asturian, Basque, Belarusian, Bulgarian,
>    Catalan, Chinese (China), Chinese (Taiwan), Croatian, Czech, Danish,
>    Dutch, Eastern Armenian, English (Australia), English (United
>    Kingdom), Finnish, French, Galician, German, Greek, Hebrew,
>    Hungarian, Icelandic, Indonesian, Interlingue, Italian, Japanese,
>    Korean, Latvian, Lithuanian, Malay, Norwegian Bokmål, Occitan (post
>    1500), Panjabi (Punjabi), Polish, Portuguese, Portuguese (Brazil),
>    Russian, Serbian, Slovak, Spanish, Swedish, Thai, Turkish, Ukrainian,
>    Urdu, Urdu (Pakistan), Uyghur
> 

it seems fstab.h header check needs some extra checks its failing on musl

https://errors.yoctoproject.org/Errors/Details/540467/
https://errors.yoctoproject.org/Errors/Details/540468/

> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>   ...1-check-for-fstab.h-during-configure.patch | 30 +++++++++----------
>   ...n_1.1.3.bb => xfce4-mount-plugin_1.1.5.bb} |  4 +--
>   2 files changed, 16 insertions(+), 18 deletions(-)
>   rename meta-xfce/recipes-panel-plugins/mount/{xfce4-mount-plugin_1.1.3.bb => xfce4-mount-plugin_1.1.5.bb} (57%)
> 
> diff --git a/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin/0001-check-for-fstab.h-during-configure.patch b/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin/0001-check-for-fstab.h-during-configure.patch
> index e2165c2fa..d81f70289 100644
> --- a/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin/0001-check-for-fstab.h-during-configure.patch
> +++ b/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin/0001-check-for-fstab.h-during-configure.patch
> @@ -14,38 +14,38 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   Patch Reworked for xfce4-mount-plugin 0.6.4->1.1.2
>   Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
>   ---
> - configure.ac           |  1 +
> + configure.ac           |  2 +
>    panel-plugin/devices.c | 22 +++++++++++++++++++---
> - 2 files changed, 20 insertions(+), 3 deletions(-)
> + 2 files changed, 21 insertions(+), 3 deletions(-)
>   
>   diff --git a/configure.ac b/configure.ac
> -index b131117..c633fef 100644
> +index 375e64a..590b7ad 100644
>   --- a/configure.ac
>   +++ b/configure.ac
> -@@ -69,6 +69,7 @@ AC_CHECK_HEADERS([sys/socket.h])
> - AC_CHECK_HEADERS([sys/time.h])
> - AC_CHECK_HEADERS([unistd.h])
> - AC_CHECK_HEADERS([sys/sockio.h])
> +@@ -65,6 +65,9 @@ dnl param.h is part of libc6 on Linux, but important for old-style Unix and espe
> + AC_CHECK_HEADERS([sys/param.h])
> + AC_CHECK_HEADERS([sys/mount.h])
> +
> ++dnl make musl happy
>   +AC_CHECK_HEADERS([fstab.h])
> - AC_HEADER_SYS_WAIT
> - AC_PROG_GCC_TRADITIONAL
> - AC_TYPE_SIZE_T
> ++
> + dnl Add -traditional to output variable CC if using the GNU C compiler and ioctl does not work properly without -traditional. That usually happens when the fixed header files have not been installed on an old system. Leave here commented out to comment in if some older *NIX systems might require it as was recently written on the ML.
> + dnl AC_PROG_GCC_TRADITIONAL
> +
>   diff --git a/panel-plugin/devices.c b/panel-plugin/devices.c
>   index 797b079..d29df56 100644
>   --- a/panel-plugin/devices.c
>   +++ b/panel-plugin/devices.c
> -@@ -24,8 +24,10 @@ Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
> - #ifdef HAVE_CONFIG_H
> +@@ -25,7 +25,9 @@ Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
>    #include <config.h>
>    #endif
> --
> +
>   +#if HAVE_FSTAB_H
>    #include <fstab.h>
>   +#endif
> -+
>    #include <glib.h>
>    #include <stdio.h>
> - #include <string.h>
> + #include <stdlib.h>
>   @@ -468,11 +470,12 @@ disks_new (gboolean include_NFSs, gboolean *showed_fstab_dialog, gint length)
>    {
>        GPtrArray * pdisks; /* to be returned */
> diff --git a/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.3.bb b/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.5.bb
> similarity index 57%
> rename from meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.3.bb
> rename to meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.5.bb
> index 4600104ad..1fb82b740 100644
> --- a/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.3.bb
> +++ b/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.5.bb
> @@ -6,6 +6,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>   
>   inherit xfce-panel-plugin
>   
> -SRC_URI += "file://0001-check-for-fstab.h-during-configure.patch"
> -SRC_URI[md5sum] = "2f1f903d0bdf6ee6776afd8af73497ac"
> -SRC_URI[sha256sum] = "aae5bd6b984bc78daf6b5fb9d15817a27253674a4264ad60f62ccb1aa194911e"
> +SRC_URI[sha256sum] = "584cd954929e542b3da0ff8d69e0325d8838dc39e7b32a509d1074ce3bb58ec2"
> 
> 
> 
> 
> 
