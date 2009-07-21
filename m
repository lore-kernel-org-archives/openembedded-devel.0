Received: from [81.228.11.159] (helo=pne-smtpout2-sn1.fre.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1MTMNM-0006Dp-7s
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Jul 2009 22:55:52 +0200
Received: from [10.175.196.247] (213.66.88.59) by
	pne-smtpout2-sn1.fre.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A2D61FD00391810 for openembedded-devel@lists.openembedded.org;
	Tue, 21 Jul 2009 22:41:46 +0200
Message-ID: <4A6627C9.9090801@atmel.com>
Date: Tue, 21 Jul 2009 22:40:41 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <f96d234e0907210900t23a05722v7b37c78b0ea3ceed@mail.gmail.com>
In-Reply-To: <f96d234e0907210900t23a05722v7b37c78b0ea3ceed@mail.gmail.com>
Subject: Re: OE weekly changelog 2009-07-13 to 2009-07-20 - Bluetooth still not working
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
X-List-Received-Date: Tue, 21 Jul 2009 20:55:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Cliff Brake skrev:
> OE weekly changelog 2009-07-13 to 2009-07-20
>
> Dmitry Eremin-Solenikov (5):
>   bluez4: make bluez4-dev rprovide bluez-libs-dev to fix SDK building
>
> Graeme Gregory (10):
>   Revert "bluez3: blacklist for angstrom, bluez4 should be used instead"
>   angstrom-2008.1.conf : add bluez3 blacklist
>
> Koen Kooi (31):
>   bluez3: blacklist for angstrom, bluez4 should be used instead
>   bluez4: provide bluez-utils-dbus as well
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>   
Seems Bluetooth support still is not healthy.
Building Angstrom gpe-image for sam9263:

++++++++++++++++
ulf@grond:~/projects/OE_atmel/build> bitbake gpe-image
/home/ulf/projects/OE_atmel/bitbake/lib/bb/COW.py:29:
DeprecationWarning: the sets module is deprecated
  import types, sets
NOTE: Handling BitBake files: / (4928/6992) [70 %]NOTE: Angstrom DOES
NOT support bluez-utils because bluez3 has been replace by bluez4
NOTE: Angstrom DOES NOT support bluez-utils because bluez3 has been
replace by bluez4
NOTE: Handling BitBake files: \ (4932/6992) [70 %]NOTE: Angstrom DOES
NOT support bluez-libs because bluez3 has been replace by bluez4
NOTE: Handling BitBake files: | (4940/6992) [70 %]NOTE: Angstrom DOES
NOT support bluez-libs because bluez3 has been replace by bluez4
NOTE: Angstrom DOES NOT support bluez-libs because bluez3 has been
replace by bluez4
NOTE: Handling BitBake files: \ (6992/6992) [100 %]
NOTE: Parsing finished. 0 cached, 6699 parsed, 293 skipped, 0 masked.
NOTE: Resolving any missing task queue dependencies
NOTE: Runtime target 'bluez-utils-dbus' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['bluez-utils-dbus',
'bluez-libs-3.36']
ERROR: Required build target 'gpe-image' has no buildable providers.
Missing or unbuildable dependency chain was: ['gpe-image',
'task-gpe-base', 'bluez-utils-dbus', 'bluez-libs-3.36']
-----------------------------

Do we want to disable bluetooth in Angstrom,  until this is fixed,
or is it just gpe-image that has a problem with bluetooth?

Seems is it not that simple to disable Bluetooth.
One would think that removing bluetooth from DISTRO_FEATURES
should be enough, but this is not enough.


-- 
Best Regards
Ulf Samuelsson




