Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QRSkk-0005A3-Ee for openembedded-devel@lists.openembedded.org;
	Tue, 31 May 2011 19:29:15 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QRShj-0006dO-05 for openembedded-devel@lists.openembedded.org;
	Tue, 31 May 2011 19:26:07 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2011 19:26:06 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2011 19:26:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 31 May 2011 19:25:52 +0200
Message-ID: <is38b0$k1j$1@dough.gmane.org>
References: <BANLkTi=qZLnR+PJX7yV+=MnD=rkNJAh9Cw@mail.gmail.com>	<is31co$63t$1@dough.gmane.org>
	<BANLkTimE2Y=zrWtyWPKekDeUpcmdfFNENA@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <BANLkTimE2Y=zrWtyWPKekDeUpcmdfFNENA@mail.gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe] udev 171 is broken
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
X-List-Received-Date: Tue, 31 May 2011 17:29:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 31-05-11 18:39, Otavio Salvador wrote:
> On Tue, May 31, 2011 at 15:27, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> Hmm, it works on all the platforms I tested. What kind of failures are
>> you getting? And more importantly, which kernel versions are you using?
> 
> It doesn't load any module on the system. I am using 2.6.37 and it
> does work fine with udev 164 and previous meta-oe one too.

That's expected, the OE modprobe rule move to udev-extra-rules:

http://cgit.openembedded.org/cgit.cgi/meta-openembedded/commit/?id=7aa7dd55db8db6ec350c743ce42eb469395a3208

I was thinking of putting it back in, could you try creating a rule with

ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*",
RUN+="/sbin/modprobe $env{MODALIAS}"

and rebooting?

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN5SSgMkyGM64RGpERAkG5AJ4x3sF4pb0ahPW7zW7uSMHVy788dQCfYc4g
KjXhd+Ih2usYzPLftl6ewBc=
=RUMT
-----END PGP SIGNATURE-----



