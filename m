Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Rs8rA-0007Kn-Rf for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jan 2012 09:14:24 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Rs8jU-0000F2-W6 for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jan 2012 09:06:29 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2012 09:06:28 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2012 09:06:28 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 31 Jan 2012 09:06:21 +0100
Message-ID: <jg87do$beo$1@dough.gmane.org>
References: <1327952855-28040-1-git-send-email-tworaz666@gmail.com>
	<jg6sti$vjj$1@dough.gmane.org> <4F26FD7E.5040908@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
In-Reply-To: <4F26FD7E.5040908@gmail.com>
X-Enigmail-Version: 1.3.5
Subject: Re: [meta-oe][PATCH 3/3] pidgin: Add gconf to RDEPENDS for libpurple.
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
X-List-Received-Date: Tue, 31 Jan 2012 08:14:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 30-01-12 21:28, Peter Tworek schreef:
> On 01/30/2012 09:00 PM, Koen Kooi wrote: Op 30-01-12 20:47, Peter Tworek
> schreef:
>>>> Without it postinst script for libpurple fails when gconf is not 
>>>> installed: //var/lib/opkg/info/libpurple.postinst: line 8:
>>>> gconftool-2: command not found
> Why is gconf.bbclass failing to do that?
>> As far as I understand it only adds gconf to DEPENDS. If a package
>> contents are not linked with libgconf-2 (libpurple only needs
>> gconftool-2) gconf won't be pulled in as a runtime dependency.

That means it's a bug in gconf.bbclass and needs to get fixed there.



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk8noPsACgkQMkyGM64RGpFLWACfQzo9Hq4Ok94Sw1cT+NWWLGaL
OooAn3b5psoVBYh6IzGA162CdHkoGEqA
=1Qot
-----END PGP SIGNATURE-----



