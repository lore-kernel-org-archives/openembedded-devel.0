Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9CA6260125
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 12:57:23 +0000 (UTC)
Received: by wmeg8 with SMTP id g8so12608136wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2015 04:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iIxrjTRtmntYhyKvepBa5dhuNFtx33sKK4YA3YqBq24=;
	b=cbWD6fggTtfTIhMgh2a6tt9L6OJUit0RvNxv0iyMQKnNTq8L0qkpdpladWbSJ1gk3J
	n1eK/T42sN0WdHsGfRSb+7JDGkB2NZ9Vv/po6nyKIA/Ibb3U6ownh8z2JlzZ5g6nqAQH
	R6dFmp2XxOmwfDhNkNBK1OYewam6+KKO2wjrFA5c1Omz7SAxf8wP6wZLPpC6VN3r0uUS
	LWhm+PBX/oMhs00Ax/yy1APYar66l88zbckZRqxjGUrSNMkxJyf96HOLIW2Fnsw1C/ug
	5aLMZ+R6m0XYeTl1T7/bLqXF9mVomYX/bsOUdkvgLu19gaBosTzynbqqqtJLrFVCYAJ+
	T7GA==
X-Received: by 10.28.21.134 with SMTP id 128mr3517557wmv.29.1446728243012;
	Thu, 05 Nov 2015 04:57:23 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id e9sm6902520wjw.8.2015.11.05.04.57.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Nov 2015 04:57:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 5 Nov 2015 13:57:33 +0100
To: Ulf Magnusson <ulfalizer@gmail.com>,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20151105125733.GE2556@jama>
References: <CAFkk2KQhpgBHLo2AyxWAL9aB1AQRi4BM3DCOanbCKBY4wKb0Gg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFkk2KQhpgBHLo2AyxWAL9aB1AQRi4BM3DCOanbCKBY4wKb0Gg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: mark.asselstine@windriver.com, openembedded-devel@lists.openembedded.org
Subject: Re: meta-openembedded/meta-ruby: ruby-1.9.3-disable-versioned-paths.patch misses one path
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
X-List-Received-Date: Thu, 05 Nov 2015 12:57:24 -0000
X-Groupsio-MsgNum: 58345
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SNIs70sCzqvszXB4"
Content-Disposition: inline

--SNIs70sCzqvszXB4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 05, 2015 at 01:38:18PM +0100, Ulf Magnusson wrote:
> Hello,
>=20
> ruby-1.9.3-disable-versioned-paths.patch adds the
> --disable-versioned-paths option, which strips Ruby's version number
> from some install paths. The patch misses a spot however, which causes
> TOPDIR to get an incorrect value (nil) in rbconfig.rb. This in turn
> causes problems e.g. when trying to cross-compile native extensions.
>=20
> The following patch fixes this. It assumes
> ruby-1.9.3-disable-versioned-paths.patch has already been applied.

ruby was already moved from meta-ruby to oe-core, send proper patch to
oe-core ML (ruby-1.9.3-disable-versioned-paths.patch isn't there).

commit 10fd3b41449d1af15ac9432bc1a7fe26c6f1dae1
Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date:   Thu Jun 4 13:17:31 2015 +0300

    ruby: add a recipe from meta-ruby

commit e04d53bdc83b0ae26fcde85b37fff20963232d9e
Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date:   Mon Sep 14 15:26:47 2015 +0300

    ruby: remove the recipe due to its move to oe-core

>=20
> ---
>  tool/mkconfig.rb | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/tool/mkconfig.rb b/tool/mkconfig.rb
> index 10dbe65..aa54512 100755
> --- a/tool/mkconfig.rb
> +++ b/tool/mkconfig.rb
> @@ -44,6 +44,7 @@ vars =3D {}
>  continued_name =3D nil
>  continued_line =3D nil
>  path_version =3D "/$(ruby_version)"
> +prefix_version =3D "/#{version}"
>  File.foreach "config.status" do |line|
>    next if /^#/ =3D~ line
>    name =3D nil
> @@ -149,7 +150,10 @@ File.foreach "config.status" do |line|
>      when "ruby_version"
>        version =3D val[/\A"(.*)"\z/, 1]
>      when /^USE_VERSIONED_PATHS$/
> -      path_version =3D nil if /NO/ =3D~ val
> +      if /NO/ =3D~ val
> +        path_version =3D nil
> +        prefix_version =3D nil
> +      end
>      end
>    end
>  #  break if /^CEOF/
> @@ -157,7 +161,7 @@ end
>=20
>  drive =3D File::PATH_SEPARATOR =3D=3D ';'
>=20
> -prefix =3D "/#{v_runtime[:libdir] || 'lib'}/ruby/#{version}/#{arch}"
> +prefix =3D "/#{v_runtime[:libdir] || 'lib'}/ruby#{prefix_version}/#{arch=
}"
>  print "  TOPDIR =3D File.dirname(__FILE__).chomp!(#{prefix.dump})\n"
>  print "  DESTDIR =3D ", (drive ? "TOPDIR && TOPDIR[/\\A[a-z]:/i] || " :
> ""), "'' unless defined? DESTDIR\n"
>  print <<'ARCH' if universal
> --=20
> 2.1.4
>=20
>=20
> Another "bug" is that meta/recipes-devtools/ruby (i.e., the newer Ruby
> recipe) uses --disable-versioned-paths too even though afaics no such
> option exists in that version. Maybe I should report that separately.
>=20
> Cheers,
> Ulf

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SNIs70sCzqvszXB4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlY7Uj0ACgkQN1Ujt2V2gBzcTgCgiT4UPvxkZquQ9sqT9JmdTdPS
n1QAnRRAgONoX7oxQHsq2TAU94ud2J1v
=gbCL
-----END PGP SIGNATURE-----

--SNIs70sCzqvszXB4--
