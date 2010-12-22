Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PVXMf-00014U-1e
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 23:40:57 +0100
Received: by yie16 with SMTP id 16so735022yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 14:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=bvYVJm10w50nmtLZa5J6bpvY+UkT2AflIwT5qYcBRME=;
	b=QMqV6P19MLqnPKrlBOnnQRkmqdjzz7c/mWjw8RdAQHIhZhruzzguGgGqtvH3UtBWEo
	Ohcu6HZ/aDlHpN8V4wtHllmM1Lw7lhKlcBjn0/Rtemxqp0qnokQreXPTNgJ5fAi33NHZ
	pWJRVFmZTwa+fRiW2VdzqQWCr2k9iyS8pF5RM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=E5TfjQiyHgfy1j+q9hHSH5N8xbJGiJb3lbL5ceMyqg2yFL9seFQvsilcsAUACjKlsm
	IOUEaneUsyDMqhqxE9lNjyEAAAk/sXh9VzdsAM9sIok/obcgZ1mlB/ctI7isTa7hv6Lt
	mrIdBHQb7lUPO/E1lBzE/Xi+JrF/2wrGxWcqQ=
Received: by 10.90.80.18 with SMTP id d18mr9294479agb.31.1293057646130; Wed,
	22 Dec 2010 14:40:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Wed, 22 Dec 2010 14:40:25 -0800 (PST)
In-Reply-To: <AANLkTimiREdpNOKj9-G8YPjys6WNVnHGZRSx9jDCGGtk@mail.gmail.com>
References: <AANLkTimDyv3ouBLRCvrfR9Ywudwf_TqOrBztwmxWLa3x@mail.gmail.com>
	<AANLkTimiREdpNOKj9-G8YPjys6WNVnHGZRSx9jDCGGtk@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Dec 2010 14:40:25 -0800
Message-ID: <AANLkTine-Z5DeucNGXdr-Jk9mARnPCZ3AWuw4yneo6RK@mail.gmail.com>
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
X-List-Received-Date: Wed, 22 Dec 2010 22:40:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 22, 2010 at 11:47 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/12/22 AJ ONeal <coolaj86@gmail.com>:
>> Overkill?
>>
>> root@overo:~# opkg install subversion
>> Installing subversion (1.6.5-r0.5) to root...
>> Downloading
>> http://www.gumstix.net/feeds/unstable/ipk/glibc/armv7a/base/subversion_1=
.6.5-r0.5_armv7a.ipk
>> .
>> Installing libneon25 (0.25.5-r4.5) to root...
>> Downloading
>> http://www.gumstix.net/feeds/unstable/ipk/glibc/armv7a/base/libneon25_0.=
25.5-r4.5_armv7a.ipk
>> .
>> Installing libsqlite3-0 (3.6.23.1-r1.0.5) to root...
>> Downloading
>> http://www.gumstix.net/feeds/unstable/ipk/glibc/armv7a/base/libsqlite3-0=
_3.6.23.1-r1.0.5_armv7a.ipk
>> .
>> Installing libaprutil-1-0 (1.3.4-r5.5) to root...
>> Downloading
>> http://www.gumstix.net/feeds/unstable/ipk/glibc/armv7a/base/libaprutil-1=
-0_1.3.4-r5.5_armv7a.ipk
>> .
>> Installing apache2 (2.2.14-r0.5) to root...
>> Downloading
>> http://www.gumstix.net/feeds/unstable/ipk/glibc/armv7a/base/apache2_2.2.=
14-r0.5_armv7a.ipk
>> .
>> Configuring libsqlite3-0.
>> Configuring libneon25.
>> Configuring libaprutil-1-0.
>> Collected errors:
>> =C2=A0* check_data_file_clashes: Package apache2 wants to install file
>> /usr/lib/libaprutil-1.so.0
>> =C2=A0 =C2=A0But that file is already provided by package =C2=A0* libapr=
util-1-0
>> =C2=A0* opkg_install_cmd: Cannot install package subversion.
>>
>> root@overo:~# opkg install subversion --force-overwrite
>> Installing subversion (1.6.5-r0.5) to root...
>> Downloading
>> http://www.gumstix.net/feeds/unstable/ipk/glibc/armv7a/base/subversion_1=
.6.5-r0.5_armv7a.ipk
>> .
>> Installing apache2 (2.2.14-r0.5) to root...
>> Downloading
>> http://www.gumstix.net/feeds/unstable/ipk/glibc/armv7a/base/apache2_2.2.=
14-r0.5_armv7a.ipk
>> .
>> Installing libssl0.9.8 (0.9.8m-r12.0.5) to root...
>> Downloading
>> http://www.gumstix.net/feeds/unstable/ipk/glibc/armv7a/base/libssl0.9.8_=
0.9.8m-r12.0.5_armv7a.ipk
>> .
>> Configuring libssl0.9.8.
>> Configuring apache2.
>> =C2=A0Adding system startup for /etc/init.d/apache2.
>> ln: /etc/rc3.d/S91apache2: File exists
>> ln: /etc/rc4.d/S91apache2: File exists
>> ln: /etc/rc5.d/S91apache2: File exists
>> Starting web server: apache2.
>> Configuring subversion.
>>
>> AJ ONeal
>
> Strange
> There is no dependency on apache2 (there is one on apr-util but that
> one does not depend on apache2).


