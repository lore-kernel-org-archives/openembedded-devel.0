Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RzzID-0005vy-OS
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 00:38:46 +0100
Received: by pbcum15 with SMTP id um15so2127751pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2012 15:30:25 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.adami@gmail.com designates
	10.68.197.166 as permitted sender) client-ip=10.68.197.166; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of andrea.adami@gmail.com
	designates 10.68.197.166 as permitted sender)
	smtp.mail=andrea.adami@gmail.com;
	dkim=pass header.i=andrea.adami@gmail.com
Received: from mr.google.com ([10.68.197.166])
	by 10.68.197.166 with SMTP id iv6mr3708207pbc.128.1329867025595
	(num_hops = 1); Tue, 21 Feb 2012 15:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=P1uzBZdUAzT/SZBpGXsQjVrjwobRX37koNggmePixsY=;
	b=a+f4YVJUaAnPygkcY9IQQjhXoxwrVmKtJTYn687v23f38lV7fm7jagXvypruvSqGM5
	zXHdvMTi66IMGmLNoMKwQrbmYdssmoJFsqBqQuUNsHFNdITqds4duQAO588zaIlJKAPj
	2s2jRzcLuOssfylNrqnnGkXolhH3ixlCtgK2A=
MIME-Version: 1.0
Received: by 10.68.197.166 with SMTP id iv6mr2927780pbc.128.1329867025395;
	Tue, 21 Feb 2012 15:30:25 -0800 (PST)
Received: by 10.143.147.17 with HTTP; Tue, 21 Feb 2012 15:30:25 -0800 (PST)
In-Reply-To: <20120221225146.GC3769@jama.jama.net>
References: <ef8b93c13cabd9e766e7f4d96df14710b36c3b87.1329780587.git.andrea.adami@gmail.com>
	<1329864496-27641-1-git-send-email-andrea.adami@gmail.com>
	<20120221225146.GC3769@jama.jama.net>
Date: Wed, 22 Feb 2012 00:30:25 +0100
Message-ID: <CAAQYJAsc00ZBHXxG0eeKSbtXhmnLc5+MXnpzRCOsHVL7OLvNFw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH v3 3/3] remove linux-kexecboot_3.1, now in meta-initramfs
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
X-List-Received-Date: Tue, 21 Feb 2012 23:38:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2012 at 11:51 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Tue, Feb 21, 2012 at 11:48:16PM +0100, Andrea Adami wrote:
>> * add .bbappend
>> * bump PR and INC_PR
>
> AFAIK if you don't move all versions at once then 3.2 will always win
> (ignoring D_P between layers).
>
> Cheers,

In my case it does not happen: 3.1 is built.

BBLAYERS =3D " \
  /oe/oe-core/meta \
  /oe/meta-handheld \
  /oe/meta-openembedded/meta-initramfs \
  "

Cheers

Andrea

>
>>
>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> ---
>> =A0recipes-kernel/linux/linux-kexecboot_3.1.bb =A0 =A0 =A0 | =A0 =A07 --=
--
>> =A0recipes-kernel/linux/linux-kexecboot_3.1.bbappend | =A0 36 ++++++++++=
+++++++++++
>> =A02 files changed, 36 insertions(+), 7 deletions(-)
>> =A0delete mode 100644 recipes-kernel/linux/linux-kexecboot_3.1.bb
>> =A0create mode 100644 recipes-kernel/linux/linux-kexecboot_3.1.bbappend
>>
>> diff --git a/recipes-kernel/linux/linux-kexecboot_3.1.bb b/recipes-kerne=
l/linux/linux-kexecboot_3.1.bb
>> deleted file mode 100644
>> index 28dc370..0000000
>> --- a/recipes-kernel/linux/linux-kexecboot_3.1.bb
>> +++ /dev/null
>> @@ -1,7 +0,0 @@
>> -require linux-kexecboot.inc
>> -require linux-${PV}.inc
>> -
>> -PR =3D "${INC_PR}.7"
>> -S =3D "${WORKDIR}/linux-${PV}"
>> -
>> -COMPATIBLE_MACHINE =3D "(akita|c7x0|collie|poodle|tosa|spitz)"
>> diff --git a/recipes-kernel/linux/linux-kexecboot_3.1.bbappend b/recipes=
-kernel/linux/linux-kexecboot_3.1.bbappend
>> new file mode 100644
>> index 0000000..74d63bb
>> --- /dev/null
>> +++ b/recipes-kernel/linux/linux-kexecboot_3.1.bbappend
>> @@ -0,0 +1,36 @@
>> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/linux-kexecboot-${PV}:${THISDI=
R}/files:"
>> +
>> +COMPATIBLE_MACHINE =3D "(akita|c7x0|collie|poodle|tosa|spitz)"
>> +
>> +# Note we set loglevel=3D3 and master console on serial to protect boot=
logo.
>> +CMDLINE_c7x0 =3D "console=3Dtty1 console=3DttyS0,115200n8"
>> +CMDLINE_tosa =3D "console=3Dtty1 console=3DttyS0,115200n8"
>> +CMDLINE_poodle =3D "console=3Dtty1 console=3DttyS0,115200n8 fbcon=3Drot=
ate:1"
>> +CMDLINE_akita =3D "console=3Dtty1 console=3DttyS0,115200n8 fbcon=3Drota=
te:1"
>> +CMDLINE_collie =3D "console=3Dtty1 console=3DttySA0,115200n8 fbcon=3Dro=
tate:1 mem=3D64M"
>> +CMDLINE_spitz =3D "console=3Dtty1 console=3DttyS0,115200n8 fbcon=3Drota=
te:1"
>> +
>> +# Zaurus machines need kernel size-check.
>> +KERNEL_IMAGE_MAXSIZE_akita =3D "1294336"
>> +KERNEL_IMAGE_MAXSIZE_c7x0 =3D "1294336"
>> +KERNEL_IMAGE_MAXSIZE_collie =3D "1048576"
>> +KERNEL_IMAGE_MAXSIZE_poodle =3D "1294336"
>> +KERNEL_IMAGE_MAXSIZE_tosa =3D "1294336"
>> +KERNEL_IMAGE_MAXSIZE_spitz =3D "1294336"
>> +
>> +LOGO_SIZE ?=3D "."
>> +
>> +SRC_URI +=3D "file://defconfig \
>> + =A0 =A0 =A0 =A0 =A0 file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
>> + =A0 =A0 =A0 =A0 =A0 "
>> +
>> +SRC_URI_append_collie =3D " \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://0001-pcmcia-pxa=
2xx_sharpsl-retain-ops-structure-on-collie.patch \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://locomo_kbd_twea=
k-r2.patch \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "
>> +
>> +SRC_URI_append_poodle =3D " \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://locomo_kbd_twea=
k-r2.patch \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "
>> +
>> +
>> --
>> 1.7.3.4
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


