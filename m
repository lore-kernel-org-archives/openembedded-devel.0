Received: from [209.85.221.178] (helo=mail-qy0-f178.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1N1QDf-0002BC-BQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 21:54:42 +0200
Received: by qyk8 with SMTP id 8so7509701qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2009 12:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=AMenZRm1vLZ3G3LuqcgaXXC3LRSAdky7r1f5oLx1FZw=;
	b=WF3XxzHMRlzGhFYXEa/BYjU8Bg5X4GwHv9NAJDNtedf3Qoy/cdF6VFclzbJppYvkSe
	muhAbwJeJZZuNfIxCbSZciMb9WyjfH/hz/rbh6lXcxIt4g8d7gFHAQ6tGTA/altYHrcv
	HJeApjzn4KBwerymdfJ1bKr7Ktc1HyUyGVCpE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=mzxucw8sC17Y/0b6mmLugWrL9UGsQ51ixBp0lhoJYAXlgH2Gyzx3owTYDJ7luIN5PE
	cvVwJThDlSq2Xjc7pIj3pBVQRbyYQxOtMUP2C0x9Wtjz7nGVpjZ4a+L5nIjZxmTULkfQ
	sq0sBYLN9Lp1VfYb44geXwX5Hm5v/pN2y4+rw=
MIME-Version: 1.0
Received: by 10.229.1.139 with SMTP id 11mr33223qcf.2.1256327616114; Fri, 23 
	Oct 2009 12:53:36 -0700 (PDT)
In-Reply-To: <hbrs68$gbd$1@ger.gmane.org>
References: <200910230504.57681.holger+oe@freyther.de>
	<200910230930.00314.holger+oe@freyther.de>
	<hbrnn4$1kd$1@ger.gmane.org>
	<200910231023.43911.holger+oe@freyther.de>
	<1256286976.4529.117.camel@mill.internal.reciva.com>
	<hbrs68$gbd$1@ger.gmane.org>
Date: Fri, 23 Oct 2009 12:53:36 -0700
Message-ID: <19c1b8a90910231253v78a3d4behe11c690e8306de28@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.178
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert "package bbclass: strip static libs as well"
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
X-List-Received-Date: Fri, 23 Oct 2009 19:54:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2009 at 2:14 AM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> On 23-10-09 10:36, Phil Blundell wrote:
>>
>> On Fri, 2009-10-23 at 10:23 +0200, Holger Hans Peter Freyther wrote:
>>>
>>> One thing that pops back into my mind is to move .a files into a -stati=
c
>>> package? People that want to link statically can pick their .a files.
>>
>> Yes, I think someone else proposed this a few weeks ago but it doesn't
>> seem to have happened. =C2=A0Given that static linking is pretty much a
>> minority pursuit nowadays (excepting libc_noshared.a) this sounds like a
>> fine idea.
>>
>> Stripping .a files with the default options will effectively destroy
>> them so the current state of affairs is definitely silly. =C2=A0If you a=
re
>> going to do that then you might as well just delete the files: they are
>> no use for anything after stripping.
>>
>> An alternative (or an addition) to the -static packaging would be to
>> arrange for .a files (and .o files, I guess) to be stripped with "strip
>> --strip-debug" (or perhaps --strip-unneeded). =C2=A0This should leave en=
ough
>> symbol data in the files for them to remain usable.
>
> Something like this (but without the mailer induced linewrapping)?
>
> diff --git a/classes/package.bbclass b/classes/package.bbclass
> index 046351a..2bf55e3 100644
> --- a/classes/package.bbclass
> +++ b/classes/package.bbclass
> @@ -183,6 +183,9 @@ def runstrip(file, d):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 extraflags =3D "--remove-section=3D.comment -=
-remove-section=3D.note
> --strip-unneeded"
> =C2=A0 =C2=A0 elif "shared" in result or "executable" in result:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 extraflags =3D "--remove-section=3D.comment -=
-remove-section=3D.note"
> + =C2=A0 =C2=A0 =C2=A0 elif file.endswith(".a")::
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0extraflags =3D "=
--remove-section=3D.comment --strip-debug"
> +

if you strip out anything from .a files it wont be recoverable. iow it
will be thrown away
in this case the debug information will be stripped out and when you
use these libraries
to link on target they wont have debug information. If thats a ok
tradeoff for size vs debuggability
then its ok.

>
> =C2=A0 =C2=A0 bb.mkdirhier(os.path.join(os.path.dirname(file), ".debug"))
> =C2=A0 =C2=A0 debugfile=3Dos.path.join(os.path.dirname(file), ".debug",
> os.path.basename(file))
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 7426095..6c1cc06 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -207,7 +207,7 @@ SOLIBSDEV_darwin =3D ".dylib"
> =C2=A0SOLIBSDEV_darwin8 =3D ".dylib"
> =C2=A0SOLIBSDEV_darwin9 =3D ".dylib"
>
> -PACKAGES =3D "${PN}-dbg ${PN} ${PN}-doc ${PN}-dev ${PN}-locale"
> +PACKAGES =3D "${PN}-dbg ${PN} ${PN}-doc ${PN}-static ${PN}-dev ${PN}-loc=
ale"
> =C2=A0#enable this when bitbake is upgraded to cope with ++ values in the=
 field
> =C2=A0PACKAGES_DYNAMIC =3D "${PN}-locale-*"
> =C2=A0FILES =3D ""
> @@ -225,9 +225,11 @@ FILES_${PN}-doc =3D "${docdir} ${mandir} ${infodir}
> ${datadir}/gtk-doc \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/gnome/help"
> =C2=A0SECTION_${PN}-doc =3D "doc"
>
> +FILES_${PN}-static =3D "${libdir}/*.a ${base_libdir}/*.a"
> +
> =C2=A0FILES_${PN}-dev =3D "${includedir} ${libdir}/lib*${SOLIBSDEV} ${lib=
dir}/*.la
> \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/*.a ${=
libdir}/*.o ${libdir}/pkgconfig \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${base_libdir}/*=
.a ${base_libdir}/*.o ${datadir}/aclocal
> ${datadir}/pkgconfig"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/*.o ${=
libdir}/pkgconfig \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${base_libdir}/*=
.o ${datadir}/aclocal ${datadir}/pkgconfig"
> =C2=A0SECTION_${PN}-dev =3D "devel"
> =C2=A0ALLOW_EMPTY_${PN}-dev =3D "1"
> =C2=A0RDEPENDS_${PN}-dev =3D "${PN} (=3D ${EXTENDPV})"
>
>
> regards,
>
> Koen
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


