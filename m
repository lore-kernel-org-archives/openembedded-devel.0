Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9A0EF72FE9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Feb 2017 14:39:19 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id r90so17337057qki.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Feb 2017 06:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=19W4XuxLyZlVmQzkpCV6ONeks9he8w3Ccd33Y1Qv/EQ=;
	b=NqsrOQ4+zxF8lbUOSLkt1PhaHQLkTWXq9MWN2t7Xxd3gVCHXP7upPqJJsZL3FKFDuO
	uHwi04MHKkUbt52oCKbFA/d+gwTZXhnGAxGlCHqNVkmD9aLVG8PRaXFZn3Nzpcm7T/Y7
	EvNx6fpSEvVHqA5MteY3AV1W12YDoXr06+DvJbv+rRIrtDKrfLb8bWew8SsL9OwpmEWe
	UnFDBtW4vJMgldi5GZQyiN5TYPrwefXLVP48QD+ngx/PW1Ub54jyxO7DFVoKZivfZ62Q
	tIE9fUg8ouQu/WjX4yduSaPw6HgmCHv/yrODXBU4JljvpeY35gw2j7CIUh3X9/Wq8btN
	rPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=19W4XuxLyZlVmQzkpCV6ONeks9he8w3Ccd33Y1Qv/EQ=;
	b=LrCCdx/UiziMuEVDftaZYQ112x807H/J5HfjB86jtonVkwsPRdvrD6uea9SkrmwtH+
	h4KOc+tD40RUqqXb5PhZ14IXn6vFkq7aN1rVP6ucaQpFA8aE4bG1GBuX/rXTmOYpSyNk
	btyhacA6JojwAUGelwqkNc3JAylipFF3s3OglBeNFbgIl3BCgs2wTiY/cCOgmRFpvyyJ
	HADknL6Tg4Q/GcwOvYjHiuRF9FXfh+1wW/ltGp4/2qsj/t68DHBRypGETCBo36b6v7rb
	b8XL89aYq6n3T6HAYosf9Gt3GlBLNcxb5+Qw64zVUg2CQVNSMW9SG+4oZMS1JafYePog
	LRGQ==
X-Gm-Message-State: AMke39mdep8Hrfnf78Dl/myYc/Kj7P4CIY2+zW1NTKI56thmCh2VORZLUAo325G+lGNCLvjB7+Gz2jVJIiZ1vg==
X-Received: by 10.200.54.207 with SMTP id b15mr17633690qtc.9.1488206360248;
	Mon, 27 Feb 2017 06:39:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.132.68 with HTTP; Mon, 27 Feb 2017 06:39:19 -0800 (PST)
In-Reply-To: <20170227080959.27797-2-jackie.huang@windriver.com>
References: <20170227080959.27797-1-jackie.huang@windriver.com>
	<20170227080959.27797-2-jackie.huang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 27 Feb 2017 09:39:19 -0500
Message-ID: <CADkTA4OXnroiRi4Y4JGHAPf2jB4BgtAbn+fJSMoFEpN8JCY9mw@mail.gmail.com>
To: "Huang, Jie (Jackie)" <jackie.huang@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 2/2] dnsmasq: disable the service by default
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
X-List-Received-Date: Mon, 27 Feb 2017 14:39:20 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 27, 2017 at 3:09 AM, <jackie.huang@windriver.com> wrote:

> From: Jackie Huang <jackie.huang@windriver.com>
>
> The service will fail to start/stop when dnsmasq and
> bind (provides named) are both installed since they
> are using the same port 53:
>
> | dnsmasq: failed to create listening socket for port 53: Address already
> in use
>
> So disable the service by default, if the user really
> want to use two dns servives, the config needs to be
> changed to use different interfaces or ports.
>


But what if the user is only using dnsmasq ? (which is the case in the
images I use).
This would be a behaviour change that they add dnsmasq, but don't actually
get the
service started.

IMHO if someone is installing two packages that provide the same service,
they
are more aware of what is going on and can disable one (or the other) ..
versus
someone that adds a single package that provides a service .. and then find
out that
it doesn't actually start.

Bruce


>
> As reference, other distro like centos/fedora also
> disables the services by default on installation.
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta-networking/recipes-support/dnsmasq/dnsmasq.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> index 424a06b..9c2276f 100644
> --- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> @@ -81,3 +81,4 @@ RPROVIDES_${PN} += "${PN}-systemd"
>  RREPLACES_${PN} += "${PN}-systemd"
>  RCONFLICTS_${PN} += "${PN}-systemd"
>  SYSTEMD_SERVICE_${PN} = "dnsmasq.service"
> +SYSTEMD_AUTO_ENABLE ?= "disable"
> --
> 2.8.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

