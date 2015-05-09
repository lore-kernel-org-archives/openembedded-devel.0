Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id E2F2B6017E
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 May 2015 00:50:05 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so34248061igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2015 17:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=CLtbxnU0ybZEifvF99tGZkIr0pkt8nuiv4xsAvsLLHE=;
	b=kFhJrW7gNGGa55zV84S6MKl4M/lOdAnntAdt2V1U/a9Nvbw5zqIYUocUFy7VMgA+yI
	hKXpBxJrZIMBZiFdfVsWez/dTHf0A4pr7OcIHeM5w6LWo+CqcgDwFEe6GKjbDbyxQUaO
	itUNSI9htM6wTGhVg6HVseByoIFuN3UmrzQdONj3L2MkGk6imnsxwBwuf0Jut897NDSi
	sIQ7giPYeXFH62yG/GuvttDUZ54fKMAtyd1ioBERQHmOUv+MOEUXIDbDvi012RRfcVoM
	5vHreF+ezSQv32JieJL/ldHUt3XoHrEdlDsFu5tT2elPZD/QaZJY19XP7+WxbLc5DJ6z
	AEOQ==
MIME-Version: 1.0
X-Received: by 10.50.43.137 with SMTP id w9mr2222648igl.30.1431132606365; Fri,
	08 May 2015 17:50:06 -0700 (PDT)
Received: by 10.50.112.34 with HTTP; Fri, 8 May 2015 17:50:06 -0700 (PDT)
In-Reply-To: <1431112486-23487-1-git-send-email-haris.okanovic@ni.com>
References: <1431112486-23487-1-git-send-email-haris.okanovic@ni.com>
Date: Fri, 8 May 2015 17:50:06 -0700
Message-ID: <CAMKF1sr+DV-sA23dwzhAocJiACp=1+WNk8VWh3eGreDQ1Xh25A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] dpkg start-stop-daemon: Fix RCONFLICTS typo
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
X-List-Received-Date: Sat, 09 May 2015 00:50:06 -0000
Content-Type: text/plain; charset=UTF-8

On Friday, May 8, 2015, Haris Okanovic <haris.okanovic@ni.com> wrote:

> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com <javascript:;>>
> Reviewed-by: Ben Shelton <ben.shelton@ni.com <javascript:;>>
> Acked-by: Brad Mouring <brad.mouring@ni.com <javascript:;>>
> ---
>  meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
> | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/start-stop-daemon/
> start-stop-daemon_1.16.0.2.bb b/meta-oe/recipes-support/start-stop-daemon/
> start-stop-daemon_1.16.0.2.bb
> index c8d88b7..efdd6b7 100644
> --- a/meta-oe/recipes-support/start-stop-daemon/
> start-stop-daemon_1.16.0.2.bb
> +++ b/meta-oe/recipes-support/start-stop-daemon/
> start-stop-daemon_1.16.0.2.bb
> @@ -4,7 +4,7 @@ LICENSE = "PD"
>  LIC_FILES_CHKSUM =
> "file://utils/start-stop-daemon.c;md5=a963623e4588f70122865aaa7a370ce4"
>  # start-stop-daemon is usually shipped by dpkg
>  DEPENDS = "ncurses"
> -RCONFLICS_${PN} = "dpkg"
> +RCONFLICTS_${PN} = "dpkg"



It is blacklisted so how did you test it. I'd it's working fine then may be
you should white list it too

>
>  PNBLACKLIST[start-stop-daemon] ?= "BROKEN: fails because of gettext,
> partial fix is available here
> http://patchwork.openembedded.org/patch/89867/"
>
> --
> 2.2.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org <javascript:;>
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

