Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4FE0277E71
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Oct 2017 03:50:03 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id n89so374382pfk.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Oct 2017 20:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=if3GdG0IeGH20caP17QUXkQhE/+jUU/Nikva8UUeB34=;
	b=pRShQUzFpNjXiBkv6ZBRQeiXrCUhFrXKzvOvDAk0AZaJjllqqhzNGDw36USkRfnWXl
	TL7F3EZoQ7HHOb10bfWs2iCUxzJNNZ7OdRKP79EXwD64kuNDzzzRWxODxrJu7AVAzzbK
	Wn4YU1nKvKu+yKBcY1FFgKmjRWTV1hP7J8HdLclMWjmgLZ24dATHWEmxjSK/5ksTAevg
	GovGQkTirjtLIRLk9DLnmMLErSAj+R5TSQkTIoEHNWyr/oInBoqs8sdqTzfnUkrGhOjZ
	jQNLy0bW7c4v43YDD+6dwRbKd3l+nKzFl24KO9nx1FHC/5EpvtIa/CXVHNeqgCVJiXVd
	YjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=if3GdG0IeGH20caP17QUXkQhE/+jUU/Nikva8UUeB34=;
	b=p7VBGDroK7QbaoO8yHCQFUWcr3xKV/HRMR/lG4G2BPc5FqYABevm/ZXvILTz+ABgD8
	+onLEd/tSbM3Fmn7mIZl489ljKXZAnlnpSS9jluhmOpIBZ5KUYDTjMQZ2k9lM4wdzVpl
	ADQ39SRlbOSGnaqeAdCnjYc7CfcYPgkhEfE5REVmM/0hwpE4kkWP597imYkc2Uvp5eky
	8SkWQMS7LHziquj1X9KZCrIIGTPlLYPBVnFxd16OYsU8jLgYPEt+ffD9SmuB9nvid3DY
	oQ0BFqNU6OKFBtLQ4FQhKc3wF2XbKBjavRuG6j6WPmMFWEo5RbSEA54uL/5ARCaHpe4e
	wGXw==
X-Gm-Message-State: AMCzsaVy3Oy0WXm3DEOXMtwsQ7Pi29wp2wA2JHBILyl5yHuG7ytnZN/M
	8xj+Aw32xb3i9gNxko29fdk=
X-Google-Smtp-Source: AOwi7QDj4jz2lMBjoQ0TIo5Ja8jobs29xbh03eeMgp6urF6TjWlnOek5iCy0qIGQftLrGBgRp25daQ==
X-Received: by 10.84.191.131 with SMTP id a3mr78866pld.253.1507866605295;
	Thu, 12 Oct 2017 20:50:05 -0700 (PDT)
Received: from apollo ([2601:646:8882:b8c::74e7])
	by smtp.gmail.com with ESMTPSA id a19sm85788pfh.30.2017.10.12.20.50.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 12 Oct 2017 20:50:04 -0700 (PDT)
Date: Thu, 12 Oct 2017 20:50:04 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Jonathan Liu <net147@gmail.com>
Message-ID: <20171013035004.mu3iuqo4jk7nqg4g@apollo>
References: <20171012072544.18509-1-net147@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20171012072544.18509-1-net147@gmail.com>
User-Agent: NeoMutt/20170912 (1.9.0)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] nodejs: Add npx to nodejs-npm package
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
X-List-Received-Date: Fri, 13 Oct 2017 03:50:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 12, 2017 at 07:25:44AM +0000, Jonathan Liu wrote:
> ${bindir}/npx is a symbolic link to npm-cli.js in the npm module.
> This avoids the nodejs package depending on nodejs-npm.
> 
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta-oe/recipes-devtools/nodejs/nodejs_8.4.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_8.4.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_8.4.0.bb
> index 5c580fb72..5bcbc0007 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_8.4.0.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_8.4.0.bb
> @@ -79,7 +79,7 @@ do_install_append_class-target() {
>  }
>  
>  PACKAGES =+ "${PN}-npm"
> -FILES_${PN}-npm = "${exec_prefix}/lib/node_modules ${bindir}/npm"
> +FILES_${PN}-npm = "${exec_prefix}/lib/node_modules ${bindir}/npm ${bindir}/npx"

looks ok.

>  RDEPENDS_${PN}-npm = "bash python-shell python-datetime python-subprocess python-textutils"
>  
>  PACKAGES =+ "${PN}-systemtap"
> -- 
> 2.14.2
> 

