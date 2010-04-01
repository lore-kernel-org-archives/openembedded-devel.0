Received: from qw-out-1920.google.com ([74.125.92.148])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NxRzV-0000xj-QX
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 23:31:57 +0200
Received: by qw-out-1920.google.com with SMTP id 4so480239qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Apr 2010 14:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=eICPjIOckBVZTQ2UBzdq3rIQbYt/BHrviQ+q09Nxow8=;
	b=A3WpPBatD9WX/VwOm68mXprwKyy50D4fxSEZ1Jh8c0OB8LpH/foT8KQdur5i7nCepd
	aEYnTg6yzGL5MwezpRmw8JaodDkL0K9GgLSbWdATVSL70WeYe+ZfE9OPx72kN23YNTjy
	bMTzcWmLIIkDoErxdTJ3fWVyR2wPdjqjQP+yk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=rL9gScCvW4xLUOxreJ2VVTIIa/RQnYAK7z6ZM47tbZdyT9ate7RgLF5qqCqpn3PmEM
	0jcrcLypXK16fGQztNh67QfV9CN3GIhLIeLEWCZj0dBJjV6zrNcauIrYsuBy61Qo8YwO
	8A6RHPIabu4xJaJLT+5JTxa56BP1TmDR2oABE=
Received: by 10.229.222.205 with SMTP id ih13mr2269752qcb.73.1270157317579;
	Thu, 01 Apr 2010 14:28:37 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id y41sm10225qce.23.2010.04.01.14.28.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 01 Apr 2010 14:28:36 -0700 (PDT)
Date: Thu, 1 Apr 2010 14:29:31 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100401212931.GB5580@gmail.com>
References: <1270152215-17642-1-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1270152215-17642-1-git-send-email-khimov@altell.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.92.148
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] gd: add gd-ft recipe
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
X-List-Received-Date: Thu, 01 Apr 2010 21:31:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (02/04/10 00:03), Roman I Khimov wrote:
> GD with Freetype support, this kind of setup is needed for some
> packages like sarg. If needed, choose with
> 
> PREFERRED_PROVIDER_gd = "gd-ft"

seems fine. It would be nice if there was a way to enable some features
in recipes thru DISTRO_FEATURES or some such.

> 
> Signed-off-by: Roman I Khimov <khimov@altell.ru>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  recipes/gd/gd-ft_2.0.35+2.0.36rc1.bb |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/gd/gd-ft_2.0.35+2.0.36rc1.bb
> 
> diff --git a/recipes/gd/gd-ft_2.0.35+2.0.36rc1.bb b/recipes/gd/gd-ft_2.0.35+2.0.36rc1.bb
> new file mode 100644
> index 0000000..174bbe6
> --- /dev/null
> +++ b/recipes/gd/gd-ft_2.0.35+2.0.36rc1.bb
> @@ -0,0 +1,8 @@
> +include gd_${PV}.bb
> +
> +DEPENDS += "freetype"
> +
> +PROVIDES = "gd"
> +RPROVIDES_${PN} = "gd"
> +
> +EXTRA_OECONF += "--with-freetype"
> \ No newline at end of file
> -- 
> 1.6.4.2
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


