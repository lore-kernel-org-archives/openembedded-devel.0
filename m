Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id E47C3606BF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2016 07:32:39 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id l69so12299230lfg.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2016 00:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=dtrJzTXjdR8+L4aj40CwIFoxYHJVZ6mD1bPYGXSS06Q=;
	b=WeHRpGLmWRYFRaIgrv1f7tDlkl/Q07Z2jnZ/TX9Is1zk6LWfpex+STtqcR/feyoJPs
	WIP8z/BFyT1yh/E6T4pzBDl5zcjbTbfUb/JR6gairzmAGwDDcy9MM3xIKOJOFx4jNHey
	PWecK5QK7molsEB4j8tdqP2cFtgX9lLUDMKTst2sVIFrQ5p2xl7fFjIAFXPgqXU1lISa
	mt6qnSlKoNUYosd3hIVRnLE0GMLyG1e3OpanB0kXYXknIgUJ1FFvE7dmX+Pec7cwXDlf
	FXSmmsHYjD8Yy/aCC1WseAmBwUvBnRwpQI7pQNpAsuTRNwvKduaWql8vw4RC3PYqOFRf
	ZYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=dtrJzTXjdR8+L4aj40CwIFoxYHJVZ6mD1bPYGXSS06Q=;
	b=mXqbf6stA37IZtp2TwbekkCcHox5BYrJbqXhClFzalfnOMzS+gFpqtuGMhvUxLxVmc
	wf54Jk2Is9oDf8Atd4kKv6zTceDPaXxjzz+4VDe4FtDoElNgNuw4njDBu2nNuRHFFgUU
	2vt+7iXFSyXlP+eaTX5cApLwijVUwHI0JYtkH0Q/orETDAScX5I8Up6FuETr+2dZCRHd
	XIG/isTpKbNyBEoeoqJ1HK1TQmmZ93dMOR6gAC/e3An+5Ks27c6qcFyIG4QGXv6Inib9
	6Blng2PqCvFxAGofXZIAVLjalWpZDFnYTmwss6IwQDn0gZR+IwgHwwLv4bTNGyWVlSYT
	eSfg==
X-Gm-Message-State: AEkoouvpIhQzCg5XSMVXesVlW0Nb4oR7DbXSuEG0f0E2bNaOMH7GJRWdbby0IPCj4JX3KDxIfVDLqwaA7t4KqA==
X-Received: by 10.25.1.213 with SMTP id 204mr9127767lfb.114.1469518359363;
	Tue, 26 Jul 2016 00:32:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.87.12 with HTTP; Tue, 26 Jul 2016 00:32:38 -0700 (PDT)
In-Reply-To: <1461031604-39175-1-git-send-email-daicy.fnst@cn.fujitsu.com>
References: <1461031604-39175-1-git-send-email-daicy.fnst@cn.fujitsu.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 26 Jul 2016 09:32:38 +0200
Message-ID: <CA+chaQdvoEJgke34kzN+S+AzkyJ91YGADkKoHhnQBiaHe-kYLA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] libnih: Modify PR to avoid build errors.
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
X-List-Received-Date: Tue, 26 Jul 2016 07:32:41 -0000
Content-Type: text/plain; charset=UTF-8

I'll squash this into the previous change, so that there isn't PR going
backwards.

On Tue, Apr 19, 2016 at 4:06 AM, Dai Caiyun <daicy.fnst@cn.fujitsu.com>
wrote:

> invalid tag value("^[A-Za-z0-9+._]+$") Release: Release: r2-4ubuntu16
>   meta-webos don't have people maintain for two years
>
> Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
> ---
>  recipes-upstreamable/libnih/libnih_1.0.3.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-upstreamable/libnih/libnih_1.0.3.bb
> b/recipes-upstreamable/libnih/libnih_1.0.3.bb
> index 5f70ef3..b5e5e12 100644
> --- a/recipes-upstreamable/libnih/libnih_1.0.3.bb
> +++ b/recipes-upstreamable/libnih/libnih_1.0.3.bb
> @@ -22,7 +22,7 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>  DEPENDS = "dbus libnih-native"
>  DEPENDS_class-native = "dbus-native"
>
> -PR = "r2-4ubuntu16"
> +PR = "r0"
>
>  SRC_URI = "
> https://launchpad.net/${BPN}/1.0/${PV}/+download/${BP}.tar.gz;name=tarball
> "
>  SRC_URI += "file://libnih_1.0.3-4ubuntu16.patch;name=patch"
> --
> 1.8.4.2
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

