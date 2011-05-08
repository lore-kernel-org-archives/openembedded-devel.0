Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJ6x4-00015e-Kz
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 18:35:26 +0200
Received: by bwz5 with SMTP id 5so3929406bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2011 09:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=uc5F+WOE7cIwWh/TjW3EJSOtBnhZ7Qa/aZHnepqkdxw=;
	b=W5vaEBNZA254x3m5JUtHtWdFYdyigeS+aKpL5DbsszfK9Jx1hGZ1ZdWKG1hUAUF44C
	FLJ4UG945MUtXo8dpttiAW82djIQFBUaTAWUt/BAVJauDTCXmAPbaaQLcS/7vzGvjq++
	E31dfb+IxFqqqEyJ8Sx8JRKeiU7s/Tc/UlV+M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=k8mdW+YdhW59EAZb80RJ5PgElseZea1XbMMv4L6H5cGUHayoR8tdNSzS/JW/2/v8aF
	edCE1jU5rnjxExG79jNEo4LkZD0s10sAKB6UGup7lCLfTgpEsTMd4mn0LGiJeHBpUzpC
	k+9Ea4BzxuFU64QPQRQVc0ZGbnjpXYfm5AMOc=
MIME-Version: 1.0
Received: by 10.204.134.207 with SMTP id k15mr1576042bkt.135.1304872362426;
	Sun, 08 May 2011 09:32:42 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.79.70 with HTTP; Sun, 8 May 2011 09:32:42 -0700 (PDT)
In-Reply-To: <1304836229.4124.4.camel@mattotaupa>
References: <1304822586-14872-1-git-send-email-otavio@ossystems.com.br>
	<1304836229.4124.4.camel@mattotaupa>
Date: Sun, 8 May 2011 13:32:42 -0300
X-Google-Sender-Auth: 8TXzl_3TFs9SqOOezQbfEjWdUWA
Message-ID: <BANLkTi=DG1==LWYUjhzJ4Nabo=4VZ8Yd5Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 01/11] fuse: add 2.8.5
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
X-List-Received-Date: Sun, 08 May 2011 16:35:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, May 8, 2011 at 03:30, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Am Sonntag, den 08.05.2011, 02:42 +0000 schrieb Otavio Salvador:
>> This recipes is required by ntfs-3g-ntfsprogs.
>
> Is this based on the OE recipe? Could you add an inc file right from the
> beginning?

I see no reason why we will need more then one version so I'd say this
is the right way for now.

>> +DESCRIPTION =3D "With FUSE it is possible to implement a fully function=
al filesystem in a userspace program"
>> +HOMEPAGE =3D "http://fuse.sf.net"
>
> Could you also add a section please.

Ok.

>> +LICENSE =3D "GPLv2"
>> +RRECOMMENDS_fuse =3D "kernel-module-fuse""
>
> Use `_${PN}`?

I updated it for the field but not the kernel module name.

>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079ba=
e19f \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://COPYING.LIB;md5=3Df30a97=
16ef3762e3467a2f62bf790f0a"
>> +
>> +PR =3D "r0"
>> +
>> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/fuse/fuse-${PV}.tar.gz"
>> +
>> +inherit autotools pkgconfig
>> +
>> +EXTRA_OECONF =3D " --disable-kernel-module"
>
> Space in the beginning not needed?
>
>> +PACKAGES =3D+ "fuse-utils-dbg fuse-utils libulockmgr libulockmgr-dev li=
bulockmgr-dbg"
>> +
>> +FILES_${PN} +=3D "${libdir}/libfuse.so.*"
>> +FILES_${PN}-dev +=3D "${libdir}/libfuse*.la"
>> +
>> +FILES_libulockmgr =3D "${libdir}/libulockmgr.so.*"
>> +FILES_libulockmgr-dev +=3D "${libdir}/libulock*.la"
>> +FILES_libulockmgr-dbg +=3D "${libdir}/.debug/libulock*"
>> +
>> +# Forbid auto-renaming to libfuse-utils
>> +FILES_fuse-utils =3D "${bindir} ${base_sbindir}"
>> +FILES_fuse-utils-dbg =3D "${bindir}/.debug ${base_sbindir}/.debug"
>> +DEBIAN_NOAUTONAME_fuse-utils =3D "1"
>> +DEBIAN_NOAUTONAME_fuse-utils-dbg =3D "1"
>> +
>> +SRC_URI[md5sum] =3D "8aa2fd689de00b73963620483084ae3b"
>> +SRC_URI[sha256sum] =3D "bec80e66ae8ee60dfdf67b2ca291266a45dcfe6bc20c64f=
3acfceaa38ed29a84"
>
> I would put these field to the first `SRC_URI` fields.

right.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