thes are runtime deps calculated by shlibs you cant grep for them
> Actually did a grep on apache2 in my recipes dir:
>
> frans@linux-suse:~/oe/openembedded/recipes> grep apache2 */* -l
> apache2/apache2-native_2.2.14.bb
> apache2/apache2-native_2.2.3.bb
> apache2/apache2_2.2.14.bb
> apache2/apache2_2.2.3.bb
> gallery/gallery_1.5.5.bb
> meta/foonas-packages.bb
> meta/meta-angstrom-2007.bb
> meta/openprotium-packages.bb
> meta/oplinux-packages.bb
> modphp/modphp5.inc
> mythtv/mythplugins_0.23+fixes.bb
>
> this gives no clue at all on what it could be (I did a grep without -l
> too to find out the matching lines)
> none of the recipes are related to what you give.
>
> There might be an opkg cmd that lists the dependency tree, if so you
> may find out which package actually has this depends)
>
> Frans
>
> PS as the reply from Khem came in while typing:
> libapr is indeed from apache2 but there is no depends on libapr either.
>
> frans@linux-suse:~/oe/openembedded/recipes> grep libapr */*
> apache/apache_2.0.54.bb:PACKAGES =3D "${PN}-dbg libaprutil libapr
> apache-dev apache-doc apache"
> apache/apache_2.0.54.bb:FILES_libapr =3D "${libdir}/libapr*.so.0*
> ${libdir}/apr.exp"
> apache/apache_2.0.54.bb:FILES_libaprutil =3D
> "${libdir}/libaprutil*.so.0* ${libdir}/aprutil.exp"
> apache2/apache2-native_2.2.14.bb: =C2=A0 =C2=A0 =C2=A0 (cd srclib/apr/.li=
bs; tar -cf -
> libapr-*.so* ) |
> apache2/apache2-native_2.2.14.bb: =C2=A0 =C2=A0 =C2=A0 (cd srclib/apr-uti=
l/.libs; tar -cf -
> libaprutil-*.so* ) |
> apache2/apache2-native_2.2.3.bb: =C2=A0 =C2=A0 =C2=A0 =C2=A0(cd srclib/ap=
r/.libs; tar -cf -
> libapr-*.so* ) |
> apache2/apache2-native_2.2.3.bb: =C2=A0 =C2=A0 =C2=A0 =C2=A0(cd srclib/ap=
r-util/.libs; tar -cf -
> libaprutil-*.so* ) |
> apache2/apache2_2.2.14.bb:LEAD_SONAME =3D "libapr-1.so.0"
> apache2/apache2_2.2.3.bb:LEAD_SONAME =3D "libapr-1.so.0"
> frans@linux-suse:~/oe/openembedded/recipes>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


