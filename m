Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1TGnyx-0000u1-Ah
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Sep 2012 11:32:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8Q9JlmS018025
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Sep 2012 02:19:48 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Wed, 26 Sep 2012 02:19:47 -0700
Message-ID: <5062C8B1.1080901@windriver.com>
Date: Wed, 26 Sep 2012 17:19:45 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1348631669-22341-1-git-send-email-jackie.huang@windriver.com>
	<k3uap8$evl$1@ger.gmane.org>
In-Reply-To: <k3uap8$evl$1@ger.gmane.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-networking] [PATCH] ptpd: migrate from meta-oe into meta-networking and uprev to ptpd 2.2.0
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
X-List-Received-Date: Wed, 26 Sep 2012 09:32:39 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 9/26/2012 3:27 PM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 26-09-12 05:54, jackie.huang@windriver.com schreef:
>> From: Jackie Huang <jackie.huang@windriver.com>
>>
>
>> meta-networking/recipes-daemons/ptpd/ptpd_1.0.0.bb |   20 +++++++
>> meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb |   32 ++++++++++
>
> First: why do we need 2 versions?

I thought we need to keep the versions we ever had. I will remove the 
old one.

>
>> +SUMMARY = "The PTP daemon (PTPd)" +DESCRIPTION = "The PTP daemon (PTPd)
>> implements the Precision Time protocol (PTP) as \ +defined by the
>> relevant IEEE 1588 standard. PTP Version 1 implements IEEE-1588-2002, \
>> +and PTP Version 2 implements IEEE-1588-2008. PTP was developed to
>> provide very precise \ +time coordination of LAN connected computers."
>> +HOMEPAGE = "http://sourceforge.net/projects/ptpd" +SECTION = "network"
>> +LICENSE = "BSD" + +PR = "r0"
>
> Remove that

Got it, I will remove it.

>
>> + +LIC_FILES_CHKSUM =
>> "file://../COPYRIGHT;md5=3d8ac2c46c116bce2d2ad838b6cf3491"
>
> That goes together with the LICENSE var
>
>> + +SRC_URI =
>> "http://downloads.sourceforge.net/project/ptpd/ptpd/${PV}/ptpd-${PV}.tar.gz
>> \ +           file://adjust-daemon-name.patch;striplevel=2 \ +
>> file://ld-as-needed.patch;striplevel=2 \ +" + +SRC_URI[md5sum] =
>> "c63a3a149d30c710773ccb02df5782a3" +SRC_URI[sha256sum] =
>> "f2266a22db84318d8b9ce266ea83772c03438c31f4993fa9643fa675a07c26b4" + +S =
>> "${WORKDIR}/ptpd-${PV}/src" + +# EXTRA_OEMAKE is typically: -e
>> MAKEFLAGS= +# the -e causes problems as CFLAGS is modified in the
>> Makefile. +EXTRA_OEMAKE = ""
>
> Modified how? Are the OE CFLAGS and LDFLAGS getting used or not ?

Some default CFLAGS is added in the Makefile which will be overrode with 
-e, and I checked taht the OE CFLAGS and LDFLAGS are still getting used 
without the -e option, so I did like this, but sounds like it is not 
recommended, right?

>
>> + +do_install() { +        install -d ${D}${bindir} ${D}${mandir}/man8 +
>> install -m 0755 ptpd ${D}${bindir} +        install -m 0644 ptpd2.8
>> ${D}${mandir}/man8 +}
>
> is 'make install' broken?

There is no 'make install' at all.

Thanks,
Jackie

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFQYq5rMkyGM64RGpERAo2vAJ9GpL7QQJHYGSkxiYC+/ePERYqIrACfUL7Q
> lekJzXFfoWZGp43GNgPTY4k=
> =h/6e
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745


