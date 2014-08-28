Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 64E0665D56
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 09:29:36 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id cc10so225568wib.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 02:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YnspZ43nthW4+uxNFvpH6d+UHCt15vYFg2nRVwlGpXY=;
	b=dBazu/6fgp42tZiNMq5jkx5uRHJOxmJzbgViExZfzyvqYfDyz2acVIgY5k7ZOQ1+70
	eyvquoodZAT06li9g8nCq6tGs/HxbunRRlcb7YNB6EqZiLXQRS2u3RbBiUT2SiaPi722
	sQHMOHiqBBub1bdIs7aHQ4tlN8RnA2A0ogvhXCW7nnOl+2hlsMYML8PdQqnh0+uZCD/w
	vQh9rB3nldpHm+YqdXvwa3+nKy2CgdIYMicxDGlmruV/jZKGgm3n4/wtozlx3F1L5RVj
	xbMo2Tahm4GZ7yDZiHgy4dihKawCaC6EaWu+TGpvL/5MYpVEE1UoPJLatxAYMvyBQnEX
	BTEQ==
X-Received: by 10.194.108.41 with SMTP id hh9mr3627123wjb.68.1409218177199;
	Thu, 28 Aug 2014 02:29:37 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	q6sm8320646wjy.47.2014.08.28.02.29.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Aug 2014 02:29:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 28 Aug 2014 11:29:44 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140828092944.GB16066@jama>
References: <20140827223659.1fb55fb4@symphony.aura-online.co.uk>
	<20140828074208.GG13139@haswell>
MIME-Version: 1.0
In-Reply-To: <20140828074208.GG13139@haswell>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-webserver] nginx 1.7.4 cross-compiling patches
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
X-List-Received-Date: Thu, 28 Aug 2014 09:29:38 -0000
X-Groupsio-MsgNum: 51887
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cvVnyQ+4j833TQvp"
Content-Disposition: inline

--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2014 at 12:42:08AM -0700, Khem Raj wrote:
> On 14-08-27 22:36:59, James Le Cuirot wrote:
> > Hello,
> >=20
> > I was trying to cross-compile nginx 1.7.4 on Gentoo and found your
> > nginx-cross.patch. It almost applied, despite being prepared against
> > 1.0.11. I recreated it and everything worked except that the
> > --with-endian option is not actually effective. I have attached
> > the new nginx-cross.patch as well as a --with-endian fix. Hope this
> > helps. As I don't use OpenEmbedded, I'll leave updating the nginx
> > package to you.
>=20
> thanks for the patch. I hope it will appear in patchwork and can be
> picked by someone doing package upgrade

It's not correctly picked by patchwork
http://patchwork.openembedded.org/patch/79247/

James: Please resend with git send-email as README suggests
http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

