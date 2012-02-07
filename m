Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RundB-0008Kc-BJ for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 17:10:57 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RunVQ-000647-M7 for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 17:02:56 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 17:02:56 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 17:02:56 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 07 Feb 2012 17:02:42 +0100
Message-ID: <jgrhv4$v69$1@dough.gmane.org>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKpi+WWUuf7iP8QgJK2vgmM3KAgS0Fkhbu3eEy80L2eszA@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
In-Reply-To: <CAP9ODKpi+WWUuf7iP8QgJK2vgmM3KAgS0Fkhbu3eEy80L2eszA@mail.gmail.com>
X-Enigmail-Version: 1.3.5
Subject: Re: [meta-oe][RFC 00/27] systemd / initmanager rework
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
X-List-Received-Date: Tue, 07 Feb 2012 16:10:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 07-02-12 16:55, Otavio Salvador schreef:
> On Tue, Feb 7, 2012 at 13:12, Andreas Müller 
> <schnitzeltony@googlemail.com>wrote:
> 
>> * These are my first python experiences - suggestions welcome. * In
>> local.conf (or in distro) the configuration variable INIT_MANAGER 
>> selects the initmanager to be build into an image. When changing the
>> selection, a build from scratch is required. INIT_MANAGER currently
>> defaults to systemd (see image.bbclass and initmanager.bbclass) * In
>> systemd.bbclass debug messages were left in to have a better overview 
>> what's going on. * An additional patch series goes out for
>> meta-angstrom. * This is a huge RFC which might cause serious impacts.
>> What I have already detected after a build from scatch is that
>> /var/lib/opkg is missing in the image (although it can be found in
>> libopkg.ipk). I will spend the next days with my new friend
>> buildhistory (thanks for this!!).
>> 
> 
> I've looked at your changes and they does seem to be a good base for 
> further work:
> 
> * The init system ought to be a DISTRO_FEATURE (as sysvinit ought to be
> too IMO) * I'd use rootfs generation to install ${PN}-${INIT_SYSTEM}
> packages for packages being installed

Those are really good suggestions!

> * I'd like to see sysvinit packages splitted onto ${PN}-sysvinit as well

This would require extra logic to install -sysvinit if -systemd is missing.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk8xSx8ACgkQMkyGM64RGpGsZwCeN/ZmCXRJ1frrajkUyuYTaZjV
R9MAniJVOkSvJKdriTWW+K4oJdGZOyZ0
=jPg1
-----END PGP SIGNATURE-----



