Received: from [64.233.182.185] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <yakov.zaytsev@gmail.com>) id 1IOHEU-0008Uw-6Z
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Aug 2007 20:16:39 +0200
Received: by nf-out-0910.google.com with SMTP id h3so458097nfh
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2007 11:15:26 -0700 (PDT)
Received: by 10.86.86.12 with SMTP id j12mr1571463fgb.1187892925993;
	Thu, 23 Aug 2007 11:15:25 -0700 (PDT)
Received: from 89-179-46-151.broadband.corbina.ru ( [89.179.46.151])
	by mx.google.com with ESMTPS id c28sm4150325fka.2007.08.23.11.15.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 23 Aug 2007 11:15:24 -0700 (PDT)
Message-ID: <46CDCEB1.3020303@gmail.com>
Date: Thu, 23 Aug 2007 22:15:13 +0400
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1ef816af0708221151m5c3c2b4ds9b90fdbddc56d8d1@mail.gmail.com>	<19c1b8a90708221646p6cfd0e6do6574668bbe15d775@mail.gmail.com>	<1ef816af0708230241s62454f78oa0147b10cae53ce6@mail.gmail.com>	<46CD69E3.707@whitby.id.au>
	<46CD6D45.9050602@dominion.kabel.utwente.nl>
In-Reply-To: <46CD6D45.9050602@dominion.kabel.utwente.nl>
From: Yakov Zaytsev <yakov.zaytsev@gmail.com>
Cc: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
Subject: Re: binutils-cross_2.17.50.0.5.bb failed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Aug 2007 18:16:39 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Script 
<..>build/tmp/work/armv5te-angstrom-linux-gnueabi/binutils-cross-2.17.50.0.5-r1/temp/run.do_configure.262

last couple of lines are

<..>

cd 
/Volumes/OE/stuff/build/tmp/work/armv5te-angstrom-linux-gnueabi/binutils-cross-2.17.50.0.5-r1/binutils-2.17.50.0.5/build.i386-darwin.arm-angstrom-linux-gnueabi
do_configure <===

I've checked target directory 
<..>binutils-2.17.50.0.5/build.i386-darwin.arm-angstrom-linux-gnueabi 
it's EMPTY
What might it be..

Hope this gives more info for the gurus...

Koen Kooi пишет:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Rod Whitby schreef:
>   
>> yakov.zaytsev@gmail.com wrote:
>>     
>>> ..binutils-cross-2.17.50.0.5-r1/temp/log.do_configure.8057 contains
>>>
>>> --
>>> /Volumes/OE/stuff/build/tmp/work/armv5te-angstrom-linux-gnueabi/binutils-
>>> cross-2.17.50.0.5-r1/temp/run.do_configure.8057: line 782: do_configure:
>>> command not found
>>>       
>> You've been bitten by the "build crosses midnight GMT" bitbake bug.
>>
>> Rebuild the affected package using "make rebuild-package-binutils-cross"
>> if this occurs.  See Mickey's other email on the subject.
>>     
>
> you mean 'bitbake -c rebuild binutils-cross'? Please stop with those unhelpfull comments.
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFGzW1FMkyGM64RGpERArIgAJ9DUEs1fP8yR4OyXW0MZ5rCdg3mPgCfX5MK
> lmpW4rkUJSNiYAiZpgIKdnI=
> =+zA4
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>   



