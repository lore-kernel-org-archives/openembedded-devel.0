Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9A232719AA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2016 02:46:16 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id 83so2162998vkd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2016 19:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=xDVISCgBYZBx/hohOxClc8tMXhTrY3EFGKNbEErwFR8=;
	b=cq5qN80bPrK6S1kc84IPHaoxIpg81eWC2LUjkMmc883zubin1T7ds91X7yIQB9wEji
	xGKNJyLiyotwIIVY3nHA0UZPzZY60XMIvnjyH0p7X+OI7+H2oAw9r0OHzGIAZKlmBFoU
	vEyQW/dby94ZdL1PIbqITFWi/hS/RTkc2tW4s/OD2E0CImGsJz09YnqizndQqOmagmQ0
	iE+AS39XCYYF8TU+eg3zSsiWuyQN1ryMQDr5ZwYVOBHaGYP16Ywnge2lbmJ2sOfBLZHD
	KZo9DTGaOOAKypV5LsQvInfjxGbk8UGNJFgleW408ywZ8+3WQkGpPmcp2/YTe/fG4+6n
	jxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=xDVISCgBYZBx/hohOxClc8tMXhTrY3EFGKNbEErwFR8=;
	b=HW0EUebrEI+r2Ofc8/5KQsIgZXHPCpVSXMxjO0V/0bGGrouHtHXz0ztprWVl2OtFlW
	8oC0vLnjuPaNnBM5B7p2LLdmkHTPiHUTzv9OAwnJ2GVrVq78pJkBDcIaRAwuHDZgY2fG
	9gtPNeEl7Gk9vrR3lWu9FYuGTg/OEybrClqdyqBJZmxJI6eh1Nsyq2RT3ihcP8uPCndM
	nuFXk1Jg2BUpUfsBglY3+gE3mW4+7iWwOEGd7pLIU47vJQiu9VyMkpVapjswYRJHzeZ7
	kBR5Q+v86Rlx9I0hIa15RWOodmdQOhUJLESKYwUZNXS1KXwtoZMsVXqPHbfDWEHWJL+U
	ahzQ==
X-Gm-Message-State: AA6/9Rn6KmabNe85J740ta+6N7FREMJEP+6KxJzVskggUoJaFfr+Ux3nDJDJc3bUkEZH1QNUkjfLoNshCCn6BQ==
X-Received: by 10.31.138.143 with SMTP id m137mr8751349vkd.148.1476931577068; 
	Wed, 19 Oct 2016 19:46:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Wed, 19 Oct 2016 19:45:46 -0700 (PDT)
In-Reply-To: <19eb06e8-4ffe-0ac9-85a2-4cef58dbd5c6@gmail.com>
References: <20161019053834.11523-1-raj.khem@gmail.com>
	<20161019053834.11523-2-raj.khem@gmail.com>
	<19eb06e8-4ffe-0ac9-85a2-4cef58dbd5c6@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Oct 2016 19:45:46 -0700
Message-ID: <CAMKF1spGy=uWAEhrJcMZ72RbXE3V3ndsCmRCsruCWDSxMUdzyg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Thu, 20 Oct 2016 02:46:17 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 19, 2016 at 1:09 PM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 10/18/2016 10:38 PM, Khem Raj wrote:
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
>
> Is this or any of the other fixes applicable to Morty?

I believe so.

>
> - armin
>
>> ---
>>   meta-gnome/recipes-gnome/bonobo/libbonobo.inc      |  2 +-
>>   .../libbonobo/fix-nonliteral-in-string.patch       | 26
>> ++++++++++++++++++++++
>>   .../recipes-gnome/bonobo/libbonobo_2.32.1.bb       |  1 +
>>   3 files changed, 28 insertions(+), 1 deletion(-)
>>   create mode 100644
>> meta-gnome/recipes-gnome/bonobo/libbonobo/fix-nonliteral-in-string.patch
>>
>> diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
>> b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
>> index e0f6168..60a8597 100644
>> --- a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
>> +++ b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
>> @@ -3,7 +3,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f
>> \
>>
>> file://COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
>>   SECTION = "x11/gnome/libs"
>> -DEPENDS = "glib-2.0 orbit2 intltool-native libxml2 dbus dbus-glib"
>> +DEPENDS = "glib-2.0 orbit2-native orbit2 intltool-native libxml2 dbus
>> dbus-glib"
>>     inherit gnomebase gtk-doc lib_package
>>   diff --git
>> a/meta-gnome/recipes-gnome/bonobo/libbonobo/fix-nonliteral-in-string.patch
>> b/meta-gnome/recipes-gnome/bonobo/libbonobo/fix-nonliteral-in-string.patch
>> new file mode 100644
>> index 0000000..20db671
>> --- /dev/null
>> +++
>> b/meta-gnome/recipes-gnome/bonobo/libbonobo/fix-nonliteral-in-string.patch
>> @@ -0,0 +1,26 @@
>> +This checks whether the format string is a literal on the calling
>> function. As bonobo_debug_print()
>> +takes already a va_list, we specify the format on the functions that call
>> it
>> +The second number, which is 0 here, should then be the argument index of
>> the variadic argument
>> +
>> +Fixed warning with clang
>> +
>> +| ../../libbonobo-2.32.1/bonobo/bonobo-debug.c:58:32: error: format
>> string is not a string literal [-Werror,-Wformat-nonliteral]
>> +|         vfprintf (_bonobo_debug_file, fmt, args);
>> +|                                       ^~~
>> +| 1 error generated.
>> +
>> +Upstream-Status: Pending
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +
>> +Index: libbonobo-2.32.1/bonobo/bonobo-debug.c
>> +===================================================================
>> +--- libbonobo-2.32.1.orig/bonobo/bonobo-debug.c
>> ++++ libbonobo-2.32.1/bonobo/bonobo-debug.c
>> +@@ -47,6 +47,7 @@ bonobo_debug_init(void)
>> +         _bonobo_debug_file = stderr;
>> + }
>> +
>> ++__attribute__((__format__ (printf, 2, 0)))
>> + void
>> + bonobo_debug_print (const char *name, char *fmt, ...)
>> + {
>> diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb
>> b/meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb
>> index fd4d812..8e00eb4 100644
>> --- a/meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb
>> +++ b/meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb
>> @@ -2,6 +2,7 @@ require libbonobo.inc
>>     SRC_URI += "file://0001-Remove-use-of-G_DISABLE_DEPRECATED.patch \
>>               file://do-not-use-srcdir-variable.patch \
>> +            file://fix-nonliteral-in-string.patch \
>>              "
>>   SRC_URI[archive.md5sum] = "27fa902d4fdf6762ee010e7053aaf77b"
>>   SRC_URI[archive.sha256sum] =
>> "9160d4f277646400d3bb6b4fa73636cc6d1a865a32b9d0760e1e9e6ee624976b"
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

