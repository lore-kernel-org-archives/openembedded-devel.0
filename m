Received: from llsa987-a03.servidoresdns.net ([82.223.190.28])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaume@fqingenieria.es>) id 1NxDkD-000634-BP
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 08:19:10 +0200
Received: from [127.0.0.1] (ip24258.vig.altecom.net [212.121.242.58])
	by smtp-03.servidoresdns.net (Postfix) with ESMTP id 8E84160BA7;
	Thu,  1 Apr 2010 08:15:52 +0200 (CEST)
Message-ID: <4BB43A16.2040708@fqingenieria.es>
Date: Thu, 01 Apr 2010 08:15:50 +0200
From: Jaume Ribot <jaume@fqingenieria.es>
User-Agent: Thunderbird 2.0.0.24 (Windows/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1269935184-21934-1-git-send-email-mchazaux@adeneo-embedded.com>
	<20100331204928.GB14197@gmail.com>
In-Reply-To: <20100331204928.GB14197@gmail.com>
X-SA-Exim-Connect-IP: 82.223.190.28
X-SA-Exim-Mail-From: jaume@fqingenieria.es
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?UTF-8?B?TWlja2HDq2wgQ0hBWkFVWA==?= <mchazaux@adeneo-embedded.com>
Subject: Re: [PATCH] Add Freescale i.MX25 3stack support
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
X-List-Received-Date: Thu, 01 Apr 2010 06:19:10 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Thanks for patch! I will try it.
Just a comment: Any reason for not using last Freescale Linux version?=20
(2.6.31)


Khem Raj escribi=C3=B3:
> On (30/03/10 09:46), Micka=C3=ABl CHAZAUX wrote:
>  =20
>> This patch adds support for the i.MX25 3Stack platform.
>> 	It is based on the patches released by Freescale as
>> 	part of LTIB.
>> ---
>>  conf/machine/mx25-3stack.conf                    |   23 +
>>  recipes/linux/linux-2.6.28/mx25-3stack/defconfig | 1725 +++++++++++++=
+++++++++
>>  recipes/linux/linux_2.6.28.bb                    |    8 +
>>  recipes/u-boot/u-boot_2009.01.bb                 |    6 +
>>  4 files changed, 1762 insertions(+), 0 deletions(-)
>>  create mode 100644 conf/machine/mx25-3stack.conf
>>  create mode 100644 recipes/linux/linux-2.6.28/mx25-3stack/defconfig
>>
>>    =20
> Thanks for the patch.
>
> <snip>
>  =20
>> diff --git a/recipes/linux/linux_2.6.28.bb b/recipes/linux/linux_2.6.2=
8.bb
>> index 5288208..2dfc19e 100644
>> --- a/recipes/linux/linux_2.6.28.bb
>> +++ b/recipes/linux/linux_2.6.28.bb
>> @@ -14,6 +14,7 @@ DEFAULT_PREFERENCE_wrap =3D "1"
>>  DEFAULT_PREFERENCE_tx27 =3D "1"
>>  DEFAULT_PREFERENCE_nokia900 =3D "1"
>>  DEFAULT_PREFERENCE_mh355 =3D "1"
>> +DEFAULT_PREFERENCE_mx25-3stack =3D "1"
>> =20
>>  SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.28.t=
ar.bz2 \
>>             ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.10.b=
z2;patch=3D1 \
>> @@ -81,4 +82,11 @@ SRC_URI_nokia900 =3D "${KERNELORG_MIRROR}/pub/linux=
/kernel/v2.6/linux-2.6.28.tar.b
>>  		    http://repository.maemo.org/pool/maemo5.0/free/k/kernel/kernel_=
2.6.28-20094803.3+0m5.diff.gz;patch=3D1 \
>>  		    file://defconfig"
>> =20
>> +SRC_URI_mx25-3stack =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/li=
nux-2.6.28.tar.bz2 \
>> +                       http://download.berlios.de/mx25patches/linux-2=
.6.28-imx_4.5.1.patch.bz2;patch=3D1;name=3Dpatchmx25\
>> +                       file://defconfig"
>> +
>>    =20
>
> We also have the latest minor patch on top of stock 2.6.28 as well whic=
h
> brings it to 2.6.28.10. Can you
> try to check if you can build on top of that ?
>
> Just SRC_URI_append_mx25-3stack =3D
> "http://download.berlios.de/mx25patches/linux-2.6.28-imx_4.5.1.patch.bz=
2;patch=3D1;name=3Dpatchmx25"
>
>
>  =20
>> +SRC_URI[patchmx25.md5sum] =3D "7d8de4524713fce3124162fae7a20503"
>> +SRC_URI[patchmx25.sha256] =3D "fa3caff8d5def01c668dba441bfde577b7e3c1=
975773cb42f9313a14b662b0d3"
>> +
>>  S =3D "${WORKDIR}/linux-2.6.28/"
>> diff --git a/recipes/u-boot/u-boot_2009.01.bb b/recipes/u-boot/u-boot_=
2009.01.bb
>> index dfb3b3a..ca115d7 100644
>> --- a/recipes/u-boot/u-boot_2009.01.bb
>> +++ b/recipes/u-boot/u-boot_2009.01.bb
>> @@ -13,6 +13,7 @@ DEFAULT_PREFERENCE_at91sam9263ek =3D "1"
>>  DEFAULT_PREFERENCE_at91cap9adk	 =3D "1"
>>  DEFAULT_PREFERENCE_atngw100	 =3D "1"
>>  DEFAULT_PREFERENCE_atstk1000	 =3D "1"
>> +DEFAULT_PREFERENCE_mx25-3stack	 =3D "1"
>> =20
>>  PR =3D "r1"
>> =20
>> @@ -28,4 +29,9 @@ SRC_URI_append_at91sam9g20ek =3D "\
>>  	   file://u-boot-2009.01-exp-003-drivers-net-macb.c.patch;patch=3D1 =
\
>>             file://at91sam9g20-fix-config.patch;patch=3D1 \
>>             "
>> +SRC_URI_append_mx25-3stack =3D"\
>> +           http://download.berlios.de/mx25patches/u-boot-v2009.01-imx=
_4.5.1.patch.bz2;patch=3D1;name=3Dubootmx25patch \
>> +           "
>> =20
>> +SRC_URI[ubootmx25patch.md5sum] =3D "32cac5f5241c6eb8ce716f3e0e05de0a"
>> +SRC_URI[ubootmx25patch.sha256sum] =3D "c3ec96dc0f5e9213d20e9e0865a896=
eb61feed0033d93fd04dcc378b75cf59e7"
>> --=20
>> 1.6.3.3
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>    =20
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>  =20


--=20
Jaume Ribot Caner
R&D Engineer

FQ Ingenier=C3=ADa Electr=C3=B3nica, SA
Avda. de les Roquetes, 9
Pol. Industrial Vilanoveta
08812 Sant Pere de Ribes ( SPAIN )
www.fqingenieria.es

Tf  + 34 93 208 02 58
Fx  + 34 93 459 28 93
E-mail: jaume@fqingenieria.es