>=20
> >=20
> > Regards,
> > James
>=20
> > diff -Naur nginx-1.7.4.orig/auto/feature nginx-1.7.4/auto/feature
> > --- nginx-1.7.4.orig/auto/feature	2014-08-25 22:50:58.969186351 +0100
> > +++ nginx-1.7.4/auto/feature	2014-08-25 22:52:04.518208640 +0100
> > @@ -49,12 +49,20 @@
> > =20
> >  if [ -x $NGX_AUTOTEST ]; then
> > =20
> > +    if [ ".$NGX_CROSS_COMPILE" =3D ".yes" ]; then
> > +        NGX_AUTOTEST_EXEC=3D"true"
> > +	NGX_FOUND_MSG=3D" (not tested, cross compiling)"
> > +    else
> > +        NGX_AUTOTEST_EXEC=3D"$NGX_AUTOTEST"
> > +	NGX_FOUND_MSG=3D""
> > +    fi
> > +
> >      case "$ngx_feature_run" in
> > =20
> >          yes)
> >              # /bin/sh is used to intercept "Killed" or "Abort trap" me=
ssages
> > -            if /bin/sh -c $NGX_AUTOTEST >> $NGX_AUTOCONF_ERR 2>&1; then
> > -                echo " found"
> > +            if /bin/sh -c $NGX_AUTOTEST_EXEC >> $NGX_AUTOCONF_ERR 2>&1=
; then
> > +                echo " found$NGX_FOUND_MSG"
> >                  ngx_found=3Dyes
> > =20
> >                  if test -n "$ngx_feature_name"; then
> > @@ -68,17 +76,27 @@
> > =20
> >          value)
> >              # /bin/sh is used to intercept "Killed" or "Abort trap" me=
ssages
> > -            if /bin/sh -c $NGX_AUTOTEST >> $NGX_AUTOCONF_ERR 2>&1; then
> > -                echo " found"
> > +            if /bin/sh -c $NGX_AUTOTEST_EXEC >> $NGX_AUTOCONF_ERR 2>&1=
; then
> > +                echo " found$NGX_FOUND_MSG"
> >                  ngx_found=3Dyes
> > =20
> > -                cat << END >> $NGX_AUTO_CONFIG_H
> > +                if [ ".$NGX_CROSS_COMPILE" =3D ".yes" ]; then
> > +                    cat << END >> $NGX_AUTO_CONFIG_H
> > =20
> >  #ifndef $ngx_feature_name
> > -#define $ngx_feature_name  `$NGX_AUTOTEST`
> > +#define $ngx_feature_name  $(eval "echo \$NGX_WITH_${ngx_feature_name}=
")
> >  #endif
> > =20
> >  END
> > +		else
> > +                    cat << END >> $NGX_AUTO_CONFIG_H
> > +
> > +#ifndef $ngx_feature_name
> > +#define $ngx_feature_name  `$NGX_AUTOTEST_EXEC`
> > +#endif
> > +
> > +END
> > +                fi
> >              else
> >                  echo " found but is not working"
> >              fi
> > @@ -86,7 +104,7 @@
> > =20
> >          bug)
> >              # /bin/sh is used to intercept "Killed" or "Abort trap" me=
ssages
> > -            if /bin/sh -c $NGX_AUTOTEST >> $NGX_AUTOCONF_ERR 2>&1; then
> > +            if /bin/sh -c $NGX_AUTOTEST_EXEC >> $NGX_AUTOCONF_ERR 2>&1=
; then
> >                  echo " not found"
> > =20
> >              else
> > diff -Naur nginx-1.7.4.orig/auto/options nginx-1.7.4/auto/options
> > --- nginx-1.7.4.orig/auto/options	2014-08-25 22:50:58.959186500 +0100
> > +++ nginx-1.7.4/auto/options	2014-08-25 22:52:04.518208640 +0100
> > @@ -316,6 +316,18 @@
> >          --test-build-rtsig)              NGX_TEST_BUILD_RTSIG=3DYES   =
;;
> >          --test-build-solaris-sendfilev)  NGX_TEST_BUILD_SOLARIS_SENDFI=
LEV=3DYES ;;
> > =20
> > +        # cross compile support
> > +        --with-int=3D*)                    NGX_WITH_INT=3D"$value"    =
      ;;
> > +        --with-long=3D*)                   NGX_WITH_LONG=3D"$value"   =
      ;;
> > +        --with-long-long=3D*)              NGX_WITH_LONG_LONG=3D"$valu=
e"    ;;
> > +        --with-ptr-size=3D*)               NGX_WITH_PTR_SIZE=3D"$value=
"     ;;
> > +        --with-sig-atomic-t=3D*)           NGX_WITH_SIG_ATOMIC_T=3D"$v=
alue" ;;
> > +        --with-size-t=3D*)                 NGX_WITH_SIZE_T=3D"$value" =
      ;;
> > +        --with-off-t=3D*)                  NGX_WITH_OFF_T=3D"$value"  =
      ;;
> > +        --with-time-t=3D*)                 NGX_WITH_TIME_T=3D"$value" =
      ;;
> > +        --with-sys-nerr=3D*)               NGX_WITH_NGX_SYS_NERR=3D"$v=
alue" ;;
> > +        --with-endian=3D*)                 NGX_WITH_ENDIAN=3D"$value" =
      ;;
