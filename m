Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9A05271AD9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2016 20:09:26 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id r16so3283818pfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2016 13:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=YpY5qe+xYvaVR86Zphuzk8zWwqDjgoS97yignlq+Hl8=;
	b=Wl3SRFpMr99F1qZz4/uOG8oUwS45BYKOung/Kb2ipGY8qaNDLzoAp6TPsp2FTNjLTi
	S0wREs9H+H31gpIvfECzEuGaRFY0YH1L0FruygTAC/eicGgOgVL2m7BIGDaE58AQ8Jwh
	3uw4l/yPgGnLYzTQzqOk/6am6cogDZaD3bz0GdpttVBDecvNJm2VgyMxwryX8dO3JMqv
	Qq/ZseIWgIFyfJtvsaVKazcSwhz/I1Vfk6BB6o/TvHnVc2Iga5INcpsLQ0iDSQf1qHqS
	DKxAUGHr6CutfJbUZGSLyl8R7sSxpkZIyKmzUq00r7p00xThYj4gGLXq9gbi/pG/lRHi
	5ThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=YpY5qe+xYvaVR86Zphuzk8zWwqDjgoS97yignlq+Hl8=;
	b=UDARQI/dI8gg1AMsqWh2RWJ1B/OLnqIMbILFzpqqF4dSKNfvlnHEsznb5S+MX0kpJ6
	PaEWwIJ7cpCM889tcYkJnU2ALHgUohMgZ0hTPGLn0d/ioRYEcvAy5re15fo4xABh8XyZ
	JyH1t/1RwddvoPyOvepgFPDBGPrNkN5y38U7DfRIPDWDyUCSRJphAPSghhAjzL6ZFEh4
	K3THA3Px3vATMzguvrBRw7xSHfKL61ofQk8gOTLpBKhlf2oYE0OR1gyxMqMF0EyvnaW4
	gLFM9K/YFbBrlmg5tBrePsD3tYgiOsy2L/yCBXRM9xSlTzBgvlza+oBgKqhO0EXkyzPx
	go4Q==
X-Gm-Message-State: AA6/9Rk+TaFqvLkahI5mUnCo82rmLRpVvbeNP2tEJbeCyMujKl4D8btqW4JfasoHBW0IaA==
X-Received: by 10.98.205.207 with SMTP id o198mr14285780pfg.114.1476907768280; 
	Wed, 19 Oct 2016 13:09:28 -0700 (PDT)
Received: from [10.22.11.1] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156]) by smtp.gmail.com with ESMTPSA id
	bu9sm29038570pab.25.2016.10.19.13.09.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Oct 2016 13:09:27 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <20161019053834.11523-1-raj.khem@gmail.com>
	<20161019053834.11523-2-raj.khem@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <19eb06e8-4ffe-0ac9-85a2-4cef58dbd5c6@gmail.com>
Date: Wed, 19 Oct 2016 13:09:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20161019053834.11523-2-raj.khem@gmail.com>
Subject: Re: [meta-gnome][PATCH 02/16] libbonobo: Fix missing dep on orbit2-native and build with clang
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
X-List-Received-Date: Wed, 19 Oct 2016 20:09:27 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 10/18/2016 10:38 PM, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Is this or any of the other fixes applicable to Morty?

- armin
> ---
>   meta-gnome/recipes-gnome/bonobo/libbonobo.inc      |  2 +-
>   .../libbonobo/fix-nonliteral-in-string.patch       | 26 ++++++++++++++++++++++
>   .../recipes-gnome/bonobo/libbonobo_2.32.1.bb       |  1 +
>   3 files changed, 28 insertions(+), 1 deletion(-)
>   create mode 100644 meta-gnome/recipes-gnome/bonobo/libbonobo/fix-nonliteral-in-string.patch
>
> diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
> index e0f6168..60a8597 100644
> --- a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
> +++ b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
> @@ -3,7 +3,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>                       file://COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
>   SECTION = "x11/gnome/libs"
> -DEPENDS = "glib-2.0 orbit2 intltool-native libxml2 dbus dbus-glib"
> +DEPENDS = "glib-2.0 orbit2-native orbit2 intltool-native libxml2 dbus dbus-glib"
>   
>   inherit gnomebase gtk-doc lib_package
>   
> diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo/fix-nonliteral-in-string.patch b/meta-gnome/recipes-gnome/bonobo/libbonobo/fix-nonliteral-in-string.patch
> new file mode 100644
> index 0000000..20db671
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/bonobo/libbonobo/fix-nonliteral-in-string.patch
> @@ -0,0 +1,26 @@
> +This checks whether the format string is a literal on the calling function. As bonobo_debug_print()
> +takes already a va_list, we specify the format on the functions that call it
> +The second number, which is 0 here, should then be the argument index of the variadic argument
> +
> +Fixed warning with clang
> +
> +| ../../libbonobo-2.32.1/bonobo/bonobo-debug.c:58:32: error: format string is not a string literal [-Werror,-Wformat-nonliteral]
> +|         vfprintf (_bonobo_debug_file, fmt, args);
> +|                                       ^~~
> +| 1 error generated.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Index: libbonobo-2.32.1/bonobo/bonobo-debug.c
> +===================================================================
> +--- libbonobo-2.32.1.orig/bonobo/bonobo-debug.c
> ++++ libbonobo-2.32.1/bonobo/bonobo-debug.c
> +@@ -47,6 +47,7 @@ bonobo_debug_init(void)
> + 	  _bonobo_debug_file = stderr;
> + }
> +
> ++__attribute__((__format__ (printf, 2, 0)))
> + void
> + bonobo_debug_print (const char *name, char *fmt, ...)
> + {
> diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb b/meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb
> index fd4d812..8e00eb4 100644
> --- a/meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb
> +++ b/meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb
> @@ -2,6 +2,7 @@ require libbonobo.inc
>   
>   SRC_URI += "file://0001-Remove-use-of-G_DISABLE_DEPRECATED.patch \
>               file://do-not-use-srcdir-variable.patch \
> +            file://fix-nonliteral-in-string.patch \
>              "
>   SRC_URI[archive.md5sum] = "27fa902d4fdf6762ee010e7053aaf77b"
>   SRC_URI[archive.sha256sum] = "9160d4f277646400d3bb6b4fa73636cc6d1a865a32b9d0760e1e9e6ee624976b"


