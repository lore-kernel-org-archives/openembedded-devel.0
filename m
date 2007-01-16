Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <Patrick.Ohly@gmx.de>) id 1H6vZk-00062l-AF
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Jan 2007 22:10:36 +0100
Received: (qmail invoked by alias); 16 Jan 2007 21:08:08 -0000
Received: from unknown (EHLO ip6-localhost) [62.134.214.131]
	by mail.gmx.net (mp044) with SMTP; 16 Jan 2007 22:08:08 +0100
X-Authenticated: #489940
Received: from patrick by ip6-localhost with local (Exim 3.36 #1 (Debian))
	id 1H6vNy-0001lT-00; Tue, 16 Jan 2007 21:58:26 +0100
From: Patrick Ohly <Patrick.Ohly@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1168900952.5860.107.camel@localhost.localdomain>
References: <1168887283.14505.24.camel@ip6-localhost>
	<1168900952.5860.107.camel@localhost.localdomain>
Date: Tue, 16 Jan 2007 21:58:26 +0100
Message-Id: <1168981106.3819.28.camel@ip6-localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
Sender: Patrick Ohly <patrick@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: Maemo compatible toolchain
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
X-List-Received-Date: Tue, 16 Jan 2007 21:10:36 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-01-15 at 22:42 +0000, Richard Purdie wrote:
> On Mon, 2007-01-15 at 19:54 +0100, Patrick Ohly wrote:
> > ork on the official image because I want my software to be
> > usable by "normal" users without having to reflash their devices.
> > There's Scratchbox of course, but it currently does not work for me
> > (known incompatibility with 2.6.18 kernel). Is compiling for Maemo
> > with
> > OE something that has been tried before?
> 
> As far as toolchains go, poky has a POKYMODE (eabi5) which roughly
> corresponds to maemo's csl 'EABI' toolchain. I think those versions of
> the csl packages were added into OE by me.

Thanks for the pointer, I might try that next. My previous attempts were
not successful enough to get more than the simplest executables running
on the Nokia 770 (generic distro + nokia770 device + a few preferred
versions => glibc-intermediate fails to compile; angstrom-2007.1 +
nokia770 => almost works, but too recent glibc to run a full
SyncEvolution binary on the 770).

As interesting as playing around with OE is, time is up now and I guess
I will just install a suitable kernel and resurrect my Scratchbox
installation to make some progress with my real issue (DBus (?) timeouts
in certain eds-dbus API calls that SyncEvolution depends on).

-- 
Bye, Patrick Ohly
--  
Patrick.Ohly@gmx.de
http://www.estamos.de/


