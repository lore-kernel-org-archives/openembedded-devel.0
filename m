Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1Ix20u-0002ps-3U
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2007 16:06:16 +0100
Received: from [192.168.2.163] by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1Ix2IO-0005X7-Ud
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2007 16:24:20 +0100
Message-ID: <474C31B6.5060807@kernelconcepts.de>
Date: Tue, 27 Nov 2007 16:03:18 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20071125221011.B403A40012A@tinman.treke.net>
	<200711260016.45820.openembedded@haerwu.biz>
In-Reply-To: <200711260016.45820.openembedded@haerwu.biz>
X-Enigmail-Version: 0.95.0
Subject: Re: [oe-issues] [Bug 3131] zaurusd should rdepend on bl
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
X-List-Received-Date: Tue, 27 Nov 2007 15:06:16 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit

Hi,

Marcin Juszkiewicz schrieb:
>> --- Comment #1 from Matthias 'CoreDump' Hentges <oe@hentges.net> 
>> 2007-11-25 14:10:11 --- Added gpe-conf to DEPENDS and RDEPENDS as
>> gpe-conf emulates "bl" these days.
> 
> Zaurusd REQUIRE bl - not gpe-conf and we have 'bl' in repo - 
> packages/bl/bl_cvs.bb recipe. Please do test and fix zaurusd recipe to 
> depend on proper tool.

In my opinion "bl" is old, unmaintained, dead and only works on a few devices.
The bl emulation in gpe-conf should do the trick for zaurusd - even it might be
a better idea to have selectable providers for bl. gpe-conf is quite heavy and
you might not want to pull that in everywhere.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76