> > +
> >          *)
> >              echo "$0: error: invalid option \"$option\""
> >              exit 1
> > @@ -472,6 +484,17 @@
> > =20
> >    --with-debug                       enable debug logging
> > =20
> > +  --with-int=3DVALUE                   force int size
> > +  --with-long=3DVALUE                  force long size
> > +  --with-long-long=3DVALUE             force long long size
> > +  --with-ptr-size=3DVALUE              force pointer size
> > +  --with-sig-atomic-t=3DVALUE          force sig_atomic_t size
> > +  --with-size-t=3DVALUE                force size_t size
> > +  --with-off-t=3DVALUE                 force off_t size
> > +  --with-time-t=3DVALUE                force time_t size
> > +  --with-sys-nerr=3DVALUE              force sys_nerr value
> > +  --with-endian=3DVALUE                force system endianess
> > +
> >  END
> > =20
> >      exit 1
> > @@ -493,6 +516,8 @@
> > =20
> >  if [ ".$NGX_PLATFORM" =3D ".win32" ]; then
> >      NGX_WINE=3D$WINE
> > +elif [ ! -z "$NGX_PLATFORM" ]; then
> > +    NGX_CROSS_COMPILE=3D"yes"
> >  fi
> > =20
> > =20
> > diff -Naur nginx-1.7.4.orig/auto/types/sizeof nginx-1.7.4/auto/types/si=
zeof
> > --- nginx-1.7.4.orig/auto/types/sizeof	2014-08-25 22:50:58.961186470 +0=
100
> > +++ nginx-1.7.4/auto/types/sizeof	2014-08-25 22:54:10.785324255 +0100
> > @@ -12,9 +12,12 @@
> > =20
> >  END
> > =20
> > -ngx_size=3D
> > +ngx_size=3D$(eval "echo \$NGX_WITH_${ngx_param}")
> > =20
> > -cat << END > $NGX_AUTOTEST.c
> > +if [ ".$ngx_size" !=3D "." ]; then
> > +    echo " $ngx_size bytes"
> > +else
> > +    cat << END > $NGX_AUTOTEST.c
> > =20
> >  #include <sys/types.h>
> >  #include <sys/time.h>
> > @@ -33,19 +36,20 @@
> >  END
> > =20
> > =20
> > -ngx_test=3D"$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
> > -          -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT $ngx_feature_li=
bs"
> > +    ngx_test=3D"$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
> > +              -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT $ngx_featur=
e_libs"
> > =20
> > -eval "$ngx_test >> $NGX_AUTOCONF_ERR 2>&1"
> > +    eval "$ngx_test >> $NGX_AUTOCONF_ERR 2>&1"
> > =20
> > =20
> > -if [ -x $NGX_AUTOTEST ]; then
> > -    ngx_size=3D`$NGX_AUTOTEST`
> > -    echo " $ngx_size bytes"
> > -fi
> > +    if [ -x $NGX_AUTOTEST ]; then
> > +        ngx_size=3D`$NGX_AUTOTEST`
> > +        echo " $ngx_size bytes"
> > +    fi
> > =20
> > =20
> > -rm -rf $NGX_AUTOTEST*
> > +    rm -rf $NGX_AUTOTEST*
> > +fi
> > =20
> > =20
> >  case $ngx_size in
> > diff -Naur nginx-1.7.4.orig/auto/unix nginx-1.7.4/auto/unix
> > --- nginx-1.7.4.orig/auto/unix	2014-08-25 22:50:58.954186575 +0100
> > +++ nginx-1.7.4/auto/unix	2014-08-25 22:52:04.520208607 +0100
> > @@ -460,13 +460,13 @@
> > =20
> >  # C types
> > =20
> > -ngx_type=3D"int"; . auto/types/sizeof
> > +ngx_type=3D"int"; ngx_param=3D"INT"; . auto/types/sizeof
> > =20
> > -ngx_type=3D"long"; . auto/types/sizeof
> > +ngx_type=3D"long"; ngx_param=3D"LONG"; . auto/types/sizeof
> > =20
> > -ngx_type=3D"long long"; . auto/types/sizeof
> > +ngx_type=3D"long long"; ngx_param=3D"LONG_LONG"; . auto/types/sizeof
> > =20
> > -ngx_type=3D"void *"; . auto/types/sizeof; ngx_ptr_size=3D$ngx_size
> > +ngx_type=3D"void *"; ngx_param=3D"PTR_SIZE"; . auto/types/sizeof; ngx_=
ptr_size=3D$ngx_size
> >  ngx_param=3DNGX_PTR_SIZE; ngx_value=3D$ngx_size; . auto/types/value
> > =20
> > =20
> > @@ -483,7 +483,7 @@
> > =20
> >  ngx_type=3D"uint64_t"; ngx_types=3D"u_int64_t"; . auto/types/typedef
> > =20
> > -ngx_type=3D"sig_atomic_t"; ngx_types=3D"int"; . auto/types/typedef
> > +ngx_type=3D"sig_atomic_t"; ngx_param=3D"SIG_ATOMIC_T"; ngx_types=3D"in=
t"; . auto/types/typedef
> >  . auto/types/sizeof
> >  ngx_param=3DNGX_SIG_ATOMIC_T_SIZE; ngx_value=3D$ngx_size; . auto/types=
/value
> > =20
> > @@ -499,15 +499,15 @@
> > =20
> >  . auto/endianness
> > =20
> > -ngx_type=3D"size_t"; . auto/types/sizeof
> > +ngx_type=3D"size_t"; ngx_param=3D"SIZE_T"; . auto/types/sizeof
> >  ngx_param=3DNGX_MAX_SIZE_T_VALUE; ngx_value=3D$ngx_max_value; . auto/t=
ypes/value
> >  ngx_param=3DNGX_SIZE_T_LEN; ngx_value=3D$ngx_max_len; . auto/types/val=
ue
> > =20
> > -ngx_type=3D"off_t"; . auto/types/sizeof
> > +ngx_type=3D"off_t"; ngx_param=3D"OFF_T"; . auto/types/sizeof
> >  ngx_param=3DNGX_MAX_OFF_T_VALUE; ngx_value=3D$ngx_max_value; . auto/ty=
pes/value
> >  ngx_param=3DNGX_OFF_T_LEN; ngx_value=3D$ngx_max_len; . auto/types/value
> > =20
> > -ngx_type=3D"time_t"; . auto/types/sizeof
> > +ngx_type=3D"time_t"; ngx_param=3D"TIME_T"; . auto/types/sizeof
> >  ngx_param=3DNGX_TIME_T_SIZE; ngx_value=3D$ngx_size; . auto/types/value
> >  ngx_param=3DNGX_TIME_T_LEN; ngx_value=3D$ngx_max_len; . auto/types/val=
ue
> > =20
>=20
> > --- auto/endianness.orig	2014-08-26 23:43:47.590339891 +0100
> > +++ auto/endianness	2014-08-26 23:44:02.915106075 +0100
> > @@ -8,7 +8,13 @@
> >  echo "checking for system byte ordering" >> $NGX_ERR
> > =20
> > =20
> > -cat << END > $NGX_AUTOTEST.c
> > +if [ ".$NGX_WITH_ENDIAN" =3D ".little" ]; then
> > +    echo " little endian"
> > +    have=3DNGX_HAVE_LITTLE_ENDIAN . auto/have
> > +elif [ ".$NGX_WITH_ENDIAN" =3D ".big" ]; then
> > +    echo " big endian"
> > +else
> > +    cat << END > $NGX_AUTOTEST.c
> > =20
> >  int main() {
> >      int i =3D 0x11223344;
> > @@ -21,25 +27,26 @@
> > =20
> >  END
> > =20
> > -ngx_test=3D"$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
> > -          -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT $ngx_feature_li=
bs"
> > +    ngx_test=3D"$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
> > +              -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT $ngx_featur=
e_libs"
> > =20
> > -eval "$ngx_test >> $NGX_AUTOCONF_ERR 2>&1"
> > +    eval "$ngx_test >> $NGX_AUTOCONF_ERR 2>&1"
> > =20
> > -if [ -x $NGX_AUTOTEST ]; then
> > -    if $NGX_AUTOTEST >/dev/null 2>&1; then
> > -        echo " little endian"
> > -        have=3DNGX_HAVE_LITTLE_ENDIAN . auto/have
> > -    else
> > -        echo " big endian"
> > -    fi
> > +    if [ -x $NGX_AUTOTEST ]; then
> > +        if $NGX_AUTOTEST >/dev/null 2>&1; then
> > +            echo " little endian"
> > +            have=3DNGX_HAVE_LITTLE_ENDIAN . auto/have
> > +        else
> > +            echo " big endian"
> > +        fi
> > =20
> > -    rm -rf $NGX_AUTOTEST*
> > +        rm -rf $NGX_AUTOTEST*
> > =20
> > -else
> > -    rm -rf $NGX_AUTOTEST*
> > +    else
> > +        rm -rf $NGX_AUTOTEST*
> > =20
> > -    echo
> > -    echo "$0: error: cannot detect system byte ordering"
> > -    exit 1
> > +        echo
> > +        echo "$0: error: cannot detect system byte ordering"
> > +        exit 1
> > +    fi
> >  fi
>=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cvVnyQ+4j833TQvp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlP+9ogACgkQN1Ujt2V2gBzzJQCgkoh7XsTx8iLSs5sxXJQNiCAA
Ja0AnRFUT3n0ViFgps4VwWEKWXBO5hgm
=DE53
-----END PGP SIGNATURE-----

--cvVnyQ+4j833TQvp--
