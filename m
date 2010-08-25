Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OoLFh-0005qr-4Q
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 21:03:14 +0200
Received: by gya6 with SMTP id 6so353066gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Aug 2010 12:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=pH6K/37GjEfvHqc2Npv7fK11T2y0m6jtNqVNX6SkMdg=;
	b=bvGsCkE3VSCT63KtL4Zw5MN8xF1PzPvgPd81j1KEwRvsaykTLAav3Ffcrz98zsuR5+
	A/9oNBOeIw1zrpx+gRX/Lcd7ZlckV4cV2VjuZRj7M/JkYn0Mf135u3savI4S1SsGdXhz
	+3Apw7ceGRt73ZftSHnZFzu1tDgKjAI2+dysU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=SssceGIHLJlNHkROi8K8qE8yYeAxrpgFEDf4Aw3zsYF6RX9X/W3BPerC33ifGWfOdQ
	regXlah6gSluJsBvsrXWPEt2BfcoQspoiqo5ZuW4tZ4fLQeJUm+jPb03aTAtCOqVKkKx
	68QF+smVziV8rfzR1Bn+qlaO4f2m6dHsu9fWM=
MIME-Version: 1.0
Received: by 10.90.80.2 with SMTP id d2mr6001121agb.44.1282762964984; Wed, 25
	Aug 2010 12:02:44 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Wed, 25 Aug 2010 12:02:44 -0700 (PDT)
In-Reply-To: <1282760560-19990-1-git-send-email-khimov@altell.ru>
References: <AANLkTinQqY=C+7ES=qZ8vRuQi_UOWOKX4PHQ7XFtqH2k@mail.gmail.com>
	<1282760560-19990-1-git-send-email-khimov@altell.ru>
Date: Wed, 25 Aug 2010 21:02:44 +0200
Message-ID: <AANLkTinrxGQw+VJkBVXT2iwP9Apf0p6DU1GnPyLsOc+R@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] squid: remove version 2.6.STABLE14
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
X-List-Received-Date: Wed, 25 Aug 2010 19:03:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

2010/8/25 Roman I Khimov <khimov@altell.ru>:
> Very old, buggy, unsupported by upstream.
> ---
> =A0recipes/squid/squid.inc =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +-
> =A0recipes/squid/squid_2.6.STABLE14.bb | =A0 11 -----------
> =A0recipes/squid/squid_2.7.STABLE8.bb =A0| =A0 =A03 ---
> =A0recipes/squid/squid_3.1.7.bb =A0 =A0 =A0 =A0| =A0 =A03 ---
> =A04 files changed, 1 insertions(+), 18 deletions(-)
> =A0delete mode 100644 recipes/squid/squid_2.6.STABLE14.bb
>
> diff --git a/recipes/squid/squid.inc b/recipes/squid/squid.inc
> index 477335b..daeeb55 100644
> --- a/recipes/squid/squid.inc
> +++ b/recipes/squid/squid.inc
> @@ -1,5 +1,5 @@
> =A0DESCRIPTION =3D "Squid is a caching proxy for the Web supporting HTTP,=
 HTTPS, FTP, and more"
> -LICENSE =3D "GPLv2"
> +LICENSE =3D "GPL"
> =A0INC_PR =3D "r10"
> =A0DEPENDS =3D "openssl openssl-native openldap"
>
> diff --git a/recipes/squid/squid_2.6.STABLE14.bb b/recipes/squid/squid_2.=
6.STABLE14.bb
> deleted file mode 100644
> index 9707ccc..0000000
> --- a/recipes/squid/squid_2.6.STABLE14.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -PR =3D "${INC_PR}.0"
> -
> -include squid.inc
> -
> -EXTRA_OECONF +=3D "--enable-storeio=3Dnull,ufs"
> -
> -SRC_URI +=3D "file://fix_epoll_check.patch \
> - =A0 =A0 =A0 =A0 =A0file://squidv2-build-cf_gen.patch"
> -
> -SRC_URI[squid-2.6.STABLE14.md5sum] =3D "eadb138d48320df8b99349121159c6bf=
"
> -SRC_URI[squid-2.6.STABLE14.sha256sum] =3D "dcb0c10965430862721b675e2f9f6=
a30819880e03124b5e9403bfce2c7f3b69a"
> diff --git a/recipes/squid/squid_2.7.STABLE8.bb b/recipes/squid/squid_2.7=
.STABLE8.bb
> index 039f986..26e0d55 100644
> --- a/recipes/squid/squid_2.7.STABLE8.bb
> +++ b/recipes/squid/squid_2.7.STABLE8.bb
> @@ -2,9 +2,6 @@ PR =3D "${INC_PR}.0"
>
> =A0include squid.inc
>
> -# GPLv2+ since 2.6.STABLE18
> -LICENSE =3D "GPL"
> -
> =A0EXTRA_OECONF +=3D "--enable-epoll --enable-storeio=3Dnull,ufs"
>
> =A0SRC_URI +=3D "file://fix_epoll_check.patch \
> diff --git a/recipes/squid/squid_3.1.7.bb b/recipes/squid/squid_3.1.7.bb
> index de0ddcd..3c831df 100644
> --- a/recipes/squid/squid_3.1.7.bb
> +++ b/recipes/squid/squid_3.1.7.bb
> @@ -2,9 +2,6 @@ PR =3D "${INC_PR}.0"
>
> =A0include squid.inc
>
> -# GPLv2+ since 2.6.STABLE18
> -LICENSE =3D "GPL"
> -
> =A0EXTRA_OECONF +=3D "--enable-epoll --enable-icap-client --with-dl --ena=
ble-linux-netfilter"
>
> =A0EXTRA_OEMAKE +=3D "DEFAULT_STYLESHEET=3D${sysconfdir}/squid/errorpage.=
css DEFAULT_CONFIG_DIR=3D${sysconfdir}/squid"
> --
> 1.6.4.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


