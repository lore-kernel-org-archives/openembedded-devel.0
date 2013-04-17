Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1USTC8-0008TR-Pe for openembedded-devel@lists.openembedded.org;
	Wed, 17 Apr 2013 16:18:51 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1USSvD-00014b-3j for openembedded-devel@lists.openembedded.org;
	Wed, 17 Apr 2013 16:01:15 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2013 16:01:15 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2013 16:01:15 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 17 Apr 2013 16:01:11 +0200
Message-ID: <kkm9v0$mrc$1@ger.gmane.org>
References: <1366206552-14452-1-git-send-email-schnitzeltony@googlemail.com>
	<1366206552-14452-2-git-send-email-schnitzeltony@googlemail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
In-Reply-To: <1366206552-14452-2-git-send-email-schnitzeltony@googlemail.com>
X-Enigmail-Version: 1.5.1
Subject: Re: [meta-gnome 2/2] libnotify: update to 0.7.5 and drop libnotify3
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
X-List-Received-Date: Wed, 17 Apr 2013 14:18:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 17-04-13 15:49, Andreas Müller schreef:
> removing tests drops dependencies on gtk
> 
> Tested by:
> 
> * building nautilus3 (the only recipe found depending on libnotify3) *
> running xfce-based image and checked notififations

The problem with libnotify was (is?) that it removed some API that GNOME 2.x
depends on and later introduced API that GNOME 3.x depends on, hence the 2
recipes. Do all the GNOME 2.x bits build against this new libnotify? The
error was a build break, so it things build, they are likely to work :)

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFRbqsnMkyGM64RGpERAo5KAJ9ocpDhDbogLX0xU08poPwCRT6zhQCfbIIS
W+EIOPHTJx5UvUsuXNIwRl4=
=tnMk
-----END PGP SIGNATURE-----



