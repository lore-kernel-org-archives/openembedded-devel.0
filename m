Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0DDB277BD9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Apr 2017 13:05:20 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id d79so82916wmi.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Apr 2017 06:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QZN9HkoVXh9hP81Ao9/1jie04duqiqe8fTBjA4qIRNo=;
	b=E0RyJvHxdIywTfnOzgLISnXfO25DT+pMR+r25cRIdldEnVvPtOoW5NrbNNX2dmszUc
	+9s5oPUwEerjLQTGCoTaGM7G19WLR9kH689pPGrBswQPUHAdtD3QeXQnUcCJ/wyDaWk8
	FPxl9eSQ27CcpCVMpVAA8ifCK4hNE8kIETMSXKZhPgrAz8AGdVcuX0dIHD4ba1KUdbtF
	ke0v/fjl3qVjjb+rKk5bAxy7yAf2V05V6Qnnczg0sZ9MRookOtHsGbk4OcFl5175JXha
	a6QuoaaJIIow5HsAj4NX8sgViTNHUNRke0r94Lu4ILqYeni2M8P5PgUiAxE4Af6kNhBq
	pBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QZN9HkoVXh9hP81Ao9/1jie04duqiqe8fTBjA4qIRNo=;
	b=FPSyG0Y3XAWk/ZMDWfoAlRbFSTf5kpNaHbxuGZPE8LZ1cxSvS8SCsywLvCc2s8fxPr
	hL/fuy8QsnX5LijuUUVxCx6DO00FqDyV8Yh6H1kUawWVP6EvegEIfkmuqrfxh685eBVk
	3I3pLgOPXQ+euKZ4DoPkOtyoekpPlASBDv2+wB522kZuy7dP2U0SAN5WNEHHxfZrzPkq
	ZwLpCK44fYQdP1efm8moVaUm/rwK/KakzcZftA6YWdfkGste4btwXZn2bk+PmojSyCf4
	BiwH6kPpn3NU1clc5X4E0ixbnOC99gmjQ0dDw/jqcT8SRAP7QCSOIKQ2PL/qzYgjvnjz
	MQ6Q==
X-Gm-Message-State: AN3rC/4Xvc29wJhbJ74Vzea9BWZu3z0PPGCvZetFbmZM97oApXikuvGr
	dEafzVcy+i8A6NIQmYnKi6tsTGYmrw==
X-Received: by 10.28.175.209 with SMTP id y200mr7751126wme.81.1491915921769;
	Tue, 11 Apr 2017 06:05:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.54 with HTTP; Tue, 11 Apr 2017 06:05:20 -0700 (PDT)
In-Reply-To: <20170411124642.12647-1-fgiovanardi@aragnet.com>
References: <20170411124642.12647-1-fgiovanardi@aragnet.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 11 Apr 2017 15:05:20 +0200
Message-ID: <CA+chaQd8smC4BTwCKSFyJnxU1c+CDmCukiTRTL3qqPC7CqDDXA@mail.gmail.com>
To: Federico Giovanardi <fgiovanardi@aragnet.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] picocom: Fix incorrect handling of ldflags
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
X-List-Received-Date: Tue, 11 Apr 2017 13:05:22 -0000
Content-Type: text/plain; charset=UTF-8

I think It's already fixed in Khem's upgrade to 2.2 version.

On Tue, Apr 11, 2017 at 2:46 PM, Federico Giovanardi <
fgiovanardi@aragnet.com> wrote:

> The previous version reports QA issue: no GNU_HASH in elf binary
> during build
>
> Signed-off-by: Federico Giovanardi <fgiovanardi@aragnet.com>
> ---
>  meta-oe/recipes-support/picocom/picocom_1.7.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-support/picocom/picocom_1.7.bb
> b/meta-oe/recipes-support/picocom/picocom_1.7.bb
> index dbee65609..c85c344e3 100644
> --- a/meta-oe/recipes-support/picocom/picocom_1.7.bb
> +++ b/meta-oe/recipes-support/picocom/picocom_1.7.bb
> @@ -10,6 +10,7 @@ SRC_URI[md5sum] = "8eaba1d31407e8408674d6e57af447ef"
>  SRC_URI[sha256sum] = "d0f31c8f7a215a76922d30c81a52b9
> a2348c89e02a84935517002b3bc2c1129e"
>
>  CPPFLAGS_append = '-DVERSION_STR=\\"${PV}\\"
> -DUUCP_LOCK_DIR=\\"/var/lock\\" -DHIGH_BAUD'
> +TARGET_CC_ARCH += "${LDFLAGS}"
>
>  do_install () {
>      install -d ${D}${bindir}
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

