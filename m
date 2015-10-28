Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id AA88B76E04
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 16:23:49 +0000 (UTC)
Received: by pasz6 with SMTP id z6so11402953pas.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 09:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=/Y8o7kV6pE9k5ALnJmX4OpktGjKhWV314/1Yr8aWrgM=;
	b=pZq+TwMmYusAD9nv8N75YltQglAhxt7Rktwug2nv+KyPiMNyE173gZlq9QMvRY5DeP
	U0J0R6LLtBN5Vy0mc0EQ5ABpSK4aIPeV3i2FukCTbTHzWyFbgbsMN84wr34X/CKwx6hx
	JaRoepBRcUyb74OLuLvjeXKiibRHTw0R+ty7/I0Gii365ZPaS3svT4SxfMUnVv7E/B5Q
	3e9LnxNO7ppA0uwNlsr6/cgCMb13tqIxtp+5vzIetxif5p7qfjnAuqdY1Ewcj/xlB3r4
	ig/dPCOJq0KvEtoS/Q07PCudx32zB5UX7arrXII8bp4g33lPXHnQD8xFYPRScaj3m17m
	VYVg==
X-Received: by 10.68.134.73 with SMTP id pi9mr35901173pbb.169.1446049429922;
	Wed, 28 Oct 2015 09:23:49 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:64b8:1072:ca0d:242?
	([2601:202:4000:1239:64b8:1072:ca0d:242])
	by smtp.googlemail.com with ESMTPSA id
	bt1sm3978915pbb.88.2015.10.28.09.23.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Oct 2015 09:23:48 -0700 (PDT)
To: george.mccollister@gmail.com
References: <1445897141-24786-1-git-send-email-george.mccollister@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5630F692.6050109@gmail.com>
Date: Wed, 28 Oct 2015 09:23:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1445897141-24786-1-git-send-email-george.mccollister@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH] apache2: fix config_vars.mk path contamination
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Oct 2015 16:23:49 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

George,

Should this be backported to fido and/or dizzy?

- armin

On 10/26/2015 03:05 PM, George McCollister wrote:
> Replace contaminated paths with staging paths so apxs can be successfully used
> in other recipes to build modules when host and target arch differ.
> 
> Signed-off-by: George McCollister <george.mccollister@gmail.com>
> ---
>  meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb
> index af5c72a..b62fd8c 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb
> @@ -117,6 +117,10 @@ apache_sysroot_preprocess () {
>      sed -i 's!^APR_CONFIG = .*!APR_CONFIG = ${STAGING_BINDIR_CROSS}/apr-1-config!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
>      sed -i 's!^APU_CONFIG = .*!APU_CONFIG = ${STAGING_BINDIR_CROSS}/apu-1-config!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
>      sed -i 's!^includedir = .*!includedir = ${STAGING_INCDIR}/apache2!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
> +    sed -i 's!^CFLAGS = -I[^ ]*!CFLAGS = -I${STAGING_INCDIR}/openssl!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
> +    sed -i 's!^EXTRA_LDFLAGS = .*!EXTRA_LDFLAGS = -L${STAGING_LIBDIR}!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
> +    sed -i 's!^EXTRA_INCLUDES = .*!EXTRA_INCLUDES = -I$(includedir) -I. -I${STAGING_INCDIR}!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
> +    sed -i 's!--sysroot=[^ ]*!--sysroot=${STAGING_DIR_HOST}!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
>  }
>  
>  #
> 

