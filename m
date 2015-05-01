Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id E6A0873DC0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 May 2015 12:21:54 +0000 (UTC)
Received: by wgso17 with SMTP id o17so89552247wgs.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 May 2015 05:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=RjHvrud9Tb788+3soEQxokTIGsLkMkhjaJRU5k8HU8g=;
	b=ugtRL/cHGz7Ii9vhnonWlrliuy0VhSllCMLwoWV3VOuSpM5eRdbpscnkvQ2MK9OwsH
	8p9gh+aWvofdHWi0aBLFq/VUEyNMKgd8ubiXYwG75t6wAzhiscT4cQyJI4z7h4+bemS/
	aZxjIwNWG8pB2GCae2yJLrptINlp/rOylgqMJdE0B5il2VTGaUygNTWt4M/0sUFbl8z0
	QEvc9UgPqBNb22NMiZsdPgkeonfpXaoPRSorsrr4d4mgv8SqCAobAILe1VVb9FvaTVy1
	zFVznReaMVCJlBmtrF80cHSGn3asJh8LELussfOQvG80bU+Iy6rNbzQkbfa8vOtvt+If
	HcUg==
X-Received: by 10.181.13.144 with SMTP id ey16mr14286683wid.38.1430482915204; 
	Fri, 01 May 2015 05:21:55 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id dg8sm7439560wjc.9.2015.05.01.05.21.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 May 2015 05:21:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 1 May 2015 14:22:10 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150501122210.GA2366@jama>
References: <1429058796-30801-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1429058796-30801-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-ruby][PATCH] ruby: Update to 2.2.2
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
X-List-Received-Date: Fri, 01 May 2015 12:21:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2015 at 05:46:36PM -0700, Armin Kuster wrote:
> Includes among other things: CVE-2015-1855: Ruby OpenSSL Hostname Verific=
ation
>=20
> for more info see:
> http://svn.ruby-lang.org/repos/ruby/tags/v2_2_2/ChangeLog

Hi,

both 2.2.1 and 2.2.2 are failing on some hosts native builds with:
| linking miniruby
| load.o: In function `rb_f_load':
| load.c:(.text+0x3af): undefined reference to `RUBY_DTRACE_LOAD_ENTRY_ENAB=
LED'
| load.c:(.text+0x428): undefined reference to `RUBY_DTRACE_LOAD_RETURN_ENA=
BLED'
| load.c:(.text+0x452): undefined reference to `RUBY_DTRACE_LOAD_RETURN'
| load.c:(.text+0x492): undefined reference to `RUBY_DTRACE_LOAD_ENTRY'
| load.o: In function `rb_require_internal':

=2E.

any idea what's causing it?

I'll add --disable-dtrace to see if it resolves the issue.

>=20
> also, fixed runtime error.
> only include "enable-wide-getaddrinfo" if IVP6 is enabled in disto feature
> otherwise 'gem install rails' throws an error for the missing symbol 'get=
ipnodebyname'.
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-ruby/recipes-devtools/ruby/{ruby_2.2.1.bb =3D> ruby_2.2.2.bb} | 8 +=
++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>  rename meta-ruby/recipes-devtools/ruby/{ruby_2.2.1.bb =3D> ruby_2.2.2.bb=
} (77%)
>=20
> diff --git a/meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb b/meta-ruby/re=
cipes-devtools/ruby/ruby_2.2.2.bb
> similarity index 77%
> rename from meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb
> rename to meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb
> index 29f2291..c463525 100644
> --- a/meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb
> +++ b/meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb
> @@ -1,7 +1,7 @@
>  require ruby.inc
> =20
> -SRC_URI[md5sum] =3D "b49fc67a834e4f77249eb73eecffb1c9"
> -SRC_URI[sha256sum] =3D "5a4de38068eca8919cb087d338c0c2e3d72c9382c804fb27=
ab746e6c7819ab28"
> +SRC_URI[md5sum] =3D "326e99ddc75381c7b50c85f7089f3260"
> +SRC_URI[sha256sum] =3D "5ffc0f317e429e6b29d4a98ac521c3ce65481bfd22a8cf84=
5fa02a7b113d9b44"
> =20
>  # it's unknown to configure script, but then passed to extconf.rb
>  # maybe it's not really needed as we're hardcoding the result with
> @@ -9,11 +9,13 @@ SRC_URI[sha256sum] =3D "5a4de38068eca8919cb087d338c0c2e=
3d72c9382c804fb27ab746e6c78
>  UNKNOWN_CONFIGURE_WHITELIST +=3D "--enable-wide-getaddrinfo"
> =20
>  PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv=
6', '', d)}"
> +
>  PACKAGECONFIG[valgrind] =3D "--with-valgrind=3Dyes, --with-valgrind=3Dno=
, valgrind"
>  PACKAGECONFIG[gpm] =3D "--with-gmp=3Dyes, --with-gmp=3Dno, gmp"
> +PACKAGECONFIG[ipv6] =3D ",--enable-wide-getaddrinfo,"
> =20
>  EXTRA_OECONF =3D "\
> -    --enable-wide-getaddrinfo \
>      --disable-versioned-paths \
>      --disable-rpath \
>      --enable-shared \
> --=20
> 2.3.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

