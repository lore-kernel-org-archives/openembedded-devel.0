Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OlKo2-0002ZX-Hv
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 13:58:18 +0200
Received: by fxm6 with SMTP id 6so3566741fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 04:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Ob3k/o5K0j130eiwwwAmS8QCeBFDs4Si0/bSXhTAyxw=;
	b=IpLWD/Evp7sBzlO3ULrYFi3DIMz+B3p+M+H2jjCr25t3v/jk4ji/G846iZNh0Eg4eM
	RX50bKHhei4Eo17N88+F3QytAyOXOqY5LfcOO/RejyG0GJwPV1b0ap/H2xUI/kpsOH5V
	XyTs6nqsGwqAfXhK0pBmZkmsbSuNTj+HwqhfU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Ntn2JmrT8F9gFAKzLg13tw0ynX3JdEuku/edViNFf+5xhpoj/1MHnEr6YsV8TsD8Mg
	gJNOGxU4/ITyewSU1Z5JEJRQcjSYXfUynrtZ1LKQm+hYApJQssAi7CJc+x9ltRiATs9H
	On2nMYqmpN+4nfwX1b0Eu0VagitcxMVOE/Ebo=
Received: by 10.223.121.19 with SMTP id f19mr6363161far.73.1282046274468;
	Tue, 17 Aug 2010 04:57:54 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b9sm2912156faq.7.2010.08.17.04.57.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 17 Aug 2010 04:57:53 -0700 (PDT)
Date: Tue, 17 Aug 2010 13:58:09 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100817115809.GF11569@jama>
References: <1281983778-21054-1-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1281983778-21054-1-git-send-email-khimov@altell.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] openssl: update 1.0.0 to 1.0.0a
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
X-List-Received-Date: Tue, 17 Aug 2010 11:58:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 16, 2010 at 10:36:18PM +0400, Roman I Khimov wrote:
> * exactly one fix, considered as safe upgrade
> 
> Signed-off-by: Roman I Khimov <khimov@altell.ru>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
>  .../include/angstrom-2008-preferred-versions.inc   |    4 +-
>  conf/distro/include/preferred-shr-versions.inc     |    4 +-
>  .../openssl/openssl-1.0.0/configure-targets.patch  |   25 -
>  recipes/openssl/openssl-1.0.0/debian.patch         |  515 --------------------
>  .../engines-install-in-libdir-ssl.patch            |   53 --
>  recipes/openssl/openssl-1.0.0/libdeps-first.patch  |   27 -
>  recipes/openssl/openssl-1.0.0/oe-ldflags.patch     |   22 -
>  recipes/openssl/openssl-1.0.0/shared-libs.patch    |   48 --
>  .../openssl/openssl-1.0.0a/configure-targets.patch |   25 +
>  recipes/openssl/openssl-1.0.0a/debian.patch        |  515 ++++++++++++++++++++
>  .../engines-install-in-libdir-ssl.patch            |   53 ++
>  recipes/openssl/openssl-1.0.0a/libdeps-first.patch |   27 +
>  recipes/openssl/openssl-1.0.0a/oe-ldflags.patch    |   22 +
>  recipes/openssl/openssl-1.0.0a/shared-libs.patch   |   48 ++
>  recipes/openssl/openssl-native_1.0.0.bb            |   27 -
>  recipes/openssl/openssl-native_1.0.0a.bb           |   27 +
>  recipes/openssl/openssl_1.0.0.bb                   |   30 --
>  recipes/openssl/openssl_1.0.0a.bb                  |   30 ++
>  18 files changed, 751 insertions(+), 751 deletions(-)
>  delete mode 100644 recipes/openssl/openssl-1.0.0/configure-targets.patch
>  delete mode 100644 recipes/openssl/openssl-1.0.0/debian.patch
>  delete mode 100644 recipes/openssl/openssl-1.0.0/engines-install-in-libdir-ssl.patch
>  delete mode 100644 recipes/openssl/openssl-1.0.0/libdeps-first.patch
>  delete mode 100644 recipes/openssl/openssl-1.0.0/oe-ldflags.patch
>  delete mode 100644 recipes/openssl/openssl-1.0.0/shared-libs.patch
>  create mode 100644 recipes/openssl/openssl-1.0.0a/configure-targets.patch
>  create mode 100644 recipes/openssl/openssl-1.0.0a/debian.patch
>  create mode 100644 recipes/openssl/openssl-1.0.0a/engines-install-in-libdir-ssl.patch
>  create mode 100644 recipes/openssl/openssl-1.0.0a/libdeps-first.patch
>  create mode 100644 recipes/openssl/openssl-1.0.0a/oe-ldflags.patch
>  create mode 100644 recipes/openssl/openssl-1.0.0a/shared-libs.patch
>  delete mode 100644 recipes/openssl/openssl-native_1.0.0.bb
>  create mode 100644 recipes/openssl/openssl-native_1.0.0a.bb
>  delete mode 100644 recipes/openssl/openssl_1.0.0.bb
>  create mode 100644 recipes/openssl/openssl_1.0.0a.bb


