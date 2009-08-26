Received: from [209.85.216.197] (helo=mail-px0-f197.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MgM8Y-0004OO-Fw
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Aug 2009 19:18:18 +0200
Received: by pxi35 with SMTP id 35so262375pxi.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2009 10:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=JIXObaCwMv/FKo8ggYl2ZwznS0KpjmLRL6zClSGnp/k=;
	b=pIh5Ea5HxuzhVxzoLOz828YZsxANi0t0XVR0TE6ECpn7B84zw9Cw+rAaWYWONip9tl
	67/EyEHFRuJ+HbqNVPMj7FoE8nDh6nA5rrF9ACf+9EX+9ida8MLkyRQDiQt6A9vsAiKs
	EzFGDspu2D1rw3SbnhoFytGzvzEFCQ5/3+PIA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ruhBkX/74Oibe+8HVyuOVPMecVzG36I+ORFuYKB3hJOg6lZCxveIpz58+y9QGvaGxI
	9n/1RXd7f987WoQNAOBNEugzVE8va5DMuGCYom7GciyGU4/BcKqOmpzUWaQVuizoVvab
	3kONzN/eIefsp7C+J+DtdYK/3JDPT9O0rksDA=
Received: by 10.114.253.13 with SMTP id a13mr5466099wai.13.1251306018012;
	Wed, 26 Aug 2009 10:00:18 -0700 (PDT)
Received: from gmail.com (adsl-71-146-29-169.dsl.pltn13.sbcglobal.net
	[71.146.29.169])
	by mx.google.com with ESMTPS id l38sm1184984waf.44.2009.08.26.10.00.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 Aug 2009 10:00:16 -0700 (PDT)
Date: Wed, 26 Aug 2009 10:00:12 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090826170012.GE31371@gmail.com>
References: <1251299296-27784-1-git-send-email-edoiron@cbnco.com>
MIME-Version: 1.0
In-Reply-To: <1251299296-27784-1-git-send-email-edoiron@cbnco.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] openvpn: add v2.0.9+2.1rc19
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
X-List-Received-Date: Wed, 26 Aug 2009 17:18:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (26/08/09 11:08), Evan Doiron wrote:
> Signed-off-by: Evan Doiron <edoiron@cbnco.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  conf/checksums.ini                       |    4 ++++
>  recipes/openvpn/openvpn_2.0.9+2.1rc19.bb |    6 ++++++
>  2 files changed, 10 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/openvpn/openvpn_2.0.9+2.1rc19.bb
> 
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 1b3e5db..b1cb4fe 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -1778,6 +1778,10 @@ sha256=d5b93fb8dbfa73e4a542bb8ad7d61c8b48dcf79948da26da9e9ef3b1a49c4221
>  md5=c6b1aa28bfecdd0c693a2afc43d7679e
>  sha256=d5b93fb8dbfa73e4a542bb8ad7d61c8b48dcf79948da26da9e9ef3b1a49c4221
>  
> +[http://openvpn.net/release/openvpn-2.1_rc19.tar.gz]
> +md5=ba2ee667a8b7606b125b7d32f47ca578
> +sha256=d7f52e2217ed1cf367ca93257b27c8acb29fcae4fcaa31b4a94146a3c7a7de33
> +
>  [http://www.auto.tuwien.ac.at/~mkoegler/eib/argp-standalone-1.3.tar.gz]
>  md5=8a336796eeb2a765b76f68e3312adaab
>  sha256=8b9067e77812c67c1e1b96ab9d92ab9af3a97e991d3c385b6e241d97f0e3cd28
> diff --git a/recipes/openvpn/openvpn_2.0.9+2.1rc19.bb b/recipes/openvpn/openvpn_2.0.9+2.1rc19.bb
> new file mode 100644
> index 0000000..9375cd6
> --- /dev/null
> +++ b/recipes/openvpn/openvpn_2.0.9+2.1rc19.bb
> @@ -0,0 +1,6 @@
> +require openvpn.inc
> +
> +SRC_URI = "http://openvpn.net/release/openvpn-2.1_rc19.tar.gz \
> +	   file://openvpn"
> +
> +S = "${WORKDIR}/openvpn-2.1_rc19"
> -- 
> 1.6.0.2
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


