Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1IyA4u-0006iX-Sd
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Nov 2007 18:55:04 +0100
Received: from [192.168.2.163] by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1IyAMS-00050A-VI
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Nov 2007 19:13:12 +0100
Message-ID: <47504DBB.8020604@kernelconcepts.de>
Date: Fri, 30 Nov 2007 18:51:55 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20071129172123.GA29463@buddha.tw.openmoko.com>	<474F1835.6060002@student.utwente.nl>
	<A0AACB011FF0474492071F3E72FB188F958C5A@USSYML02.ad.sjm.com>
In-Reply-To: <A0AACB011FF0474492071F3E72FB188F958C5A@USSYML02.ad.sjm.com>
X-Enigmail-Version: 0.95.0
Subject: Re: Firewall blocking access to monotone server?
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
X-List-Received-Date: Fri, 30 Nov 2007 17:55:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Tiller, Jason schrieb:
> I'm running on a 400MHz P-III with 256MB of memory running RHEL 4.  The OS is
> mandated by my IT guys.  I got everything down, finally got everything built
> (well, so far), including git, svn, mtn, boost, (1.33.1), bb, and a whole
> host of other packages.  My poor little box has been compiling its little
> brains out.  I think I have everything in place.

Oh dear... RHEL4 is quite common, but compiling on this hardware will be a major
pain. I could donate an faster PC to your company if you like ;-)

> If I were to go to my IT guys and ask them (nicely) to help me out, what do I
> need to tell them in terms of the port/protocol issues?  I'll need to
> convince them that this is a safe proposition, but I'm sure exactly what I'm
> asking for.

Well since that's an outgoing connection on a single, defined port there is
really not much risk in opening it. If they are really crazy and do not want to
allow external connections they could provide a SOCKS proxy you could use with
tsocks.

Greetings

Florian


-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76


