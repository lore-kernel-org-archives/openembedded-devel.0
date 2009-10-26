Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1N2Sus-0007By-4e
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Oct 2009 17:59:37 +0100
Received: from [192.168.2.131] by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1N2Sz0-0004Cs-Fl
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Oct 2009 18:03:50 +0100
Message-ID: <4AE5D539.7080005@kernelconcepts.de>
Date: Mon, 26 Oct 2009 17:58:33 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ac9c93b10910250159k36219facpa0c13777d91d068@mail.gmail.com>
In-Reply-To: <ac9c93b10910250159k36219facpa0c13777d91d068@mail.gmail.com>
X-Enigmail-Version: 0.95.7
X-SA-Exim-Connect-IP: 212.60.202.196
X-SA-Exim-Mail-From: florian.boor@kernelconcepts.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: kirkwood, one or multiple machines
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
X-List-Received-Date: Mon, 26 Oct 2009 16:59:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Frans,

Frans Meulenbroeks schrieb:
> Recently I added support for the openrd client board to OE by making a
> new machine.

yep - good job, the OpenRD client is an interesting piece of hardware.

> Then why do we have multiple machines?
> the only things I can think of is:
> - smaller kernel (but more variants does not drag in that much)
> - machine specific patches (but for now these do not exist yet, and a
> clearer way then would be to use the machine specific config macros)
> - tuned defconfigs (which is the only thing that there is now)

These are good reasons to have one machine conf for every machine. Apart from
the fact that it is quite likely that it will cause confusion if you merge
multiple machine configs into one.

> Disadvantage of more machines is that this will grow and grow.
> Guess within a short while we'll see a machine definition for QNAP
> TS219 probably followed by all kind of plug variants like pogoplug,
> toninoplug etc etc.

I do not agree here, a new device configuration file for a new device is
something I can live with pretty well. Even if two devices can live with the
same kernel one config for each makes it much more obvious which ones are
supported in OE and which to look at if you need to change something.
Thanks to include files these configs can be small but I don't see a major
advantage of merging them. Currently this might be possible but you move away
from best results if more specialized Kirkwood devices show up.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
                                        http://www.kernelconcepts.de/en


