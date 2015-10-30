Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0DF8375D4A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 13:23:30 +0000 (UTC)
Received: by wikq8 with SMTP id q8so10948677wik.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 06:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=Gn+ZEYsbuEj0/CBlpTlnbO5x3Hoae4prIUtrCNxKrq4=;
	b=zmFDIhfSv5AaRoc8rMoGrTQ3eGiSVBZpJkPuRRoOHcsAEb7RoiIFwGOKtSzsa6mW3J
	CxgK+1sUhDlH1ZVZvMh0hSBKFRNswbQYsPpil+Y4fOGJyxyFMRQrWenppXuZwwiXI0sV
	VLCnMM4vqI9/7OQ37ZQxXOgVcPF2PVKcMWkX9b0Up6MxTBSSFJRiqeDEGO+GdRx3wuUT
	cPuxywlPMpn8JZ9S4WKXXKTn7v+O+nOZL940BLVA3pORBCb1JetRPVio9hUeneq8MJNb
	PTYaO2I/ff7fFjZsFFdEHb6Eq/MpDjP2NoumlS5pNdCYfhmdcdVnAz5Hcgrqz2oaKJUj
	F5Bg==
X-Received: by 10.194.179.33 with SMTP id dd1mr9750994wjc.79.1446211409736;
	Fri, 30 Oct 2015 06:23:29 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12])
	by smtp.gmail.com with ESMTPSA id 20sm2912090wmh.8.2015.10.30.06.23.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 30 Oct 2015 06:23:29 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <17C19527BD855F428F22685986FD58BEA16409@IRSMSX103.ger.corp.intel.com>
Date: Fri, 30 Oct 2015 14:23:27 +0100
Message-Id: <807F3BB4-E1ED-44B8-9C73-1C168A32DD0A@gmail.com>
References: <4BA9AF94-31D9-4B1D-99DD-5D1DE20533EA@gmail.com>
	<17C19527BD855F428F22685986FD58BEA16318@IRSMSX103.ger.corp.intel.com>
	<25A9A07D-261D-4E51-98CB-EB3307D7D9A2@gmail.com>
	<17C19527BD855F428F22685986FD58BEA16409@IRSMSX103.ger.corp.intel.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-java][PATCH 4/4] openjdk-8: add recipes for	openjdk-8 and openjre-8
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
X-List-Received-Date: Fri, 30 Oct 2015 13:23:33 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


> Am 30.10.2015 um 13:41 schrieb Kaaria, Erkka <erkka.kaaria@intel.com>:
>=20
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On
>> Behalf Of Jens Rehsack
>> Sent: Friday, October 30, 2015 1:47 PM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [meta-java][PATCH 4/4] openjdk-8: add recipes for
>> openjdk-8 and openjre-8
>>=20
>> <snip>
>>=20
>>> Also, the openjdk-8-cross.inc currently uses openjdk-8-native as the
>> boostrap jdk for the openjkd/openjre-8. The build readme
>> =
(http://hg.openjdk.java.net/jdk8/jdk8/raw-file/tip/README-builds.html)
>> however suggests  that you should use the previous jdk version as the
>> boostrap jdk and that using openjdk 8 to boostrap openjdk 8 may =
introduce
>> unwanted dependencies. Perhaps using icedtea7-native would be better
>> here?
>>=20
>> openjdk-8-native uses icedtea7-native to bootstrap, openjdk-8 and =
openjre-
>> 8 use openjdk-8-native to bootstrap.
>> Can you explain which unwanted dependency openjdk-8-native might
>> introduce you don't even have by using icedtea7-native?
>>=20
>> Cheers
>> --
>> Jens Rehsack - rehsack@gmail.com
>>=20
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> Hi,=20
>=20
> I don't know if there are actually any issues when bootstrapping with =
openjdk-8-native. I just wanted to raise the issue as the openjdk build =
readme warns against this.=20

Wow, the exact phrasing is:

> Building JDK 8 requires use of a version of JDK 7 that is at Update 7 =
or newer. JDK 8 developers should not use JDK 8 as the boot JDK, to =
ensure that JDK 8 dependencies are not introduced into the parts of the =
system that are built with JDK 7.


So: If you intend to develop on JDK 8, don't use JDK 8 as boot JDK.

That is, to avoid that building JDK 8 requires JDK 8.

We're packagers, we're not the target for neither the warning nor =
use-case ;)

Best regards
--=20
Jens Rehsack - rehsack@gmail.com


