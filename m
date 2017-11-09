Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 22C5978499
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Nov 2017 09:16:53 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id k61so4922887wrc.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Nov 2017 01:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0P6XaGJhZ9F6IvwR9uFdQcqQ6em84CvV2FEUfv2F5Uk=;
	b=LHGPVh3FuajwO5BNvX/y6Xa3HQ4mKRx+XBBg1GT2C2RSI2SSkd5gKeVNHVFVVoV2J3
	1iZZuwynKefDeBFFV0aFFaWnuHxjK/xgE7J21Snr8dtLq/VxOR1TLzc0dUNbT9mjDhU6
	B9TESLDrH+h1uhUb5S+jCVGYHs9Hj+ExHu7bGJ6yVjSuzN/jD9WRPMiCg0ZejQHu26xA
	6DCzWaJzC4gZahfif7467DG+dbJTRC4bzVMHic+5rSF2TKreeUpD6iHzbJX6fGHi7eZx
	bRYXOvfcTWEKzCNelhrxPXcfjHVKjUF6hyi/s/kTnypSx01ZM7qTmA66SbvXsZti5DUl
	H2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0P6XaGJhZ9F6IvwR9uFdQcqQ6em84CvV2FEUfv2F5Uk=;
	b=c8HrUU0n41HeZ4AnFrMxpFkKNKb/zjQfx+o5yUJx6Z4tV5iRl5OLPT8X78a2q/Q0b+
	RISP0UjZ2b51k4UUoWizNjITH91FiJykUyTNh8Wp15kxUFOhVcG+mHfT3NakNJc7JVbA
	WAhmoDoCEznm4+7pKGpm+8DoEYlBix9ELKy/V3qwfv10MA+IREOJJZlytgLC9gFLsq/E
	o1v9Gh6tHNvXeu2XkXlig7WhJzMqBip35WFsQBEcOJhUeWZd3b/CnZ7IrW0+X/r/FIkS
	y/8SslWHgc+CzfGFJz3fpU87LGr7KDoE8xsVOgi2BdC3nro97/W4M0xSTJ0L1+rsCM1f
	R0EA==
X-Gm-Message-State: AJaThX6dETcQY1A7pVBq8iPmXWmouj3sCjgqka5YkC5jxWU4C4C2QRsZ
	4kP+I57DDVRjm7guozuu9ui2bV7sDvdXtukm8tQ=
X-Google-Smtp-Source: ABhQp+RImlTKTxphTGteoaDdfxBhnKD8atGERX/VBHPfuEmx0WKzwfEJpeGMi/Y73LYQSnQgzNGHkyWmkM2nX5xEFx4=
X-Received: by 10.223.158.129 with SMTP id a1mr2715519wrf.179.1510219014630;
	Thu, 09 Nov 2017 01:16:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Thu, 9 Nov 2017 01:16:54 -0800 (PST)
In-Reply-To: <55eb9098-4794-addc-b7b1-150da89a56de@windriver.com>
References: <1508833184-28676-1-git-send-email-Qi.Chen@windriver.com>
	<55eb9098-4794-addc-b7b1-150da89a56de@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 9 Nov 2017 10:16:54 +0100
Message-ID: <CA+chaQf_iD91Umqtkk5DQA9m_5DQJQKaY2MG8oowhiq9QOGRYg@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] gnome-common: add PACKAGECONFIG for autoconf-archive
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
X-List-Received-Date: Thu, 09 Nov 2017 09:16:54 -0000
Content-Type: text/plain; charset="UTF-8"

gnome-common is marked as allarch, autoconf-archive isn't. So gnome-common
cannot depend on it as it is now.

This change causes:

 === Comparing signatures for task do_configure.sigdata between qemux86 and
qemux86copy ===
ERROR: gnome-common different signature for task do_configure.sigdata
between qemux86 and qemux86copy
runtaskdeps changed:
gnome-common/gnome-common_3.18.0.bb.do_prepare_recipe_sysroot with hash
f3130e0be68211325008e37b3d49460b
 changed to
gnome-common/gnome-common_3.18.0.bb.do_prepare_recipe_sysroot with hash
0360cfa01ddf508a7670af2fcb306e20
Hash for dependent task
gnome-common/gnome-common_3.18.0.bb.do_prepare_recipe_sysroot changed from
f3130e0be68211325008e37b3d49460b to 0360cfa01ddf508a7670af2fcb306e20


On Tue, Nov 7, 2017 at 3:10 AM, ChenQi <Qi.Chen@windriver.com> wrote:

> ping
>
>
> On 10/24/2017 04:19 PM, Qi.Chen@windriver.com wrote:
>
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Add PACKAGECONFIG for autoconf-archive. Default to enable it to avoid
>> m4 file conflicts between gnome-common and autoconf-archive.
>>
>> e.g.
>> IMAGE_INSTALL_append = " gnome-common autoconf-archive-dev"
>> bitbake <image>
>>
>> We enable autoconf-archive PACKAGECONFIG to avoid the following error.
>>
>> Error: Transaction check error:
>>    file /usr/share/aclocal/ax_check_enable_debug.m4 conflicts between
>> attempted installs of gnome-common-3.18.0-r0.noarch and
>> autoconf-archive-dev-2016.09.16-r0.core2_64
>>    file /usr/share/aclocal/ax_code_coverage.m4 conflicts between
>> attempted installs of gnome-common-3.18.0-r0.noarch and
>> autoconf-archive-dev-2016.09.16-r0.core2_64
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
>> b/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
>> index 06f3bb3..d874164 100644
>> --- a/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
>> +++ b/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
>> @@ -14,6 +14,10 @@ SRC_URI[archive.sha256sum] =
>> "22569e370ae755e04527b76328befc4c73b62bfd4a572499fd
>>   EXTRA_AUTORECONF = ""
>>   DEPENDS = ""
>>   +# Default to enable autoconf-archive to avoid conflicts
>> +PACKAGECONFIG ??= "autoconf-archive"
>> +PACKAGECONFIG[autoconf-archive] = "--with-autoconf-archive,
>> --without-autoconf-archive, autoconf-archive"
>> +
>>   FILES_${PN} += "${datadir}/aclocal"
>>   FILES_${PN}-dev = ""
>>
>>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

