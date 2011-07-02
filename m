Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qd8tS-00024G-Jt
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 Jul 2011 00:42:30 +0200
Received: by pvf24 with SMTP id 24so3696342pvf.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jul 2011 15:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=RQlt43um+d/HbVNvwnNeEDeL+wccjXMXoD5lU2Fau9Q=;
	b=vxzI4e0MsGmunCxDp0A4vcxoshOimnlitbiD98TOvbfnnBodhRbRwYG2NLQrTs42ZT
	H0IORmX0WaW0xEqu2jVAHPRTShOcMcV6SzOiNathdkBdFCJWymzIq8fXe8/XA2bDgsm+
	1gPiumfzWc/PfhPb00tK6+umQXb/KP/ST+P3c=
Received: by 10.142.62.29 with SMTP id k29mr228651wfa.253.1309646321578;
	Sat, 02 Jul 2011 15:38:41 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w24sm3040153wfd.17.2011.07.02.15.38.40
	(version=SSLv3 cipher=OTHER); Sat, 02 Jul 2011 15:38:40 -0700 (PDT)
Message-ID: <4E0F9DEF.8070803@gmail.com>
Date: Sat, 02 Jul 2011 15:38:39 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1309624039-3330-1-git-send-email-raj.khem@gmail.com>
	<iunvhl$mg5$2@dough.gmane.org>
In-Reply-To: <iunvhl$mg5$2@dough.gmane.org>
Subject: Re: [meta-oe][PATCH] systemd: Replace use of %m in printf formats
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
X-List-Received-Date: Sat, 02 Jul 2011 22:42:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/02/2011 01:37 PM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 02-07-11 18:27, Khem Raj schreef:
>> The patch is applied optionally only to uclibc builds
>
>> @@ -25,7 +25,10 @@ SRC_URI =
>> "git://anongit.freedesktop.org/systemd;protocol=git \
>> file://0001-systemd-disable-xml-file-stuff-and-introspection.patch \
>> file://paper-over-mkostemp.patch \ file://use-nonet-for-docbook.patch
>> \ +           ${UCLIBCPATCHES} \ " +UCLIBCPATCHES = ""
>> +UCLIBCPATCHES_libc-uclibc = "file://format-replace-m-uclibc.patch"
>
> Can you move mkostemp to UCLIBCPATCHES as well please?

Yes. however that patch changes are conditional on __UCLIBC__ so 
ineffect its not going to affect but let me send v2

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFOD4F1MkyGM64RGpERAq3XAKCUQ2ahSrJS/TqYeByoo76QTyMgywCfcqgh
> 0+qfOI0m2fv8YSby6uvQr5M=
> =5xeP
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



