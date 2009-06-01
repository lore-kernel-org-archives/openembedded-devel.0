Received: from [65.55.111.151] (helo=blu0-omc4-s12.blu0.hotmail.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tiankongever@hotmail.com>) id 1MB53n-00061Z-LZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Jun 2009 12:48:07 +0200
Received: from BLU137-W15 ([65.55.111.135]) by blu0-omc4-s12.blu0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 1 Jun 2009 03:39:21 -0700
Message-ID: <BLU137-W15C50162BE2D466B2B3182D44C0@phx.gbl>
X-Originating-IP: [219.142.122.100]
From: =?gb2312?B?wfW3vLuq?= <tiankongever@hotmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Jun 2009 18:39:21 +0800
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 01 Jun 2009 10:39:21.0478 (UTC)
	FILETIME=[39408260:01C9E2A5]
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: How to convert OE hardware platform from ARM into X86
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
X-List-Received-Date: Mon, 01 Jun 2009 10:48:08 -0000
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: 8bit


Hi!

I need to convert OE hardware platform from ARM into X86,but I don't know the correct step, I tried as follows:
      Change the contents of file  ~/stuff/build/conf/local.conf, the changes are:
                           MACHINE = "i586-generic";
                           #TARGET_ARCH = "arm"
                           TARGET_OS = "linux"
then, build ,but a error occured:
  ERROR: Build of /home/build/stuff/openembedded/packages/xorg-lib/libx11_1.2.1.bb do_compile failed
  ERROR: Task 3164 (/home/build/stuff/openembedded/packages/xorg-lib/libx11_1.2.1.bb, do_compile) failed

Now,I don't know what to do, I tried to do some changes,but this error still exit,call for help! 
   

                                                                                      LiuFanghua

_________________________________________________________________
Messenger安全保护中心，免费修复系统漏洞，保护Messenger安全！
http://im.live.cn/safe/
From marcin@juszkiewicz.com.pl Mon Jun 01 13:57:32 2009
Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MB68y-0004is-P2
	for openembedded-devel@openembedded.org; Mon, 01 Jun 2009 13:57:32 +0200
Received: (qmail 21679 invoked by uid 813007); 1 Jun 2009 11:48:48 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Jun 2009 11:48:48 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 1 Jun 2009 13:49:16 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.30-rc6-00082-g7aff192-dirty; KDE/4.2.2;
	x86_64; ; )
References: <20090529233958.GA16815@misibook.miska.isageek.net>
	<20090530194215.GA1186@misibook.miska.isageek.net>
	<200906010053.30975.bluelightning@bluelightning.org>
In-Reply-To: <200906010053.30975.bluelightning@bluelightning.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200906011349.17080.marcin@juszkiewicz.com.pl>
Subject: Re: [oe] [PATCH] zuc: fixed build
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
X-List-Received-Date: Mon, 01 Jun 2009 11:57:33 -0000

Dnia poniedzia=C5=82ek, 1 czerwca 2009 o 01:53:30 Paul Eggleton napisa=C5=
=82(a):
> I did notice that we are using an OZ sources mirror on
> ewi546.ewi.utwente.nl for a few recipes but it doesn't seem to be
> responding right now for me. Should we still be fetching from this
> server or do we need to switch to a different mirror?

This machine is no longer available so those recipes needs to be=20
changed.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




