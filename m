Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7F09178211
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Aug 2017 10:46:44 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id x187so8254149ite.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Aug 2017 03:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yawElTfzX4SDbBe+E2N3i0FzZStGvza5z38P0QeoDgw=;
	b=XP3PnwZ4ccR5o6Tqkp8lE5wG0mbpBUUfsPKM0Gi7mI8LJG3QvUJUF5b+iovVRelsqI
	Xjw8qGYcD4gDrjEr/SkOKjSjCe7bWfV90icpMMlOUaBt9wJo6ntL5JvnqZMD9r5l2owD
	ikbiQPFL5M81m+fC4HVwhpzmFh3lE+b1Dox+nbQLpZuVOvk+m07lyX7D8JZVRgYXSi7q
	srvAEFcJEcMLSB+hk70A9xdjJwDThKTNgaBWgZl0LiAKtfBBaC3rIRXKcNPqnmU32Le7
	v9+JZ0viKQFjQAsxfXYYIkN7okCEp4rxayKyYCNsESgKogeumP/KickkJrM1+VMuC+o5
	WWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yawElTfzX4SDbBe+E2N3i0FzZStGvza5z38P0QeoDgw=;
	b=Nvy0vWRI1CyWObx/3u6p9QqC+n4noCICgGfyKDFeC0i7ReIeVqMEnz9WQjXGHbJDEw
	22yg9Ne4b+cHdCs9EfZ1tuVmyh7KDVQzt1nel2lRd2aWEwJBeb7f3goNYIu5D7sDFeCL
	C5ejfQ0pN3fRA8IUhu+PwW/giSCcEBoMOwDhf6QnwjcpijGLtqQ5rVSpX24dn1kLXpTU
	OC4zY8hNfrSo5tJ2Ahh5DFNR0P2N8F2VzoE6GIG143K2j8qvIl6MSGRSCoLBof71JSW2
	DbW6kAX1tMa3jK+icWfGC3c4jHyB+qK7NELT6Me3/8yAABpp7zziJTio/fD8TvN9Qq9C
	yxag==
X-Gm-Message-State: AHYfb5gyULA1DsGKAZtab3xSz2U8LWM+3EVtLxPyFzlObOfWMWIEZTW9
	R8aXNZk3x/P7puSnsPbhhf8kXUVP4v1j
X-Received: by 10.36.94.196 with SMTP id h187mr2589813itb.71.1503485205728;
	Wed, 23 Aug 2017 03:46:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.200.71 with HTTP; Wed, 23 Aug 2017 03:46:15 -0700 (PDT)
In-Reply-To: <1503482923-13058-1-git-send-email-Qi.Chen@windriver.com>
References: <1503482923-13058-1-git-send-email-Qi.Chen@windriver.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 23 Aug 2017 13:46:15 +0300
Message-ID: <CAHiDW_GTtM44B+p-AU6UGUiyuAC0q+WdNCdkC4um9WrqwDZU-Q@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] openconnect: fix parallel compilation failure
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
X-List-Received-Date: Wed, 23 Aug 2017 10:46:44 -0000
Content-Type: text/plain; charset="UTF-8"

On 23 August 2017 at 13:08, <Qi.Chen@windriver.com> wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
>
> This patch solves the following error which appears now and then because of
> parallel building.
>
>   ../git/main.c:78:21: fatal error: version.c: No such file or directory
>
> version.c is generated at build time. And it's needed by some objects. So
> it needs to be generated first to avoid compilation failure.
>
> This patch fix the problem by generating version.c first before building
> others.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta-networking/recipes-connectivity/openconnect/openconnect_git.bb | 4
> ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-networking/recipes-connectivity/openconnect/openc
> onnect_git.bb b/meta-networking/recipes-connectivity/openconnect/openc
> onnect_git.bb
> index 3a1f0f3..4242aa5 100644
> --- a/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
> +++ b/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
> @@ -25,3 +25,7 @@ inherit autotools pkgconfig
>
>  EXTRA_OECONF += "--with-vpnc-script=${SYSROOT_DESTDIR}${sysconfdir}/vpnc/vpnc-script
> \
>                   --disable-static"
> +
> +do_compile_prepend() {
> +    make version.c
> +}
>

Upstream has had a proper Makefile.am fix for this since August 2016. I
think the recipe should just be upgraded -- VPN software from 2015 is a bad
idea.

Jussi

