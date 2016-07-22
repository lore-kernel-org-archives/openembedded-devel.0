Return-Path: <michael@walle.cc>
Received: from ssl.serverraum.org (ssl.serverraum.org [213.133.101.245])
	by mail.openembedded.org (Postfix) with ESMTP id D08A06067D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jul 2016 17:17:01 +0000 (UTC)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 1847222375
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jul 2016 19:16:58 +0200 (CEST)
Authentication-Results: ssl.serverraum.org; dmarc=none header.from=walle.cc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
	s=mail2016061301; t=1469207818;
	bh=FF/RQ+dlRfXSfpv1rsfwkl/4CkdcJA8Kk5d0vNc5Kbo=;
	h=Date:From:To:Subject:In-Reply-To:References:From;
	b=oGM1SR9ScUEykMcO8XYLAu19M3i9w+d5yptYa+ajBjxfVhzu8VVeEapC+EHz9zl1+
	kKJzq3bXAwGJfJq2xc5Abnnn7pQleZO+V8LP2SL6yW3QWjv+EQp8wXkWK2PlHOLVVl
	qzBsw3GdUmnK7lozFATGM17mzwngnmnGlNGRLHYs=
MIME-Version: 1.0
Date: Fri, 22 Jul 2016 19:16:58 +0200
From: Michael Walle <michael@walle.cc>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1468576710-25964-1-git-send-email-michael@walle.cc>
References: <1468576710-25964-1-git-send-email-michael@walle.cc>
Message-ID: <50c079e4930da85fc915be10a0335c93@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.1.5
X-Virus-Scanned: clamav-milter 0.99.2 at web
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on web.serverraum.org
Subject: Re: [PATCH] klibc: fix install destination in 64bit env
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
X-List-Received-Date: Fri, 22 Jul 2016 17:17:03 -0000
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Am 2016-07-15 11:58, schrieb Michael Walle:
> klibc installs everything into /usr/lib by default. But the recipe 
> assumes
> it installs to ${libdir} which is /usr/lib64 in 64bit environment. 
> Package
> generation fails badly in this case. Set INSTALLDIR to fix this.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  meta-initramfs/recipes-devtools/klibc/klibc.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc
> b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> index 65ee868..f00e31a 100644
> --- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
> +++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> @@ -27,6 +27,7 @@ EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
> 
> 'KLIBCLIBGCC=${STAGING_DIR_TARGET}${libdir}/${TARGET_SYS}/*/libgcc.a'
> \
>                  'prefix=${exec_prefix}' \
>                  'INSTALLROOT=${D}' \
> +                'INSTALLDIR=${libdir}/klibc' \
>                  'SHLIBDIR=${libdir}' \
>                  "

ping?

-michael

