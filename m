Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Q7t4T-0000Xf-Rj
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Apr 2011 19:32:41 +0200
Received: by wwb17 with SMTP id 17so2927943wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Apr 2011 10:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=qpt4aZDaJ0hZGSsKMg4Y7J5TWyec94Qhfl8TgkSKLhU=;
	b=GrTDqvNK9O3HBarLLSYMVtPe+MtRsBcAksuRdMkijY2A1UcazZYWV1I7JPdufYOo2I
	h5nbTH5+RTAeN0Xz+kXte1XK0W4w0jeMbXempLnTfXCYXaGvYpVTR54kBsP1Q6aOgI37
	jRoKotO45f7cnBG28IQQ4F6j00Eg1EXmFXqYY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=IfN55NFPhZ8Tdwfm5IfX4e2roGBEycxePTHV0IQazU8GEYDFmMnr9+C82wBETAnY5R
	ugckwBRaotIK61LPLcq1mjHPR8a1Paf25ZK0P6TmO+v70TEpoFKbrIgVqc0rdnaH4xCP
	0oVk05gGASuOLT0xP91bZB3cEfy4+Oe74tmPk=
MIME-Version: 1.0
Received: by 10.227.209.137 with SMTP id gg9mr1167811wbb.124.1302197432833;
	Thu, 07 Apr 2011 10:30:32 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.46.207 with HTTP; Thu, 7 Apr 2011 10:30:32 -0700 (PDT)
In-Reply-To: <1302196878.14449.442.camel@phil-desktop>
References: <1302182396-4171-1-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-2-git-send-email-otavio@ossystems.com.br>
	<1302196878.14449.442.camel@phil-desktop>
Date: Thu, 7 Apr 2011 14:30:32 -0300
X-Google-Sender-Auth: 9wUWwYUJtcFbHM2TWyP15VrLSRA
Message-ID: <BANLkTin4_zGipzvY7=Tr9NdFrvV2mr+i3Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Phil Blundell <philb@gnu.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/6] udev (165): move ConsoleKit support to udev-consolekit package
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
X-List-Received-Date: Thu, 07 Apr 2011 17:32:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 7, 2011 at 14:21, Phil Blundell <philb@gnu.org> wrote:
> On Thu, 2011-04-07 at 13:19 +0000, Otavio Salvador wrote:
>> -PACKAGES =3D+ "libudev libgudev udev-utils"
>> +PACKAGES =3D+ "libudev libgudev udev-utils udev-consolekit"
>>
>> =A0FILES_libudev =3D "${base_libdir}/libudev.so.*"
>> =A0FILES_libgudev =3D "${base_libdir}/libgudev*.so.*"
>> @@ -84,7 +84,8 @@ FILES_${PN}-dbg +=3D "${usrbindir}/.debug ${usrsbindir=
}/.debug"
>>
>> =A0# udev installs binaries under $(udev_prefix)/lib/udev, even if ${lib=
dir}
>> =A0# is ${prefix}/lib64
>> -FILES_${PN} +=3D "/lib/udev* ${libdir}/ConsoleKit"
>> +FILES_${PN} +=3D "/lib/udev*"
>> +FILES_${PN}-consokekit +=3D "${libdir}/ConsoleKit"
>
> Did you test this patch? =A0Surely the line above should read
> "${PN}-consolekit" otherwise it won't match anything.

I did but probably did a mistake when rebasing it; will fix it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


