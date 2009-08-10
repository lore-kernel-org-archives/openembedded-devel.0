Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MaLmk-0000S7-2T
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Aug 2009 05:42:58 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 574C41B10C07
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Aug 2009 03:29:51 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Aug 2009 05:26:17 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <1249645320-4423-1-git-send-email-ihar.hrachyshka@gmail.com>
	<200908091518.20319.holger+oe@freyther.de>
	<fce2a370908091423r3b6396ecrf96c822c5372be02@mail.gmail.com>
In-Reply-To: <fce2a370908091423r3b6396ecrf96c822c5372be02@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200908100526.18307.holger+oe@freyther.de>
Subject: Re: [PATCH] Added rcc (resource compiler) utility setup for QTE toolchain environment.
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
X-List-Received-Date: Mon, 10 Aug 2009 03:42:58 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Sunday 09 August 2009 23:23:10 Ihar Hrachyshka wrote:
> On Sun, Aug 9, 2009 at 4:18 PM, Holger Hans Peter

> Do you mean we should have several environment-setups - for QtE and QtX11?

I think of "alias qmake-qte=QMAKESPEC=.. QMAKE_QT_CONFIG=qte/qconfig.pri"


>
> >        - Fix postgres test
>
> Seems to be a postgresql recipe problem (no pg_config staged, and
> currently it's compiled for target, not host so staging won't fix the
> problem in any way). I'll look at it closer this week.

Right. I have attempted to guard the pg_config invocation with QT_CROSS_COMPILE 
== "no" but that is failing as we pass -platform linux-... -xplatform linux- 
and actually are not "cross compiling" what the buildsystem concerns. I have 
opted for just patching out the pg_config invocation and will land the patch in 
a second.



> >        - Rename qt4-x11-free to qt4-x11
>
> Seems reasonable for me

Yes, we just need to make package upgrading work...


> .
> >        - Kill qtopia from the path name..
>
> Where should we store QtE (and Qt/X11) files then?

qte/,  qt-embedded-linux.



