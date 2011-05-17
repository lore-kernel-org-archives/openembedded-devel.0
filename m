Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QMDyW-0003If-Pg for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 08:41:48 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QMDvi-0005fJ-Gb for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 08:38:54 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2011 08:38:54 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2011 08:38:54 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 17 May 2011 08:38:42 +0200
Message-ID: <iqt55i$59d$1@dough.gmane.org>
References: <1305545218.3424.29.camel@rex>	<BANLkTimSNvdsc1BoCk4ofNh4-nFuO5bg2A@mail.gmail.com>	<1305564582.2429.90.camel@phil-desktop>
	<BANLkTimtfuCEo253ye-96xeo1dsvJgRFBw@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <BANLkTimtfuCEo253ye-96xeo1dsvJgRFBw@mail.gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: OpenEmbedded Core - Ready for extended users
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
X-List-Received-Date: Tue, 17 May 2011 06:41:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 17-05-11 08:23, Anders Darander wrote:
> On Mon, May 16, 2011 at 18:49, Phil Blundell <philb@gnu.org> wrote:
>> On Mon, 2011-05-16 at 14:52 +0200, Frans Meulenbroeks wrote:
>>> I think the community could benefit if you add info (a pointer) in this
>>> thread
>>> - how to set up a build environment
>>> - policies on what goes into oe-core and meta-oe and what not (and how to
>>> deal with things that do not go into it)
> 
> Yes, this is definitely needed. Which type of new
> applications/libraries can get into meta-oe, and which are supposed to
> be kept in higher layers...
> 
> In what cases can additional versions of the recipe in oe-core be
> added? E.g. dbus is built using 'EXTRA_OECONF = "--with-x"', which at
> least on head-less systems seems to be overkill.

Dbus is a really good example where the above knee-jerk reaction is
misplaced :) The --with-x only turns on building dbus-launch, which is x
specific, but that's the only bit that is. All the other dbus
subpackages lack X dependencies.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN0hfyMkyGM64RGpERAmkdAJ96oZbdWIr0vN9+ys7FNBGoH2HtaACfVyTl
/5bZEgjnUvyLTFB9apyiFQc=
=XEmW
-----END PGP SIGNATURE-----



