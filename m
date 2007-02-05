Received: from [202.165.105.134] (helo=web15204.mail.cnb.yahoo.com)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <wzc0066@yahoo.com.cn>) id 1HE1TT-00062w-CQ
	for openembedded-devel@openembedded.org; Mon, 05 Feb 2007 11:53:28 +0100
Received: (qmail 46502 invoked by uid 60001); 5 Feb 2007 10:53:24 -0000
X-YMail-OSG: K74SoYoVM1np0faHU0MGfYZHLoCIGWBXYSYBgxmaizJklo.vMAabKQ8Xu8ZLpLSR41iRQFeOCwzxMFSWIlRkpVhYL39P9RIqS4xXs4ulQQc71sRJIL_S_PRRrdvPRxY-
Received: from [221.221.144.80] by web15204.mail.cnb.yahoo.com via HTTP;
	Mon, 05 Feb 2007 18:53:23 CST
Date: Mon, 5 Feb 2007 18:53:23 +0800 (CST)
From: zechao wang <wzc0066@yahoo.com.cn>
To: oe list <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Message-ID: <995082.46394.qm@web15204.mail.cnb.yahoo.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: How to use the qemu-arm to run an image which was built in oe?
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
X-List-Received-Date: Mon, 05 Feb 2007 10:53:28 -0000
Content-Type: text/plain; charset=gb2312
Content-Transfer-Encoding: 8bit

Hello:
The image was based on arm. I was told that the qemu-arm could run it, but i don't know how?

Please give me some advice, thanks so much.



 		
---------------------------------
 Mp3疯狂搜-新歌热歌高速下   
From koen@dominion.kabel.utwente.nl Mon Feb 05 12:58:16 2007
Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>)
	id 1HE2UC-0000A1-Lv; Mon, 05 Feb 2007 12:58:16 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l15BwBLr023947; Mon, 5 Feb 2007 12:58:12 +0100
Message-ID: <45C71BD0.9060509@dominion.kabel.utwente.nl>
Date: Mon, 05 Feb 2007 12:58:08 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <20070205093943.27977.qmail@webmail94.rediffmail.com>
In-Reply-To: <20070205093943.27977.qmail@webmail94.rediffmail.com>
X-Enigmail-Version: 0.94.1.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Cc: openembedded-users@openembedded.org
Subject: Re: [oe] Steps to Build a kernel
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
X-List-Received-Date: Mon, 05 Feb 2007 11:58:16 -0000

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Mr. Suhas Ghosh schreef:
> Hi All,

Hi, first of all:

DO NOT CROSSPOST[1]

>    I want to make a simple kernel for ARM926EJ-s.
>    I checked the Getting Started in the site.
>    But all are not clear and I also tried the First Project
>    mentioned there. 
>    I think I have to write three conf files 
>    and then from inside build I have to run bitbake bootstrap-image.
>    If I am wrong I need your help. 
>    Three conf files are like this
>    1.build/conf/local.conf 
>    2.org.openembedded.dev/conf/machine/machinename.conf

Look OK

>    3.org.openembedded.dev/conf/distro/machinename.conf

No, use DISTRO="angstrom-2007.1" instead of reinventing the wheel


> 
> My path is like that
>   /home/suhas/openembed/org.openembedded.dev
>   /home/suhas/openembed/build
>   /home/suhas/openembed/bitbake
>   /home/suhas/openembed/OE.mtn
> and I use these two export command
> export BBPATH=/home/suhas/openembed/build:/home/suhas/openembed/org.openembedded.dev
> export PATH=/home/suhas/openembed/bitbake/bin:$PATH
> 
> Now when I tried to run bitbake bootstrap-image from huild it always giving
> ERROR:unable to open /bitbake/conf/bitbake.conf files.

Try running bitbake with -DDD or stracing it to see what is tries to open.

regards,

Koen

[1] This email is crossposted to get the message across both mailinglists, so do not
blindly press "reply-all"!

> 
> But when I am using the default conf file and running
> bitbake nano it is running.
> 
> I can not fing out where is the problem.
> So please help.
> 
>                                 Thanking you in advance
>                                       suhas
>    
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFxxvQMkyGM64RGpERAgHVAKCPFn2wN2I6GcULCilDQw6jzupIxwCeJfH/
E0VKgdd0tth7Y5R7cgsZVD8=
=A5i/
-----END PGP SIGNATURE-----


