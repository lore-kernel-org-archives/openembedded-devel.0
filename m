Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id E67F46072C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jul 2016 18:08:36 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id l89so4084359lfi.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jul 2016 11:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ik9nPAeDp1XneWEbl32hFFSB6LuuPydRbEK2HxsVWT0=;
	b=EBeeJnX5qMryAL4oDgJfbkaqhHZTSZg+h/xH7TzRRvA6izJiyTM4EcRcR1QJkFglR8
	x+ibkks+FmwyNqHtEuKEwEw9EU2Vn63UA/R0RS+zLXvPvlXb9ni1G5pJVwL1tjCUzKyQ
	QdwiTsi8Z52begFp3+UX5XkM6YLj/SLlvGRFFgIulXSRmhXJTG5ob9XjkH9/dwK7rf7c
	9P1WQLnwLRsJgV7XkEFluo6khCyXzFCOZeTZZx5+TikEJOwI+JGrjb5IS8ryB976dvNp
	G1Jqo1FSX1skaN6FiJpFconJlLU8AcdPT/PMcg2fVLTQIgKkVwg2A37pnF7xhKmupt0+
	COSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ik9nPAeDp1XneWEbl32hFFSB6LuuPydRbEK2HxsVWT0=;
	b=E8P/0cpLqOsUDo5eFGshjAcMkEYNjF/Z/0dq90+jqmrkBGb21FRidc3R7ULK5sTWRc
	X+nDu4wILL6RazCHJWAuxhdR+CXgHOwk2Wo8gxhRUf20Yir0vJNJP4a/yHf6XbQ20FN4
	kNuEJxS0qqnKFIal/VAelwjmLUewWczLanJN9uWUn7a6InHsjyc1l2U+jk4+B1ggussd
	FlfQdpbl1fvRwzrZqGC7tJM+3Ft5Rt5Y7aNPCSTzPEI6xEjrtYeMDz/dvFNA+VUxiFUI
	6CfTGddlZflwJjLDzfEkntxKuLZ5hw0OoIRtmyI7sct5sfPygUPkdtTDzEq+1JD/2iDI
	tABg==
X-Gm-Message-State: AEkoouvj8l6/6BjuBfa+h52FmBZpJyYDfanp1HdcU2hzXLqMAWVS4Xc7D2YSTgxSi2F4wQJvB4nYQjNxTxL2uQ==
X-Received: by 10.25.213.20 with SMTP id m20mr15213656lfg.61.1469729316548;
	Thu, 28 Jul 2016 11:08:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.87.12 with HTTP; Thu, 28 Jul 2016 11:08:35 -0700 (PDT)
In-Reply-To: <1469725226-14727-1-git-send-email-denis@denix.org>
References: <1469725226-14727-1-git-send-email-denis@denix.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 28 Jul 2016 20:08:35 +0200
Message-ID: <CA+chaQcBrDH-Ns30KX=fuBqzKPBn4Xh3zkgfOZwpb9=PO5UKhQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-qt5][krogoth][PATCH] cmake_qt5.bbclass: when using _prepend don't forget to add space at the end
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
X-List-Received-Date: Thu, 28 Jul 2016 18:08:37 -0000
Content-Type: text/plain; charset=UTF-8

Is the same needed in master branch?

On Thu, Jul 28, 2016 at 7:00 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> From: Denys Dmytriyenko <denys@ti.com>
>
> Previous commit aacd63f10dd58acf7bf6138e2f4734e37dcf0420 introduced a bug
> by
> using _prepend w/o a space at the end, resulting in corrupted EXTRA_OEMAKE
> variable in packages that inherit cmake_qt5.bbclass.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  classes/cmake_qt5.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/classes/cmake_qt5.bbclass b/classes/cmake_qt5.bbclass
> index 4dc897b..3180fd6 100644
> --- a/classes/cmake_qt5.bbclass
> +++ b/classes/cmake_qt5.bbclass
> @@ -32,4 +32,5 @@ EXTRA_OECMAKE_prepend = " \
>      -DOE_QMAKE_PATH_QT_DOCS=${OE_QMAKE_PATH_QT_DOCS} \
>      -DOE_QMAKE_PATH_QT_SETTINGS=${OE_QMAKE_PATH_QT_SETTINGS} \
>      -DOE_QMAKE_PATH_QT_EXAMPLES=${OE_QMAKE_PATH_QT_EXAMPLES} \
> -    -DOE_QMAKE_PATH_QT_TESTS=${OE_QMAKE_PATH_QT_TESTS}"
> +    -DOE_QMAKE_PATH_QT_TESTS=${OE_QMAKE_PATH_QT_TESTS} \
> +"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

