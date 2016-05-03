Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 853AA73194
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 May 2016 07:38:10 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id u64so12089957lff.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 May 2016 00:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=psfNCS8gWFjTBdZXBRsYMHPGhNwxCcvtRr1Vf9dWjpE=;
	b=05YUpGsI5aSzaaE+kHOAVdgf59ir8W5A2B8XmPb72Bb/sCYN4ghd511SwXjbWM99wW
	DQy3feAZL5sxukrMZnnNjpUl17Estn3MiT+pz3Rf7VT6x6ttoFE7Mi1XaETBuqVO5vI+
	+9I6d4k0jmgdLUo3vy9YlzGm/YgsdmcUBqlIl8/laXm9/gfh0PdRPu+Z7DONtFMGKF0K
	gqCzOZkmoG4ux8BK1ktLdhG+ROFRVZhEhG37shMqyHBCgBSnitFamZ8bv4b8VmZnZiQR
	TU/2WwuYlDDiNWYL0Vsqt+fGU4snJs8WyU+ZI1L8oLRIMZBP5P4BaWYGtGMQ9ydw8o5Z
	8b0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=psfNCS8gWFjTBdZXBRsYMHPGhNwxCcvtRr1Vf9dWjpE=;
	b=bAQFcG+q+96rpFlUyHhjf4JqQZs4xteP9nuC8XEfkwS7JDzcwOw8WhI3gMMp6GEgO/
	wgA9bGzehUVG0he/GxmdDypj+uiUlpjoHv/JdVTiZPW/bPAb/Qd7jHhJ5aedZ3P1kUv0
	iBKKAeSsL0yxQc9IJgn85vhgKVvwvTME/hSULnDFOPQ2nsSoYn4BP0ueJIkP904iLjm3
	S8tRauq4t3RpZTQ6GgxEMikJdgc0ENKOHk9KTrdvPdi67LZj5lX0gsRPbrzZZxQ6K9/A
	qBJTjBS8/SsSyMDOie91LlhbvJdiBUQvk4TXK8yZ8ohF9d54DqtMTHJoAEfT85EBbzBc
	w5Yw==
X-Gm-Message-State: AOPr4FWk/x6pHV6eA6ELoi56G1Zl9EH3uQzLjbgnzTmslhUP/jqM4Pa4XJThw9gaBu4U9A9PIAObUMj2AK8Aow==
MIME-Version: 1.0
X-Received: by 10.25.153.69 with SMTP id b66mr507321lfe.138.1462261091351;
	Tue, 03 May 2016 00:38:11 -0700 (PDT)
Received: by 10.112.180.229 with HTTP; Tue, 3 May 2016 00:38:11 -0700 (PDT)
In-Reply-To: <1461947081-15513-1-git-send-email-derek@asterius.io>
References: <1461947081-15513-1-git-send-email-derek@asterius.io>
Date: Tue, 3 May 2016 09:38:11 +0200
Message-ID: <CA+chaQf7vGXOz61725sEOAG4EBKGmS=KxYq3ZPZS7WfjAPYeXw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Derek Straka <derek@asterius.io>
Subject: Re: [meta-oe][PATCHv2] giflib: update to version 5.1.4
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
X-List-Received-Date: Tue, 03 May 2016 07:38:11 -0000
Content-Type: text/plain; charset=UTF-8

Can you check leptonica, seems to be broken by this upgrade:

http://errors.yoctoproject.org/Errors/Details/61476/

On Fri, Apr 29, 2016 at 6:24 PM, Derek Straka <derek@asterius.io> wrote:

>   - Remove EXTRA_OECONF to disable X11 support since direct X11 window
> rendering has been retired
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  .../recipes-devtools/giflib/{giflib_4.1.6.bb => giflib_5.1.4.bb}   | 7
> ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>  rename meta-oe/recipes-devtools/giflib/{giflib_4.1.6.bb =>
> giflib_5.1.4.bb} (67%)
>
> diff --git a/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
> b/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
> similarity index 67%
> rename from meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
> rename to meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
> index e59d0e5..21fa352 100644
> --- a/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
> +++ b/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
> @@ -2,14 +2,11 @@ SUMMARY = "shared library for GIF images"
>  SECTION = "libs"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=ae11c61b04b2917be39b11f78d71519a"
> -PR = "r3"
>
>  SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.bz2"
>
>  inherit autotools
>
> -EXTRA_OECONF = "--disable-x11"
> -
>  PACKAGES += "${PN}-utils"
>  FILES_${PN} = "${libdir}/libgif.so.*"
>  FILES_${PN}-utils = "${bindir}"
> @@ -18,5 +15,5 @@ BBCLASSEXTEND = "native"
>
>  RDEPENDS_${PN}-utils = "perl"
>
> -SRC_URI[md5sum] = "7125644155ae6ad33dbc9fc15a14735f"
> -SRC_URI[sha256sum] =
> "e1c1ced9c5bc8f93ef0faf0a8c7717abf784d10a7b270d2285e8e1f3b93f2bed"
> +SRC_URI[md5sum] = "2c171ced93c0e83bb09e6ccad8e3ba2b"
> +SRC_URI[sha256sum] =
> "df27ec3ff24671f80b29e6ab1c4971059c14ac3db95406884fc26574631ba8d5"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

