Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 37CE76BDD2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 03:27:39 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id z3so5445729pgp.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 20:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=NeNFr3vF3z0TKipspvkr2niWHHMhPG+o2nv+qiYFB/k=;
	b=YLinXsmGSsq9M0m/ixgz1BEk+mvZEUNZZPvZFrVaYB8xJvLmH/EsckhKCoY5ssT+iG
	nwVvumERwxPbfpAVznRRSFkikyZz3N+/BAjTLKX5iz/KXgtVfDfRhurVFE8jqFXFapk3
	L+0HbFk91kpTnHR0IoWtL6QkW2PK7VBt7kPI1SONukzWMlbo8kAgetiQe0arb+T54/UA
	AG43zJjhrF3Ho8L/FbRqQln4FiUjLM5t523AoFbavFzX4wiSvGaw8t+gV8RsOdXb/q2x
	oHy2lF6HIuqnysZGB/uG1ipUPU3XlNLCRNPif0M5Xpj9AN+a0W0xeSghqjH+V1MjsrPD
	gOvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=NeNFr3vF3z0TKipspvkr2niWHHMhPG+o2nv+qiYFB/k=;
	b=RXAWDyTBye+CEOsz0gLtWTDQp+xKEvViUgTMnh1a3BvyIRz9wn9o88HuS7iwUJr7yX
	ft8CmTwAbfu1VNaumJsrjukp6shNQzreSBHU9A78TlzVeARM/6lXaPpWm3kwEs61mOM3
	kPOzrx76hu/V9hBPEnNNpmeuF7edeAYcy6QBANR3OaZKtvmnSUjT7KJqX+W5EzCSjg/5
	XXe0zfQ8l5xNulz1W+G9eGZpYZ4Rt3hr6CPxr2zm36LfGIgvUZiP63G9Z5rk3veibrrB
	B9tKPy4OFqHJJOM5rSiQgACSdqZobBxGolkxUIRkcIMbL0C9fS9Wu3mDxhNTbtEkZqqU
	i2eQ==
X-Gm-Message-State: APjAAAUIxXUadfCIQpFd0gggumPkYH+F3AGxqJLixWLoie+Dka7CZ/5k
	bUZjvZaWixOtK4hFBhiqf38=
X-Google-Smtp-Source: APXvYqyJeH4BTipQKPuMvGEap24evaoOvz9DSekaFieH+K/07lM5fx65bgF8kc5jqpvkDGUv5prVHw==
X-Received: by 2002:a17:90a:5d0a:: with SMTP id
	s10mr2681873pji.94.1559014059974; 
	Mon, 27 May 2019 20:27:39 -0700 (PDT)
Received: from apollo ([2601:646:8500:6bc6::e252])
	by smtp.gmail.com with ESMTPSA id
	d186sm16132450pfd.183.2019.05.27.20.27.38
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 27 May 2019 20:27:39 -0700 (PDT)
Date: Mon, 27 May 2019 20:27:30 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Vincent Prince <vincent.prince.fr@gmail.com>
Message-ID: <20190528032730.lzggdqsjix56r6fo@apollo>
References: <1554298095-26709-3-git-send-email-vincent.prince.fr@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1554298095-26709-3-git-send-email-vincent.prince.fr@gmail.com>
User-Agent: NeoMutt/20180716
Cc: openembedded-devel@lists.openembedded.org, bunk@stusta.de
Subject: Re: [meta-oe,v2,2/3] cppzmq: bump version 4.2.3 => 4.3.1
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
X-List-Received-Date: Tue, 28 May 2019 03:27:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 03, 2019 at 03:28:14PM +0200, Vincent Prince wrote:
> Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
> ---
> Changes in v2:
>  - Remove git SRCPV from PV
> 
>  meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> index 9aff59c..95b5215 100644
> --- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> +++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> @@ -4,8 +4,8 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=db174eaf7b55a34a7c89551197f66e94"
>  DEPENDS = "zeromq"
>  
> -SRCREV = "6aa3ab686e916cb0e62df7fa7d12e0b13ae9fae6"
> -PV = "4.2.3+git${SRCPV}"
> +SRCREV = "213da0b04ae3b4d846c9abc46bab87f86bfb9cf4"
> +PV = "4.3.1"

Can you rebase this on top of latest master and resend, I merged an
older patch which bumped it to 4.3.0

>  
>  SRC_URI = "git://github.com/zeromq/cppzmq.git"
>  
> @@ -13,6 +13,8 @@ S = "${WORKDIR}/git"
>  
>  inherit cmake
>  
> +EXTRA_OECMAKE = "-DCPPZMQ_BUILD_TESTS=OFF"
> +
>  PACKAGES = "${PN}-dev"
>  
>  RDEPENDS_${PN}-dev = "zeromq-dev"

