Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id B17A562135
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Nov 2016 22:24:37 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id q130so195256080qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Nov 2016 14:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XnNbOqK3aRMl8+5DfQT+nL1gMFs+6gaDa5dfxgTx/yo=;
	b=dedpS3Lc27TgjcXz5706sF0jnSyM90X09f9gVhMySzhaizNs0SJ5rbpt80J0RprzuQ
	2NK+kBJ5bO+dBMm8wfOcRfk6xHb9MfHKIakWitDyLI1FC9BSVuRR8ELpWczet6Qf/G+z
	S1yfONfK/2cHon0XTJT5f3BbvhWq928C8HyTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XnNbOqK3aRMl8+5DfQT+nL1gMFs+6gaDa5dfxgTx/yo=;
	b=N6Z/ebPMrO4TjLEqt3SoqgsLtCT6nB851woGUIEz1UFkIlaKyVA88QQH2pM0LVUJpz
	va7sMcDvPb1OeuQztQSH/RI7JZSresTqVVjoZuBDXk5MxBUZP/T/n4Ccd7K6v1gbtDrw
	Tg+SVIGa36sOzxlJEoij04RMKhUFGoIqZzD2JMO5O9UAOtgaklJ8zEZ+0E68tkhnBia/
	o2/9t4i98S/GwzF++bo3S3KLuUuZ0UR+yxuGdRH324OAr/BSCJ4IHlOgGXF3ls0iFSA+
	ZyeY65pkzUG9u4Yuwt05jPyLcANqUThq/ANn4X6gsA/P1DDMxjbB8qe/G41uc1IVqKlj
	ogFw==
X-Gm-Message-State: AKaTC00Lbs1RsREqXtKUrBYni2UWdAMpPwsVZJ4kEvQOVXzLLLU2SEcsyVbBl7J6uDlmtJntEb2uMacHJ92XZi2A
X-Received: by 10.55.169.202 with SMTP id s193mr7065170qke.231.1479335078663; 
	Wed, 16 Nov 2016 14:24:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.104.102 with HTTP; Wed, 16 Nov 2016 14:24:18 -0800 (PST)
In-Reply-To: <1477033819-18461-1-git-send-email-koen.kooi@linaro.org>
References: <1477033819-18461-1-git-send-email-koen.kooi@linaro.org>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 16 Nov 2016 23:24:18 +0100
Message-ID: <CAP71WjzoO=SaNX-ck0Oj0rpJ18qq00FoUt2BsPFQZR40Jmh9OQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [meta-oe][PATCH] android-tools: fix native build
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
X-List-Received-Date: Wed, 16 Nov 2016 22:24:37 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 21, 2016 at 9:10 AM, Koen Kooi <koen.kooi@linaro.org> wrote:
> +    if [ grep -q "ext4_utils" "${TOOLS}" ] ; then
> +        install -D -p -m0755 ${S}/system/core/libsparse/simg_dump.py ${D}${bindir}/simg_dump
> +        install -D -p -m0755 ${S}/system/extras/ext4_utils/mkuserimg.sh ${D}${bindir}/mkuserimg
> +
> +        install -m0755 ${B}/ext4_utils/ext2simg ${D}${bindir}
> +        install -m0755 ${B}/ext4_utils/ext4fixup ${D}${bindir}
> +        install -m0755 ${B}/ext4_utils/img2simg ${D}${bindir}
> +        install -m0755 ${B}/ext4_utils/make_ext4fs ${D}${bindir}
> +        install -m0755 ${B}/ext4_utils/simg2img ${D}${bindir}
> +        install -m0755 ${B}/ext4_utils/simg2simg ${D}${bindir}
> +    fi
> +
> +    if [ grep -q "adb " "${TOOLS}" ] ; then
> +        install -m0755 ${B}/adb/adb ${D}${bindir}i
> +    fi
> +
> +    if [ grep -q "adbd" "${TOOLS}" ] ; then
> +        install -m0755 ${B}/adbd/adbd ${D}${bindir}
> +        install -D -p -m0644 ${WORKDIR}/android-tools-adbd.service \
> +          ${D}${systemd_unitdir}/system/android-tools-adbd.service
> +    fi
> +
> +    if [ grep -q "fastboot" "${TOOLS}" ] ; then
> +        install -m0755 ${B}/fastboot/fastboot ${D}${bindir}
> +    fi
> +
> +    if [ grep -q "mkbootimg" "${TOOLS}" ] ; then
> +         install -m0755 ${B}/mkbootimg/mkbootimg ${D}${bindir}
> +    fi

sorry to notice that just now.. but how can this work? the 'grep'
statements above are wrong and non functional. I was trying to build
the recipe and noticed that no files get installed. The current
implementation will lead to:

$ grep "ext4_utils" "adb fastboot ext4_utils mkbootimg adbd"
grep: adb fastboot ext4_utils mkbootimg adbd: No such file or directory

Both the target and -native build fails, with target build i end up
with this error

ERROR: android-tools-5.1.1.r37-r0 do_package:
SYSTEMD_SERVICE_android-tools value android-tools-adbd.service does
not exist
ERROR: android-tools-5.1.1.r37-r0 do_package: Function failed:
systemd_populate_packages

I suppose it was tested without systemd , so there was no obvious
error, but the resulting packages were empty..

I also needed to add libcap in DEPENDS, to get the compile task to work.

nico

