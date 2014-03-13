Return-Path: <wayne.m.zhang@gmail.com>
Received: from mail-ie0-f193.google.com (mail-ie0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id F1E236EF8A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 15:17:32 +0000 (UTC)
Received: by mail-ie0-f193.google.com with SMTP id rl12so420626iec.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 08:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=AwH7XS8EhU9hrYqL39IAf/aR0dRDeklV+47b9sNa7tY=;
	b=Z8Lf71e9Gm9EqT2nHaD+9p1+SRCJ9sxgCZn9dPirc+gO9tMQjQuoFdF+UudbgRHwfY
	H/9Ul0cI7GkBgtlhCSbzfl9aZzSIXmUdMLt+HgTOojtsvVna2k+zxH3b0Y5epfNpMS6o
	A46wrFE0Mey5D7cE7qreH3jL93pI+ZLpjOBP+fcFeshyfncYtbasw3DobWKC3DSaDdKY
	PhuN71C6CIsBNHMA4eVoGkidkAtCBnXBty7XeUkzVmu81LdZoCR1OJnM1n1C5EOxEfyw
	CgBhlKuB03d7Q46+OMTZhVyuW2SOPg5LJkfmujxdgJyS0wCt9A6XUNVdadwyY5DzLsBt
	TzrQ==
MIME-Version: 1.0
X-Received: by 10.50.80.11 with SMTP id n11mr2461676igx.36.1394723824912; Thu,
	13 Mar 2014 08:17:04 -0700 (PDT)
Received: by 10.50.17.201 with HTTP; Thu, 13 Mar 2014 08:17:04 -0700 (PDT)
In-Reply-To: <CABcq3G_FGV54cXtsSTfgzv5pwE8iVrjq2soME6=iXTjMJw7g_w@mail.gmail.com>
References: <CABcq3G_FGV54cXtsSTfgzv5pwE8iVrjq2soME6=iXTjMJw7g_w@mail.gmail.com>
Date: Thu, 13 Mar 2014 23:17:04 +0800
Message-ID: <CABcq3G_EaoyfSPq5VwffYiZDUb9CsKDBR2miWrY8Vv659=mZGg@mail.gmail.com>
From: wmz <wayne.m.zhang@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: mysqli.so not generated after compiling php using --with-mysqli
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
X-List-Received-Date: Thu, 13 Mar 2014 15:17:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

i was tring to compile  core-image-minimal image with apache+mysql+php.
all was ok but when started my test app it gave error:
"Call to undefined function mysql_pconnect"
i googled and found there was no mysqli.so generated.
i am using the latest version of meta-openembedded with modphp_5.5.9.bb.
and the configure option seems right, it is

$
/home/xyz/work/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/modphp/5.5.9-r0/php-5.5.9/configure
--build=i686-linux --host=arm-oe-linux-gnueabi
--target=arm-oe-linux-gnueabi --prefix=/usr --exec_prefix=/usr
--bindir=/usr/bin --sbindir=/usr/sbin --libexecdir=/usr/lib/modphp
--datadir=/usr/share --sysconfdir=/etc --sharedstatedir=/com
--localstatedir=/var --libdir=/usr/lib --includedir=/usr/include
--oldincludedir=/usr/include --infodir=/usr/share/info
--mandir=/usr/share/man --disable-silent-rules
--disable-dependency-tracking
--with-libtool-sysroot=/home/xyz/work/build/tmp-eglibc/sysroots/pandaboard
--with-apxs2=/home/xyz/work/build/tmp-eglibc/sysroots/pandaboard/usr/bin/crossscripts/apxs
--with-pic --enable-maintainer-zts --without-mysql --disable-cgi
--disable-cli --disable-pdo --without-pear --without-iconv --disable-ipv6
--disable-xml --disable-xmlreader --disable-xmlwriter --disable-simplexml
--disable-libxml --disable-dom --disable-rpath --libdir=/usr/lib/php5
--with-zlib
--with-zlib-dir=/home/xyz/work/build/tmp-eglibc/sysroots/pandaboard/usr
--with-bz2=/home/xyz/work/build/tmp-eglibc/sysroots/pandaboard/usr
--with-mcrypt=/home/xyz/work/build/tmp-eglibc/sysroots/pandaboard/usr
--enable-zip --enable-mbstring
--with-config-file-path=/etc/php/apache2-php5 ac_cv_c_bigendian_php=no
--disable-opcache
--with-mysqli=/home/xyz/work/build/tmp-eglibc/sysroots/pandaboard/usr/bin/crossscripts/mysql_config
--without-pgsql

can anybody help solving this ?
thanks.

Wayne


2014-03-13 23:01 GMT+08:00 wmz <wayne.m.zhang@gmail.com>:

> hi guys,
> i was tring to compile  core-image-minimal image with apache+mysql+php.
> all was ok but when started my test app it gave error:
> "Call to undefined function mysql_pconnect"
> i googled and found there was no mysqli.so generated.
> i am using the latest version of meta-openembedded with modphp_5.5.9.bb.
> and the configure option seems right, it is
>
> $
> /home/xyz/work/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/modphp/5.5.9-r0/php-5.5.9/configure
> --build=i686-linux --host=arm-oe-linux-gnueabi
> --target=arm-oe-linux-gnueabi --prefix=/usr --exec_prefix=/usr
> --bindir=/usr/bin --sbindir=/usr/sbin --libexecdir=/usr/lib/modphp
> --datadir=/usr/share --sysconfdir=/etc --sharedstatedir=/com
> --localstatedir=/var --libdir=/usr/lib --includedir=/usr/include
> --oldincludedir=/usr/include --infodir=/usr/share/info
> --mandir=/usr/share/man --disable-silent-rules
> --disable-dependency-tracking
> --with-libtool-sysroot=/home/xyz/work/build/tmp-eglibc/sysroots/pandaboard
> --with-apxs2=/home/xyz/work/build/tmp-eglibc/sysroots/pandaboard/usr/bin/crossscripts/apxs
> --with-pic --enable-maintainer-zts --without-mysql --disable-cgi
> --disable-cli --disable-pdo --without-pear --without-iconv --disable-ipv6
> --disable-xml --disable-xmlreader --disable-xmlwriter --disable-simplexml
> --disable-libxml --disable-dom --disable-rpath --libdir=/usr/lib/php5
> --with-zlib
> --with-zlib-dir=/home/xyz/work/build/tmp-eglibc/sysroots/pandaboard/usr
> --with-bz2=/home/xyz/work/build/tmp-eglibc/sysroots/pandaboard/usr
> --with-mcrypt=/home/xyz/work/build/tmp-eglibc/sysroots/pandaboard/usr
> --enable-zip --enable-mbstring
> --with-config-file-path=/etc/php/apache2-php5 ac_cv_c_bigendian_php=no
> --disable-opcache
> --with-mysqli=/home/xyz/work/build/tmp-eglibc/sysroots/pandaboard/usr/bin/crossscripts/mysql_config
> --without-pgsql
>
> can anybody help solving this ?
> thanks.
>
> Wayne
>

