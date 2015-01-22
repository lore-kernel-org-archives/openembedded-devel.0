Return-Path: <akuster808@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4CC8C71637
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jan 2015 17:42:35 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id tr6so2685857ieb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jan 2015 09:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=2dtwA/A/7Iuo364+FutpQjIO+Yx0youICrfT6YgspFA=;
	b=nt1WW2BXu5Rn0WM1RVBtnU75CAw7UGlhJj8QLGoIrzlTOrKn6OujyboyHb+h4RTFwu
	NAtGKBkE/yF1v7JBghJbQzBik2dZycXm9ba9Z6U34gU05UONTylk+opt2YbRsRG58w8S
	GO/GIm1fqbD6N7ZiZqJHA8rBloMFkqGS2DNRGL4RmwGAHFmB1x+eCmXrU7XKL9mzrSRT
	C+tgiqhJhYiJ/XbyxQ8K4/wW+/K4gpv1+AUt+9bFAHp5WFipYIKTY3v4MS+E2iKSMA66
	Hc5cWATUD75++j7Re/6oighUpkeF+nzUJMh+kXXleo4zZmDW49gSsRmA9vxRS6iMuo+I
	NONw==
X-Received: by 10.50.28.8 with SMTP id x8mr5467795igg.19.1421948556209;
	Thu, 22 Jan 2015 09:42:36 -0800 (PST)
Received: from ?IPv6:2601:c:a700:272f:6d69:9818:2032:d6ab?
	([2601:c:a700:272f:6d69:9818:2032:d6ab])
	by mx.google.com with ESMTPSA id n4sm3259546igr.15.2015.01.22.09.42.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Jan 2015 09:42:35 -0800 (PST)
Message-ID: <54C13681.1090905@gmail.com>
Date: Thu, 22 Jan 2015 09:42:25 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1417166024-2366-1-git-send-email-Qi.Chen@windriver.com>
	<54BF7E14.3080401@digi.com>
In-Reply-To: <54BF7E14.3080401@digi.com>
Subject: Re: [Dizzy backport] [meta-oe][PATCH] xmlto: remove recipe as it's in OE core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Jan 2015 17:42:44 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

will do.

- armin

On 01/21/2015 02:23 AM, Javier Viguera wrote:
> Hi all,
>
> Poky/OE-core added xmlto for Dizzy, but in meta-oe it has only been
> removed in master so for Dizzy the recipe is duplicated:
>
> $ bitbake-layers show-overlayed
> xmlto:
>    meta-oe              0.0.25
>    meta                 0.0.25
>
> Could this removal patch be backported?
>
> -
> Regards,
>
> Javier Viguera
>
>
> On 28/11/14 10:13, Chen Qi wrote:
>> Remove xmlto recipe from meta-oe because it's in OE core now.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   .../xmlto-0.0.25/obsolete_automake_macros.patch    |   12 ------------
>>   meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb      |   18
>> ------------------
>>   2 files changed, 30 deletions(-)
>>   delete mode 100644
>> meta-oe/recipes-support/xmlto/xmlto-0.0.25/obsolete_automake_macros.patch
>>   delete mode 100644 meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb
>>
>> diff --git
>> a/meta-oe/recipes-support/xmlto/xmlto-0.0.25/obsolete_automake_macros.patch
>> b/meta-oe/recipes-support/xmlto/xmlto-0.0.25/obsolete_automake_macros.patch
>>
>> deleted file mode 100644
>> index faa8acc..0000000
>> ---
>> a/meta-oe/recipes-support/xmlto/xmlto-0.0.25/obsolete_automake_macros.patch
>>
>> +++ /dev/null
>> @@ -1,12 +0,0 @@
>> -diff -Nurd xmlto-0.0.25/configure.in xmlto-0.0.25/configure.in
>> ---- xmlto-0.0.25/configure.in    2011-12-01 17:49:00.000000000 +0200
>> -+++ xmlto-0.0.25/configure.in    2013-01-07 05:24:16.169953519 +0200
>> -@@ -1,7 +1,7 @@
>> - AC_INIT(xmlto, 0.0.25)
>> - AC_CONFIG_SRCDIR(xmlto.spec.in)
>> - AM_INIT_AUTOMAKE([dist-bzip2 subdir-objects 1.6])
>> --AM_CONFIG_HEADER(config.h)
>> -+AC_CONFIG_HEADERS(config.h)
>> -
>> - AC_PROG_CC
>> - AM_PROG_CC_C_O
>> diff --git a/meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb
>> b/meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb
>> deleted file mode 100644
>> index 9188c8a..0000000
>> --- a/meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb
>> +++ /dev/null
>> @@ -1,18 +0,0 @@
>> -SUMMARY = "A shell-script tool for converting XML files to various
>> formats"
>> -HOMEPAGE = "https://fedorahosted.org/xmlto/"
>> -SECTION = "docs/xmlto"
>> -LICENSE = "GPLv2"
>> -
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
>> -
>> -PR = "r1"
>> -
>> -SRC_URI =
>> "https://fedorahosted.org/releases/x/m/xmlto/xmlto-${PV}.tar.gz \
>> -           file://obsolete_automake_macros.patch \
>> -"
>> -SRC_URI[md5sum] = "a88cd3f08789b4825d1ac89fa065170d"
>> -SRC_URI[sha256sum] =
>> "c52b56d929e8d20fc19cd3b7ec238f8d039730c56ee311cc352e843147e3e31a"
>> -
>> -inherit autotools
>> -
>> -BBCLASSEXTEND = "native nativesdk"
>>
>
>

