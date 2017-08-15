Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f172.google.com (mail-ua0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2B1BC78305
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 13:29:54 +0000 (UTC)
Received: by mail-ua0-f172.google.com with SMTP id 80so2905986uas.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 06:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xMZXDaYiNR/GmQqavyobMUnoOo78doCOwX0hFzlngwU=;
	b=Jzj6g0VA7ZqVlUZg0519iJv/ncGERgHesLsXiFSc+mcP0WpJvJo8DDOEADD4xFWl84
	E1YogfBm98r22Q7IcyKjg382vJVuWAu4fVNoeLbNjUuPThI5jmdwNSHEzxPI8d+aNcUT
	apDUGcCVjE+EoxZAxhqgmMizuupa68odectt2x/5DpeiZY+MssyB049HilGFvB+k9RkE
	hvF+B1Yn39NEPQ8W26pXArubvIDzk7bVk7efPL2tpytTXiLGBI3jAGQDgObnqNMZA9V0
	tymxxrbqa23IzJIySib6SgS0AjXkc6OX8RGylYzxlWOlNDk3ifmXoaSRCqsMa/sIAyNt
	P99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xMZXDaYiNR/GmQqavyobMUnoOo78doCOwX0hFzlngwU=;
	b=A/0HthR8EvanRS8qcdjgTnH/j9/nx3aulxYftAKs044/YJno0KxHe2m353jbVttN1O
	0zzIQ2exsiPj3lPmDdXO0bR0DSykkJ11NYhFtr2mbsHtTe6mOZR00HuIt9Qglb0vXOsb
	icvSLvMDlhSTdoMdEQD2F0dFxWiEmTEep3fS1Qp3HP5xeVStM0xyoaygZcD493o8Vnhr
	6CEyIIPkFtlgIbG2Ew7Y5Ud8HHy3gTFD0uhzAw0exsHziF/n+yap/fdGaWuZsFPcVZFF
	Tr2+4d2AFiLTNBzv7TbThReJuwGgxr+2f8TYgGGPgQe9oMJwBc7JIVI0Fkx+JiyeqUpa
	pl0Q==
X-Gm-Message-State: AHYfb5ikDJQv630jXzl6aDzaI+IGBH/xhPUa+tKIkhhlWC5b/eMqZR8c
	EGTsbJf5DF6EU84dwe4yHlnkye/JQg==
X-Received: by 10.176.2.68 with SMTP id 62mr19199826uas.202.1502803796038;
	Tue, 15 Aug 2017 06:29:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Tue, 15 Aug 2017 06:29:55 -0700 (PDT)
In-Reply-To: <1502641460-4734-1-git-send-email-akuster808@gmail.com>
References: <1502641460-4734-1-git-send-email-akuster808@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 15 Aug 2017 15:29:55 +0200
Message-ID: <CA+chaQfd6hstxT-wDWYuY_Pu+3=CEm9vh_V52qwAsWw+mRaVCw@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][master][pyro] 1/2] libmtp: fix build issue
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
X-List-Received-Date: Tue, 15 Aug 2017 13:29:55 -0000
Content-Type: text/plain; charset="UTF-8"

The subject doesn't contain PATCH, that's probably the reason why both
these patches, didn't make it to patchwork, please resend.

On Sun, Aug 13, 2017 at 6:24 PM, Armin Kuster <akuster808@gmail.com> wrote:

> DEBUG: Executing shell function BUILDSPEC
> | error: line 109: %package -n mtp-tools: package mtp-tools already exists
>
> Yes, there are two entries in libmtp.spec. Under packages-split, mtp-tools
> is empty but
> libmtp-bin is not.
>
> Removed PKG_${PN}-bin , this alignes how Debian split its packages
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
> b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
> index b5df8e0..c05ff4e 100644
> --- a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
> +++ b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
> @@ -50,9 +50,6 @@ PACKAGES =+ "libmtp-common libmtp-runtime mtp-tools"
>  RDEPENDS_${PN} += "libmtp-common"
>  RRECOMMENDS_${PN} += "libmtp-runtime mtp-tools"
>  FILES_${PN}-dbg += "${nonarch_base_libdir}/udev/.debug/*"
> -PKG_${PN}-bin = "mtp-tools"
> -SUMMARY_${PN}-bin = "Tools for communicating with MTP devices"
> -DESCRIPTION_${PN}-bin = "${DESCRIPTION}\nThis package contains tools for
> communicating with MTP devices."
>  FILES_libmtp-common = "${nonarch_base_libdir}/udev/rules.d/*"
>  SUMMARY_libmtp-common = "The udev rules file for MTP devices"
>  FILES_libmtp-runtime = "${nonarch_base_libdir}/udev/mtp-probe"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

