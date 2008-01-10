Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1JCwW4-0001is-Gg
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2008 13:28:12 +0100
Received: from [212.60.202.194] (helo=[192.168.2.163])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>)
	id 1JCwv1-0007p4-Ls; Thu, 10 Jan 2008 13:53:59 +0100
Message-ID: <47860F56.7050205@kernelconcepts.de>
Date: Thu, 10 Jan 2008 13:28:06 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1824361960.20080106235611@gmail.com>	<47825896.7030301@kernelconcepts.de>	<1133928457.20080108163429@gmail.com>	<1199810941.6053.50.camel@localhost.localdomain>	<456018236.20080110111917@gmail.com>	<4785F7D7.7030506@kernelconcepts.de>
	<4786102C.7040703@adtelecom.es>
In-Reply-To: <4786102C.7040703@adtelecom.es>
X-Enigmail-Version: 0.95.0
Cc: angstrom-distro-devel@linuxtogo.org
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
X-List-Received-Date: Thu, 10 Jan 2008 12:28:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Joaquim Duran schrieb:
> Is it possible only apply the patch if GUI_MACHINE_CLASS = "smallscreen"
> is set?

in theory yes, but that makes your GTK package specific for each device. It
would be better if the screen size is checked at runtime. Ideally GTK would do
this once and adjust spacing definitions that can be used by GTK implementation
and applications. libgpewidget does it in this way too.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76


