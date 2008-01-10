Received: from [72.14.220.152] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JD0Wu-00076k-BQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2008 17:45:20 +0100
Received: by fg-out-1718.google.com with SMTP id 22so670678fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2008 08:45:13 -0800 (PST)
Received: by 10.86.99.9 with SMTP id w9mr1978831fgb.58.1199983513874;
	Thu, 10 Jan 2008 08:45:13 -0800 (PST)
Received: from paul.bn.lan ( [194.79.8.34])
	by mx.google.com with ESMTPS id p9sm2968696fkb.7.2008.01.10.08.45.12
	(version=SSLv3 cipher=OTHER); Thu, 10 Jan 2008 08:45:12 -0800 (PST)
Date: Thu, 10 Jan 2008 18:51:02 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <6810017939.20080110185102@gmail.com>
To: Florian Boor <florian.boor@kernelconcepts.de>
In-Reply-To: <47860F56.7050205@kernelconcepts.de>
References: <1824361960.20080106235611@gmail.com>
	<47825896.7030301@kernelconcepts.de>
	<1133928457.20080108163429@gmail.com>
	<1199810941.6053.50.camel@localhost.localdomain>
	<456018236.20080110111917@gmail.com>
	<4785F7D7.7030506@kernelconcepts.de>
	<4786102C.7040703@adtelecom.es>
	<47860F56.7050205@kernelconcepts.de>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org
Subject: Re: [Angstrom-devel] [RFC] Smallscreen mod for GtkFileChooser
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
X-List-Received-Date: Thu, 10 Jan 2008 16:45:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Florian,

Thursday, January 10, 2008, 2:28:06 PM, you wrote:

> Hi,

> Joaquim Duran schrieb:
>> Is it possible only apply the patch if GUI_MACHINE_CLASS = "smallscreen"
>> is set?

   Note that the patch is helpful for "bigscreen" devices in OE too
;-).

> in theory yes, but that makes your GTK package specific for each device.

  Yes, and that's bad. But we don't *have to* apply it selectively. As
I tried to describe it in blog, and elaborated in the other mail, I
deliberately made as little as possible appearance and behavior
changes to the dialog. If you'll run it on large screen, the only
change you will notice is that it has a smaller gaps and margins. It
is fully usable otherwise.

  Maybe even that could be elaborated, but note that we apply many
"worse" patches to gtk+ in OE already. Consider disable-tooltips.patch.
It cuts off tooltips unconditionally. Run with mouse? Sorry. Not that
current Angstrom's xserver-kdrive setup allows to run with mouse at
all... etc, etc. No worries, all those issues are on my todo list. And
the sooner we finish with the current issue, the sooner I'll be able
to get to them.

> It
> would be better if the screen size is checked at runtime.

  So, that's what my patch does.

> Ideally GTK would do
> this once and adjust spacing definitions that can be used by GTK implementation
> and applications.

  And here where caveat comes - think about screen rotation. Think
about changing resolutions. Think about these actions happening while
dialog is on screen...

> libgpewidget does it in this way too.

> Greetings

> Florian




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



