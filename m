Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1O9yfT-00030C-Iz
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 12:51:03 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 69DC4491278;
	Thu,  6 May 2010 12:47:13 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 6 May 2010 12:48:15 +0200
Message-ID: <4BE29E46.2000600@dresearch.de>
Date: Thu, 06 May 2010 12:47:34 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.1.9) Gecko/20100317 Lightning/1.0b1 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BE185C7.50305@dresearch.de>	<1273140949-14699-1-git-send-email-sledz@dresearch.de>
	<hru6f7$4qk$1@dough.gmane.org>
In-Reply-To: <hru6f7$4qk$1@dough.gmane.org>
X-OriginalArrivalTime: 06 May 2010 10:48:15.0839 (UTC)
	FILETIME=[A1CAC6F0:01CAED09]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: [PATCH] angstrom-2008.1: use linux-libc-headers 2.6.24 for hipox machine
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
X-List-Received-Date: Thu, 06 May 2010 10:51:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 06.05.2010 12:42, wrote Koen Kooi:
>> Signed-off-by: Steffen Sledz <sledz@dresearch.de>
>> ---
>>  conf/distro/angstrom-2008.1.conf |    3 ++-
>>  1 files changed, 2 insertions(+), 1 deletions(-)
>=20
>> diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2=
008.1.conf
>> index 1df0c0b..760166b 100644
>> --- a/conf/distro/angstrom-2008.1.conf
>> +++ b/conf/distro/angstrom-2008.1.conf
>> @@ -81,7 +81,8 @@ PREFERRED_VERSION_linux-handhelds-2.6 ?=3D "2.6.21-h=
h20"
>>  #KERNEL_INITRAMFS_PATH =3D "${KERNEL_INITRAMFS_DIR}/$(readlink ${KERN=
EL_INITRAMFS_DIR}initramfs-bootmenu-image-${MACHINE}.cpio.gz)"
>=20
>>  #This is unrelated to the kernel version, but userspace apps (e.g. HA=
L) require a recent version to build against
>> -PREFERRED_VERSION_linux-libc-headers 	=3D "2.6.31"
>> +PREFERRED_VERSION_linux-libc-headers       ?=3D "2.6.31"
>> +PREFERRED_VERSION_linux-libc-headers_hipox ?=3D "2.6.24"
>=20
>>  #Prefer glibc 2.6 and uclibc 0.9.30, these have had the most testing.
>>  PREFERRED_VERSION_glibc 		?=3D "2.9"
>=20
> NACK, that creates undefined behaviour for multimachine builds.

Hmmm? So what's the right way to force s special headers version
for a machine?

> Also, please remove the legacy staging behaviour from the
> linux-libc-headers recipe you just pushed.

OK. I'll have a look at this.

--=20
Steffen Sledz
DResearch Digital Media Systems GmbH
Otto-Schmirgal-Str.3, D-10319 Berlin, Germany
Tel: +49 (30) 515932237 mailto:sledz@DResearch.DE
Fax: +49 (30) 515932299 http://www.DResearch.DE
Gesch=E4ftsf=FChrer: Dr. Michael Weber, Werner M=F6gle;
Amtsgericht Berlin Charlottenburg; HRB 54412;
Ust.-IDNr. DE169013825; WEEE Reg.-Nr. DE 85995642



