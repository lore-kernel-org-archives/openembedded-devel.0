Received: from [210.83.210.153] (helo=mailgate1.neusoft.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <liu-dj@neusoft.com>) id 1NReJQ-00073Z-TX
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jan 2010 05:13:04 +0100
X-IronPort-AV: E=McAfee;i="5400,1158,5850"; a="41525191"
Received: from unknown (HELO mailgate8.neusoft.com) ([10.0.5.18])
	by mailgate1.neusoft.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	04 Jan 2010 12:07:49 +0800
Received: from unknown (HELO smtp3.neusoft.com) ([210.83.210.139])
	by mailgate8.neusoft.com with ESMTP; 04 Jan 2010 12:10:55 +0800
Received: from [10.1.10.188] ([10.1.10.188])
	by smtp3.neusoft.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul
	14 2004)) with ESMTPPSA id <0KVP00FY2FNOSE@smtp3.neusoft.com> for
	openembedded-devel@lists.openembedded.org; Mon,
	04 Jan 2010 12:11:48 +0800 (CST)
Date: Mon, 04 Jan 2010 01:11:47 -0300
From: "Dejun.Liu" <liu-dj@neusoft.com>
In-reply-to: <201001040502.59944.holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Message-id: <1262578307.5811.32.camel@dejunliu-desktop>
MIME-version: 1.0
X-Mailer: Evolution 2.22.2
References: <1262570891.5811.14.camel@dejunliu-desktop>
	<201001040347.14305.holger+oe@freyther.de>
	<1262574693.5811.27.camel@dejunliu-desktop>
	<201001040502.59944.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 210.83.210.153
X-SA-Exim-Mail-From: liu-dj@neusoft.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: help on angstrom qemu
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
X-List-Received-Date: Mon, 04 Jan 2010 04:13:04 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"

Hi,

Thanks  Holger

Cheers

Steven Liu

On Mon, 2010-01-04 at 05:02 +0100, Holger Hans Peter Freyther wrote:
> On Monday 04 January 2010 04:11:33 Dejun.Liu wrote:
> 
> > -->I used the OE build Qemu which at the staging
> > dir(angstrom-dev/staging/i686-linux/usr/bin).
> > and i executed the command in the buildserver not using ssh
> 
> The good thing is, I was just trying the same and see the error you see. The 
> error is printed by qemu when it can not use the SetVideoMode call of SDL.
> 
> I will land a fix in a second. What you want to change in libsdl-native as a 
> quick solution is to add DEPENDS += "libx11-native" and change --disable-
> video-x11" to --enable-video-x11".
> 
> 
> thanks
> 	z.
> 
> 
> 
> 
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

---------------------------------------------------------------------------------------------------
Confidentiality Notice: The information contained in this e-mail and any accompanying attachment(s) 
is intended only for the use of the intended recipient and may be confidential and/or privileged of 
Neusoft Corporation, its subsidiaries and/or its affiliates. If any reader of this communication is 
not the intended recipient, unauthorized use, forwarding, printing,  storing, disclosure or copying 
is strictly prohibited, and may be unlawful.If you have received this communication in error,please 
immediately notify the sender by return e-mail, and delete the original message and all copies from 
your system. Thank you. 
---------------------------------------------------------------------------------------------------



