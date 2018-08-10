Return-Path: <ian@boundarydevices.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id F3BEB608B7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2018 20:51:55 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id m13-v6so11757816qth.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2018 13:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=boundarydevices-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ViY52TvGd/6Ic53/R99RlMlWuBQfYRD5icjs4jvj4U0=;
	b=qkaIkmB85R3u1EwjSTNZhjoBcf5BqXPJmj0Xwehyi4yDKaxdYE2l4Lqw8o8ZZAO+9X
	9PCuH5Q0Xd1AMZch1Cv5+HGmfHys57PFJ3pogktj/zVbKwoPTD5uyjcpvAYvDCQPRyv8
	dmOMs9yb5s99cLMDhOTMBuh492pCReowd0mx2n2tir/cXdM4i6WRLnrGrfilxV2n7zmu
	2Ws6REqE+A/h6Af/bWZQkuBlVbqjzbH7OKgbxMwQzWXjST9PK7hiAEYfdkJLD1NmV6By
	6vuMaeK1Suu5T2olGuWNQ+6Ahdi19HQNVbxyNht2BiOxbtZ4rruY98Z9UGKDHG/6FosS
	Fovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ViY52TvGd/6Ic53/R99RlMlWuBQfYRD5icjs4jvj4U0=;
	b=srO/tJSNudIINjBZw5Bog6Md931TBFsriYfkHJ/7Pg1FNG3h5WM6kxDxNTalvQpthE
	7ChAHDthdiMEf6IlnD6K6/qdF37raQV9ZSpJI+ai49m26HceEbbI7w85Y1zGxoQL9MOg
	Q1zFKVxvXEJmvaBhwvEjTZ017v7zUmRilVbH7dyDG7cb+CXQzDPe3PTZYcLkG5pPqR9X
	FwJZiRKDsv5/5P2R42sHXTj0/MQTgF0wL2+FuGDNaxMaGFffWA/y0UOUM+lJlNJmuZfB
	BaPiGIq3Mp3FxhclRhJerL5yEXgytbS1rAXWlTTV0YW+07KDc2NKfGLl55hnuoWS8k3H
	eHug==
X-Gm-Message-State: AOUpUlGXNm8Z+hM97ancCqeekZ2cKcPCOsmc/Ft1HPGq3IijNGHvic75
	OP7m3obsih+PlZA1seukb4tVyhdTA4eCGYvKaEdisw==
X-Google-Smtp-Source: AA+uWPyC6kzsMbhANROvRIvX43b9Z9C2OWXnm3mfPtjHdXU503StUnG6G3NQHmA10O8y0eE+wick4F8EYL0UI+xKMIE=
X-Received: by 2002:aed:3763:: with SMTP id
	i90-v6mr8188201qtb.308.1533934316733; 
	Fri, 10 Aug 2018 13:51:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aed:2bc4:0:0:0:0:0 with HTTP; Fri, 10 Aug 2018 13:51:56
	-0700 (PDT)
In-Reply-To: <1533682863-25087-1-git-send-email-alex.kiernan@gmail.com>
References: <1533682863-25087-1-git-send-email-alex.kiernan@gmail.com>
From: Ian Coolidge <ian@boundarydevices.com>
Date: Fri, 10 Aug 2018 13:51:56 -0700
Message-ID: <CADseiPmto9xeXiAmpGQ88GksoCw0qjgJzhjC=VFaxCksYdAExg@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Alex Kiernan <alex.kiernan@hivehome.com>
Subject: Re: [meta-python][PATCH] python-m2crypto: Move swig fix to configure task
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
X-List-Received-Date: Fri, 10 Aug 2018 20:51:56 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks for this, this fixes that recipe.

On Tue, Aug 7, 2018 at 4:01 PM, Alex Kiernan <alex.kiernan@gmail.com> wrote:

> From: Alex Kiernan <alex.kiernan@hivehome.com>
>
> Fixes:
>
> | DEBUG: Executing shell function do_configure
> ...
> | SWIG/_m2crypto.i:10: Error: Unable to find 'gcc_macros.h'
> | error: command 'swig' failed with exit status 1
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>
>  meta-python/recipes-devtools/python/python-m2crypto_0.26.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.26.4.bb
> b/meta-python/recipes-devtools/python/python-m2crypto_0.26.4.bb
> index 272c76c..7e22163 100644
> --- a/meta-python/recipes-devtools/python/python-m2crypto_0.26.4.bb
> +++ b/meta-python/recipes-devtools/python/python-m2crypto_0.26.4.bb
> @@ -27,7 +27,7 @@ export SWIG_FEATURES
>  # Get around a problem with swig, but only if the
>  # multilib header file exists.
>  #
> -do_compile_prepend() {
> +do_configure_prepend() {
>      ${CPP} -dM - < /dev/null | grep -v __STDC__ | grep -v
> __REGISTER_PREFIX__ | grep -v __GNUC__ \
>         | sed 's/^\(#define \([^ ]*\) .*\)$/#undef \2\n\1/' >
> SWIG/gcc_macros.h
>      if [ "${SITEINFO_BITS}" = "64" ];then
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

