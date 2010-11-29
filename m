Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PN4yp-0003Ac-4t
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Nov 2010 15:45:25 +0100
Received: from [192.168.0.20] (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id 380C81B421
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 15:45:24 +0100 (CET)
Message-ID: <4CF3BC35.7020208@sensortherm.de>
Date: Mon, 29 Nov 2010 15:44:05 +0100
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101027 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CF120CB.9030808@sensortherm.de>
	<20101127213818.GA1180@rhein.zuhause.netz>
In-Reply-To: <20101127213818.GA1180@rhein.zuhause.netz>
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: disko
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
X-List-Received-Date: Mon, 29 Nov 2010 14:45:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Am 27.11.2010 22:38, schrieb Henning Heinold:
> On Sat, Nov 27, 2010 at 04:16:27PM +0100, Klaus Schwarzkopf wrote:
> > Hi,
> >
> > disko needs scons to build, but the recipes depends not to
> > python-scons-native. I changed DEPENDS in disko.inc from
> > - DEPENDS = "sqlite3 libpng jpeg curl alsa-lib freetype libxml2
> > libsigc++-2.0 openssl"
> > + DEPENDS = "python-scons-native sqlite3 libpng jpeg curl alsa-lib
> > freetype libxml2 libsigc++-2.0 openssl"
> >
> > but it doesn't help.
> >
> > Can you help me?
> >
> > Regards,
> >
> > Klaus
>
> Hi Klaus,
>
> hm normaly the scons.bbclass should take care of it, but seems it does 
> not for
> i386/x86_64. Could please try a newer bitbake version and send the 
> install log
> of the python-native-scons
>
> Bye Henning

Hi Henning,

sorry my mistake!

bitbake -v disko-1.6.0
worked but i used
bitbake -v -b disko_1.6.0.bb

Greetings,

Klaus





