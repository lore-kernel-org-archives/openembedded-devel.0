Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 09359771F2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Sep 2016 12:12:18 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id b187so96734136wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Sep 2016 05:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=xRxXPcQk/RXfOsiq+R5AP+YH0LKQWyg68TdmlFmzVeI=;
	b=Qjdi0V1fQAGDDZ2ld0xtV2h28w+UeUQ53yeynlOS7eFTQjqcOoqtmV75KwIYhYvRQJ
	eUVssHrhTmpjE97nIB9aGvprA8h8VhrKOw6Gg557N9VjDQXnEkacXG6qW36EcJOp3cpt
	P4GdMgW+UnQ1G2iL/cU2tNy1PO9sfdszuJ+ggQu4Uz57pweWGzTxRde4aA4wWupk0FK6
	4bST8Yc12B4P7axWd884+0SiWRMqKMw1AVrBOfXevdzR/p5RCWKvYVtTPvc6JBJJWiT1
	8hHiDOtUDMYj9mTKc//QckJRfxrPIi6U+iCbMwIE+AwCQUamibakZwUpeyLL1N4MIy/c
	JAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=xRxXPcQk/RXfOsiq+R5AP+YH0LKQWyg68TdmlFmzVeI=;
	b=FJd2o7bNg6XUGPLq+4hwfS54rVeSoMYxm6EWjEUALWaEGDs10U9ZeDy8QUVjtyYlYY
	7tyoB1O4lkycWsIPbJKC2uUM632TFwJreLTDbj5w1RmSrjxbTQqY2KFtoEAcDL0mdUMj
	5TDP/mUQYPf9b6dd5IEmXxAEOUuqL5wIWvrhnkxeOXWn0FgyToB13g5W8naMn6ZaS/lA
	gqnRRBRqdcrdze600Upd03OR44zhMl/TCRKZE5Mi9s0GkMwHBypdmxjpyd7sZKKh7O+q
	wC69eKd6xEnLTE5M+GoAJ7Q4ehogJYvdJycZXKqCZhABozxE1ZCT5jus83iZY3xRNbbv
	CPkA==
X-Gm-Message-State: AE9vXwN9s97mW/g3aGeQ7KJVi/t8kFMRvH0VOeGiLe813K56eyARMk/Z/FYeLbczgDMbfBZqD5aRPAq7rSUA/w==
X-Received: by 10.194.235.69 with SMTP id uk5mr10473298wjc.53.1473595938309;
	Sun, 11 Sep 2016 05:12:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.154.225 with HTTP; Sun, 11 Sep 2016 05:12:17 -0700 (PDT)
In-Reply-To: <1473593516-1335-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
References: <1473593516-1335-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 11 Sep 2016 14:12:17 +0200
Message-ID: <CA+chaQcnTcnwfATJjUmEpe_jmVwPYSBnE1q2WyekJ5fzotzidg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] xterm: 320 -> 325
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
X-List-Received-Date: Sun, 11 Sep 2016 12:12:19 -0000
Content-Type: text/plain; charset=UTF-8

What changed in xterm.h?

On Sun, Sep 11, 2016 at 1:31 PM, Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
wrote:

> Upgrade xterm from 320 to 325.
>
> Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-graphics/xorg-app/{xterm_320.bb => xterm_325.bb} | 6
> +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-graphics/xorg-app/{xterm_320.bb => xterm_325.bb}
> (78%)
>
> diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_320.bb
> b/meta-oe/recipes-graphics/xorg-app/xterm_325.bb
> similarity index 78%
> rename from meta-oe/recipes-graphics/xorg-app/xterm_320.bb
> rename to meta-oe/recipes-graphics/xorg-app/xterm_325.bb
> index f2abc3c..e0baf3c 100644
> --- a/meta-oe/recipes-graphics/xorg-app/xterm_320.bb
> +++ b/meta-oe/recipes-graphics/xorg-app/xterm_325.bb
> @@ -2,12 +2,12 @@ require recipes-graphics/xorg-app/xorg-app-common.inc
>  SUMMARY = "xterm is the standard terminal emulator for the X Window
> System"
>  DEPENDS = "libxaw xproto xextproto libxext libxau libxinerama libxpm
> ncurses"
>
> -LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=
> ee6435019d00b884cde8d7ba2b318ff0"
> +LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=
> 842e945c46c43e05c44d95003aa878e1"
>
>  SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz"
>
> -SRC_URI[md5sum] = "0d7f0e6390d132ae59876b3870e5783d"
> -SRC_URI[sha256sum] = "a60dbb574334c081425fa30f011cd9
> f571e3be7a91e2a84e252461798bce24a7"
> +SRC_URI[md5sum] = "e78a0bbc4d5fa3780917e447ae8ebc6b"
> +SRC_URI[sha256sum] = "3b31b07a0c40427e9330ec3be9d1a7
> 48c72808f945953cea9e526e48be315f1b"
>
>  PACKAGECONFIG ?= ""
>  PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft
> fontconfig freetype-native"
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

