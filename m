Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id E7FE160079
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 12:30:55 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id v4so6673017wmb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 05:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ruu7d1hk2LzpToX4l6JC7IAR4Eld8ooEq1zWyuTriyw=;
	b=TDc7BIl42JX4W5vTzjeJ/fZ04UhbPhDjM4rZfAzK8oAmnNtMEuwdvxZLHCSDOeloeo
	RjDzfUWv8UZJ2r7yp81MWU9NczcW9w1+bLe3ieZiy0q3YLtqFX4o/MLgcEZu6+STZs3w
	so8w1ujAwb2RaapyYGhsRpr4fZb0YU+PNPYST7vSe9SxA2PctJIN/pfKqdzEP/3OS4d7
	97uH1isGgdgz3ml1nBijajNEzlWmtH9aT33rTmT+4PIyaIRCDSrABXtg+iVJ+uV0BImt
	PtwEG1jSZkcSbd3P/4oziO9Tae7nYplW/6xvXVYVzcvnwmJ5WNXxKQJ8SxTuoBbHBTVG
	8rAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ruu7d1hk2LzpToX4l6JC7IAR4Eld8ooEq1zWyuTriyw=;
	b=MZbYN5+4pXDnoSZ/bz4AXUFBoL2SpyTNmXC0fiRMog8NXk3/6+Kao919ZV0KOopVg+
	wcFlU+92LoWQZefhKMcNGxyfX3eCxJeDSwUzGL4eoLvllzKrXP63EHrdqkaL9tmWP4kP
	g+D2ny+QQTBGe5OHH20bGOaBZxUK1oPdF4QZfTTkWkBtDvHdRAt2EoI1e/UcPqo3wfAM
	DcoHM5pWcYgb8vIvQ00TFCtfL2h0pXwMfVhDyNXdodcaJQeVufCPzW9e5ScRK+Eg11Wn
	G1U7q8hzmda4Tr4pDmX0UcfeP00XFTO+jyp+FOSEELo2bo+U6jR12O7mjPQoXrMvIb21
	CfnQ==
X-Gm-Message-State: AODbwcDJ88dIl+ODxK1ZtkU7bfCjwtCMCZ+mJx9SvbJZxlvCx1y2KwMX
	geiMqQAJiJzasU5/M5/7CyYHfeumbA==
X-Received: by 10.80.176.198 with SMTP id j64mr668471edd.168.1494505856645;
	Thu, 11 May 2017 05:30:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.213.154 with HTTP; Thu, 11 May 2017 05:30:55 -0700 (PDT)
In-Reply-To: <1494505721-28247-1-git-send-email-costamagnagianfranco@yahoo.it>
References: <1494505721-28247-1-git-send-email-costamagnagianfranco@yahoo.it>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 11 May 2017 14:30:55 +0200
Message-ID: <CA+chaQfVoCzjRKh4whBtTsyqtiDm7oKxFToTox5R-48qGYXm2Q@mail.gmail.com>
To: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH] libndp: switch to github uri. libndp.org is unstable
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
X-List-Received-Date: Thu, 11 May 2017 12:31:03 -0000
Content-Type: text/plain; charset="UTF-8"

Github archives are regenerated from time to time with different checksums.

If you need to switch to github, then fetch it with git with SRCREV
matching to the tag.

On Thu, May 11, 2017 at 2:28 PM, Gianfranco Costamagna <
costamagna.gianfranco@gmail.com> wrote:

> From: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
>
> Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
> ---
>  meta-oe/recipes-connectivity/libndp/libndp_1.6.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
> b/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
> index a35dff8..7d53dc6 100644
> --- a/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
> +++ b/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
> @@ -3,8 +3,8 @@ SUMMARY = "Library for IPv6 Neighbor Discovery Protocol"
>  LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>
> -SRC_URI = "http://libndp.org/files/${BPN}-${PV}.tar.gz"
> -SRC_URI[md5sum] = "1e54d26bcb4a4110bc3f90c5dd04f1a7"
> -SRC_URI[sha256sum] = "0c7dfa84e013bd5e569ef2c6292a6f
> 72cfaf14f4ff77a77425e52edc33ffac0e"
> +SRC_URI = "https://github.com/jpirko/libndp/archive/v${PV}.tar.gz"
> +SRC_URI[md5sum] = "de58352aaee0e8edb744f1aef852cdce"
> +SRC_URI[sha256sum] = "565d6c4167f83ec697c762ea002f23
> e8f0b00828d0749b1ce928f068543e5aad"
>
>  inherit autotools
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

