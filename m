Received: from [212.227.126.187] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dirk@do13.de>) id 1Lw9Lz-0003kL-GW
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Apr 2009 08:21:11 +0200
Received: from mail.opfer.lan (do13.in-dsl.de [217.197.85.204])
	by mrelayeu.kundenserver.de (node=mreu0) with ESMTP (Nemesis)
	id 0MKuxg-1Lw9Hh1dNC-00017f; Tue, 21 Apr 2009 08:16:46 +0200
Received: from localhost ([127.0.0.1] helo=home.opfer.tk)
	by mail.opfer.lan with esmtpa (Exim 4.67)
	(envelope-from <dirk@do13.de>) id 1Lw9HZ-0006z8-Vd
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Apr 2009 08:16:43 +0200
Received: from p578b18b1.dip0.t-ipconnect.de ([87.139.24.177])
	(SquirrelMail authenticated user dirk) by home.opfer.tk with HTTP;
	Tue, 21 Apr 2009 08:16:37 +0200 (CEST)
In-Reply-To: <1240241104-21935-12-git-send-email-marcin@juszkiewicz.com.pl>
References: <1240241104-21935-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1240241104-21935-12-git-send-email-marcin@juszkiewicz.com.pl>
Date: Tue, 21 Apr 2009 08:16:37 +0200 (CEST)
From: "Dirk Opfer" <dirk@do13.de>
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.10a
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
X-Scan-Signature: 262c3d4071635bfeaf26f9015bb2d825
X-Spam-Score: -4.4 (----)
Message-Id: <0MKuxg-1Lw9Hh1dNC-00017f@mrelayeu.kundenserver.de>
X-Provags-ID: V01U2FsdGVkX18qwPcmXcRrdXWP6Qr74XxXAU+FBetrvkcDpXG
	z9qDVhU/Vlfhl0Q+AF+Gak7l3bj8E/bGObIqiDzjxxbS0NkqRl
	rf7Os1qnWpmALe8S3mVeSDQBZH6LV6c
Subject: Re: [STABLE][PATCH 1/1] uclibc: use LDFLAGS for ldd and ldconfig (fixes QA error)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Apr 2009 06:21:11 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Acked-by: Dirk Opfer <Dirk <at> do13.de>

> From: Dirk Opfer <dirk@do13.de>
>
> ---
>  recipes/uclibc/uclibc.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/uclibc/uclibc.inc b/recipes/uclibc/uclibc.inc
> index be085ab..f2f3e9b 100644
> --- a/recipes/uclibc/uclibc.inc
> +++ b/recipes/uclibc/uclibc.inc
> @@ -208,7 +208,7 @@ do_install() {
>  		rmdir ${D}/usr/bin
>  	fi
>
> -        oe_runmake utils
> +        oe_runmake "SSP_ALL_CFLAGS=${TARGET_LINK_HASH_STYLE}" utils
>          oe_runmake STRIPTOOL=true PREFIX=${D} DEVEL_PREFIX=${prefix}/
> RUNTIME_PREFIX=/ \
>                  install_utils
>
> --
> 1.6.2.3
>
>
>
>




