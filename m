Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JhqvF-0006AJ-6g
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Apr 2008 20:45:57 +0200
X-ASG-Debug-ID: 1207334755-70f200390000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id B5EC237C43
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Apr 2008 13:45:55 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id pYUBIOMQaS8w85Wb for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 04 Apr 2008 13:45:55 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] Building multiple gdb-cross targets
Date: Fri, 4 Apr 2008 13:46:08 -0500
User-Agent: KMail/1.9.7
References: <200804041057.55738.geoffrey@pager.net>
	<47F66A0B.1000904@gmail.com>
In-Reply-To: <47F66A0B.1000904@gmail.com>
MIME-Version: 1.0
Message-Id: <200804041346.08584.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1207334755
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: Re: Building multiple gdb-cross targets
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
X-List-Received-Date: Fri, 04 Apr 2008 18:45:57 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Friday 04 April 2008 12:48:59 pm Khem Raj wrote:
> Geoffrey Wossum wrote:

> > How can I get OE to build just an avr32-gdb?  How can I get OE to build
> > both avr32-gdb and avr32-linux-gdb (aka avr32-angstrom-linux-uclibc-gdb=
)?
>
> They are two different configurations of gdb the one OE will build for
> you is the cross gdb which is supposed to cross debug linux applications
> (e.g. arm-*-linux-gnueabi). The one you are intending to have is what I
> call baremetal (e.g. arm-eabi)  debugger. I dont think you will be able
> to build this with ease using OE as they are really two different
> targets for OE to build.

It was easy enough to build the bare metal debugger outside OE.  Just seems=
=20
like you should be able to build this with OE, too.  It seems like it might=
=20
need a separate .bb file to pull it off.  Not exactly sure how you'd force=
=20
bitbake to use a different target setting.  Maybe setting the TARGET_OS to =
be=20
blank in the bitbake file?

> Why would avr-linux gdb not work ?

=46rom the avr32linux wiki entry on kernel debugging:
avr32-gdb (the standalone debugger) or avr32-linux-gdb. Preferably the form=
er=20
since it has the ability to read and write system registers.

=2D--
Geoffrey



