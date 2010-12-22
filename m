Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PVUea-0005zk-MQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 20:47:16 +0100
Received: by yxd5 with SMTP id 5so2462122yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 11:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=QpCniZgky+zO7tQ1QjDHELyg1vwzyOjjOF+EHLgQv3Y=;
	b=tai2o8fj2k4bmjK/iGzUjyIe0kpa933kUTZ58tm8NN2Ptf5xDSbIyq5uDA9sO20f69
	EuhZIdRDtmF3UiDmTiGT939yL++fY6jDxplyKZkrurgeMeXcFPSAHnquz2HPVCsUVfKa
	pm9EJD/1RSLUa5CKYK/HykIbU2aLZfGQGd7I4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=FCvSBjbAEIqwLliyFQ8AEqP7weZ56qenIXtJ9ql95V7YR7DPuEMPin+vYJnmTKyJR0
	2aSEOgPeLWdLu58Lotmee5+GRlGKBFGkkfqeuU5RIIP22uDD7In93+YZD1WiEWfw37gu
	rrDBw7KPhpSTG2bC4HHfVfaCiS12AsFJptabg=
MIME-Version: 1.0
Received: by 10.151.83.5 with SMTP id k5mr11070943ybl.58.1293047226714; Wed,
	22 Dec 2010 11:47:06 -0800 (PST)
Received: by 10.150.49.1 with HTTP; Wed, 22 Dec 2010 11:47:06 -0800 (PST)
In-Reply-To: <AANLkTimDyv3ouBLRCvrfR9Ywudwf_TqOrBztwmxWLa3x@mail.gmail.com>
References: <AANLkTimDyv3ouBLRCvrfR9Ywudwf_TqOrBztwmxWLa3x@mail.gmail.com>
Date: Wed, 22 Dec 2010 20:47:06 +0100
Message-ID: <AANLkTimiREdpNOKj9-G8YPjys6WNVnHGZRSx9jDCGGtk@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Subversion depends on Apache2
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
X-List-Received-Date: Wed, 22 Dec 2010 19:47:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/12/22 AJ ONeal <coolaj86@gmail.com>:
> Overkill?
>
> root@overo:~# opkg install subversion
> Installing subversion (1.6.5-r0.5) to root...
> Downloading
> http://www.gumstix.net/feeds/unstable/ipk/glibc/armv7a/base/subversion_1.=
6.5-r0.5_armv7a.ipk
> .
> Installing libneon25 (0.25.5-r4.5) to root...
> Downloading
> http://www.gumstix.net/feeds/unstable/ipk/glibc/armv7a/base/libneon25_0.2=
5.5-r4.5_armv7a.ipk
> .
> Installing libsqlite3-0 (3.6.23.1-r1.0.5) to root...
> Downloading
> http://www.gumstix.net/feeds/unstable/ipk/glibc/armv7a/base/libsqlite3-0_=
3.6.23.1-r1.0.5_armv7a.ipk
> .
> Installing libaprutil-1-0 (1.3.4-r5.5) to root...
> Downloading
> http://www.gumstix.net/feeds/unstable/ipk/glibc/armv7a/base/libaprutil-1-=
0_1.3.4-r5.5_armv7a.ipk
> .
> Installing apache2 (2.2.14-r0.5) to root...
> Downloading
> http://www.gumstix.net/feeds/unstable/ipk/glibc/armv7a/base/apache2_2.2.1=
4-r0.5_armv7a.ipk
> .
> Configuring libsqlite3-0.
> Configuring libneon25.
> Configuring libaprutil-1-0.
> Collected errors:
> =A0* check_data_file_clashes: Package apache2 wants to install file
> /usr/lib/libaprutil-1.so.0
> =A0 =A0But that file is already provided by package =A0* libaprutil-1-0
> =A0* opkg_install_cmd: Cannot install package subversion.
>
> root@overo:~# opkg install subversion --force-overwrite
> Installing subversion (1.6.5-r0.5) to root...
> Downloading
> http://www.gumstix.net/feeds/unstable/ipk/glibc/armv7a/base/subversion_1.=
6.5-r0.5_armv7a.ipk
> .
> Installing apache2 (2.2.14-r0.5) to root...
> Downloading
> http://www.gumstix.net/feeds/unstable/ipk/glibc/armv7a/base/apache2_2.2.1=
4-r0.5_armv7a.ipk
> .
> Installing libssl0.9.8 (0.9.8m-r12.0.5) to root...
> Downloading
> http://www.gumstix.net/feeds/unstable/ipk/glibc/armv7a/base/libssl0.9.8_0=
.9.8m-r12.0.5_armv7a.ipk
> .
> Configuring libssl0.9.8.
> Configuring apache2.
> =A0Adding system startup for /etc/init.d/apache2.
> ln: /etc/rc3.d/S91apache2: File exists
> ln: /etc/rc4.d/S91apache2: File exists
> ln: /etc/rc5.d/S91apache2: File exists
> Starting web server: apache2.
> Configuring subversion.
>
> AJ ONeal

Strange
There is no dependency on apache2 (there is one on apr-util but that
one does not depend on apache2).
Actually did a grep on apache2 in my recipes dir:

frans@linux-suse:~/oe/openembedded/recipes> grep apache2 */* -l
apache2/apache2-native_2.2.14.bb
apache2/apache2-native_2.2.3.bb
apache2/apache2_2.2.14.bb
apache2/apache2_2.2.3.bb
gallery/gallery_1.5.5.bb
meta/foonas-packages.bb
meta/meta-angstrom-2007.bb
meta/openprotium-packages.bb
meta/oplinux-packages.bb
modphp/modphp5.inc
mythtv/mythplugins_0.23+fixes.bb

this gives no clue at all on what it could be (I did a grep without -l
too to find out the matching lines)
none of the recipes are related to what you give.

There might be an opkg cmd that lists the dependency tree, if so you
may find out which package actually has this depends)

Frans

PS as the reply from Khem came in while typing:
libapr is indeed from apache2 but there is no depends on libapr either.

frans@linux-suse:~/oe/openembedded/recipes> grep libapr */*
apache/apache_2.0.54.bb:PACKAGES =3D "${PN}-dbg libaprutil libapr
apache-dev apache-doc apache"
apache/apache_2.0.54.bb:FILES_libapr =3D "${libdir}/libapr*.so.0*
${libdir}/apr.exp"
apache/apache_2.0.54.bb:FILES_libaprutil =3D
"${libdir}/libaprutil*.so.0* ${libdir}/aprutil.exp"
apache2/apache2-native_2.2.14.bb:	(cd srclib/apr/.libs; tar -cf -
libapr-*.so* ) |
apache2/apache2-native_2.2.14.bb:	(cd srclib/apr-util/.libs; tar -cf -
libaprutil-*.so* ) |
apache2/apache2-native_2.2.3.bb:	(cd srclib/apr/.libs; tar -cf -
libapr-*.so* ) |
apache2/apache2-native_2.2.3.bb:	(cd srclib/apr-util/.libs; tar -cf -
libaprutil-*.so* ) |
apache2/apache2_2.2.14.bb:LEAD_SONAME =3D "libapr-1.so.0"
apache2/apache2_2.2.3.bb:LEAD_SONAME =3D "libapr-1.so.0"
frans@linux-suse:~/oe/openembedded/recipes>


