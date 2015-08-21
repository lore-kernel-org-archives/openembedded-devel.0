Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 235E073CF2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 01:42:13 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so4006180wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 18:42:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=WdWMPng7qcNHMuTs+pBP01bLqEjbOKgDzBwjQkCXXas=;
	b=FskPIz4oGFThPTI5HyspJEy1vgWlAimHeGEq75yxaNyL63XeklHe73FwjgisxBfMZr
	3QGm0jX2BbZcY/OYiYh7XVT4c7/IL4dXf6LhDq6xOasUWaSso1Fqznh+9Wm3fwIxoT6Z
	OW0qyjVe1g+z733g/dfKoqiaOErwn0CBheQbcEFel6XiEigLQ+JFLLOURINaE84mXhVs
	SxnNPNSxoZcxOJ6hcykwhpq83UCbgdKaVvcXSWPw6svIXW3nJEEfE//LfdlONwXXOcT9
	9l/DwHfZVZHsbaFGJME9z81akFcEQOVBr2gKrbdA2HyBh85Zn02AZznsWqq82R3wDWmT
	fRuw==
X-Gm-Message-State: ALoCoQklNs0UIarR0GyOCCx4e1ePLvo1F9opu+2wOovJHr/IW2seQfX0+gB1R5J+F3v6B6HyWLuM
X-Received: by 10.180.79.132 with SMTP id j4mr1436572wix.87.1440121333676;
	Thu, 20 Aug 2015 18:42:13 -0700 (PDT)
Received: from [192.168.1.8] (90-145-86-162.bbserv.nl. [90.145.86.162])
	by smtp.gmail.com with ESMTPSA id i1sm7818371wjq.42.2015.08.20.18.42.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Aug 2015 18:42:12 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Koen Kooi <koen@dominion.thruhere.net>
X-Mailer: iPhone Mail (13A4325c)
In-Reply-To: <30DC4EDFD798C94083F3E083754532CC011C1F94CC@G08CNEXMBPEKD03.g08.fujitsu.local>
Date: Fri, 21 Aug 2015 03:42:12 +0200
Message-Id: <E7B82DA7-F22E-48D9-A3A5-A21E22DF54FE@dominion.thruhere.net>
References: <1440086369-3321-1-git-send-email-koen@dominion.thruhere.net>
	<1440086369-3321-2-git-send-email-koen@dominion.thruhere.net>
	<30DC4EDFD798C94083F3E083754532CC011C1F94CC@G08CNEXMBPEKD03.g08.fujitsu.local>
To: "Bian, Naimeng" <biannm@cn.fujitsu.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/5] waf-samba: add new class
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
X-List-Received-Date: Fri, 21 Aug 2015 01:42:17 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



Op 21 aug. 2015 om 03:11 heeft Bian, Naimeng <biannm@cn.fujitsu.com> het vol=
gende geschreven:

>> -----Original Message-----
>> From: Koen Kooi [mailto:koen@dominion.thruhere.net]
>> Sent: Thursday, August 20, 2015 11:59 PM
>> To: openembedded-devel@lists.openembedded.org
>> Cc: Bian, Naimeng; Koen Kooi
>> Subject: [meta-oe][PATCH 1/5] waf-samba: add new class
>>=20
>> From: Bian Naimeng <biannm@cn.fujitsu.com>
>>=20
>> waf-samba is a build system used by samba related software
>>=20
>> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta-oe/classes/waf-samba.bbclass | 51
>> +++++++++++++++++++++++++++++++++++++++
>> 1 file changed, 51 insertions(+)
>> create mode 100644 meta-oe/classes/waf-samba.bbclass
>>=20
>> diff --git a/meta-oe/classes/waf-samba.bbclass
>> b/meta-oe/classes/waf-samba.bbclass
>> new file mode 100644
>> index 0000000..b8e010a
>> --- /dev/null
>> +++ b/meta-oe/classes/waf-samba.bbclass
>> @@ -0,0 +1,51 @@
>> +# waf is a build system which is used by samba related project.
>> +# Obtain details from https://wiki.samba.org/index.php/Waf
>> +#
>> +inherit qemu pythonnative
>> +
>> +DEPENDS +=3D "qemu-native libxslt-native docbook-xsl-stylesheets-native
>> python"
>> +
>> +CONFIGUREOPTS =3D " --prefix=3D${prefix} =C2=A5
>> +                  --bindir=3D${bindir} =C2=A5
>> +                  --sbindir=3D${sbindir} =C2=A5
>> +                  --libexecdir=3D${libexecdir} =C2=A5
>> +                  --datadir=3D${datadir} =C2=A5
>> +                  --sysconfdir=3D${sysconfdir} =C2=A5
>> +                  --sharedstatedir=3D${sharedstatedir} =C2=A5
>> +                  --localstatedir=3D${localstatedir} =C2=A5
>> +                  --libdir=3D${libdir} =C2=A5
>> +                  --includedir=3D${includedir} =C2=A5
>> +                  --oldincludedir=3D${oldincludedir} =C2=A5
>> +                  --infodir=3D${infodir} =C2=A5
>> +                  --mandir=3D${mandir} =C2=A5
>> +                "
>> +
>> +do_configure() {
>> +    qemu_binary=3D"${@qemu_target_binary(d)}"
>> +    if [ ${qemu_binary} =3D=3D "qemu-allarch" ]; then
>> +        qemu_binary=3D"qemuwrapper"
>> +    fi
>> +
>> +    libdir_qemu=3D"${STAGING_DIR_HOST}/${libdir}"
>> +    base_libdir_qemu=3D"${STAGING_DIR_HOST}/${base_libdir}"
>> +    oldest_kernel_qemu=3D${OLDEST_KERNEL}
>> +
>> +    CROSS_EXEC=3D"${qemu_binary} =C2=A5
>> +                -r ${oldest_kernel_qemu} =C2=A5
>> +                -L ${STAGING_DIR_HOST} =C2=A5
>> +                -E LD_LIBRARY_PATH=3D${libdir_qemu}:${base_libdir_qemu}"=

>> +
>> +    export BUILD_SYS=3D${BUILD_SYS}
>> +    export HOST_SYS=3D${HOST_SYS}
>> +    export BUILD_ARCH=3D${BUILD_ARCH}
>> +    export HOST_ARCH=3D${HOST_ARCH}
>> +    export STAGING_LIBDIR=3D${STAGING_LIBDIR}
>> +    export STAGING_INCDIR=3D${STAGING_INCDIR}
>> +    export PYTHONPATH=3D${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
>> +
>> +    ./configure ${CONFIGUREOPTS} ${EXTRA_OECONF} --cross-compile
>> --cross-execute=3D"${CROSS_EXEC}"
>> --cross-answers=3D${B}/cross-answers-${TARGET_ARCH}.txt
>=20
> Thanks for your update.
>=20
> Would you tell me why both --cross-execute and --cross-answer are required=
.

that's the new hybrid mode, it will generate crossanswers files using qemu. I=
 also have platforms without qemu support=20


> If the --cross-answers is not be required, IMO, we do not need support it.=

> Because it will be not an easy job to maintain cross-answers-${TARGET_ARCH=
}.txt for
> each waf-samba.bbclass based recipe.
>=20
> Thanks
> Bian
>=20
>> +}
>> +
>> +do_install() {
>> +    oe_runmake install DESTDIR=3D${D}
>> +}
>> --
>> 2.0.1
>=20

