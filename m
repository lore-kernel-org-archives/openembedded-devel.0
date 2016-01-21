Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 894BC6E5CB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2016 14:57:48 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 65so1955245pff.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2016 06:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=CHXUJJ8RbysHJ773tTTFVCtMb5DJiqjpXQ6CrxxAqdA=;
	b=G3n7hlFnp2v5+sjFjl9OI0giW3fCq60fzzBKI4wUCZLYlxLI09PCriT7PAHbNZvYTa
	UUQeHgBPFZZOjS5qdKMqEY4Nxona0zPfVE70yMnuvLf0J5+7641YVcnEZyGG6T1iFn57
	DgPzZRt4YJiKQCb3YVtb8uyhirzkppyfUwdSVJdBaGvRTioukoouriW67kxWm+etiPz1
	6kmKBD9jc0mtxjxyE/uu5JYfBAQkF+HNZLlMAsZs2JNAVSjkv0AkPbbZ7AodVl9R/vDJ
	LegLBgbHQ88svUjJD6Q56JIIy2o4Tw7FyUWCr1/gT4akl40/Hamy4H1HWwAGzlIB8+ja
	q+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=CHXUJJ8RbysHJ773tTTFVCtMb5DJiqjpXQ6CrxxAqdA=;
	b=k1erzyYXexfIb1lxoO8Ef0WsKesVp4SJjmhTxfQG1upVg9QWfQb7C2+JST26vrzNJ9
	fofwVmhLeNswm8Gf4JRrCfaLeCpsidK3ei/8v/bsAOInJqwX4LG3y/pLRkVipH2NT0ed
	vStWYemiFed2btdXTrRl6lFwYzLD2ItQ8L/MLekLTd5fOoajVrEGkCkhDJQgov70ED+c
	NL4Bb47DdQ7eTMRDtCXkMSj8dQ7Kxs+QyVKRLKzFnFVJzO0Uum4Jds5mZx8Wcuz+evqq
	AOfkwOtF8PFqpPuNmNaEj30LJ091bVjTF5Bj0EMVC/rGTrnJy0Ky35Ot94U6RHWykwwI
	RWHQ==
X-Gm-Message-State: ALoCoQkmH9X+GoyOZU8uBb0T4nTeaombLAdGNOsPnC3oV8JjQnpPmPy69hneWz6zNaWJ8ZzFs/eHVtJ3rcVuV/XDSiYsLvX20w==
X-Received: by 10.98.68.193 with SMTP id m62mr61369924pfi.153.1453388269013;
	Thu, 21 Jan 2016 06:57:49 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:f0f5:a917:60f2:fe2?
	([2601:202:4000:1239:f0f5:a917:60f2:fe2])
	by smtp.googlemail.com with ESMTPSA id
	tm4sm3373453pab.3.2016.01.21.06.57.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jan 2016 06:57:47 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <CAALGJZY5LQw6a+fk+4TMy+JHFo=_p7kWixh9BJT+XyQqXh6wvA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <56A0F1EA.1080008@gmail.com>
Date: Thu, 21 Jan 2016 06:57:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAALGJZY5LQw6a+fk+4TMy+JHFo=_p7kWixh9BJT+XyQqXh6wvA@mail.gmail.com>
Subject: Re: [meta-openembedded][FIDO PATCH 1/1] ruby: Fixed runtime error
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
X-List-Received-Date: Thu, 21 Jan 2016 14:57:48 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

thanks,

I will add this to my queue and let you know when staged for merging.

-- armin

On 01/21/2016 02:39 AM, Christian Ege wrote:
> From 6d2c2b602185a03232635a9c5c97253930c2bc0b Mon Sep 17 00:00:00 2001
> From: Daniel Schnell <daniel.schnell.extern@ifm.com>
> Date: Wed, 14 Oct 2015 14:49:52 +0200
> Subject: [meta-openembedded][FIDO PATCH 1/1] ruby: Fixed runtime error
> 
>  Only include "enable-wide-getaddrinfo" if IVP6 is enabled in disto
>  feature otherwise 'gem install rails' throws an error
>  for the missing symbol 'getipnodebyname'
> 
> This is a backport of master branch commit
> 86835b4ac5ee593e8bd5b142504194370df71728
> to make any gem installation possible.
> 
> Signed-off-by: Daniel Schnell <daniel.schnell.extern@ifm.com>
> Signed-off-by: Christian Ege <k4230r6@gmail.com>
> ---
>  meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb
> b/meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb
> index 080d455..ccb7cbc 100644
> --- a/meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb
> +++ b/meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb
> @@ -9,11 +9,12 @@ SRC_URI[sha256sum] =
> "5a4de38068eca8919cb087d338c0c2e3d72c9382c804fb27ab746e6c78
>  UNKNOWN_CONFIGURE_WHITELIST += "--enable-wide-getaddrinfo"
> 
>  PACKAGECONFIG ??= ""
> +PACKAGECONFIG += "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6',
> 'ipv6', '', d)}"
>  PACKAGECONFIG[valgrind] = "--with-valgrind=yes, --with-valgrind=no, valgrind"
>  PACKAGECONFIG[gpm] = "--with-gmp=yes, --with-gmp=no, gmp"
> +PACKAGECONFIG[ipv6] = ",--enable-wide-getaddrinfo,"
> 
>  EXTRA_OECONF = "\
> -    --enable-wide-getaddrinfo \
>      --disable-versioned-paths \
>      --disable-rpath \
>      --disable-dtrace \
> 

