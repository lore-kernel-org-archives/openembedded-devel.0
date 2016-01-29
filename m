Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 37FF36010D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2016 13:36:23 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id f81so88790667iof.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2016 05:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=aMEHemsTgln8wzuOxHTAPvEx5wHGOjO+d3cYhwaETio=;
	b=o0RfFr4D/t4j1hcdgMdote4PmVv+k16RxSl3YJyvSb853Tp5BfSICaSBfgfIcCAPyl
	X7KE7J8QrwfeMpoLXIhI1j8CcwU4FQjgbRSdd/DfPh4FEjIVxOm9Y0B2kGtgb8fjetki
	ed20lU2yGW89XZyT0A1nFDKakMxz001moK2uYM3f7uWcBRiaxsFnxQEEFjR1U0kw2aMe
	O1wEl8p/BdnS0S4nOjfZcGswoH0vNrpOe27MYARf2ZPODspc0TPIrkW3mAbDwvvOJtDy
	aAgqC8efcb27W5SmrCS8ytnsoPwWcTRzeNbNRNKWA8RlAkVegKfEw+XG6O5SjWROMJCU
	Nq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=aMEHemsTgln8wzuOxHTAPvEx5wHGOjO+d3cYhwaETio=;
	b=lHeimfIkkkPezcKTQKGLMKoSd5nKj8IDm9J36HlP+j4pSfNzULEBvUUbXXBRzUeMJe
	yGpO50JzlyXiXxfUF8qljcUl+o3hpA44hUNVhSXTlO+M48Yze7SNTxlud4okpZ1mi7ol
	B39yD9sTKxmy+0Xac8YhBRp95JXv+yXbaHL8fgF55MSSvH63Qx7UPO9tUTGzCn9XT0OS
	gBPlGcijhlR1vDVMULXqTMgSRAal2dgUzrCxWBfjUACwhRdGbojVEUq3EeeaFj9dD1ka
	zcbtU+gSlljia/LrtC0u6edvjQ1ZTnZQiiUiTtCvPagRnLwgs/78MbKf/xkW8hwzVg1v
	Bo0g==
X-Gm-Message-State: AG10YOS0WHJmOSGaDSYdccZ691SiR7L6DatHAFUpy3ZoIrsfXZ2z035J3p37k5MlsLnslBpULVXMolqo677gLg==
X-Received: by 10.107.165.14 with SMTP id o14mr9456967ioe.49.1454074584287;
	Fri, 29 Jan 2016 05:36:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Fri, 29 Jan 2016 05:35:54 -0800 (PST)
In-Reply-To: <97ec018d13981913df887195ca467ba75f2eb3b9.1454072848.git.adrian.ratiu@ni.com>
References: <397caaab4cdf263cb23cb988bbc100ee5e264261.1454072848.git.adrian.ratiu@ni.com>
	<97ec018d13981913df887195ca467ba75f2eb3b9.1454072848.git.adrian.ratiu@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Jan 2016 05:35:54 -0800
Message-ID: <CAMKF1soicUKUFx6Ro2F9EEhNcXxcZrrqJE872=X1EKE-34wjPw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] apache2: enable openldap support
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
X-List-Received-Date: Fri, 29 Jan 2016 13:36:24 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 29, 2016 at 5:08 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  meta-webserver/recipes-httpd/apache2/apache2_2.4.18.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.18.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.18.bb
> index 8ca6d00..d20ac09 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.18.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.18.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "The Apache HTTP Server is a powerful, efficient, and \
>  extensible web server."
>  SUMMARY = "Apache HTTP Server"
>  HOMEPAGE = "http://httpd.apache.org/"
> -DEPENDS = "libtool-native apache2-native openssl expat pcre apr apr-util"
> +DEPENDS = "libtool-native apache2-native openssl expat pcre apr apr-util openldap"
>  SECTION = "net"
>  LICENSE = "Apache-2.0"
>
> @@ -44,6 +44,8 @@ EXTRA_OECONF = "--enable-ssl \
>      --with-apr-util=${STAGING_BINDIR_CROSS}/apu-1-config \
>      --enable-info \
>      --enable-rewrite \
> +    --enable-ldap \
> +    --enable-authnz-ldap \

It is a good candidate for PACKAGECONFIG.


>      --with-dbm=sdbm \
>      --with-berkeley-db=no \
>      --localstatedir=/var/${BPN} \
> --
> 2.7.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

