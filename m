Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q2Af2-0005gj-Sg
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 00:06:49 +0100
Received: by iwn10 with SMTP id 10so8290245iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 16:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=faiN9m5yRSbX+KQVcc4nhLDjYGfvt7yYhwuOuWmjiEU=;
	b=a9MBJUO+sJ4WDFgCh7JrMumxFFg9+EUaNioTvpANNzsp85oTNSmfjNytktSVhAspQp
	sSUHXrWLvcMc6B4SVN/6BlsxpwNi9j8k6aLks8rIh7Bvp18dnJ9YqzxxzqNQO3PhkQR+
	lCk5BYW4AR4hC6a9nVk6L0d7N2vuK3+P1TRLc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=n0X4XkYTJubfcD5ILcwBvMv0o+vg0nftR0ihIkeR2REqfRKZpyhq3XDD+YnduQ5sXI
	jTVpPlCJQmpsxgnmOei58cdUuUdg1fMgOOCGeNTIXq8a69n7YZSnn/cawXXFpLQ5CGwj
	B0H+mCtbS4qWaQTuGlDV1UFmtdwWMSje+Ofwc=
Received: by 10.42.96.4 with SMTP id h4mr10125907icn.136.1300835097989;
	Tue, 22 Mar 2011 16:04:57 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 8sm4668426iba.38.2011.03.22.16.04.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Mar 2011 16:04:56 -0700 (PDT)
Date: Tue, 22 Mar 2011 16:05:13 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110322230513.GD13076@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	Kartik Mohta <kartikmohta@gmail.com>
References: <1300833106-28370-1-git-send-email-kartikmohta@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1300833106-28370-1-git-send-email-kartikmohta@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Kartik Mohta <kartikmohta@gmail.com>
Subject: Re: [PATCH] libarchive: Requires libxml2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Mar 2011 23:06:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (23/03/11 04:01), Kartik Mohta wrote:
> Signed-off-by: Kartik Mohta <kartikmohta@gmail.com>
> ---
>  recipes/libarchive/libarchive_2.8.4.bb |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)


Why did you resend it ?

> 
> diff --git a/recipes/libarchive/libarchive_2.8.4.bb b/recipes/libarchive/libarchive_2.8.4.bb
> index 551746b..1139416 100644
> --- a/recipes/libarchive/libarchive_2.8.4.bb
> +++ b/recipes/libarchive/libarchive_2.8.4.bb
> @@ -4,6 +4,8 @@ SECTION = "devel"
>  LICENSE = "BSD"
>  PR = "r0"
>  
> +DEPENDS = "libxml2"
> +
>  SRC_URI = "http://libarchive.googlecode.com/files/${PN}-${PV}.tar.gz \
>             file://0001-Patch-from-upstream-revision-1990.patch \
>             file://0002-Patch-from-upstream-revision-1991.patch \
> -- 
> 1.7.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


