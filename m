Received: from [212.227.126.186] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dirk@opfer-online.de>) id 1M4xNs-0002F4-9r
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 15:23:32 +0200
Received: from mail.opfer.lan (do13.in-dsl.de [217.197.85.204])
	by mrelayeu.kundenserver.de (node=mreu1) with ESMTP (Nemesis)
	id 0MKv1o-1M4xH620fJ-000jFD; Fri, 15 May 2009 15:16:33 +0200
Received: from localhost ([127.0.0.1] helo=home.opfer.tk)
	by mail.opfer.lan with esmtpa (Exim 4.67)
	(envelope-from <dirk@opfer-online.de>) id 1M4xGj-0000sR-W0
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 15:16:30 +0200
Received: from p578b18b1.dip0.t-ipconnect.de ([87.139.24.177])
	(SquirrelMail authenticated user dirk) by home.opfer.tk with HTTP;
	Fri, 15 May 2009 15:16:09 +0200 (CEST)
In-Reply-To: <c384c5ea0905150520k3e38f4f3q2d2279f714eded1a@mail.gmail.com>
References: <c384c5ea0905150520k3e38f4f3q2d2279f714eded1a@mail.gmail.com>
Date: Fri, 15 May 2009 15:16:09 +0200 (CEST)
From: "Dirk Opfer" <dirk@opfer-online.de>
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.10a
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
X-Scan-Signature: 262c3d4071635bfeaf26f9015bb2d825
X-Spam-Score: -4.4 (----)
Message-Id: <0MKv1o-1M4xH620fJ-000jFD@mrelayeu.kundenserver.de>
X-Provags-ID: V01U2FsdGVkX18+nYtWaNpJ1byM2l8AD0IhrD4MpUmfiAUyoK1
	wrCm8rfiAzPZR//yHJozzfVcz8I5FqSeUOQp6jMIStZLmUhEOw
	+JuVocWDZfyak+JCuslvtPE2UwAv+f9
Subject: Re: [HEADS UP] zecke-no-host-includes.patch is not compiled-in for gcc 4.3.2+ (4.3.x?)
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
X-List-Received-Date: Fri, 15 May 2009 13:23:32 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Hello,

> Hello,
>
> I got a heads-up from one of the ptxdist guys that:
>
> http://cgit.openembedded.org/cgit.cgi?url=openembedded/tree/recipes/gcc/gcc-4.3.2/zecke-no-host-includes.patch
>
> no longer works for GCC 4.3.2 as GCC upstream changed "CROSS_COMPILE"
> to "CROSS_DIRECTORY_STRUCTURE".
>
> and the patch uses #ifdef CROSS_COMPILE
>
It looks like this is true:
Revision 119820 says:
Replace CROSS_COMPILE with CROSS_DIRECTORY_STRUCTURE.

http://gcc.gnu.org/viewcvs?view=rev&revision=119820

>
> The patch code thus is not compiled-in.
>
>
> I currently have no gcc 4.3.x oe builds, maybe someone who does can
> verify this quickly?
>

Regards,
Dirk



