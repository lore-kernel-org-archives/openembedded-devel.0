Received: from [212.18.0.9] (helo=mail-out.m-online.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mok@mnet-online.de>) id 1MpnGy-0006gM-1j
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Sep 2009 20:06:03 +0200
Received: from mail01.m-online.net (mail.m-online.net [192.168.3.149])
	by mail-out.m-online.net (Postfix) with ESMTP id 510491C15307;
	Mon, 21 Sep 2009 20:05:23 +0200 (CEST)
Received: from localhost (dynscan2.mnet-online.de [192.168.1.215])
	by mail.m-online.net (Postfix) with ESMTP id 49F99901DF;
	Mon, 21 Sep 2009 20:05:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.3.149])
	by localhost (dynscan2.mnet-online.de [192.168.1.215]) (amavisd-new,
	port 10024)
	with ESMTP id c172sldT8Brv; Mon, 21 Sep 2009 20:05:21 +0200 (CEST)
Received: from mrdenker.localdomain (ppp-88-217-0-214.dynamic.mnet-online.de
	[88.217.0.214])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTP;
	Mon, 21 Sep 2009 20:05:20 +0200 (CEST)
From: "Klaus 'mrmoku' Kurzmann" <mok@mnet-online.de>
To: shr-devel@lists.shr-project.org
Date: Mon, 21 Sep 2009 20:05:30 +0200
User-Agent: KMail/1.12.1 (Linux/2.6.30.5-43.fc11.x86_64; KDE/4.3.1; x86_64; ; )
References: <200908021211.14793.mok@mnet-online.de>
	<359c5480908040048t54ac4adbsa6a4e4fa88b7557f@mail.gmail.com>
	<359c5480909211003p49f636e9p38889c4967b2acc4@mail.gmail.com>
In-Reply-To: <359c5480909211003p49f636e9p38889c4967b2acc4@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200909212005.31498.mok@mnet-online.de>
X-SA-Exim-Connect-IP: 212.18.0.9
X-SA-Exim-Mail-From: mok@mnet-online.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [Shr-Devel] some RRECOMMENDed packages do not get included into the image
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
X-List-Received-Date: Mon, 21 Sep 2009 18:06:03 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Am Montag 21 September 2009 19:03:38 schrieb Nicola Mfb:
> On Tue, Aug 4, 2009 at 9:48 AM, Nicola Mfb<nicola.mfb@gmail.com> wrote:
> [...]
> 
> > Some news about that?
> > I just reverted bb thread numbers to 1, now kernel is installed and
> > rcS too, so I'm experiencing the same of you, no X startup, etc.. I
> > tryed 1.8, 1.8-parser-rework and old bitbake from svn, same result.
> 
> Hi Klaus,
> I just tryed again in the latest days and got the same result.
> Was it fixed? is there a workaround? building from milestone5.5 branch is
>  ok.
The reason is that some package that is needed by one of the tasks did not get 
built. As a consequence that task does not get included into the image. I 
don't remember which package it was for me, but manually building the package, 
properly cleaning the tasks and rebuilding fixed it. What annoys me is that OE 
continues to build the image instead of bailing out...

If this is the reason you will have some ERROR somewhere in the rootfs log. 
Probably only on the first build though (at least that was my impression).

Right now building from scratch should work though (just did that today).

Hope that helps :-)

> 
> Best Regards
> 
>      Nicola

-- 

Klaus 'mrmoku' Kurzmann


