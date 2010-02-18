Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Ni6VJ-0002Wv-1D
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Feb 2010 14:33:20 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 083AC11000A8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2010 14:30:36 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 4B8AB1100092
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2010 14:30:34 +0100 (CET)
Received: from rhein.familie-heinold.de (g225074053.adsl.alicedsl.de
	[92.225.74.53]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2010 14:30:34 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 0E0603C0D7; Thu, 18 Feb 2010 14:30:33 +0100 (CET)
Date: Thu, 18 Feb 2010 14:30:33 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100218133032.GA28970@rhein.zuhause.netz>
References: <20100214135613.GF5364@jama> <hlc4jp$cfc$1@ger.gmane.org>
	<1266271477.31865.4.camel@trini-m4400>
	<201002181020.06007.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
In-Reply-To: <201002181020.06007.marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Using bitbake in minimal chroot environment
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
X-List-Received-Date: Thu, 18 Feb 2010 13:33:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 18, 2010 at 10:20:05AM +0100, Marcin Juszkiewicz wrote:
> Dnia poniedzia=C5=82ek, 15 lutego 2010 o 23:04:37 Tom Rini napisa=C5=82=
(a):
>=20
> > What are you (and everyone else saying it's fine) running the VM with=
?
> > I've got people reporting just unusable build times inside VMs on wha=
t
> > should be reasonable hardware.
>=20
> From my tests VM builds are slower on my hardware. But thats due to fac=
t that=20
> VirtualBox or KVM use just one core for VM when natively I can use all=20
> 4 cores. And this makes a difference.
>=20
> Regards,=20
> --=20
> JID:      hrw@jabber.org
> Website:  http://marcin.juszkiewicz.com.pl/
> LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz

On newer kvm you can use:

-smp n
           Simulate an SMP system with n CPUs. On the PC target, up to 25=
5 CPUs are supported. On Sparc32 target, Linux limits the
           number of usable CPUs to 4

Bye Henning


