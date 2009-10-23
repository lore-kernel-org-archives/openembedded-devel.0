Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1N1EcC-0007U7-OV
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 09:31:15 +0200
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 36C3D1B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2009 07:39:22 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Oct 2009 09:30:00 +0200
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <200910230504.57681.holger+oe@freyther.de>
	<hbrlkn$qt7$1@ger.gmane.org>
In-Reply-To: <hbrlkn$qt7$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200910230930.00314.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert "package bbclass: strip static libs as well"
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
X-List-Received-Date: Fri, 23 Oct 2009 07:31:15 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 23 October 2009 09:23:03 Koen Kooi wrote:

> > I don't think we need to strip .a files as they will not end on the
> > device
> 
> They do actually
> 
> > and people will link their binaries to them and we will strip the
> > binaries.
> 
> There was a discussion about that and I didn't see people objection, the
> only point of contention was where to package the debug symbols. How do
> you propropose to solve the problem that the .a files are huge?
> Also, you don't mention any problems, you only say "I [..] think", which
> usually isn't a good enough reason to revert stuff :)

The above commits cause build problems and break the "toolchain" (native, 
cross-sdk) at runtime. The toolchain is broken as all symbols are stripped out 
of the libc_nonshared.a.

Why do you need .a files on the device? Is this normal operation or only when 
installing -dev packages?

z.




