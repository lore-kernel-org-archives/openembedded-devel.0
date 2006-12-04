Received: from [212.60.202.195] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1GrD68-0003TX-7g
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Dec 2006 13:39:04 +0100
Received: from [212.60.202.194] (helo=[192.168.2.131])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA:32) (Exim 4.50)
	id 1GrDf2-0007ot-EH; Mon, 04 Dec 2006 14:15:08 +0100
Message-ID: <4574169B.105@kernelconcepts.de>
Date: Mon, 04 Dec 2006 13:37:47 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 1.5.0.8 (X11/20061117)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <37367b3a0612021013p700b017bmdaa382eb76527c8e@mail.gmail.com>	<20061202202256.GI25780@hovland.org>
	<op.tjx8spx2dbah4f@home888>	<45735DC9.1030201@kernelconcepts.de>
	<37367b3a0612040259v523319b5ua18608c1ce0ec683@mail.gmail.com>
In-Reply-To: <37367b3a0612040259v523319b5ua18608c1ce0ec683@mail.gmail.com>
X-Enigmail-Version: 0.94.0.0
Cc: Vladimir <vovan888@gmail.com>
Subject: Re: New palm environment
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
X-List-Received-Date: Mon, 04 Dec 2006 12:39:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Alan Carvalho de Assis schrieb:
> Do you know some simple way to make GPE work on non touchscreen
> device? Currently is GPE running on some non touchscreen device?

i know that there are some people working on getting better support for this
into GTK. In theory you could handle this in the applications itself but that
would mess up the code and cause quite some duplication. The most problems of
pointerless device support should be fixed in GTK.
The GTK Bugzilla contains some patches against GTK 2.6 if i remember correctly
and full support for devices without any pointer device should be available in
latest GTK CVS. Some of the basic PIM applications should work quite well
without a touchscreen, but i don't think using e.g. matchbox-panel is fun with
some keys only. Another thing we need to introduce in a useful way is support
for softkeys which are quite common on devices without a touchscreen.

Another problem is text input if you have a numeric keyboard only. We have a
small tool to do this in X but currently not enough time to do much of
development on it:
http://projects.linuxtogo.org/projects/thumbpad/

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-14
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76


