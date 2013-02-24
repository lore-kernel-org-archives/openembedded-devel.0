Received: from mail-pb0-f51.google.com ([209.85.160.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U9WeP-0005fC-Sc
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Feb 2013 09:10:04 +0100
Received: by mail-pb0-f51.google.com with SMTP id un15so1145069pbc.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Feb 2013 23:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=foosBKiqUqFRSCelHJHpkptwap2mjtAdTJ+m9qi6x2g=;
	b=fkN6FbyoGK2SPEPoMVdPc76IAjor+xgvlIRteGdDBRLaU4TOCP16BdmAVPSel1xnau
	EFUGyzwbaTV2nfJYfyJX+xpy9KyQCGVZsPK073dSmV6J0ZheVP8JwYF6mTWgY8nHXFfP
	YDJ5kTReFPI+73vtEMjtsUuRgkFrVLkEEYTjNFYgu9qWYFMjQDWXyqMwZNEFPAsIePmM
	hLz8YYkTDLRcriXsAbSabj5+vC/0Nh2rMOxsrAV8dq88C8wBJfVgenLUrootvb+AR7Uz
	YFBIhBv2UOk6qK39y7AyQBxlOVFCekBU+7bYqXtOFDgIPG2xpg3SsCpwXNiey1dXvOki
	UNvg==
X-Received: by 10.66.86.201 with SMTP id r9mr13129337paz.14.1361692401149;
	Sat, 23 Feb 2013 23:53:21 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id tp2sm8536337pbc.12.2013.02.23.23.53.20
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 23 Feb 2013 23:53:20 -0800 (PST)
Date: Sat, 23 Feb 2013 23:53:17 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130224075316.GB3154@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1419614.dDVzLBbgHh@helios>
	<1360343778-10661-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1360343778-10661-2-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1360343778-10661-2-git-send-email-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 4/8] memcached: add 1.4.15
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
X-List-Received-Date: Sun, 24 Feb 2013 08:10:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (08/02/13 18:16), Marcin Juszkiewicz wrote:
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  .../recipes-support/memcached/memcached_1.4.15.bb     | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-networking/recipes-support/memcached/memcached_1.4.15.bb
> 
> diff --git a/meta-networking/recipes-support/memcached/memcached_1.4.15.bb b/meta-networking/recipes-support/memcached/memcached_1.4.15.bb
> new file mode 100644
> index 0000000..b6d436e
> --- /dev/null
> +++ b/meta-networking/recipes-support/memcached/memcached_1.4.15.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION = "Free & open source, high-performance, distributed memory object \
> +caching system, generic in nature, but intended for use in speeding up dynamic \
> +web applications by alleviating database load."
> +HOMEPAGE = "http://memcached.org/"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=7e5ded7363d335e1bb18013ca08046ff"
> +
> +SRC_URI = "http://memcached.googlecode.com/files/memcached-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "36ea966f5a29655be1746bf4949f7f69"
> +SRC_URI[sha256sum] = "169721ab7a7531add6ae9f6b14b6b5641725fe0b1f0bdf5c3a4327725901e2b4"
> +
> +DEPENDS = "libevent"
> +
> +inherit autotools
> +
> +do_configure_prepend_aarch64() {
> +	export ac_cv_c_endian=little
> +}

instead you could have used CACHED_CONFIGUREVARS_aarch64 =
"ac_cv_c_endian=little" 
> -- 
> 1.8.0
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


