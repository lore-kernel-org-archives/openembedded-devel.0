Received: from mailgate1.neusoft.com ([210.83.210.153])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <liu-dj@neusoft.com>) id 1NSKJ2-0003S0-MR
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jan 2010 02:03:28 +0100
X-IronPort-AV: E=McAfee;i="5400,1158,5852"; a="41771758"
Received: from unknown (HELO mailgate8.neusoft.com) ([10.0.5.18])
	by mailgate1.neusoft.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	06 Jan 2010 08:58:03 +0800
Received: from unknown (HELO smtp3.neusoft.com) ([210.83.210.139])
	by mailgate8.neusoft.com with ESMTP; 06 Jan 2010 09:01:17 +0800
Received: from [10.1.10.188] ([10.1.10.188])
	by smtp3.neusoft.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul
	14 2004)) with ESMTPPSA id <0KVS0063EW7MWI@smtp3.neusoft.com> for
	openembedded-devel@lists.openembedded.org; Wed,
	06 Jan 2010 09:02:10 +0800 (CST)
Date: Tue, 05 Jan 2010 22:01:50 -0300
From: "Dejun.Liu" <liu-dj@neusoft.com>
In-reply-to: <1262684483.2553.157.camel@lenovo.internal.reciva.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <1262739710.5798.14.camel@dejunliu-desktop>
MIME-version: 1.0
X-Mailer: Evolution 2.22.2
References: <1262678000.5798.9.camel@dejunliu-desktop>
	<1262684483.2553.157.camel@lenovo.internal.reciva.com>
X-SA-Exim-Connect-IP: 210.83.210.153
X-SA-Exim-Mail-From: liu-dj@neusoft.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: x11-image can't start up
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
X-List-Received-Date: Wed, 06 Jan 2010 01:03:28 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"

Hi,

Sorry for the delay in replying,my company's email server is down.

On Tue, 2010-01-05 at 09:41 +0000, Phil Blundell wrote:
> On Tue, 2010-01-05 at 04:53 -0300, Dejun.Liu wrote:
> > Hi,
> > 
> > I have build angstrom x11-image and test it with Qemu,
> > 
> > But Qemu failed to start up.
> > 
> > i dig the reason find that system have no more inodes to use.
> [...]
> > so does anyone know how to fix it in OE?
> 
> Check your IMAGE_CMD,  You didn't mention what filesystem you are using,
> but I'm guessing it's probably ext2.  In that case, I think you need to
> add a suitable -N or -i option to genext2fs.
-->yes i used the ext2 filesystem,because im not family with the OE
build system,so i can't find where is genext2fs.it's my first time to
build OE.would you like to tell me which recipe should i fix?

Cheers

Steven Liu


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



