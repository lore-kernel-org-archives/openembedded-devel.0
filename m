Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 94E2B60167
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2014 11:42:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sADBg6ox027443
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2014 03:42:06 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 13 Nov 2014 03:42:05 -0800
Message-ID: <5464990A.5030400@windriver.com>
Date: Thu, 13 Nov 2014 19:42:02 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <cover.1415758217.git.hongxu.jia@windriver.com>	<d1a6e0fd2dabf3e291fe2b1c5e94f429fe390184.1415758217.git.hongxu.jia@windriver.com>
	<m4234b$gsg$1@ger.gmane.org>
In-Reply-To: <m4234b$gsg$1@ger.gmane.org>
Subject: Re: [PATCH 1/1] libbonobo.inc: add libbonobo-bin package
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
X-List-Received-Date: Thu, 13 Nov 2014 11:42:08 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/2014 07:02 PM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hongxu Jia schreef op 12-11-14 03:13:
>> The previous libbonobo package contains perl scripts, while installing
>> libbonobo, package management detected perl required, but it actually not
>> needed as lib. So add libbonobo-bin package to contain these scripts. It
>> refers debian: https://packages.debian.org/sid/libbonobo2-bin
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com> ---
>> meta-gnome/recipes-gnome/bonobo/libbonobo.inc | 3 ++- 1 file changed, 2
>> insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
>> b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc index 8b6007e..e0f6168
>> 100644 --- a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc +++
>> b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc @@ -5,10 +5,11 @@
>> LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f
>> \ SECTION = "x11/gnome/libs" DEPENDS = "glib-2.0 orbit2 intltool-native
>> libxml2 dbus dbus-glib"
>>
>> -inherit gnomebase gtk-doc +inherit gnomebase gtk-doc lib_package
>>
>> ORBIT_IDL_SRC = "${STAGING_BINDIR_NATIVE}/orbit-idl-2"
>>
>> +RDEPENDS_${PN}-bin = "${PN} perl" FILES_${PN} +=
>> "${libdir}/orbit-2.0/*.so ${libdir}/bonobo/monikers/*.so" FILES_${PN}-dbg
>> += "${libdir}/bonobo/monikers/.debug \
>> ${libdir}/bonobo-2.0/samples/.debug ${libdir}/orbit-2.0/.debug"
>>
> This breaks the upgrade path

I am sorry I do not understand what you mean,
do you mean running 'smart upgrade' failed?

The reason why split ${PN}-bin is it contain perl script.

//Hongxu

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFUZI/LMkyGM64RGpERAtVEAJ0XmKfZNy6DSxfpmN1DLPGrSf381ACgmPOz
> D6JMY11ejawTrkxO3ZcoBOw=
> =xLd+
> -----END PGP SIGNATURE-----
>


