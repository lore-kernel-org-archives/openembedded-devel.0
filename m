Received: from [62.169.194.2] (helo=fesscrpp1.tellas.gr)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <skoroneos@digital-opsis.com>) id 1HJYMP-0006OB-HM
	for openembedded-devel@openembedded.org; Tue, 20 Feb 2007 18:01:06 +0100
Received: from dias (62.169.211.226) by fesscrpp1.tellas.gr (7.3.117)
	id 45DB18DD000012B5 for openembedded-devel@openembedded.org;
	Tue, 20 Feb 2007 19:00:12 +0200
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: <openembedded-devel@openembedded.org>
Date: Tue, 20 Feb 2007 19:01:18 +0200
Message-ID: <HOECLKEKOHLAMMGDLLBHAENOKCAA.skoroneos@digital-opsis.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3028
In-Reply-To: <200702201617.42247.openembedded@hrw.one.pl>
Importance: Normal
Subject: Re: Linux kernel recipes
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
X-List-Received-Date: Tue, 20 Feb 2007 17:01:20 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit



>
> Some time ago I added packages/linux/linux_2.6.19.bb (currently
> linux_2.6.20.bb) as some kind of generic Linux kernel recipe. Currently
> it is used for Progear and Simpad targets.
>
> Today we got linux-x86_2.6.20.bb which differ in just one thing..
> NAME. It
> does not contain any patches - just source archive and kernel
> configuration file. Can it be merged into linux_2.6.20.bb?
>

The x86 kernel is for the "generic" x86 machine.
If we can have a "generic" kernel (i.e all things setup as modules plus a
few things need for booting buildin ) i don't think it will be a problem how
we call it.
For the x86 we can "follow" also a kernel like Debian's so we can get the
patches and stuff from there


> We have few other 2.6.20 recipes but they are more machine specific
> (efika, ixp4xx, dht-walnut).
>

Speaking at least for the powerpc family, its difficult to have a "generic"
kernel mainly to the fact that the cpu's can differer significally.
The difference can be seen even more at the board level.


Stelios




