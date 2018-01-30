Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 557DE7884B;
	Tue, 30 Jan 2018 14:27:14 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id a1so11381643wri.5;
	Tue, 30 Jan 2018 06:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=U2w0hH0Yw14bN6VkvV/S6r7VbD6kLRZBFh2yHVLsE7U=;
	b=krCqDuZLnd/NUbi9sNasi6pEYcwW7vWp05F9KRbT16C40TzHqhoEU35gczEictTbKh
	m7akgj2/wjLZ7nU9juA/+BKdw1JfaxwviywCPepTOrXIr7/kKv/3ts88sVfh80zuLRUo
	wljmwLUkVsAf5+cwJp+RCAOuokOFHlSY7daVeL2D3c1Ia4Jo4W7Kmk/qG0KC5CYWfQES
	r0m3cE83QnpdgzhDvwOi/ubYU/a4CG8935bXG2OS6zWpBDX+1U+bInwrGlqC8BhSEnQo
	SAl0HDxNyZeiSBG9yTxdpXkYzfIZgzJhAxTUEY4oSrjAxAEyH8S/raDrFYBG9exP1wKV
	njlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=U2w0hH0Yw14bN6VkvV/S6r7VbD6kLRZBFh2yHVLsE7U=;
	b=uj2AKzr1R9lFfwOMldM0ZTTvB3QphNwmSiANLTrFYuV1992uVtizOGw9Hz+RsGOQkK
	EqryD8TdkkvOW5CNcMfIU0O5nI9qJsQltl3zCcnifwVAnkIfw2tiVYX42F4OpiSvY2wb
	BDycb3o+hF9iaWFJVhhnh2kjNDrivvOT7BWl96FDAmwUMbqNAXwuEZhgwzESJmuiiTMH
	mp51mJAYHMXQI+dBGpwIpZ0sv8RMrs01wvkjwAZopKOc+nUXssNXDnZo8QG3TtW0NekX
	XbBtc/rO6i3miNqh0ja7qDGiuHraRrJnlHTmBrg+c9x5yEdAUTusfaD66YSRzpsQ2mVq
	S3aQ==
X-Gm-Message-State: AKwxytd7r4l5WROFGeMK1wi61nxIBQ8A1lVG8KUKPBtsLxNIee7BtYD7
	jaRGl2RNr9lW5yj010cvZU42RisvhG8a6U5rpeup8A==
X-Google-Smtp-Source: AH8x225hky6X2d2VpaKrfdvGQo/o5UYA7Eu/zDA4WMNNW9l5WhfbART6LEHOBFj1AsdoL2iFwWCpVjMuDG5rEmrNej0=
X-Received: by 10.223.171.24 with SMTP id q24mr8697551wrc.206.1517322435982;
	Tue, 30 Jan 2018 06:27:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Tue, 30 Jan 2018 06:27:15 -0800 (PST)
In-Reply-To: <20150818095451.0B5435036F@opal.openembedded.org>
References: <20150818095451.0B5435036F@opal.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 30 Jan 2018 15:27:15 +0100
Message-ID: <CA+chaQeSwgn=YjGCifcokcB7eAe4Ygr-Y9c7_--urFd-2=3QVA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Li xin : tiptop: upgrade 2.2 -> 2.3
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
X-List-Received-Date: Tue, 30 Jan 2018 14:27:15 -0000
Content-Type: text/plain; charset="UTF-8"

Anyone else seeing random failures with this one?

/usr/src/debug/tiptop/2.3-r0/tiptop-2.3/src/utils-expression.c:191: error:
undefined reference to 'yyparse'
/usr/src/debug/tiptop/2.3-r0/tiptop-2.3/src/calc.lex:75: error: undefined
reference to 'yylval'
/usr/src/debug/tiptop/2.3-r0/tiptop-2.3/src/calc.lex:75: error: undefined
reference to 'yylval'
/usr/src/debug/tiptop/2.3-r0/tiptop-2.3/src/calc.lex:65: error: undefined
reference to 'yylval'
/usr/src/debug/tiptop/2.3-r0/tiptop-2.3/src/calc.lex:65: error: undefined
reference to 'yylval'
collect2: error: ld returned 1 exit status
make[1]: *** [tiptop] Error 1

On Tue, Aug 18, 2015 at 11:54 AM, <git@git.openembedded.org> wrote:

> Module: meta-openembedded.git
> Branch: master
> Commit: 4638d7223aa48639238c35b019e1ca86151a0b65
> URL:    http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=
> 4638d7223aa48639238c35b019e1ca86151a0b65
>
> Author: Li xin <lixin.fnst@cn.fujitsu.com>
> Date:   Wed Jul 29 17:54:11 2015 +0800
>
> tiptop: upgrade 2.2 -> 2.3
>
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> ---
>
>  meta-oe/recipes-extended/tiptop/{tiptop_2.2.bb => tiptop_2.3.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/tiptop/tiptop_2.2.bb
> b/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb
> similarity index 87%
> rename from meta-oe/recipes-extended/tiptop/tiptop_2.2.bb
> rename to meta-oe/recipes-extended/tiptop/tiptop_2.3.bb
> index a803e26..5a98116 100644
> --- a/meta-oe/recipes-extended/tiptop/tiptop_2.2.bb
> +++ b/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=
> b234ee4d69f5fce4486a80fdaf4a4263"
>  DEPENDS = "ncurses libxml2"
>
>  SRC_URI = "http://tiptop.gforge.inria.fr/releases/${BP}.tar.gz"
> -SRC_URI[md5sum] = "74255a29acf44569db021b080ad3e3f7"
> -SRC_URI[sha256sum] = "965cb99b16cb59df78363d83b62877
> ce8501b0aac1116a86bed8a16aa96b171d"
> +SRC_URI[md5sum] = "f1fba1e90465b0e5a3865b19133fa19d"
> +SRC_URI[sha256sum] = "3f07e958b40acaeab98e9eb1326c9f
> 91b0be0a782c1cc2bd7a9e18d31fab18ca"
>
>  inherit autotools-brokensep
>  EXTRA_OECONF = "CFLAGS="$CFLAGS -I${STAGING_INCDIR}/libxml2""
>
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

