Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1I7vUf-0003Ta-8y
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jul 2007 17:49:45 +0200
Received: from [212.60.202.194] (helo=[192.168.2.131])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1I7vUC-0002Ox-9D
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jul 2007 17:49:16 +0200
Message-ID: <469257C7.2040104@kernelconcepts.de>
Date: Mon, 09 Jul 2007 17:44:07 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 1.5.0.12 (X11/20070604)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <513012886.20070708041151@gmail.com>
	<f6q30v$s2$1@sea.gmane.org>	<128309124.20070709154303@gmail.com>	<20070709131744.GC2336@p3n3tr4t0r.internal>	<1005211919.20070709153513@vanille-media.de>	<20070709134256.GD2336@p3n3tr4t0r.internal>	<13810026301.20070709155245@vanille-media.de>	<20070709140338.GE2336@p3n3tr4t0r.internal>
	<4310707680.20070709161925@vanille-media.de>
In-Reply-To: <4310707680.20070709161925@vanille-media.de>
X-Enigmail-Version: 0.94.2.0
Subject: Re: [RFC] Adding screen dimensions to machine configs
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
X-List-Received-Date: Mon, 09 Jul 2007 15:49:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Dr. Michael Lauer schrieb:
>> I just worry what happens to machines without screens but that can have
>> gfx cards added.
> 
> Which is almost all equipment with USB host.

I think it is fine to assume that these devices that do not have a built-in
screen but support one by adding a graphics device can have a more or less
arbitrary resolution. That means that you assume a common resolution like
1024x768 and if you really have a special need you would override these values
anyway. For most devices which usually have no screen or a built-in one you
would be quite safe with one setting. For the others just choose a big default
which should bee correct in most cases and for things like background images it
is usually better to ship a big one and scale it down instead of shipping a too
small one.

>>  By the current level of thought behind these variables
>> a divide by zero is inevitable.
> 
> Ok, how about VGA being the default?

That's fine as long you do not have this set if you do not have the screen
feature enabled, otherwise you might pull in big backgrounds and similar stuff
for no reason.

> I don't think so. What applications care about is if portrait or
> landscape is the common default and this is already encoded in HEIGHT
> and WIDTH.

Exactly... and on rotatable displays you need some support from the applications
anyway.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76


